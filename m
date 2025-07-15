Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0417FC83F21
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 09:22:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubbrq-0001fp-OF; Tue, 15 Jul 2025 05:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ubbrT-0001Q1-QA
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 05:22:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ubbrQ-000241-HX
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 05:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752571323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oR1PDVnZhgu3pT7GkP3NYWwwEvK29p9dkZG1H3mvDLI=;
 b=Ncv6peGbF9jVrsx2zP48UhQOs1QLQmGxs/cegVvgI+8aOWp6fDUx2P5oHBsEutIPEeHmWx
 gup3z/+maffk+3G50kOjrp/Tc4+sg0gY/5qFQdRyLHQNZgND9H42wB1rHwmWWUOTGAN6wM
 w3rfimAHIvZk1SIrvUl+3OZYc5TZljo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-CNIiXot4Nqis0R5FYXwfaw-1; Tue, 15 Jul 2025 05:21:59 -0400
X-MC-Unique: CNIiXot4Nqis0R5FYXwfaw-1
X-Mimecast-MFC-AGG-ID: CNIiXot4Nqis0R5FYXwfaw_1752571318
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45626e0d3e1so4817235e9.1
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 02:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752571318; x=1753176118;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oR1PDVnZhgu3pT7GkP3NYWwwEvK29p9dkZG1H3mvDLI=;
 b=h1AQs2tXhtksAzHOGpJ7LN94v8pGMVb7Ry1s/gry2mGqpnLiOG8SaN55w3tDUc/9Ox
 L6O+n/lLgcnXsZ3Z5eoikqqSbFhUEY0MH2I8303uO65IEohaWCWafprY8luA1H2VWi3k
 J+q2GFNqnNJ/dPS16o58dJS4gxavU75wReNUT7tDKEADYoWIxnkFXO8CSkTGD269HRTv
 dbPJSwW/JCOY6RHKFNS35yykSqqaisYjS+84mnqRA4/0fBlkRAclrK4V/u1/EuEMxpr8
 NrN7IdlL1W+5+FKHVnSPJxpxMZTSHe35zo8qYKzZYCPf5uw5CXwPVNnmKQmuorC4ENMy
 lH8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwMnE2FOSSwLSS+XF7fXKv2wX8AeYohq+2AeIRLWC/V/UmpRrZEwllI9nZ71kX+NN+ICJ03dtwWA==@nongnu.org
X-Gm-Message-State: AOJu0YxCNT6s8pDCvI8UOz+4vRplZzlzPXznV0LKMOtS7kRRR0ypqSqS
 I66K6bFfSCYncO7m7Flg+oTHizh+Vg8wxlhyjmohcxBRxKKYYVrSDipkDEqD4M8d32ZnSsgb6aF
 9ZhstqKsdjHGLtGgGoasw3WwMhuA9Oyeet2qvF/170TOYT1mU4m2k2A==
X-Gm-Gg: ASbGncvdQyVqU6uq/4VStegcNPnuNIn9RT3MU3TxiGx44Z6vOfBE8lkllbAfBoPBcoW
 71isWXe3nWc4CrrPj9r5NyhWu+o/PbMnWJMKeW4egxHGi2otqku8u2Qxg0S1r7gxR4yMnrfA2/q
 i7NU4XsNJvC7w7i7+3Xlw17YtqbDxKx51GGNkNequ1Mjb17NE2wizhCni41mvfZCqSM2qenLpcF
 VOL6QdTs6RzUVC4EL5WDhTd+f2ReVLbvU2Lx2WYfVkL0MJhVCZvwuTgLB08kA78V7oiRGiNn7Oy
 PtzuCSDSBJBhbsvhbRtdpHzZYbqGngsnLYywUX2GnMRWyT21Vqlqw+CKa/jSeDEHLbT+OoAVgB0
 =
X-Received: by 2002:a05:600c:8b07:b0:456:1752:2b43 with SMTP id
 5b1f17b1804b1-4561752359dmr71027905e9.21.1752571318112; 
 Tue, 15 Jul 2025 02:21:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF++nvvw00UtxNe1Qn9qPGKQaBlwp6+hvm180RdU8mDHCTmUsoy+mk2rHtY8+qXsI3VrOmEbg==
X-Received: by 2002:a05:600c:8b07:b0:456:1752:2b43 with SMTP id
 5b1f17b1804b1-4561752359dmr71027625e9.21.1752571317700; 
 Tue, 15 Jul 2025 02:21:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:165:d60:266c:b13b:afd7:40fd?
 ([2a01:e0a:165:d60:266c:b13b:afd7:40fd])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm98911175e9.31.2025.07.15.02.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 02:21:57 -0700 (PDT)
Message-ID: <964728df-afff-4e7a-b1f1-f920e6a7913f@redhat.com>
Date: Tue, 15 Jul 2025 11:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] vfio/migration: Add
 x-migration-load-config-after-iter VFIO property
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Alex Williamson <alex.williamson@redhat.com>, Peter Xu
 <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Avihai Horon <avihaih@nvidia.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <cover.1750787338.git.maciej.szmigiero@oracle.com>
 <22e94f25448f9ff42b84c84df3960c4ecc94cbdc.1750787338.git.maciej.szmigiero@oracle.com>
 <9bfa5e01-37a9-4e2a-bff5-264909e0dab9@redhat.com>
 <8a541c48-15d9-4609-bad7-a1606eeff22e@maciej.szmigiero.name>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <8a541c48-15d9-4609-bad7-a1606eeff22e@maciej.szmigiero.name>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mr0zLZ4_zec77TABDacPIQ75tPxiGRADp2VjcscfqXg_1752571318
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

>> Using 'strcmp(target_name(), "aarch64")' is quite unique in the QEMU code
>> base, and to be honest, I’m not too keen on adding it unless there’s really
>> no other option.
>
> The previous versions simply tested the TARGET_ARM macro but commit
> 5731baee6c3c ("hw/vfio: Compile some common objects once") made the
> migration-multifd.c file target-independent so it cannot use target-specific
> macros now.
> 
> Another option would be to move vfio_load_config_after_iter() to helpers.c
> since that file is target-dependent and can simply test TARGET_ARM
> macro (#if defined(TARGET_ARM)) instead of doing strcmp(target_name(), "aarch64")
> which I agree looks weird.

This would look better than testing target_name(). Let's do that.

Thanks,

C.



