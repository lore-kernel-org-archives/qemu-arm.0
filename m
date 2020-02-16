Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4309797lfp;
        Sun, 16 Feb 2020 11:44:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqygDBXfeFhxQNuTo3Z8RTFMDZ/+CIHlzzuFXcV8Wwu629PGDOl3xbze8/RNe0ELMvF96j1H
X-Received: by 2002:a05:620a:22f3:: with SMTP id p19mr10799601qki.200.1581882246454;
        Sun, 16 Feb 2020 11:44:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581882246; cv=none;
        d=google.com; s=arc-20160816;
        b=Q1CBhhSyqVF65N3cbL6+QBWMKGdQsWOtjJ8vCMr1ekWOvyVteTIZTwjuxBLpRbfGQQ
         Xtfncn8XSBvZgDazMwrr2oKqhochTspGycboUYQePmy1PWTf3eyftKMqhjvx7jPVzZZJ
         zmN1NUI8e8yjdKY4osiZkRkVUlrJ2CRSAWkGYz4kepMaEMFaJi0L7wnPQ2N2vmgKJKZl
         o0A7km0FeEJjwHCBOMyh2+ckk2g/5MD7VEMy5BasvhFzjqdwjvNtgcsHOj7d3OteAwF0
         N6MuANle0qk7xtsbAN1n92OTnTG5f9NfKHtJHoejkpdQ4E0/ftKT4ytVPjr2mYgfaDer
         RI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o5rb+tTqydiafB3qvUsAq8/vvIee2NCXymu3BNnsCeA=;
        b=lS5oTexiHTP6AsMWIJ4ud3isGhnE8R5YP+8COBXaO4te7fNlILy6dofHA3EE3k0rHD
         pNfJaljdKd9UJBJthxGqQZSUxDKtqMYuVkXUd+43NI8gZkUMUN/QKdmFJbec/h2lVaxs
         aYNXUZ7TPm4ui42lmEN9IeAgcvMVpcfom6SZgTHDzLfKZiBlUU4WI//quCuk4XRgNWSZ
         6ijnidk7cxI+9yZcNKkB4p1DFhDtSO4zR6AlMfm0CgAHs2KApjj39NawEL4AGZsknhZI
         AX1TP6NvVS9FDmsLfs+86e4RR9ku2z8cGp5G/eZNQh+0xs25Xf5/KSoRl7jRp6DzGjgl
         88Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cxe7iddO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g74si6307025qke.151.2020.02.16.11.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 11:44:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cxe7iddO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3Ppl-0003xm-Su
	for alex.bennee@linaro.org; Sun, 16 Feb 2020 14:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3PpU-0003bx-KF
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 14:43:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3PpT-0005V4-Ip
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 14:43:48 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37288)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3PpT-0005Tx-Db
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 14:43:47 -0500
Received: by mail-pg1-x544.google.com with SMTP id z12so7912196pgl.4
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2020 11:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o5rb+tTqydiafB3qvUsAq8/vvIee2NCXymu3BNnsCeA=;
 b=cxe7iddOrSkEDv3h8Adzge4QnP2tHnoLUREsspOnGULi2hA4rvwPhdK2yVcFNtYIAM
 2UFCIxdfJOtv6rV07IukYdTNXgbJY6azbMleoBwlHGNlBu1HE+I62wWGTqywFJU/nIhD
 l9CekVxC8I3WDeRZurSNdg2ehK1Bz9AWo3KETOMwiht4fVORzmfEIYBklsLuRK4IRv4S
 uwkHw+Pbt6yGEpw7VFNcfwpaybtKiagOqXHqpGPZgzN4eIz1b/4ow9P0WXKJss7zbvW3
 at4dZbpYmk+FMbcBAU9WyqdPmOWiFWU/YoeYQKypar3JTcLQEYu/kAWBuvTRtXSuZelt
 r1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o5rb+tTqydiafB3qvUsAq8/vvIee2NCXymu3BNnsCeA=;
 b=YE0zKr2qPqLpixVfj2705sPVQwPuU4IXeN6ZPBtPO7OCq8YPw+DOHnO/UVmd6dngFq
 iNJW/QGhsma9VZJZY/G2UiQL3lavGGX1UiNGg/1iZXK/fETaW8eNtcaJDBWeCRS8umZA
 FBId/SuUli0lMUScBf/OL/UGFLWUrjBHBabnk1JWh2hqMm9kqHYBjKysFL6hOuDJuyVV
 CXwHLzAYh2TjCmjcHE0lznKU9HJtSU7Fnn5w4fA+e8tQrKwjaH8IzFN+vX03FcsBaUlu
 YTvzI4jSmTnDx+AYUTNzyZYBIxhpjfQZMpMpDH6mGI/N8jY7h+IMU5FXAVNhZilMvtcF
 L4eA==
X-Gm-Message-State: APjAAAW3r7akkRXDoVAd9B/ch5nar/xHLDCT8lDTrZ4RHdh9MriyN0gU
 zq3DXGuig1elxkoXtNYrDzsOLw==
X-Received: by 2002:a63:306:: with SMTP id 6mr14143415pgd.337.1581882226497;
 Sun, 16 Feb 2020 11:43:46 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id y127sm13945188pfg.22.2020.02.16.11.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 11:43:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] target/arm: Use bit 55 explicitly for pauth
Date: Sun, 16 Feb 2020 11:43:40 -0800
Message-Id: <20200216194343.21331-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200216194343.21331-1-richard.henderson@linaro.org>
References: <20200216194343.21331-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-TUID: bjNQmxUq+0PZ

The psuedocode in aarch64/functions/pac/auth/Auth and
aarch64/functions/pac/strip/Strip always uses bit 55 for
extfield and do not consider if the current regime has 2 ranges.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/pauth_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index 9746e32bf8..b909630317 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -320,7 +320,8 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
 
 static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
 {
-    uint64_t extfield = -param.select;
+    /* Note that bit 55 is used whether or not the regime has 2 ranges. */
+    uint64_t extfield = sextract64(ptr, 55, 1);
     int bot_pac_bit = 64 - param.tsz;
     int top_pac_bit = 64 - 8 * param.tbi;
 
-- 
2.20.1

