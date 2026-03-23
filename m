Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FBFF483D7
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Mar 2026 17:42:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w4jHx-0000wb-Ll; Mon, 23 Mar 2026 13:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w4jHo-0000v3-Gr
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 13:41:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w4jHm-00072w-PK
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 13:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774287713;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVeINTbnEZu1jnyqESOHKcjROX7MleixcFB80XhI1kI=;
 b=TqR3lkAnin8Z0+lyjUFxzcLv8gs3l+S69rJC73ud/IHTqq2CAXPrDxrp6fIGp81Bw8dv5J
 t3Hdv3hDnLG4CA9XzM3vTnCvDsFPACXSUMXhm1ZcbV1CUdUxUtiD1Fva+KR0gmyc1v1ex0
 13VVxM5On+pc8FNZs3ZfareI2nYLlHw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-Jz0FldAgN_yEtoGYmdsPhg-1; Mon, 23 Mar 2026 13:41:51 -0400
X-MC-Unique: Jz0FldAgN_yEtoGYmdsPhg-1
X-Mimecast-MFC-AGG-ID: Jz0FldAgN_yEtoGYmdsPhg_1774287710
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-59e16827d49so3905432e87.0
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2026 10:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774287710; x=1774892510;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RVeINTbnEZu1jnyqESOHKcjROX7MleixcFB80XhI1kI=;
 b=QS8bDYS/URhh4Qkvz9vjjEKQIdBfXiO9DmZl1E+4HoyauvBsN/ZDWg+gwsKg12g1xf
 ewtLfN70J6aaokDpZdqsyw0LnobuUhTjfDmV4uCT1P9II4ixs3r/QVLAVATj6Jc7OISK
 AdY4If0JIbFatz/Zrog+bsVQr2G/DotxAFkyXIC6r0pOLwMxWyBD0poRjvFCHuZt0CLe
 0Q4JDIDY7wJ1zTd8hkWF3JFObSzJdm9NV4HxShrdOS4vHa8AJ1pKjDiO6tqd3YALQSl9
 kErF/4R7V1I9o08Nb0L8RUst/ZwfILJkUmLjzJjzMpqxbmAxgPsvSceHPMuYrfw4CibZ
 dTOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEzSgH4nIEc628aUkM5v1UxUKfKe/qFlHtNG0PuX73W2JRxO1rQF+RJlomYnFawMFkT2UhjKu1RQ==@nongnu.org
X-Gm-Message-State: AOJu0YwzGhQlbApdxm3lhGshDIQfDCr+qp3u5Of9QyV8X5qIuYkIhYDU
 7WNw/ZOQJsciIXsIn4364PHG3P3y/6NmAGa3bTbippmfmLijOMxmFZ4PfF0uE0Qn1ohCO1NB4Ne
 JXtDtCZRteTpKadF+lhiAW89HxQmHHGCt6WFG1ZW5g86oViBbOPtjtQ==
X-Gm-Gg: ATEYQzwkR2O4THB4yhw1ciAslKqlHRoTVUmM6hQq3Z2pQtgRChDOGs+lpqL/akvIegW
 2TdKPlJdCIc6eQBkBR8hEG54E2+7dvdQFFBnU5681A4IKv0H9huS/I0hxrsrIExm7rZ2tyJYAmT
 3Ha5Cu8c+lAU5drIvVsxHinMWJJVwZIVMe6wf4X59l6DAUXkHaDUYnufHLQpWxOOc6S6X3vw0wm
 IlmtBkKxrgAqqS9CmfXRYRYTu5ZJGHqZPXZH0O0/4tEOiPx2xMo39CsGVHbJ6LUO1XnUvd6UXga
 0wcm4DAJTJz+uZFfi5Y8m/7cANSIJ1bP19bnmJ2gwfcvP6nrBVeiV9EEFSx4UrE4ZKQfHnkA7se
 yCE7FkqHJy2oBidOknqpvLIwnTZ5wco609OLRbSdSVh8FhBS9VLha10lHusUJorslLm+AGg==
X-Received: by 2002:a05:6512:a8d:b0:5a1:74e2:4781 with SMTP id
 2adb3069b0e04-5a285b68337mr5302947e87.42.1774287710350; 
 Mon, 23 Mar 2026 10:41:50 -0700 (PDT)
X-Received: by 2002:a05:6512:a8d:b0:5a1:74e2:4781 with SMTP id
 2adb3069b0e04-5a285b68337mr5302922e87.42.1774287709830; 
 Mon, 23 Mar 2026 10:41:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a285207500sm2692864e87.41.2026.03.23.10.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2026 10:41:49 -0700 (PDT)
Message-ID: <f440779f-edd5-4802-866f-f4153530c39b@redhat.com>
Date: Mon, 23 Mar 2026 18:41:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] hw/arm/smmuv3-accel: Change SSIDSIZE property to
 SsidSizeMode
To: Nathan Chen <nathanc@nvidia.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?=
 <berrange@redhat.com>, Eric Blake <eblake@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
References: <20260318184907.4060030-1-nathanc@nvidia.com>
 <20260318184907.4060030-6-nathanc@nvidia.com> <87341w9ftp.fsf@pond.sub.org>
 <e855b12b-5e1c-4590-8440-a29155a6c9b0@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <e855b12b-5e1c-4590-8440-a29155a6c9b0@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aT93IzTws6IUHQx86GkRxWQeO2Q3UdI4bC7wnH0MqTY_1774287710
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 3/23/26 6:28 PM, Nathan Chen wrote:
>
>
> On 3/19/2026 5:14 AM, Markus Armbruster wrote:
>> Subject line: please use the literal property name, for easier grepping.
>> I.e. something like
>>
>>      hw/arm/smmuv3-accel: Change "ssidsize" property to SsidSizeMode
>>
>> Same for several other patches.
>>
> Yes that would be easier for grepping - I will change it to use the
> literal property name in a respin today.
>
>> Nathan Chen<nathanc@nvidia.com> writes:
>>
>>> From: Nathan Chen<nathanc@nvidia.com>
>>>
>>> Change accel SMMUv3 SSIDSIZE property from uint8_t to SsidSizeMode.
>> Incompatible change; okay because property "ssidsize" is new in this
>> release.  Spelling out such things out in the commit message helps
>> reviewers.  Not worth a respin by itself.
>>
>> Any particular reason this is called @ssidsize and not @ssid-size?
>
> I'm not sure there's a particular reason - this property was newly
> introduced in the accel SMMUv3 series [0]. Should we include a patch
> to change it to @ssid-size to match the format of other properties?
>
> [0]
> https://lore.kernel.org/all/20260126104342.253965-38-skolothumtho@nvidia.com/ 

ssidsize is the terminology used in the SMMUv3 spec. So I would prefer
we stick to it

Thanks

Eric
>
> Thanks,
> Nathan
>


