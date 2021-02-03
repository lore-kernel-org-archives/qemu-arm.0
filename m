Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp495246lfo;
        Wed, 3 Feb 2021 11:22:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3CGlvx15lf3qTuhKkRjSA+uaH5aCrbA+slFmhBmiujKm5NwlCHOnP/i4Wnl+KAhg2I9dj
X-Received: by 2002:a25:48c8:: with SMTP id v191mr6114698yba.311.1612380124449;
        Wed, 03 Feb 2021 11:22:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612380124; cv=none;
        d=google.com; s=arc-20160816;
        b=e7Ma3t/PI3/zKROxMZUELouy6+B8g7JCzNO7kXJ1Ml2CFviIIB3z4er/TCpHjWyLqA
         Ex7aqOWsG9/8aOd39gL8c00zEOtncRxLd03hzue0W7xsmlZxKiBKP5nLdhwl9cAaWclA
         jwF9fcXpt93DrfmZrVMrb/+mcmf0zbAL+FK3uETcZ5SjNY3tI9voooUu6pgyauNO4CG+
         KP5kik/yTgIeU9tPlHp30SIMKWm/jLgSx/B0iu9Lpvgc4NJ9TUZA1AjzH9QxInvbSEJE
         Xye/XwMBp5r30VpCVxJ0J4inPkzUPpa6kCpW5kmGNi2B6KBhDuuJRKExhG/3fNRCXKft
         XC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iLxLfNzxBXfugKdA1uaxV5JERPRGKvt+X+dUcdlu6iw=;
        b=aygOX1Nuz+CO0mkDP5TPK36xB11b1WM9FsokXilL/CDCYFP2rQO/dnIjiPC/v7xgDO
         U79ONjUn3kVneUU52A02CSqTHZ1NQjn583z9JKBmk5K+MOyQ4A57Ev1V4MO1U9iLlm7f
         v306R7Ee+GlkvVHmZVcOE6Hl7w70FljqmQ6mn2Oju5qEtMsddypG0EGcVcsUFBLXGL+W
         /KceecrbiYe7al5kQx3obia9dSpiYKQGlSX3YeemLKUMIJ2ljsp6488GOifTVdxt4xOs
         NWLTyPCV5CIU+Q55pPDTyg3VTExUpu3eM8abnX1kQwJzcDGZ4tapzjZhtBlrU+IYVUSK
         FIYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TmbiPO6b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 187si2986128ybc.18.2021.02.03.11.22.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:22:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TmbiPO6b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Nj1-000585-Qk
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOb-0007QE-Ae
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:01 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOU-0001iM-8B
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:56 -0500
Received: by mail-pl1-x632.google.com with SMTP id e12so387694pls.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iLxLfNzxBXfugKdA1uaxV5JERPRGKvt+X+dUcdlu6iw=;
 b=TmbiPO6bUIig2r0oh3NLgO5Q52oXV+oQKLgq777TpQQ2l/4opHkUuMAKxapRmnjrnL
 6OuVjEaeAmkrerPh/kwZbWLNdlPd+TaTOEQwow/i1pgFrXStmIWZQWCrHwh0TMXWyCaV
 ocg/V6SLG74WpN+MrwKQOn9O0dIS0z45DvR1SCLkxwzDzITBt2I4ipoaa6YAYHMH5yPH
 nKm/eK5Ew5yJlsXolngUbN7I1KWpV2eLLb23tcyJIZh2OPdRwj10eAE+ChWfc4M8InLV
 LTuyfeYxHpM7monGCHXUUgg/G8/H5LQhjEp5rJXKaZMVRlabCZT+JY5xFrIbVabs2Thm
 Pm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iLxLfNzxBXfugKdA1uaxV5JERPRGKvt+X+dUcdlu6iw=;
 b=cqG7oYMn1JFFRihb9He/1rp/V+W7NgjM1swda2YfpExegVivXmgrJagPNYAblHBS8w
 x1RKBwHEVvTasDMcUMQ54XlBbFxsf6UrTeAqFSWA0v7ATNxJuzdE/DDN1bmhsRZqn7Qp
 h/lnrhRhF1TsjSLC+yMGaHNIP0i6S7hsEc40dWwqaCUInMzf6CrhyED0Ih/fqRklP6ZW
 i/daa9qe0N9hegVByeZC91BFR5pLEyuGNrZStQE7giEQevab6Rxw5Vu1XAjmcYh2ZY40
 SdGsXkaE2rMqbft40c5fPctm/6+Wet5WG+euq1p61/0FwgFfWHE98/bWpWO6qyf+jOD2
 0pPQ==
X-Gm-Message-State: AOAM532Y0DBa/gCAoeUSmCLDr0C2IW7ZyLKA+RaipaxzUxUyQVBtGgEb
 vld9bijD6SHUbgeEQ1POy+BsFu9/pWN0YQK5
X-Received: by 2002:a17:90a:dc01:: with SMTP id
 i1mr4267807pjv.134.1612378849014; 
 Wed, 03 Feb 2021 11:00:49 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/31] linux-user: Move lock_user et al out of line
Date: Wed,  3 Feb 2021 08:59:56 -1000
Message-Id: <20210203190010.759771-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pky8p1e4fx20

These functions are not small, except for unlock_user
without debugging enabled.  Move them out of line, and
add missing braces on the way.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h    | 45 ++++++-------------------------------------
 linux-user/uaccess.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 39 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 82eabb73f8..36b58bd840 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -640,57 +640,24 @@ abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
 
 /* Lock an area of guest memory into the host.  If copy is true then the
    host area will have the same contents as the guest.  */
-static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy)
-{
-    if (!access_ok_untagged(type, guest_addr, len)) {
-        return NULL;
-    }
-#ifdef DEBUG_REMAP
-    {
-        void *addr;
-        addr = g_malloc(len);
-        if (copy)
-            memcpy(addr, g2h(guest_addr), len);
-        else
-            memset(addr, 0, len);
-        return addr;
-    }
-#else
-    return g2h_untagged(guest_addr);
-#endif
-}
+void *lock_user(int type, abi_ulong guest_addr, long len, int copy);
 
 /* Unlock an area of guest memory.  The first LEN bytes must be
    flushed back to guest memory. host_ptr = NULL is explicitly
    allowed and does nothing. */
-static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
-                               long len)
-{
-
 #ifdef DEBUG_REMAP
-    if (!host_ptr)
-        return;
-    if (host_ptr == g2h_untagged(guest_addr))
-        return;
-    if (len > 0)
-        memcpy(g2h_untagged(guest_addr), host_ptr, len);
-    g_free(host_ptr);
+static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, long len)
+{ }
+#else
+void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
 #endif
-}
 
 /* Return the length of a string in target memory or -TARGET_EFAULT if
    access error. */
 abi_long target_strlen(abi_ulong gaddr);
 
 /* Like lock_user but for null terminated strings.  */
-static inline void *lock_user_string(abi_ulong guest_addr)
-{
-    abi_long len;
-    len = target_strlen(guest_addr);
-    if (len < 0)
-        return NULL;
-    return lock_user(VERIFY_READ, guest_addr, (long)(len + 1), 1);
-}
+void *lock_user_string(abi_ulong guest_addr);
 
 /* Helper macros for locking/unlocking a target struct.  */
 #define lock_user_struct(type, host_ptr, guest_addr, copy)	\
diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index e215ecc2a6..bba012ed15 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -4,6 +4,52 @@
 
 #include "qemu.h"
 
+void *lock_user(int type, abi_ulong guest_addr, long len, int copy)
+{
+    if (!access_ok_untagged(type, guest_addr, len)) {
+        return NULL;
+    }
+#ifdef DEBUG_REMAP
+    {
+        void *addr;
+        addr = g_malloc(len);
+        if (copy) {
+            memcpy(addr, g2h(guest_addr), len);
+        } else {
+            memset(addr, 0, len);
+        }
+        return addr;
+    }
+#else
+    return g2h_untagged(guest_addr);
+#endif
+}
+
+#ifdef DEBUG_REMAP
+void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
+{
+    if (!host_ptr) {
+        return;
+    }
+    if (host_ptr == g2h_untagged(guest_addr)) {
+        return;
+    }
+    if (len > 0) {
+        memcpy(g2h_untagged(guest_addr), host_ptr, len);
+    }
+    g_free(host_ptr);
+}
+#endif
+
+void *lock_user_string(abi_ulong guest_addr)
+{
+    abi_long len = target_strlen(guest_addr);
+    if (len < 0) {
+        return NULL;
+    }
+    return lock_user(VERIFY_READ, guest_addr, (long)(len + 1), 1);
+}
+
 /* copy_from_user() and copy_to_user() are usually used to copy data
  * buffers between the target and host.  These internally perform
  * locking/unlocking of the memory.
-- 
2.25.1

