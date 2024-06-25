Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp652707njc;
        Tue, 25 Jun 2024 05:06:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjEB9/UVISE+UVEWdUk2DuvnHCNYVNv63hVcOTgMiGTLRMhZe85sNKjeohPZ4riprDp7DCPKSAXmkr3zRkdgAW62/9KjpJ
X-Google-Smtp-Source: AGHT+IGd7X1bW4Jo1l9klDAkEjX2wsMOYy+gXKMgN1bsA/KtjL2hGF5CgRYUBQpCMH+7hrtFUF9B
X-Received: by 2002:a05:620a:24c9:b0:797:bfde:a077 with SMTP id af79cd13be357-79be6f1990emr740654685a.57.1719317177497;
        Tue, 25 Jun 2024 05:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719317177; cv=none;
        d=google.com; s=arc-20160816;
        b=OKgg795NM6nCq6JDF6HJGFaRwSYM2UeZG8hO7uZ3Z/9aWVjDzMkTbTFCAPYlwEseA0
         B43a0+cDHGiJnHRofcT5uFh6oL2HVyoptwWmVIMdGMeYFLGehAnhC+aTEzkwc2Jdzhom
         Qyh7PYVAWHOIquOezT5DrkIiedsY8mcosTHBaLQioPXImOXt+vN4iSd9SV2gqMlx3rlW
         AQuoTi3cza/vPC+gN/aviTbOmHvtCgfLhXmbgs6/a1FGqQG/3r0yQuHw4VoXmWLPztuG
         FtBsdmEb5vIi24dHKFxsF8r8mu5PrVJJROTDTIOG+Cl2RJlDVmGhT4bEgQ5vRE2O3nEk
         w02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=fcWhDHGeEe2/RxUYRx/amnsNY44eF7aWryOXKB96dEk=;
        fh=iHDnvAKUyncTbUCCHeIc7Vfhn9XNLeNx2QzmtOHMwbI=;
        b=nxg9bBoCXU5wsdiG42ZdADY4PmZ86Rngb2OFQ94K4APDBNDifPZsllVQzKFS3Fb8Im
         BtWzow0UZWcHAVegJ+XxsP9SBwmkFUFE61VMouJlfPsEcPL2pCBVjgk52wmsNCzs39t0
         dJmtypgy6qEGvElb/3AHabv3ZyId9G4npiLGBpumfbJ2ad0lwU8/qld1XYDPnLyPVrYQ
         bFLZIdzhPYCAOHs+xFvBcLwBC955cAguGD9ZePc3W3OMlh8oKpy11vGpfVWhUM1UflVF
         zHRfpgbXFzGInpz+0MeXIWSYjcyihL8a9uzuybw+bk3XtA2ItRvuLkxjeHXiiG2okoAP
         GWTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VU7L5Jpq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce92c3cdsi1077429985a.452.2024.06.25.05.06.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 05:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VU7L5Jpq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM4w2-0007g5-UP; Tue, 25 Jun 2024 08:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM4w1-0007fo-Va
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM4w0-0004QM-7j
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719317163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fcWhDHGeEe2/RxUYRx/amnsNY44eF7aWryOXKB96dEk=;
 b=VU7L5JpqXh97dSIMP1RQtpI59/58qd4Rl5F8C3gOCsaBvuIUMQSkhgKGuC4tM7c5NhpR6K
 Mb4BKLLdYT9RXXATVolNvWrjeGMpLeEmWpvimt7uIN9ZmQL8TZCJNVviPGPVD6dNrDxvxp
 rHYkk06hBQ3ft0s58ywVbSrEM9gL0+w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-vM6v6iOpNBOAFtGS26eQUg-1; Tue, 25 Jun 2024 08:06:01 -0400
X-MC-Unique: vM6v6iOpNBOAFtGS26eQUg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3648793ae51so3081659f8f.2
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 05:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719317161; x=1719921961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fcWhDHGeEe2/RxUYRx/amnsNY44eF7aWryOXKB96dEk=;
 b=FfCyutjLX33tqGWYg8i4Pywxs0pya86wVvNSmcHXdcDJj9t6Y0U7x50tGo1h/DFQTW
 9NoEERqzJdmuPTSwmIyxZrR5qyW+g4Oh7QjtehokWHT8qPR3w7wxriztExcjTJI52jLN
 4XPcELH1cRgazIB15kQq6jIPG2frJ4LBNuXW3GqxUQUbVgv69xHhXUeWcyU0FMuvz4KQ
 XP7xz62DaNDQol01hrmwUFlm0u4jZmS5JcOrpcgcivIgbuHIIl2zmeyMMg3slRKytYkf
 X3JBct9lL0yoVacbeJ0vOaeliB3DIap4+eURe9YwF/aGya/IUTjY116VHasXL5wXEVd3
 +trA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCOs1oURdTPlXqTlrRdipOPtIHKbGxW+uX5fJYZNKjeSWOMpHgs8n94iY+hDLgoG84dlnYrXgjBhKIz3OaZjjuJ+va
X-Gm-Message-State: AOJu0Yw/5ahebSyeIaSwuzYF8NBOUS3n1wiHUUHtH0yCRj0l2l7//3eC
 zee8u1mfOwODnoCsBhhUunfbGXnnHF9VAZ9v/I4gyOMHVOaVlkV0EqZ9moj4XPgZOYDPkCJL3V6
 MaCzGJUoSX5k5cc7OxnHpdya8wmoDc+qZCIt6eUxMWNhCNaec2g==
X-Received: by 2002:a5d:4592:0:b0:35f:2cd8:cb31 with SMTP id
 ffacd0b85a97d-366e94d1823mr4311659f8f.35.1719317160703; 
 Tue, 25 Jun 2024 05:06:00 -0700 (PDT)
X-Received: by 2002:a5d:4592:0:b0:35f:2cd8:cb31 with SMTP id
 ffacd0b85a97d-366e94d1823mr4311646f8f.35.1719317160292; 
 Tue, 25 Jun 2024 05:06:00 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366eaa892easm7576953f8f.71.2024.06.25.05.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 05:05:59 -0700 (PDT)
Date: Tue, 25 Jun 2024 14:05:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Alistair
 Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v3 14/15] tests/qtest/bios-tables-test.c: Enable basic
 testing for RISC-V
Message-ID: <20240625140558.168d1a9e@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240625131959.67c2fc74@imammedo.users.ipa.redhat.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-15-sunilvl@ventanamicro.com>
 <20240625131959.67c2fc74@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: dfZCKTsUcl1c

On Tue, 25 Jun 2024 13:19:59 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Fri, 21 Jun 2024 17:29:05 +0530
> Sunil V L <sunilvl@ventanamicro.com> wrote:
> 
> > Add basic ACPI table test case for RISC-V.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>  
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

I take ack back for now, since patch most likely to cause failures on weaker test host (CI infra)

test case never finishes and timeouts on my x86 host while consuming 100%,

======
QTEST_QEMU_BINARY=./qemu-system-riscv64 /tmp/qemu_build/tests/qtest/bios-tables-test
# random seed: R02Sd870403ff62b08e48122105b2700f660
# starting QEMU: exec ./qemu-system-riscv64 -qtest unix:/tmp/qtest-2873960.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-2873960.qmp,id=char0 -mon chardev=char0,mode=control -display none -audio none -machine none -accel qtest
1..1
# Start of riscv64 tests
# Start of acpi tests
# starting QEMU: exec ./qemu-system-riscv64 -qtest unix:/tmp/qtest-2873960.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-2873960.qmp,id=char0 -mon chardev=char0,mode=control -display none -audio none -machine virt  -accel tcg -nodefaults -nographic -drive if=pflash,format=raw,file=pc-bios/edk2-riscv-code.fd,readonly=on -drive if=pflash,format=raw,file=pc-bios/edk2-riscv-vars.fd,snapshot=on -cdrom tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2 -cpu rva22s64  -accel qtest



**
ERROR:../../builds/imammedo/qemu/tests/qtest/acpi-utils.c:158:acpi_find_rsdp_address_uefi: code should not be reached
Bail out! ERROR:../../builds/imammedo/qemu/tests/qtest/acpi-utils.c:158:acpi_find_rsdp_address_uefi: code should not be reached
========


 
> 
> > ---
> >  tests/qtest/bios-tables-test.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index f4c4704bab..0f9c654e96 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -1977,6 +1977,28 @@ static void test_acpi_microvm_acpi_erst(void)
> >  }
> >  #endif /* CONFIG_POSIX */
> >  
> > +static void test_acpi_riscv64_virt_tcg(void)
> > +{
> > +    test_data data = {
> > +        .machine = "virt",
> > +        .arch = "riscv64",
> > +        .tcg_only = true,
> > +        .uefi_fl1 = "pc-bios/edk2-riscv-code.fd",
> > +        .uefi_fl2 = "pc-bios/edk2-riscv-vars.fd",
> > +        .cd = "tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2",
> > +        .ram_start = 0x80000000ULL,
> > +        .scan_len = 128ULL * 1024 * 1024,
> > +    };
> > +
> > +    /*
> > +     * RHCT will have ISA string encoded. To reduce the effort
> > +     * of updating expected AML file for any new default ISA extension,
> > +     * use the profile rva22s64.
> > +     */
> > +    test_acpi_one("-cpu rva22s64 ", &data);
> > +    free_test_data(&data);
> > +}
> > +
> >  static void test_acpi_aarch64_virt_tcg(void)
> >  {
> >      test_data data = {
> > @@ -2455,6 +2477,10 @@ int main(int argc, char *argv[])
> >                  qtest_add_func("acpi/virt/viot", test_acpi_aarch64_virt_viot);
> >              }
> >          }
> > +    } else if (strcmp(arch, "riscv64") == 0) {
> > +        if (has_tcg && qtest_has_device("virtio-blk-pci")) {
> > +            qtest_add_func("acpi/virt", test_acpi_riscv64_virt_tcg);
> > +        }
> >      }
> >      ret = g_test_run();
> >      boot_sector_cleanup(disk);  
> 

