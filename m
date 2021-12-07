Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4457246lfk;
        Tue, 7 Dec 2021 04:46:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5Uam6ebdqZoXZNuP2fQdBCYBNXLt3L2kC7SkEZAAkSj9IgLCnPXDPwPTIaB9JS0N2Kibn
X-Received: by 2002:ab0:1e04:: with SMTP id m4mr50817128uak.100.1638881176580;
        Tue, 07 Dec 2021 04:46:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638881176; cv=none;
        d=google.com; s=arc-20160816;
        b=R/v8CF1k+MWu1Zv7ynvO+Jz7/rf5ivO4yU7oHFWX/orU5rz4x74AhEcmgSGz1sCeKm
         rY8/EgrjMncURtSHAK7KJn715VdBnrCHmeCaNufaNFC1eBo9p51wm6FeSp5euK0MexI8
         IhBixUCFMN1LlULR0sMC4LjfiPRcE1u/GFVGxTmLMFo5vI/2ih26o5eL/E92nV5614OA
         PfL3jaz4e+cfVkoFCdtGyNFp9rptKsFP53gYVTuHR4pfxr/HKIEhEkQzWzXDiAkYW0wc
         pos3vogVpn2P25jxvNmV6d6Tqkc1exdbyQlxnVgK1XxFLlchNtJN4yPoHwMrHf8s148a
         FRDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=iA125WgdL0feVx1Cwf+ohVWm2XoCg4Yb4ydVSGT/Qg8=;
        b=0FF26aOURyoKD4dEYydTCd6MI8FQSc85G0GLEHOBrbZ8S/6G9Ei043gs0B1hLKnaP3
         QdfWGtp5cx2Mar0j+N0E53WO+OZXNvUi0oAxZb44Wq8+vuGRQD+8B8ZCSvWHqXi638z2
         lH6KnxwZLGO2MS//K6VCiUSviJRW6aRHa9UbeEG+DeG/MW4IeUxbaHSlw14E6I4L2bdY
         2fkIh/UQKr77ShrKuATEVXMxpzwr4wSc8ABrVNjCrJV7PKjMBIYnkORUcTPH7ApFPqK+
         MWHZvfCLbPlq3aIRz/Rm8PyKx4aUXE/fVsoTQX3sjLu1p4xGtx9AbVOm/mpDxqh08QYB
         3sRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jELZ3CWT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si13805158vka.197.2021.12.07.04.46.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Dec 2021 04:46:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jELZ3CWT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1muZrL-0007Re-UP
	for alex.bennee@linaro.org; Tue, 07 Dec 2021 07:46:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1muZqp-0007PW-3G
 for qemu-arm@nongnu.org; Tue, 07 Dec 2021 07:45:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1muZqk-0007rI-N8
 for qemu-arm@nongnu.org; Tue, 07 Dec 2021 07:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638881135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iA125WgdL0feVx1Cwf+ohVWm2XoCg4Yb4ydVSGT/Qg8=;
 b=jELZ3CWTODhOkLcQn7Z1QqLjY+lHBIrDAGCXkKp6U9cX0kSCXomFDKjngDkibZrY54yMTq
 WNrPi43kpZMkm9/FMFAIFXkrMFzMyhHq7VY4qFkRdEqlOi73Zaq7VANrIUoLPDOGzfmBAP
 EG93NMhCaegjqZd4RYUO9EHNkN9OLlU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-8tZDfpBsOsaJ1YL4DxvQ9g-1; Tue, 07 Dec 2021 07:45:33 -0500
X-MC-Unique: 8tZDfpBsOsaJ1YL4DxvQ9g-1
Received: by mail-wm1-f70.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so1146596wmc.7
 for <qemu-arm@nongnu.org>; Tue, 07 Dec 2021 04:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iA125WgdL0feVx1Cwf+ohVWm2XoCg4Yb4ydVSGT/Qg8=;
 b=7P/GWE20EYj8BwbXZoSPepDCqbsCh4/lR/saChOxkzZDeCHwDH7GgTBBJnV427+ZxA
 cfr4eq+lRKPgFcc+CaHx0vMa7A13Ehj3ZcuFrbdIFi56WQgen9FyFDvQrZY7jfrYrTUo
 /pXX2vbSrW0JkTbAWi8xc+SmU4w74m1S+C+Flt7WI8abYYEbb+63P78GvbT/vK2WrwjE
 WDdc1w00qM/+chkZl5fjQVeNmaoVn1yK3TA9wQe0GeoH8wBNm9v2UgVU9FXGXAJcHcyP
 eI28LEawcarngCge47t2Zfn8pxbPXUzoKCnwZ2fx1gp699LXH3x97Q6dB80INjLWIDYx
 GLcg==
X-Gm-Message-State: AOAM530IV/S/8eGYIoCDJ1260j0ud6MixYyrcdxl4ylAxI+b9yutsUyI
 x60LbtizTUedE9VpL8D6hBdCshk0sWZKWdshYoHNJTknSNuH7acUNAS8Wz7oin1xX+P1wy8dUlH
 ICTY8Aq9S1EQD
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr50618538wrp.100.1638881132352; 
 Tue, 07 Dec 2021 04:45:32 -0800 (PST)
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr50618506wrp.100.1638881132065; 
 Tue, 07 Dec 2021 04:45:32 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id s63sm2744799wme.22.2021.12.07.04.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 04:45:31 -0800 (PST)
Message-ID: <e0419fd9-ce18-a4f6-7c8a-36e36dce2ae4@redhat.com>
Date: Tue, 7 Dec 2021 13:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211207094427.3473-1-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fbFgfi1IxPFA

On 12/7/21 10:44, Damien Hedde wrote:
> According to the "Arm Generic Interrupt Controller Architecture
> Specification GIC architecture version 3 and 4" (version G: page 345
> for aarch64 or 509 for aarch32):
> LRENP bit of ICH_MISR is set when ICH_HCR.LRENPIE==1 and
> ICH_HCR.EOIcount is non-zero.
> 
> When only LRENPIE was set (and EOI count was zero), the LRENP bit was
> wrongly set and MISR value was wrong.
> 
> As an additional consequence, if an hypervisor set ICH_HCR.LRENPIE,
> the maintenance interrupt was constantly fired. It happens since patch
> 9cee1efe92 ("hw/intc: Set GIC maintenance interrupt level to only 0 or 1")
> which fixed another bug about maintenance interrupt (most significant
> bits of misr, including this one, were ignored in the interrupt trigger).
> 
> Fixes: 83f036fe3d ("hw/intc/arm_gicv3: Add accessors for ICH_ system registers")

This commit predates 6.1 release, so technically this is not
a regression for 6.2.

> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> The gic doc is available here:
> https://developer.arm.com/documentation/ihi0069/g
> 
> v2: identical resend because subject screw-up (sorry)
> 
> Thanks,
> Damien
> ---
>  hw/intc/arm_gicv3_cpuif.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 7fba931450..85fc369e55 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -351,7 +351,8 @@ static uint32_t maintenance_interrupt_state(GICv3CPUState *cs)
>      /* Scan list registers and fill in the U, NP and EOI bits */
>      eoi_maintenance_interrupt_state(cs, &value);
>  
> -    if (cs->ich_hcr_el2 & (ICH_HCR_EL2_LRENPIE | ICH_HCR_EL2_EOICOUNT_MASK)) {
> +    if ((cs->ich_hcr_el2 & ICH_HCR_EL2_LRENPIE) &&
> +        (cs->ich_hcr_el2 & ICH_HCR_EL2_EOICOUNT_MASK)) {
>          value |= ICH_MISR_EL2_LRENP;
>      }
>  
> 

