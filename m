Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6479CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 13:13:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHLGR-0002D8-FC; Thu, 15 Oct 2026 09:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHLGQ-0002BQ-De
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHLGO-00042Q-3g
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792069970;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjkC2h+ZCfM2mKlA1Wlh748PEKb06peYkGGWGp6hhR4=;
 b=MyAy1bgh7611tZw3ssOQNaAt2XTYm50n61SNtIUCkjiksuvrq2KG6FaYqYPhYDi04egp6R
 blQOwLofDcP4vQQb057G6VRIbTjGielZIQ1gDz5DMN8Gk1iJiycS1QnzQvrJJrFGo9wVRz
 LXk8BXdOsfjK5iEtmG5arX8E1ehofTA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-euhpuzEKOl6KY0mnWgT2UQ-1; Thu, 15 Oct 2026 13:12:47 +0000
X-MC-Unique: euhpuzEKOl6KY0mnWgT2UQ-1
X-Mimecast-MFC-AGG-ID: euhpuzEKOl6KY0mnWgT2UQ_1792069966
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4a022fee32fso41492625e9.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 06:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792069966; x=1792674766;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SjkC2h+ZCfM2mKlA1Wlh748PEKb06peYkGGWGp6hhR4=;
 b=fckAlDDd3yqq7ahnzXdSg0MtmJWwn0nj0ZlwxpjdUNreIzYqHcG4yE/VzYmocz1hbc
 WgsXRshvKoKyTXJzIrrVH/D01XufAxzToKzLgFO19Im76AS4mRoKUbcqde1DekI3Hpbc
 7JhyO8whBioR6qR0KyOTforOOFbC2lgH0+ka9GpT1dG8Q7JVQ4GUMNdyLBYHPyDqM/j4
 vsRCf2MR9eScJ/DTLotygmjO8hOCDG1Zfvti+NdxzatX+9TRRKCjBXCMNMNeY2S8aqva
 1iX596HRYTOw5x562cKZUVxUk8bZSAsTZySIc5f+5QCiUd9aPu71i7oBVUDeF593qrRo
 1UKw==
X-Forwarded-Encrypted: i=1;
 AKwUvByrnRx1V4VIBGkU7H0H7leuC9NNtCM+lIBJBoQTzQA86Ww6DVNP36dl9h1BHHVMpX0sF9uvcj3oyg==@nongnu.org
X-Gm-Message-State: AFq9FYJwELg3VPZ2UEzPN/CUCu2FbONEgnfEM8Du/zbhzUnWGfT+a2Bs
 5oaI3gDHU9hqUFPAdCwPIatFjTXDKs0GKsDlxmzKNJi1NNT/PPUWWLMevZB8PVHguuj1VQWn+xE
 wl4mACFift5hl6FLwHdpyXvHegfn8Dpi4kdZ028JIMn1jLog1Un9prw==
X-Gm-Gg: AYBFou22zgD2bp1rPIeHzFqVC7TgLEMJOWGdxUZsWRYeGKcLK/vpx8XbwLwoNnoUdIn
 7bMgqystQM7UXcVPLYA3nq+pZKl2XLzIhUUPYfOsDlasL80H7Vf05Y43dvGX9NV7bVtsAUFfjOI
 kLrddnPCBHBpaxHLEDjI6i0cfxw1malugaKy7z9ku30G4kupZpLY/mGL65jIZib2EeJmKPWM4+Q
 W6ObEFNr5T3RzOBm1U3mER2hxLFxTtAkUt0vegyiyIN8qBLjVSWK2MZubtvJBi2NsCrKes5aeMJ
 tYFPOyv0dn1xWTypylD5XWU1jFuq7EFEphuqOZIPEjq4Wc1TpoSj+AvBUuSo2AyKj9Ckn971fxI
 XBNMUu16VyX3L4ooR180oN+ivb8h4v6tX/ChwW/Jx2aTNHHIv
X-Received: by 2002:a05:600c:548c:b0:4a1:a7f8:c11f with SMTP id
 5b1f17b1804b1-4a1a7f8c1cfmr185453295e9.9.1792069965744; 
 Thu, 15 Oct 2026 06:12:45 -0700 (PDT)
X-Received: by 2002:a05:600c:548c:b0:4a1:a7f8:c11f with SMTP id
 5b1f17b1804b1-4a1a7f8c1cfmr185452645e9.9.1792069965247; 
 Thu, 15 Oct 2026 06:12:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaaa34sm18547051f8f.20.2026.10.15.06.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 06:12:44 -0700 (PDT)
Message-ID: <6e0b9a10-84c3-4948-8eef-3d2ea5c44a56@redhat.com>
Date: Thu, 15 Oct 2026 15:12:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 11/25] target/arm: disable PMU support for named
 CPU models
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 ping@khushitshah.com, sandesh.patel@nutanix.com
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-12-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260921123249.1708067-12-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZKjTA0lHdpyOkXzQwqmmFm-V3Bl0SXQEnXS0Og--CfU_1792069966
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Khushit,

On 9/21/26 2:32 PM, Khushit Shah wrote:
> Under KVM, the guest PMU is backed by the host PMU (event set, PMCR.N,
> and PMCEID), which may not be portable across heterogeneous hosts.
>
> Disable PMU support for named CPU models by clearing ARM_FEATURE_PMU in
> the named-model init path so arm_cpu_post_init() does not create the
> "pmu" property.

To me it shall be possible to turn PMU on even on named model. I
understand it may create migration issues due to the HW adherence but yet.
I think on x86 you can use -cpu Haswell-IBRS,pmu=on.

Eric


>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  target/arm/cpu-models.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu-models.c b/target/arm/cpu-models.c
> index fed3197186..153ee10ae6 100644
> --- a/target/arm/cpu-models.c
> +++ b/target/arm/cpu-models.c
> @@ -159,6 +159,10 @@ static void arm_named_cpu_initfn(Object *obj)
>      /* 1.b Properly set RES1 fields. */
>      reset_res1_fields(cpu);
>  
> +    /* Disable PMU for named CPU models. */
> +    unset_feature(&cpu->env, ARM_FEATURE_PMU);
> +    cpu->has_pmu = false;
> +
>      /* 2. Add sveNNNN and SYSREG_ properties */
>      aarch64_add_sve_properties(obj);
>      aarch64_add_idregs_properties(obj);


