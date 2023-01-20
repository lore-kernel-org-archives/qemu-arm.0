Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1184735ejc;
        Fri, 20 Jan 2023 07:55:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuBUBgs2eh6Y/HTpISd3xoqq1wIIvQcKXf8L8M0NVCMeL7uowP4rd3h+F8oyYAKIyAk+8lO
X-Received: by 2002:a0c:e8c4:0:b0:534:7cf3:44b4 with SMTP id m4-20020a0ce8c4000000b005347cf344b4mr21928238qvo.50.1674230138996;
        Fri, 20 Jan 2023 07:55:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674230138; cv=none;
        d=google.com; s=arc-20160816;
        b=o+TuxglYjxM+5EIYtZTAYSZJFWCdEADoCYwMqQXuJ2yhLRdL+LWn7/v+GvHvYTOKLT
         zicjIjVnnaEN+6WLWUWqTdAHU3sS0TbbwmAtWRoRe7CMpj7LSpXe8LiC6PMZLBxCNDxe
         raFcopSS4I9/fXd59HEAU4fXbPjuOyTcra6p9+sYiPgA3jNkJkGiJ5e6pkSlxtqQ4GfK
         uJJHX0/AokDqi5J1Fq29GiMip6S5c46LdeBb/MOO33DEAzmbwQ2G5N88Qrk1KM39Kxnr
         GKLGOKdpVVIPq2ItzQyVtJwa0qv5mNV3sqGTf7R2PCMrMgphcZawJYvAoSrjAMnDwkLk
         pk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=U2wmmEzz5vKPUtZcVHanD5KNxJHK6VmN1cZVMUePwb0=;
        b=t3rRY4hMczGpH/9tOd7MNc/CgcZATD2zNlRZtO2/nNTZbBxeAf9SJrU5ExKneWCVHl
         ZsEKLm1t0xD926oNEhzI1AiNa4PIk8l+9q2JneVk62qJ6HaoTXanOkiRtcx46nijgPqi
         Xigv8e7NwOEx+DCzObj0yUVpPCAvednzPqOMCP4xys8javrbZ5WxJQ/FV/bA/PutTt+Z
         19ditPzWLaudfgMzfJi4wI9BxElhAM4sg+WT/BwxhBMmB3LTWxxMmSNVSISqtPQKPTMT
         FexSR3Be76QbvJpFGFPmCCNS/KX9vsLn1eeU0G/h5HS5ZJVzp9LOtIYKbEkHUs3Ou+k2
         /sIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=DECWC73H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q78-20020a374351000000b006fb7e073f63si22178559qka.731.2023.01.20.07.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 07:55:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=DECWC73H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pItjN-0004bw-Mh; Fri, 20 Jan 2023 10:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItjJ-0004ad-RS; Fri, 20 Jan 2023 10:55:02 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItjH-00069y-JI; Fri, 20 Jan 2023 10:55:01 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5D00920E1A45;
 Fri, 20 Jan 2023 07:54:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5D00920E1A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674230098;
 bh=U2wmmEzz5vKPUtZcVHanD5KNxJHK6VmN1cZVMUePwb0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DECWC73HfqozYYNdvsA5BGcag7MbKBmPFzQKcXCUTc6228ys0HPtQI62/WWxJhlBx
 3Io86MV+GDweYvibO4CoiSp8D6YWVduleujXXQuB17GWzKQYU7R4qz/Ilje5o6ScXe
 WixyL7hS/Ui+1Ffkzs8fIJi+JqFr8jexvucfuqtE=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 4/5] hw/char/pl011: better handling of FIFO flags on LCR
 reset
Date: Fri, 20 Jan 2023 16:54:46 +0100
Message-Id: <20230120155447.31702-5-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ci7ATvtBrdHT

Current FIFO handling code does not reset RXFE/RXFF flags when guest
resets FIFO by writing to UARTLCR register, although internal FIFO state
is reset to 0 read count. Actual guest-visible flag update will happen
only on next data read or write attempt. As a result of that any guest
that expects RXFE flag to be set (and RXFF to be cleared) after resetting
FIFO will never see that happen.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 hw/char/pl011.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index f9413f3703..c72fbb7d50 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -92,6 +92,16 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
     return pl011_is_fifo_enabled(s) ? PL011_FIFO_DEPTH : 1;
 }
 
+static inline void pl011_reset_fifo(PL011State *s)
+{
+    s->read_count = 0;
+    s->read_pos = 0;
+
+    /* Reset FIFO flags */
+    s->flags &= ~(PL011_FLAG_RXFF | PL011_FLAG_TXFF);
+    s->flags |= PL011_FLAG_RXFE | PL011_FLAG_TXFE;
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -239,8 +249,7 @@ static void pl011_write(void *opaque, hwaddr offset,
     case 11: /* UARTLCR_H */
         /* Reset the FIFO state on FIFO enable or disable */
         if ((s->lcr ^ value) & 0x10) {
-            s->read_count = 0;
-            s->read_pos = 0;
+            pl011_reset_fifo(s);
         }
         if ((s->lcr ^ value) & 0x1) {
             int break_enable = value & 0x1;
@@ -450,12 +459,11 @@ static void pl011_reset(DeviceState *dev)
     s->ilpr = 0;
     s->ibrd = 0;
     s->fbrd = 0;
-    s->read_pos = 0;
-    s->read_count = 0;
     s->read_trigger = 1;
     s->ifl = 0x12;
     s->cr = 0x300;
-    s->flags = 0x90;
+    s->flags = 0;
+    pl011_reset_fifo(s);
 }
 
 static void pl011_class_init(ObjectClass *oc, void *data)
-- 
2.34.1

