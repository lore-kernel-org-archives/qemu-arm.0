Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp793298ejo;
        Fri, 5 Jan 2024 07:46:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPGxBPL7wGllLgnpn6cAd2L0sIfuHZKe8VUYAaavLA1BaurDUMmjCUbAXh8/OZwh5C9CWy
X-Received: by 2002:ac8:5751:0:b0:429:7b93:3685 with SMTP id 17-20020ac85751000000b004297b933685mr766258qtx.108.1704469607995;
        Fri, 05 Jan 2024 07:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469607; cv=none;
        d=google.com; s=arc-20160816;
        b=C4W0eY3OhDvEvy4+Ug+d8USSFoIiMM8k0i4KQp62auBn1jVujulAN6TPHZVYbjrQFI
         fUFKiAR+G6nR2RXozOXyP3jXnDpyGZb4MRIy/2VcD8nXBfLWaszuZhin8NN/CqPzcMFE
         kc/qMNqOUqjQakKTgAeUjfBUpgma7a9HX3GSN1C1h2ADWiOP7zXPmwbnPVkqjhEZBVWD
         LWBDKzXAYNnrCxJZXyJR8lslBjDqifsbKJ/ebRu1V1RHDqlFrkPcy0ta0S02GxHR2gYW
         HIht8/aVw325RavXSe4SSZMXKqhjB8blhhpuaaf/PV3B0PF3WU5mAm/dzE9LyybpzisW
         8Dtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VN0awrbP5OQORGwTdpI9FL1dvbQ4lYRKpoXyYpVskO4=;
        fh=7r8PsvSqWcS6j0GSKU8TNvB90apLZRO7w2EreKbcrQU=;
        b=k9wQzkrsjeMeul89iTyqTso8ZNE9pl+JkTP0QM1iugOQd/NA8zAAz7OO/55HWagoEz
         7aacTTI7Oourb38nzYSI7gRGRbh4g2H1KJBH+xaxxDp9u0be++4xHgzFXo1/buaUK+9y
         zwfFf9b7VWUkY+3Wixj1X4aQ+CgPGqMG2pQi0cKlkqaEsaMg0Rcx8t/lozi/Vs4JllFb
         z3W8EGgWJAud+t/l7LTcivFMKIBix7WdhZVRo19VeqNKnZgpMoObIlk6iISF7SvoRdj+
         izlEcyrwXy4xeztQW75BUQrxnd+uNxfjcJgfwbN2wBt9O07NX/q3FqThhblX/4BCAgu5
         LXjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDsRx22H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020a05622a198800b004281105447fsi2069198qtc.2.2024.01.05.07.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDsRx22H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmNb-0000Sz-Jq; Fri, 05 Jan 2024 10:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNZ-0000QP-OD
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:45:01 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNS-0003OQ-TZ
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:45:01 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d5b89e2bfso16269505e9.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469493; x=1705074293; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VN0awrbP5OQORGwTdpI9FL1dvbQ4lYRKpoXyYpVskO4=;
 b=uDsRx22HU9SPJoRjW5EZmUusQOdM5juuuem7KmvDmMSmC21ft5eSOz0A8EelsndkkL
 yvLdtQ5T2T5dbhwOguPxw3Ouh3UA/UpdLBm+TEOOIe49tUH1AuRvW3zrzVL3jIoooL4e
 jzNpbPbGf8tGzf4mf/SXHTAU92X1dEtMVbEQf7pNVk8nCIU1VLLBQBB4NdBA1weSdFXN
 yUPi88L7njaqphZbehhPVtUZ35GmpBYRKLrdWjxn4gx2whGjTNOyrFrnSatbH2H0EoT0
 DEKT9FpnXTIpraEGR1sgDuot99Wd9068pIAYMUqsZ0ZXUzRirvhSiDEXdZl0Vr2CdhdD
 aERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469493; x=1705074293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VN0awrbP5OQORGwTdpI9FL1dvbQ4lYRKpoXyYpVskO4=;
 b=RHpemG3Hs94uuQNeURVLYb0sGFEI+/WpW1PCUbCVZF1AGl2uNPbKBINc1Lyh0JTqrt
 S5YDM+Q/tmb1QJ+JZBekFraIKqYD2oAah68tzbwL3P5RWmr4DJdTaHyjrITlppCefEd5
 5x8qM3HPuM+mb/fFEWe8L7MvdFmKPH8Mu3sJR5uO5WblplmoYGp9XTbkVmhEuhmb06yX
 yQUFbiTSyEKtn4BpPWJju/XcB8L32UAHdcUKIXnrjMAJsm5AgPCdvizqAvC2SehrvtUo
 HDQ7/BQxgfilQSlKUpsCdm+hOrl+GVOnTpNb/v1Y564mlt9XtP9QoQmBxP0B7fjTuBED
 nyYQ==
X-Gm-Message-State: AOJu0Yx9IOBfRrNJO+J1S9gFfH//aYHUsIVKiaRxRD22KEat62vkLR7M
 +isMGaJkqA5ctDGBplHvaLqMNE31FOj9fg==
X-Received: by 2002:a05:600c:5487:b0:40d:877d:ca1 with SMTP id
 iv7-20020a05600c548700b0040d877d0ca1mr1218138wmb.54.1704469493513; 
 Fri, 05 Jan 2024 07:44:53 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c1d0800b0040d6e07a147sm1938605wms.23.2024.01.05.07.44.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 17/71] target/riscv: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:10 +0100
Message-ID: <20240105154307.21385-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: BJYyi42JBfDw

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-riscv64 -cpu ?
any
max
rv64
shakti-c
sifive-e51
sifive-u54
thead-c906
veyron-v1
x-rv128

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-riscv64 -cpu ?
Available CPUs:
  any
  max
  rv64
  shakti-c
  sifive-e51
  sifive-u54
  thead-c906
  veyron-v1
  x-rv128

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231114235628.534334-18-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.h |  2 --
 target/riscv/cpu.c | 29 -----------------------------
 2 files changed, 31 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d74b361be6..2725528bb5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -490,9 +490,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
-void riscv_cpu_list(void);
 
-#define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 523e9a16ea..22d7422c89 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1733,35 +1733,6 @@ char *riscv_isa_string(RISCVCPU *cpu)
     return isa_str;
 }
 
-static gint riscv_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    return strcmp(name_a, name_b);
-}
-
-static void riscv_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    const char *typename = object_class_get_name(OBJECT_CLASS(data));
-    int len = strlen(typename) - strlen(RISCV_CPU_TYPE_SUFFIX);
-
-    qemu_printf("%.*s\n", len, typename);
-}
-
-void riscv_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_RISCV_CPU, false);
-    list = g_slist_sort(list, riscv_cpu_list_compare);
-    g_slist_foreach(list, riscv_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 #define DEFINE_CPU(type_name, initfn)      \
     {                                      \
         .name = type_name,                 \
-- 
2.41.0

