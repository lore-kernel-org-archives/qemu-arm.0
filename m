Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp793682ejo;
        Fri, 5 Jan 2024 07:47:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZsjV0tKfpzo88X8Hc2nvBMHGG61T07XkimbY5UkbmqdGwFDDcieUBqIXCzvUAejPODDFI
X-Received: by 2002:a05:620a:298b:b0:781:e4cd:785a with SMTP id r11-20020a05620a298b00b00781e4cd785amr3698514qkp.21.1704469650585;
        Fri, 05 Jan 2024 07:47:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469650; cv=none;
        d=google.com; s=arc-20160816;
        b=okWm1llMCxh/9uD8dK8HE3LjtTggk6LGczo4LPNeRzdGpvl/PYNyS05KSQ/mwqMMaB
         XSImXImWmsmGpnsZNp5q1mZy5GUJyVbTu86Qnr2wswGXK4Q62oJN2bEE3aeWkZnGUe5y
         ox6PlwR/BPq+ek7hUD0Omsj6ZvtGDL2aG5ZG0Tksb+PUOpei8wDioYsT9QMTeIkrla3r
         wvAMrQRQAb9srA9yorfO0WLPyEopZ0kfbKTAkhuzzzj84GJAZr28LEJPIc499keGpYTP
         8c6lZzQR4zsc5Krqn4E3/SKDLyhbBe9opFbGOlornUiXW1oRbKS74hlJJE+ber0PWRmy
         GJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=24gk9foSLxYRl9r29iWk8lo8oQhlMpaHzfjXYQc2w0g=;
        fh=n3A7I0RXIS7uKZCl3vDOUiEmSqJiUZA8z++zyYBsP3k=;
        b=G9rlYjV1ruuZ/1yW5XKHcDl2BBIqNlFgop+pnVIBvST205hFG8uZrV2Z72jCWWeCr0
         IyUG+2U4sm32FXcCyu5jMuaxw265S1kTRZcTbW4mUcZOzgx6uuEo688v22xKWvd/jcdW
         XbnfU1OtH5KB9iCeYaiJq+3/yTjhtWdCE4p1p5R+IodCDeopf1pDkt8TJqcIrtAkSvSs
         bqb+AFSUrXjo6kv7XKOalWiZRqqw/IgMgWiS2bzHe/UoOADkm23kdi4mST1KUURBWnD0
         ogTjSfO8hv5Y+1ociTYU7dt8RVidLEmf4CDYtEkNKBlJyyiTUdrZqzpzlwlet70IxaEa
         DyfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z0Za4Xu/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pc21-20020a05620a841500b0078138f20c65si1836368qkn.534.2024.01.05.07.47.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:47:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z0Za4Xu/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmOq-00020J-3X; Fri, 05 Jan 2024 10:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNj-0000lS-N2
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:45:11 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNh-0003c0-5y
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:45:11 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e384404e7so8437555e9.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469505; x=1705074305; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24gk9foSLxYRl9r29iWk8lo8oQhlMpaHzfjXYQc2w0g=;
 b=Z0Za4Xu/w0dNjdmtf3ySVKB5dtUAAFIYjkirdl65q6kjc8SqOYSu0x8AHH53VoBcYP
 DxEtSaBVn8e+hbzgf3M94NDMvVUf+XdyF2Ta8pxuBZ/Tfn66M2CFd8NSfe7CkHwKfAfX
 cX7PPOfmkdKUJj9rASrpe07m0YMR07g1ysWqsHLbUg8jImO5IPoNRmGMN7VHCSFf5Xzc
 X6Qnf0z6D5UyBZcFDMXx0Hq7jFC/pWA0YC0JK0dnyyPhnbT8/A01Phh6SIe+DSb93422
 FQLV+aRYxPcGdQeOeo+Gv+3q1xZjY5YKqphgBxxbQuYCCOKDzJLuTxgMGoCzcxpD34sL
 r5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469505; x=1705074305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=24gk9foSLxYRl9r29iWk8lo8oQhlMpaHzfjXYQc2w0g=;
 b=DISyfnBNIRfPnobb/9/qQ1w9Sq774fzqsxoIaWIU0C3iN6ktjmRXzf+cXQX3Ct39QS
 /OF+tLBoqDmGTaZK28CMtfVMWRRThUXemhQF0Ybdvic9v+OD2OLjeB9nQs/Uf0A44wzF
 595TED9rwETAA36TVFu6/SjbKhvH0y1uvGHpjLcwEIEDG0hCWOs23tkIJ5qEtkBX38Ex
 /jU9pdbKbbgoOPVEsZCYAiAPWpN1x3s1GWepNm0cxerdHgBif6sSThkpgUC2PtdgPwfV
 Q4lZvA9Mr/zpW7lKxlfltIUUUloJpf3uiZKMwo8zy2jIwrSuyZDpkIK+Lajk9j6yj9/n
 m2lA==
X-Gm-Message-State: AOJu0YztMhrt4GvRpJhe9TQMu/5VOG/MRx2gVjpnPNod8boJckOdh/C0
 3D4fbhkHjlFA4XG46ZCFFRoD5h2PP0PRaQ==
X-Received: by 2002:a05:600c:1d17:b0:40d:850b:a19e with SMTP id
 l23-20020a05600c1d1700b0040d850ba19emr1407108wms.82.1704469505433; 
 Fri, 05 Jan 2024 07:45:05 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b0040d94b65342sm1915385wmo.48.2024.01.05.07.45.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:45:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PULL 19/71] target/sh4: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:12 +0100
Message-ID: <20240105154307.21385-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: Er5Pt+LxSqDS

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-sh4 -cpu ?
sh7750r
sh7751r
sh7785

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-sh4 -cpu ?
Available CPUs:
  sh7750r
  sh7751r
  sh7785

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-20-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sh4/cpu.h |  3 ---
 target/sh4/cpu.c | 17 -----------------
 2 files changed, 20 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 031dc0b457..0e6fa65bae 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -238,7 +238,6 @@ G_NORETURN void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                                uintptr_t retaddr);
 
 void sh4_translate_init(void);
-void sh4_cpu_list(void);
 
 #if !defined(CONFIG_USER_ONLY)
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
@@ -272,8 +271,6 @@ void cpu_load_tlb(CPUSH4State * env);
 
 #define CPU_RESOLVING_TYPE TYPE_SUPERH_CPU
 
-#define cpu_list sh4_cpu_list
-
 /* MMU modes definitions */
 #define MMU_USER_IDX 1
 static inline int cpu_mmu_index (CPUSH4State *env, bool ifetch)
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index a8ec98b134..806a0ef875 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -122,23 +122,6 @@ static void superh_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
     info->print_insn = print_insn_sh;
 }
 
-static void superh_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    const char *typename = object_class_get_name(OBJECT_CLASS(data));
-    int len = strlen(typename) - strlen(SUPERH_CPU_TYPE_SUFFIX);
-
-    qemu_printf("%.*s\n", len, typename);
-}
-
-void sh4_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list_sorted(TYPE_SUPERH_CPU, false);
-    g_slist_foreach(list, superh_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static ObjectClass *superh_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
-- 
2.41.0

