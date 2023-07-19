Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp6806957eje;
        Tue, 18 Jul 2023 20:38:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFymteYuU+zoD4Pib6C653kVI2XUSS0k+Gv2NHKj7sMaJ5U5/oWD3/aN5jV1IM1ZXOvEzMR
X-Received: by 2002:a05:622a:1ba0:b0:403:f390:f911 with SMTP id bp32-20020a05622a1ba000b00403f390f911mr1281880qtb.34.1689737892877;
        Tue, 18 Jul 2023 20:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689737892; cv=none;
        d=google.com; s=arc-20160816;
        b=wpVnIbb2OdB8QPW9g6Wx3t2r6wZTPr4ugXJCjCpHzBhPDRjWEByA8Llf4IYiWrGXwt
         CBk4FszDNwOgjkmRT3zt1P+mH3PR8quohg7b+5A5avZ1vPKVK4Hgfhuc3EpGFky4mHuj
         aVKKhW3ARAXEPzK3WqKFJA+Ct7gza0hbhi4L85ZRzEEilf1L9T/Rx9nrxquJ5Xg9PkST
         hT52ZWeKKC7tk10BWivMRPraqDuykCa0G1MpsDSpPQvtV/zbV+tp8MMa4QHepoIydu7t
         +KXQyBaCphsCfC7cBmC7jRQLWG3HybqSnTRjQVE66C+gqZmFm4Qex/shewUwwb+TCVDD
         tUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=p4FSI+TJXz+i2rFMQzor+Uv2E1K8lVetu4ZigiR9to8=;
        fh=NAUuxumPHgdi1FWvDCFAvbXPAtVjx/0RGbmXT0ZYQ4M=;
        b=vocwEhSR9ou/ytrzH2z1mnmkokS5MyzVQ/qENNx8LIphSMWpoBn1iEmY4ma3nTiJnF
         qeJcMOu7DFk0E1ObLeBzLUfCh4TirXnQ2BJ7QcQOgK4ETpfVcg5+vOHC0DNVtrtNoIFl
         kYAHbn2TZlAIU+lmUV33iqmtK9yPjht/S2MwatfLzffaiDpzJ+WrBGW6XNWR8VYojMxf
         85/sAcCllhflpJG0PZKkuQkAHY94YCyItVKu/af4zcbjucxRdHxgwak6esWGSCPIPnRX
         4Xv/cVKHoIx7kA9Qvoe0K9UZMYIKBrkCi7wGSAoAGZbgnQYaqhiFmv7JPalxxwBQKR2v
         x7XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=QDUqkKJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h24-20020a05620a13f800b007682b020d2asi2034683qkl.75.2023.07.18.20.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jul 2023 20:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=QDUqkKJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLy0o-00082C-PP; Tue, 18 Jul 2023 23:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qLy0m-00081Q-Ki
 for qemu-arm@nongnu.org; Tue, 18 Jul 2023 23:38:00 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qLy0k-00059Z-Ff
 for qemu-arm@nongnu.org; Tue, 18 Jul 2023 23:38:00 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-553ad54d3c6so3924455a12.1
 for <qemu-arm@nongnu.org>; Tue, 18 Jul 2023 20:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689737876; x=1692329876;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=p4FSI+TJXz+i2rFMQzor+Uv2E1K8lVetu4ZigiR9to8=;
 b=QDUqkKJDOnDucP6SMLgF+RvnSpsb7QIdkDcyMrM6VwtlmQlEOTQ8EYVIvPJDvM04B3
 z2tGb6g5UbliY5gPA7RWQotrtiDBDgNTEJeMJoJNfo42TqhT2ncqc5LCuLHPELwRHf0o
 zytZmjADH9yoNMX3LcS1pAmfMneB2iKk1IgSMnubxR8AaglbCZd+/rMdTAULomp/a4Xf
 H6+oIlhJV1iU3pY4XrB6qeZ9zDbnWLrfEGA6upJgROKCGCunmZ9THM8YZxXxYZhPhrO9
 USt/YaT9faMJlU3iqDUJrpt6cTJYytF4u+pY/i/Bv0HtgZDkqS94eadcN3qqjq6KafxK
 sjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689737876; x=1692329876;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4FSI+TJXz+i2rFMQzor+Uv2E1K8lVetu4ZigiR9to8=;
 b=Wzv0Xvmccppv7HLT8LDKxyTuSQNax/gj4cXvtBRMp25xjRBm+qYdoMO3HCfVSxSOCa
 v0JPXgwOBrRrVcN+V9mC3DF2lQqLF7aof6ZwT1K57yGuhReDnJtoHe0SNcmGxwEQIUgm
 evR/X5zIilvDe5wbOR3X1j3WDxxJERCTPpI8ojz/1aj63BNN6z9i/mXrmBk7hzi61hDD
 5SldiYS6eCSKtZuCvYhvD0RsgkKaIvcb9cPlyJAhaNkuZ50Q7dIRcRbUWp9iZWl5EX6r
 YrnBOpamk9AB8FncJ4GGw5bMDudHBl0BRwN9eO0KQ9TwGqSVbNfo/j4bOFsJO8Ebc5KB
 SV8A==
X-Gm-Message-State: ABy/qLZesPr6KH6hN2zgNiREHzl/T7a2eB/vToAhiTYZvngDUzUeR3rZ
 U0VN/hF4hVCBdCPWshlAjc3lhA==
X-Received: by 2002:a17:902:ed54:b0:1a6:b496:4053 with SMTP id
 y20-20020a170902ed5400b001a6b4964053mr1250581plb.59.1689737875925; 
 Tue, 18 Jul 2023 20:37:55 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242]) by smtp.gmail.com with ESMTPSA id
 a22-20020a170902b59600b001b86dd825e7sm2654579pls.108.2023.07.18.20.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 20:37:55 -0700 (PDT)
Date: Wed, 19 Jul 2023 09:07:48 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 04/10] hw/riscv: virt: Add PCIe HIGHMEM in memmap
Message-ID: <ZLdajOyuPXxxaVJO@sunil-laptop>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-5-sunilvl@ventanamicro.com>
 <6105a331-7c24-2c8e-a3ce-65c6080fd17f@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6105a331-7c24-2c8e-a3ce-65c6080fd17f@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: GyIz6u4aBlB1

On Tue, Jul 18, 2023 at 05:05:12PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 7/12/23 13:39, Sunil V L wrote:
> > PCIe High MMIO base is actually dynamic and fixed at
> > run time based on the RAM configured. Currently, this is
> > not part of the memmap and kept in separate static variable
> > in virt.c. However, ACPI code also needs this information
> > to populate DSDT. So, once the base is discovered, merge
> > this into the final memmap which can be used to create
> > ACPI tables later.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >   hw/riscv/virt.c         | 31 ++++++++++++++++++++++++++++++-
> >   include/hw/riscv/virt.h |  9 +++++++--
> >   2 files changed, 37 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index f6067db8ec..7aee06f021 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -84,6 +84,22 @@ static const MemMapEntry virt_memmap[] = {
> >   static MemMapEntry virt_high_pcie_memmap;
> > +/*
> > + * virt_memmap doesn't include floating High Mem IO address entry. To enable
> > + * code organization in multiple files (ex: ACPI), it is better to have single
> > + * memmap which has complete information.
> > + *
> > + * VIRT_HIGH_PCIE_MMIO is always greater than the last memmap entry and hence
> > + * full_virt_memmap is capable of holding both virt_memmap and
> > + * VIRT_HIGH_PCIE_MMIO entry.
> > + *
> > + * The values for these floating entries will be updated when top of RAM is
> > + * discovered.
> > + */
> > +static MemMapEntry full_virt_memmap[] = {
> > +    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 0 },
> > +};
> > +
> >   #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
> >   static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
> > @@ -1444,7 +1460,20 @@ static void virt_machine_init(MachineState *machine)
> >               ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
> >       }
> > -    s->memmap = virt_memmap;
> > +    /*
> > +     * Initialize the floating values in full memory map
> > +     */
> > +    full_virt_memmap[VIRT_HIGH_PCIE_MMIO].base = virt_high_pcie_memmap.base;
> > +    full_virt_memmap[VIRT_HIGH_PCIE_MMIO].size = virt_high_pcie_memmap.size;
> > +
> > +    s->memmap = full_virt_memmap;
> > +    /*
> > +     * Copy the base virt_memmap entries to full memmap
> > +     */
> > +    for (i = 0; i < ARRAY_SIZE(virt_memmap); i++) {
> > +        s->memmap[i] = virt_memmap[i];
> > +    }
> > +
> 
> This change here kind of convinces me of the point I made earlier in patch 2:
> we can simplify gpex_pcie_init() to use just the RISCVVirtState as a parameter
> and get everything else from it.
> 
> It's also something for a follow-up. As for this patch:
> 
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> 
Thanks Daniel. I agree. I can send another follow-up patch to simplify
gpex_pcie_init.

Thanks,
Sunil


