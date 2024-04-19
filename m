Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2526034ejd;
        Fri, 19 Apr 2024 09:37:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmBSdnn50Ti+EMWtV4I83AkNNV0+j8GcDajZTNzjApJchMWnWBzPQNi1KTo3+QeaEwJ6xyyudJ6jA3JgwAM93kyVouz4Lx
X-Google-Smtp-Source: AGHT+IFONJP40/aRDVAj6t1BOM2STim/dwgEiyJz7wyoyK8C73d/zcIe4Tya67K6f8170Ec9AUlP
X-Received: by 2002:a05:622a:1aa1:b0:437:9d29:c3db with SMTP id s33-20020a05622a1aa100b004379d29c3dbmr8668607qtc.29.1713544642598;
        Fri, 19 Apr 2024 09:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713544642; cv=none;
        d=google.com; s=arc-20160816;
        b=udTj6oHAKrbojDpjI31VTlT3ks7tOyVjiBKDAVhTkzOkS1vHlNfWsozaH/MVPASh7H
         1jjMwEm8eQfaF2ae3mBbh5bhiaEbkkx7tzC23jjlcI4bWs4e/ZnO3EVAAT28fGvEn/Pw
         3uR5wYTuRW4VbExgCLskQKSrR3vj3SE5pIH/j50wC+HYJDriYpeBJAl3HJ8ASx3BTOB8
         qFJGytHRnDwXIIpPQc7juAPUCz0VG1zejaEbiXuto7r7OC8rpyW/v94YqKSdwiRExUDM
         Ui+qGjpJKKDTL6z/+t2RlrJiXYoNZUnXLnEZvFp1UTX9Yh38XG15n9VVYNBwCAIoFJN6
         Yi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IItWrdgZkDNIASGgQKIerSiJJgMPW2FeW0frCZC5PXk=;
        fh=SVnpUz4Ux6P29p1vTpwZxZgNtW+Ua94pLo2TSHcbWnE=;
        b=Py/QsEhQzY4RdIX6Br47PQy2SGcSWR+CD2oS2s6cavTPY8QN1tDfbtvSRbq/M9Ae3Z
         GHnKDojRyimnhOWufMs2UXP4veaZqOUG5NwGkzyONlZ1WhDTg8vb2u22vA1VVuvaC5B6
         HFV6nZ8SWkrKjPXovbVjRyVjp1LxQHBJ0R1XdmT9XukhkCEYyf33W46lXwUJth0jeat+
         DEXjYIkX9FN0mjZexKkJ3vDFUNlAGy7ZSZUwBfLfr2v15rRQWF2a9EqlW2jMekx6ujTF
         05FFl9TaX7aELiu++Pkhx6EzG5cx7WdsClJiAICMiaECesauAU6RZ2zjFaQc2v8L5Ypr
         ES6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IA9lYGEm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id en5-20020a05622a540500b00434e7090a7fsi3762885qtb.563.2024.04.19.09.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Apr 2024 09:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IA9lYGEm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxrEh-0005zk-VN; Fri, 19 Apr 2024 12:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1rxrEf-0005zM-Jk; Fri, 19 Apr 2024 12:37:13 -0400
Received: from sin.source.kernel.org ([145.40.73.55])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1rxrEb-0007PH-Tt; Fri, 19 Apr 2024 12:37:12 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A9366CE1B4D;
 Fri, 19 Apr 2024 16:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DFEC32783;
 Fri, 19 Apr 2024 16:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713544615;
 bh=xEmo7+57RzWgUeRA1Hw9WBrxAdSuJ75zownMKbjKdaQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IA9lYGEm8FUmOBhO/3yrBXsni9iZeK7wW5O/GxQZK0zQHg5B6Zwarx9GPXFJxKUA0
 6iCEu4vK7G0nmRWXw+RvRj6mLyD1o3UfKfVqb93ZWg24wXiQqgVM4YcH0ok5umDBfQ
 jNosEy5uwLDVp7bGiRRYV9ZR5RFjVSk8T2Ih6nEMPapioBmnOfDmZDSPKX8aOiYxeh
 VxsTR/aI3ZzgGSK03lDKsi3eoeiDOboDgHPf9j01K7dCGWxDlAzcCxw7waUkGJrDAY
 GZkUG0cofJYRnzPg0s5I6ObaN6ZjV+ScEsSjm9dnZ64hvp1zglpfiD9++vTzThCOud
 1DYgppEWao95Q==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-516d68d7a8bso2133656e87.1; 
 Fri, 19 Apr 2024 09:36:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXcHXfzm/VYj8hXGlWtqZT+mUx1Ldcd30KO5vYtTaWxkzSZTR2YiF0Bq39rlIN/xEAfxpFc//XFpA+mMEQ0IH9IEXW0YXoTr3uRb3FgLYdbeQVpyYYlqldTyGk=
X-Gm-Message-State: AOJu0Yy8ikyFrXpcu4U4wI6Ca5NV4tCmThXGFRV/FIqu/0My9mdYTa5I
 kzSfdW6tseYs64ml0arN/E+tnElpv/ZcpcD5Hn9UPgHATkMMbRAlk389A7UQ2et4Z2aaf12EcWv
 WbnjVV1JBl82nodWcFzbrMBL+DLM=
X-Received: by 2002:ac2:4651:0:b0:519:99c:9018 with SMTP id
 s17-20020ac24651000000b00519099c9018mr816835lfo.11.1713544614093; Fri, 19 Apr
 2024 09:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240301204110.656742-1-richard.henderson@linaro.org>
 <20240301204110.656742-6-richard.henderson@linaro.org>
 <20240416161111.0000607c@huawei.com>
 <0c878d25-3fbb-4f0b-bc9e-ca638f8c4f1e@linaro.org>
 <20240418091555.00006666@Huawei.com>
 <20240418183600.00000345@huawei.com>
 <kjpkyoux2xcegrqshde5ddhicf33jnlelobuzuo4uj4svvlzdn@rilun7dz6776>
 <20240419170938.00000551@huawei.com>
In-Reply-To: <20240419170938.00000551@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 19 Apr 2024 18:36:42 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE+0mUfFq_FrhZT0m_YOJkWiuPndWt3GsRn1eMyCVrmMw@mail.gmail.com>
Message-ID: <CAMj1kXE+0mUfFq_FrhZT0m_YOJkWiuPndWt3GsRn1eMyCVrmMw@mail.gmail.com>
Subject: Re: [edk2-devel] [PATCH v3 5/6] target/arm: Do memory type alignment
 check when translation disabled
To: devel@edk2.groups.io, jonathan.cameron@huawei.com
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Jonathan Cameron via <qemu-devel@nongnu.org>, linuxarm@huawei.com, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.73.55; envelope-from=ardb@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.313,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-TUID: bJBCcFU+YRPz

On Fri, 19 Apr 2024 at 18:09, Jonathan Cameron via groups.io
<jonathan.cameron=huawei.com@groups.io> wrote:
>
> On Fri, 19 Apr 2024 13:52:07 +0200
> Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> >   Hi,
> >
> > > Gerd, any ideas?  Maybe I needs something subtly different in my
> > > edk2 build?  I've not looked at this bit of the qemu infrastructure
> > > before - is there a document on how that image is built?
> >
> > There is roms/Makefile for that.
> >
> > make -C roms help
> > make -C roms efi
> >
> > So easiest would be to just update the edk2 submodule to what you
> > need, then rebuild.
> >
> > The build is handled by the roms/edk2-build.py script,
> > with the build configuration being in roms/edk2-build.config.
> > That is usable outside the qemu source tree too, i.e. like this:
> >
> >   python3 /path/to/qemu.git/roms/edk2-build.py \
> >     --config /path/to/qemu.git/roms/edk2-build.config \
> >     --core /path/to/edk2.git \
> >     --match armvirt \
> >     --silent --no-logs
> >
> > That'll try to place the images build in "../pc-bios", so maybe better
> > work with a copy of the config file where you adjust this.
> >
> > HTH,
> >   Gerd
> >
>
> Thanks Gerd!
>
> So the builds are very similar via the two method...
> However - the QEMU build sets -D CAVIUM_ERRATUM_27456=TRUE
>
> And that's the difference - with that set for my other builds the alignment
> problems go away...
>
> Any idea why we have that set in roms/edk2-build.config?
> Superficially it seems rather unlikely anyone cares about thunderx1
> (if they do we need to get them some new hardware with fresh bugs)
> bugs now and this config file was only added last year.
>
>
> However, the last comment in Ard's commit message below seems
> highly likely to be relevant!
>
> Chasing through Ard's patch it has the side effect of dropping
> an override of a requirement for strict alignment.
> So with out the errata
> DEFINE GCC_AARCH64_CC_XIPFLAGS     = -mstrict-align -mgeneral-regs-only
> is replaced with
>  [BuildOptions]
> +!if $(CAVIUM_ERRATUM_27456) == TRUE^M
> +  GCC:*_*_AARCH64_PP_FLAGS = -DCAVIUM_ERRATUM_27456^M
> +!else^M
>    GCC:*_*_AARCH64_CC_XIPFLAGS ==
> +!endif^M
>
> The edk2 commit that added this was the following +CC Ard.
>
> Given I wasn't sure of the syntax of that file I set it
> manually to the original value and indeed it works.
>
>
> commit ec54ce1f1ab41b92782b37ae59e752fff0ef9c41
> Author: Ard Biesheuvel <ardb@kernel.org>
> Date:   Wed Jan 4 16:51:35 2023 +0100
>
>     ArmVirtPkg/ArmVirtQemu: Avoid early ID map on ThunderX
>
>     The early ID map used by ArmVirtQemu uses ASID scoped non-global
>     mappings, as this allows us to switch to the permanent ID map seamlessly
>     without the need for explicit TLB maintenance.
>
>     However, this triggers a known erratum on ThunderX, which does not
>     tolerate non-global mappings that are executable at EL1, as this appears
>     to result in I-cache corruption. (Linux disables the KPTI based Meltdown
>     mitigation on ThunderX for the same reason)
>
>     So work around this, by detecting the CPU implementor and part number,
>     and proceeding without the early ID map if a ThunderX CPU is detected.
>
>     Note that this requires the C code to be built with strict alignment
>     again, as we may end up executing it with the MMU and caches off.
>
>     Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>     Acked-by: Laszlo Ersek <lersek@redhat.com>
>     Tested-by: dann frazier <dann.frazier@canonical.com>
>
> Test case is
> qemu-system-aarch64 -M virt,virtualization=true, -m 4g -cpu cortex-a76 \
> -bios QEMU_EFI.fd -d int
>
> Which gets alignment faults since:
> https://lore.kernel.org/all/20240301204110.656742-6-richard.henderson@linaro.org/
>
> So my feeling here is EDK2 should either have yet another config for QEMU as a host
> or should always set the alignment without needing to pick the CAVIUM 27456 errata
> which I suspect will get dropped soonish anyway if anyone ever cleans up
> old errata.
>

This code was never really intended for execution at EL2, but it
happened to work, partially because TCG's lack of strict alignment
checking when the MMU is off.

Those assumptions no longer hold, so yes, let's get this fixed properly.

Given VHE and nested virt (which will likely imply VHE in practice), I
would like to extend this functionality (i.e., the use of preliminary
page tables in NOR flash) to EL2 as well, but with VHE enabled. This
means we can still elide TLB maintenance (and BBM checks) by using
different ASIDs, and otherwise, fall back to entering with the MMU off
if VHE is not available. In that case, we should enforce strict
alignment too, so that needs to be fixed regardless.

I'll try to code something up and send it round. In the mean time,
feel free to propose a minimal patch that reinstates the strict
alignment if you are pressed for time, and I'll merge it right away.
