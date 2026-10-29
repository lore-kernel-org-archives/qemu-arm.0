Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4E6606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LNOoom91
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMOmP-0007vn-Gy; Thu, 29 Oct 2026 07:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seott@redhat.com>) id 1xMNXO-000075-Jz
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 06:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seott@redhat.com>) id 1xMNXK-0005VL-Rx
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 06:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793270344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AWPSUMK7+fKN4RVSbD77BcctC/xguXAzAkCplDxTUoI=;
 b=LNOoom91RdkB2+aGd5mHzQk/1fvuHUglqF4XZV/9I4h1VQA/myVbbSu2asyWLdVL/w96sI
 UJiw/uP6Heq/3LVaED/3nTjVA95DinfHKZL7h0fMz7ilKyTnTiGQm/sgP/0OIh+n4prJBZ
 0/ng0DoRTxpJQ/95GDC1tS8700r/7Yk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-9alCm2BIP0y04_Ir-Btj6w-1; Thu, 29 Oct 2026 06:39:02 -0400
X-MC-Unique: 9alCm2BIP0y04_Ir-Btj6w-1
X-Mimecast-MFC-AGG-ID: 9alCm2BIP0y04_Ir-Btj6w_1793270340
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-495689bfcc8so14034275e9.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 03:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793270340; x=1793875140;
 h=content-type:mime-version:references:message-id:in-reply-to:subject
 :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AWPSUMK7+fKN4RVSbD77BcctC/xguXAzAkCplDxTUoI=;
 b=UDLj4huLYMr7qx+YwQb7SneOB+A1gXt2V7fJ9FXL8i/BleYohj1x7gtR0255N0LXzy
 vc0amVYnp3eT8T3UDWY8d39KKtKnDFs7PeaqOKQDIg99omf4Ty+htEdo9BLPeT905eLw
 PNirbO2p6qsDB+safGRKptakt4vxVtPVZU+1Tq3V6sN1kD4E18lENzddhWjfqAUfU6XC
 yR8SAHxe3gXJXt8GYsITgZHGhuS0lCPUVaXNaI8p6Z1ibkcSw2fF6lUuYZDc1sNU/CBs
 Ln5kmOfgsGrED/LFI+zMiJTyuDXaJ7AauapnEpujkLl8XEoU84kJ2EHbiiLWaGsYucFV
 ekdw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxzPVzQJbDPBPJBCOd61ggz2KKod619LT81wXL6cm7SK837NYCWXW4cyqEXuzJywGhq1nJj+X/rhQ==@nongnu.org
X-Gm-Message-State: AFq9FYJdHgrc7vJubWzVSl92k/V9GIlmPdjCAUq8JvazWT3a+6OYZGgI
 mZT393geY4hYixf3j3Fxg0Edm7W/REqEp1nMnfl9OK0B0PapTDbySKWYKc0jxCg1EeMIuegzd2j
 rDBeifDvAdH4npYsK/RoGxykgD5KyNqmS7QRtZMm+kLeCfg/v0jzxZQ==
X-Gm-Gg: AYBFou3fM/ok+sVVFgLeelP3diCn1PWdhS+1OVPcmizCT0qyAI3d7egkULK7FXV99zb
 JMD7Sq9krT3f+t9OGfa01a1HLPOkKlXGqY4no58lXu+ljdMqOy8x2/iUm8cUPUWkRNzjQHDLyQX
 z3eAfEGSZe2WAuM8uWtEs27VohYcWbDqR56o9suG1xbJYmNvFWbH4bbXipP5y09Ekwk2x71LcyA
 jnrCeeeknhEPQ/CbkxOUZlj32JdMGtJR5LEDz1OITUCDx4h2CQFHpe55o4FRQ34ttwS/miwNZDD
 UY4wmOh+1Md1gVDoxt4THthT41m6JzL5R5obQJXCGbI36/NDY2CxaZcCQxuMv2hGBj8CY0ztqMJ
 Ns0lUyXdgDIBOKa3b6R4vRDG3SkielWvUWbZNgoMneqiaLFyuQPnVDH7H5zhf7k16VA8x9O5NLA
 aXM8J2xQnbnEJ6B7OAv2RJWaHc1IUj91FFs/PMqg==
X-Received: by 2002:a05:600c:1391:b0:49f:e701:51c8 with SMTP id
 5b1f17b1804b1-4a966c41a4emr113043815e9.9.1793270339879; 
 Thu, 29 Oct 2026 03:38:59 -0700 (PDT)
X-Received: by 2002:a05:600c:1391:b0:49f:e701:51c8 with SMTP id
 5b1f17b1804b1-4a966c41a4emr113043355e9.9.1793270339537; 
 Thu, 29 Oct 2026 03:38:59 -0700 (PDT)
Received: from seott-rh (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de.
 [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecdfb8esm33570637f8f.54.2026.10.29.03.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 03:38:59 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:38:57 +0100 (CET)
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
Subject: Re: [PATCH for-11.2 5/9] target/arm/kvm: Pass an error handle to
 kvm_arm_create_scratch_host_vcpu
In-Reply-To: <20261029092307.281287-6-eric.auger@redhat.com>
Message-ID: <a4d2cce1-7d56-ec85-b5f6-13d46537e249@redhat.com>
References: <20261029092307.281287-1-eric.auger@redhat.com>
 <20261029092307.281287-6-eric.auger@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WoQP2r1soJdQVwdfhxPu0kaHy6jqzS14JjsZLais_nI_1793270340
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.129.124; envelope-from=seott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Oct 2026 07:58:15 -0400
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On Thu, 29 Oct 2026, Eric Auger wrote:

> This allows to report a precise error message if any error occurs.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


