Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp878318ejg;
        Fri, 19 Jan 2024 03:35:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcFJlaLzLmsWRNaUGB2PBAc7eH4YE0zFrlSlSEyWCtfbWS7l0brF6qRvkhVQXd8gttxI0Y
X-Received: by 2002:a25:d3cb:0:b0:dc2:398b:fa08 with SMTP id e194-20020a25d3cb000000b00dc2398bfa08mr2076617ybf.31.1705664155037;
        Fri, 19 Jan 2024 03:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664155; cv=none;
        d=google.com; s=arc-20160816;
        b=IdFo/h2L7itc5CCwyphTtfvvffU3I87UBhmFx7NCqWQ88ty9t+NdPkagAM7aBnusBY
         lQ/ielogKxoN2t3wTziS6gG5F8O4rTlfJQuLU4OhGzh/Wwj/YW7Ff2Bsjui+PzTc5Y+N
         YvJPqXUNn/iDxm5lQ+hwZy7NFCMDNODv6A6AaPTrYFmp+1wVQkL9Y3wudy1ShyufZLhC
         ioTQ64rUTgWMJIpbyam84WIf3pWjmpnHS0PRfvBvO4ypBn3pmD3S0k/sHPCYahookbYP
         BvJdlHqlKrnjVPIfaNu1VGNPhsCFijoP/WPwtJJ6xitaiHngOC+NAyYInypU9plX+X/F
         kR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1kHSnHH1cspbXUMLrjnX00ivshEejOmgJvy2gqACDDE=;
        fh=0x3oxSDM+3B1iq7MNcEDPiiYDxF4jnBXeQY/LXh8Yxc=;
        b=hd88kKYDqFqiF6QyZ/Bc4fl+E81qJlA4fqJVguZEodAq3WMfDsJcMXEVXootMTatjG
         8n9WtpgvihcirDhtZtwH19ZrYOlFAGMQlGb2PO59F68KQArhxH9uLu82Vj9KwoyGioOd
         JqD2LA8rAVxtJIXJg6/Ip2stSDvjIXoYh5ERrLcW3+cxh1G7iMIdVAl6FaMHwtHEBu+V
         X1I2ip1KM27k+WoZy/wqfCHSyeSEqlXQ/HYfZld0XJivQ3q5r2tZ5H4QR05Dd/zOVG7w
         DOrOT4qtaIWKRoQjJbLoJRhcu1R1LjAIJYX0X4olyQ2Sh+DwJe/ej8FwS8UeTiNOq5su
         tOiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pmp2M1qF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10-20020ac85a0a000000b0042a1c77a496si3146637qta.665.2024.01.19.03.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:35:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pmp2M1qF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnA3-0001xF-Fg; Fri, 19 Jan 2024 06:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnA1-0001tg-34
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:45 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9x-0008TA-TV
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:44 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40ea045f29eso2157475e9.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664140; x=1706268940; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1kHSnHH1cspbXUMLrjnX00ivshEejOmgJvy2gqACDDE=;
 b=Pmp2M1qFgKdzOe+yvdLB+GLMLhJAEBXba31E0fg38K7BDaV7/XKG2Gb5/tIWAxD3ok
 Mje+5NNxEoTEs+bDhNUbm6f8/cW88JgYAIc3H8rz/WWFurqdqO91tVgNC1RI8V6LT5rC
 am+E28XQ4lKzciIwl4eFZStciQsncCpRMWkajWsfygrtB5RvffQEyJcrUTf9catzjPPJ
 A+AxmNdhgzlJTQU7L8Kr9V6jNoULC88EM4KDrfu/Xr2OnFn7GcsU8+S4Lj1ZLp5lP2oR
 KhRqyykkKVQPtSvXEE7KIcNnq5bfpEO5NmYAq3BRpYtbwdGQUskqnUxEHwCEB8twWfNe
 g1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664140; x=1706268940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1kHSnHH1cspbXUMLrjnX00ivshEejOmgJvy2gqACDDE=;
 b=q/r680D+xUTCpDU0gMM2PmBUkrw3ul1bYnB6WaLCYs2DeHQrneMC5tvLpaHwuswwRL
 W3NxWKrgEDLc+suyu4qWI+nxAUtg33CEpTKQ1UoRDHi/dYaM2c6lnzakIWqtL0xLRfd6
 jYkTQUaEnACiu423a0xtzXOccU4vsPv8MqgJNUgFc461RqjkxE3ypIsrnBNFIA8qzRm3
 35mof5x8ciXAxwgbeA9c04RtjW4PyBkulG8w3EzPctSvnqNvK6HrsjR2x4W/wtsuALG8
 d51HsIw0/XV6kG5KHsGC72uj+uELTU79ZTDgMToYmob0TC9lpIJqNzN6/NAOiQ5WKM3j
 uWjA==
X-Gm-Message-State: AOJu0Yw3J+op4vio+kJwiUizranS3yqFbKw5RmQB7725uqqSdpXLF+hI
 f6nfl5jnzcNv83TK+jmmle+0B5ORSsDw2RxCmMkjYafGUHLpfyE4r4FNBL/H5AQ=
X-Received: by 2002:a05:600c:5697:b0:40e:9d7f:d00f with SMTP id
 jt23-20020a05600c569700b0040e9d7fd00fmr501059wmb.122.1705664140557; 
 Fri, 19 Jan 2024 03:35:40 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0040d1bd0e716sm28955617wmq.9.2024.01.19.03.35.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 07/36] accel/tcg: Remove unused tb_invalidate_phys_addr()
Date: Fri, 19 Jan 2024 12:34:36 +0100
Message-ID: <20240119113507.31951-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: UOSYVo0WIEkE

Commit e3f7c801f1 introduced the TCGCPUOps::debug_check_breakpoint()
handler, and commit 10c37828b2 "moved breakpoint recognition outside
of translation", so "we no longer need to flush any TBs when changing
BPs".

The last target using tb_invalidate_phys_addr() was converted to the
debug_check_breakpoint(), so this function is now unused. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231130203241.31099-1-philmd@linaro.org>
---
 include/exec/exec-all.h |  5 -----
 cpu-target.c            | 29 -----------------------------
 2 files changed, 34 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index ee90ef122b..df3d93a2e2 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -518,11 +518,6 @@ static inline void tb_set_page_addr1(TranslationBlock *tb,
 uint32_t curr_cflags(CPUState *cpu);
 
 /* TranslationBlock invalidate API */
-#if defined(CONFIG_USER_ONLY)
-void tb_invalidate_phys_addr(hwaddr addr);
-#else
-void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
-#endif
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t last);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
diff --git a/cpu-target.c b/cpu-target.c
index 5eecd7ea2d..d51adfd7e3 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -314,35 +314,6 @@ void list_cpus(void)
     cpu_list();
 }
 
-#if defined(CONFIG_USER_ONLY)
-void tb_invalidate_phys_addr(hwaddr addr)
-{
-    mmap_lock();
-    tb_invalidate_phys_page(addr);
-    mmap_unlock();
-}
-#else
-void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
-{
-    ram_addr_t ram_addr;
-    MemoryRegion *mr;
-    hwaddr l = 1;
-
-    if (!tcg_enabled()) {
-        return;
-    }
-
-    RCU_READ_LOCK_GUARD();
-    mr = address_space_translate(as, addr, &addr, &l, false, attrs);
-    if (!(memory_region_is_ram(mr)
-          || memory_region_is_romd(mr))) {
-        return;
-    }
-    ram_addr = memory_region_get_ram_addr(mr) + addr;
-    tb_invalidate_phys_page(ram_addr);
-}
-#endif
-
 /* enable or disable single step mode. EXCP_DEBUG is returned by the
    CPU loop after each instruction */
 void cpu_single_step(CPUState *cpu, int enabled)
-- 
2.41.0

