Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7198606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UsW1oaTV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMOmM-0007tM-PN; Thu, 29 Oct 2026 07:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seott@redhat.com>) id 1xMO0k-0007JW-1J
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 07:09:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seott@redhat.com>) id 1xMO0i-0001Vl-Ny
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 07:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793272172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bIz7miHbxqX0pgfFFTv1SvuBSW0W9lMwHcNxY+f0UxI=;
 b=UsW1oaTVEuQkyZxkTKbNghH/QPD6n2gRXPzTPk4RKYZHwoEDmz7kR+2yVd4x6LN1rai/oy
 k12R2LsMksL21WSGs7lETx9YCCHtuf5WTQ1fxOqDJV3XDeJZu9ZuwD9OFO+UCG24qW0O85
 EysRzuyF08C6sGrHPJWwh7xvfB1ftxA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-me6SwpMwO2uFmfjLjhK8kg-1; Thu, 29 Oct 2026 07:09:28 -0400
X-MC-Unique: me6SwpMwO2uFmfjLjhK8kg-1
X-Mimecast-MFC-AGG-ID: me6SwpMwO2uFmfjLjhK8kg_1793272167
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-48e0c896d05so1666254f8f.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 04:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793272167; x=1793876967;
 h=content-type:mime-version:references:message-id:in-reply-to:subject
 :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bIz7miHbxqX0pgfFFTv1SvuBSW0W9lMwHcNxY+f0UxI=;
 b=TnZUWvA8Dyi7NhYZO+S/u406j9LCUpYy0x51U0cjfOQoILQle4XBwaGcZf8YeO3nHp
 UN4Lzc6kdf78twTSH84Tb6yXdeZPIhQJ7ZmMJ3hRr5hLeiuZMPsr4/z1l+qJAqGXtcGC
 AEr7cwB8XlnoCHmAxQeJb46YligkmVtBlOzduw2aISswY2s58dMtIj21/UB5w3rsztED
 zItJH8y3UbZN6xkNF6QjTNgHBpnyThp4R7/G8qqFZYJcMPLmREWM1DMcB7Fnhv83QMT8
 iR9GVxc33G0qtgpN84E8mSBh91EJooDHl2QTvFla6TUGjcU9/4bbROZi25cz2j4+ZGMC
 rwIg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxAo/5nbQYGIslgXwsd/bLFl4KN2VYruYR8PgtZbc0eN3kW/tW58TyznlqyOqnlektDod9z6Y+HNQ==@nongnu.org
X-Gm-Message-State: AFq9FYITIPWI7Va8/N4uRmmjLzvk9ZmUQyfwRsYOmgdGTAql6byMjADl
 56hZB3ZHpHKeXC8GWPzRiX/+ofmwegcO+tR7+qAXYX6xVgm75ZJlKW2rU2TFVrtaG/8wjAw9ur8
 sWKuhij9Kpp0cg3mXWVa0i0l9g1JEAzTVgUKqNmmlcxWYr+HaBLKBqQ==
X-Gm-Gg: AYBFou21dCtU3X7OztUj50rZotBFOtmWJqvL8r17jMJL2uW+WDV0zIj5XXVY9TVm3nt
 SBRNFfxdjqmTlP0kQmQ1FM7k4Mok4Cg/UKu6nDJU3tpdbauGG1v5J0f0EJyg3n73djseuYn40Y2
 zAVCgcgvr75IElu34k3mkgkbec/UWBGjdFqU8S3SvM+uy3qjqeuoWgFdvyup3JJMa8El2wu1ttU
 JRG2s+SYNcUUuwBNHMD8RPafAq1VIrJUMPqGS3j0vvRIIwessABojYCjz4zcHBkwYlkQzGaC7OG
 7ZYRhLXtflqDe6SuJ6WnBOGxgTaArY3Zju4W6SMjb+cw3ez8nPQ1Dkdsnst6k3/xH6diF12TI/s
 /AL+jOdM6iSX+RwHGJK8w44PqjQXxR2bVMaoSNAquQaE4hEOJBdrC0Vx2MrVb4X6qi7Mf9uwRUH
 J9C+zXvl7Dmjyycvf0SDi4xWaLqHq/aolF8PW+pVQ=
X-Received: by 2002:a05:6000:606:b0:48b:2a2:31dc with SMTP id
 ffacd0b85a97d-48e5d3126abmr11850038f8f.49.1793272167391; 
 Thu, 29 Oct 2026 04:09:27 -0700 (PDT)
X-Received: by 2002:a05:6000:606:b0:48b:2a2:31dc with SMTP id
 ffacd0b85a97d-48e5d3126abmr11849965f8f.49.1793272166893; 
 Thu, 29 Oct 2026 04:09:26 -0700 (PDT)
Received: from seott-rh (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de.
 [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd8ddasm36749700f8f.48.2026.10.29.04.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 04:09:26 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:09:25 +0100 (CET)
From: Sebastian Ott <seott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, shaju.abraham@nutanix.com, 
 khushit.shah@nutanix.com, richard.henderson@linaro.org, 
 pbonzini@redhat.com, skolothumtho@nvidia.com, philmd@oss.qualcomm.com, 
 7746591750@163.com, maobibo@loongson.cn, harshpb@linux.ibm.com, 
 amachhiw@linux.ibm.com, daniel.barboza@oss.qualcomm.com, 
 milesg@linux.ibm.com, farman@linux.ibm.com, cohuck@redhat.com, 
 armbru@redhat.com, mbawa@redhat.com
Subject: Re: [PATCH for-11.2 8/9] target/arm/kvm: Introduce
 kvm_arm_vcpu_prepare_init_features helper
In-Reply-To: <20261029092307.281287-9-eric.auger@redhat.com>
Message-ID: <c5186422-1631-cce9-9ec8-62b109da2675@redhat.com>
References: <20261029092307.281287-1-eric.auger@redhat.com>
 <20261029092307.281287-9-eric.auger@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WfEg1yETgGNX9N7SPFoMy5aDk8E55HaThxSF3WRpuM4_1793272167
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=seott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Oct 2026 07:58:25 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026, Eric Auger wrote:

> Factorize the code that initializes the kvm init features from the
> cpu settings in a helper. Use it kvm_arch_init_vcpu(). Soon it will
                                   ^
                                in / for ?

> be used by another function.
>
> The only change in the code relates to the check of kvm_state. The
> future caller won't have the VM created when calling the helper and
> for this caller it is OK ignoring PSCI version setting.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


