Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1652742lfp;
        Thu, 6 Feb 2020 08:31:38 -0800 (PST)
X-Received: by 2002:a5d:6445:: with SMTP id d5mr4587181wrw.244.1581006698774;
        Thu, 06 Feb 2020 08:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581006698; cv=none;
        d=google.com; s=arc-20160816;
        b=jzWGUMyUO0HPVyXFF9qyiFi9cbtz8+kL974Yp+/Iw+VP7dRikR3u2WgDOYQVn36lNM
         92DKfRp9O0mbqWW+rSDldpcsIw3syNTLQ2Qmqsh0z8zZUCd6Llkgsj8glcdYrNrPSUqS
         wzNfeoRGGRtqgAjh6oCivnnr9rHb5HAfLArQd/xOnqAxq93KthLe4LGxLm21pPCADtId
         uay/MDlT7h9fxN+VfCyObrHvkFoRdzFxOJ+OwHL9l0TdML8yHqQe9n8OBUdSiGJJgYyR
         uQSGNb4lIb4YoRAu6bfs7BgdTQ/nJoLIqeYo5V6yA9Flq1Hk3BFWoJjDX8EFhNwV0koT
         H9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=uz0a8qhMX/C05/vZl6ZnvE79aH4UtMPrRGs+Xjy6WE4=;
        b=AM2KKL2suDnFbwdaLTel6W+CH4P8oqTjo+oCUjoo7p3hLdRpaTG9S49PvxLZm2JO1V
         ppmhYtUhXeShFOPvQp1wfNHY5HYGbit5FzlVkqSP3bXKvcEmJFRvWRGbKdZ/hvIjTMBF
         n+CEaofZ1JuPRChgMEIiC1mipwEDJzpj202c1La9feyU4LlK6ouoVVM5NNOR02zC9Gn/
         qL3Ysbzy/BLpaaxhvd6zH/30b4/POUjNqJEhBbrUfZxlLZt15pqMnUZoXsE8FA7nwb0O
         2OFEy4TfqweUdB8zKZL0+ZYz94wvtkaqkHBivslSMpd+E/Ox/xFBG0n++CdroX6XzjPE
         4K3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b="u/LfKvme";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
Return-Path: <ilg@livius.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z10sor2345234wmb.13.2020.02.06.08.31.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2020 08:31:38 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b="u/LfKvme";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=livius-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=uz0a8qhMX/C05/vZl6ZnvE79aH4UtMPrRGs+Xjy6WE4=;
        b=u/LfKvmeLzZ1bLGtV2tEH+o0TcZ0B2DtvPPVL539HnUQdwSHL3cfA7qn57lMp3THsV
         PmV6y9MekDUizIekh7X7xOmTbRc5JcqDncoMOO03fHVB3YT0cthxYz+APHOPyIX8mbCr
         f36NQqhAM3r8l+FQrVmewnucv3a5lICTeENd8NqR/zTvgSMCAPiA7iPM614x7ifBD+kZ
         AJkQttWkAbij2/n5RGGgqKhc+OAhZ9Z0OwYk4JdBwVaCNSgha7PbCSj2FGJt5BsPFrAx
         zb+wmXDDmZ4WTNOlujJZPvNMxmKsc0bS9/xYylfu9w/bYuLpv9mtvkRTEzQl+8jRm3LW
         nXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=uz0a8qhMX/C05/vZl6ZnvE79aH4UtMPrRGs+Xjy6WE4=;
        b=tFRY6g41bGMnkHa5LujbbF2WdU1x0LS0CHC8eLDmVRk1Xo9mPGWZKaaj6iJLfhFRdV
         m+kAhD9FV96W7EvoLmxtjXIjY0Dp87FcZtF0opf1OxM1RvMu1+S1io+6WiszAixWH9Nz
         6LfywJ9I5UKqA1vm/9rl9OzchAfFFlMSgdi1Bxg9jQjJjPY8wWZuLJmM8vX7aQmLm33P
         RaOKU4bTUO0osNyeAUXkoO2IgL3xgbCEDXOGxenc79mE5UpnJx4odCI83ZnEwPEsa1ex
         FrHmwYpKTlMlarConA70aH9EKfwqHYOIlytXdCyflzRMVcpVc3Hg+Q2e83gLxtouQ68N
         te0w==
X-Gm-Message-State: APjAAAUirOU6qe8mq/ImFztnKPWS8bt0SnkqzJi9YGSNs8QvRYm63ckK
	Ckm02til0RBx4OsBD6UQgjsD9wSibW4mhA==
X-Google-Smtp-Source: APXvYqye5G/J6PVuU2aiBJY7vev5SzU2J8SvPKBlkEs6FEbfyscMWSfqDlpkBzQlMmg94YRudnGusw==
X-Received: by 2002:a1c:3b87:: with SMTP id i129mr5354932wma.142.1581006698247;
        Thu, 06 Feb 2020 08:31:38 -0800 (PST)
Return-Path: <ilg@livius.net>
Received: from wks.local ([84.232.200.227])
        by smtp.gmail.com with ESMTPSA id t10sm20025wmi.40.2020.02.06.08.31.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 08:31:37 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Is STM32f429 discovery board fully supported on qemu?
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <87a75v8z9r.fsf@linaro.org>
Date: Thu, 6 Feb 2020 18:31:36 +0200
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mohannad Maklad <msala.work@gmail.com>,
 qemu-discuss@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 qemu-arm <qemu-arm@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A8237DA3-FFFD-490A-8F1F-2B8CA10A4396@livius.net>
References: <CADxp150RUQXjDFjrQcrJCfoWto=ERaGVd=neo9s_2=3XsyS9XA@mail.gmail.com>
 <07187FD3-2C54-4F19-8D2A-386FD3F360AD@livius.net>
 <aa9a6e4e-70bd-2abf-9b75-8200990a1c57@redhat.com> <87a75v8z9r.fsf@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-TUID: 9i5c4Btsr1Ul



> On 6 Feb 2020, at 18:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>=20
>  - there is an active maintainer to look after it

I plan to update xPack QEMU Arm to the latest master, but this will not =
happen in the first half of the year, most realistically by the end of =
it.

As it is now, the limited functionality is enough to run my =C2=B5OS++ =
tests, which do not require any peripherals, the SysTick and a few LEDs =
are enough.


Regards,

Liviu
