Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55520C61DD3
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 08:38:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0xWk-0001hc-9F; Mon, 31 Aug 2026 04:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x0xWi-0001gw-Pu
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 04:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x0xWg-0003Oc-Pm
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 04:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788165477;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xm+pMxyZm91RAF50pCHOwFUgLtnKlSaqBBHSzjd4x54=;
 b=FT78dSFuv4H6MQOId0uOxJerHGVu3YHClpyAR9eK0SzEfWcZJ5KOLVI3td9IFJr9RcCpaY
 imPG6ltG4zgOzSrNHyRta1OD5lxWNdcyxnChkC4JEmkQ8UhMntIDiytTZ5yex76gVRk7Lw
 zeGVKKDhu30WS6a+tfRDRkDHD/M9f0I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-6OoDgdGgPy2NrKEyHApPZw-1; Mon, 31 Aug 2026 04:37:55 -0400
X-MC-Unique: 6OoDgdGgPy2NrKEyHApPZw-1
X-Mimecast-MFC-AGG-ID: 6OoDgdGgPy2NrKEyHApPZw_1788165474
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-495529a93f9so29441995e9.3
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 01:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788165474; x=1788770274;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Xm+pMxyZm91RAF50pCHOwFUgLtnKlSaqBBHSzjd4x54=;
 b=L/yrj1WJg6s3y/i4wIdqsizMQ6o7T6D6wN2T9IkTevg7rkT3wUl/eQXnpIfWBWiLgH
 mlki/dtHlS/HzgwdovqNXBNe99GZlNpaFeDClkcOo5NFMe7WfdTp3x7UjMHDcGQ1EidF
 tfSYZCV9gpMdgWf0tEPxzrbTRwGAtWgZlbSVWGewurncnasIRhbgKUSsUpA0tNXdHZsz
 2PlnCN1odqS3K/3zl94XHF+ZWdpkx2YTLNm2F7XcJGNptXJoKaN9btT7571Resto6yVH
 jlH4S0/KEqgrhgasRSWuev4wfZdUe76Jc1cLD5f0x/jKzrfPQPqcDu429bfqcDls9WFv
 C9SQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr7HkZ5cnCDZe2VZx/1p9K0DHBVA3sTrEWzmAAt9BV5/Y0NxoLaSbsktShyhRe9k9x2U1vYMGyr1w==@nongnu.org
X-Gm-Message-State: AFuF++lO3ZibC+ztpNLZUOsN1DkwhUedZhHAr4Y8wkiNhef8pA612gWc
 tPYqo3bu5wVnyhL9DWT0zrtWsx/6EzGLgNzDRlYaCeRH/N6dRLTHeQuER5QEOhpfXcq8r32aOq/
 XKCaS9Vs0BsepHj17s+g50yMyaqJ+g+jUVWbD+0n7YEc0Ix4lMO+CsA==
X-Gm-Gg: AR+sD13V4kIqlJcBZJm0X5GqSBXFT+VdCTP//X4gHeRwfciBaOUmBezyWGW2BT+Osjo
 X6j91yKkASoxG4g8ScTVJzP3QCpEGj9NGs+h13/XU48Crdqgbvbf+LhlvhGWESVkdNfEsaapt2y
 sDjMhfSodsK8DYz+FSE+aglYBDfELK9Lgs3qCTx625Sozv1rNyk4AMoV5uG6jamDvstbkpJ36d2
 RJ9Hx4k9aMzE+rPXs7nxY06PJ3Wd6BqLv6wtdEiyqMq2y1Co+B7VoIPmoI1DBFKIJkB5hTeGSpX
 KV32hFzBDu/kh+mdczFuVCUmkodI/vV1xl9Q67mou8dzjH5FEbEVJ4HeIgsPb6kglK0mpRDOitJ
 E80XT4Thb9bYtFUumURbWMEXoRByNOoN35Dnsam0PjyTv+NJD
X-Received: by 2002:a05:600c:1f82:b0:493:aa0a:45ad with SMTP id
 5b1f17b1804b1-49b91c19d37mr377721355e9.2.1788165474030; 
 Mon, 31 Aug 2026 01:37:54 -0700 (PDT)
X-Received: by 2002:a05:600c:1f82:b0:493:aa0a:45ad with SMTP id
 5b1f17b1804b1-49b91c19d37mr377720315e9.2.1788165473629; 
 Mon, 31 Aug 2026 01:37:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b945816f2sm322493405e9.8.2026.08.31.01.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 01:37:52 -0700 (PDT)
Message-ID: <b4c5b401-ddf4-48db-bb4b-310baa0405e5@redhat.com>
Date: Mon, 31 Aug 2026 10:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 26/28] hw/arm/smmuv3: Initialize the secure register bank
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162624.2809349-5-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260813162624.2809349-5-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SPjBL3SR075go2B0yvtCe71TTfNyD3S2xQEqPEKc72E_1788165474
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 8/13/26 6:26 PM, Tao Tang wrote:
> Initialize the secure register bank (SMMU_SEC_SID_S) with sane default
> values during the SMMU's reset sequence.
>
> This change ensures that key fields, such as the secure ID registers,
> GBPA reset value, and queue entry sizes, are set to a known-good state.
> The SECURE_IMPL attribute of the S_IDR1 register will be introduced
> later via device properties.
what about SEL2 then? Do you eventually target this in this series?
>
> This is a necessary step to prevent undefined behavior when secure SMMU
> features are subsequently enabled and used by software.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/smmuv3.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 2375b7a17a0..7e7376c65e2 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -293,6 +293,7 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>  static void smmuv3_init_id_regs(SMMUv3State *s)
>  {
>      SMMUv3RegBank *bank = smmuv3_bank(s, SMMU_SEC_SID_NS);
> +    SMMUv3RegBank *sbank = smmuv3_bank(s, SMMU_SEC_SID_S);
>  
>      /* Based on sys property, the stages supported in smmu will be advertised.*/
>      if (s->stage && !strcmp("2", s->stage)) {
> @@ -339,7 +340,14 @@ static void smmuv3_init_id_regs(SMMUv3State *s)
>      bank->idr[5] = FIELD_DP32(bank->idr[5], IDR5, GRAN4K, 1);
>      bank->idr[5] = FIELD_DP32(bank->idr[5], IDR5, GRAN16K, 1);
>      bank->idr[5] = FIELD_DP32(bank->idr[5], IDR5, GRAN64K, 1);
> -    s->aidr = 0x1;
> +
> +    /* Initialize Secure bank */
> +    memset(sbank->idr, 0, sizeof(sbank->idr));
> +    /* No stall */
> +    sbank->idr[0] = FIELD_DP32(sbank->idr[0], S_IDR0, STALL_MODEL, 1);
> +
> +    sbank->idr[1] = FIELD_DP32(sbank->idr[1], S_IDR1, S_SIDSIZE,
what about S_IDR3.SAMS?
> +                               SMMU_IDR1_SIDSIZE);
>      smmuv3_accel_idr_override(s);
>  }
>  
> @@ -352,6 +360,7 @@ bool smmuv3_ats_enabled(SMMUv3State *s)
>  static void smmuv3_reset(SMMUv3State *s)
>  {
>      SMMUv3RegBank *bank = smmuv3_bank(s, SMMU_SEC_SID_NS);
> +    SMMUv3RegBank *sbank = smmuv3_bank(s, SMMU_SEC_SID_S);
>  
>      bank->cmdq.base = deposit64(bank->cmdq.base, 0, 5, SMMU_CMDQS);
>      bank->cmdq.prod = 0;
> @@ -371,6 +380,24 @@ static void smmuv3_reset(SMMUv3State *s)
>      bank->gerrorn = 0;
>      bank->gbpa = SMMU_GBPA_RESET_VAL;
>  
> +    sbank->cmdq.base = deposit64(sbank->cmdq.base, 0, 5, SMMU_CMDQS);
> +    sbank->cmdq.prod = 0;
> +    sbank->cmdq.cons = 0;
> +    sbank->cmdq.entry_size = sizeof(struct Cmd);
> +    sbank->eventq.base = deposit64(sbank->eventq.base, 0, 5, SMMU_EVENTQS);
> +    sbank->eventq.prod = 0;
> +    sbank->eventq.cons = 0;
> +    sbank->eventq.entry_size = sizeof(struct Evt);
> +
> +    sbank->features = 0;
> +    sbank->sid_split = 0;
> +    sbank->cr[0] = 0;
> +    sbank->cr0ack = 0;
> +    sbank->irq_ctrl = 0;
> +    sbank->gerror = 0;
> +    sbank->gerrorn = 0;
> +    sbank->gbpa = SMMU_GBPA_RESET_VAL;
> +
>      s->aidr = 0x1;
>      s->statusr = 0;
>  }
Thanks

Eric


