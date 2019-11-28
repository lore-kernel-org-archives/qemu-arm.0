Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp7284805lfc;
        Thu, 28 Nov 2019 00:47:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqypwPcMnt54IfC9vSwsvdoV3ILEkwWfWv7KBf9s1iNWavE3zuwqGCXbnxl4VVNEF+U1DOJw
X-Received: by 2002:a05:6402:602:: with SMTP id n2mr37924185edv.23.1574930869366;
        Thu, 28 Nov 2019 00:47:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574930869; cv=none;
        d=google.com; s=arc-20160816;
        b=AbiERzqtqlr+c53+ATLhYN9h+7ts4trk24Ipt001ZQTg9IkR14FpXMUDAp+G7G7NtK
         MvazGE90dmywDBlo09bXXzAqTPBETFQj3Yx/EG5CuemOMAyTbCAYSp21vCJJdFiuDGhc
         b6cdZYQwSTRn6ZQxtO/PwfJFHGIcRsY60zqXzc6Adf/eGNU0jqsRNvhaAPFVS4Y6zXqC
         ALKkPce3/9LFT8Wv97lp7OHg7mJ8ZAOQOYTRGD263wdeFPbeRnxM+7myJiig8zyNkF4b
         fnA2HVObErdLMBwlDespr3DwttNiXiHkQgC4l3LoW7C9JL3TqK4d1/k5bg8ZVGeLExOJ
         3ZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=97t4yCoTmdKniG5TzE8HrhwGTy34qd234obMBipYnSc=;
        b=FgTVqfH6XZQdnUWCJ3ChYinPwmMKCZ8qrFljK/2HSjkh1wEaly42wZNA4oWePLBD8z
         2y6LfyUagtV/Ws7bAk9QbCyiEt3g/kib07ppQoqKPQ+A0xCaYqBR363rvDYxls0nTyyS
         xheLiJZsnxMlbMKyJRbHq+WdKxidLKWfd9HASXcEhVrMzIYt+Eq5PwgfYalKL+Fbz5MY
         5uUKoloz4XjtUBzhw3LeXOoAOxu35jUHxzxhQyGRk3GdEb+UBVeGCNw2oKf1jjDjgURD
         LpfgCpdTD16CDD4GysN47KyQuC6RDAjpqgSdXumn9YCgmvdLlcEyUlSdcp1LEc+mdtrK
         CQSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si11348516ejb.343.2019.11.28.00.47.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2019 00:47:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iaFSm-0004ir-Cy
	for alex.bennee@linaro.org; Thu, 28 Nov 2019 03:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44737)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iaFSa-0004gT-TH
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 03:47:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iaFSZ-0007Bb-P9
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 03:47:36 -0500
Received: from 3.mo2.mail-out.ovh.net ([46.105.58.226]:33673)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iaFSZ-00076t-CP
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 03:47:35 -0500
Received: from player761.ha.ovh.net (unknown [10.108.57.139])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 1D2AC1B63AD
 for <qemu-arm@nongnu.org>; Thu, 28 Nov 2019 09:47:31 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player761.ha.ovh.net (Postfix) with ESMTPSA id B58DDCA740CB;
 Thu, 28 Nov 2019 08:47:26 +0000 (UTC)
Subject: Re: [PATCH 1/4] target/arm: Remove redundant scaling of nexttick
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20191128054527.25450-1-andrew@aj.id.au>
 <20191128054527.25450-2-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0d116fec-b943-a348-b301-76102c1ba097@kaod.org>
Date: Thu, 28 Nov 2019 09:47:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191128054527.25450-2-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9917770804571048768
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeiiedguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeiuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.58.226
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, joel@jms.id.au, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xJyjiP8dJ2mD

On 28/11/2019 06:45, Andrew Jeffery wrote:
> The corner-case codepath was adjusting nexttick such that overflow
> wouldn't occur when timer_mod() scaled the value back up. Remove a use
> of GTIMER_SCALE and avoid unnecessary operations by calling
> timer_mod_ns() directly.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>


> ---
>  target/arm/helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a089fb5a6909..65c4441a3896 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2446,9 +2446,10 @@ static void gt_recalc_timer(ARMCPU *cpu, int tim=
eridx)
>           * timer expires we will reset the timer for any remaining per=
iod.
>           */
>          if (nexttick > INT64_MAX / GTIMER_SCALE) {
> -            nexttick =3D INT64_MAX / GTIMER_SCALE;
> +            timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
> +        } else {
> +            timer_mod(cpu->gt_timer[timeridx], nexttick);
>          }
> -        timer_mod(cpu->gt_timer[timeridx], nexttick);
>          trace_arm_gt_recalc(timeridx, irqstate, nexttick);
>      } else {
>          /* Timer disabled: ISTATUS and timer output always clear */
>=20

