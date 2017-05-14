Received: by 10.25.0.6 with SMTP id 6csp904155lfa;
        Sat, 13 May 2017 22:22:55 -0700 (PDT)
X-Received: by 10.55.113.71 with SMTP id m68mr10252663qkc.281.1494739375184;
        Sat, 13 May 2017 22:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494739375; cv=none;
        d=google.com; s=arc-20160816;
        b=hp6PNrAGRoJ1NQrwXXezE5G4+1mNuCQ6iR6lOrIbSsSqQHVZ/1Ox+9opoeYRlG0eQk
         IHT7I9xR50kuvY/ik3+Zc5giUFRcDzU3VTGucH5Ahh1kPWDSrkmBfN2vyA99oz1Ga+FB
         B61PGph2x3js8Nm2XrjuUCvhg8/3skySsVz80XXSJicv84Atn5dqyutmG9o4BvC1LCm5
         ZXTvSrQOc5G/OaNUDQYwxaDRoUhz/GnHeiBjty0fJwx5XC/GOE3c9bU/jXfDexWsa3lJ
         3h+M8MfQFvoePNPKcOt7EEURatL4fn5+1vwQ8UUrKL9gDEtdTFv9zKdtL8KiABYp3s4K
         hcng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Iu2gZax0UuvqyfELlEJZECM22YxAkXehd3GJk4e35cc=;
        b=OYNJD79qdPt/Sjmd9lALn95Xo298FZ+h/B6WxbdiSxSi2C9XWQCquj26KRnNKY0YRf
         BJEdfKXT1UIJduLTximYAPOVxZ9t/Hd0i139g0y+y6AEn08liVg0wh/dqFX66I5SW0h7
         vLeK8L1oSLU0j3Ceumo5g10WgE5hySyMzwuhc0fR4T+34IU8rNhVFMBZlCTG2rtXdFBE
         T4XRZfTdIQLUirRBtjfT1iRZ+seFMrrvHHyL2b3SHDlI44hRtyS7cZKipikT6yTnY4oW
         +85aFkxEYCISQDPl6O5VvQtuBQ7AdMDHc5M9zB5CzVLB8Z/4Skrh3B1lVtint0zg7cyy
         CvSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f25si7734667qte.11.2017.05.13.22.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 13 May 2017 22:22:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9lzY-00073O-DM
	for alex.bennee@linaro.org; Sun, 14 May 2017 01:22:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9lyi-0006dd-Vd
	for qemu-devel@nongnu.org; Sun, 14 May 2017 01:22:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9lyf-0004ob-Qf
	for qemu-devel@nongnu.org; Sun, 14 May 2017 01:22:00 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:32961)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9lyf-0004o0-Jh; Sun, 14 May 2017 01:21:57 -0400
Received: by mail-qk0-x241.google.com with SMTP id o85so13041269qkh.0;
	Sat, 13 May 2017 22:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Iu2gZax0UuvqyfELlEJZECM22YxAkXehd3GJk4e35cc=;
	b=KriOPOM76sl08c/peK9OZvAROjjZpq41F4DDF4SlqWqEAHcNDQGrBr3HbTPE++QmyW
	iEw63cO0lWAWAo/crCN0l3DE04idKc3paf0E58SRd+tg0yPGp0tA9WpHldPjpz7EohQ0
	jini4P5zd/NrEGxwgra63NC+xjRKBbWWC9qi+gu24Xc05jVqPXf/7HKg71CXagfyVoQA
	UUZtsuN22BaxXqk3gb0WGkXtS5WWHmrsPqbQdRoDkBFh4Lt6fAZwxgC8bDi5ag2Qeiae
	YWpswtTotdrk45m6l5YAQVtgXEEhOX0MXMLNan3iiOa5SDVKIprmuFVZiceUJTpRQ4qP
	e79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Iu2gZax0UuvqyfELlEJZECM22YxAkXehd3GJk4e35cc=;
	b=HyGoJ7H4JvVck/1dTeagx521s5BbZFrvppm5ih/t7OfFoPmDZOT1W/T2aukFAfOEkb
	J524l7tlR41ketCaMjAXC/SMaNRCoth0ScrsXEX9m9li2cKidxW31KHYlAMDw3ZShAka
	WbFT1PSCDd7al9ammuRNRIweftdqNWhVQ1QNo/9lxEfQTEBT6Utb5YPNeiZHEjIuG9b5
	ynWxgTjpl4l361pd/VX6pM2bwvgxo9mf/J1qCbMVWFZh2pULQrFylEgXmJf7pvu1N1JT
	NbUMoYZTQq+J+N040wjZPq4TLpJgoc6df4m733gowelX6tM1GFXuAIX2wxKlcszSJQsg
	alyw==
X-Gm-Message-State: AODbwcBUtb4nMCFlSit0efmJ5dWvOEPUYM+esOqCfQyaJxr6xErrvASv
	89MYPsIylkPYPA==
X-Received: by 10.55.67.77 with SMTP id q74mr11153736qka.185.1494739316955;
	Sat, 13 May 2017 22:21:56 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	w12sm5794953qtc.20.2017.05.13.22.21.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 May 2017 22:21:55 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1493226792-3237-1-git-send-email-peter.maydell@linaro.org>
	<1493226792-3237-4-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fa2c7203-644e-9209-91d8-e37c345b8240@amsat.org>
Date: Sun, 14 May 2017 02:21:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493226792-3237-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 3/3] hw/intc/arm_gicv3_cpuif:
 Fix priority masking for NS BPR1
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mtyKv76Mje38

Hi Peter,

On 04/26/2017 02:13 PM, Peter Maydell wrote:
> When we calculate the mask to use to get the group priority from
> an interrupt priority, the way that NS BPR1 is handled differs
> from how BPR0 and S BPR1 work -- a BPR1 value of 1 means
> the group priority is in bits [7:1], whereas for BPR0 and S BPR1
> this is indicated by a 0 BPR value.
>
> Subtract 1 from the BPR value before creating the mask if
> we're using the NS BPR value, for both hardware and virtual
> interrupts, as the GICv3 pseudocode does, and fix the comments
> accordingly.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 41 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 4 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index e660b3f..eec53c8 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -216,18 +216,34 @@ static uint32_t icv_gprio_mask(GICv3CPUState *cs, int group)
>  {
>      /* Return a mask word which clears the subpriority bits from
>       * a priority value for a virtual interrupt in the specified group.
> -     * This depends on the VBPR value:
> +     * This depends on the VBPR value. If using VBPR0 then:

just aesthetic but I'd move "If using VBPR0 then:" to a new line.

>       *  a BPR of 0 means the group priority bits are [7:1];
>       *  a BPR of 1 means they are [7:2], and so on down to
>       *  a BPR of 7 meaning no group priority bits at all.
> +     * If using VBPR1 then:
> +     *  a BPR of 0 is impossible (the minimum value is 1)
> +     *  a BPR of 1 means the group priority bits are [7:1];
> +     *  a BPR of 2 means they are [7:2], and so on down to
> +     *  a BPR of 6 meaning no group priority bits at all.

This last line seems wrong to me, probably due to copying VBPR0.
I think this should be:

         *  a BPR of 7 meaning the group priority is [7].

> +     *
>       * Which BPR to use depends on the group of the interrupt and
>       * the current ICH_VMCR_EL2.VCBPR settings.
> +     *
> +     * This corresponds to the VGroupBits() pseudocode.

Very welcome comment!

>       */
> +    int bpr;
> +
>      if (group == GICV3_G1NS && cs->ich_vmcr_el2 & ICH_VMCR_EL2_VCBPR) {
>          group = GICV3_G0;
>      }
>
> -    return ~0U << (read_vbpr(cs, group) + 1);
> +    bpr = read_vbpr(cs, group);
> +    if (group == GICV3_G1NS) {
> +        assert(bpr > 0);

Shouldn't happen but we never know!

> +        bpr--;

Yes.

> +    }
> +
> +    return ~0U << (bpr + 1);
>  }
>
>  static bool icv_hppi_can_preempt(GICv3CPUState *cs, uint64_t lr)
> @@ -674,20 +690,37 @@ static uint32_t icc_gprio_mask(GICv3CPUState *cs, int group)
>  {
>      /* Return a mask word which clears the subpriority bits from
>       * a priority value for an interrupt in the specified group.
> -     * This depends on the BPR value:
> +     * This depends on the BPR value. For CBPR0 (S or NS):
>       *  a BPR of 0 means the group priority bits are [7:1];
>       *  a BPR of 1 means they are [7:2], and so on down to
>       *  a BPR of 7 meaning no group priority bits at all.
> +     * For CBPR1 NS:
> +     *  a BPR of 0 is impossible (the minimum value is 1)
> +     *  a BPR of 1 means the group priority bits are [7:1];
> +     *  a BPR of 2 means they are [7:2], and so on down to
> +     *  a BPR of 6 meaning no group priority bits at all.

Same here:

         "*  a BPR of 7 meaning the group priority is [7]."

If you agree with upgrading those comments:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +     *
>       * Which BPR to use depends on the group of the interrupt and
>       * the current ICC_CTLR.CBPR settings.
> +     *
> +     * This corresponds to the GroupBits() pseudocode.
>       */
> +    int bpr;
> +
>      if ((group == GICV3_G1 && cs->icc_ctlr_el1[GICV3_S] & ICC_CTLR_EL1_CBPR) ||
>          (group == GICV3_G1NS &&
>           cs->icc_ctlr_el1[GICV3_NS] & ICC_CTLR_EL1_CBPR)) {
>          group = GICV3_G0;
>      }
>
> -    return ~0U << ((cs->icc_bpr[group] & 7) + 1);
> +    bpr = cs->icc_bpr[group] & 7;
> +
> +    if (group == GICV3_G1NS) {
> +        assert(bpr > 0);
> +        bpr--;
> +    }
> +
> +    return ~0U << (bpr + 1);
>  }
>
>  static bool icc_no_enabled_hppi(GICv3CPUState *cs)
>

Regards,

Phil.
