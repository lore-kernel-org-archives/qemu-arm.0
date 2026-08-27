Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95FBC61DC6
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 12:09:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzYvQ-0001Zf-7O; Thu, 27 Aug 2026 08:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wzYvP-0001Yr-7t
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 08:09:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wzYvM-0007wm-TS
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 08:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787832579;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PgeeWjtfQltgIjCPzXNpTJTj8fAdJm1l7RIL8AatcnM=;
 b=NKKhANAdt/ZdIFMnZkKh11P9dSsaJi/PKotyttMqURRrAnzXzm7EEBPyN3y/pZ4LtbhEEy
 dhk15dtcwCvyatYDuDGmGqXjClYuGrsHRm9bE/1UYzF5DRC18Xo6pu4LN7HfUS9EreZCnm
 icuTO+BYSS6pDOVQB9Wy/ubG41kMkts=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-_vYdpOyWOUmZF3FuJCUbgA-1; Thu, 27 Aug 2026 08:09:38 -0400
X-MC-Unique: _vYdpOyWOUmZF3FuJCUbgA-1
X-Mimecast-MFC-AGG-ID: _vYdpOyWOUmZF3FuJCUbgA_1787832577
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-495474a5fbcso18393345e9.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787832577; x=1788437377;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PgeeWjtfQltgIjCPzXNpTJTj8fAdJm1l7RIL8AatcnM=;
 b=iCZloRQngflJSB28955f6g6A+To2bmTzx0ylo/tded5Y7l+w0vZ8v4wMLmCDqQD1Qc
 1pFU0Sojr/LKPhqCbjuxund9/kyxcIDP3LyYIyMzePnA5vtICZRQ+kKEi+9UqjK/cGOM
 Fd0t/VgSHyffIHaXaJdVOtU1F+2+UvMDmkxTSiNVuqOfqpxnMhP29xiTY+0FDMkwi2Al
 RULVls+05oOtC1niMb3Q21Pu9RbB/4aQXUxtZ5ydObd4cJfO9xGDwd1XudCvZe3n1/Ol
 Mcyam7e6dDSPMe0Wy51h7h0YdZaO5/h6FdO7rMfViJcUsqyShVfwU8wiGlCx2cKu47Mu
 ofKQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrdJ/knTWyZwgzMcgMiRLX6zikXWL6niadAZS63aOVz1yBPX8jQbRy4XrKamWQGHw5rL8aPWdqrPw==@nongnu.org
X-Gm-Message-State: AFuF++nzl5iyMCZR/8qG18p7fF86PzREv83kzwnKrIbl1jqWRe63JvtY
 PZtFXHjmz3mAdluPGKbTPNeqnLc7ymSV236VCnkg3P99Qvr3eshUs3FjYIsfjKg9/oml/8Ht95o
 GyCsixcutmrGxVsxFrgfMn5dkqzGDYdd4b2BcxnNyivizSpXBXMM/mw==
X-Gm-Gg: AR+sD10Rt4BFDW4apY8odx8eV9jx32opNGQfyl9dD8IBsqF1ADQ7sqRGtxJMDFa70/U
 6MqZp/ibmrbTWa8gFpMXKW05fKCEePTiH8kEd80jI4/M7/HlhFHm4FeNYq/xgSw3tRBAE+YDml0
 OBv1593POb4A6nu/fCjd2SFSYJ4TPdvG4lFz4YsrUjv3cyZkHiARrhushUB8PydtgkSBLdnKOqd
 j8U+UmlYcfNPZ5LQEnuqyHr0/b2i8G57TcbDh2gyMZE4un0Pa4ktSYXGwdWutGD6X/nqrl8dSjc
 qvzltPkz3Fmb10SfcV8X73DWrafkpUMegmcxMebqZfWGaznim73TBNmQ59m65x0JApdWJR041Jg
 k3GyDaGCyOcw63D41TeMumSVXD34ZetdNWj/P7hIs4uhbr59l
X-Received: by 2002:a05:600c:6912:b0:499:cd34:100d with SMTP id
 5b1f17b1804b1-499dc703bd3mr187757435e9.7.1787832576809; 
 Thu, 27 Aug 2026 05:09:36 -0700 (PDT)
X-Received: by 2002:a05:600c:6912:b0:499:cd34:100d with SMTP id
 5b1f17b1804b1-499dc703bd3mr187756495e9.7.1787832576403; 
 Thu, 27 Aug 2026 05:09:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b49610170sm110944935e9.6.2026.08.27.05.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 05:09:35 -0700 (PDT)
Message-ID: <7eb87bf3-39c4-47b8-804d-15cbbafb78a7@redhat.com>
Date: Thu, 27 Aug 2026 14:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 07/28] hw/arm/smmuv3: Reject secure STEs with stage-2
 enabled
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162446.2806393-2-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260813162446.2806393-2-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 74TcfQFj_6kvz2R7VMlz18bxZfkyT_boVZE6nH-zGKA_1787832577
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Tao,

On 8/13/26 6:24 PM, Tao Tang wrote:
> Pass sec_sid into decode_ste() and treat a secure STE that enables stage-2
> translation as an illegal STE.
some coming back to [RFC v5 06/28] hw/arm/smmuv3: Plumb transaction
attributes into config helpers

why did we need to modify smmu_ptw_64_s2()

>
> The current model does not implement Secure stage-2 translation, so reject
> Secure STE configurations that enable stage 2 and report BAD_STE. This
> restriction can be relaxed when SEL2 and Secure stage-2 support are
SMMU_S_IDR1.SEL2  (secure EL2 and secure stage 2 support)

Besides I don't get why you set SEL2 in last patch
[NOT-MERGE] hw/arm/smmuv3: temporarily enable SEL2 bit and some other
features
> implemented.

>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index b5dc67dcb01..3ff2f498a3b 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -597,7 +597,7 @@ static void decode_ste_config(SMMUTransCfg *cfg, uint32_t config)
>  
>  /* Returns < 0 in case of invalid STE, 0 otherwise */
>  static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
> -                      STE *ste, SMMUEventInfo *event)
> +                      STE *ste, SMMUEventInfo *event, SMMUSecSID sec_sid)
>  {
>      uint32_t config;
>      /* OAS field only presents on NS-IDR5 so we use hardcoded SMMU_SEC_SID_NS */
> @@ -651,6 +651,14 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          if (ret) {
>              goto bad_ste;
>          }
> +
> +        /*
> +         * It is ILLEGAL to set STE.Config == 0b11x according to (IHI 0070G.b)
> +         * 5.2 STE, Stream Table Entry, Page 218.
> +         */
> +        if (sec_sid == SMMU_SEC_SID_S) {
> +            goto bad_ste;
> +        }
>      }
>  
>      /* Multiple context descriptors require SubstreamID support */
> @@ -916,7 +924,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>          return ret;
>      }
>  
> -    ret = decode_ste(s, cfg, &ste, event);
> +    ret = decode_ste(s, cfg, &ste, event, sec_sid);
>      if (ret) {
>          return ret;
>      }
Thanks

Eric


