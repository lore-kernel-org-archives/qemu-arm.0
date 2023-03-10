Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2169946ejc;
        Fri, 10 Mar 2023 09:47:52 -0800 (PST)
X-Received: by 2002:a17:902:e851:b0:19a:839f:435 with SMTP id t17-20020a170902e85100b0019a839f0435mr3184538plg.3.1678470472576;
        Fri, 10 Mar 2023 09:47:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678470472; cv=none;
        d=google.com; s=arc-20160816;
        b=I3LBrnCmC+8P1tH7B63o+yRE8UZ67T7gBHCiPmoQqFEvyYcoPZ1dERTBik/Sip8Jtt
         8CpWcevo8H5aWDhIVTZrEMTkvZpjXZmmEelQTOTuRTl8T7bufzC8Sf70jMZBDsxbKa4w
         JtAyIjE06Ifs1OZl6bLTD7Hc9/zC3o+6uBDipPBLR4/kgsPMDzAE43JEy8Hw2IAN7Dxy
         La5Yn8jG5qPleE07p2BNXlsV5zethKn3ijDeYIgBc/HIAdkt4liqj19kTbyh/iEKLcpD
         ZL1r9dy1pn8t7OntjT/vr7TYAOT2fQQqoD7J67Et5P+H/hd7amLX1AtJVFrkxnG3WITO
         HpSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mHuLcW6CZXp2/G/8uZuBsbRnSfvMp9s/ev/CpMxHZxQ=;
        b=DEb1JeLA0rn80FPuawglneXXN3Arfk2ikXasFJMvyuPU3/xfcJiRJ3f9kQEGw0PePZ
         G6/9WthgrAq3KSSj8kp5nCqd4upy010HhQOxJwS9SXzWPrwG2uQZPX9KOdWA8KuDkpVj
         crPm+yz3FnafbF/GjZfxkX3Aux0kQD+JqH+ha6wLfvlLZS3SO0wK5Q0XL3HjZ36n6MgJ
         rYSiQ4/TdBI+xJVP1Q2p6qOQYZhs5wJNAkreDOyEV7JQO/P2Tl0Cg6lMy5A28YWQXGXd
         wnGPVAW2gDuDPMrhODS9J9x7LjRjekNnZf1VFyAgJGOJ1vE8hFOg5f+ZseM+Bl42Een1
         P61A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NQ5d4Eo7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q5-20020a170902b10500b0019ea6406ddcsor266207plr.202.2023.03.10.09.47.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Mar 2023 09:47:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NQ5d4Eo7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678470472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHuLcW6CZXp2/G/8uZuBsbRnSfvMp9s/ev/CpMxHZxQ=;
        b=NQ5d4Eo76GkedUQMuZrll6ChJUhe8z6xVM7d/HFQV4PBgtu0aEL0jQNRgwFAsCehQy
         dKG5jtmzZcM3biU7DuCchIyeHoeGTwn70YpqUul5FPIN8yzucR/y1mKVLzbqortIr2dj
         MnGosMM0DlkrBqxKPO47RWFUq8IdFLWnFjJJrMwuffVM9kLXb2a2ARC5ychDq2FP+int
         izqOBEwJywho2ryHbhqf9QCOCLAbQZYZ9bxCCQ2KWltGsCOrJFhtBBc+H4D+8qGK1kC7
         260PzE1ds/SXHKVeABIxeuc5eoDb9MA+O45AsfT6LkrMB6WFwBJy5L00MPvTLcYxze/k
         v5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678470472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHuLcW6CZXp2/G/8uZuBsbRnSfvMp9s/ev/CpMxHZxQ=;
        b=EpCuvOjEoSpOX6HFFoLPypZB0GZOQymGxhuYes+rYnnnBJgkbY+r2TVOEpgRfbRHOt
         ga/7OX2cCXdUKdPnCM+v5GcCqTz+icsDa30+xiaxuTYEK3vVpKBMjtgm6nvSchXkEYJH
         TFOeqVTo14ARR07pWb3WJ7vYuceFbokLqWYIssgI2tGYmuZGx4IKEte7NqvdoZusaVUr
         pziqScA2WMYxYkDQwUY46U4YAPgIkHsKBQojc7x1bCBiLLI5Iqscc7MjuTrKGmv6OMmz
         iMP5Xp2ok18cCh1cM+XNj19G2NvC0n0ZZY8ESH6/bedMksbeq3+MjhAiCm52mI7ai+Rk
         09Ew==
X-Gm-Message-State: AO0yUKUhs/5dkSVXoPk+YaLk6LuVsRiFm7mTzjMfR9RSqMtET6VVn2Nl
	w/bA+Kv1hpgFIDdr/cUVtFuDgPi/8qxzvOSddZ1ySA044SmQJvR+upY=
X-Google-Smtp-Source: AK7set/jslrXIKNTCbdQtVQtE4rxyAgOIAwvvA+PjcLOJG5yCaazrNa84XoIom/22PAtpr2keNE1KSAh/rey1vcmaK0=
X-Received: by 2002:a17:903:1243:b0:19a:b151:eb83 with SMTP id
 u3-20020a170903124300b0019ab151eb83mr9865747plh.13.1678470472141; Fri, 10 Mar
 2023 09:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org> <20230310103123.2118519-10-alex.bennee@linaro.org>
In-Reply-To: <20230310103123.2118519-10-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 17:47:41 +0000
Message-ID: <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: krP2XPHu9Q9F

On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> You need a very new gdb to be able to run with pauth support otherwise
> your likely to hit asserts and aborts. Disable pauth for now until we
> can properly probe support in gdb.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

If it makes gdb fall over, then shouldn't we be disabling
the pauth gdbstub stuff entirely ? Otherwise even if our
tests are fine our users will not be...

-- PMM
