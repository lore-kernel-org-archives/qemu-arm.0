Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2073098lfc;
        Thu, 4 Jun 2020 21:19:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFMUZAB5m/EhLAMi2G8cKe2cVHYuco9AcntBbwmpqBOyOJ7PqRjariVKMAf+BHS+8ABrda
X-Received: by 2002:a25:ad45:: with SMTP id l5mr8945005ybe.401.1591330778178;
        Thu, 04 Jun 2020 21:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591330778; cv=none;
        d=google.com; s=arc-20160816;
        b=larjVUtdndQdy/xWyoYLsz0kXZ7yZfaygz64kvmwLKhliMH0FCKfuT/Zbd3upfeJ28
         yVYWKVXBMgeROFOP/I3TTWa1fHUMoNFNBXZCPqbnogqL2cWKLuBvWWlqajTtQuBMsk7W
         k0dslC+kaaYEC+6weU2coW2n6Vjfb+NucOd3EFl907pkgpaCRf4zVe67FHEQvyxhtPq3
         VjvGH8Qi2vyXiSjWst/1HfW5YTzBjI1YwtR/Y9akhRVg99V2+kOqEc844/L8JRUJ6n1Z
         r+CtQBDZvW3J2iMwqefOXDcbzkzMXGOlQzIuBJlbmD0dp/g2soiUEl98F7Gy4Ty9B+al
         SJdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mHdkZW2BtXgCCzUvavDtufJgojf9AzZZHlwJyJIkodU=;
        b=C2OIYcMOuBi5pyzuq27bHlBn+FU5a0JmX98ZWh30MJfVXabX93cAnKEf3E/btxnaPx
         +qlCE/VVa8ZgMl+t4k6naddd8nEZEZgXE7TLfdCjxud+fxFPlsEA5nTZJLMiF5EywMaA
         hFxpMOllWR2vEJPv7qaUIMd2t+9YNGmjHhYosVILvrVnVz+Wnp52pd4nt2WnqJF2WNGy
         VctTII6TX3OakwTDe3/IegR1VIHfJhfrTZ9dHPEFNHuWQTTn+9w02sfl573bBzUZ/Qu6
         Npyrfe7D/41n/DsY6mSMEHmoex4bOxEOJn45asUkOyH0BtnLmCZaOY1wshYkoepA2lGL
         +IwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A0tjNfKG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si5917353ybf.85.2020.06.04.21.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 21:19:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A0tjNfKG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh3pR-0008IQ-I9
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 00:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nc-0004Mk-MR
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:44 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:40214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nb-0000jy-Th
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:44 -0400
Received: by mail-pj1-x1041.google.com with SMTP id s88so2179521pjb.5
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 21:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mHdkZW2BtXgCCzUvavDtufJgojf9AzZZHlwJyJIkodU=;
 b=A0tjNfKG6o69Lfe9DGoQRD5xlUXCVE3IYgfK4e7eSVqCxRoJeP+FDG4Ufc9QSEhVVN
 BF/fnDWIPQEWhfJL9VG1bGcmgvAPP0TQw77ZOtbFm+wtuv7aXUZBO6lj57lqJYT5QWCd
 AXEk+pKZC7KjL+U2FUX2+94bO8y0VSwCJOBbDmBseywpQpO3XiZ8oZdvWXiWB6eyaGwB
 QcFjTHP1k10npcJwNwG/iwZC+LKii0S0hw5JzdbJA868koVF6GHvpIjMnngR02Hvqo0m
 wXZnY3XLVzepBIpLclJvUWZFB1FtB4z8cJa0lrx9UxKHPCcgbBBPjEtK9Wq1jV4vYJkQ
 Weug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mHdkZW2BtXgCCzUvavDtufJgojf9AzZZHlwJyJIkodU=;
 b=kCqqyDMUlEwOzAX1e1L/Y0zD7/4fKkbDjEVm/bWpnt2ADHEPXJCbR/DFZE9gRnIJed
 6QHZIq0LgZGmrX0sjHl9jQgl3uxLNGKBQ7N4pI8m9cXypTpirioe5cM3q06aYgLAD5rz
 hG87oDS1rvdpJNzVfOeCmVZbvsv0nuczzrCbSf0FS59qmrwIpo53v8HrpTd7NGoPRrQd
 BXL2yW7xbqP49w3F9HBTjX51IZGZNOymjY0gDylva7EYoseA1pnkHOdpSjWEBlJaJOWa
 cnzh9xt3z/bb7nMzL+K2Blj+361pkmWctFWiUzqzOatwCil0YwmusMV7dR38Yhbcl9CH
 QRng==
X-Gm-Message-State: AOAM531cgtQ8ruOPLJ8xsBmwwR6NjtPyUgHyJVX0y4gDpBO/O3s52WC9
 T2E3BOZGHx0eYJZTtQC93GgeKw==
X-Received: by 2002:a17:90b:605:: with SMTP id
 gb5mr699334pjb.167.1591330662669; 
 Thu, 04 Jun 2020 21:17:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h15sm5440902pgl.12.2020.06.04.21.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:17:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/17] linux-user: Do not use guest_addr_valid for h2g_valid
Date: Thu,  4 Jun 2020 21:17:22 -0700
Message-Id: <20200605041733.415188-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605041733.415188-1-richard.henderson@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3GPWekG1o6B8

This is the only use of guest_addr_valid that does not begin
with a guest address, but a host address being transformed to
a guest address.

We will shortly adjust guest_addr_valid to handle guest memory
tags, and the host address should not be subjected to that.

Move h2g_valid adjacent to the other h2g macros.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index c14a48f65e..3930362e20 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -77,15 +77,16 @@ typedef uint64_t abi_ptr;
 #else
 #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
 #endif
-#define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
 
 static inline int guest_range_valid(unsigned long start, unsigned long len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
 
+#define h2g_valid(x)  ((uintptr_t)(x) - guest_base <= GUEST_ADDR_MAX)
+
 #define h2g_nocheck(x) ({ \
-    unsigned long __ret = (unsigned long)(x) - guest_base; \
+    uintptr_t __ret = (uintptr_t)(x) - guest_base; \
     (abi_ptr)__ret; \
 })
 
-- 
2.25.1

