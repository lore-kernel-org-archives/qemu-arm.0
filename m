Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA37CCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 14:29:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDODU-0001XX-HG; Mon, 27 Oct 2025 10:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDODS-0001Ww-IC
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:28:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDODK-0006JG-Em
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761575324;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q4+oj4RF7lNjQEMmYfNeix7T+L5tROC8e7rGvjg4KYw=;
 b=cZfRQXuFtrWUUA+i+mNaimiGRmI9397c0QJba8gfPnXhvbyKrJYeCGhZUOv1jCE22Qe02c
 CLW3e3RPtyEXgFayTwNsvB9eSB0OeOhz/n2wmh7/luTHOqPdznsNrxzovewXpAV4w0+44x
 D2o8utdEYcZScqogbOLU0g7p0EFzIKw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-qUakZp2dOZ-EtbCveYX8VA-1; Mon, 27 Oct 2025 10:28:41 -0400
X-MC-Unique: qUakZp2dOZ-EtbCveYX8VA-1
X-Mimecast-MFC-AGG-ID: qUakZp2dOZ-EtbCveYX8VA_1761575320
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-426d4f59cbcso3688869f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 07:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761575320; x=1762180120;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q4+oj4RF7lNjQEMmYfNeix7T+L5tROC8e7rGvjg4KYw=;
 b=mbMNfQjQFcJabvQ/j/uAfO4L6aXKEAWlZfTo4B1dsFiUyVgPoGgGTSzogWz5JBXztb
 YGvzpjnqnBFn7FrdmjkaH7Jl/jSoPrHPzkZ8Elwz3B6FIUAqRc+m5WZrU3H/y44LGrP3
 Ny1pncsBcJ++HZelJi1vM/uzi6/BdVY1Nw+V5Ogkk9n3sntaC3RWfd5sI+VfZNX/cdmR
 xegQQCsJx+l4jeuLgXF2gdWzYGVo9BB/gl9UpOo4NWmHPsW22/coGcTR60seukIiliUL
 Mr+QLgXA+7lq91Ht+ruX61VS+7/WVRvGGnbZaJR9nD06Llkpazy93NAUrFaa3dbcjxH4
 kODA==
X-Gm-Message-State: AOJu0YxMUOw07GX6lFBqJJhgx0AUcGuJiexPdwdfHa8XmlXvWKn4j8EC
 b2CB/796ym9RNajVQ/+o9jBXz/GzGZx5EyTecPtPOaV7BuicwrKaOuNZflKChwjBIgXcz8jMXje
 dnon//apcLdNc/nJwtgwMvkRJkNbz9KGmhY2OeLEaVJ9ctxxwu4nCOg==
X-Gm-Gg: ASbGnctbZ4w6BFvb3BWjGbk9s4ePChWBvhLhuRYvcFzmn2qLJb4HYcbORUSJJq+5omV
 lfYTMtLYld9CwHTbsHGVoN957AsZAWvqZLfxg8gJpCjWD+fuh0K/sSD3rV/DT4zsdTc2F7ZiqCA
 c5MV5eFapr80WjVsiHoJoLXt7BUZ2cUUCWKUK2AObEfteS4lSwiW42YLi38RAoCrI2d286X3cfR
 Qf7mt8+DUSo8YzpIrqIVo7Ah6vK79AFwUYKRRNQwUJgAodf91ortQ8glmH0G1leJI/6YGRAJFpf
 Fjv5egeF9L8A1td5yT+N3KS083XpsKMfsQAosGxMgema34a3iUaYE2h0WTArwNDaZdU7GU9z/N9
 5sbGxCfKx20mNulZ6sboHXoNK+zp2Dt5A2NhIoyYo+P3/yA==
X-Received: by 2002:a05:6000:2889:b0:429:8b81:5ace with SMTP id
 ffacd0b85a97d-4298f524747mr10425455f8f.7.1761575320437; 
 Mon, 27 Oct 2025 07:28:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbtJ6M7YWlvGTI6v01WaD3B/yhhPZCbLU2kCCJd6Y4IFSLl5K6DGThwW6QpxjUIxjZF35BLg==
X-Received: by 2002:a05:6000:2889:b0:429:8b81:5ace with SMTP id
 ffacd0b85a97d-4298f524747mr10425423f8f.7.1761575320075; 
 Mon, 27 Oct 2025 07:28:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df62dsm15794354f8f.45.2025.10.27.07.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 07:28:39 -0700 (PDT)
Message-ID: <236ab7f6-3296-4ea4-80a8-a1d7bf08c73a@redhat.com>
Date: Mon, 27 Oct 2025 15:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/27] hw/arm/smmuv3: Add accel property for SMMUv3
 device
To: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-21-skolothumtho@nvidia.com>
 <aPFoIcxQnOrQVNTE@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aPFoIcxQnOrQVNTE@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T2AE0mcbT92u4HvMoTbtI8sZgLOCisrupWwuLzzcQ9g_1761575320
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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



On 10/16/25 11:48 PM, Nicolin Chen wrote:
> On Mon, Sep 29, 2025 at 02:36:36PM +0100, Shameer Kolothum wrote:
>> Introduce an “accel” property to enable accelerator mode.
> Looks better with ASCII quotation marks: "accel".
>
>> Live migration is currently unsupported when accelerator mode is enabled,
>> so a migration blocker is added.
>>
>> Because this mode relies on IORT RMR for MSI support, accelerator mode is
>> not supported for device tree boot.
>>
>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
>
>> @@ -67,6 +67,7 @@ struct SMMUv3State {
>>      /* SMMU has HW accelerator support for nested S1 + s2 */
>>      bool accel;
>>      struct SMMUv3AccelState  *s_accel;
>> +    Error  *migration_blocker;
> No need of double space.
>
With Nicolin's comments:

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


