Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp410680ejc;
        Wed, 18 Jan 2023 03:19:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXueCWMnNBgjfT5WYFJIc0isF1Al7XTffLDDsl88HaNEZRhSZmj/uS+ntnWeG/rfgGYtmJjL
X-Received: by 2002:a05:6214:3c07:b0:535:3611:ea9 with SMTP id nt7-20020a0562143c0700b0053536110ea9mr6911858qvb.20.1674040790335;
        Wed, 18 Jan 2023 03:19:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674040790; cv=none;
        d=google.com; s=arc-20160816;
        b=b5jLTE2M74qcHGAaTuawHElRs4I6nikj2BgNmbimO6eDMpZaymKzcNkh5Opr/Q0lZ9
         LorDl+NYp7eTL2GuA4zvLvhI4q/OJuxdlIzJXC5c1ERkyUGlLVfyfBGOFY39HyUHQa8T
         6DvqDmALl/BeSnu6kjOsRfDb20HopjifPyz4waoyzFnEEWxV7E68oZD3KXWVP9CDnqt7
         kIT5WDHUXwRjjoY5gg06JAnCJxCrbK7k6yuM4KZ+eRmLka85gz7kpN2rrAehr7qR4Qw2
         QIXgSgvOZ6yA3n+dj2T0Y1pVk02hGb57LroiDHj/lYuMHtSBaXL2FXUuO6ORElVx6LsB
         iXzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=fRkC/0Cj2kfhuZiOHcEapM3RPYUjSRfx6mOYXSWVLx8=;
        b=gNCPX1Lx6w6Il7+gAoVdSD99wBw+/QbW1xEp6pXZP53U7TaqKWzERSJnXZnT1Icbbi
         bv/oNtvf/s9Yd0rJIK+k4PBYc+GudD70/APEhYnlxHnXrtAMPKk+SFIaATahwB565V55
         UG7b88sU0YU1c18UmnMZc4tqO/Gmp86hqs2eMuBH/fQAuXRf1f2gm49liWDgmv4ny9gi
         oWdgkkj712btIEl4rw61fKPiUPg8lQStAesoiOpshw3izxpT3GWaz4Yajt6pfTDXabo1
         ixyB2IwlKln7aK7oY9PmoB61J+l08+IAu00v1KCXGbhD5tGbyCg6I+/r/j0GFFhxwnsz
         +O4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=fc5RTGPE;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.57.155.22 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from qs51p00im-qukt01080501.me.com (qs51p00im-qukt01080501.me.com. [17.57.155.22])
        by mx.google.com with ESMTPS id r21-20020a056214125500b004c69966cd28si21938406qvv.523.2023.01.18.03.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 03:19:50 -0800 (PST)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.57.155.22 as permitted sender) client-ip=17.57.155.22;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=fc5RTGPE;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.57.155.22 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1674040789; bh=fRkC/0Cj2kfhuZiOHcEapM3RPYUjSRfx6mOYXSWVLx8=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=fc5RTGPEpVehvGP5VX0xaXI04bSQZW3nENj9/Dpk+ND+fPPJCRcww2rnDpa6jN2w+
	 dZUilszmuxyPA8YSL+BR9FSDuH3L7GGtgB1GE0T3wz7vbVK2RdeZmx1tGu1mJK0EUm
	 2WI5kgNOINmr6Xdv18fdZ/dT0SzRl0uAcheRJAVhzn44+XLFkZ1UcjBQ5U6EjG4vkj
	 fMJH5a6c81SZt7YklYCWNsA2c0Aofd9UtUQN8tPzm8T6HcR4mPLhgcl7HKhlb0e+bn
	 HIqithR8GUdtWIJ9O5cBZqNBX+Lx8BYIXvaS43O2M1Pg7jp+lX9Gq52VdYRysjvksX
	 01VzGPZrkjr9g==
Received: from smtpclient.apple (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01080501.me.com (Postfix) with ESMTPSA id 049E819809BD;
	Wed, 18 Jan 2023 11:19:47 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH v3 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20230114161302.94595-3-fcagnin@quarkslab.com>
Date: Wed, 18 Jan 2023 12:19:36 +0100
Cc: qemu-devel@nongnu.org,
 dirty@apple.com,
 peter.maydell@linaro.org,
 qemu-arm@nongnu.org,
 agraf@csgraf.de,
 pbonzini@redhat.com,
 alex.bennee@linaro.org,
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B722E51-E635-4196-8978-E0393F9EEFA1@ynddal.dk>
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-3-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Proofpoint-ORIG-GUID: iexFohMw8sDjWxjBW_74pYdQEFpqc44e
X-Proofpoint-GUID: iexFohMw8sDjWxjBW_74pYdQEFpqc44e
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.790,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-12=5F02:2020-02-14=5F02,2022-01-12=5F02,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 clxscore=1030 suspectscore=0 adultscore=0 mlxlogscore=430
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2301180098
X-TUID: Nvs5jXqW5qQG


> On 14 Jan 2023, at 17.13, francesco.cagnin@gmail.com wrote:
>=20
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>=20
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
>=20
> Guests can be debugged through the gdbstub.
>=20
> While guest debugging is enabled, the guest can still read and write =
the
> DBG*_EL1 registers but they don't have any effect.
>=20
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
> accel/hvf/hvf-accel-ops.c | 123 ++++++++
> accel/hvf/hvf-all.c       |  24 ++
> cpu.c                     |   3 +
> include/sysemu/hvf.h      |  29 ++
> include/sysemu/hvf_int.h  |   1 +
> target/arm/hvf/hvf.c      | 631 +++++++++++++++++++++++++++++++++++++-
> 6 files changed, 809 insertions(+), 2 deletions(-)
>=20

It seems v3 has a regression in regards to BRK instructions that I =
cannot
reproduce with v2. If I start QEMU and GDB with the Linux kernel =
(v6.0-rc5),
and set a software breakpoint at `bio_split` (probably not specific to =
this
function), I see messages in stdout like this:

[    4.663981] Unexpected kernel BRK exception at EL1
[    4.664650] Internal error: BRK handler: f2000000 [#1] PREEMPT SMP
...

Maybe the software breakpoints aren't removed/reapplied correctly in v3?

=E2=80=94
Mads Ynddal
