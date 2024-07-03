Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp22964njb;
        Wed, 3 Jul 2024 07:58:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVK/fsXfDM7kemSZPsX95i2c0QYM05wVUUkRSzFqDdezzuUIcM3EfHFPpAbVla5/TnKe4O/ai1i1UBvj7g7Cys1zbjxSNS2
X-Google-Smtp-Source: AGHT+IEbaEWz+BKK17aImaXPYYhw63OtAnd45UANx96BN7jZm/HrLfnRwE/gharoevE5KsuyOrD7
X-Received: by 2002:a05:6214:d06:b0:6b4:fece:1322 with SMTP id 6a1803df08f44-6b5b717833emr155280286d6.55.1720018711333;
        Wed, 03 Jul 2024 07:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720018711; cv=none;
        d=google.com; s=arc-20160816;
        b=FJEo7aJktqNO96hmvTczzx68GJvFD4bRMbkKlsS8yvVDTv+giT4X953UvAQw4RDLzU
         UL5ezodbsAywnzRGnJ/3BtCwdJVCqqQHeHffx9Lf6Ihg5l95cHfLpcFttKVeygIrFjgH
         NtshZZXW6eDyT7cB+fAbUutEKHZTGbdFF3aMKuCtW78QZMpIt+OT6FCABIHyAc2+cv6R
         U/Jtr0k1AIhJSHNnLQZlZw6bp98DvXJmoNHPrsFE8YB4TfZPlHqflpzye2uJwpQFibht
         3/rrx/EEPGgVKJUfDtUIpdmmtgEvOdvXSvbXYfmq9sNB5YYQ7CCUi0FVAVhzq3CfgQco
         +wqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=EBVph4qCfYaMbZP3UoZ2K23x3GSN/F+GNnJRA4L/VXg=;
        fh=ux9I3iSxdZerAc+eVwZ6KwU3RS325/ejs8OOsgo1DxQ=;
        b=Xhxl/M4lLWxSQLuP9zqM7E/9FwtWNG/aIibTcFFtdHZ11ecKOoHgg2cNi4NQGvP4tK
         CVq3bugZsnFHTvPd8JITiJzJEl4kSd3hhQp3tOSm9vp4W0h/fkdPzoHKxRlqA4q6bzIe
         4LGyDBZkBN58Q7Ik3Nt3y4ZOd+/aLZ7m1xxVVYqcr95n1CdRJP986YqXPwWCsVAg/FK1
         WoVYCACdCTR12VtpA/hzOOoB6jMNA1z44mxpfHCxQ/sI5Lac6zaHKUNhsNCk9fqIqISB
         Xji2TK4fK/cccV6Kn3SSauh/Hx2jKjxsbQhSRkCvRkPhw/ElN0B2oXHDSv4PyGIgX1DA
         wXVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ORaqsK51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e36461fsi133283396d6.69.2024.07.03.07.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 07:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ORaqsK51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sP1Qk-0007Z0-CT; Wed, 03 Jul 2024 10:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sP1Qi-0007Wq-Gj
 for qemu-arm@nongnu.org; Wed, 03 Jul 2024 10:57:56 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sP1Qg-0005Ph-Mm
 for qemu-arm@nongnu.org; Wed, 03 Jul 2024 10:57:56 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3d639f967b0so2212323b6e.0
 for <qemu-arm@nongnu.org>; Wed, 03 Jul 2024 07:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1720018673; x=1720623473; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EBVph4qCfYaMbZP3UoZ2K23x3GSN/F+GNnJRA4L/VXg=;
 b=ORaqsK51H8yKvZoxLJoqovuJcwuSpMmQDVRcszAqOBTICf7g8BG+gUtK5Y7Eyf0Fzr
 cTjQfhee3X8UP+LN4x1JnCXX3yoLzgO1WNLtHgPGXctoRB9myVUeJ32W9OCkTa4lWM2u
 YivleJ6p4hX6PuR330+j4wgtMbcwp+HDFSwnXLehz39WLWudfSrjLn+/Vo02m8UF0NRq
 SkadJsF2lK35UD4pzAV5M0OKeKe2Gc3EBdmIzRWv7YIj8l5+4kznshYEdx62Ksbpxewg
 oYkItMb0am4aIvHAVuM1AtZzSkmQrSaHCMnhkd6hqrv/ZIOo7LiyVU4wnc+2lpsh/ooo
 Ze7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720018673; x=1720623473;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBVph4qCfYaMbZP3UoZ2K23x3GSN/F+GNnJRA4L/VXg=;
 b=MNO8VpV7nWHHGwOAnOek7DdvxSILyzeMG7xRXJ3jdMMfBfAJL69o4YCKXOU2gHpr8P
 ZvWkBQLGPMeI2MLh3Fco0ot1jxbeEaEhO6UEBYJ0rgo8fHl88gtfsBveYNtSzG45hUCl
 MigW2hNMHn8sfaIPLL2tdmnrq2IZqh/7XX7DNotnZD0UFioip3cvDLCEceP1bggci1a7
 sTMV4uXskg6IerilwlGlfWU21bzItyjrQx3WOANIiC1gMsh8QC3uof6ZtSuYnl/8jNXZ
 VIlb9Asjyosllb8veFf6sfohzpGNXB2v6ZsLBiBGIMAHZVEg8hIYtrmvhRM7MYTWOGar
 bovg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCgZAcJPzrWDYJG6ew16j23HPcYHtEU6tUGr4Mz3+wVrqfiyq381KH1/MlFfBgizDEv0/PQelE5VFtXsRiJ++N8oTl
X-Gm-Message-State: AOJu0YzTaZdblRGEpr6b42XQUGcFlVdYof48gGtVibZ03SznZ1Yl0ZcA
 YzrH6nwxV48kFXX3A5p2YFgljmOUrSLnvlpKswS035FMKLX+x7Phccsv7x8BswE=
X-Received: by 2002:a05:6808:159b:b0:3d2:1da4:af63 with SMTP id
 5614622812f47-3d6b4de260amr11755066b6e.45.1720018672499; 
 Wed, 03 Jul 2024 07:57:52 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3d62fb3ec4esm2101687b6e.49.2024.07.03.07.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:57:36 -0700 (PDT)
Date: Wed, 3 Jul 2024 20:27:04 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v4 16/16] tests/qtest/bios-tables-test: Add expected ACPI
 data files for RISC-V
Message-ID: <ZoVmwFgIRlziF/v4@sunil-laptop>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
 <20240625150839.1358279-17-sunilvl@ventanamicro.com>
 <20240627141803.42cd46c1@imammedo.users.ipa.redhat.com>
 <20240701170330-mutt-send-email-mst@kernel.org>
 <20240702150236.000042eb@Huawei.com>
 <ZoUmf2zn51RWU0o0@sunil-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoUmf2zn51RWU0o0@sunil-laptop>
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: GTnM/5MAZooQ

On Wed, Jul 03, 2024 at 03:53:08PM +0530, Sunil V L wrote:
> On Tue, Jul 02, 2024 at 03:02:36PM +0100, Jonathan Cameron wrote:
> > On Mon, 1 Jul 2024 17:03:43 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > 
> > > On Thu, Jun 27, 2024 at 02:18:03PM +0200, Igor Mammedov wrote:
> > > > On Tue, 25 Jun 2024 20:38:39 +0530
> > > > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > >   
> > > > > As per the step 5 in the process documented in bios-tables-test.c,
> > > > > generate the expected ACPI AML data files for RISC-V using the
> > > > > rebuild-expected-aml.sh script and update the
> > > > > bios-tables-test-allowed-diff.h.
> > > > > 
> > > > > These are all new files being added for the first time. Hence, iASL diff
> > > > > output is not added.
> > > > > 
> > > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > Acked-by: Igor Mammedov <imammedo@redhat.com>  
> > > > 
> > > > Michael,
> > > > can it go via risc-v tree or
> > > > do you plan to merge it via your tree?  
> > > 
> > > given patch 1 is merged, I took the rest.
> > 
> > Looks like your CI runs are catching this as well but
> > RHCT here is failing.  I rebased the GI/GP set on top of this
> > and ignored that failure by skipping riscv64 tests.
> > 
> > Jonathan
> > 
> Hi Jonathan, Michael,
> 
> Looks like a recent RISC-V PR updated the rva22s64 ISA string affecting
> the RHCT I had in my series. I see that Michael dropped those 3 RISC-V
> patches from the PR. So, let me update the expected RHCT AML file in a
> new series. I will also include Igor's feedback to remove fallback path
> in that series.
> 
Hi Alistair,

This issue is because, below 3 extensions are present in the ISA string
for rva22s64 profile cpu after recent RISC-V PR.

zmmul_zaamo_zalrsc

However, IIUC, they are not mentioned in the RVA22S64 profile spec. Because of
this change, my AML files are having a difference and failing CI. The
question is, is this correct behavior? If so, I can update the AML files
and resubmit the patches. Let me know.

Thanks,
Sunil
