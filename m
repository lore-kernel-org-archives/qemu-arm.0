Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp243047ejc;
        Wed, 12 Jun 2024 01:17:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLm0ykUxGO/PHeaOHo81SoDEFH5v4xiYkcpCqXnCwrLjNxELhWJiOotVU1OGBGJ5we9fsRh9BUh/W18iyZE/EKe7jFBHeL
X-Google-Smtp-Source: AGHT+IGwOWTcKSaU+rBNJqTsb43gDyqBzLzODZfvOBBq9f1Z7vCuQGlYWlh9ZvakSXXfbgnFV7uS
X-Received: by 2002:a05:6214:5b0e:b0:6ab:9619:a806 with SMTP id 6a1803df08f44-6b1a722615fmr12496896d6.62.1718180253578;
        Wed, 12 Jun 2024 01:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718180253; cv=none;
        d=google.com; s=arc-20160816;
        b=QYC6mEpcvx+mJ9hbGlryo0Ycs8W9zalsqShoLeWCdBV1L8seuPPBAA8Rtlo6OMSWGk
         EjsFmRA90ZRBmi9a7RM5GsjaBdvS7L7SRaPUtU/KrKj22/T6xG+OEFBw38odsP106Kz/
         KKQhXaeE2LZnxjqUgjYsjWPYlBTtTmq9+GazzwBS69wiPwk5zba7C2q5CFg/qmgHIv46
         8Hbsy6bw2FeKcmzxBa/w1f2x44ZbRJNExa6OWQLZ8gIz3MJ7YIddiOQNwfvERcMi2fwO
         bbfQo6l7GgpKJRn4lrbZdMn+OEnhD2aGcE9v/QSZQ4uiPSDRDkFddm0k1kUKMFiJs3UG
         PGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qTKcjK5EXlwx4nqxpoQ63FtP6DiDpTwQjxOyBCiDETw=;
        fh=TDBzvxSfdE6oPbnRjgmpeHbbsHtVpAEN4utndjBnqmU=;
        b=qp6DKavMjBgbtu9155HxRc1oP29I6CM2v48kx2s34nbAOz/ljwqdOJuYYIZ6sGUb/N
         dQNXhO/pvSFWI58qdncoVkD1I9Xz0bo4gfN/j2lU6DGpKTlSrh62T9U9FsPsiikdjcqB
         MMw7DHIvsaPDxyOXkE9ALUzTy+ucxVYThP1z3v661art96zDz1Ya7mm2V45WSxQtaQEL
         0BvFIk1oWD34Q0CC2TznOgoHu+T/jeZq/4XZxeFABw44xkSx4MYuOJ7sLb0iodGVAsML
         /BCHUgcguJI2gz3kqanJP1s+hj7YOVhOCIimPZauRsUVrgudVyPipBo5GDIbjQVq3j8V
         BDAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=lFfMiJnu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b088304096si46122036d6.365.2024.06.12.01.17.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 01:17:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=lFfMiJnu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sHJ92-000438-9k; Wed, 12 Jun 2024 04:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ90-0003r5-4I
 for qemu-devel@nongnu.org; Wed, 12 Jun 2024 04:15:46 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8w-0006Wz-2W
 for qemu-devel@nongnu.org; Wed, 12 Jun 2024 04:15:45 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7046e87e9afso1671708b3a.0
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2024 01:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718180140; x=1718784940; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qTKcjK5EXlwx4nqxpoQ63FtP6DiDpTwQjxOyBCiDETw=;
 b=lFfMiJnuRSMxvcN3y146qLzn0zh54CU578qa5ae8Cti7/Ev38ZnO/UOGTa0if9+1pv
 AiPTEQtRksTFdwSXLV++uEw7r4m/po4RPXwb+tFPQYT5D4+dMloh59j2MaDmUte71I2e
 gDfgmAiflIF6itrDeN3qsK58iRp9a7JYnLuJKDwv2UugAsX+d6WoJRnQxvrrQX6wa8T7
 udy/uJb+fk2hcfRqYeg0jrXOY22pxZJuYd66C2q/+5r6CdicpxOUpUdXHGs4eUtREumE
 FOVKYF5GhL76n0IkFtwwnrOpl7+m7p1i8/mFLHlsC20/P1CkUcOKPjDzxSneffo048Dc
 GgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718180140; x=1718784940;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qTKcjK5EXlwx4nqxpoQ63FtP6DiDpTwQjxOyBCiDETw=;
 b=f1fBrogoAt4j9ZFG1LlAC+wuzVLqRR0Lvw8m1/k1lAD6AemzvkPk+oIwy8Cp1+eF8O
 OVIRI+wdda/KMCS5Z31wDLg2oxcZ3dXftFeAuCBlj0kRlqSJjUnJxe1h/u/HD55Qq0SW
 1eYCL+3CYLRp/PlAYQR9dPL00voFTYiBcXvk2FU7aG5Ps7dlEaH6OOSkZiRs8WoR9Idv
 Rc1EATXLU9x/McRVAiHH891BU4rZXgDmphu1MnZKUA76Lf9088nWOKR9aGwtcl9WOD6s
 Xr3lLlPJiEyiGdL6VId7L24Izu1qtLl4Sp7D+72n0LyIVtLyIywwCONmdMC2bjxRp2y1
 xG/g==
X-Gm-Message-State: AOJu0YylD9QNPx2HuQZJ6d7/CIrYvoigoMFVOKbYJwQ3MxG4yQ4wMEbk
 MNwjKoT85bVYZ/g891223Cl/QJT1mQfd2BjDLZHGGlTAVd1W/ytfqHXRzBzM2bZZRu7rob1WocX
 Or2qGUPxAPTuFO1ICZk3PI0yuS8gPRmBqYRJmDMQQCoScJ8ITJ+9bN6h7ZofAceqd4bZzpYjHr4
 H1lG5uB3Ss2xHBRFkRp/BeUzonQJ9S3w2x3h8EY7zWug==
X-Received: by 2002:a05:6a20:914c:b0:1b5:d063:3396 with SMTP id
 adf61e73a8af0-1b8a9c4e255mr1276925637.59.1718180139441; 
 Wed, 12 Jun 2024 01:15:39 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f8393e8e53sm11363875ad.16.2024.06.12.01.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:15:39 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [RFC PATCH 11/16] hw/misc: riscv_worldguard: Add API to enable WG
 extension of CPU
Date: Wed, 12 Jun 2024 16:14:11 +0800
Message-Id: <20240612081416.29704-12-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240612081416.29704-1-jim.shu@sifive.com>
References: <20240612081416.29704-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: zm/dyd+aSbHl

riscv_worldguard_apply_cpu() could enable WG CPU extension and set WG
callback to CPUs. It is used by machine code after realizing global WG
device.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/misc/riscv_worldguard.c         | 87 ++++++++++++++++++++++++++++++
 include/hw/misc/riscv_worldguard.h |  1 +
 2 files changed, 88 insertions(+)

diff --git a/hw/misc/riscv_worldguard.c b/hw/misc/riscv_worldguard.c
index c839cc4e87..836ba43239 100644
--- a/hw/misc/riscv_worldguard.c
+++ b/hw/misc/riscv_worldguard.c
@@ -93,6 +93,93 @@ uint32_t mem_attrs_to_wid(MemTxAttrs attrs)
     }
 }
 
+static void riscv_cpu_wg_reset(CPURISCVState *env)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    uint32_t mlwid, slwid, mwiddeleg;
+    uint32_t trustedwid;
+
+    if (!riscv_cpu_cfg(env)->ext_smwg) {
+        return;
+    }
+
+    if (worldguard_config == NULL) {
+        /*
+         * Note: This reset is dummy now and WG CSRs will be reset again
+         * after worldguard_config is realized.
+         */
+        return;
+    }
+
+    trustedwid = worldguard_config->trustedwid;
+    if (trustedwid == NO_TRUSTEDWID) {
+        trustedwid = worldguard_config->nworlds - 1;
+    }
+
+    /* Reset mlwid, slwid, mwiddeleg CSRs */
+    if (worldguard_config->hw_bypass) {
+        /* HW bypass mode */
+        mlwid = trustedwid;
+    } else {
+        mlwid = 0;
+    }
+    slwid = 0;
+    mwiddeleg = 0;
+
+    env->mlwid = mlwid;
+    if (riscv_cpu_cfg(env)->ext_sswg) {
+        env->slwid = slwid;
+        env->mwiddeleg = mwiddeleg;
+    }
+
+    /* Check mwid, mwidlist config */
+    if (worldguard_config != NULL) {
+        uint32_t valid_widlist = MAKE_64BIT_MASK(0, worldguard_config->nworlds);
+
+        /* CPU use default mwid / mwidlist config if not set */
+        if (cpu->cfg.mwidlist == UINT32_MAX) {
+            /* mwidlist contains all WIDs */
+            cpu->cfg.mwidlist = valid_widlist;
+        }
+        if (cpu->cfg.mwid == UINT32_MAX) {
+            cpu->cfg.mwid = trustedwid;
+        }
+
+        /* Check if mwid/mwidlist HW config is valid in NWorld. */
+        g_assert((cpu->cfg.mwidlist & ~valid_widlist) == 0);
+        g_assert(cpu->cfg.mwid < worldguard_config->nworlds);
+    }
+}
+
+/*
+ * riscv_worldguard_apply_cpu - Enable WG extension of CPU
+ *
+ * Note: This API should be used after global WG device is created
+ * (riscv_worldguard_realize()).
+ */
+void riscv_worldguard_apply_cpu(uint32_t hartid)
+{
+    /* WG global config should exist */
+    g_assert(worldguard_config);
+
+    CPUState *cpu = qemu_get_cpu(hartid);
+    RISCVCPU *rcpu = RISCV_CPU(cpu);
+    CPURISCVState *env = cpu ? cpu_env(cpu) : NULL;
+
+    rcpu->cfg.ext_smwg = true;
+    if (riscv_has_ext(env, RVS) && riscv_has_ext(env, RVU)) {
+        rcpu->cfg.ext_sswg = true;
+    }
+
+    /* Set machine specific WorldGuard callback */
+    env->wg_reset = riscv_cpu_wg_reset;
+    env->wid_to_mem_attrs = wid_to_mem_attrs;
+
+    /* Reset WG CSRs in CPU */
+    env->wg_reset(env);
+}
+
 bool could_access_wgblocks(MemTxAttrs attrs, const char *wgblock)
 {
     uint32_t wid = mem_attrs_to_wid(attrs);
diff --git a/include/hw/misc/riscv_worldguard.h b/include/hw/misc/riscv_worldguard.h
index 8a533a0517..211a72e438 100644
--- a/include/hw/misc/riscv_worldguard.h
+++ b/include/hw/misc/riscv_worldguard.h
@@ -48,6 +48,7 @@ extern struct RISCVWorldGuardState *worldguard_config;
 
 DeviceState *riscv_worldguard_create(uint32_t nworlds, uint32_t trustedwid,
                                      bool hw_bypass, bool tz_compat);
+void riscv_worldguard_apply_cpu(uint32_t hartid);
 
 uint32_t mem_attrs_to_wid(MemTxAttrs attrs);
 bool could_access_wgblocks(MemTxAttrs attrs, const char *wgblock);
-- 
2.17.1

