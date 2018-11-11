Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2107269wrw;
        Sun, 11 Nov 2018 06:47:41 -0800 (PST)
X-Received: by 2002:aca:c752:: with SMTP id x79-v6mr8705039oif.139.1541947661806;
        Sun, 11 Nov 2018 06:47:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541947661; cv=none;
        d=google.com; s=arc-20160816;
        b=f0FHWCBFrT4Gp4xPMMVnZj/kVyIL6ZZps7aP5FEO2GEbxVlYr99vvn1NK2ISFcP9c4
         Xl6JdTtuCMYHxdrOKPzfarcyl2bwyLNzofbgPffwEGzgfO/uylSWviH1UA59npp3rGHo
         rihE5Y/p4+NRxLNM86RUo2PtfzoPQwcCTyJM+SicbIeDIIx9U50ZK7nKy0I1QocNv0Mb
         3eRzjFtGJuZeYvOTsZf2JSb61X0b5wfI0MzdENgGlLmYy4SB462ZsRCfYr3gD6lxbAgN
         FibrfsxhU045YaT1ewA8lfBw8cLfysCtMB45VzPeP/AxXUb5yXCixOhQ593BpWEMFhEE
         Y5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=ob4k/Tayy0dSO0hnW2xSnONtF1NUnABM3DzGUw9d/30=;
        b=KdNcTBWMtx3+hxdZzFOEKVSKKwiGHTF+6R6fZBrgaMmAIUtv8uF2T7LHIEEWLVmQk9
         xdYnzCBy3CaRgtfJpU+W5d7fyX54Ve0diYL+0C8JwlQ/JLIP3NdD4dz0Ll//hoLBxRPn
         UzFGRi+N+Cm5Om/QtLiz84JavAMFNbL9iOrTEbVeb+VbIEZb/jDlkSNMmToNnJono6R8
         XGxZjPpxatxiImNjAgb1mq+B4m/tNj0EEdOg9CFkAt0bAAw8+EijAy5e9/bhiWjlYCkb
         AAXo+xqnv8xmvbuYPSVcQwaCzsmnNYTVvN1BXsSmfGAZpEoJTgJr5KFSCD5ZOehXPNf4
         y5Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ikr446mu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i17sor7917914ota.181.2018.11.11.06.47.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 11 Nov 2018 06:47:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ikr446mu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ob4k/Tayy0dSO0hnW2xSnONtF1NUnABM3DzGUw9d/30=;
        b=ikr446mu4m9saC4zNimiDURGbPhz/gpYQEqOITxy4NfUd2I+iVKofVy8PBkiAEhm/5
         CTot2AqqWc/aTBo9y6qVIuARA4IBITCy3ylAGHzB251XcbM4T4cDkla5+nL2Mg0tiSEP
         jupFZqkuSM1gQjW+lKefZ+zYbeXukNM1OZkyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ob4k/Tayy0dSO0hnW2xSnONtF1NUnABM3DzGUw9d/30=;
        b=qLQqwhFpAsZ1rFHtAorcbMNX8HHrUjAPdZVkYbPpz95H6MPFl5pbsmjDjXriqxYEOe
         YUTxB3CiHqa9QCrhbPYdsw2GLPXu2FWhLR7eyFGvA2qyWm5g70n2gewVubUySOLLrJNa
         DVMd6gQda2OWkF/ENzjie4ORh5k3XSKBS1dvMxdKB4y0GkVWUrpXJwpitnybVHZGi1JZ
         gK8K9tQaXbuLjVjbR7rNa6SmYWwfVdswGxdy45TjEvya26g4HtuKqGEnHji7DfGow97M
         Wm378iD1jO3nnmoNwKiJMEIywcwvSNbgrColV+HRWIKvXXF0OuvoYChetRYsDlyEAvgB
         QyVA==
X-Gm-Message-State: AGRZ1gLAT6mVrq6XZlU9qzW0BuDKSabnZ9A2Lz6vwF+mZ9//BF8YNTWT
	/KJNAuFjXuytE9RSrw76khC0OEq+F5obeKO3qwUbOhaasQs=
X-Google-Smtp-Source: AJdET5e0yH+5lGvx7me+mvJPYChcmJI3uFe6fA7RcfO5WZ0tzt7ad1emRfODJXJKcVqh5wvdoRWW6v91i6Ikt+lszU4=
X-Received: by 2002:a9d:156d:: with SMTP id z42mr10197685otz.201.1541947661243;
 Sun, 11 Nov 2018 06:47:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Sun, 11 Nov 2018 06:47:20
 -0800 (PST)
In-Reply-To: <20181109152119.9242-8-alex.bennee@linaro.org>
References: <20181109152119.9242-1-alex.bennee@linaro.org> <20181109152119.9242-8-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Nov 2018 14:47:20 +0000
Message-ID: <CAFEAcA-iOLcP50jbKLJwpwL333hbQi1t0ig6zp8SNNLsJL8=vw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] arm: fix aa64_generate_debug_exceptions to work
 with EL2
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 7YWhKT5aC2La

On 9 November 2018 at 15:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> The test was incomplete and incorrectly caused debug exceptions to be
> generated when returning to EL2 after a failed attempt to single-step
> an EL1 instruction. Fix this while cleaning up the function a little.

> @@ -2833,9 +2845,6 @@ static inline bool aa32_generate_debug_exceptions(C=
PUARMState *env)
>   * since the pseudocode has it at all callsites except for the one in
>   * CheckSoftwareStep(), where it is elided because both branches would
>   * always return the same value.
> - *
> - * Parts of the pseudocode relating to EL2 and EL3 are omitted because w=
e
> - * don't yet implement those exception levels or their associated trap b=
its.
>   */

In hindsight I regret not standardizing on a greppable tag for
marking these kinds of "we don't do X because we don't implement
feature Y" comments...

thanks
-- PMM
