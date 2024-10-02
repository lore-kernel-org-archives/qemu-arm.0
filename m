Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp825047njl;
        Wed, 2 Oct 2024 06:46:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWC3GltSJvG5PLA0ooVFxqh/BTBxy2wXE2Txw8IPb5SfYrQgCU7/SDwuLeuyRdrNNWTUodVcxUAzUIodA==@linaro.org
X-Google-Smtp-Source: AGHT+IFum/3HwHee0nLsHKKJi30EhHtXI9oZZt7quvX3Zwd5DRQnPZxtlbPSA19X+qVs4AybnPju
X-Received: by 2002:a05:620a:c41:b0:7ac:dd88:cc80 with SMTP id af79cd13be357-7ae5b8062d0mr1091484085a.8.1727876761043;
        Wed, 02 Oct 2024 06:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727876761; cv=none;
        d=google.com; s=arc-20240605;
        b=j26158V5ScyQ5bJitb5A6zIDsq7ZWVyEEiS+NeEeSEA3f0OFijtXq36fQmcaTpA3OY
         wTe6kA26UbFyYOJojLuUFMcX70Ci1vXGrRRTqwVgvOj2sRgRe3s3Yq/mPb2g6xn9eeAB
         +bkeUzr+RqS2avkW8JaCaPZ9QpaRfXc46oKXjCLGLc1B2HZgmk4jB6+HxlrQP7hHulDZ
         H3gtyBblqY/vpHIdsitSz+70L12pYhkBtGNUtVBX5fPm0SK39NjvhTbnxNTTN+eX6GmJ
         MEbLwr11DCm0ikItRaandMWCdLlFcsMOAHQDlMeWyTcBFq+BTcbzkL8lc6K/4t+CMol6
         v6Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=20gZJz5o5n4XgAaHcnaiXhrD2M3yi0T2GQirhbkf0O8=;
        fh=ERqCIzEVQXvuumFeesz+bRD5aw5CauKBHFU3NyAZUI0=;
        b=IxfEOLUxepPB5C+5E2uBEJqoH+tmWZkGMjJVMAwCGj4szZNxQO7aKl59aSDfZAjNwm
         Ejr/2cIP+e0ObIuwWR5BkiW7D+RjJcXakU3N4jArm3erRYySnOoqRN2CN8Y+vL77Ds/j
         qu23fm8dESrgXgOEl20NiZrRXind1TPYl/afJnRvdIsY55jDL2ocHBp+s5SFV6EHfLPj
         XGzCGaWgy1jll9qEZ//FfeWXp/RBBOTczh8XJ955Y3+o4+MaIEsArT/arCtemiYTHPUD
         YQzwMbQdBHD+x+2BEO4M7argyfYJtvjlCS/qkX89MSeyEIlPH0VGN1llVZ5l+6dpSuhm
         /mdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SqE1GRmL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae37871602si1324569385a.611.2024.10.02.06.46.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2024 06:46:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SqE1GRmL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svzfl-0003Gi-Px; Wed, 02 Oct 2024 09:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1svzfk-0003GS-3B
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 09:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1svzfi-00027J-EN
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 09:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727876740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20gZJz5o5n4XgAaHcnaiXhrD2M3yi0T2GQirhbkf0O8=;
 b=SqE1GRmLxpinoGq+0aidMJu6Sv9MusudOEyw4TBso/wG4xy0ICWmKey6tRUduoUQNGbfE5
 KgfRnNA51Fnr1gYQcT+M60wj72ah5cp1zYUN/xgs+MH33Q7L4OPdgByNCRpV4tQWaer3vY
 zf8x8zruuLDX349GJ2ABe7IYWPQ4iDQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-UPKDNmnkPROylDPmGRHF_Q-1; Wed, 02 Oct 2024 09:45:37 -0400
X-MC-Unique: UPKDNmnkPROylDPmGRHF_Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-37cd18bd0d6so2335957f8f.0
 for <qemu-arm@nongnu.org>; Wed, 02 Oct 2024 06:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727876736; x=1728481536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=20gZJz5o5n4XgAaHcnaiXhrD2M3yi0T2GQirhbkf0O8=;
 b=qnSezMFtkmd6n7f5BC14jq8uTvnLHq99yiIZ6zsZCOO4xY9/pF62QlCXvz6mnk475t
 KPtps/V7lB2RNWgK5CnwwGIPliZsm3Y4Ch9hyOB6M5UYNB9JZAZDzrb5tVvYq8fLkjNa
 BgckvvMd4g47v76WaoNLVOtYN4/7laiEav911kRLANMOKxnbYGiHJ+aesUGmfY6kT25n
 qIWIbkJmxCzZCT+ZqopBvmyPru0XGActh7LkNj1+XtHGUYhyR0nTGf3jGGrxmOUkBFHj
 VpzadkH2jA83nESMjNf05TlWc+4wRKyE4WevGPj2X4UZQ5+7llXFCOO0bInyetFWlvCT
 XjVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8oZAaXIKEmDeWiYt1mhddjqOwXNFC30YXuxX3Q2AOjZUL0vLL84e+/FdKElCaihFvupoQl/fZpA==@nongnu.org
X-Gm-Message-State: AOJu0Yx/scWB9oSpC7g4TanQhXP93YrHTcZas39TnOrc/BWUSDk4AXe6
 0hNDqXYiNXU1P0agKIW+WmS8OVTEkaT9D3eBncTmJn58r2+dkke7rkHuaOO7DniF6NexY3WScmH
 8gtXSWuhZO0qBaNgltLl1pNRcu4AxrU9DU6S+LWmnj7iNkdq2fg==
X-Received: by 2002:adf:b1c3:0:b0:37c:d491:f2da with SMTP id
 ffacd0b85a97d-37cfb8a1e6emr1775779f8f.2.1727876736389; 
 Wed, 02 Oct 2024 06:45:36 -0700 (PDT)
X-Received: by 2002:adf:b1c3:0:b0:37c:d491:f2da with SMTP id
 ffacd0b85a97d-37cfb8a1e6emr1775764f8f.2.1727876735961; 
 Wed, 02 Oct 2024 06:45:35 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd572fb5dsm13994905f8f.88.2024.10.02.06.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 06:45:35 -0700 (PDT)
Date: Wed, 2 Oct 2024 15:45:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, Shannon
 Zhao <shannon.zhaosl@gmail.com>, Yanan Wang <wangyanan55@huawei.com>, Zhao
 Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 0/5] Change ghes driver to use HEST-based offsets
Message-ID: <20241002154534.3c58db06@imammedo.users.ipa.redhat.com>
In-Reply-To: <cover.1727782588.git.mchehab+huawei@kernel.org>
References: <cover.1727782588.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e+J68ybKeaRA

On Tue,  1 Oct 2024 13:42:45 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This RFC series was part of the previous PR to add generic error injection
> support on GHES.
> 
> It contains only the changes of the math used to calculate offsets at
> HEST table and hardware_error firmware file.
> 
> The first patch adds a new firmware file to store HEST address.
> The second patch makes use of it.
> The remaining ones add migration support.
> 
> PS.: I'm sending this as a RFC as using the proceudure defined at the
> pseudo-migration of:
> 
> 	https://www.linux-kvm.org/page/Migration
> 
> Didn't work. I tried to use two different QEMU versions to check a
> real life case and also to use just one QEMU and trying to load a
> virt-9.1 state on a virt-9.2 machine. 
> 
> For instance, trying to restore a virt-9.1 state on virt-9.2 gave me
> this error:
> 
> 	(qemu) qemu: Machine type received is 'virt-9.1' and local is 'virt-9.2'
> 	qemu: load of migration failed: Invalid argument

that's expected (idea is to keep machine type (virt-X) ABI stable so
it would work the same way on old and new QEMU)
migration is meant to move VM of the same machine type to a new/another QEMU instance.

i.e try migrate 

qemu-9.1 -M virt-9.1  => qemu-9.2 -M virt-9.1
and vice-versa
migration should succeed and memory error injection should still work
the old way in both instances (I don't recall anymore how to simulate SEA,
perhaps original author left a description how to do that somewhere on mail-list).

virt-9.2 is never meant to be 

> Yet, running virt-9.1 used the old math code (offsets from hardware_errors firmware
> file) while running virt-9.2 executed the new math code using HEST address.
> 
> Mauro Carvalho Chehab (5):
>   acpi/ghes: add a firmware file with HEST address
>   acpi/ghes: Use HEST table offsets when preparing GHES records
>   acpi/generic_event_device: Update GHES migration to cover hest addr
>   acpi/generic_event_device: add logic to detect if HEST addr is
>     available
>   arm/virt-acpi-build: Properly handle virt-9.1
> 
>  hw/acpi/generic_event_device.c |  30 +++++++++
>  hw/acpi/ghes.c                 | 108 ++++++++++++++++++++++++++++++---
>  hw/arm/virt-acpi-build.c       |  30 +++++++--
>  hw/core/machine.c              |   4 +-
>  include/hw/acpi/ghes.h         |   2 +
>  5 files changed, 159 insertions(+), 15 deletions(-)
> 

