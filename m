Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2411356ejc;
        Tue, 14 Nov 2023 16:02:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmfp1Z043fNGKB+qrDBQ4ct5TAfBWrAHanLe5APnbqXKB4J12YT2Ozse37vaj68WRZuNFp
X-Received: by 2002:ac8:57c3:0:b0:41c:b617:4df2 with SMTP id w3-20020ac857c3000000b0041cb6174df2mr3928739qta.53.1700006575118;
        Tue, 14 Nov 2023 16:02:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006575; cv=none;
        d=google.com; s=arc-20160816;
        b=NKMUYSLnwMgyOWJw80zBUYTr6OTCiyiHRVs+ObaAxMeBGvL8Xu/KBlizR7Z6glCR93
         sfup2W2DDeei9nsI4++Ko8hWuOuMVC0u09wb5Zgi7LbLAAo6TGXko7XVh7YjmXbpq6pB
         SfqN08kKEY36d22gWIdQqdMGf2BzQiYuMpXsWDsHJlrWjtxTWilEmd+fR7iJqt3EUAuh
         /9zGpQXB5indq1uZlxl/r8BNWN8ndEfEB0tf7+qE3HJ4k9tuAU1MxC1wpyUWHbPNj1/d
         9vUfRKtTnwPHkPXqlMBkWTKraKbniUk4C2XO4nTYzpc0Duy4Zz+P9uaqhaJyDU7F1TfA
         F5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MQ6OO5BRPdbvEJMn2gMZcE2xIKykdClZQVBu6Oydv2k=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=Pr8OkRTrMLYLurs5fdSIcokvs+oxFVUT09sKRUxEACR9hPtfwDfoIDBnrAy0kWpAHw
         KZq3ZD4SiapxxMmrUX3lCW6XHfED9yCUq5tecesxB3e+DD9DDdnjsEqit5YX2U1Oxa9x
         qwHC6xLBqfkcZAcSI0YexYGFb3pKAoZni1+LEo5X/b3eqe+iAGAcEsjs7LqmjO23UgcW
         3xF6xcAUaMJAEaagiejIG+6fWSUWScZ6xdJl/3kCOQ0C2kWPiVCloNVkWFV2HYAsQy1c
         LKXxiDJTbeHYfOMjSdsPmmaQpLE5XLr2CnqHwnU30fLCLwFUz0GARS6GrVG4SICI4x/g
         y9+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Vnqit/me";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12-20020ac85f4c000000b0041b83bbd0eesi7774343qta.43.2023.11.14.16.02.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:02:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Vnqit/me";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r33Ke-0005Up-KQ; Tue, 14 Nov 2023 19:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33KO-0004sS-6O
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:00:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33KL-0007v6-Mt
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:00:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQ6OO5BRPdbvEJMn2gMZcE2xIKykdClZQVBu6Oydv2k=;
 b=Vnqit/meTEavBy2UeyQvWEdbkqqwrjXL6S/KiymwtvecOtOPzCAZC3NRik5RtWUIbRxKy/
 ia3q4rL4jt4VXzuaXVM5A+ayY9eft030A2fU35s2TO+cbSJVLn3LNJR10eds7ctHN1dbSO
 iYFNMbqbSvz1QXdEN1sJE7JV++BAqg8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-FeZK4i5GM7ChY_OZroJnlg-1; Tue,
 14 Nov 2023 19:00:11 -0500
X-MC-Unique: FeZK4i5GM7ChY_OZroJnlg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0C073800083;
 Wed, 15 Nov 2023 00:00:08 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E9C8C15885;
 Tue, 14 Nov 2023 23:59:56 +0000 (UTC)
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
Subject: [PATCH v5 14/31] target/m68k: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:11 +1000
Message-ID: <20231114235628.534334-15-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: KRSIUCuDHdc9

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-m68k -cpu ?
cfv4e
m5206
m5208
m68000
m68010
m68020
m68030
m68040
m68060
any

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-m68k -cpu ?
Available CPUs:
  any
  cfv4e
  m5206
  m5208
  m68000
  m68010
  m68020
  m68030
  m68040
  m68060

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/m68k/cpu.h    |  4 ----
 target/m68k/helper.c | 40 ----------------------------------------
 2 files changed, 44 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 6cfc696d2b..d13427b0fe 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -556,8 +556,6 @@ static inline bool m68k_feature(CPUM68KState *env, int feature)
     return (env->features & BIT_ULL(feature)) != 0;
 }
 
-void m68k_cpu_list(void);
-
 void register_m68k_insns (CPUM68KState *env);
 
 enum {
@@ -576,8 +574,6 @@ enum {
 
 #define CPU_RESOLVING_TYPE TYPE_M68K_CPU
 
-#define cpu_list m68k_cpu_list
-
 /* MMU modes definitions */
 #define MMU_KERNEL_IDX 0
 #define MMU_USER_IDX 1
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 0a1544cd68..14508dfa11 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -29,46 +29,6 @@
 
 #define SIGNBIT (1u << 31)
 
-/* Sort alphabetically, except for "any". */
-static gint m68k_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    if (strcmp(name_a, "any-" TYPE_M68K_CPU) == 0) {
-        return 1;
-    } else if (strcmp(name_b, "any-" TYPE_M68K_CPU) == 0) {
-        return -1;
-    } else {
-        return strcasecmp(name_a, name_b);
-    }
-}
-
-static void m68k_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *c = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(c);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_M68K_CPU));
-    qemu_printf("%s\n", name);
-    g_free(name);
-}
-
-void m68k_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_M68K_CPU, false);
-    list = g_slist_sort(list, m68k_cpu_list_compare);
-    g_slist_foreach(list, m68k_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static int cf_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, int n)
 {
     if (n < 8) {
-- 
2.41.0

