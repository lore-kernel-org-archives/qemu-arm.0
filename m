Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9A3CAC59A
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Sep 2025 14:38:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uytIL-0001U6-DI; Wed, 17 Sep 2025 10:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1uytID-0001Sz-D3
 for qemu-arm@nongnu.org; Wed, 17 Sep 2025 10:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1uytI8-0004uy-Mt
 for qemu-arm@nongnu.org; Wed, 17 Sep 2025 10:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758119868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JPRmxZBCOt5PI5/0zz9127e8HUQ7cnCsR458v0MomYE=;
 b=NLCkihzjJQEwnKilhVLFsrFSB+uTBWPEhz85zjxlXy1zp/vyZZGTAV3TU+JjoGgolnCip/
 4vwPvUERcsHuynQtZa+WG4J574BnaZndM6dth9RwsK3WirqgnNToCcVsWEMKGrLRaTlXk3
 mcqmKs/amShKK6baN01TaL9eGi95yJg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-2ZyFdlDHOUm_ej2FLQ1ldw-1; Wed, 17 Sep 2025 10:37:47 -0400
X-MC-Unique: 2ZyFdlDHOUm_ej2FLQ1ldw-1
X-Mimecast-MFC-AGG-ID: 2ZyFdlDHOUm_ej2FLQ1ldw_1758119866
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3eb8e43d556so436455f8f.1
 for <qemu-arm@nongnu.org>; Wed, 17 Sep 2025 07:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758119866; x=1758724666;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+S2zELjQXhN8W8ho4A3qmUQ0PBDOWg8fCH9MkPETMZk=;
 b=Lal6lDTT5SraPPho0VdUUWv3iT1CkuJtMJ/OzBmrr3+o06Rw6+3WfUPtmBX7RWmd5Y
 G35LwItDmjVApSMZBYafU3kffrPBRMnexNEazy9TPy3ppTeNxRHI6UVkvYZGAGRiUzDY
 MRhLMytagvtIXQ/XNtVMBG+mjH9G+OGG2EkYPFNE9uUG8yFJhEnC/V588aOfz1AGlu6c
 yuDfprnH+zMeV4/7KnPXcdhLjuZvUMZRvAo7vO12DBAS4Oh8swpA6bJ22eHaz/VxOHrj
 0h0r+Ib2rpVufxl4Dipx7Ru2ZjE6w7wPGb1GuopwWbmvXZZr2/Hb2NSYBnMTgKoT82ap
 c/ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrUow4O9ncd8x+1LI9SG5jERWwEdFM/9zEOfnMIN4WAygoOIBSXGfDoDTMIL4eEUh5K9wYbHNljw==@nongnu.org
X-Gm-Message-State: AOJu0Yz97qG8HtYHTgoOh2GqZsC3k0C/XJL2f7Gn+qw2uDi1XptP3gAx
 Tdw1ul1Ew0su+gDINOblME/N/SDJfvupFY6GkuXLBikkr8zduCfrY1i1WA3QEBF7jxe7riaR4VQ
 rCInlnGRw7/ddFGnk3fVdKyibvgp5lfWP3l4YV+z8UQcQAUu3JmwJ4Q==
X-Gm-Gg: ASbGncuXD9sT19cAZ31wlPC5UCsO1xD1wfXmlKdqLvOktBFr8VKOsSGF61+svi0UkN2
 3nwmUhCqv2XoSvauoHsQJcC+xkNt+X4Nu5ZR752AmrU/TTDBuQtEu8tRv/PCO4VjKVeiuQ5UYwN
 fbcNUPoEQfKHCfsuPa5MKnqntf35vJ8xy3h4GZKE+X/odI8nxw7rLOKvT57+5/dIXbE20jfMxhS
 YhcVDiv75/3I+1e1JwNL3xd0rEWzLfnM0XAJEGNdu2y8+aZtoZ5FWbGZ7/LaLiMa9bg3v2RMufU
 bPxs/FUkEeMR83ZXLf4Wptqsirn16TS3TYhHYu/K2ZMhHKX3jSX1ES7dMtVCV6itcYQ20nmCnd6
 hBEfcdZjdQ5PSdg==
X-Received: by 2002:a05:6000:2001:b0:3cb:e47c:5e4e with SMTP id
 ffacd0b85a97d-3ecdfab770fmr2370291f8f.24.1758119866341; 
 Wed, 17 Sep 2025 07:37:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCGdDvwfq3DdOCYdSuLAihGFybzYZFT/FRVA8fbItbvq3JTQ+2TdKs6k0cZwSaI7H8hDP+UA==
X-Received: by 2002:a05:6000:2001:b0:3cb:e47c:5e4e with SMTP id
 ffacd0b85a97d-3ecdfab770fmr2370263f8f.24.1758119865807; 
 Wed, 17 Sep 2025 07:37:45 -0700 (PDT)
Received: from rh (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e98b439442sm15592844f8f.38.2025.09.17.07.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 07:37:45 -0700 (PDT)
Date: Wed, 17 Sep 2025 16:37:44 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, maz@kernel.org, 
 oliver.upton@linux.dev, gshan@redhat.com
Subject: Re: [RFC 1/3] target/arm/cpu: Add new CPU property for KVM regs to
 hide
In-Reply-To: <20250911134324.3702720-2-eric.auger@redhat.com>
Message-ID: <21e612a3-35c4-d38c-4654-e40ceb43874d@redhat.com>
References: <20250911134324.3702720-1-eric.auger@redhat.com>
 <20250911134324.3702720-2-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FGYUHPBrKLsUkrQIF-51F8sm4maUsM4-edF-W28iFb4_1758119866
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463806286-242013003-1758119865=:19637"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463806286-242013003-1758119865=:19637
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 11 Sep 2025, Eric Auger wrote:
> New kernels sometimes expose new registers in an unconditionnal
> manner.  This situation breaks backward migration as qemu notices
> there are more registers to store on guest than supported in the
> destination kerenl. This leads to a "failed to load
> cpu:cpreg_vmstate_array_len" error.
>
> A good example is the introduction of KVM_REG_ARM_VENDOR_HYP_BMAP_2
> pseudo FW register in v6.16 by commit C0000e58c74e (“KVM: arm64:
> Introduce KVM_REG_ARM_VENDOR_HYP_BMAP_2”). Trying to do backward
> migration from a host kernel which features the commit to a destination
> host that doesn't fail.
>
> Currently QEMU is not using that feature so ignoring this latter
> is not a problem. An easy way to fix the migration issue is to teach
> qemu we don't care about that register and we can simply ignore it,
> including its state migration.
>
> This patch introduces a CPU property, under the form of an array of
> reg indices which indicates which registers can be ignored.
>
> The goal then is to set this property in machine type compats such
> as:
> static GlobalProperty arm_virt_kernel_compat_10_1[] = {
>    /* KVM_REG_ARM_VENDOR_HYP_BMAP_2 */
>    { TYPE_ARM_CPU, "kvm-hidden-regs", "0x6030000000160003" },
> }
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
> target/arm/cpu.h        |  4 ++++
> target/arm/kvm.c        | 36 ++++++++++++++++++++++++++++++++++--
> target/arm/trace-events |  2 ++
> 3 files changed, 40 insertions(+), 2 deletions(-)
>

Reviewed-by: Sebastian Ott <sebott@redhat.com>
---1463806286-242013003-1758119865=:19637--


