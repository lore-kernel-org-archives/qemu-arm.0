Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp159650dlq;
        Tue, 21 Jan 2025 06:34:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX2cTZ7pjwjA9wQaJdilAX5Vf/bOxDwaXUZ/2kksDilSY7FVYiXznHYNjCOmnh3Ujfl9JufaEBGMw42PQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE04kGikRh3jw5w+CyjUTxPEMUTVqNeNl8vdCRpkK9prOqtdgMBzzhnEP9b8r8O1Dbzc9LL
X-Received: by 2002:a05:6214:2484:b0:6df:97c6:ccc0 with SMTP id 6a1803df08f44-6e1b220a54bmr272441116d6.28.1737470077660;
        Tue, 21 Jan 2025 06:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737470077; cv=none;
        d=google.com; s=arc-20240605;
        b=QkQ+hlxC7ri76PLNQrNpBGxv+bX/29Ms2jRSTxPbYj4FFdkrNvFec7UEmCWPq9C62l
         DGy6DpnYn1ASO6h71MJmm9xZPwlBgPPpRjlgiiA0ncbwZgJyVG+WyO2G+OG5Az2M3pCI
         2AhTdJ7NysCA7UX8Ivf0+zw5r0MXcGKZZ0xrQYiezGFNZvu82InKtnrirywhKmirSFtz
         5CVvaz6j9BqlTZk1rT56ZwJRBvGoMQJ1Odj0JXantjFWQtb0Pic3qxxZy4z9cY8CxsKD
         CS+Nv0CX//JmMjxmuDrJ9881chrmombsEsS4YWbkKlbXt75QZ8mgD3YuZBISWZOnZgk2
         Qxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GxmkPvBiu38d4nUnNXUTFzs0Gc1uo0/SVUn8XW+hnMU=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=joTvGal9lpq6sfjP8L54zWTIr8AoAMVIILG1rXI5sCfZHmgeHqCnq6Lm8KPK5WLGNt
         Rk3I6rlj+yXpN6pFzVurh5jnm2Fktbg+UC2Eb6u76K64+5po6fUFQTDdO/M4bUxyMjF8
         7msUobSz4lza1XsYfhOdip8RqXjOJFNvVjmhQj0YmZv7ZLy3DU8taoLYa5o3nVuCl+0I
         DnwJ1jCu3J3oplwTV3jOt73bYVYoSIOKhMPzGH1EF01pYImkqmM+4utI5FCO3OV1PCZC
         5LkryBo4b/z6YdnVjwtxlP+0VSLFtVY2CohlrgZc3l5FkT0bbbdi6TxeCwV7MAnbifVM
         tFkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TjRGMuDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afcd94cdsi125859316d6.245.2025.01.21.06.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:34:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TjRGMuDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFB4-0000as-Ni; Tue, 21 Jan 2025 09:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAv-0000Wm-TK
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:17 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAr-000343-Oo
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:16 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43618283d48so41002215e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469452; x=1738074252; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GxmkPvBiu38d4nUnNXUTFzs0Gc1uo0/SVUn8XW+hnMU=;
 b=TjRGMuDOEFgJpuQbrjpiGAGfGLBjEeUWM5sfnTrFiYV9bhsUhPig3Z7YzBkdKgVL1Y
 411d6tyr6Wbrnlt7qGoECwX05YYWKssi23GenIOtMfdoPOXVIdw/8dX3MDBYkfZ21FKL
 MVrbGTTvHLPLDkODw15gwrH8mQxnMUVjAooWGOUWQ5ei8Q8475WA2KBJUdnq+9lTG9Ec
 dB4+tBiC7WKRXpZrA8vK5Lq+5nbXdzfy0LHhPd5aA/hiDMdH/wLxtBJwc8Tsu+aFmojr
 QvXfepxz9v52KHHiXpARzUai+KYGqWlxcsgP2TazembSabebXUuz11YLqzKX3/OksM6U
 jgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469452; x=1738074252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GxmkPvBiu38d4nUnNXUTFzs0Gc1uo0/SVUn8XW+hnMU=;
 b=aye6F/n0yVi/k9gfNVnxa5a9OCYg70tY7BKh0VL1IJ5ErayZjX6jip/Kju/5SWSo6H
 syx1CFUwz/xQXLQ0IWWNOnsa3VWdVCxnd4YecMIqEY+AGC1y15rxoMi9ZZR9gnZ+sZpL
 0RfH9t+K9WJK4ggoalhuZd2N23/PBIdhYUolZ2U/GDrPfamul2rc5e3REzmY+FSnQEsI
 q8OVEL73KjC4vtP/SzWY3rCjdpdein+eS5V+VxhKh8myjdQsIff4+Pwt3AQHqKXHMm93
 nWbxJvPNrK72ArXfRIFj7gUiOwgH5rJP9mW75AGtqbE6duxKiWBXWBUedeHJBYmedNlH
 a4/A==
X-Gm-Message-State: AOJu0YwrAdGh6XFWcQ/2Q2k/l2x3xDP315jC79pAePktWWHsXBap4KEE
 klJ4fNHEa4/v5StBZSZxBEm09vsY2aHGV9q3suv5enHT/JgVe2rsjiBNRapf8Z8=
X-Gm-Gg: ASbGnctMFMb0rOWagEVjVjGe0Uuvnp5OoY0oDosRcxLVbMnNs2rRYGEirCeBrRvKBs6
 asCEAlrVCArfce7ezeWMixqX2Q6s1cLLainRp0YwgoLvDE4iRBAfIbyFuW7EiFg8Ce/WXk56Rkc
 CIKhf/6RoQgXgBFi29zOFZDts61Rmarv47HZyJvxGRQ7vosJ5zgD7hHWM+3CAUDlH2HuPYLKBkq
 2XI2b2d8H0WWPX9+nCUOdeiizGHa2RMSjnscvIURR2ckf/kWL+pd3YA7yv+mfzti1/WSNWbxXeT
 9P2BMsEAfTLpVHdPj1KHhIaDPWUKUdtRT85hRT5fn6wb
X-Received: by 2002:a05:600c:4511:b0:434:f871:1b96 with SMTP id
 5b1f17b1804b1-438914388e5mr185146615e9.29.1737469452073; 
 Tue, 21 Jan 2025 06:24:12 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389046885esm177866955e9.36.2025.01.21.06.24.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/28] cpus: Un-inline cpu_has_work()
Date: Tue, 21 Jan 2025 15:23:19 +0100
Message-ID: <20250121142341.17001-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 5QdhMn95Y0ic

In order to expand cpu_has_work(), un-inline it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 6 +-----
 hw/core/cpu-system.c  | 6 ++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e094d54949d..d64c823e768 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -756,11 +756,7 @@ bool cpu_virtio_is_big_endian(CPUState *cpu);
  *
  * Returns: %true if the CPU has work, %false otherwise.
  */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    g_assert(cpu->cc->has_work);
-    return cpu->cc->has_work(cpu);
-}
+bool cpu_has_work(CPUState *cpu);
 
 #endif /* CONFIG_USER_ONLY */
 
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 37d54d04bf8..16d5efee12d 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -23,6 +23,12 @@
 #include "exec/tswap.h"
 #include "hw/core/sysemu-cpu-ops.h"
 
+bool cpu_has_work(CPUState *cpu)
+{
+    g_assert(cpu->cc->has_work);
+    return cpu->cc->has_work(cpu);
+}
+
 bool cpu_paging_enabled(const CPUState *cpu)
 {
     if (cpu->cc->sysemu_ops->get_paging_enabled) {
-- 
2.47.1

