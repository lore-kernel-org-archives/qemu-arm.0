Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp483854lfo;
        Wed, 3 Feb 2021 11:05:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUG4y7HB8gVctkKQlglWTqLav2peS+4bn8OZq5UEBODBELoVxICJO3pLpt1TB+N8nvRlhM
X-Received: by 2002:a25:350b:: with SMTP id c11mr3854184yba.95.1612379134070;
        Wed, 03 Feb 2021 11:05:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612379134; cv=none;
        d=google.com; s=arc-20160816;
        b=z8IZZSr6B4mknNEoefPVskI+dJAg2ytGEVxCVgjMzUg6fAYUHv2bYhOy9zvS8DUq9P
         u4yY6bFPNAS2c35jLixYQsZ0km9Pqw64eBu7civxOnqzGQLFOgGmpSq5N1dTaPI3fCoD
         +Cp5Ry3ZldD4s+lYNy38hx6qD5+XK5pzroCr5pQKyL4d1VpJJoyUZk6H2m4Sgi57FQfO
         iHzCvB66e8+DGZJGjLmdG8SNru1y0MfVTHPzStKtxLl277pYUyvjMAQEhlvNokRUbpWD
         2JONXOozS5hBjgwX9AoMxc+kdXw6T7FyU+HSy/go3frCoywJot3k/U607j4nZpjK/mqa
         4wfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
        b=bJyYYHlu3oIyb1bn65b7PLZhshPdFrc7uIsJEu0OL/sfwAm8+BP7jeoUdRypMG8dM9
         T0WDpCkjn+eer2HA3WopVEb0el3BZTI8yFs3JqogizRj4jn+BnHAs/A2sRRDjzcdR0A0
         Myad9oqG0uMfjO3a58Im/qLFD+Aid3bjrYomgRDBPDlLOEzQGJUdAVShTg7z1nr/UFY4
         skSrIcj16jNIebMt0hBBX2NfazeYwogwnFegmoPMEraekblxKsorwg29eUKcd5c8v8L4
         rvYwyyGFRtyBxgnIDp59+2FCgYrNzW0dxwI/GHTiw7qflCcaVfilsB7qnMUITiHw2nwE
         Rqag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XqG6wHWX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si3243603ybo.226.2021.02.03.11.05.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:05:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XqG6wHWX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7NT3-0001tF-7P
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOL-0007GG-JG
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:00:41 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NO8-0001YA-Pw
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:00:41 -0500
Received: by mail-pl1-x631.google.com with SMTP id y10so378105plk.7
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
 b=XqG6wHWXj2zbXFyi07GXn8kljDPIB7SODWlzuojWV2tkEsNqUnOCNcwbv05skV0ORh
 kHLKA1xYnBBeDfFoNNkVW1iivJpGgHbUx6aD16A+17fw21y7/2QzMHN+iClSd2L/Ol+J
 c472h8YWr7GX7ishxIanPD8baEQ7JDUdIMenmBE94dZmAz1qRj4jAE2U+x46dzgK91Hx
 mAPUICY5Ydh4g/VLxBi6KV8zqdrJDK8rPX2QS830RBql4gvZS4Z8IVGioheYxDCk+ICl
 bQcizvgypCXD8WI9LI6rz87vT1z8ekCj2dgxTAYRuU2okPi1t+OabsqpiCDgbBackg9J
 Qoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
 b=S0xH6ZvFN5l4MyoHrEbr9WsOx+JnZS9O8YyprjAMkf869eA+aUO2uLVjPwnltXXa+z
 fz4/z7TxpS4yoHv8Ct1qgdskfbX2vEzzGcHnaYkxPv7rNdm6OwS0jnJ2YGqWItyhsxi9
 bxA+jnFshGndG6VAYVwUTOQnIKNYvHMrNqiHJqKOTr/7iX3NKztfFIq04LWOYmHNyO2z
 e6tzl50NpSpJjqSwRoaqcbF4FFa030yZ03hHzuz1YALg9+0pz9JwNJa+9EQRSnCn7Fwt
 4TenpAbCT4cun2HhtKHQu3vXoFy1lqQlWg0YcnT7Mb/9v2x9wgFWgCnUey7Ue5SkxdMd
 ToCA==
X-Gm-Message-State: AOAM5320LXskmGLu0SmAe6bsBquTH+8iwALIjYlKLJDaFzqyDrPOPSxp
 fmmLIo4KyZmrMWvwtlwOOBt7OQ==
X-Received: by 2002:a17:90a:fe11:: with SMTP id
 ck17mr4401886pjb.152.1612378826771; 
 Wed, 03 Feb 2021 11:00:26 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/31] linux-user: Check for overflow in access_ok
Date: Wed,  3 Feb 2021 08:59:45 -1000
Message-Id: <20210203190010.759771-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wwcj8gaWYYjL

Verify that addr + size - 1 does not wrap around.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 17aa992165..441ba6a78b 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -491,12 +491,19 @@ extern unsigned long guest_stack_size;
 #define VERIFY_READ 0
 #define VERIFY_WRITE 1 /* implies read access */
 
-static inline int access_ok(int type, abi_ulong addr, abi_ulong size)
+static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    return guest_addr_valid(addr) &&
-           (size == 0 || guest_addr_valid(addr + size - 1)) &&
-           page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ : (PAGE_READ | PAGE_WRITE)) == 0;
+    if (!guest_addr_valid(addr)) {
+        return false;
+    }
+    if (size != 0 &&
+        (addr + size - 1 < addr ||
+         !guest_addr_valid(addr + size - 1))) {
+        return false;
+    }
+    return page_check_range((target_ulong)addr, size,
+                            (type == VERIFY_READ) ? PAGE_READ :
+                            (PAGE_READ | PAGE_WRITE)) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.25.1

