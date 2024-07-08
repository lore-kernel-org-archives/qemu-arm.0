Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2472215njb;
        Sun, 7 Jul 2024 21:27:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWeHKol6/hzqgLbZPhjYdyqOFEvHKAOrSya1hxpK/DJeyoJLw4cPFw5pcd7JHZEoE0KXCXJywjsKeFLSUkzuM2/czNB9B1s
X-Google-Smtp-Source: AGHT+IGlpoU1QVRuXFhONVhNLBL/znnhnW7do4zGQDLjS3dsz5q3rPWUx3HZcRYnglnNTLluzRw8
X-Received: by 2002:a05:622a:1649:b0:446:44d0:3aac with SMTP id d75a77b69052e-447cbef568fmr163545961cf.7.1720412823519;
        Sun, 07 Jul 2024 21:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720412823; cv=none;
        d=google.com; s=arc-20160816;
        b=j+AUnHej+tPkCYSvmo/nSCVOVkc20XSfcC+HNCuFyb/J1nWQdFBdEXHs32JVGdTqJO
         qmdAsjgPpKxY4ggXuPtblCVIsFEgDY+M+GzEOO66EICop48xNGyi45itM9miv5d9q7pP
         JQHrSNrs/sYuBZFokwI8QKLmu6eFCg3ZM2Mdx6ltqqL6vM1wztBul9YWUbBvx7kdqS4W
         sD1HpprXFUBuZMy4m6D9lv0wdPi+844e70rmlgSnKyaUZzmfyFZtDNgkteE0p80lzuVC
         3I8vXK/t5i2qgz4dELhkl5R8N+NFrga27VJocd6NgunFmMsegj6LjmtxkKPcB3AYMdMT
         V0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=JUUBxMzRjQBsfjECj+DhRcfMU2jw9tTIrKCKiq0P4dE=;
        fh=WH6jTwxN+vms+novW+kmVJTh5uTidthgz5GKWFhkQI4=;
        b=XYzQNKR966GGmPUi6e5xlOzxVh+mTlrL1qZMcifreFT3BDGsrjR+/5OGAniV4BjbSP
         ne64SIsF1g8d9YUrFPy9sBjJDTa6Glt8SqqXOuCVOuJwVwJ7CJiEF0laYbm+sSKQdMvx
         GlbLKC6GnmFQRG+lhyQxuYSTrTRm1Dzos7+fBf0I3A9lFYAp1QQ05F6S4OZfixSN2NvW
         IkZJ9CYx4S2y0IIffCMhJmdetPfWbVjZU5JNRdm4eddyDW53PrE9++9i64uW/RFrEpGU
         Apx5+Qy3aDkIe0g9OrPP+y6NbW4gcBTKQH1TYpe6Mlnyf/hjzg8DxjQ28qI54ofRpWA4
         RucQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=JH9Yj8ra;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447e84d5c8esi29719351cf.54.2024.07.07.21.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Jul 2024 21:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=JH9Yj8ra;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sQfxS-0000v4-I5; Mon, 08 Jul 2024 00:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sQfxP-0000tg-TQ
 for qemu-devel@nongnu.org; Mon, 08 Jul 2024 00:26:32 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sQfxO-0001gD-4Y
 for qemu-devel@nongnu.org; Mon, 08 Jul 2024 00:26:31 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-7035d9edcd9so1234406a34.1
 for <qemu-devel@nongnu.org>; Sun, 07 Jul 2024 21:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1720412788; x=1721017588; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JUUBxMzRjQBsfjECj+DhRcfMU2jw9tTIrKCKiq0P4dE=;
 b=JH9Yj8rafKtDrnY/TDFehtxv8ftNFzhVNVM+f6dqlsL8b49LA20Wwa+iKLe707WK7r
 uJ8Hr4iT6/TxWNO8Ir/sWbskTwL/SdGO5xZmVryEIDVZtNE6wQc+PPMDXCAdn987phgX
 WeR+1XGrXTd6Z9i2/ulcEURDSMwX3abAP+53r1Bi0JZ0UPwMmupzt4/RTxwKOCLLbvpO
 dQt99qrA3OUR7LWr2l+xJy6goBD17xgc0NfAipMCIadA4XZae0l+qNN46au1LayiVXsL
 l3mo8dYoMhmo+a3oSY/VGZ9RGgCJAxpv5OEbfvl0XPcpoQ1LEBeUJj26bYzgHRtni1Xt
 65mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720412788; x=1721017588;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JUUBxMzRjQBsfjECj+DhRcfMU2jw9tTIrKCKiq0P4dE=;
 b=e0OkUQgt9yS/u5ucfQCLLBgdf0h8xhthCv14X2MSv1hbJsXrHteH1l9SW+qt0ZRZj2
 DYNveAamzdu+hUwh2/l+xa417EasihgK5tUxkqH2jPdvvzKleTxll+lha0A7NxKnRiTf
 ITHMqLx1SIv9IHPDBbu7u/jgaJpsDm5uA8J9XzgoKn/VkCd25rwSl36kG+23V87/U4yk
 K0OJyy6xdtpuMtRuK6UP5KrtEJ6HIeY/LpPHb6xfq0H4LehaXNFkl/7ZP7ADzgYY0ZHL
 UFMG96vGaFxVh656arRSUvbEjXWhVfUeushwwxVziJ1/0O0gFrsXX5U2hehzfuqx7Yov
 Cfow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXCZYOl3zpMcfsxIbDuhSv24J5lK3Ow6boIOUIMpQd9TqeLOXxnylvDFNVNWej0XuDI+D0W0TsHeMILJHc0nKXTNa9NlE=
X-Gm-Message-State: AOJu0Yz9pLnu/pVcHTMOV8SoY8l91ZRyZ64vAsyx5otVde0eP6H6M77T
 t7D+Gk5FroMYPYbpqf+5Bk8akMsahtBMAb4gelSs0mE289jZ0vgbWcV11zx9tzk=
X-Received: by 2002:a9d:6d19:0:b0:703:64d4:8e0f with SMTP id
 46e09a7af769-70364d48fc1mr4812669a34.6.1720412788521; 
 Sun, 07 Jul 2024 21:26:28 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-701f7b35531sm3653472a34.65.2024.07.07.21.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 21:26:27 -0700 (PDT)
Date: Mon, 8 Jul 2024 09:56:14 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v4 16/16] tests/qtest/bios-tables-test: Add expected ACPI
 data files for RISC-V
Message-ID: <ZotqZsO2QdPG4tsg@sunil-laptop>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
 <20240625150839.1358279-17-sunilvl@ventanamicro.com>
 <20240627141803.42cd46c1@imammedo.users.ipa.redhat.com>
 <20240701170330-mutt-send-email-mst@kernel.org>
 <20240702150236.000042eb@Huawei.com>
 <ZoUmf2zn51RWU0o0@sunil-laptop> <ZoVmwFgIRlziF/v4@sunil-laptop>
 <CAKmqyKPMW0WMJQn7=2ebuqf0c=ow87LCtPd1bOdiWVP_xjoTJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKPMW0WMJQn7=2ebuqf0c=ow87LCtPd1bOdiWVP_xjoTJA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3YiIvFstRePZ

On Mon, Jul 08, 2024 at 01:16:49PM +1000, Alistair Francis wrote:
> On Thu, Jul 4, 2024 at 12:57 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > On Wed, Jul 03, 2024 at 03:53:08PM +0530, Sunil V L wrote:
> > > On Tue, Jul 02, 2024 at 03:02:36PM +0100, Jonathan Cameron wrote:
> > > > On Mon, 1 Jul 2024 17:03:43 -0400
> > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > >
> > > > > On Thu, Jun 27, 2024 at 02:18:03PM +0200, Igor Mammedov wrote:
> > > > > > On Tue, 25 Jun 2024 20:38:39 +0530
> > > > > > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > > > >
> > > > > > > As per the step 5 in the process documented in bios-tables-test.c,
> > > > > > > generate the expected ACPI AML data files for RISC-V using the
> > > > > > > rebuild-expected-aml.sh script and update the
> > > > > > > bios-tables-test-allowed-diff.h.
> > > > > > >
> > > > > > > These are all new files being added for the first time. Hence, iASL diff
> > > > > > > output is not added.
> > > > > > >
> > > > > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > > Acked-by: Igor Mammedov <imammedo@redhat.com>
> > > > > >
> > > > > > Michael,
> > > > > > can it go via risc-v tree or
> > > > > > do you plan to merge it via your tree?
> > > > >
> > > > > given patch 1 is merged, I took the rest.
> > > >
> > > > Looks like your CI runs are catching this as well but
> > > > RHCT here is failing.  I rebased the GI/GP set on top of this
> > > > and ignored that failure by skipping riscv64 tests.
> > > >
> > > > Jonathan
> > > >
> > > Hi Jonathan, Michael,
> > >
> > > Looks like a recent RISC-V PR updated the rva22s64 ISA string affecting
> > > the RHCT I had in my series. I see that Michael dropped those 3 RISC-V
> > > patches from the PR. So, let me update the expected RHCT AML file in a
> > > new series. I will also include Igor's feedback to remove fallback path
> > > in that series.
> > >
> > Hi Alistair,
> >
> > This issue is because, below 3 extensions are present in the ISA string
> > for rva22s64 profile cpu after recent RISC-V PR.
> >
> > zmmul_zaamo_zalrsc
> 
> zmmul (multiply) is implied by M (multiply and divide). The other two
> are similar.
> 
> >
> > However, IIUC, they are not mentioned in the RVA22S64 profile spec. Because of
> > this change, my AML files are having a difference and failing CI. The
> > question is, is this correct behavior? If so, I can update the AML files
> > and resubmit the patches. Let me know.
> 
> This does feel correct. Is software only needed zmmul for multiplying
> then reporting zmmul when we support M feels like the right thing to
> do.
> 
> I can't find a spec that says either way though. So unless anyone else
> knows of one I think this current approach is correct
> 
Thanks a lot, Alistair. I had a discussion with Daniel as well and we
concluded the same. I will update the AML files.

Thanks,
Sunil
