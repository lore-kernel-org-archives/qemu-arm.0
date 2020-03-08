Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp5885376lfi;
        Sat, 7 Mar 2020 17:30:27 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvRtA1ypcmMZgFhn3aRWzPithWI+iXnLVyqew+zRwnlRpkitA1zCZ0LnYve5Q6j8YT6TAcQ
X-Received: by 2002:a37:a549:: with SMTP id o70mr8938912qke.195.1583631027386;
        Sat, 07 Mar 2020 17:30:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583631027; cv=none;
        d=google.com; s=arc-20160816;
        b=ovBG/2qHPoA1BJCs0xJd4h6Slob5nVG7WIlnhjTQOrKtWku0NfooNPHFtGkcY5eJ6F
         sdzcGelIRvt4nLFOdLb3K/SDyQrQ3Y5UKhx+ZPECzYcYyFGu2yK+K1H+r/jvuV33cxKl
         DXAIbTnMvVo3b3W/SZb/BJcAkUykJqFpjMap3VYidA6YHi7+sSuPUTAfo2Cg2kQabNqW
         EbnTDXpRygBLMn8gmrIgFqvCPKlKcK3rH4iWK5OH8JFUnLkEW1qM1BSierGb4oCQvanF
         ASww6R2kKBJBHq6ciMsrLI2mf78sh+DZ41UPXBPrQMGGTOYaCJ/H1TVfAKLvGE601166
         liuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qOuTtio1oLREm+GMX+5O8B+s/d/VI1jp3YJB+8tDvLQ=;
        b=yUE4BWKxO33RiEEeOkdgvdshgoqSPcot9+x19+FSv7BqZ0MH0r5wFQr3t4mhstBNt/
         C/FRUxvb0LbjwAO9L9X5bzekDDBRnvGRgvXBQcm2oeqje7loRVcMHMRWhUQeHASl5Lwo
         hnXDBbLOKl2MrN4pmzxvX03P8pm6dsM0PE36WXbuN+RhM6sd1xDzN1yaMcXZhpoPPJGT
         kKzPnxLgS+Oz96pcJIO8xQq9tY9FJNZbPooz4Q/Iyn58HCTdFsjTKvZDUYvnod0wTagX
         pV52SKlbMfHbved3ubOOfye8qwdQ8G20ehDm408HE7BMoDr7FTlc9YBNeeVZEwaTMwNX
         gVWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ezfqiMoq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si3443782qvj.178.2020.03.07.17.30.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Mar 2020 17:30:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ezfqiMoq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jAklu-00079r-PM
	for alex.bennee@linaro.org; Sat, 07 Mar 2020 20:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jAklO-0006pL-8H
 for qemu-arm@nongnu.org; Sat, 07 Mar 2020 20:29:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jAklN-0003sg-9Y
 for qemu-arm@nongnu.org; Sat, 07 Mar 2020 20:29:54 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44630)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jAklN-0003sO-4D
 for qemu-arm@nongnu.org; Sat, 07 Mar 2020 20:29:53 -0500
Received: by mail-pg1-x542.google.com with SMTP id n24so2995083pgk.11
 for <qemu-arm@nongnu.org>; Sat, 07 Mar 2020 17:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qOuTtio1oLREm+GMX+5O8B+s/d/VI1jp3YJB+8tDvLQ=;
 b=ezfqiMoq1oWBP56mbBUeyMJv4ntiRDAp6qAzRKuNxuiKf9c0H99ONUEE1A/y789m4Y
 27rSM3AqpA0fzqLB4rf7EgvR2Uvsmvk9YEhGCzEzZxUgHjlfrlqyPE3TCc6aw8ri2Wbq
 oiJounwFQ9c5+AmtNnWohRgJWf+/W1waVXlhjB0aR3VHc2vGmJwhymSpBIQLx5pX+4O9
 9C63OdY8gs8NrwZyiGJIF/7eNt+65aUwouxnHIMhnAKWj9Aj+XWcHfli9m2oRbzWpySC
 mhqaci/a2R9LDMoozaTA8jNl99OvgBlfue/2unRBSQQNp5EiCC/e0gm+YwNQYrqQVc0s
 M0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qOuTtio1oLREm+GMX+5O8B+s/d/VI1jp3YJB+8tDvLQ=;
 b=RHtYWHvU9R3hd6g4zSlVzC65BtNTaD5w1gL+kAawNc7KuiQlfiGMB91wBBgTOSf/hC
 JIuUftT3R8mu79/Vdpuau0j4M5hfcFR094XR7vQstVWLmlYCpmJq6hyDiWjwUrt1TL1S
 b6MGhIRo4JFjYW5XLtcEX4wB06OfsgcD/ENUpupAf3qYhXnQqMAU5J+POHDz3TLU9EtD
 sfa/CZycFfZ2DIF4/Y64hgWkKbqInINfrKV2FXojQoVQpr0Qh5+ukfbr8erEnRQ2dAw9
 xIlXwEsEGfwD5RiffcWNgzRNFGZodx7BmobCbi6DuFM4EPyVGg41tJgVNQNFH3wNuaWM
 1seA==
X-Gm-Message-State: ANhLgQ3VJcDNgK0niqVKAUURz66Ur4HOkrjBOqGNAUw2gxua81Cq5gsF
 WmFl8lHg3cK+cs+IiODXcgROWA==
X-Received: by 2002:a63:5f51:: with SMTP id t78mr10105814pgb.362.1583630992082; 
 Sat, 07 Mar 2020 17:29:52 -0800 (PST)
Received: from cloudburst.hsd1.or.comcast.net
 ([2601:1c0:6100:5580:6886:21be:91dd:78be])
 by smtp.gmail.com with ESMTPSA id w19sm32636891pgm.27.2020.03.07.17.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2020 17:29:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] target/arm: Check addresses for disabled regimes
Date: Sat,  7 Mar 2020 17:29:45 -0800
Message-Id: <20200308012946.16303-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200308012946.16303-1-richard.henderson@linaro.org>
References: <20200308012946.16303-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EqhrFydX5kbU

We fail to validate the upper bits of a virtual address on a
translation disabled regime, as per AArch64.TranslateAddressS1Off.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f91e5d5345..8f81ca4f54 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11780,7 +11780,40 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     /* Definitely a real MMU, not an MPU */
 
     if (regime_translation_disabled(env, mmu_idx)) {
-        /* MMU disabled. */
+        /*
+         * MMU disabled.  S1 addresses within aa64 translation regimes are
+         * still checked for bounds -- see AArch64.TranslateAddressS1Off.
+         */
+        if (mmu_idx != ARMMMUIdx_Stage2) {
+            int r_el = regime_el(env, mmu_idx);
+            if (arm_el_is_aa64(env, r_el)) {
+                int pamax = arm_pamax(env_archcpu(env));
+                uint64_t tcr = env->cp15.tcr_el[r_el].raw_tcr;
+                int addrtop, tbi;
+
+                tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+                if (access_type == MMU_INST_FETCH) {
+                    tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
+                }
+                tbi = (tbi >> extract64(address, 55, 1)) & 1;
+                addrtop = (tbi ? 55 : 63);
+
+                if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
+                    fi->type = ARMFault_AddressSize;
+                    fi->level = 0;
+                    fi->stage2 = false;
+                    return 1;
+                }
+
+                /*
+                 * When TBI is disabled, we've just validated that all of the
+                 * bits above PAMax are zero, so logically we only need to
+                 * clear the top byte for TBI.  But it's clearer to follow
+                 * the pseudocode set of addrdesc.paddress.
+                 */
+                address = extract64(address, 0, 52);
+            }
+        }
         *phys_ptr = address;
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         *page_size = TARGET_PAGE_SIZE;
-- 
2.20.1

