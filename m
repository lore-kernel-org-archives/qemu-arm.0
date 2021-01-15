Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp674826lfq;
        Fri, 15 Jan 2021 14:50:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcs8xW0TTZ5WjSXrlf8RL1dUvkZ+te403X68ntJjOTNcqt8FAzfIKElmrE1OxvynwAGCqt
X-Received: by 2002:a25:5c3:: with SMTP id 186mr22435387ybf.131.1610751055037;
        Fri, 15 Jan 2021 14:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610751055; cv=none;
        d=google.com; s=arc-20160816;
        b=PHfGyvesuEZ5oJjLNNZsu0xewL3sVHk2029GBCyyuu+ySWmLtS32z6WWkXKB2RTqS6
         HTzCJqO/qoaKCctVWY32kUDR8BKAeWuYN0/VTmeq/qlMo5DTlFux2MKJ+Hw86UZAg7wD
         QQY7yJVB7fEO8ktRj7iG8bqrv60aPreSuRyaNWj/Gl8onmHcvB9n+C+fEqc+vuV6nDaY
         9Se4N2s+5j6embq7+Fluc5Hiv7Muo7MagC4vq6EHyKv+DM88FTzFyjO4Cw8MbrIO9ui3
         zSOuFMN94FYAMJ3zmH8P6bhmlp05qEZ/n4L95/JH/HHDtZ8iO46LUpV0QBK8GBNQfY1m
         xT+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BPFkHBCfiYE2/tooUwU3w49LVJJCP7NOmKVnwS50G54=;
        b=xmhElajhZoiJn7PCfc6xWDLDlkP2RweC8JTCyGUs9X/tqmFrt3SPEc+hiqARQIAyQ2
         3NOOZwbw6/u4ZQ3sNCMoq008Dpqyh7Vw4fvkeyujVs7ljZlxY9qCDkx+2hUn/QANSANc
         ZMCUI27gg/NFfM2JOyEtRbGkcJK0jODoAbg9Snc2sPM13bJYFDFzEgBFvHXrGBS7YprB
         yHBwM0we8LLkPg0gE/yW6WUHN2wLFEKVxGPZg863JcT1JF9jMAGogXSiNMToXjLftIj/
         QuiMFO1twUU1rL+hM5kq2YcCzjJAiuDIBY/2OwU1PlFrp7I/IMGgtyfV2xjsykohyMck
         gqZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cVKi/EO5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si7499849ybm.409.2021.01.15.14.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 14:50:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cVKi/EO5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0Xvi-0007ks-EB
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 17:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs6-0003Xv-TA
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:47:13 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xru-0005Dv-8V
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:47:07 -0500
Received: by mail-pl1-x62d.google.com with SMTP id b8so5462586plx.0
 for <qemu-arm@nongnu.org>; Fri, 15 Jan 2021 14:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BPFkHBCfiYE2/tooUwU3w49LVJJCP7NOmKVnwS50G54=;
 b=cVKi/EO5fMAfl0J+r2MBksBLyMqvCDyxcwuWFw/B7d/QyOp3jq6CjIqXBdd5qtgeYx
 BK6B3yOo23/ugG7c2INs0jNR0Vpgxfmg7X/dgJONJOwZG2EU6r/OyikYnND6l+kcHJwU
 Qg3VKh7366OMoeOzo9TXybPAhNh83PeG4OODSM/JKNzefTkMGK+gE6WKwTEc9FahaYhD
 tVR0sK2xp7+e9GKKOoT+cVQZRXJUDBgWQRPocHFn//aVL8gxsF7dokk5sAs1wSDKJ46v
 fKjaJZjyLVJ3LNZQTzeMbdA2H8kL1k+I0hGZsjiJYj+Yh3kjp701dDTMqDzebEQoKXRM
 4H1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPFkHBCfiYE2/tooUwU3w49LVJJCP7NOmKVnwS50G54=;
 b=YwGHZ+Aj1DlFJOkUT60gfCg/ttyc/wGiwA6tN4qrEOk1mJoDqoIM9y/hk7HnZpJuur
 HlQ6sUbC0Aoeiywt4DJfIH44cIJpTB3tbAO2wtZtlGMCg6++GlmnjzWkgEzPPOcSuHDC
 mCC/X/n8XkP7wVfRvwvsnkjZ3o9eF+QbhwIca1es4v0oOx90qlSWJMtD8ZuJP+DR+Q8q
 mjB/d8k8wxtpMJy9kiQ4sDIXBDedbr0u0EdSfDgkLZ2sPi5t9PaHZCMgx70De0+TYfQY
 Voa4nzKQjhoT1fwSmK6QMUihTiunVC0LvHWZ+FKgDkilwXKeiK9Q1t3rJAfm1blbTDyj
 dQRQ==
X-Gm-Message-State: AOAM531mSQVXXASL3i5beX654cbGZXhKVR6nYzla3h2Cythxfd8bSYoa
 +TmOKxv7yrfZ8wxrrR2flRTLDbjZ1gdwyU26
X-Received: by 2002:a17:902:8d82:b029:dc:20b8:3c19 with SMTP id
 v2-20020a1709028d82b02900dc20b83c19mr14798262plo.29.1610750817019; 
 Fri, 15 Jan 2021 14:46:57 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/21] exec: Improve types for guest_addr_valid
Date: Fri, 15 Jan 2021 12:46:29 -1000
Message-Id: <20210115224645.1196742-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: 2cnSA7usMkUY

Return bool not int; pass abi_ulong not 'unsigned long'.
All callers use abi_ulong already, so the change in type
has no effect.

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

