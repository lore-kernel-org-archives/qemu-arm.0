Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp686484njb;
        Fri, 13 Dec 2024 11:26:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVlUn5PLtY5VPgNd1bUzLeoHiBG8f6/mrX+NFhj3Uvvc5f+v0NPX4INB2JZPXlJzz+yLks7ughJ3c8Nug==@linaro.org
X-Google-Smtp-Source: AGHT+IHT+R/w+fmNZIIhbljFRmpV+pMIhAsMp0Unj99Q7Pr7iZo1vsbGF4yEZleGKpBYXExIXIik
X-Received: by 2002:a05:6214:23cc:b0:6d8:7f8a:73f5 with SMTP id 6a1803df08f44-6dc8ca853a5mr65262146d6.24.1734118008091;
        Fri, 13 Dec 2024 11:26:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734118008; cv=none;
        d=google.com; s=arc-20240605;
        b=caNHdV64jxWhoPCAkFuzYEI1x37SKjAa347l8Ip3xmA0HFK8HlNOD9D0X0QHo7jgAx
         uYI9Uxo3jM4t24vgMJjwF1HhC4Nv8PvsYDOpwIYEPslVLiHL1I1uF4t99/4kPRdpryNr
         9BKhyxf2VghQ4PfA2g+fRz8D6tjSHlvtbNKwGYjppPZrFWEuoSoSCbvTAwyxCJ8NjlQg
         AI7OQL+m+Ng7ft7d2nF2YyrdGsU0ZpZm5fbIO8R/wGumLBN3ixp5pgEKPY5nNUcHWnhE
         U+ybyHV/NyrDr+spAAfJEDSTjuKx/E5h2FwnrDL89eXL8VYGiuor9o3ilJx73fytHb7B
         0nFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qhtLMeXH9xU4x0jis7KGD8/ZeE+4vnFmuGlGyWuIyIU=;
        fh=amW6r1Yz3sFgcWLU2+w/iWxwFJ4ZF4XOvrgqde9u/ig=;
        b=DGB9BHSmgK2D+stqubjBXTNEjmLWVr995/EjgZRMAM2ForoiVfhOBHwO38BQUvOKOj
         x6zCB6jPF4cAAyvQe+9GHH2EwaweV3fwiPrzbPUdxHI7Wzd8pSl04CmBJi4X3ZzNvO5e
         K8wG1kf4DJ5FoHgN8UIya7/lW349fPZUHVPTgZSCYFif0jzBNL0We8hmqz3ruBPS3Dym
         9y8lT6Dt0aKbbWxsCZi4M5GX3B5mNn6CJ14sOdK8AEZtjhM7cUr5hxLflB9Sz6iNbyF4
         edsgmu3VT+h54A3KrFhzcgWUc/nzUQJN+JXRKCC8ckTLgwaJfh+HyydIojUvJTe/c8dy
         4F3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IvAAJOG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dccd34e4b2si625236d6.197.2024.12.13.11.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 11:26:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IvAAJOG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMB71-0006DG-3h; Fri, 13 Dec 2024 14:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB6r-0005z5-9t
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 14:13:57 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB6m-0007Ty-83
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 14:13:56 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-29ff8053384so937244fac.3
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 11:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734117231; x=1734722031; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhtLMeXH9xU4x0jis7KGD8/ZeE+4vnFmuGlGyWuIyIU=;
 b=IvAAJOG8oK0BDsDYAZx48SuAksg8Ido2v1FP4Ku15CURHjFSxyw/5xnwLYVgXPE9vN
 ndYajtz/LUjacoSxhGRr+rpQWhAU2ur6Z0lVae75xB0YpE9CmBleLLNQmQ0HUuOGqyGY
 WYFDvHcGlsQxQz1TBSBq4eRiLU302pAbEniqw0fzl2rrico3CIjYyNx7whvtSHYl3hLq
 N6UCJW5C8+8M3e3fLKc6Q+PkfkDOz6VZCBHU/x5jx0Ij51qzARPHA7U2H/AaA/Dfln1N
 oBI8VJN0gVoWHto4e+nDVXIg9xizjSzA/x4qGbuNSEDWoHHRizyvgmvir2mmtimqY1jD
 lQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734117231; x=1734722031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhtLMeXH9xU4x0jis7KGD8/ZeE+4vnFmuGlGyWuIyIU=;
 b=s1hMBP3CVdcj/OS+i7p9pv6Gs7hE1ZlBTlebbyXd5iXG6w3UrEDr01FteagBw/TNz9
 BbNjkso9OTA4gjGg4FnYJgJRrZ5DMzHzFxL0RZkf6If0uLJuZP0LaO3urpncdEWUlpat
 FVB96Bv1pSdoFX7n+Oi/n2soFQmfdGoXSb3WDOaYE9urUPTBh6OdYHDUFUJheCE3DYDF
 GofDFAf5UxlxoUbrhzku30R2eD1JyEg/Ump6/4PocU4zR0l+VZjROk5ErxSYA84yZA6Y
 oHEMm1Z6rikLDnBrSozA3WD02KoSCuffJrQvy/DiEtuXVwXQ/Zel0cgbEsuox5jRq17B
 cAFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR/HhQz3ffmsM0eLfpIR3T2XWESSa0+UAibaGmTy++d1hW21VpiSa1ekOjpxXhTIhjxQx06leHpA==@nongnu.org
X-Gm-Message-State: AOJu0Yy4x+9GRs1nyxgF5fGED25ykHsIJZUsfM6PuXq8aOwBe5gNBEO8
 Y8oO3Z6blcHLWdyHu0Nt6UZGk1Gx/+XlQDRBqjBtb0bnakjFyH1CZmaEQGVBCRk=
X-Gm-Gg: ASbGncttQID5pCxASLwt9+uoSUaSAisrpCXcCEN8r+430WLOT+MtNMOQFTJZy/9CAsI
 dxk6mKZ1Dh6d4dAaxq7/w9iOD1ooxdOmLP9s15U+JqV/irKYhyhCTi18WME+svwf0LyV0O3l2WV
 gvsALf9lOfb3bfoGYJJYmTGtbXLRlXdh8cnMyuxWg+0lsb5IKRRIzPEk58OwzQvxxzJZCB1YJBE
 j93cth/bFDd4tMvEJSsquUvlW46OTnWEUQkqJvockiHWt06gXBOJjcvDyUXF7M8
X-Received: by 2002:a05:6808:f08:b0:3eb:575d:5063 with SMTP id
 5614622812f47-3eba6891dc0mr2146153b6e.23.1734117230661; 
 Fri, 13 Dec 2024 11:13:50 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3ebb478a497sm3545b6e.10.2024.12.13.11.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:13:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Samuel Tardieu <sam@rfc1149.net>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm@nongnu.org (open list:ARM cores),
 qemu-ppc@nongnu.org (open list:New World (mac99)),
 qemu-riscv@nongnu.org (open list:SiFive Machines)
Subject: [PATCH 40/71] hw/misc: Constify all Property
Date: Fri, 13 Dec 2024 13:07:14 -0600
Message-ID: <20241213190750.2513964-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213190750.2513964-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
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
X-TUID: aFfI8A6fnILJ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/a9scu.c                  | 2 +-
 hw/misc/allwinner-h3-dramc.c     | 2 +-
 hw/misc/allwinner-r40-dramc.c    | 2 +-
 hw/misc/allwinner-sid.c          | 2 +-
 hw/misc/applesmc.c               | 2 +-
 hw/misc/arm11scu.c               | 2 +-
 hw/misc/arm_l2x0.c               | 2 +-
 hw/misc/arm_sysctl.c             | 2 +-
 hw/misc/armsse-cpuid.c           | 2 +-
 hw/misc/aspeed_hace.c            | 2 +-
 hw/misc/aspeed_i3c.c             | 2 +-
 hw/misc/aspeed_lpc.c             | 2 +-
 hw/misc/aspeed_sbc.c             | 2 +-
 hw/misc/aspeed_scu.c             | 2 +-
 hw/misc/aspeed_sdmc.c            | 2 +-
 hw/misc/bcm2835_cprman.c         | 2 +-
 hw/misc/bcm2835_property.c       | 2 +-
 hw/misc/debugexit.c              | 2 +-
 hw/misc/eccmemctl.c              | 2 +-
 hw/misc/empty_slot.c             | 2 +-
 hw/misc/iotkit-secctl.c          | 2 +-
 hw/misc/iotkit-sysctl.c          | 2 +-
 hw/misc/iotkit-sysinfo.c         | 2 +-
 hw/misc/ivshmem.c                | 4 ++--
 hw/misc/led.c                    | 2 +-
 hw/misc/mac_via.c                | 2 +-
 hw/misc/macio/cuda.c             | 2 +-
 hw/misc/macio/macio.c            | 4 ++--
 hw/misc/macio/pmu.c              | 2 +-
 hw/misc/mips_cmgcr.c             | 2 +-
 hw/misc/mips_cpc.c               | 2 +-
 hw/misc/mips_itu.c               | 2 +-
 hw/misc/mos6522.c                | 2 +-
 hw/misc/mps2-fpgaio.c            | 2 +-
 hw/misc/mps2-scc.c               | 2 +-
 hw/misc/msf2-sysreg.c            | 2 +-
 hw/misc/npcm7xx_gcr.c            | 2 +-
 hw/misc/nrf51_rng.c              | 2 +-
 hw/misc/pci-testdev.c            | 2 +-
 hw/misc/pvpanic-isa.c            | 2 +-
 hw/misc/pvpanic-pci.c            | 2 +-
 hw/misc/sifive_e_aon.c           | 2 +-
 hw/misc/sifive_u_otp.c           | 2 +-
 hw/misc/stm32l4x5_rcc.c          | 2 +-
 hw/misc/tz-mpc.c                 | 2 +-
 hw/misc/tz-msc.c                 | 2 +-
 hw/misc/tz-ppc.c                 | 2 +-
 hw/misc/unimp.c                  | 2 +-
 hw/misc/xlnx-versal-cframe-reg.c | 4 ++--
 hw/misc/xlnx-versal-cfu.c        | 4 ++--
 hw/misc/xlnx-versal-xramc.c      | 2 +-
 hw/misc/zynq_slcr.c              | 2 +-
 52 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/hw/misc/a9scu.c b/hw/misc/a9scu.c
index a40d5072de..e2d73edde8 100644
--- a/hw/misc/a9scu.c
+++ b/hw/misc/a9scu.c
@@ -123,7 +123,7 @@ static const VMStateDescription vmstate_a9_scu = {
     }
 };
 
-static Property a9_scu_properties[] = {
+static const Property a9_scu_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", A9SCUState, num_cpu, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/misc/allwinner-h3-dramc.c b/hw/misc/allwinner-h3-dramc.c
index eeab0dc5d2..247bf62c43 100644
--- a/hw/misc/allwinner-h3-dramc.c
+++ b/hw/misc/allwinner-h3-dramc.c
@@ -314,7 +314,7 @@ static void allwinner_h3_dramc_init(Object *obj)
     sysbus_init_mmio(sbd, &s->dramphy_iomem);
 }
 
-static Property allwinner_h3_dramc_properties[] = {
+static const Property allwinner_h3_dramc_properties[] = {
     DEFINE_PROP_UINT64("ram-addr", AwH3DramCtlState, ram_addr, 0x0),
     DEFINE_PROP_UINT32("ram-size", AwH3DramCtlState, ram_size, 256 * MiB),
     DEFINE_PROP_END_OF_LIST()
diff --git a/hw/misc/allwinner-r40-dramc.c b/hw/misc/allwinner-r40-dramc.c
index 3ae4890037..a51284ff91 100644
--- a/hw/misc/allwinner-r40-dramc.c
+++ b/hw/misc/allwinner-r40-dramc.c
@@ -464,7 +464,7 @@ static void allwinner_r40_dramc_init(Object *obj)
     sysbus_init_mmio(sbd, &s->dramphy_iomem);
 }
 
-static Property allwinner_r40_dramc_properties[] = {
+static const Property allwinner_r40_dramc_properties[] = {
     DEFINE_PROP_UINT64("ram-addr", AwR40DramCtlState, ram_addr, 0x0),
     DEFINE_PROP_UINT32("ram-size", AwR40DramCtlState, ram_size, 256), /* MiB */
     DEFINE_PROP_END_OF_LIST()
diff --git a/hw/misc/allwinner-sid.c b/hw/misc/allwinner-sid.c
index 19ff17d24a..3a09dca111 100644
--- a/hw/misc/allwinner-sid.c
+++ b/hw/misc/allwinner-sid.c
@@ -127,7 +127,7 @@ static void allwinner_sid_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-static Property allwinner_sid_properties[] = {
+static const Property allwinner_sid_properties[] = {
     DEFINE_PROP_UUID_NODEFAULT("identifier", AwSidState, identifier),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 5b766277d6..9d0e273e33 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -350,7 +350,7 @@ static void applesmc_unrealize(DeviceState *dev)
     }
 }
 
-static Property applesmc_isa_properties[] = {
+static const Property applesmc_isa_properties[] = {
     DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
                        APPLESMC_DEFAULT_IOBASE),
     DEFINE_PROP_STRING("osk", AppleSMCState, osk),
diff --git a/hw/misc/arm11scu.c b/hw/misc/arm11scu.c
index 17c36a0545..37feed9da7 100644
--- a/hw/misc/arm11scu.c
+++ b/hw/misc/arm11scu.c
@@ -75,7 +75,7 @@ static void arm11_scu_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-static Property arm11_scu_properties[] = {
+static const Property arm11_scu_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", ARM11SCUState, num_cpu, 1),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c
index 1902ebd3bc..9c209f13b0 100644
--- a/hw/misc/arm_l2x0.c
+++ b/hw/misc/arm_l2x0.c
@@ -173,7 +173,7 @@ static void l2x0_priv_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
-static Property l2x0_properties[] = {
+static const Property l2x0_properties[] = {
     DEFINE_PROP_UINT32("cache-type", L2x0State, cache_type, 0x1c100100),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
index 9c4dce350a..69e379fa10 100644
--- a/hw/misc/arm_sysctl.c
+++ b/hw/misc/arm_sysctl.c
@@ -623,7 +623,7 @@ static void arm_sysctl_finalize(Object *obj)
     g_free(s->db_clock_reset);
 }
 
-static Property arm_sysctl_properties[] = {
+static const Property arm_sysctl_properties[] = {
     DEFINE_PROP_UINT32("sys_id", arm_sysctl_state, sys_id, 0),
     DEFINE_PROP_UINT32("proc_id", arm_sysctl_state, proc_id, 0),
     /* Daughterboard power supply voltages (as reported via SYS_CFG) */
diff --git a/hw/misc/armsse-cpuid.c b/hw/misc/armsse-cpuid.c
index e785a09051..b05bcdcabc 100644
--- a/hw/misc/armsse-cpuid.c
+++ b/hw/misc/armsse-cpuid.c
@@ -92,7 +92,7 @@ static const MemoryRegionOps armsse_cpuid_ops = {
     .valid.max_access_size = 4,
 };
 
-static Property armsse_cpuid_props[] = {
+static const Property armsse_cpuid_props[] = {
     DEFINE_PROP_UINT32("CPUID", ARMSSECPUID, cpuid, 0),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index bc1d66ad80..5cefbadf9a 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -436,7 +436,7 @@ static void aspeed_hace_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-static Property aspeed_hace_properties[] = {
+static const Property aspeed_hace_properties[] = {
     DEFINE_PROP_LINK("dram", AspeedHACEState, dram_mr,
                      TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/aspeed_i3c.c b/hw/misc/aspeed_i3c.c
index 371ee7dba8..7f5a389864 100644
--- a/hw/misc/aspeed_i3c.c
+++ b/hw/misc/aspeed_i3c.c
@@ -323,7 +323,7 @@ static void aspeed_i3c_realize(DeviceState *dev, Error **errp)
 
 }
 
-static Property aspeed_i3c_device_properties[] = {
+static const Property aspeed_i3c_device_properties[] = {
     DEFINE_PROP_UINT8("device-id", AspeedI3CDevice, id, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/misc/aspeed_lpc.c b/hw/misc/aspeed_lpc.c
index f2d4ca6f43..bb9066b0f0 100644
--- a/hw/misc/aspeed_lpc.c
+++ b/hw/misc/aspeed_lpc.c
@@ -454,7 +454,7 @@ static const VMStateDescription vmstate_aspeed_lpc = {
     }
 };
 
-static Property aspeed_lpc_properties[] = {
+static const Property aspeed_lpc_properties[] = {
     DEFINE_PROP_UINT32("hicr7", AspeedLPCState, hicr7, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index f5eb2a0e37..b97cf51fa1 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -136,7 +136,7 @@ static const VMStateDescription vmstate_aspeed_sbc = {
     }
 };
 
-static Property aspeed_sbc_properties[] = {
+static const Property aspeed_sbc_properties[] = {
     DEFINE_PROP_BOOL("emmc-abr", AspeedSBCState, emmc_abr, 0),
     DEFINE_PROP_UINT32("signing-settings", AspeedSBCState, signing_settings, 0),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 2c919349cf..ac33b8d6cb 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -602,7 +602,7 @@ static const VMStateDescription vmstate_aspeed_scu = {
     }
 };
 
-static Property aspeed_scu_properties[] = {
+static const Property aspeed_scu_properties[] = {
     DEFINE_PROP_UINT32("silicon-rev", AspeedSCUState, silicon_rev, 0),
     DEFINE_PROP_UINT32("hw-strap1", AspeedSCUState, hw_strap1, 0),
     DEFINE_PROP_UINT32("hw-strap2", AspeedSCUState, hw_strap2, 0),
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 4bc9faf691..4980080f74 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -294,7 +294,7 @@ static const VMStateDescription vmstate_aspeed_sdmc = {
     }
 };
 
-static Property aspeed_sdmc_properties[] = {
+static const Property aspeed_sdmc_properties[] = {
     DEFINE_PROP_UINT64("max-ram-size", AspeedSDMCState, max_ram_size, 0),
     DEFINE_PROP_BOOL("unlocked", AspeedSDMCState, unlocked, false),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
index 63e1045abf..1a20cd0bc8 100644
--- a/hw/misc/bcm2835_cprman.c
+++ b/hw/misc/bcm2835_cprman.c
@@ -778,7 +778,7 @@ static const VMStateDescription cprman_vmstate = {
     }
 };
 
-static Property cprman_properties[] = {
+static const Property cprman_properties[] = {
     DEFINE_PROP_UINT32("xosc-freq-hz", BCM2835CprmanState, xosc_freq, 19200000),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 8ca3128f29..09a6f2c6e3 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -551,7 +551,7 @@ static void bcm2835_property_realize(DeviceState *dev, Error **errp)
     bcm2835_property_reset(dev);
 }
 
-static Property bcm2835_property_props[] = {
+static const Property bcm2835_property_props[] = {
     DEFINE_PROP_UINT32("board-rev", BCM2835PropertyState, board_rev, 0),
     DEFINE_PROP_STRING("command-line", BCM2835PropertyState, command_line),
     DEFINE_PROP_END_OF_LIST()
diff --git a/hw/misc/debugexit.c b/hw/misc/debugexit.c
index c5c562fd93..639a8cc3e3 100644
--- a/hw/misc/debugexit.c
+++ b/hw/misc/debugexit.c
@@ -56,7 +56,7 @@ static void debug_exit_realizefn(DeviceState *d, Error **errp)
                                 isa->iobase, &isa->io);
 }
 
-static Property debug_exit_properties[] = {
+static const Property debug_exit_properties[] = {
     DEFINE_PROP_UINT32("iobase", ISADebugExitState, iobase, 0x501),
     DEFINE_PROP_UINT32("iosize", ISADebugExitState, iosize, 0x02),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/eccmemctl.c b/hw/misc/eccmemctl.c
index 0f68fbe1b6..4fc88bd4e5 100644
--- a/hw/misc/eccmemctl.c
+++ b/hw/misc/eccmemctl.c
@@ -325,7 +325,7 @@ static void ecc_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static Property ecc_properties[] = {
+static const Property ecc_properties[] = {
     DEFINE_PROP_UINT32("version", ECCState, version, -1),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/misc/empty_slot.c b/hw/misc/empty_slot.c
index 37b0ddfb02..79572c5be0 100644
--- a/hw/misc/empty_slot.c
+++ b/hw/misc/empty_slot.c
@@ -79,7 +79,7 @@ static void empty_slot_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
 }
 
-static Property empty_slot_properties[] = {
+static const Property empty_slot_properties[] = {
     DEFINE_PROP_UINT64("size", EmptySlot, size, 0),
     DEFINE_PROP_STRING("name", EmptySlot, name),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 6e22f2aad6..abb6a963ca 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -814,7 +814,7 @@ static const VMStateDescription iotkit_secctl_vmstate = {
     },
 };
 
-static Property iotkit_secctl_props[] = {
+static const Property iotkit_secctl_props[] = {
     DEFINE_PROP_UINT32("sse-version", IoTKitSecCtl, sse_version, 0),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index c1b357e6b7..23b49d7dff 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -835,7 +835,7 @@ static const VMStateDescription iotkit_sysctl_vmstate = {
     }
 };
 
-static Property iotkit_sysctl_props[] = {
+static const Property iotkit_sysctl_props[] = {
     DEFINE_PROP_UINT32("sse-version", IoTKitSysCtl, sse_version, 0),
     DEFINE_PROP_UINT32("CPUWAIT_RST", IoTKitSysCtl, cpuwait_rst, 0),
     DEFINE_PROP_UINT32("INITSVTOR0_RST", IoTKitSysCtl, initsvtor0_rst,
diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
index aaa9305b2e..7d4eea6bfb 100644
--- a/hw/misc/iotkit-sysinfo.c
+++ b/hw/misc/iotkit-sysinfo.c
@@ -131,7 +131,7 @@ static const MemoryRegionOps iotkit_sysinfo_ops = {
     .valid.max_access_size = 4,
 };
 
-static Property iotkit_sysinfo_props[] = {
+static const Property iotkit_sysinfo_props[] = {
     DEFINE_PROP_UINT32("SYS_VERSION", IoTKitSysInfo, sys_version, 0),
     DEFINE_PROP_UINT32("SYS_CONFIG", IoTKitSysInfo, sys_config, 0),
     DEFINE_PROP_UINT32("sse-version", IoTKitSysInfo, sse_version, 0),
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 5ce3fc0949..6d735ec29f 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -1022,7 +1022,7 @@ static const VMStateDescription ivshmem_plain_vmsd = {
     },
 };
 
-static Property ivshmem_plain_properties[] = {
+static const Property ivshmem_plain_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("master", IVShmemState, master, ON_OFF_AUTO_OFF),
     DEFINE_PROP_LINK("memdev", IVShmemState, hostmem, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
@@ -1077,7 +1077,7 @@ static const VMStateDescription ivshmem_doorbell_vmsd = {
     },
 };
 
-static Property ivshmem_doorbell_properties[] = {
+static const Property ivshmem_doorbell_properties[] = {
     DEFINE_PROP_CHR("chardev", IVShmemState, server_chr),
     DEFINE_PROP_UINT32("vectors", IVShmemState, vectors, 1),
     DEFINE_PROP_BIT("ioeventfd", IVShmemState, features, IVSHMEM_IOEVENTFD,
diff --git a/hw/misc/led.c b/hw/misc/led.c
index 4bb6ce8d29..76efdbc3f1 100644
--- a/hw/misc/led.c
+++ b/hw/misc/led.c
@@ -101,7 +101,7 @@ static void led_realize(DeviceState *dev, Error **errp)
     qdev_init_gpio_in(DEVICE(s), led_set_state_gpio_handler, 1);
 }
 
-static Property led_properties[] = {
+static const Property led_properties[] = {
     DEFINE_PROP_STRING("color", LEDState, color),
     DEFINE_PROP_STRING("description", LEDState, description),
     DEFINE_PROP_BOOL("gpio-active-high", LEDState, gpio_active_high, true),
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index af2b2b1af3..a376a2b8a0 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1322,7 +1322,7 @@ static const VMStateDescription vmstate_q800_via1 = {
     }
 };
 
-static Property mos6522_q800_via1_properties[] = {
+static const Property mos6522_q800_via1_properties[] = {
     DEFINE_PROP_DRIVE("drive", MOS6522Q800VIA1State, blk),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index 1db7ebf3e2..cfc8afd1dc 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -554,7 +554,7 @@ static void cuda_init(Object *obj)
               DEVICE(obj), "adb.0");
 }
 
-static Property cuda_properties[] = {
+static const Property cuda_properties[] = {
     DEFINE_PROP_UINT64("timebase-frequency", CUDAState, tb_frequency, 0),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 3f449f91c0..7e3d5aa977 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -405,7 +405,7 @@ static const VMStateDescription vmstate_macio_newworld = {
     }
 };
 
-static Property macio_newworld_properties[] = {
+static const Property macio_newworld_properties[] = {
     DEFINE_PROP_BOOL("has-pmu", NewWorldMacIOState, has_pmu, false),
     DEFINE_PROP_BOOL("has-adb", NewWorldMacIOState, has_adb, false),
     DEFINE_PROP_END_OF_LIST()
@@ -422,7 +422,7 @@ static void macio_newworld_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, macio_newworld_properties);
 }
 
-static Property macio_properties[] = {
+static const Property macio_properties[] = {
     DEFINE_PROP_UINT64("frequency", MacIOState, frequency, 0),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index 4b451e0af3..64bf44f67f 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -760,7 +760,7 @@ static void pmu_init(Object *obj)
     sysbus_init_mmio(d, &s->mem);
 }
 
-static Property pmu_properties[] = {
+static const Property pmu_properties[] = {
     DEFINE_PROP_BOOL("has-adb", PMUState, has_adb, true),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/misc/mips_cmgcr.c b/hw/misc/mips_cmgcr.c
index 04256aacdc..80ca224f76 100644
--- a/hw/misc/mips_cmgcr.c
+++ b/hw/misc/mips_cmgcr.c
@@ -211,7 +211,7 @@ static const VMStateDescription vmstate_mips_gcr = {
     },
 };
 
-static Property mips_gcr_properties[] = {
+static const Property mips_gcr_properties[] = {
     DEFINE_PROP_UINT32("num-vp", MIPSGCRState, num_vps, 1),
     DEFINE_PROP_INT32("gcr-rev", MIPSGCRState, gcr_rev, 0x800),
     DEFINE_PROP_UINT64("gcr-base", MIPSGCRState, gcr_base, GCR_BASE_ADDR),
diff --git a/hw/misc/mips_cpc.c b/hw/misc/mips_cpc.c
index 2f7fb8167f..86ff0f7ad8 100644
--- a/hw/misc/mips_cpc.c
+++ b/hw/misc/mips_cpc.c
@@ -163,7 +163,7 @@ static const VMStateDescription vmstate_mips_cpc = {
     },
 };
 
-static Property mips_cpc_properties[] = {
+static const Property mips_cpc_properties[] = {
     DEFINE_PROP_UINT32("num-vp", MIPSCPCState, num_vp, 0x1),
     DEFINE_PROP_UINT64("vp-start-running", MIPSCPCState, vp_start_running, 0x1),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index c5214c8b30..d84a7dbf15 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -533,7 +533,7 @@ static void mips_itu_reset(DeviceState *dev)
     itc_reset_cells(s);
 }
 
-static Property mips_itu_properties[] = {
+static const Property mips_itu_properties[] = {
     DEFINE_PROP_UINT32("num-fifo", MIPSITUState, num_fifo,
                       ITC_FIFO_NUM_MAX),
     DEFINE_PROP_UINT32("num-semaphores", MIPSITUState, num_semaphores,
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 515f62e687..0225a5869b 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -696,7 +696,7 @@ static void mos6522_finalize(Object *obj)
     timer_free(s->timers[1].timer);
 }
 
-static Property mos6522_properties[] = {
+static const Property mos6522_properties[] = {
     DEFINE_PROP_UINT64("frequency", MOS6522State, frequency, 0),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index 20359254ba..2e8d1c721c 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -319,7 +319,7 @@ static const VMStateDescription mps2_fpgaio_vmstate = {
     },
 };
 
-static Property mps2_fpgaio_properties[] = {
+static const Property mps2_fpgaio_properties[] = {
     /* Frequency of the prescale counter */
     DEFINE_PROP_UINT32("prescale-clk", MPS2FPGAIO, prescale_clk, 20000000),
     /* Number of LEDs controlled by LED0 register */
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index d45ff77bd6..f378b75571 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -456,7 +456,7 @@ static const VMStateDescription mps2_scc_vmstate = {
     }
 };
 
-static Property mps2_scc_properties[] = {
+static const Property mps2_scc_properties[] = {
     /* Values for various read-only ID registers (which are specific
      * to the board model or FPGA image)
      */
diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
index b8dde198c6..0d7a713c76 100644
--- a/hw/misc/msf2-sysreg.c
+++ b/hw/misc/msf2-sysreg.c
@@ -118,7 +118,7 @@ static const VMStateDescription vmstate_msf2_sysreg = {
     }
 };
 
-static Property msf2_sysreg_properties[] = {
+static const Property msf2_sysreg_properties[] = {
     /* default divisors in Libero GUI */
     DEFINE_PROP_UINT8("apb0divisor", MSF2SysregState, apb0div, 2),
     DEFINE_PROP_UINT8("apb1divisor", MSF2SysregState, apb1div, 2),
diff --git a/hw/misc/npcm7xx_gcr.c b/hw/misc/npcm7xx_gcr.c
index c4c4e246d7..17aeaf22cb 100644
--- a/hw/misc/npcm7xx_gcr.c
+++ b/hw/misc/npcm7xx_gcr.c
@@ -229,7 +229,7 @@ static const VMStateDescription vmstate_npcm7xx_gcr = {
     },
 };
 
-static Property npcm7xx_gcr_properties[] = {
+static const Property npcm7xx_gcr_properties[] = {
     DEFINE_PROP_UINT32("disabled-modules", NPCM7xxGCRState, reset_mdlr, 0),
     DEFINE_PROP_UINT32("power-on-straps", NPCM7xxGCRState, reset_pwron, 0),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/nrf51_rng.c b/hw/misc/nrf51_rng.c
index 2d67f3f766..2b550a6bca 100644
--- a/hw/misc/nrf51_rng.c
+++ b/hw/misc/nrf51_rng.c
@@ -219,7 +219,7 @@ static void nrf51_rng_reset(DeviceState *dev)
 }
 
 
-static Property nrf51_rng_properties[] = {
+static const Property nrf51_rng_properties[] = {
     DEFINE_PROP_UINT16("period_unfiltered_us", NRF51RNGState,
             period_unfiltered_us, 167),
     DEFINE_PROP_UINT16("period_filtered_us", NRF51RNGState,
diff --git a/hw/misc/pci-testdev.c b/hw/misc/pci-testdev.c
index 0b5f236a20..7927397a23 100644
--- a/hw/misc/pci-testdev.c
+++ b/hw/misc/pci-testdev.c
@@ -319,7 +319,7 @@ static void qdev_pci_testdev_reset(DeviceState *dev)
     pci_testdev_reset(d);
 }
 
-static Property pci_testdev_properties[] = {
+static const Property pci_testdev_properties[] = {
     DEFINE_PROP_SIZE("membar", PCITestDevState, membar_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
index 9a923b7869..824a2e4528 100644
--- a/hw/misc/pvpanic-isa.c
+++ b/hw/misc/pvpanic-isa.c
@@ -98,7 +98,7 @@ static void build_pvpanic_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     aml_append(scope, dev);
 }
 
-static Property pvpanic_isa_properties[] = {
+static const Property pvpanic_isa_properties[] = {
     DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicISAState, ioport, 0x505),
     DEFINE_PROP_UINT8("events", PVPanicISAState, pvpanic.events,
                       PVPANIC_EVENTS),
diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
index 106d03ccd6..1c3eafc137 100644
--- a/hw/misc/pvpanic-pci.c
+++ b/hw/misc/pvpanic-pci.c
@@ -53,7 +53,7 @@ static void pvpanic_pci_realizefn(PCIDevice *dev, Error **errp)
     pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &ps->mr);
 }
 
-static Property pvpanic_pci_properties[] = {
+static const Property pvpanic_pci_properties[] = {
     DEFINE_PROP_UINT8("events", PVPanicPCIState, pvpanic.events,
                       PVPANIC_EVENTS),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/sifive_e_aon.c b/hw/misc/sifive_e_aon.c
index f819fc10e6..c48429b131 100644
--- a/hw/misc/sifive_e_aon.c
+++ b/hw/misc/sifive_e_aon.c
@@ -289,7 +289,7 @@ static void sifive_e_aon_init(Object *obj)
     sysbus_init_irq(sbd, &r->wdog_irq);
 }
 
-static Property sifive_e_aon_properties[] = {
+static const Property sifive_e_aon_properties[] = {
     DEFINE_PROP_UINT64("wdogclk-frequency", SiFiveEAONState, wdogclk_freq,
                        SIFIVE_E_LFCLK_DEFAULT_FREQ),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 8965f5c22a..32cd8e8dfb 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -194,7 +194,7 @@ static const MemoryRegionOps sifive_u_otp_ops = {
     }
 };
 
-static Property sifive_u_otp_properties[] = {
+static const Property sifive_u_otp_properties[] = {
     DEFINE_PROP_UINT32("serial", SiFiveUOTPState, serial, 0),
     DEFINE_PROP_DRIVE("drive", SiFiveUOTPState, blk),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
index 59d428fa66..b61241d195 100644
--- a/hw/misc/stm32l4x5_rcc.c
+++ b/hw/misc/stm32l4x5_rcc.c
@@ -1426,7 +1426,7 @@ static void stm32l4x5_rcc_realize(DeviceState *dev, Error **errp)
     clock_update(s->gnd, 0);
 }
 
-static Property stm32l4x5_rcc_properties[] = {
+static const Property stm32l4x5_rcc_properties[] = {
     DEFINE_PROP_UINT64("hse_frequency", Stm32l4x5RccState,
         hse_frequency, HSE_DEFAULT_FRQ),
     DEFINE_PROP_UINT64("sai1_extclk_frequency", Stm32l4x5RccState,
diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index 66a46a7b9f..b06eb9f119 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -587,7 +587,7 @@ static const VMStateDescription tz_mpc_vmstate = {
     }
 };
 
-static Property tz_mpc_properties[] = {
+static const Property tz_mpc_properties[] = {
     DEFINE_PROP_LINK("downstream", TZMPC, downstream,
                      TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/tz-msc.c b/hw/misc/tz-msc.c
index 82ccaa014a..96413a502d 100644
--- a/hw/misc/tz-msc.c
+++ b/hw/misc/tz-msc.c
@@ -278,7 +278,7 @@ static const VMStateDescription tz_msc_vmstate = {
     }
 };
 
-static Property tz_msc_properties[] = {
+static const Property tz_msc_properties[] = {
     DEFINE_PROP_LINK("downstream", TZMSC, downstream,
                      TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_LINK("idau", TZMSC, idau,
diff --git a/hw/misc/tz-ppc.c b/hw/misc/tz-ppc.c
index 922dcf7f63..1943d8d165 100644
--- a/hw/misc/tz-ppc.c
+++ b/hw/misc/tz-ppc.c
@@ -305,7 +305,7 @@ static const VMStateDescription tz_ppc_vmstate = {
     DEFINE_PROP_LINK("port[" #N "]", TZPPC, port[N].downstream, \
                      TYPE_MEMORY_REGION, MemoryRegion *)
 
-static Property tz_ppc_properties[] = {
+static const Property tz_ppc_properties[] = {
     DEFINE_PROP_UINT32("NONSEC_MASK", TZPPC, nonsec_mask, 0),
     DEFINE_PORT(0),
     DEFINE_PORT(1),
diff --git a/hw/misc/unimp.c b/hw/misc/unimp.c
index 6cfc5727f0..62e1153627 100644
--- a/hw/misc/unimp.c
+++ b/hw/misc/unimp.c
@@ -70,7 +70,7 @@ static void unimp_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
 }
 
-static Property unimp_properties[] = {
+static const Property unimp_properties[] = {
     DEFINE_PROP_UINT64("size", UnimplementedDeviceState, size, 0),
     DEFINE_PROP_STRING("name", UnimplementedDeviceState, name),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/xlnx-versal-cframe-reg.c b/hw/misc/xlnx-versal-cframe-reg.c
index 3fc838bd54..8281a9baff 100644
--- a/hw/misc/xlnx-versal-cframe-reg.c
+++ b/hw/misc/xlnx-versal-cframe-reg.c
@@ -720,7 +720,7 @@ static const VMStateDescription vmstate_cframe_reg = {
     }
 };
 
-static Property cframe_regs_props[] = {
+static const Property cframe_regs_props[] = {
     DEFINE_PROP_LINK("cfu-fdro", XlnxVersalCFrameReg, cfg.cfu_fdro,
                      TYPE_XLNX_CFI_IF, XlnxCfiIf *),
     DEFINE_PROP_UINT32("blktype0-frames", XlnxVersalCFrameReg,
@@ -771,7 +771,7 @@ static const VMStateDescription vmstate_cframe_bcast_reg = {
     }
 };
 
-static Property cframe_bcast_regs_props[] = {
+static const Property cframe_bcast_regs_props[] = {
     DEFINE_PROP_LINK("cframe0", XlnxVersalCFrameBcastReg, cfg.cframe[0],
                      TYPE_XLNX_CFI_IF, XlnxCfiIf *),
     DEFINE_PROP_LINK("cframe1", XlnxVersalCFrameBcastReg, cfg.cframe[1],
diff --git a/hw/misc/xlnx-versal-cfu.c b/hw/misc/xlnx-versal-cfu.c
index 94f85814c8..7cfdabdb8e 100644
--- a/hw/misc/xlnx-versal-cfu.c
+++ b/hw/misc/xlnx-versal-cfu.c
@@ -426,7 +426,7 @@ static void cfu_fdro_cfi_transfer_packet(XlnxCfiIf *cfi_if, XlnxCfiPacket *pkt)
     }
 }
 
-static Property cfu_props[] = {
+static const Property cfu_props[] = {
         DEFINE_PROP_LINK("cframe0", XlnxVersalCFUAPB, cfg.cframe[0],
                          TYPE_XLNX_CFI_IF, XlnxCfiIf *),
         DEFINE_PROP_LINK("cframe1", XlnxVersalCFUAPB, cfg.cframe[1],
@@ -460,7 +460,7 @@ static Property cfu_props[] = {
         DEFINE_PROP_END_OF_LIST(),
 };
 
-static Property cfu_sfr_props[] = {
+static const Property cfu_sfr_props[] = {
         DEFINE_PROP_LINK("cfu", XlnxVersalCFUSFR, cfg.cfu,
                          TYPE_XLNX_VERSAL_CFU_APB, XlnxVersalCFUAPB *),
         DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/misc/xlnx-versal-xramc.c b/hw/misc/xlnx-versal-xramc.c
index ad839ce7e9..a06b9fbc05 100644
--- a/hw/misc/xlnx-versal-xramc.c
+++ b/hw/misc/xlnx-versal-xramc.c
@@ -218,7 +218,7 @@ static const VMStateDescription vmstate_xram_ctrl = {
     }
 };
 
-static Property xram_ctrl_properties[] = {
+static const Property xram_ctrl_properties[] = {
     DEFINE_PROP_UINT64("size", XlnxXramCtrl, cfg.size, 1 * MiB),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index ad814c3a79..ffa14ecb84 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -623,7 +623,7 @@ static const VMStateDescription vmstate_zynq_slcr = {
     }
 };
 
-static Property zynq_slcr_props[] = {
+static const Property zynq_slcr_props[] = {
     DEFINE_PROP_UINT8("boot-mode", ZynqSLCRState, boot_mode, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.43.0

