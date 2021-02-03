Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp492762lfo;
        Wed, 3 Feb 2021 11:17:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZ5cH1st5ziwsVYA6f0QCbHijJa6C5rPy8Kf7rO8H4I60EUKpawR6YIi6/kJd/yQhOiHTP
X-Received: by 2002:a25:7658:: with SMTP id r85mr6983407ybc.271.1612379871187;
        Wed, 03 Feb 2021 11:17:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612379871; cv=none;
        d=google.com; s=arc-20160816;
        b=vmVhJnHwtdXFh1cbY/MwzDiQjs7fXrC2tepwgFdvenUYS/W6QtovDjtfPXuziZJOCl
         QwYBkrngA1Xd15u/vhnbQKfQiK0kuNTJDQQDCwhS3lv5BFaWmpuTRGD+8hGN8wI2Ia8u
         Y3B2lYwmC6oglw673/SS9qNck1a+OGt/Qgt50l2bbIfFniVgr4fFd5BRaDEY9DUcYc61
         UU1o6Y1zb+C9y5uYyEnRbTxzeVbMoLybldi0B1AZ99lKbU3V0ks9/mCFji8W/n/FVjNj
         D4lNISsMg+4H/OIILpB6huYMgBRGA5xGjYYY//ItF6OI02YH2O8HYP49afDTLc+XesH7
         QPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xhhF4cnD2bQGGauP5wAsskp8GPwXgWKUSZeMzfZve48=;
        b=wU8hiTouN4BAhLMsJEGpGyAa7f1VWCvcRaMUpRsKovQNDgXa67U4ZlynoAv42YUgMr
         9ZWce4dcUUb3ptaxzUl+dUeR0oiTAGo/+u9bXyVpPjOTzwtiRe6tA3lVL3IVR5G5zg0g
         89CaE6wQdQPWDMv0+7SZwX75zdaTsTdajhbILLvpfnU+LgwT+u+r1xftAyIIO3fZJSw8
         Lk55ZSWdV7aiFJVqxTXopGIcuR0X4w0m11QMw6lE2JZ1ZwMyk0txQpHX9YxyPyGRUrxC
         xXYqM7X5x7hDEx60VblNpbipf+vJZPIAu6K3zjn0vfkUoNlmRtUItCDYohCIXDtLtv5O
         9HAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dn4NrvSl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si3961574ybn.170.2021.02.03.11.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:17:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dn4NrvSl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7New-0002cn-Ie
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOJ-0007Ep-ER
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:00:40 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NO7-0001Y1-Cg
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:00:39 -0500
Received: by mail-pf1-x42f.google.com with SMTP id t29so406947pfg.11
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xhhF4cnD2bQGGauP5wAsskp8GPwXgWKUSZeMzfZve48=;
 b=Dn4NrvSlD5Wc8XuliQ0uS/M5JLx5yDp8v/YOLQdzU2aXobGqP57XatSTTy9rpRhlK/
 WGGsSj/YsKvnmIEnTN09yb/OFmaG07FUXwkvtAIKaf2zIxmoETJt4hdMpsvLKWXnAB7J
 CEDXd4JEszREQDX9j/olQddUEArLw6L5c5+Hj4+yrieISWxAfxIH9LZVIkQdbNQU6hUF
 NEC6z7LcN/jqxRvDKI2U4B0VUj77fKL6Ug9A/roX9RIT01BmjHEcU+YX0rc36iPUWcyt
 /AGkoUKWCVVszsyBenPXlnKCEC887GYHiZT/06FQQ3SWOLHuoONQy0eOs5HqWoF0lHZv
 7lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhhF4cnD2bQGGauP5wAsskp8GPwXgWKUSZeMzfZve48=;
 b=G1PYnrlHSxCDPmPFUJ5qo1lNLfduQNGSZzN4YQiOEdOPmMo9A32lHNt3JMn3xB5KC1
 xHrTfxwa7lbV5+Clg4OzOrNM33iHUjIoMkMfNQe8n5kbr0YSa7P/IL59O5Of08LUgvAh
 WVRsUKFEltRtGb5QgwdEMCuhHuQPj45STQUqowcoDVhR5Me2BG4o3zt7BRz3Fci1PZvL
 9ULTXNDc5RH0XqErzO7ZSFED4CLy3IWxyyGd42R7DXZ8azmdRUca7k95CgdABc9KmD91
 57T1r3vTtUUhtb4XwuU5wyYCJ7MI5xKIWZn8qgsigXo/0IWdR+gR1zBbWqHpxNqL+Gk2
 5xJQ==
X-Gm-Message-State: AOAM533DfTnqURYeH4gnhSVM8GN+Q/cfWunEhHV8HUmfzjtXJnEqlZLr
 P6Vd5yLcB/bNYw77+AUX5GN22Q==
X-Received: by 2002:aa7:9d0c:0:b029:1bd:1e1f:8885 with SMTP id
 k12-20020aa79d0c0000b02901bd1e1f8885mr4468954pfp.48.1612378824321; 
 Wed, 03 Feb 2021 11:00:24 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/31] exec: Improve types for guest_addr_valid
Date: Wed,  3 Feb 2021 08:59:44 -1000
Message-Id: <20210203190010.759771-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: KWU9bVHxwtTS

Return bool not int; pass abi_ulong not 'unsigned long'.
All callers use abi_ulong already, so the change in type
has no effect.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 3f9063aade..5e8878ee9b 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -79,7 +79,7 @@ typedef uint64_t abi_ptr;
 #endif
 #define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
-static inline int guest_range_valid(unsigned long start, unsigned long len)
+static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
-- 
2.25.1

