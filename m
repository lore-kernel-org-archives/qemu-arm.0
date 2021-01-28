Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp626850lfo;
        Thu, 28 Jan 2021 14:54:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4134C/bpXp0Tqk16JebM/P7vw02oyI9tcT10H3McdfiZBLYL95MO3vVZ8wl8nhfY3YaB9
X-Received: by 2002:a5b:34e:: with SMTP id q14mr2165887ybp.291.1611874456558;
        Thu, 28 Jan 2021 14:54:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611874456; cv=none;
        d=google.com; s=arc-20160816;
        b=P5EdmtMgqV2VgEQgs8QbcJrI6H+V/h2HTzF0992X1bqHW3g4mKtU7+jvFEsOkmgFrN
         a1jj48OevnjN6rG5YhpSzV9mX7Bpc1Sd1G+l3wPIvLGnsJseaI4+8Jc9sOQ/pMXlKeJE
         pGWwUq0xe2OhjTudOkh9gaYldXT/zIyCzRMLBZH6lvesj8R71FQfGhzL4+aaH/PXiYoi
         HYmZbuMCW1tSjxAedUCcMxuoqrXdbFj2hicTra1yjhAdZ8eH8dehHAgI5tDSsp8Maxk6
         OH/udDoV5PorRdPeNOLowednxDSrSLQVvKWwom+i8ueVM98koOOmsQgeiquuxEZXodGQ
         uJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BPFkHBCfiYE2/tooUwU3w49LVJJCP7NOmKVnwS50G54=;
        b=CDp1fAxeTjJaRcGDnYKjKHMN2Fu9O3gCJVY4tyKmGI2lRx2nYNAjH3MA5M2JPndRTm
         fNTjpyKzBJAP+vQ5gIWXILsCwnHextGsculZz/l3OT3gIE7Kh9S1TwDxVjKhCQXf9EIL
         fh+FCgr475jUkC3etgLTOzbqjLDWWwKznLGWInvD+OKDAin60/bzBdC1nsEDMfiqI/V4
         eLSvRPECn3nGUubIwAHfrQ/zygZFVQh1i6bI63Gkamxr0xGSqH31uX3VIvXUWIF2H7tn
         kW3MYGFyrXM0mFpSoapaprwnpqGRZ4Uy95DyXKZLL58mRxZ72NVlbfKMrSDO6AEv5tvV
         bGtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CvUmxM9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l127si2000820ybl.83.2021.01.28.14.54.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 14:54:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CvUmxM9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5GB5-0001BY-V9
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 17:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzI-0005Uk-9q
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:04 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzC-00085i-5w
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:03 -0500
Received: by mail-pg1-x531.google.com with SMTP id i7so5277166pgc.8
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 14:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BPFkHBCfiYE2/tooUwU3w49LVJJCP7NOmKVnwS50G54=;
 b=CvUmxM9X2eaF8quUW5YzlNRp8TTpeu52G5JY/4/6pNfV39n6Fx0h98IRLTVfoKl99c
 FBxqV9h/RlS89jjByTZmoOZIfzfT1wwOml2tlNe3Fb1Bpxi7b5aX7+454BhUp0TcPAbE
 lpGktkMLskmmoEl/JhVcFUO2xmHgsVewQiCjjT/IgRtJ6jlox7bDg4Ruof4Qy6PAGPfB
 UbcM9laboiga5j85HzUcCLCIYxjOw+Vud4fakXJyJGU4nwdsUxSWI1SWJ4AsPjH+tSyN
 bt7iO9r7Q59s8UYiSEfORtFmg5d8OFoC5CZMkFq1GO7H7xznkpl5M+nt0gysPF0Ty7Wt
 VUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPFkHBCfiYE2/tooUwU3w49LVJJCP7NOmKVnwS50G54=;
 b=kGL8ApH56fOWrdBQQarAZxbW56Sgzya/ZYS/M8bwm0ro0wg7Qld27bdxNDMiZKoMLR
 7udFo0V6X8fYHvFBIifRtwEbWksjQvOqkcbJRfmWVvISI5ymaXqr8m0NWtNqGQ4XKqM8
 ctX2S6pecfZrSGDYbV4F3H0HEPi+aEoAQH0s8kvO278ppZjOWRzyDiKftaayjpKK6KfA
 HZcvS+U88iWJ3Bj0Ggc9rjPk0YOOyOVBtcvBXcsM3ptOHNC1Yr0zhLy0fONCSCfTlisw
 jG3bWKn2tYrGm7C1s/0BgIJv8My9IlWRAItBx7+uyIHG3r/ERApkM+eppjE0Kggv0Iyr
 tu/g==
X-Gm-Message-State: AOAM530M1DSBfWR7+glCBRtFdyZCfElfXyZGQ1erV0aRcWpH58P9DrEc
 xOulIRjt1CXLDLTtFAIJToAt6JeY7LGxDCOD
X-Received: by 2002:a62:25c5:0:b029:1bc:431b:6aa4 with SMTP id
 l188-20020a6225c50000b02901bc431b6aa4mr1414714pfl.58.1611873713096; 
 Thu, 28 Jan 2021 14:41:53 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/23] exec: Improve types for guest_addr_valid
Date: Thu, 28 Jan 2021 12:41:23 -1000
Message-Id: <20210128224141.638790-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
X-TUID: KIvWxHCbeGtM

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

