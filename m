Received: by 10.25.0.23 with SMTP id 23csp72383lfa;
        Fri, 2 Jun 2017 11:38:09 -0700 (PDT)
X-Received: by 10.237.33.107 with SMTP id 98mr4468300qtc.116.1496428688946;
        Fri, 02 Jun 2017 11:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496428688; cv=none;
        d=google.com; s=arc-20160816;
        b=tuxpuwftSFuqLVgyUGUBMWK4qYi7soAhsvBBKcNIgUOQsnGYxdyTXQ4Jm0hOAi/Lm7
         OdV2uKbC8bHizgW01mg8YE6faUB70kx2L9j7NN2uTB/15G0lB0+FfHEkJGQ3MLNdMdT1
         FuVrsNGLyYZbW8GyfPiw5MfQG9WfgaKSbVwkYSXu9F5xdryqE/IkgzUlBiIPzEi3vknP
         SQ67He5kGwpXOm4WsVXl+ca6Pvff+a5RRVgck1jcDMfw9Rw48V9ZErf4rIQ8PEHuGe+r
         jA4f3D4qwZq3//RBPxR8uOQBaE5FRp4ITMneDSOgkUuNTysplezFj7la56OTkFFEu5cI
         p6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=xS9Gel9TpPce36uE1RVx1b/95i1X44JGlriLEaoU1Nw=;
        b=vJuu1YHrZdrbyAxA4hC8DaV6nq0iJ7m32LDvsAwf1JpLjFMh9ZP1S2g1JPEgZLYy0O
         HOWBGWlFWU2561moWfmC6ZbJo0CT67fIXaWyUDVpvIEiFNRwiuVMXHr9+6xpUxuhcuRv
         J5l1iB8wl2k7d04fQX5w97ZZmTjmXAqHAJ2Z77T/z5vyepKz0EL2kUkAAK4tm7HKOA9e
         LnIwCAQg16LyJUZoNVuwt6QfgQ7uJRSDQIn5fDK6msVEyp9AGjHBnSXG+IOAbyZ0G0bo
         nqFCEZa5r79+Be4QRK73Za8w0Q8wb0eOJlbE1GuFd+OZdchHdpJL8UE21Foindu3s+Op
         nG+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 23si23649220qtr.324.2017.06.02.11.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 11:38:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGrSY-0004oD-A2
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 14:38:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGrRI-0003RN-Oq
	for qemu-devel@nongnu.org; Fri, 02 Jun 2017 14:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGrRH-0004qR-NW
	for qemu-devel@nongnu.org; Fri, 02 Jun 2017 14:36:48 -0400
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242]:35615)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGrRH-0004q5-Hk; Fri, 02 Jun 2017 14:36:47 -0400
Received: by mail-it0-x242.google.com with SMTP id 67so12504139itx.2;
	Fri, 02 Jun 2017 11:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=xS9Gel9TpPce36uE1RVx1b/95i1X44JGlriLEaoU1Nw=;
	b=eK4rabKwPYEJWB8rpvF/FTrDVT/ubUj+M1BvALLcqu+GhGG+sbcpdryswbCshGvG9J
	+st3z3FwozWuLjsv2XrQhNogXVhX3e4kYDedYJ90IHPF8VnNqNPBfGhlDMAQvoTHIF9g
	0HgdlqacL4KZusTdtlBj+RiPLPBsdGTjsd6B/Pk+FCON1NAq2NNYMKZ0k15rcS6kg82J
	+CAoeGJ/KfOGoScPtP+ZlaAl7nr12En3ujoAXud4rsDR9FXjmnYQp+ULC5gvc+QJ4qXu
	KdI5cJ/lAjEQFxKvgT+HVLCCpOXH32Pc2FM4ku8x244+O4xy6/jcSlSj0UQY1nVLUCbc
	Or0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=xS9Gel9TpPce36uE1RVx1b/95i1X44JGlriLEaoU1Nw=;
	b=W2rO4ZnOkFPVPwGb4us+jEYpFngFuBgbyyX9P1j77tVubV4Jy3V0gpK7Gd8agLTuTc
	rNM1oNEaa38dxdl1cUqKm+C9UbReHa17vB7rWTvlQGMAdin2lMQRcmBkZY93a4QPcDqu
	jjDkbrhx4MJ9e1eAjlycKbZUcURi2SNSoZLFrTJle/uATLqqwfpSvwFOM0HmKXbJsXAW
	OdyKkpV85hrMSu4HhtnL5/3PWIZqwDiZaGA/UVLfg2UUY0BnFOWWyFV0SR37UbOBK9Bp
	YTNIM45RHBc3JItpdCOVfDVAYIOANmHiqEH88Sh/F2OdvWl9eTadra/KnMkCTPxvoSgE
	haag==
X-Gm-Message-State: AODbwcDDTbiJLONl136/6H/mqIpeUIP8GcmmQU+IxjQFa5yUeZQqBkLz
	IiSK3E+tAwaLGA==
X-Received: by 10.36.94.134 with SMTP id h128mr752304itb.92.1496428606779;
	Fri, 02 Jun 2017 11:36:46 -0700 (PDT)
Received: from ?IPv6:2602:30a:2c37:1a00::43? ([2602:30a:2c37:1a00::43])
	by smtp.gmail.com with ESMTPSA id
	u32sm10272977ioi.51.2017.06.02.11.36.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jun 2017 11:36:45 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20170602162857.6065-1-krzk@kernel.org>
	<20170602163618.6369-1-krzk@kernel.org>
	<20170602163618.6369-3-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bda550c9-b9e1-83d0-9cdb-e198cb754a2f@amsat.org>
Date: Fri, 2 Jun 2017 15:36:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170602163618.6369-3-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::242
Subject: Re: [Qemu-devel] [PATCH v4 3/9] hw/timer/exynos4210_mct: Cleanup
 indentation and empty new lines
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EwYBGlOlGwlI

On 06/02/2017 01:36 PM, Krzysztof Kozlowski wrote:
> Statements under 'case' were in some places wrongly indented bringing
> confusion and making the code less readable.  Remove also few unneeded
> blank lines.  No functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/timer/exynos4210_mct.c | 45 ++++++++++++++++++++-------------------------
>  1 file changed, 20 insertions(+), 25 deletions(-)
>
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 2404fb737ac4..ea5f99d9a41b 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -1016,9 +1016,9 @@ static uint64_t exynos4210_mct_read(void *opaque, hwaddr offset,
>
>      case G_COMP_L(0): case G_COMP_L(1): case G_COMP_L(2): case G_COMP_L(3):
>      case G_COMP_U(0): case G_COMP_U(1): case G_COMP_U(2): case G_COMP_U(3):
> -    index = GET_G_COMP_IDX(offset);
> -    shift = 8 * (offset & 0x4);
> -    value = UINT32_MAX & (s->g_timer.reg.comp[index] >> shift);
> +        index = GET_G_COMP_IDX(offset);
> +        shift = 8 * (offset & 0x4);
> +        value = UINT32_MAX & (s->g_timer.reg.comp[index] >> shift);
>      break;
>
>      case G_TCON:
> @@ -1067,7 +1067,6 @@ static uint64_t exynos4210_mct_read(void *opaque, hwaddr offset,
>          lt_i = GET_L_TIMER_IDX(offset);
>
>          value = exynos4210_lfrc_get_count(&s->l_timer[lt_i]);
> -
>          break;
>
>      case L0_TCON: case L1_TCON:
> @@ -1153,23 +1152,23 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>
>      case G_COMP_L(0): case G_COMP_L(1): case G_COMP_L(2): case G_COMP_L(3):
>      case G_COMP_U(0): case G_COMP_U(1): case G_COMP_U(2): case G_COMP_U(3):
> -    index = GET_G_COMP_IDX(offset);
> -    shift = 8 * (offset & 0x4);
> -    s->g_timer.reg.comp[index] =
> -            (s->g_timer.reg.comp[index] &
> -            (((uint64_t)UINT32_MAX << 32) >> shift)) +
> -            (value << shift);
> +        index = GET_G_COMP_IDX(offset);
> +        shift = 8 * (offset & 0x4);
> +        s->g_timer.reg.comp[index] =
> +                (s->g_timer.reg.comp[index] &
> +                (((uint64_t)UINT32_MAX << 32) >> shift)) +
> +                (value << shift);
>
> -    DPRINTF("comparator %d write 0x%llx val << %d\n", index, value, shift);
> +        DPRINTF("comparator %d write 0x%llx val << %d\n", index, value, shift);
>
> -    if (offset & 0x4) {
> -        s->g_timer.reg.wstat |= G_WSTAT_COMP_U(index);
> -    } else {
> -        s->g_timer.reg.wstat |= G_WSTAT_COMP_L(index);
> -    }
> +        if (offset & 0x4) {
> +            s->g_timer.reg.wstat |= G_WSTAT_COMP_U(index);
> +        } else {
> +            s->g_timer.reg.wstat |= G_WSTAT_COMP_L(index);
> +        }
>
> -    exynos4210_gfrc_restart(s);
> -    break;
> +        exynos4210_gfrc_restart(s);
> +        break;
>
>      case G_TCON:
>          old_val = s->g_timer.reg.tcon;
> @@ -1207,7 +1206,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>          break;
>
>      case G_INT_ENB:
> -
>          /* Raise IRQ if transition from disabled to enabled and CSTAT pending */
>          for (i = 0; i < MCT_GT_CMP_NUM; i++) {
>              if ((value & G_INT_ENABLE(i)) > (s->g_timer.reg.tcon &
> @@ -1288,7 +1286,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>          break;
>
>      case L0_TCNTB: case L1_TCNTB:
> -
>          lt_i = GET_L_TIMER_IDX(offset);
>          index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>
> @@ -1316,7 +1313,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>          break;
>
>      case L0_ICNTB: case L1_ICNTB:
> -
>          lt_i = GET_L_TIMER_IDX(offset);
>          index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>
> @@ -1353,13 +1349,12 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>          if (icntb_max[lt_i] < value) {
>              icntb_max[lt_i] = value;
>          }
> -DPRINTF("local timer[%d] ICNTB write %llx; max=%x, min=%x\n\n",
> -        lt_i, value, icntb_max[lt_i], icntb_min[lt_i]);
> +        DPRINTF("local timer[%d] ICNTB write %llx; max=%x, min=%x\n\n",
> +                lt_i, value, icntb_max[lt_i], icntb_min[lt_i]);
>  #endif
> -break;
> +        break;
>
>      case L0_FRCNTB: case L1_FRCNTB:
> -
>          lt_i = GET_L_TIMER_IDX(offset);
>          index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>
>
