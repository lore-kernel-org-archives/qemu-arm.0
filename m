Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp489549njb;
        Wed, 4 Dec 2024 12:28:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVXqjJJzdsX+oXuZ+TzU+Xo2xQt44Yo75AlpcOZbZ0jS8bmx3ln3fp3snGLMDzXZiP8Kc2+ErbBwB6LFw==@linaro.org
X-Google-Smtp-Source: AGHT+IEMPuMFL16uYjxwcyTHHeYuZhkYJZfn/zmxiQuIECykAJGnrRyA4KIOlJWYsOc03KzaSXXI
X-Received: by 2002:a05:620a:2451:b0:7b6:7850:21e2 with SMTP id af79cd13be357-7b6a618c044mr1015172785a.33.1733344100176;
        Wed, 04 Dec 2024 12:28:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344100; cv=none;
        d=google.com; s=arc-20240605;
        b=NBJIKukUfhunIQnpuUh3G6wk/UFRt2+e3VVQW+fZXu9nLcPCEUT68D8pgOyMcNv3Sr
         I8ly53lPF+BRbLezxMa0/8K2q5Qz17KlCOkD3pMzFIJi86X3xuBMOhbIlWKoWNCg9d0I
         oAmRx8FynPEoJ4tENbE2ohrNtZeAOaIRSLAFGcVE/iMkizflR5++l14CflkiHqNCTSZU
         1u1GfmqOGsSp9GRmjhWpWGLid7kTFWxekP/m2NK235h6WnhYpH8BVil2uySdf+fpLggZ
         G7zqYnqnt15iTTXGGahxRCmiQ4z4bkk6x4QeqU9p+A/yr/H6PNjGzmCOPaIe78Q/oA1f
         d0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9GnnholsvXz5CZtkYpeYGZkC8DvPWibSAfIk7aKacnw=;
        fh=L8jp5KII9BO+EuE1/Uny/8be6w87XhXr9oO98kXieYU=;
        b=Wbhy034v6R0Rald8uivy8vqyuMVnqoPzopKGgzFQtTdAC97QEugLOrbtCFtso4qG6r
         HodgZaMoqNlnr1y3BzLcWxmbciYsC+Ssly4A4eP/HBMDiiQqzB2VLzGwQNBzRPV/bhYB
         SfSgYY2/E8sX41+4it4Q1EtgnpCMjrHgAwrsETGI6OOWONdtNSvQVkEWd/Tki+/efIXZ
         7GmRFR75SbESmHm1f/3mMNtoYOR03hmqef5X3+RAYyfw8HP/I8RFVmjMFDbL3KmnZ1az
         WUDMvXmYJ547HizCRWdcI4Yb5YzanM/bPDu4RNy0MgSmxGM3dQwry4+IGyD09Vhaop0B
         R66g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uYyGvG58;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b684923ad2si2050259285a.73.2024.12.04.12.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:28:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uYyGvG58;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIvyd-0001wS-Q0; Wed, 04 Dec 2024 15:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyW-0001Gx-V0
 for qemu-devel@nongnu.org; Wed, 04 Dec 2024 15:27:57 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyU-0001Ww-Fq
 for qemu-devel@nongnu.org; Wed, 04 Dec 2024 15:27:56 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434aa222d96so2393035e9.0
 for <qemu-devel@nongnu.org>; Wed, 04 Dec 2024 12:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344073; x=1733948873; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9GnnholsvXz5CZtkYpeYGZkC8DvPWibSAfIk7aKacnw=;
 b=uYyGvG58JlzTGx5rVpLPfZ2LrWGD8dsWbtsIn9C26NLQW1zvSJnEDYLmlzbE7oEpOc
 5likb0GTJmdyxL/fyZw0+CXdL4HUE779RK9SPI2v+3hX18U0sGnmHhrYPsSnPD0z48gO
 CPqp9oPbSsYLmLy+CM3EXvDQJK1tCRoMf6ov+OPavCnDsQ/66A2OG8FWqcSt2+ApJBQo
 nbR5eq7qh/X1Twzxb8ABqe2WmEYPCz291Egwp/QPyoF2JYeaHbEWKBtFrp28O0A7IXd3
 xRcu6EAlp8e44cVJ4HRC4zFEBJrPVfocg8RKlxRdXSzWyJHt9nny8stR1aj5lj0C11rv
 xKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344073; x=1733948873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GnnholsvXz5CZtkYpeYGZkC8DvPWibSAfIk7aKacnw=;
 b=FtqNQ0Apnf22WADUpeEhJRH4w2dLnPqT2Kaoi2xsFu61feQVWayMq58IvkOAP0vraz
 oEj/sT5YDREtbPr2E2Zvf3Oj1j47kgXr0GqjCTrKzHcT0FcFGNzGQNHlM0jRdquDGcID
 G4xnNtTB5jVvxd0Q0WFUjylE5KFto3CpdWYsi3/34q4nEcmpIpbB0/hkpwXW0mJ825Il
 gyN0BiXe774p/LtX61NqERj+PG6j0OEtn7TDKd233Ysk3JwqpDbF3rQJGbuluq0ovYtA
 qpOEkREQAfmSUyyjSVbTQwRGSFxcmLt8fhVQTAutafQ5l4RjDac9BiPACxjAnf6Us+C8
 C6Qw==
X-Gm-Message-State: AOJu0YxEcn28y7IfCII51BqU906DsCpKp1S3njMxltK7UN6TEZCSWQq3
 y0D462YkCrwZDHdF22B1bBi80WzsfFTOfgA7jbuXeqCATz1mM+BLmYNEV/WT7WuzO6jJ+pckbNy
 d
X-Gm-Gg: ASbGncvV6vkI2tPyEPRItlMwOszsI5PH538BaE8HY7IY3XrO2Uf4DJ9KeE/FjcWgvW/
 VJWJ31iJJSyMoJEkm13hs0g11ufE0nc3EiA1XdIdkuyDdA9QezvCd8htsxwTiBShHxs38tTXPsc
 ckZMrtkI7vWMCjARrqyJIJOMU8rhR/5zb2L7QyAEKn6fPcgH1HVajqQNjNy0W2jRElFLbySM1Gx
 NShyTUinzszvM3+HDrP9IgnjLH2hZabQhhZ+/8GdeTqukvNuze9UmtZ077+SHYgrGzt/ygRtSZb
 7Y2mg23zb32/clnIMnGzz3AK
X-Received: by 2002:a05:600c:138a:b0:434:a684:984 with SMTP id
 5b1f17b1804b1-434d09b2f31mr80379895e9.4.1733344072767; 
 Wed, 04 Dec 2024 12:27:52 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e4617a61sm13704523f8f.3.2024.12.04.12.27.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:27:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/20] target/xtensa: Implement
 CPUClass::datapath_is_big_endian
Date: Wed,  4 Dec 2024 21:25:55 +0100
Message-ID: <20241204202602.58083-14-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: oSGbrMh5G1Bp

Implement Xtensa datapath_is_big_endian() helper via libisa.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Other accesses to xtensa_isa_internal fields don't
call cpu_synchronize_state(), and the libisa doesn't
provide a way to switch endianness from translation
code. Should we add a sync just in case?
---
 target/xtensa/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 6f9039abaee..7bf792fd0f4 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -40,6 +40,13 @@
 #endif
 
 
+static bool xtensa_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    CPUXtensaState *env = cpu_env(cs);
+
+    return xtensa_isa_is_big_endian(env->config->isa);
+}
+
 static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
 {
     XtensaCPU *cpu = XTENSA_CPU(cs);
@@ -256,6 +263,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
                                        &xcc->parent_phases);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
+    cc->datapath_is_big_endian = xtensa_cpu_datapath_is_big_endian;
     cc->has_work = xtensa_cpu_has_work;
     cc->mmu_index = xtensa_cpu_mmu_index;
     cc->dump_state = xtensa_cpu_dump_state;
-- 
2.45.2

