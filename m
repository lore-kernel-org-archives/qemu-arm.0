Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2408691ejc;
        Tue, 14 Nov 2023 15:59:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGF44ZL/QxoPn/Tw1cMZb88mvT0fSJv1laehAxKnuahX24AP8zp3mUut85lC9urLqwFPoXl
X-Received: by 2002:a25:df46:0:b0:d9a:c218:817c with SMTP id w67-20020a25df46000000b00d9ac218817cmr10545085ybg.4.1700006350773;
        Tue, 14 Nov 2023 15:59:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006350; cv=none;
        d=google.com; s=arc-20160816;
        b=QiN+T6Cm+v36izwze0v8XFM5b+oobaHXbg86in03mOC8S4sGe3uh7RDPk9fbD1wBPg
         NWsVAf4BGFPzT81KwhJyS8UoO4i35cG+LTZ/kR1dok4gjPznaqUqzn/HxQzcc3XuRKEW
         DOsbjLfmQeqrMuk4Q12QII9IoaVE51sCsNzL7Xayi2SPY9EUhTyT4D3SbdcW5cYIiN9b
         LPj6+cAD3hzyjG9SzHlItW2jCGi5UUIN1Lj4VlcAgxpmmXli+o0HycVU4Pr4KpJUFAME
         xeU2ABRyYck8q1NkEUqRL/asIwnESi3Qx1DAEbeqonrdAMPLkU8Ezd3l1NG3YtBrsGMo
         PAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rZKg1/2JlTQ35ZjVGKYHI5rgb9pxMB3aE/K4wIwjIL8=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=IjyM0Z9O67jAWQvZaDVjJVgvP+4Gs4PzpU/us55/sAzaV3VsINuE7G0rldZ9dmBooo
         yh0djailzYF4TrSx5tHlXrHUG3MJDy/aB0oCRnZE1RDAZWSuW62vkejXXMMjYY/toUd7
         Xwy2+vaQlPfZdMcCQaulBAS/cmXRKlnTgqo06RatMaHAHKIyIoNAOX5D1Pa1ksMRA59U
         CsJX7ZItBsX5pJDEl9YRaGZz0Yz3sNvL3EB2jGXw1iVXAZL6NQggMQnS865SGUE6AYgh
         62O+lpFr9RCnq++uzeHTDA0ONiBhA55cQi80MsAvOB7vFTWX7TESCKinXEbc+Ai6fb4b
         oxmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bVRpXT8x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a05621411b400b00656ef23713dsi7860586qvv.223.2023.11.14.15.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 15:59:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bVRpXT8x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r33Io-0000tP-Sc; Tue, 14 Nov 2023 18:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33In-0000sO-5M
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:58:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Il-00073a-KC
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZKg1/2JlTQ35ZjVGKYHI5rgb9pxMB3aE/K4wIwjIL8=;
 b=bVRpXT8xCpHwMrLLSCHpxatV3QokpiPPYrj534CzzUh2nOCVY18kiX5KK77pkRb1/PX2yh
 zB5ZaGqoVFKtQSXH5eoM/0tcxjDsZbCyuQ5cC1rVM+E/0xDk5SYXrQt67Ab3mFIoepYtxS
 ps3LVTwGDvP0cq28rYBu+jbBA6vLm5A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-7FEO49NsPPuaobwdMDOacA-1; Tue, 14 Nov 2023 18:58:34 -0500
X-MC-Unique: 7FEO49NsPPuaobwdMDOacA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03AB2185A782;
 Tue, 14 Nov 2023 23:58:33 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 797EBC15885;
 Tue, 14 Nov 2023 23:58:20 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 philmd@linaro.org, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: [PATCH v5 07/31] target/alpha: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:04 +1000
Message-ID: <20231114235628.534334-8-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Nv4Fw9tEK1s3

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-alpha -cpu ?
Available CPUs:
  ev4-alpha-cpu
  ev5-alpha-cpu
  ev56-alpha-cpu
  ev6-alpha-cpu
  ev67-alpha-cpu
  ev68-alpha-cpu
  pca56-alpha-cpu

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-alpha -cpu ?
Available CPUs:
  ev4
  ev5
  ev56
  ev6
  ev67
  ev68
  pca56

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/alpha/cpu.c | 17 -----------------
 target/alpha/cpu.h |  3 ---
 2 files changed, 20 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index c19257d765..cece69bfa6 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -87,23 +87,6 @@ static void alpha_cpu_realizefn(DeviceState *dev, Error **errp)
     acc->parent_realize(dev, errp);
 }
 
-static void alpha_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-
-    qemu_printf("  %s\n", object_class_get_name(oc));
-}
-
-void alpha_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list_sorted(TYPE_ALPHA_CPU, false);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, alpha_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 /* Models */
 typedef struct AlphaCPUAlias {
     const char *alias;
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index d672e911dd..ce806587ca 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -292,8 +292,6 @@ void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
-#define cpu_list alpha_cpu_list
-
 #include "exec/cpu-all.h"
 
 enum {
@@ -441,7 +439,6 @@ void alpha_translate_init(void);
 
 #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
 
-void alpha_cpu_list(void);
 G_NORETURN void dynamic_excp(CPUAlphaState *, uintptr_t, int, int);
 G_NORETURN void arith_excp(CPUAlphaState *, uintptr_t, int, uint64_t);
 
-- 
2.41.0

