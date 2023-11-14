Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2410635ejc;
        Tue, 14 Nov 2023 16:01:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxbKoSPviwdDnNa2jEdDbcIQLr0KD34dH/4JmIdC5koDHNjPtJqg1kz7y1NCRiIjs+DS2J
X-Received: by 2002:a05:6871:7508:b0:1e9:a19b:3126 with SMTP id ny8-20020a056871750800b001e9a19b3126mr12656488oac.15.1700006516066;
        Tue, 14 Nov 2023 16:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006516; cv=none;
        d=google.com; s=arc-20160816;
        b=l+uJA+S3vlYlXG1fS+sHbNJPeXVIKBrsA5fqke9SI1NR+lnvxKfcM+1DYzrzd6S6is
         vYwKJn6t9/K+gPxeGoNq/8+TVMhZMDbr1hFcw3JjZRZRi+hBT4vRX0UjCYd4YboGJyOC
         bslIIAUr8X3H2lAfNCohg25Gn79zY+nPgCkrcolIAg+o5q/vyU+FSfbijjCX9ylcnFYf
         f3Zr8EghhSoI2zZJLjRja5YhRj4RbwXNM8rPuF+/Qp/SCq7+dOhBk4fkrALsESeFpK7N
         eBL+sgtSSSD276Z4+WT6nShnV5ktsJwqKZe/vDK6uvmZ7Rhv1oCzaL1REGQ2gubhGUa+
         rULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0JKVE1tNQHe7HZrYYkE3+B5JLznaJL8/Teyenc6nWOw=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=H2+yGvdshNUMvA6UVcaSMF9t2Vjw51aesajgzN7MBiwI4fa3hAIuSJpX6EoQVZ5AOW
         V/0Uc7U1RMpV1U6BymZUXNmsoK7F29bamV3UFFgPvjrAGbXcrb2ee0OfGJ4Bu4TUU5/V
         vVsz43crXY9pbDxpWIBmye4dSVTl6HKR1abnNV0LJFNFHvGIr5TisetzkAs2RgFQ/t2Z
         zNiQbPKRiqz7wus1lI9bj0Io0tsyk5X36ATezCf7c1c3ofmPolK1ytasfzLpceFuYWZ4
         9bY1prVJBYkX8XWUJgyV8QEIXtK3+BKempOcwl92g9n7knKQGo8CsbfXR+MTjr14FMBz
         xYqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jo1BAYCl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cr9-20020a0561300e8900b007940073c8b2si1142545uab.209.2023.11.14.16.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:01:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jo1BAYCl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r33LI-0006z6-16; Tue, 14 Nov 2023 19:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33LG-0006wA-5t
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 19:01:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33LE-0008An-E7
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 19:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0JKVE1tNQHe7HZrYYkE3+B5JLznaJL8/Teyenc6nWOw=;
 b=Jo1BAYCl3TMs+60/3FScWYp/JOuiCD8OawNLVfEI2UFDKR36nnvsQV8iEuzS80tfMafjcC
 F1EVA5wm4VPeLUCwQ5vx7ASnS//JoRr+CGOOmtevowFc2lchFl8BASenndzQO4q5WBZz8Y
 Yy1vDTxAz2AtILj6v+BaS4J5JyLi35I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-Nzf8L9myM8ijDlmutLpGOA-1; Tue, 14 Nov 2023 19:01:07 -0500
X-MC-Unique: Nzf8L9myM8ijDlmutLpGOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 457F1866DCC;
 Wed, 15 Nov 2023 00:01:02 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18A95C15887;
 Wed, 15 Nov 2023 00:00:48 +0000 (UTC)
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
Subject: [PATCH v5 18/31] target/rx: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:15 +1000
Message-ID: <20231114235628.534334-19-gshan@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: lXfIswXNcBYd

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-rx -cpu ?
Available CPUs:
  rx62n-rx-cpu

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-rx -cpu ?
Available CPUs:
  rx62n

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/rx/cpu.c | 16 ----------------
 target/rx/cpu.h |  3 ---
 2 files changed, 19 deletions(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index dd5561c8eb..f984e888f6 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -89,22 +89,6 @@ static void rx_cpu_reset_hold(Object *obj)
     set_flush_inputs_to_zero(1, &env->fp_status);
 }
 
-static void rx_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-
-    qemu_printf("  %s\n", object_class_get_name(oc));
-}
-
-void rx_cpu_list(void)
-{
-    GSList *list;
-    list = object_class_get_list_sorted(TYPE_RX_CPU, false);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, rx_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index e931e77e85..65f9cd2d0a 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -139,11 +139,8 @@ int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
 void rx_translate_init(void);
-void rx_cpu_list(void);
 void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte);
 
-#define cpu_list rx_cpu_list
-
 #include "exec/cpu-all.h"
 
 #define CPU_INTERRUPT_SOFT CPU_INTERRUPT_TGT_INT_0
-- 
2.41.0

