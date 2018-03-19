Received: by 10.28.91.67 with SMTP id p64csp2797927wmb;
        Mon, 19 Mar 2018 09:25:08 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtE2+LeymwEs6F7+7jJY7HG9ANJGExaba0ChJKZhRnLW60KlbN+/8x/a2G8cBTZNivWRpsR
X-Received: by 10.200.38.7 with SMTP id u7mr3971484qtu.269.1521476708496;
        Mon, 19 Mar 2018 09:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521476708; cv=none;
        d=google.com; s=arc-20160816;
        b=cKlNwg8sb+jy5YEVO76YPSBJHdVS5phPiyUstbp/nz0YYiP2M0kgxCyNYIIZN/vqhr
         xIPGAJnm33F4TvT3X6zc03wyfoTNCd7dUu1r1CEtTmpPTI8YJNb6j6Ab0GWf6/FI8MPY
         AI8M3412sofSiTZ0UIH58v42ZJ8iKGkC1YtiJQtAE7ztUUuwrMjmIAqon3QXZI2E/Um9
         LJXbOnP+UwEoCgPZACbtUsi5HZ9FtFrfFuVWUjITf6ClIn9Ylnt909W3J4F1K9A7rDXN
         jrSpCNSkmvR/AIVrtScF70QEgHQKTTNZRRogq9uEQWMcUw/NF8G6hceoeloAmG0TVRDU
         2feg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=JetFBhbh5lXx7VUBbf1usA6iqVPnDkORxUPvkMbvdGo=;
        b=b4o6HpMKv6zrPhjcZ2TdkuxOT8koK0YMyUp8kKC4LuZry2y2hj5hzSf1GAkxrlUmZA
         jnc60qEmTopr/BkH7L0XY7bqW9sNziDcuszvPM9GnuUtAkUwtDJonj1mVUSS8FCGyXS6
         y7h/SOmhErq5hjAJHCuCiE8x4OF99aWRRpNMbTToEXNxPUfoOVLksFoibU8cmu5CMNHK
         Q4xvrsm/dOnp/TgqfJpkVhwNPWRGCWKncwqxA3+0iWs5FrGWkut9R3X9qyTOE1R0sZDd
         DjvwVUabMypuah8MqZavOcwoElhjeE3NK9u615QeCMMlKwqjFR5vZZjcHRI9II54VdTV
         dENQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LOvFg2GI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o1si384768qtj.298.2018.03.19.09.25.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 09:25:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LOvFg2GI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exxat-0003U6-Ue
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 12:25:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exxaZ-0003Ni-Fy
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:24:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exxaY-0006Nh-Dm
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:24:47 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:35097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1exxaY-0006Mb-8A
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:24:46 -0400
Received: by mail-oi0-x242.google.com with SMTP id a189so7836023oii.2
	for <qemu-arm@nongnu.org>; Mon, 19 Mar 2018 09:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JetFBhbh5lXx7VUBbf1usA6iqVPnDkORxUPvkMbvdGo=;
	b=LOvFg2GI7gMq6SIFkiQqw7qZC1frKj7YrBclNgBi3a5pQqhM1ZtuLMMcuAE4uycDPq
	YOoHOhg4u2/0gsijSEnX6fjIEix3DCmgQ2np6dbQUOoFYSqMVGVnrW+pc1NA8901qa/k
	BjTbNC0cTBTAdzUQ5p23+EeefxGbYN+/dJtsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JetFBhbh5lXx7VUBbf1usA6iqVPnDkORxUPvkMbvdGo=;
	b=HAoJBu/tEL39VM7QBjjMlrc1RkEJmRGjNqTdN0YfOuclVe52Jm2VXNzqqXlvKXYqmA
	yzIy3Wt0U+zc/HUd0wiyH02Nt+xD4RgdzXX48Y7YBzBRztpIbsmTDwUAw1G5NkU+RIFT
	UaH32V6rNKE8BopXFL5dGnC0xqMI2n3wXmkXKnneFFZ9CE6ffkMXDAFgMfBNHSpboKpz
	F90vpZ1IyIR4hlv0cXEMKjnsn4xybiuPFQo1iEiemaN53BQP1ZXEvBMFP1KXIpjmMWee
	GxDCfy7WeFvBzlLz7th/f+1xkJk9zFT3PXyh/U6EpfglfQW89mA3/eskU0kBMsEJnzMp
	0k3A==
X-Gm-Message-State: AElRT7EmViEWXuOlTxT/68SrTXxQ0H1OvpMG5bVbkxTMuNB/g3EbMeH9
	jXOZz7QY3z4iVVTZEhY09buGTwxtDzVXhjTXzwBbpg==
X-Received: by 10.202.63.85 with SMTP id m82mr5950643oia.252.1521476685546;
	Mon, 19 Mar 2018 09:24:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 19 Mar 2018 09:24:25
	-0700 (PDT)
In-Reply-To: <1521470177-14760-2-git-send-email-zhaoshenglong@huawei.com>
References: <1521470177-14760-1-git-send-email-zhaoshenglong@huawei.com>
	<1521470177-14760-2-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Mar 2018 16:24:25 +0000
Message-ID: <CAFEAcA8+Gqn=TMnu2X7YcSjtJxnGPGY15Epi_ds1x=dguycyvQ@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 1/2] arm_gicv3_kvm: increase clroffset
 accordingly
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AYXWBW9/FgvU

On 19 March 2018 at 14:36, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> It forgot to increase clroffset during the loop. So it only clear the
> first 4 bytes.
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> ---
>  hw/intc/arm_gicv3_kvm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index ec37177..7000716 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -232,9 +232,10 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
>  static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>                              uint32_t clroffset, uint32_t *bmp)
>  {
> -    uint32_t reg;
> +    uint32_t reg, clroffset_index;
>      int irq;
>
> +    clroffset_index = clroffset;
>      for_each_dist_irq_reg(irq, s->num_irq, 1) {
>          /* If this bitmap is a set/clear register pair, first write to the
>           * clear-reg to clear all bits before using the set-reg to write
> @@ -242,7 +243,8 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>           */
>          if (clroffset != 0) {
>              reg = 0;
> -            kvm_gicd_access(s, clroffset, &reg, true);
> +            kvm_gicd_access(s, clroffset_index, &reg, true);
> +            clroffset_index += 4;
>          }
>          reg = *gic_bmp_ptr32(bmp, irq);
>          kvm_gicd_access(s, offset, &reg, true);

You might as well just use 'clroffset' directly rather than
creating a new clroffset_index variable, I think.

thanks
-- PMM
