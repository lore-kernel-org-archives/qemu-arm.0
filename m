Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1370333lfm;
        Thu, 25 Jun 2020 07:50:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZZRsFAHpUZqsgpYxrY0TQ1DvatG1MBlBlB1RoQUybaK9GeZX5Hzaw0zN5ikFWNOY20vmQ
X-Received: by 2002:a25:230a:: with SMTP id j10mr54045148ybj.260.1593096609924;
        Thu, 25 Jun 2020 07:50:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593096609; cv=none;
        d=google.com; s=arc-20160816;
        b=G+kX+VRTvMxTQJC4qRtpiWYHLJLQ8CUKkrYZQmSPUtZSlCjQ05j/JOE1gnVg7YFS5K
         pB2EeP4BlHCC2gtB06/uCXE7vh2EUnlpKtmIPyC4rmQXZuwe0tzcoHJbQtFRuHHLKqch
         VxdjPPBKM/FY2Sce4IiTWTgo6NTRITtWQisxx1uFN4eCPrCzoZzcSIEzs70bNK9bpKeH
         kmI3NePPTPbQt3gQjjoqL/0XGbih7C/5dgsBSNZBzDi8jy7wYZQpzuCGaMwubcoJV/7n
         iW3fxMrY3SHHGXd9jDnH7yO2TOYkZ+hxCTXrAf2ppcYqNuk2MBrOJm0VDX3XgwJFJM7Q
         PSdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sOEbjCQLqCivzNz5CXSxvHveIDvkoCbJH5t+ZKxBjT8=;
        b=0i4RGpORExMfy4OeNubdLpOYcbJgw01xl7eK2k10Zoc30k/HN3OTfXNsAphu5onfC/
         jxIlf/zIl/mMWLlt5FARl5CBRT7irs+00Q+gz8MR1mizmnJ0pMOVja6Gdfn6YdRluCJR
         9BvCvd9uPZSAl7yy/cexTy0QFFLt6XCSlKN4XHpq9apnhnfSQnsEGsQcWXez5YlKDchZ
         zwjoDw969p1zt4+o5NXa8fA7mZx0n6DM/+O01s5aIokFH3G66k7DVj69b45l0UDBG5FC
         pWfnyTA6znsiYQha7h6HI8z2HZEHC7akjnHq+TqczDPp9v8xQOfHfi/8tgoVzKlCBiAX
         EojA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YUGx6bB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l198si23079913ybl.6.2020.06.25.07.50.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 07:50:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YUGx6bB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joTCb-0002mX-AN
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 10:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTCT-0002mJ-25
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 10:50:01 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTCR-0000Cf-7h
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 10:50:00 -0400
Received: by mail-ot1-x342.google.com with SMTP id 18so5491960otv.6
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sOEbjCQLqCivzNz5CXSxvHveIDvkoCbJH5t+ZKxBjT8=;
 b=YUGx6bB+hy74kpeNTE3bpUAbpG7P8tO6BR7HjHW8rcIsHp5dGky1k+QopHAU6jThOE
 YdO9J1LqVJ0o/yOLrTLzvIPG4/+/PZITkgJeFxpgNI+ScG71lY+pZaruE6Dedn89S5kV
 ezEteA6JrlojbFFubcGTQfAgfL3yg8Gd6QX2DTEThd009E+uzkH1VKqSvYXoo3UQo4Qj
 69AS0jKZb/uUzRJi2939BnZs7uy5D+5o1Cl8eSaT2IeBD5B9/eRE+2S2aAq2NVPI97gw
 vdf/D4cePC8i9RuR3jTxJEnVDHR+iSYROtMQF6nI5MxeOZori3mCZyJvWSQm7dUf57Ot
 nOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sOEbjCQLqCivzNz5CXSxvHveIDvkoCbJH5t+ZKxBjT8=;
 b=E+wOZuRxXMcFAAOAybEoHeyQpjeKqF5tK6R6X9ZsUZ1fI9QKz1sd8fG54n7lOL+ucY
 xOaMxnUYcvuQs32H7cpTOYUCGhkw2CogkGaGehWD4sG7Hfjf98Dnp6kT8+7CarduLtvU
 rGAj5Yr4YuFzamWXa+TAtLP1bjuH7HPLdCX/rWKzuFBMRWkq0Nq4fric/6A5FzI+rxhS
 +odNSJMJOTCl8bR6+7JSZOuN1xsRrMz4zLGbfq8ypd75+ojqsmTAqMxkOFNbacs25KyZ
 hm4aMAZMtBYC8b47hsKuE0BFZkFve0J/n6FC/vGt1tM1ID8iOhdK/WrQZf3CY2+dXYiB
 2fwg==
X-Gm-Message-State: AOAM531VzBhEK//qLIGp3TLsif5Ne4ha6c+ORTNZdqbB3KPI62MnqKuX
 dmEKi8G0suK/n+zbVw83Be/KkiX0xmCu+rt1d7DTmg==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr25854303otn.221.1593096597475; 
 Thu, 25 Jun 2020 07:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-2-eric.auger@redhat.com>
In-Reply-To: <20200611161500.23580-2-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 15:49:45 +0100
Message-ID: <CAFEAcA-8EjTYGb-RCp6=znbpWUS7rZZuCHTFtPSmQ6NzMM2mXg@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/9] hw/arm/smmu-common: Factorize some code in
 smmu_ptw_64()
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Or+5WJqbHMYR

On Thu, 11 Jun 2020 at 17:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> Page and block PTE decoding can share some code. Let's
> first handle table PTE and factorize some code shared by
> page and block PTEs.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmu-common.c | 51 ++++++++++++++++----------------------------
>  1 file changed, 18 insertions(+), 33 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index e13a5f4a7c..f2de2be527 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -186,12 +186,12 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
>          uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
>          uint64_t mask = subpage_size - 1;
>          uint32_t offset = iova_level_offset(iova, inputsize, level, granule_sz);
> -        uint64_t pte;
> +        uint64_t pte, gpa;
>          dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>          uint8_t ap;
>
>          if (get_pte(baseaddr, offset, &pte, info)) {
> -                goto error;
> +            break;

get_pte() fills in info->type (to SMMU_PTW_ERR_WALK_EABT) on
error; changing this from "goto error" to "break" means we'll
now execute the "info->type = SMMU_PTW_ERR_TRANSLATION" that
comes between the end of the while loop and the error: label,
overwriting the wrong error type.

thanks
-- PMM
