Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1864173ejc;
        Mon, 30 Oct 2023 06:22:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6vbCFps6EjxHJ1cmOyn4YJJ+4mEfVLeAcBRLTrhCAYLTV8CAaKBepAAeEM6JoHJeriEP0
X-Received: by 2002:a05:6214:cae:b0:66d:23e4:2ce8 with SMTP id s14-20020a0562140cae00b0066d23e42ce8mr12194776qvs.7.1698672162635;
        Mon, 30 Oct 2023 06:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698672162; cv=none;
        d=google.com; s=arc-20160816;
        b=MfMzUH8YaHFBBOcBnPez6B3zUuN/QThUY0umbsWkW5s7fFzeH5AlBXXERh+BQVWBhb
         9tnPBINMnNEJPnA5K58fmEnJwl/dT0cf6U/pFy8Aq2Pu0S8jcYTGK4daloIcAZvgkgz/
         WzxOqEevvySSd5Shc7PfGZHd4Np8iiPweqlOrdXVvdeAQUTJFZGCFVwTHwb05gvlqC1b
         eToOqxGcugEExWAwdeT64xrZRirpCG/+VK0U0WcJD4zIe5M7CMQYlA7mzJ9VLmfiU+7h
         p8JfDREtjeibE9IlYH5CHLNlOlUeY1ayrcZA2U2RQPaDl/KgSP+T8tKGZgxQxKAmfeHH
         4wSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ORc0KuU7dj7mwdwjtfEfqGad9JCJByagTk9Twvr3H/4=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=B/mG3it00VlX43L+UIj1V0kmRzO3c2T9Fx5RtwyE78tEF5qszOlIvTEtlLC5KQlFde
         /hLlG1OLVyERjyo88e3YmbTcxkOFVqS/nqtEuGFXPL0A4X24GOvNWR0ig1FR1uVcLEg5
         UQSrrFgYhvFJ4+oNX/8f0VEmGCYq6yveSClqTeHZWuQ67CfhKVOHyq5p3GO0dIQoJUb3
         9grKXGAP1BdgH7hmavr3edy6tgvBDHMcpIc60DSzFm/yWThLlEEDKhFtvKLs+t4kt1EI
         4a15JrL6m4NBMFIrtNUqtx+B3LfcnxqTpH8uXZKfC3/9T2AbOSEx0Lx7N8xuOwW5/5gb
         07IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=DxtUE4+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21-20020a05620a249500b0076d3296b0a5si5893363qkn.737.2023.10.30.06.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 06:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=DxtUE4+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxSDf-0007O1-5R; Mon, 30 Oct 2023 09:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSDM-0006vh-CU
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:21:58 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSDI-0002te-C4
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:21:56 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2802c41b716so1046620a91.1
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698672111; x=1699276911; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ORc0KuU7dj7mwdwjtfEfqGad9JCJByagTk9Twvr3H/4=;
 b=DxtUE4+Gs7ieXiNBzH00YaG+EWZpQ381PzSqz0QqgdxlYNtFci2uTNOctJ23BYkelW
 jTmZI0t517azQfdVP8fR0QiPMAgG3CpalxqrHMfsXegFx2d3PqQtdigi5cASILBydrpM
 vnhciMZ7AJclYhJ2bcEAIO+GEqsoWF+OW16xxrlPMm3tRRWPQTRuSU0b0OKhy/0zlxMH
 m2BcaumRHqpMJ47WQvmwrOWpX1XewTphdACFDMAWXYsyscSh9SrADsvschaHQwLc5dvQ
 ryMI+d69NEEZ+CyjKTlcCTJbrpjk118s/6+tuzP8ZSC+jyEBd+hA/cdMtrCcGsDBQ9kU
 bWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672111; x=1699276911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ORc0KuU7dj7mwdwjtfEfqGad9JCJByagTk9Twvr3H/4=;
 b=biqc9RgZHUl1sqa0Xpr9HGnUPsrjQPUOVxdFus9Taxtldnp1x6OVQQveLVIehxyen8
 S+u9lEb5qIQ/9YcCaFNm895WbN2IcpKTeMIHkQdNu0cavo0i7HyeXdIHdVFQ9i0rvx5a
 uvdewElLW4JQ3Ae1khDB4BSyXwV0QBMwKqi90z9JKnY6c4bsQ6nxpuvI+87RlxmGq5wp
 yKCWm8PXvgF7lyw/0ZkGSznsdR2KtnB+tgw1GMNWLXkJDiN4KDG2MOf2UKacn+SLvpMv
 iR2wNB7E6bl9O5V5KH00/JOxrP9vfIQUo9tAEu3ZW7o9h5+tvFY+owaSDKY6acvMU+QE
 eNZg==
X-Gm-Message-State: AOJu0Yxc8to7zeFz0FAaLW0cgQTjquKQ18kx4/0tkFpBKDZ/zMTwZCFg
 /2/UHTUpBE2tJ0VCsywifeL8ST4eUb0BHVGXTbHmNQ==
X-Received: by 2002:a17:90b:1a8d:b0:27d:3968:8366 with SMTP id
 ng13-20020a17090b1a8d00b0027d39688366mr7023209pjb.8.1698672110792; 
 Mon, 30 Oct 2023 06:21:50 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 15-20020a17090a000f00b0027ced921e80sm8122412pja.38.2023.10.30.06.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:21:50 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 07/13] hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
Date: Mon, 30 Oct 2023 18:50:52 +0530
Message-Id: <20231030132058.763556-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1033.google.com
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
X-TUID: 4iYvSHcZ+7C4

Add APLIC structures for each socket in the MADT when system is configured
with APLIC as the external wired interrupt controller.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 6bb21014fd..ec49c8804b 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -274,6 +274,8 @@ static void build_madt(GArray *table_data,
     uint8_t  guest_index_bits = imsic_num_bits(s->aia_guests + 1);
     uint16_t imsic_max_hart_per_socket = 0;
     uint8_t  hart_index_bits;
+    uint64_t aplic_addr;
+    uint32_t gsi_base;
     uint8_t  socket;
 
     for (socket = 0; socket < riscv_socket_count(ms); socket++) {
@@ -319,6 +321,38 @@ static void build_madt(GArray *table_data,
         build_append_int_noprefix(table_data, IMSIC_MMIO_GROUP_MIN_SHIFT, 1);
     }
 
+    if (s->aia_type != VIRT_AIA_TYPE_NONE) {
+        /* APLICs */
+        for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+            aplic_addr = s->memmap[VIRT_APLIC_S].base +
+                             s->memmap[VIRT_APLIC_S].size * socket;
+            gsi_base = VIRT_IRQCHIP_NUM_SOURCES * socket;
+            build_append_int_noprefix(table_data, 0x1A, 1);    /* Type */
+            build_append_int_noprefix(table_data, 36, 1);      /* Length */
+            build_append_int_noprefix(table_data, 1, 1);       /* Version */
+            build_append_int_noprefix(table_data, socket, 1);  /* APLIC ID */
+            build_append_int_noprefix(table_data, 0, 4);       /* Flags */
+            build_append_int_noprefix(table_data, 0, 8);       /* Hardware ID */
+            /* Number of IDCs */
+            if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
+                build_append_int_noprefix(table_data,
+                                          s->soc[socket].num_harts,
+                                          2);
+            } else {
+                build_append_int_noprefix(table_data, 0, 2);
+            }
+            /* Total External Interrupt Sources Supported */
+            build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_SOURCES, 2);
+            /* Global System Interrupt Base */
+            build_append_int_noprefix(table_data, gsi_base, 4);
+            /* APLIC Address */
+            build_append_int_noprefix(table_data, aplic_addr, 8);
+            /* APLIC size */
+            build_append_int_noprefix(table_data,
+                                      s->memmap[VIRT_APLIC_S].size, 4);
+        }
+    }
+
     acpi_table_end(linker, &table);
 }
 
-- 
2.39.2

