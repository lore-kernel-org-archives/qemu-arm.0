Received: by 10.25.77.4 with SMTP id a4csp1304919lfb;
        Mon, 13 Mar 2017 12:33:13 -0700 (PDT)
X-Received: by 10.55.132.3 with SMTP id g3mr31303518qkd.300.1489433593048;
        Mon, 13 Mar 2017 12:33:13 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 52si1189656qty.179.2017.03.13.12.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 12:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnViQ-0003yu-A6
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 15:33:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVhR-0003xm-Tf
	for qemu-devel@nongnu.org; Mon, 13 Mar 2017 15:32:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVhN-00072x-TL
	for qemu-devel@nongnu.org; Mon, 13 Mar 2017 15:32:09 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33665)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVhN-00072j-P5; Mon, 13 Mar 2017 15:32:05 -0400
Received: by mail-qk0-x244.google.com with SMTP id j127so38581855qke.0;
	Mon, 13 Mar 2017 12:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=axStxj4PiPH2jpmPuB1jzACt/rPAvcZQl5Q7WFzbt00=;
	b=TQlFFHPxVtXHKCbLAF1qHPF0M53fm9DHe41tUBTDJEdOVGcFK7BBPZp2LOpwga+Q/I
	dMrSzVKk1oH6sRoGNkMPXFt10J5JrrlLCWCPDL/l8ybdfIpoeZKt+qB93hxJINlVYc9Y
	sKdcGGGMpIeLTl2COSz8Aw79qfkSbxLjQBjRTM0KUXa8/givK5UbINK2Rn3ezYjuk2tB
	6UXOYPgPOoJj1fcrC2rIUx4jtUAWSi5hE/lGet5CsLp6LqQl/aC/sM/kELvpn3PFGK4e
	VW2svU4U7x/S1wyMVYpOOJfm7USwcU2kml+bk3Y19bVMdVU408eQ+cinefL07WJblYi7
	fAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=axStxj4PiPH2jpmPuB1jzACt/rPAvcZQl5Q7WFzbt00=;
	b=HPVscZz/wjoXFQGyJ1GdFtOsLfC4zIPB9frFlUZkIYtfTiqdzbi2LbPRMIZbUW8Nnc
	Wx/mhRixPPSJlmS7H7ww/TFM7Bgn9uZaEOWEdhDf0diZk5AZ7RFSkTyaXNMeCuVknbYq
	RsAYx+CizasXto2diT31uYixgl8Kglcyashs7NaKY+e5VZeljsTzhXI2KRE040Z8mIuD
	fPfsvc0a4ljNcYCdymLRuonWu0U2VK8eg4rjMosagK5h5IzI884DcvqWDPAyw9IUIHGz
	0EHbtdM0L0t51OHR4kAnG9MfuSko7V5ZGe/8go08e1nvAIg2M5E664PjsJUoFJQ+AWZ3
	Ly7A==
X-Gm-Message-State: AMke39nUzi+gc1eFcVtLnOJ1dvhhG0la5t+MPO30L9kQvPYqmpKQwZSCGDVvG7fNbOSVUg==
X-Received: by 10.55.51.65 with SMTP id z62mr30777819qkz.276.1489433525160;
	Mon, 13 Mar 2017 12:32:05 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	s71sm12811932qkl.60.2017.03.13.12.32.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 12:32:04 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>
References: <20170313180432.7067-1-krzk@kernel.org>
	<20170313180432.7067-5-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c2395a46-2d6a-180c-5f4d-9881cdac4fcf@amsat.org>
Date: Mon, 13 Mar 2017 16:32:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170313180432.7067-5-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 4/5] hw/timer/exynos4210_mct:
 Cleanup indentation and empty new lines
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
X-TUID: xRfuEogZdA/+

On 03/13/2017 03:04 PM, Krzysztof Kozlowski wrote:
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
> index cd290637f357..4dd3e441e2e6 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -1015,9 +1015,9 @@ static uint64_t exynos4210_mct_read(void *opaque, hwaddr offset,
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
> @@ -1066,7 +1066,6 @@ static uint64_t exynos4210_mct_read(void *opaque, hwaddr offset,
>          lt_i = GET_L_TIMER_IDX(offset);
>
>          value = exynos4210_lfrc_get_count(&s->l_timer[lt_i]);
> -
>          break;
>
>      case L0_TCON: case L1_TCON:
> @@ -1152,23 +1151,23 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
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
> @@ -1206,7 +1205,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>          break;
>
>      case G_INT_ENB:
> -
>          /* Raise IRQ if transition from disabled to enabled and CSTAT pending */
>          for (i = 0; i < MCT_GT_CMP_NUM; i++) {
>              if ((value & G_INT_ENABLE(i)) > (s->g_timer.reg.tcon &
> @@ -1287,7 +1285,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>          break;
>
>      case L0_TCNTB: case L1_TCNTB:
> -
>          lt_i = GET_L_TIMER_IDX(offset);
>          index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>
> @@ -1315,7 +1312,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>          break;
>
>      case L0_ICNTB: case L1_ICNTB:
> -
>          lt_i = GET_L_TIMER_IDX(offset);
>          index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>
> @@ -1352,13 +1348,12 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
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
