Received: by 2002:a05:7022:f409:b0:6e:5a56:ff6c with SMTP id rj9csp596113dlb;
        Thu, 26 Oct 2023 05:39:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM/T4a2ChesC6lsr7up2JFs7go0iAmUzL0NvW0Ij/qTdoPuBRb+zAsv1zJOB3SqBF8dKEu
X-Received: by 2002:a05:622a:1aa9:b0:41c:e028:7254 with SMTP id s41-20020a05622a1aa900b0041ce0287254mr21535060qtc.34.1698323987310;
        Thu, 26 Oct 2023 05:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698323987; cv=none;
        d=google.com; s=arc-20160816;
        b=JUff+g8sPwa/bJijscDAi5bsAuNAOVy2TdWenBoZwSIf9qAvyN+xSYUXXlvt9ec2cv
         nGpluBuXmQThPwVd1lUqOfKpiAeJKjm9wyHIa/ytZIiFtjybhy/sBapQpOXj/U4bezA2
         HSrgMkF8OodgBWetHdsvDf43MQ+rQOE0vNoRXJDF8YLnTL292xP4/ZXNdrFQY2UEmHiA
         HYFQtdy9flsO7OivGN4wUMzQn6SwLn8ywE8j51aazkoPBK/NS5/K9+zTO2jP3gfD+vDy
         QpbYTTjBWSdATtou8O7e0AtxcDffCvy8QJTe7UXa2ZblDhCg4wJarEQv4N3K7dz/tRei
         gtPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Iy/9mK73VgJHKA7x6ZOHag2goOiZmcwGvUW8/QRF3QY=;
        fh=wmdDFz7sClSgoMf/DYnZ2QnofyXdTEqO9UUvIaMsBVY=;
        b=BJxLhUDy/CMxpiZ79wYiugD3i8GEZAn/Juz2IMQTieLV56RSurV0BaN1jL40nA1l3y
         VTocx+0C+q4XCrltbCkuyRkQwrIMmZDYtUJZAKFnqMo09/+Y5I3QJCtRHZp4oSb3gxvj
         B2SNR5hnCsnWKUtkIgudczQ2FA8etAiwes8lG+29/Yxy/ZMuOBITaiKjrm4LA/5kuckQ
         3X6Usel+ymzfKvCviy6NXwBVbqFM1rvZ4pNrR6UJaGF1Ho+FlmLaTmZgVbGUs1FTfWS5
         B/5AjUn35r0DTiIye+kr42QK8VygWCdXQwA9pgL7bv+PwTZC2PhAdJjmYnP0E5aw6Fvl
         PC4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=KQWv2qEN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a05622a04c600b004181075e931si9091700qtx.154.2023.10.26.05.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Oct 2023 05:39:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=KQWv2qEN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvzdt-0007pU-EC; Thu, 26 Oct 2023 08:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvzds-0007p9-MH
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 08:39:16 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvzdq-0003C3-01
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 08:39:16 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6bb4abb8100so801322b3a.2
 for <qemu-arm@nongnu.org>; Thu, 26 Oct 2023 05:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698323951; x=1698928751; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Iy/9mK73VgJHKA7x6ZOHag2goOiZmcwGvUW8/QRF3QY=;
 b=KQWv2qENdv3guvQW+Wk8Nj8BMqbkPOD08gxHl52N5aBXVKDWwDa5PRdCiO67ODOmB+
 Ywlzep+Slxj0WbDPpVQgk3f/n2v8aBDMQva81R1lUAJMXGC2OH+Mg2l8VyfJnujYdvlv
 GH8oWWcwBXw7I2Ify+a33kzEYmlIY92U62Uhu5k5wBzCh2wJuX687DAZxdEayuUujeaF
 6ePnUN9dUzf1+Xvfxs9r9MqCIjWCyXEoXP8M0GYCgejQzE19rCqjfktroTrq3ZKQvCP/
 M1CA9yomlkyRIihq7EbU6oRn3FrGQoxwhT7wzFeYOokoIRQz8lESYTpk0VgCbHL7s9lM
 CUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698323951; x=1698928751;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iy/9mK73VgJHKA7x6ZOHag2goOiZmcwGvUW8/QRF3QY=;
 b=gEVgeKJ28vpVjkk5afxVCYXGMLYAC1JmjxJrmfmDq+6eCzafz1nQwCUyNobO/QFjDu
 F0+1/mA3eeFj7LAj2d5+EbjDnQA+Cug4KPnhH4oKa7CJ684SgTCxRMAmV4+hRaL/y1uJ
 KpR+Q4xHLO98mxh5r6FHHWGbn8ykJzqHwxvv/IFUyBZ2MaKAjEP3sLuv5L2Pe0HJCPIU
 jWDzjjj/kjiPePQSKv0rai5Lu5ZlSch9mNr1ufWi5wIWB5PSa2kjIMaRXe7UYpjyaVll
 fQBaY7eJlnaQABhSinV/km67nAY26E0CzMj12eVv/lckqUjGLrlFSfsNYRVLKrd/ovLk
 Y2fQ==
X-Gm-Message-State: AOJu0YwBaq6YGDHZYHq6WZxtRUci7fT4R/3rcOuvTGcYTWk/hpggqyev
 s6K+Ol0sIk+TNh9DmqdUG0F5mw==
X-Received: by 2002:a05:6a20:c19c:b0:16b:e89b:fb11 with SMTP id
 bg28-20020a056a20c19c00b0016be89bfb11mr7705923pzb.56.1698323950975; 
 Thu, 26 Oct 2023 05:39:10 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.78]) by smtp.gmail.com with ESMTPSA id
 nr12-20020a17090b240c00b0027d12b1e29dsm1594762pjb.25.2023.10.26.05.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 05:39:10 -0700 (PDT)
Date: Thu, 26 Oct 2023 18:08:59 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v4 05/13] hw/riscv/virt-acpi-build.c: Add AIA support in
 RINTC
Message-ID: <ZTpd4+/zPtygPyls@sunil-laptop>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
 <20231025200713.580814-6-sunilvl@ventanamicro.com>
 <20231026-e3dba47934601608bc6a8cf8@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026-e3dba47934601608bc6a8cf8@orel>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: O89WcqmtnsJF

On Thu, Oct 26, 2023 at 10:46:56AM +0200, Andrew Jones wrote:
> On Thu, Oct 26, 2023 at 01:37:05AM +0530, Sunil V L wrote:
> > Update the RINTC structure in MADT with AIA related fields.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/virt-acpi-build.c | 66 +++++++++++++++++++++++++++++++++++---
> >  1 file changed, 62 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> > index d8772c2821..073c85f327 100644
> > --- a/hw/riscv/virt-acpi-build.c
> > +++ b/hw/riscv/virt-acpi-build.c
> > @@ -38,6 +38,7 @@
> >  #include "hw/intc/riscv_aclint.h"
> >  
> >  #define ACPI_BUILD_TABLE_SIZE             0x20000
> > +#define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
> >  
> >  typedef struct AcpiBuildState {
> >      /* Copy of table in RAM (for patching) */
> > @@ -58,18 +59,42 @@ static void acpi_align_size(GArray *blob, unsigned align)
> >  }
> >  
> >  static void riscv_acpi_madt_add_rintc(uint32_t uid,
> > +                                      uint32_t local_cpu_id,
> >                                        const CPUArchIdList *arch_ids,
> > -                                      GArray *entry)
> > +                                      GArray *entry,
> > +                                      RISCVVirtAIAType aia_type,
> > +                                      uint64_t imsic_addr,
> > +                                      uint32_t imsic_size)
> >  {
> >      uint64_t hart_id = arch_ids->cpus[uid].arch_id;
> >  
> >      build_append_int_noprefix(entry, 0x18, 1);       /* Type     */
> > -    build_append_int_noprefix(entry, 20, 1);         /* Length   */
> > +    build_append_int_noprefix(entry, 36, 1);         /* Length   */
> >      build_append_int_noprefix(entry, 1, 1);          /* Version  */
> >      build_append_int_noprefix(entry, 0, 1);          /* Reserved */
> >      build_append_int_noprefix(entry, 0x1, 4);        /* Flags    */
> >      build_append_int_noprefix(entry, hart_id, 8);    /* Hart ID  */
> >      build_append_int_noprefix(entry, uid, 4);        /* ACPI Processor UID */
> > +    /* External Interrupt Controller ID */
> > +    if (aia_type == VIRT_AIA_TYPE_APLIC) {
> > +        build_append_int_noprefix(entry,
> > +                                  ACPI_BUILD_INTC_ID(
> > +                                      arch_ids->cpus[uid].props.node_id,
> > +                                      local_cpu_id),
> > +                                  4);
> > +    } else {
> > +        build_append_int_noprefix(entry, 0, 4);
> > +    }
> > +
> > +    if (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
> > +        /* IMSIC Base address */
> > +        build_append_int_noprefix(entry, imsic_addr, 8);
> > +        /* IMSIC Size */
> > +        build_append_int_noprefix(entry, imsic_size, 4);
> > +    } else {
> > +        build_append_int_noprefix(entry, 0, 8);
> > +        build_append_int_noprefix(entry, 0, 4);
> > +    }
> >  }
> >  
> >  static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
> > @@ -77,6 +102,11 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
> >      MachineClass *mc = MACHINE_GET_CLASS(s);
> >      MachineState *ms = MACHINE(s);
> >      const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
> > +    uint64_t imsic_socket_addr, imsic_addr;
> > +    uint8_t  guest_index_bits;
> > +    uint32_t imsic_size, local_cpu_id, socket_id;
> > +
> > +    guest_index_bits = imsic_num_bits(s->aia_guests + 1);
> >  
> >      for (int i = 0; i < arch_ids->len; i++) {
> >              Aml *dev;
> > @@ -87,8 +117,19 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
> >              aml_append(dev, aml_name_decl("_UID",
> >                         aml_int(arch_ids->cpus[i].arch_id)));
> >  
> > +            socket_id = arch_ids->cpus[i].props.node_id;
> > +            local_cpu_id = (arch_ids->cpus[i].arch_id -
> > +                            riscv_socket_first_hartid(ms, socket_id)) %
> > +                            riscv_socket_hart_count(ms, socket_id);
> >              /* build _MAT object */
> > -            riscv_acpi_madt_add_rintc(i, arch_ids, madt_buf);
> > +            imsic_socket_addr = s->memmap[VIRT_IMSIC_S].base +
> > +                                (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
> > +            imsic_addr = imsic_socket_addr +
> > +                         local_cpu_id * IMSIC_HART_SIZE(guest_index_bits);
> > +            imsic_size = IMSIC_HART_SIZE(guest_index_bits);
> > +
> > +            riscv_acpi_madt_add_rintc(i, local_cpu_id, arch_ids, madt_buf,
> > +                                      s->aia_type, imsic_addr, imsic_size);
> >              aml_append(dev, aml_name_decl("_MAT",
> >                                            aml_buffer(madt_buf->len,
> >                                            (uint8_t *)madt_buf->data)));
> > @@ -227,6 +268,7 @@ static void build_dsdt(GArray *table_data,
> >   * 5.2.12 Multiple APIC Description Table (MADT)
> >   * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/15
> >   *      https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
> > + *      https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view
> >   */
> >  static void build_madt(GArray *table_data,
> >                         BIOSLinker *linker,
> > @@ -235,6 +277,12 @@ static void build_madt(GArray *table_data,
> >      MachineClass *mc = MACHINE_GET_CLASS(s);
> >      MachineState *ms = MACHINE(s);
> >      const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
> > +    uint64_t imsic_socket_addr, imsic_addr;
> > +    uint8_t  guest_index_bits;
> > +    uint32_t imsic_size;
> > +    uint32_t local_cpu_id, socket_id;
> > +
> > +    guest_index_bits = imsic_num_bits(s->aia_guests + 1);
> >  
> >      AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
> >                          .oem_table_id = s->oem_table_id };
> > @@ -246,7 +294,17 @@ static void build_madt(GArray *table_data,
> >  
> >      /* RISC-V Local INTC structures per HART */
> >      for (int i = 0; i < arch_ids->len; i++) {
> > -        riscv_acpi_madt_add_rintc(i, arch_ids, table_data);
> > +        socket_id = arch_ids->cpus[i].props.node_id;
> > +        local_cpu_id = (arch_ids->cpus[i].arch_id -
> > +                       riscv_socket_first_hartid(ms, socket_id)) %
> > +                       riscv_socket_hart_count(ms, socket_id);
> > +        imsic_socket_addr = s->memmap[VIRT_IMSIC_S].base +
> > +                            (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
> > +        imsic_addr = imsic_socket_addr +
> > +                     local_cpu_id * IMSIC_HART_SIZE(guest_index_bits);
> > +        imsic_size = IMSIC_HART_SIZE(guest_index_bits);
> > +        riscv_acpi_madt_add_rintc(i, local_cpu_id, arch_ids, table_data,
> > +                                  s->aia_type, imsic_addr, imsic_size);
> 
> All the above new lines identically match the new lines in
> acpi_dsdt_add_cpus(), so I suggest creating a helper function rather
> than duplicating them.
> 
Makes sense. Let me update in next revision.

Thanks,
Sunil
