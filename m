Received: by 10.25.159.19 with SMTP id i19csp553859lfe;
        Sat, 6 Feb 2016 10:24:35 -0800 (PST)
X-Received: by 10.140.252.197 with SMTP id x188mr25831870qhc.81.1454783075500;
        Sat, 06 Feb 2016 10:24:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b36si22283343qga.28.2016.02.06.10.24.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 10:24:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS7X8-0001tT-Lu
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 13:24:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS7X5-0001pt-Mf
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 13:24:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS7X4-0007yR-PB
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 13:24:31 -0500
Received: from mail-lb0-x243.google.com ([2a00:1450:4010:c04::243]:35704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aS7X4-0007yK-Ge; Sat, 06 Feb 2016 13:24:30 -0500
Received: by mail-lb0-x243.google.com with SMTP id dx9so3423757lbc.2;
	Sat, 06 Feb 2016 10:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=5pbRMdRyYVfdjyliAysPNWswvo/JpzM294yJGSmIYxo=;
	b=Vxdxjyp01sKuHjIS82Xap1D0+DEctyl891wk33wUg2xrCSh6t3QPfHPFRBySHP0eBj
	qeAlM7IELEVsTcn6eNpw0KZgn890DiaN//oDU6cHDOvx0lcdqHios/Cs5POfBA+hUXDy
	APw1/dCTyAcz7WtttG7eZwmZZoMiDRi3ZqrGrg4E9OOvb8m8oWdYsSALusWkEH2t1Tn7
	CKbIql9U69dWiVjkbFB+jAT/2Ez80PYykWX1UPLGqVbueoj0JUHbFIPSbe5scZ7HHige
	mjuDzZ8RpUizOLauKl6CUwOKycRbgtMa07j0aZSs9NXMbJZNEBAHddbhoOrudop+Ctzi
	Li1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:to:references:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=5pbRMdRyYVfdjyliAysPNWswvo/JpzM294yJGSmIYxo=;
	b=W+mPDIEWhqmr8RRIsWOfoIg3bqX57WeEOQdZwzkTrrqtsdUaDUU9wfNwy84uIbu7PG
	lih4hPGbg0C/R3UFQsay8auojBOH5eriVtdJWKRioNVasMhnST6BlowV1ItcraGPh5ow
	b8MhYfWuKos+PX15B0hUCvKrXpnCaHCiHH8AstAAF+VglUpjQzEk9zyheMJeYBEkgjMI
	u99iDZBK2D8cpNIQA6lJPvWd0eVm2GdxTYfSWDqpkHmAYFbEeF4t4GQTn/0O7bTkrVBl
	2ow4nqE7AZzeGaa+NX+fjBf/S0ooBkUcbuus8Te6f3IUCL59C+YiZa7nLkQ+dhgTYRU0
	wxQQ==
X-Gm-Message-State: AG10YOTANcdTiv0TY+PcfJ7H/NZ2vDMWQBjObnndtawbQN9Hm0XwgApuRH87E6nTo0IygQ==
X-Received: by 10.112.162.168 with SMTP id yb8mr8048066lbb.36.1454783069844;
	Sat, 06 Feb 2016 10:24:29 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	l8sm2992145lfe.24.2016.02.06.10.24.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Feb 2016 10:24:28 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454683067-16001-1-git-send-email-peter.maydell@linaro.org>
	<1454683067-16001-3-git-send-email-peter.maydell@linaro.org>
Message-ID: <56B63A5B.6020400@gmail.com>
Date: Sat, 6 Feb 2016 21:24:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454683067-16001-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::243
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] target-arm: Fix IL bit
 reported for Thumb coprocessor traps
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Yrd2n+i85uUv

On 05.02.2016 17:37, Peter Maydell wrote:
> All Thumb coprocessor instructions are 32 bits, so the IL
> bit in the syndrome register should be set. Pass false to the
> syn_* function's is_16bit argument rather than s->thumb
> so we report the correct IL bit.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 3ec758a..10792e8 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -7184,19 +7184,19 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
>              case 14:
>                  if (is64) {
>                      syndrome = syn_cp14_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
> -                                                 isread, s->thumb);
> +                                                 isread, false);
>                  } else {
>                      syndrome = syn_cp14_rt_trap(1, 0xe, opc1, opc2, crn, crm,
> -                                                rt, isread, s->thumb);
> +                                                rt, isread, false);
>                  }
>                  break;
>              case 15:
>                  if (is64) {
>                      syndrome = syn_cp15_rrt_trap(1, 0xe, opc1, crm, rt, rt2,
> -                                                 isread, s->thumb);
> +                                                 isread, false);
>                  } else {
>                      syndrome = syn_cp15_rt_trap(1, 0xe, opc1, opc2, crn, crm,
> -                                                rt, isread, s->thumb);
> +                                                rt, isread, false);
>                  }
>                  break;
>              default:

