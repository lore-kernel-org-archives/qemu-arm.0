Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D07FEB3626
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 17:18:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx6uS-0001GE-JO; Mon, 02 Mar 2026 12:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx6uQ-0001FO-RY
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:18:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx6uP-0007kP-GZ
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772471896;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dpxjjh/gF6uN1WRr/chSKettRcQBHQ1QzKI2hWN0Ehc=;
 b=P8KB4/13IQMRG+ZJ2CdglwJWE+ordySNnsiJC0MYT2L11PmWYjLQoKay1FpL4ZqmvkfSPP
 L05w1HSxW5ZuXqiCyZFyTw9VdlwfzvzWLjJ7rcpwLoLz8MU7RJFwBRZYSm58XhgJw6grJF
 yczKcQfXs8Dw0cucHKyNJMGaudEWzyI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-gOvlmca3OBihh8FxJD5Hdw-1; Mon, 02 Mar 2026 12:18:13 -0500
X-MC-Unique: gOvlmca3OBihh8FxJD5Hdw-1
X-Mimecast-MFC-AGG-ID: gOvlmca3OBihh8FxJD5Hdw_1772471892
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4836ff58111so47660355e9.1
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 09:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772471892; x=1773076692;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dpxjjh/gF6uN1WRr/chSKettRcQBHQ1QzKI2hWN0Ehc=;
 b=L5LFrT3wjoua12R5CB4ZyjxSjutZOgoxydJpmBvTKcYS3noZm77rSx1HbQ/1uwPdIG
 tILkH18PYgEymIqrm1Y2WDghXwpMzSDznBoPEKDp2eSVM58e3E7aMN62BAS5Lr1tnK8S
 8O+M4ZLMUIPbGEAsgI44KNbFfXGA5dWay8Y0HldjknCdA2AKCDd2RHye+esCqEq0KDTj
 iHCANqa1iyo3WYO/GxTOe/GzxUe6ODg5o93aW7a8uWE0JnxbaKPYZVzmlHLbhtFdE4zu
 Cmj+kLicaRiyfnCY40MfrcJ4qCjaK9L9NnHrHHr3kc/qszuOaoTRf6tyNVH5wnxiiBdY
 Pftg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBtWOyl4CxPTsZzoaKcX+tnippAEGC/r0zKSTdutHEXga8SBGg037/8/HGbDMcNb/jnFbN+X/GDQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyx0A6taEcGQU49DUl2U5mO6ys4NO+4Jr7jEH1ceky8FBbFrG3F
 /FwkhHpjlnj2zODscWzCKnG7vhNGj+gVPewbAeO6HhNhiSmcR3tHZYebgwNXDf9lFnxIbDsdrR0
 fOtsnkdWkBeJCvPvy9q7hX0z0EWFIZp6W0dVVpU0rFOVYLnn1nieYWw==
X-Gm-Gg: ATEYQzxZJl0u3oE16ex4xb956dsA0ZJbiQEHWC9LVS+qpMKJ59D8SxfCOswBE7kd7zj
 V5A5mHgT0wuyNJKQDmdb5w1ug0+W1Dhu95Nz8jLfWgtDg7qbwqQZatkSjG59HEer6pGhrT301Y8
 AYfF90wT8uI/zuqRgHsAcdhMyjPlXujK/DWxtQCbIaKVuW9U/r+5rotXotEXuHcYhBb7J9mHrTo
 MYMaHPpZSCk3CX2/ItykMLTEsfCwrnZeQgClWK8mIV7h4doPUecdsjhyU7P/bPjtmpzYiT0bW0+
 7pq+J2JCDdmFx6sQFpsfy1aVDuQJaCQGNVe+jrCDb8cYun32NgbGZ/h4SoW6zbIetlfX7qJeVpL
 3buKT6EfaEWUC4F71qqGgPjfg7klZpEx4O9EistXcGoLHfjK/ijDFIbe8g3LUysCLbwXzgw==
X-Received: by 2002:a05:600c:c490:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-483c9bb1fb0mr217025925e9.10.1772471892039; 
 Mon, 02 Mar 2026 09:18:12 -0800 (PST)
X-Received: by 2002:a05:600c:c490:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-483c9bb1fb0mr217025315e9.10.1772471891494; 
 Mon, 02 Mar 2026 09:18:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb8724bsm171157845e9.11.2026.03.02.09.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 09:18:11 -0800 (PST)
Message-ID: <f41eb7d1-9287-49f1-9eb0-c2eccb07b394@redhat.com>
Date: Mon, 2 Mar 2026 18:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 12/31] hw/arm/smmuv3: Store CD NSCFG in TT info
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101632.2993305-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260221101632.2993305-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ee6Jf_-peJ9gi0vlg_8wEJ6ouIkAL3mUqaNAGokHe68_1772471892
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.968, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.495,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 2/21/26 11:16 AM, Tao Tang wrote:
> With NSCFG definitions in place, record the per-table NSCFG bits
> in SMMUTransTableInfo during CD decode for later use.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c              | 1 +
>  include/hw/arm/smmu-common.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index aa1a95a0093..b8f2fae9a1d 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -838,6 +838,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
>              tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
>          }
>  
> +        tt->nscfg = i ? CD_NSCFG(cd, 1) : CD_NSCFG(cd, 0);

tt->nscfg = CD_NSCFG(cd, i)?

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>


Eric


>          tt->had = CD_HAD(cd, i);
>          trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
>      }
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 9e44c9f7710..bd88e599c77 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -83,6 +83,7 @@ typedef struct SMMUTransTableInfo {
>      uint8_t tsz;               /* input range, ie. 2^(64 -tsz)*/
>      uint8_t granule_sz;        /* granule page shift */
>      bool had;                  /* hierarchical attribute disable */
> +    int nscfg;                 /* Non-secure attribute of Starting-level TT */
>  } SMMUTransTableInfo;
>  
>  typedef struct SMMUTLBEntry {


