Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp776496ejb;
        Fri, 17 Mar 2023 04:37:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Kss/oUetD9iEsBXN3Q/7eM4bABy8zYqAud8Bit7GJFr8cz5Q+fqgyNETSviA3vCrXIfu5
X-Received: by 2002:a05:622a:1653:b0:3bf:dfe2:6312 with SMTP id y19-20020a05622a165300b003bfdfe26312mr10717063qtj.5.1679053061883;
        Fri, 17 Mar 2023 04:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679053061; cv=none;
        d=google.com; s=arc-20160816;
        b=dtqGd+t+llaqUqhSxi0eaCIH7M7lB274IhQ3ohzEmHIJ53UjqkAM6bUo1BVJ3eCI+0
         W2eaUEeQMo6AZPy9tpTVU/cimrORByo76EuqN7L6X4/XnKRGDwcjNarIQmCNXTrGFWw0
         /4aqRnUxvCbfpwHc8g5iZu7G/H4YM3d/kGy4D0NR4OJn3OZv1LULfU7mlVg4/6f2z7H1
         SzmwOVq44D3wUaLNlVDS82uO1bS0V7c7cW5XDGhSKJ4nY3orLCy7vdDxSe4HDh5A7DFQ
         7TAdTQNPpYqVzcF+8XUfTUULYFqhgnimACq3DLajQt+G56KR+FdJ5oKIaLDHGBl462zG
         s7ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0yAPCqMR8frTb6MwmsydzCp206Ocqt4y65pxFIs6KYw=;
        b=STHN7rxQWMgtAOwAkt4YmoI/Xm7HfvKvN7eRWm8LFD78uyyKSQGH98B/7BNUi5ZNkA
         TvWN+SXYpTD4P8bBJDSILH6BJjYgJif+bGAAu2g1NqSFq27rGtwNRw0nIBwxWsTpYjTG
         9bGP9Yyml9Z9my7yWGjWrSj+FBPKzyWQca1tw9mEdV0paXPRZWm4f3Y6nV5oorIb+ao8
         yF69rzask6/epMUua8ebg6XUa13X40B5dPTgl2vpErkHZG1ShldHK8GRKWW3mLW9PjDt
         yWHSTNq1W7jd9nt5/9BT33UUlJnDlutP/18lCwIlkDhypq87oFFAn2ZRSrm2+yxEeSKs
         3NEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GnKD62IP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020a374105000000b007464763e335si1403043qka.162.2023.03.17.04.37.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Mar 2023 04:37:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GnKD62IP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pd8Oi-0002HH-NE; Fri, 17 Mar 2023 07:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pd8Oe-0002FK-Kk
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 07:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pd8Oc-0004AI-Ru
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 07:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679053037;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yAPCqMR8frTb6MwmsydzCp206Ocqt4y65pxFIs6KYw=;
 b=GnKD62IPXwYU68t9eQS+KejiL5NQRkUYhSgMt2mndt6yzHuZbeeduG3p20/NxoamQEiUQ0
 MdRx9M8qHsqcgofCm1TewRNnAWIPtIen27sqsACb4RFAPnwgqwX6KvFrNKk/ZGg5Du9paF
 pamkV0yJKFF8d44XZLN6RNfQpBRIWSc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-B2sYWaBaPGWlmIyEDenZzQ-1; Fri, 17 Mar 2023 07:37:16 -0400
X-MC-Unique: B2sYWaBaPGWlmIyEDenZzQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 m4-20020a0cbf04000000b005befcfb7d82so584231qvi.7
 for <qemu-arm@nongnu.org>; Fri, 17 Mar 2023 04:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679053036;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0yAPCqMR8frTb6MwmsydzCp206Ocqt4y65pxFIs6KYw=;
 b=qHhkOZqp4ruuWbFPG62YQab3iG9D+RBy4hGRdvCnect+01ujryhUn7Tk9XFycgCIFO
 wkkvuxGvctImybebabNHk1knMMvzaFH3fRTsfmtjFBE8rUcI/uqFGiupsuqJVJGsx6B1
 E3pKpEJFoplvSoRk3ZQTqE+LqsYVl8JSUZp3JvOQYywKj4pX/tpVhL57Cqmz3Sm9vu3E
 Sr5Iu7K+LCEg4s8lln45YLqpLlowOxd80Ug4APemOhaq9TTMtrbSOII3N40siL8bSQhZ
 5Rbqic7/XEy5FY0RCaIawwX924m3tp9ezmM5DOjldZHoCZLHvXW/BKOCjzgpqYxtu5nN
 t/VA==
X-Gm-Message-State: AO0yUKX9HNwMcb7X7cnPFgVylJkpCwEYlFlU+zxFI88IXyg/Tukj6E9d
 lFbp/3yyVTgOTu1f9jnfjn8g0C5DanHfCn2YkDbwtpoQTrXi+PFD9bHTuWrbYIZ8ml2lGlqECds
 O/Fl7jxyu6pJI
X-Received: by 2002:a05:622a:387:b0:3bf:a5fb:6d6e with SMTP id
 j7-20020a05622a038700b003bfa5fb6d6emr9928378qtx.29.1679053035491; 
 Fri, 17 Mar 2023 04:37:15 -0700 (PDT)
X-Received: by 2002:a05:622a:387:b0:3bf:a5fb:6d6e with SMTP id
 j7-20020a05622a038700b003bfa5fb6d6emr9928345qtx.29.1679053035111; 
 Fri, 17 Mar 2023 04:37:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 t4-20020ac87604000000b003bfb6ddc49dsm1408726qtq.1.2023.03.17.04.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 04:37:14 -0700 (PDT)
Message-ID: <0f65997a-9b35-6e41-3960-c5de6ac13ec9@redhat.com>
Date: Fri, 17 Mar 2023 12:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 02/11] hw/arm/smmuv3: Update translation config to
 hold stage-2
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-3-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230226220650.1480786-3-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NyMI4s08rRmm

Hi Mostafa,

On 2/26/23 23:06, Mostafa Saleh wrote:
> In preparation for adding stage-2 support, add a S2 config
> struct(SMMUS2Cfg), composed of the following fields and embedded in
> the main SMMUTransCfg:
>  -tsz: Input range
>  -sl0: start level of translation
>  -affd: AF fault disable
>  -granule_sz: Granule page shift
>  -vmid: VMID
>  -vttb: PA of translation table
>  -oas: Output address size
>
> They will be used in the next patches in stage-2 address translation.
>
> No functional change intended.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in v2:
> -Add oas
> ---
>  include/hw/arm/smmu-common.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 9fcff26357..2deead08d6 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -58,6 +58,16 @@ typedef struct SMMUTLBEntry {
>      uint8_t granule;
>  } SMMUTLBEntry;
>  
> +typedef struct SMMUS2Cfg {
> +    uint8_t tsz;            /* Input range */
nit: Size of IPA input region. Called t0sz
> +    uint8_t sl0;            /* Start level of translation */
> +    bool affd;              /* AF Fault Disable */
> +    uint8_t granule_sz;     /* Granule page shift */
> +    uint8_t oas;            /* Output address size */
called s2ps. if you don't want to rename you may add this in the comment.

I am suprised to not see S2R which would match S1 record_faults.

Also without further reading we can wonder wheter the parent
iotlb_hits/misses also record S2 events?

I think we need to be/make clear what fields of the original S1 parent
struct also are relevant for the S2 only case.
Maybe tag them with a specific comment S1-only or S1 | S2. It may be
cleaner to introduce a union and common fields in the parent struct though.

Thanks

Eric
> +    uint16_t vmid;          /* Virtual machine ID */
> +    uint64_t vttb;          /* PA of translation table */
> +} SMMUS2Cfg;
> +
>  /*
>   * Generic structure populated by derived SMMU devices
>   * after decoding the configuration information and used as
> @@ -77,6 +87,7 @@ typedef struct SMMUTransCfg {
>      SMMUTransTableInfo tt[2];
>      uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
>      uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
> +    struct SMMUS2Cfg s2cfg;
>  } SMMUTransCfg;
>  
>  typedef struct SMMUDevice {

