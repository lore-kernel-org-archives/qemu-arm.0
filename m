Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5EAC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed,  6 Aug 2025 17:11:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ujhdM-0000J2-6z; Wed, 06 Aug 2025 13:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ujgXN-0003qB-UF
 for qemu-arm@nongnu.org; Wed, 06 Aug 2025 11:58:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ujgXL-0004FS-Aq
 for qemu-arm@nongnu.org; Wed, 06 Aug 2025 11:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754495921;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XQ2l8rbNCrdGaDdUCyrQIuRiDqEktXznMl3SirioDtQ=;
 b=MKrK7zVIYAb9pW5oGl+t8WftywLGs/oX9cT05KYo9jynReuvzgX+z++GdVz4jXccK6frIc
 Bn2imnhwww41INoJLOzDiIAE8aUZbxTWY7sWrlYietgtSsMjJEtD6wkKzSFruhHUno+XmP
 J6SfzEdFYOrGg6+7iqGH0X8BODt+mbo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39--ld-MlIpOi2GVW_vm_QQuQ-1; Wed, 06 Aug 2025 11:58:40 -0400
X-MC-Unique: -ld-MlIpOi2GVW_vm_QQuQ-1
X-Mimecast-MFC-AGG-ID: -ld-MlIpOi2GVW_vm_QQuQ_1754495920
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b06b67d99cso1236811cf.1
 for <qemu-arm@nongnu.org>; Wed, 06 Aug 2025 08:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754495920; x=1755100720;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XQ2l8rbNCrdGaDdUCyrQIuRiDqEktXznMl3SirioDtQ=;
 b=a9+Y5cOYUI8qYydqmgI1AxpmxcA5S3gPtmfqDF/wrLGmUFsFMvlOoqsh6TA9ubEtkt
 BMH4Dk1T6jZ+xxrtlIeb3fOShHyu5Cgy2hntnrq/T0ncjhQd1IqdvRBlbrtnx+iUtmkG
 Y03QbhwEdd1RJ/2CWKPVhVSIAdKbcjs6Vj0eNadFTAWD99vIU6X5wN099ZjJedRqrBPY
 kw2X4GQs3v9TzN0mtmeugRQZJfli/kVQn/tsYNgtZvLLlWDG390Ce2iNM44v7xwbsE7i
 7kk3Sj171YsiKT1UuFoVBS36oImcpriPBfwAsjcSx5zKdVTW2Hd/7CJ3lP5riCQQ+8gB
 0ypQ==
X-Gm-Message-State: AOJu0YzjH/jqEhWBLxQ24dUo7Ok02EDYgJkZt4qH3bomsssx1uTaS2pG
 88o7joe+TZiB+LADrqYBRxXIpv+d6QbbejB8zDqsiDWl7xLp3eBzoLomdeiuiQ2Z9bRHa+yYdc4
 KRFWgsNbmIALUQ7rspkb+Ea5rTv/Ewu6Z+NLn8pwrl8ctFCBWXBOTjg==
X-Gm-Gg: ASbGncuZmHIAyB4PuaqNlqLfYcNmDJL1/cKjSA2WNK4Is6xbkPRcBib2tiwAEgaZMmI
 aUie/ZHDNuWImWAi6kIyqds+5p8QfrAEhaF9z8IQhNqxpon/1iL28PyJlcfNc7ohZFfBRIXslr4
 UZf3fC9ijGoEtCa0zdeqUBv/GF80jsce0IBI/rhX9yGVRt54OhdbHt2ny3zOA3lBvOcsBCcIv87
 HlMeAAES6IfRFmtnK+W4CGFbd1jZqO6LHdo5rBBj7yR3nxVLerOCclkG+zcxZnxHl/S7IaA6eQ8
 k9cNnZVXmxeAw8jrRc4urEmHURKgdm9XvDTFjAbPLIuK
X-Received: by 2002:a05:622a:1f97:b0:4ab:9586:bdd9 with SMTP id
 d75a77b69052e-4b0915f70efmr61351431cf.56.1754495919667; 
 Wed, 06 Aug 2025 08:58:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa1Ulkz2YxhR8EOuU6ZXPPtp1giJRP/e0/mJP0Qd6KUk+U0glq5PijgXEQPZ3EamRvYsIedQ==
X-Received: by 2002:a05:622a:1f97:b0:4ab:9586:bdd9 with SMTP id
 d75a77b69052e-4b0915f70efmr61350861cf.56.1754495919204; 
 Wed, 06 Aug 2025 08:58:39 -0700 (PDT)
Received: from [192.168.43.95] ([37.166.28.57])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4af230d8a21sm49389101cf.51.2025.08.06.08.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 08:58:38 -0700 (PDT)
Message-ID: <c8721e0b-58e7-43e7-beab-410de5aa5486@redhat.com>
Date: Wed, 6 Aug 2025 17:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.2 0/4] vfio: Remove 'vfio-platform'
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20250731121947.1346927-1-clg@redhat.com>
 <22bb66b6-998c-4cb9-a16b-386ff88bb197@redhat.com>
 <0a634c90-847a-4b75-b36a-bca923527060@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <0a634c90-847a-4b75-b36a-bca923527060@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cEX852vZARHfAosapHvdMEfM_d3Tlsguq6i988XWyWM_1754495920
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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



On 8/6/25 5:54 PM, Cédric Le Goater wrote:
> Hello Eric,
>
> On 8/6/25 14:51, Eric Auger wrote:
>> Hi Cédric,
>>
>> On 7/31/25 2:19 PM, Cédric Le Goater wrote:
>>> Hello,
>>>
>>> The VFIO_PLATFORM device type has been deprecated in the QEMU 10.0
>>> timeframe. QEMU 10.2 is the time for removal.
>>>
>>> The last patch moves vfio-region.h under hw/vfio since it no longer
>>> needs to be a public VFIO interface.
>> "tout ça... pour ça!" as we say in french ;-)
>
> It was not for nothing !
>
> vfio-platform explored device passthrough on DT platforms.
> It had limitations which were difficult to address without
> common FW specifications to expose devices. The result is
> neither good or bad, it had its time.
>
> However, the wrong choice would be to keep unused code in an
> upstream project. This would be a burden for the maintainer
> and the overall community.

Yes I totally agree. Especially in this situation where we cannot test
anymore.

Thanks

Eric
>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>
>
> Thanks,
>
> C.
>


