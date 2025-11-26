Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96797D10F58
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Nov 2025 16:29:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOINq-0004q2-97; Wed, 26 Nov 2025 11:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vOINo-0004pN-9f
 for qemu-arm@nongnu.org; Wed, 26 Nov 2025 11:28:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vOINm-0004f5-44
 for qemu-arm@nongnu.org; Wed, 26 Nov 2025 11:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764174520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oSfhNFwPuydG45V6J/N7CbIn6sQeUQdGTHEazmuSYiQ=;
 b=Re7P7L1+WQDNEffAIYGVHPw4xTeq+FH8s5EX+pY7Hjr/x3Yfbsyc6w4PPpjGTTcF/6Kwbe
 ErrdaHRDrr0TbFFDhU4FAwWGKNeh0Fn9gCiGubhnpY6euQpCTR+KTXBi3YGi5ctKJGn5Fs
 C3I3bqm+oLsaQVWcsiDd9NvZMac/mNs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-hbEGB1x5MmK0rrIH2yKV_g-1; Wed, 26 Nov 2025 11:28:39 -0500
X-MC-Unique: hbEGB1x5MmK0rrIH2yKV_g-1
X-Mimecast-MFC-AGG-ID: hbEGB1x5MmK0rrIH2yKV_g_1764174517
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-42b2e448bd9so8042f8f.1
 for <qemu-arm@nongnu.org>; Wed, 26 Nov 2025 08:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764174517; x=1764779317;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TJdvnOPZS0tH0Udf3ZQJ0GFmrJWE/5g7v4KwoNwxmNM=;
 b=bu6zS5bg4ulh73AB2tdiZjnmszCT8voHgl5RkSlZjDiI4gc3fUP9XHSXXG+/zHtcvF
 C9VCVhC9Mfmye70ri+hSUyzzSwxDHIOMDjLtF9onJWEVRMdNQG680yt6ZbdbPuUUHQaI
 Lv6jBr56qqY949dhr4/v25aN0tPbKU9Di1mquLxK1MQqLJsBv1jZ56ESJ6Ikk8VBU2fs
 Yt1WnfRkYK6DHkW+bB0G8xtuMgAZLaJv3a8BEAP8xIisIyS+Km1DlsxX+xvMUTIbb92u
 VWNdHyPhMNUyCLf5i4noBkNiXRK39QgrubOyQg+6f3T7BN84sDBogrc1VXuAJ/NoIeJJ
 bgJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc71ziAx6lL0Ik2NogpcMSfvwiotYroL/ZF9PsvS+Q9VrrCDoXAAS2upDMaqIgaoyJJju1Zxog6A==@nongnu.org
X-Gm-Message-State: AOJu0YxcrK4oRzks7+YbHSzIXxAOs6q97SRhQN062khNBKmzlHqgaAi5
 pc3FWJguwFAHir4AbcFw8B0lGjvUMw1T6F1Je3o+rpfOq9dikG5zUQzKHDHgfnhG/QsP2Ttj9RG
 MjJT+y2eF3Qq3fKrQwAxwyEtWFn3+KiTbsE8SSfCarEqEd57ye0fXkw==
X-Gm-Gg: ASbGncu1FzQyiZlNxptWfmSZJlHo3883BqelQfTBTUnqGgF005OE8/LQzrgAqGRBe38
 5NtJorMhevsuNokSlyQdViBoQZbEwmScnZLXuoT8PDkYGvppIry5UfbKC4mulTigsOfYy0XOSWx
 DXh7Fo0eKGClJI2BO1K/VftxBm1S2GISyUbCSAlcxHN4RTlpbqJOGTTW2GiSf6Kf5bNXae3KTZ8
 U7zPfa6uGhlQF4xCzXuf3wAJzc17hQvFdX1zAITuKQXlL5qK+DTngqJgekT8AkUP3xHbIdif+vn
 tnSUi/nLP8ZLKfSlDDkGWiKwVwtVOHv3yxkLcN4rHY3KN2fKhezZcRXUU/1edylOV/yhgk0POI2
 NwxjHg1+kwaXShGoCgMlNBIkEiNnBEUAUCLBNiUevPJWpf86n7hUOiHxdpA==
X-Received: by 2002:a05:6000:2c0c:b0:42b:2c61:86f1 with SMTP id
 ffacd0b85a97d-42e0f34a082mr8042814f8f.35.1764174517050; 
 Wed, 26 Nov 2025 08:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIHiBtTEC+GB2idM5msCaHnYuhv/BudNRpMJKHSA2WN1SdtfsBDoXFhWlKh03j+ARnRkne6g==
X-Received: by 2002:a05:6000:2c0c:b0:42b:2c61:86f1 with SMTP id
 ffacd0b85a97d-42e0f34a082mr8042777f8f.35.1764174516620; 
 Wed, 26 Nov 2025 08:28:36 -0800 (PST)
Received: from rh (p200300f6af35a800883b071bf1f3e4b6.dip0.t-ipconnect.de.
 [2003:f6:af35:a800:883b:71b:f1f3:e4b6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fd9b45sm42175143f8f.43.2025.11.26.08.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 08:28:36 -0800 (PST)
Date: Wed, 26 Nov 2025 17:28:34 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, maz@kernel.org, 
 oliver.upton@linux.dev, gshan@redhat.com, ddutile@redhat.com, 
 peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 03/11] target/arm/cpu: Allow registers to be hidden
In-Reply-To: <20251125100859.506228-4-eric.auger@redhat.com>
Message-ID: <d053b75f-1a09-d929-1cd8-9485672cb4ed@redhat.com>
References: <20251125100859.506228-1-eric.auger@redhat.com>
 <20251125100859.506228-4-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kP3yJjXclIwboQvMVagXR3LvBU2DcJ547vZTJdXQYP4_1764174517
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463806286-70621147-1764174516=:22658"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463806286-70621147-1764174516=:22658
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 25 Nov 2025, Eric Auger wrote:
> More recent kernels sometimes expose new registers in an
> unconditionnal manner. This situation breaks backward migration
> as qemu notices there are more registers in the input stream
> than supported on the destination host. This leads to a
> "failed to load cpu:cpreg_vmstate_array_len" error.
>
> A good example is the introduction of KVM_REG_ARM_VENDOR_HYP_BMAP_2
> pseudo FW register in v6.16 by commit C0000e58c74e (“KVM: arm64:
> Introduce KVM_REG_ARM_VENDOR_HYP_BMAP_2”). Trying to do backward
> migration from a host kernel that features the commit to a destination
> host that doesn't, fail with above error.
>
> Currently QEMU is not using that feature so ignoring this latter
> is not a problem. An easy way to fix the migration issue is to teach
> qemu we don't care about that register and we can simply ignore it
> when syncing its state during migration.
>
> This patch introduces an array of such hidden registers. Soon it will
> be settable through an array property.
>
> If hidden, the register is moved out of the array of cpreg which is
> built in kvm_arm_init_cpreg_list(). That way their state won't be
> synced.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>
---1463806286-70621147-1764174516=:22658--


