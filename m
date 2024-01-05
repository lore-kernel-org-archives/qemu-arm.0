Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp794963ejo;
        Fri, 5 Jan 2024 07:49:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2JeWUAVDvgBq5R5dYn0vDKi1mjUsQH6sAuAzNjvuws068uj69Za4ne1VPgT0BX5lz9ksj
X-Received: by 2002:a05:6358:60c4:b0:170:daa8:576e with SMTP id i4-20020a05635860c400b00170daa8576emr1816865rwi.47.1704469791062;
        Fri, 05 Jan 2024 07:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469791; cv=none;
        d=google.com; s=arc-20160816;
        b=K2htWvnLWhTFWl66nqWLZIewcdWyAmKgSpNX4KNl4pzS7vJwY1GQBp7REvEfFfpTDT
         VBjjdKL+gOBYYhOAGYqeTAHEn/1gmiwycsJd/jGRR29m9X1Hm8TRDPaheGp+kz0xK1jw
         NAO88EUrV4co9cHmqHZm+Tf+sSpuDiGjA46A7ba2Yy5Vlw49DxvtR0jahJ3MuDmf9Hd/
         aD9AZt2CfmT/OCdVwsfOyz7ZqNnlpethhx06rVnzqx2Y/CyCdzw7d4/AR5R35l5MEijB
         LGkyJjK80QTastZzl6hwW+aZLDfJXrp+B9iTZZfMEPnZB6dX9lx9dQrHLKuWYjbSge0M
         mhQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QZuAr3GGN/pOvffPY8+fLddBxJHGJfB6Dvfc17Jcg0E=;
        fh=n3A7I0RXIS7uKZCl3vDOUiEmSqJiUZA8z++zyYBsP3k=;
        b=sSB8e4S5qZAr4IhtMW4JRnmoiwmoZdYk86CGw6cGC18mq4VgJhX3RO1e00JeS8FwzV
         Ud8zOtCjiEoBn/Y36ZPbhrE4cTSbXN7fS5NN1XKyDOiJKGP+4nA0V/3KEFbIMHIfZYYh
         psnZ0L2MZc/mGU2T4JNlVrQU+9gKrOvJl9qAEUsKubyQwsrvfAqMs0XvZHP9sAfnRMU6
         +0fRUOnNhq/8oOf7q8kVKJOhCVj0syC3f5moRwq9AgVwSIPJMZthSgsqButpf0mmZbaE
         UaYgmVME3ZjRh0z0HZRH336xSlZ4ki4YgzMd58qTIhPQkrxicHdaGuTCynXcHB4fD6N+
         1Zjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hQiB8IA1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020a05622a105200b004283d52074csi2051504qte.557.2024.01.05.07.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:49:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hQiB8IA1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmOi-0001uJ-Q1; Fri, 05 Jan 2024 10:46:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNi-0000i9-TC
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:45:11 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNc-0003PO-9W
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:45:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e3712d259so10389595e9.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469499; x=1705074299; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZuAr3GGN/pOvffPY8+fLddBxJHGJfB6Dvfc17Jcg0E=;
 b=hQiB8IA1hhYuYpdQNeCxIID2eAzyigfnquvRK+W0GKHdvwtMiaE4WLwvzI58qlGIWN
 l5BeDm0XbIhRqlK3yHTMhPBVNtAGuRnd5jb4w0bi9vJS4ZJ6kQ4zftDEJzlwwv9/bUwx
 QqIiBRmLKqqXXcaytTmeWYTj5YQOelenLOqrPkKCN/F8Bv9P9Aj/0IPYdNrkHngA11Ow
 XW1ngewoFSpeB8+270VllBuriwO9XEsVZH6ZSFJ4xgwE3jyNPmIfcc5pyxEtf65EWv9k
 NMEGozYDQCbEqX9y+DYEjtJWRSY1YBAbGeh1kKvy7wi6wmZmxR7VUbUi50GJpM6Ee+r0
 /DAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469499; x=1705074299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QZuAr3GGN/pOvffPY8+fLddBxJHGJfB6Dvfc17Jcg0E=;
 b=I57babFkn7oIKDE1oRYM7Ze4rGJWGxNExNUuAU98W/fXok1KHlOFFRvWFjOlUuqfZC
 TzPLA9J6724U7Gtll6cNE8WEPFjpiO9hNTJgX9IOvIgVNIW3/ov03fjmltlgVsLgnj6Z
 sGm2jpxbP/MPBaSUn/19Vf6pNiJtUZRoi4ULhhBXE8h1zQmo21mvyC+OrtO/sbbPbf3/
 tS4ne+9Hwe39sksNK8eZfNSWyLD5kkB6VVvGJQqYmd7AchtAAYiXYrUNpF8iiFPbAFfy
 Fc5i0mrxPaIu1uzE8ICpcJdtHrngRX2PBFM63T4dVrq86BStmA7AnMLlmxfFvvuiPpaZ
 sF5w==
X-Gm-Message-State: AOJu0YxDD8kARHryZxl6QdBIfXoKYLaiPKGVbH3epA+HdvJ9uoDavLEq
 4hCvP4Ywwj7rdmw6qmHM/v6CupkbInyldA==
X-Received: by 2002:a05:600c:510e:b0:40d:190c:160f with SMTP id
 o14-20020a05600c510e00b0040d190c160fmr885239wms.110.1704469499779; 
 Fri, 05 Jan 2024 07:44:59 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 fl13-20020a05600c0b8d00b0040d8af75e19sm1958682wmb.24.2024.01.05.07.44.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PULL 18/71] target/rx: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:11 +0100
Message-ID: <20240105154307.21385-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: VjxkhtsnfkOI

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-rx -cpu ?
Available CPUs:
  rx62n-rx-cpu

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-rx -cpu ?
Available CPUs:
  rx62n

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-19-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/rx/cpu.h |  3 ---
 target/rx/cpu.c | 16 ----------------
 2 files changed, 19 deletions(-)

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
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 9cc9d9d15e..c5ffeffe32 100644
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
-- 
2.41.0

