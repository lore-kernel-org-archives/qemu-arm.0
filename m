Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1431422ejo;
        Tue, 12 Dec 2023 22:43:08 -0800 (PST)
X-Received: by 2002:a05:6e02:214d:b0:35d:5fc7:f54e with SMTP id d13-20020a056e02214d00b0035d5fc7f54emr12158604ilv.36.1702449787949;
        Tue, 12 Dec 2023 22:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702449787; cv=none;
        d=google.com; s=arc-20160816;
        b=W2a7n6VoNkQ9tVhZXWxoDcEjeExI8+pelRkjS2BuI3wTf0HKpp3XJycmIUBoxHBvOi
         c9eQ1We5Eudg58hrXPslMs7TGHqMqMF5v6H+BQnX9koyZg1Zxn/QyWtFETNVAtzItVev
         pMUgz8pOsp6SzlhUOnKn4uvTYpAmFfRQqJKM93V+RVHCoPXQe+P40J69Ze27NuixeFqr
         qBaYT9i5T0ca/1REvVMSZbg/Xo++WnhCvwnSLd3bh0jkVBRTwjWSyYtRqerEQhXmDsF1
         E8EitL8n2GRZX7Q0j3fBdDdlDZbRzZRhnUZNEsvFbLvBsgQs1de/NbiFv9OALAfD/hSb
         hq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=pitS5c+aGFir0XJuyo8p65Ve6MtEyDC5YFygbMBeE6Q=;
        fh=HE3HFS1hEYtTzJ0gsfroCOJ69k1mn8lcAqBvf3V8Iho=;
        b=BjaJL8DN3nh6k4OtNzmHzTdT9HOhNkz2qeHefd7wvD8ZNs8ZSawrPSsfITZ15fRThY
         umzP1GG648S3RPbnI7A2hTdHHTwnOmJ7koXxdD6jnBE7WXQMpO4lV36us67qLVF9l10n
         NT/aW/wRX6o2MESImVbk+P/OJed4ISDK1A1KInG5CHgN7blGbzm1DjhOMbOCNMF0onC9
         YzUsr9JGZmxuIlqk4aEkBmc2Mti60hVFYpr5MYyqY64EsXLY4KlUDFjqedqtT92ghvH+
         cQA9gRvNVa3xunlIS2/HpuVzJRTVlt0UPWaqlvFGZnMJvDW5/hH1anBA3MdS5tZsz/Ev
         QRpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=yarP9Frn;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hm9-20020a056638818900b00468f9f3989dsor3752381jab.0.2023.12.12.22.43.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 22:43:07 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=yarP9Frn;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449787; x=1703054587; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pitS5c+aGFir0XJuyo8p65Ve6MtEyDC5YFygbMBeE6Q=;
        b=yarP9FrnQPHzypiXQeo6ukLSii0AhPinxJPEa753NnEafkfoVz9RzBb4n7Y49hBMFL
         PR8YffWLfntvika73Fnl09US6fI/3jCKDp1X2GCaIP/X3zmoja+qxNXhGFCk5zvkX6Ka
         hiRrqgfo4SCT7VFjz+y1G1Qjw/RubfaCF//Rv1cqf1OlbhNtD0N26ACaxnKdc9Viy+vJ
         fs759wiJz9ASxIF+xM7+grSDgCpKr8olHM/kMOmk6GPfWmRk9uIBR3kHA9zbcdRrWBkm
         tiERSVnVsJs9+3YmJnwUFtP302WVxI0c9swSvq7NjOPc4MBjTubSigGfOKU72ZrF7xM+
         LgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449787; x=1703054587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pitS5c+aGFir0XJuyo8p65Ve6MtEyDC5YFygbMBeE6Q=;
        b=jSonBDC0U344HEqCJ4obNhq9NC+Mm1bv20oKFyZI+9cvEF70Ad8sbUe+KR+V4PNvzu
         lvbe9Knk4an2LYyF4QizxNiL+2AqPe6XYQWzWuZD/ph/r9JXZIzPJIttD+ZCDB246/Cn
         mUnEdx9IjZNUuZnP1WuhS/Ua+Kbr/dH4F/OXlb+6I6EqWqgyHylN91NzGQLjtx3kL9Iy
         gDajInzJi1c0biqwzL/uyDbNwjUU60sSHDfH1ECfsq/SSTSz/k0MHPhgIfRrsfe7oeMk
         8XCBlLCE5Kz8Y3hOtGcHCFFitq6d1boTiY1rPIM0v8Vhj2vc+a8P4GrdDJeBjIzjzE0E
         d9/Q==
X-Gm-Message-State: AOJu0YzNkuM44HES9f026DV44tLKfUEKOeasab6qDNHECKlxQ8YpUde0
	24KUEtUyFkghqDun9fdWDHv38w==
X-Google-Smtp-Source: AGHT+IGt+ZQ1QDUOGj74X5X8K3W67Kk+kXh7ZYW3u3sXkgxm+MC/2ZkM9TcSLxMULevf3rpEzqVU5A==
X-Received: by 2002:a05:6e02:20e2:b0:35d:5ac0:5062 with SMTP id q2-20020a056e0220e200b0035d5ac05062mr12276410ilv.48.1702449787428;
        Tue, 12 Dec 2023 22:43:07 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id q14-20020a170902dace00b001d08e08003esm9715764plx.174.2023.12.12.22.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:43:06 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:11 +0900
Subject: [PATCH v17 12/14] plugins: Use different helpers when reading
 registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-gdb-v17-12-777047380591@daynix.com>
References: <20231213-gdb-v17-0-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-0-777047380591@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
X-TUID: mfU/+4HZK5r7

This avoids optimizations incompatible when reading registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 accel/tcg/plugin-helpers.h |  3 ++-
 include/qemu/plugin.h      |  1 +
 accel/tcg/plugin-gen.c     | 43 +++++++++++++++++++++++++++++++++++++++----
 plugins/api.c              | 12 ++++++++++--
 4 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/plugin-helpers.h b/accel/tcg/plugin-helpers.h
index 8e685e065454..11796436f350 100644
--- a/accel/tcg/plugin-helpers.h
+++ b/accel/tcg/plugin-helpers.h
@@ -1,4 +1,5 @@
 #ifdef CONFIG_PLUGIN
-DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG | TCG_CALL_PLUGIN, void, i32, ptr)
+DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb_no_wg, TCG_CALL_NO_WG | TCG_CALL_PLUGIN, void, i32, ptr)
+DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb_no_rwg, TCG_CALL_NO_RWG | TCG_CALL_PLUGIN, void, i32, ptr)
 DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG | TCG_CALL_PLUGIN, void, i32, i32, i64, ptr)
 #endif
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 7fdc3a4849ff..b0c5ac682939 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -73,6 +73,7 @@ enum plugin_dyn_cb_type {
 
 enum plugin_dyn_cb_subtype {
     PLUGIN_CB_REGULAR,
+    PLUGIN_CB_REGULAR_R,
     PLUGIN_CB_INLINE,
     PLUGIN_N_CB_SUBTYPES,
 };
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 78b331b25107..b37ce7683e69 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -79,6 +79,7 @@ enum plugin_gen_from {
 
 enum plugin_gen_cb {
     PLUGIN_GEN_CB_UDATA,
+    PLUGIN_GEN_CB_UDATA_R,
     PLUGIN_GEN_CB_INLINE,
     PLUGIN_GEN_CB_MEM,
     PLUGIN_GEN_ENABLE_MEM_HELPER,
@@ -90,7 +91,10 @@ enum plugin_gen_cb {
  * These helpers are stubs that get dynamically switched out for calls
  * direct to the plugin if they are subscribed to.
  */
-void HELPER(plugin_vcpu_udata_cb)(uint32_t cpu_index, void *udata)
+void HELPER(plugin_vcpu_udata_cb_no_wg)(uint32_t cpu_index, void *udata)
+{ }
+
+void HELPER(plugin_vcpu_udata_cb_no_rwg)(uint32_t cpu_index, void *udata)
 { }
 
 void HELPER(plugin_vcpu_mem_cb)(unsigned int vcpu_index,
@@ -98,7 +102,7 @@ void HELPER(plugin_vcpu_mem_cb)(unsigned int vcpu_index,
                                 void *userdata)
 { }
 
-static void gen_empty_udata_cb(void)
+static void gen_empty_udata_cb(void (*gen_helper)(TCGv_i32, TCGv_ptr))
 {
     TCGv_i32 cpu_index = tcg_temp_ebb_new_i32();
     TCGv_ptr udata = tcg_temp_ebb_new_ptr();
@@ -106,12 +110,22 @@ static void gen_empty_udata_cb(void)
     tcg_gen_movi_ptr(udata, 0);
     tcg_gen_ld_i32(cpu_index, tcg_env,
                    -offsetof(ArchCPU, env) + offsetof(CPUState, cpu_index));
-    gen_helper_plugin_vcpu_udata_cb(cpu_index, udata);
+    gen_helper(cpu_index, udata);
 
     tcg_temp_free_ptr(udata);
     tcg_temp_free_i32(cpu_index);
 }
 
+static void gen_empty_udata_cb_no_wg(void)
+{
+    gen_empty_udata_cb(gen_helper_plugin_vcpu_udata_cb_no_wg);
+}
+
+static void gen_empty_udata_cb_no_rwg(void)
+{
+    gen_empty_udata_cb(gen_helper_plugin_vcpu_udata_cb_no_rwg);
+}
+
 /*
  * For now we only support addi_i64.
  * When we support more ops, we can generate one empty inline cb for each.
@@ -192,7 +206,8 @@ static void plugin_gen_empty_callback(enum plugin_gen_from from)
                     gen_empty_mem_helper);
         /* fall through */
     case PLUGIN_GEN_FROM_TB:
-        gen_wrapped(from, PLUGIN_GEN_CB_UDATA, gen_empty_udata_cb);
+        gen_wrapped(from, PLUGIN_GEN_CB_UDATA, gen_empty_udata_cb_no_rwg);
+        gen_wrapped(from, PLUGIN_GEN_CB_UDATA_R, gen_empty_udata_cb_no_wg);
         gen_wrapped(from, PLUGIN_GEN_CB_INLINE, gen_empty_inline_cb);
         break;
     default:
@@ -588,6 +603,12 @@ static void plugin_gen_tb_udata(const struct qemu_plugin_tb *ptb,
     inject_udata_cb(ptb->cbs[PLUGIN_CB_REGULAR], begin_op);
 }
 
+static void plugin_gen_tb_udata_r(const struct qemu_plugin_tb *ptb,
+                                  TCGOp *begin_op)
+{
+    inject_udata_cb(ptb->cbs[PLUGIN_CB_REGULAR_R], begin_op);
+}
+
 static void plugin_gen_tb_inline(const struct qemu_plugin_tb *ptb,
                                  TCGOp *begin_op)
 {
@@ -602,6 +623,14 @@ static void plugin_gen_insn_udata(const struct qemu_plugin_tb *ptb,
     inject_udata_cb(insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR], begin_op);
 }
 
+static void plugin_gen_insn_udata_r(const struct qemu_plugin_tb *ptb,
+                                    TCGOp *begin_op, int insn_idx)
+{
+    struct qemu_plugin_insn *insn = g_ptr_array_index(ptb->insns, insn_idx);
+
+    inject_udata_cb(insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR_R], begin_op);
+}
+
 static void plugin_gen_insn_inline(const struct qemu_plugin_tb *ptb,
                                    TCGOp *begin_op, int insn_idx)
 {
@@ -721,6 +750,9 @@ static void plugin_gen_inject(struct qemu_plugin_tb *plugin_tb)
                 case PLUGIN_GEN_CB_UDATA:
                     plugin_gen_tb_udata(plugin_tb, op);
                     break;
+                case PLUGIN_GEN_CB_UDATA_R:
+                    plugin_gen_tb_udata_r(plugin_tb, op);
+                    break;
                 case PLUGIN_GEN_CB_INLINE:
                     plugin_gen_tb_inline(plugin_tb, op);
                     break;
@@ -737,6 +769,9 @@ static void plugin_gen_inject(struct qemu_plugin_tb *plugin_tb)
                 case PLUGIN_GEN_CB_UDATA:
                     plugin_gen_insn_udata(plugin_tb, op, insn_idx);
                     break;
+                case PLUGIN_GEN_CB_UDATA_R:
+                    plugin_gen_insn_udata_r(plugin_tb, op, insn_idx);
+                    break;
                 case PLUGIN_GEN_CB_INLINE:
                     plugin_gen_insn_inline(plugin_tb, op, insn_idx);
                     break;
diff --git a/plugins/api.c b/plugins/api.c
index 5521b0ad36c7..ac39cdea0b35 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -89,7 +89,11 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
                                           void *udata)
 {
     if (!tb->mem_only) {
-        plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
+        int index = flags == QEMU_PLUGIN_CB_R_REGS ||
+                    flags == QEMU_PLUGIN_CB_RW_REGS ?
+                    PLUGIN_CB_REGULAR_R : PLUGIN_CB_REGULAR;
+
+        plugin_register_dyn_cb__udata(&tb->cbs[index],
                                       cb, flags, udata);
     }
 }
@@ -109,7 +113,11 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
                                             void *udata)
 {
     if (!insn->mem_only) {
-        plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REGULAR],
+        int index = flags == QEMU_PLUGIN_CB_R_REGS ||
+                    flags == QEMU_PLUGIN_CB_RW_REGS ?
+                    PLUGIN_CB_REGULAR_R : PLUGIN_CB_REGULAR;
+
+        plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][index],
                                       cb, flags, udata);
     }
 }

-- 
2.43.0
