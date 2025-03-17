Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2284026njb;
        Mon, 17 Mar 2025 07:28:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQ4inuYMT2gX6JwW/TnRJsC2egwO+TNYOEM4wAUzFehibb90KP/TnB/kWoGMgbNZ7E57EFH8cRUYb1bQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEt9YTe1qqs6SEn/7bYmGyNKMcyYJvQa92fHWI12ETIfXSuMEFUJCikyvrbEi7w0QhquuDz
X-Received: by 2002:a05:6122:6142:b0:524:2fe2:46ba with SMTP id 71dfb90a1353d-52449a440e8mr7727457e0c.11.1742221722372;
        Mon, 17 Mar 2025 07:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742221722; cv=none;
        d=google.com; s=arc-20240605;
        b=Vlcyrxc4i5rn844PzJjN+DV5ULDM/Dpe4c6iOIyVp8eJXFLFchnjdHGibRTn6gd/0O
         wkmQeAh3IKtzs+CFTOlcl5XJLBxcmBgqG90XNG7EHSPZKxQfr/ResiIMgugjBej6KQ9B
         33IrJws9Ur9H2Teh2DLUdvb9/aMO65kVwQRAGOtJXuTGi3ng6POw/u/ecO35jUNYshev
         f0tuJDnn+XnVY1TiEQw9cwrWsn+IfNl+5/jlRlq70kSNMqzjGGaWmmDyWBuxPtfNRp6e
         hudMWhXRCR248HBBKAaw4SMupXOyQnsuC4Bj5VTFKCFAVJBIaP/c2/i81lOVwqD0TvB9
         D34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WnEm4y4Gb1gILlyNJ1p6kywDDvqp6Y8gIMTA4arfee4=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=ldo0clzek305G2be6QTh1XVtD5NCnDe2+BS0yaW+scOw0fiWUiAGjpcCM57rLRaCv5
         fR4eGElSGiaWYCwsWxi4TYxmYJTKktqoN1zrD8s7bQjcaeGOKpQCA0/dYVkKFc3ObJbc
         dCmkL7iVx6PXijK14NIsNkGuq/XsC9OwY2d+lxIId7iXO1poIMMlPX5k64jiQTB/cmRs
         V8RiQTXzPT1yuqmaEmSF9+wxenyks9Pi1FavYOiFuiZj1hJbE0plzOmyuo/WjsINYd38
         BuAWsRhCvcUYQm/1lTtK7SpsEpKczaVFk2iT772+bJ0Z3PCOhxzVCswY1pcLuNZvt4Qe
         Kj0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYyt+Q9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5243a6f2cbesi2787488e0c.181.2025.03.17.07.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 07:28:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYyt+Q9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuBSB-0000cG-Ae; Mon, 17 Mar 2025 10:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuBS7-0000YL-Ca
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 10:28:27 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuBS4-000182-MJ
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 10:28:26 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso16537555e9.2
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 07:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742221702; x=1742826502; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WnEm4y4Gb1gILlyNJ1p6kywDDvqp6Y8gIMTA4arfee4=;
 b=dYyt+Q9Z+KjmsvzUO/yn9zAV8xrPZdBm3S8gHuDWO6tJwJ1zCRRpg5H0P5eE/vOaY/
 S8X9Yan0NQY9O7zgiYtFPydqPYY5UNmdgtoDkupBMMSy3/j0L+LLB7cF/T1X3UnnO+LC
 i4tqLYpUDN8wTYVqIxwy8KG9lyWc+DFFxjYOAGiL//LhZKnC6dchQWFx+4/sg69i/eh0
 3Pm9iMktMUQxo6RaUuVc2IL/eQOesq7HjUq2BFwMSQCIddxTUXyEu8j3XzaQ72loty/T
 GqDCpyku2fOztZLOm9yuZy2qxtAQObxbXOEeCArQakHjo+1T05tuJE9RQqsJXPzDZAGT
 o2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742221702; x=1742826502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WnEm4y4Gb1gILlyNJ1p6kywDDvqp6Y8gIMTA4arfee4=;
 b=JfyD/XKHVlQOL9rG5h/o66bgr7p7yPlxhDfj1/OQXY4FhMWHj/+iKax2NHrJlGLQOO
 79gezJmdvkw85rW4uwk0i0yofYC76/WKFiEwcdbQZ0SwSqx6XsGPeFh7qaWdJKMDnqI3
 E+PH5xkMOIRSACPxzFUcfQHIfi/lAMmC8Tca3ogvqAlwwNbjTPv5HoWm0F+0ElH595IV
 niidL1USYCNrdG5wKras1RbVp2yc20bPIs3d4hXGUeVAxdSGve5TMZlfNvopjRO5JOti
 Izo2zETyTUu+3VtxeIeqxgSwdOShGsnNt5Q40HkT6bXndH1HVeRqmr2NWtZQBTvgQApH
 piGQ==
X-Gm-Message-State: AOJu0YwNfzYoZcjVnoUIYBACY4sfC+SDi3vd11Wowq5kTxE5JVVe/KxU
 +dbCwW8+UmIkwEtqzi8NPLZ6kQ7zbR4LJ6jxJLyr5nK5B3fKOIO5A/pQ/wO9nPYUzn/QwRbyddu
 H
X-Gm-Gg: ASbGnctUiEO8QbXnEGo/5wy+wNwWG7K51KvrfM4zieG5HPHTEZVvXQ+gYvZ5P5dJZjV
 90Z4uQHwcG/OnX1ue/x1DHxZNpRT6qHNCl72rml8/Vq8igCQE1CUZFGc5S5EBakEhsUQNRs6SGp
 AWlI5dbbBqD5b5f7N7orAJNWp/Au39wlxYkqufC/HGKZ0fSnYDNAvUcQCJ/wENx6+mpKpSdmPUT
 3arEyvO5Bhv0PV08nNxVolHYjrFGAfoRWAlRPQb78ku/WyGeJ3Zhsu7PxT80/Wy+L8kC1Md4Hnr
 FCPKkObeYa4lwVtSa2eQPTYNzPipYYkUevLQnitCqMF5yn+NUMQ=
X-Received: by 2002:a05:600c:338a:b0:43d:b3:fb1 with SMTP id
 5b1f17b1804b1-43d2021a1bdmr96258065e9.27.1742221702200; 
 Mon, 17 Mar 2025 07:28:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe60ad4sm107914985e9.29.2025.03.17.07.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 07:28:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-10.1 1/9] core/cpu.h: gdb_arch_name string should not be
 freed
Date: Mon, 17 Mar 2025 14:28:11 +0000
Message-ID: <20250317142819.900029-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317142819.900029-1-peter.maydell@linaro.org>
References: <20250317142819.900029-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: S04rveGnByzV

The documentation for the CPUClass::gdb_arch_name method claims that
the returned string should be freed with g_free().  This is not
correct: in commit a650683871ba728 we changed this method to
instead return a simple constant string, but forgot to update
the documentation.

Make the documentation match the new semantics.

Fixes: a650683871ba728 ("hw/core/cpu: Return static value with gdb_arch_name()")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/core/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5d11d26556a..5873ee5998f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -135,7 +135,8 @@ struct SysemuCPUOps;
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
  *           before the insn which triggers a watchpoint rather than after it.
  * @gdb_arch_name: Optional callback that returns the architecture name known
- * to GDB. The caller must free the returned string with g_free.
+ * to GDB. The returned value is expected to be a simple constant string:
+ * the caller will not g_free() it.
  * @disas_set_info: Setup architecture specific components of disassembly info
  * @adjust_watchpoint_address: Perform a target-specific adjustment to an
  * address before attempting to match it against watchpoints.
-- 
2.43.0

