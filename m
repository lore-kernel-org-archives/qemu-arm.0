Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp75805ocb;
        Tue, 4 Oct 2022 03:37:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ImRxrNb9t+3hvH+7G6GtcrYjuayW3Sxfd2dLC+uWydXVpGcQrJLU6pEJDjUFCR1Ep/+GH
X-Received: by 2002:a17:906:4fd1:b0:787:434f:d755 with SMTP id i17-20020a1709064fd100b00787434fd755mr18377536ejw.356.1664879852653;
        Tue, 04 Oct 2022 03:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664879852; cv=none;
        d=google.com; s=arc-20160816;
        b=A7yD5JK/bqrYzbmGsmLsTW/7GIFe5CT9+5IGf408fEk+po0DfLc8OltXNC8sOqf+un
         pIJrJrPHm6hH5cyLLiojPCOGaSmUCRc023SVpQ3RJ/j7CKHwsfdGHEs9vRjzorWi8EfJ
         NnjwKhsVibQWP7p9LuDr+0vCGXlT9tVkFNt/GWQmq5xHq4eU/5YoU0XQEUOd6MdAR+4s
         L7huDKm4+ocx/wmmRAXkzj9l5b+BNH86bPQEBiimG3TmNoySPwqGVwxIWyzys2/P6duZ
         fDLf2nkNLLhW+kDIMeVQumNFkZKU5lnLpKEDATgGnZoAopY2oVvXZJ6hHNomTOhfn+KZ
         ykgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=QlSvwC0FZZH5RpxI3IuBMhXIoFMoTqI4zfjc2S1+OV0=;
        b=dr2e2B0PWLcAu5BLkrwDrOX6F3aQ3H2ZRMzchh9SM9EZTNNfIwuYtZemFaxY8p6Kiy
         GJ9trjLsVKns1xmbN3XO4wsVn5t/nq/p0s5DWuuk2cGetEc9kRisJlv2PypGyNI7nNWC
         dUgtKXLDU67g3w/DUjPiv8LTbTM6o5map/D2NFrqU3MqvSMKEIlQrgCUFXNe7PlhpgHi
         Oqh4/RuS0BzcBZ+VFxhdvlG80QfsRd8FYlu+9A8Nb3rzl3vcovftkYpqpO0dUEwldFN/
         CQshzOId/3hUZGw2lNRA4Vc4/bd0qO9UvFKKEhZZfPN8K9X8dyXWr2U8B9b8D/lWDRip
         gv+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=D1V9Yggm;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.6.56 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from pv50p00im-ztdg10021801.me.com (pv50p00im-ztdg10021801.me.com. [17.58.6.56])
        by mx.google.com with ESMTPS id hw9-20020a170907a0c900b0078200f94d06si1903549ejc.237.2022.10.04.03.37.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 03:37:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.58.6.56 as permitted sender) client-ip=17.58.6.56;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=D1V9Yggm;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.6.56 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1664879851; bh=QlSvwC0FZZH5RpxI3IuBMhXIoFMoTqI4zfjc2S1+OV0=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=D1V9Yggm9nh8f1zUmW5Wywq3JAnJ8ONUdGQxndkyTGLn9QxAxSrPWWdugXjlK2l8B
	 90HAiVl18V0JLftlgnLZd8qF9OYGhEDORi3F+5qFEB9tlqqYbS3m2mbB4Sl+KaOkLr
	 RgSjQCB4be+knpIQEEUwSGpUpvy3no8h8p0cOOsTyOYcUwqtYZfb1/lO6/yADaBzRF
	 TTET6sU2X5MABE1ytTHo2YsOh3gFWl9aWQnJnra15FjDjTthZjv6DXzjIR9eYizRZw
	 7Xt3L00aPTPBHkupyKRhGKc/Fyy0q2PF7IwKglq+4m1NT9/k/iIQ1kB8lWflRmvMAP
	 ccUpqzyi5gD1Q==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021801.me.com (Postfix) with ESMTPSA id 26CA01609A3;
	Tue,  4 Oct 2022 10:37:27 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH  v3 13/15] gdbstub: move breakpoint logic to accel ops
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20220927141504.3886314-14-alex.bennee@linaro.org>
Date: Tue, 4 Oct 2022 12:25:32 +0200
Cc: qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <340E64CE-3798-4671-9C51-510E28216E1E@ynddal.dk>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-14-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Proofpoint-GUID: sexTsaKf4iJ8y5gI7xPpZWij0kVGfh8k
X-Proofpoint-ORIG-GUID: sexTsaKf4iJ8y5gI7xPpZWij0kVGfh8k
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=964 bulkscore=0
 clxscore=1030 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040068
X-TUID: IGqDgk1lCS2H


> As HW virtualization requires specific support to handle breakpoints
> lets push out special casing out of the core gdbstub code and into
> AccelOpsClass. This will make it easier to add other accelerator
> support and reduces some of the stub shenanigans.
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
> ---
> accel/kvm/kvm-cpus.h       |   3 +
> gdbstub/internals.h        |  16 +++++
> include/sysemu/accel-ops.h |   6 ++
> include/sysemu/cpus.h      |   3 +
> include/sysemu/kvm.h       |   5 --
> accel/kvm/kvm-accel-ops.c  |   8 +++
> accel/kvm/kvm-all.c        |  24 +------
> accel/stubs/kvm-stub.c     |  16 -----
> accel/tcg/tcg-accel-ops.c  |  92 +++++++++++++++++++++++++++
> gdbstub/gdbstub.c          | 127 +++----------------------------------
> gdbstub/softmmu.c          |  42 ++++++++++++
> gdbstub/user.c             |  62 ++++++++++++++++++
> softmmu/cpus.c             |   7 ++
> gdbstub/meson.build        |   8 +++
> 14 files changed, 259 insertions(+), 160 deletions(-)

Reviewed-by: Mads Ynddal <mads@ynddal.dk>=
