Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1185163ejc;
        Fri, 20 Jan 2023 07:56:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtGXqE7W1DoCdEeA+ZcJsboOK3k5IdNk7hzZOWBPIIy+O1cA6EXTb/teyi7TYIxbYQ9A9kf
X-Received: by 2002:a05:622a:4f8c:b0:3b6:2d63:c852 with SMTP id ej12-20020a05622a4f8c00b003b62d63c852mr17146833qtb.47.1674230179311;
        Fri, 20 Jan 2023 07:56:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674230179; cv=none;
        d=google.com; s=arc-20160816;
        b=bHkwNJkBlAggjd6tf+cfSnlnP8uq9AaKZWfDKgT25nLyHZUTBDHG+eyfjDorvB46VX
         uChY71I70hQOksiOuQZg1p6nZojsleCF95g28673OPWvHo2L7fzUVMpa9QLKVwiIc2Hv
         AGX5P+nDooOVsnjuzL7BHHKT22y+DP6j96yHZnGaTiUcPQJEtPFiuYKx5dyumXlE1Qq6
         mC+obUpIX+vc0DR3bDeZDCMUEwiP9ux068yJ4bv0Gv7lM5yaVzp53MraR7c1E8QLnjtc
         D8YDdf1TpwwKjzve9q1jg+KpGiaCLg25DtQFXut1tpyy76zF0t1iVbjq+d5r5QEylEpD
         VYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=OukxYZp0mxPPulJ0ZXIOyj5ZXhlBod5vf7Qiii3DBjY=;
        b=i2oUvYQ31k73WU2Q1brcC6BqhV7gJhQ4y1RrvBgid3JLBNpBeRWkJgzRb0S7YVN7BY
         Ai6syFRK48/Qqyo23sZF0HgNZK7qIcBBGh49BZd3C672cY/kdAaA/GXksnXnf/Tp0TgF
         vK3YvE0Q+zh5dXEoGBadUSciaz7Ez4L8HVBW1/1tLLgc+Led3UDQz5Zd1pyqI7XJ4yGz
         nzAVgjDRXEA4aar4jm8AhD8ifXzTM5IHq96LCSD3DPFJXZFCn4mIJ2VP7YKrSVSjBL0L
         guqHk2XsA0ZuWzj0KKCDFvtzsn6NM4l6ymgMhrn3gHNV9LVF4a9nBDPEq1exRr4G7HHv
         vFZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=kAbPjVHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fg9-20020a05622a580900b003b69ecc10ffsi764663qtb.579.2023.01.20.07.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 07:56:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=kAbPjVHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pItjI-0004Zh-1f; Fri, 20 Jan 2023 10:55:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItjG-0004YZ-Lc; Fri, 20 Jan 2023 10:54:58 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItjF-00068y-1A; Fri, 20 Jan 2023 10:54:58 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9D5EF20E1A50;
 Fri, 20 Jan 2023 07:54:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9D5EF20E1A50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674230095;
 bh=OukxYZp0mxPPulJ0ZXIOyj5ZXhlBod5vf7Qiii3DBjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kAbPjVHQoWRFgFrxw98AL0N5jps7/n1D6W7h6pTturLLsGGJ1/o6B3tOEi2rMhlX7
 ljAQiuHT098Dm6puuWXmyKCwPGAQrf6woM5tIQplBPrWT+XGejl0FNPcbpltt1M1zb
 Td1B786EosjFuSihntpf29kFahg/Ms7Pcn3H/p/4=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 2/5] hw/char/pl011: add post_load hook for
 backwards-compatibility
Date: Fri, 20 Jan 2023 16:54:44 +0100
Message-Id: <20230120155447.31702-3-eiakovlev@linux.microsoft.com>
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
X-TUID: hM1wNtPwl7jg

Previous change slightly modified the way we handle data writes when
FIFO is disabled. Previously we kept incrementing read_pos and were
storing data at that position, although we only have a
single-register-deep FIFO now. Then we changed it to always store data
at pos 0.

If guest disables FIFO and the proceeds to read data, it will work out
fine, because we read from current read_pos before setting it to 0.

However, to make code less fragile, introduce a post_load hook for
PL011State and move fixup read FIFO state when FIFO is disabled. Since
we are introducing a post_load hook, also do some sanity checking on
untrusted incoming input state.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 hw/char/pl011.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 3fa3b75d04..4df649a064 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -352,10 +352,35 @@ static const VMStateDescription vmstate_pl011_clock = {
     }
 };
 
+static int pl011_post_load(void *opaque, int version_id)
+{
+    PL011State* s = opaque;
+
+    /* Sanity-check input state */
+    if (s->read_pos >= ARRAY_SIZE(s->read_fifo) ||
+        s->read_count > ARRAY_SIZE(s->read_fifo)) {
+        return -1;
+    }
+
+    if (version_id < 3 && !pl011_is_fifo_enabled(s)) {
+        /*
+         * Older versions of PL011 didn't ensure that the single
+         * character in the FIFO in FIFO-disabled mode is in
+         * element 0 of the array; convert to follow the current
+         * code's assumptions.
+         */
+        s->read_fifo[0] = s->read_fifo[s->read_pos];
+        s->read_pos = 0;
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_pl011 = {
     .name = "pl011",
-    .version_id = 2,
+    .version_id = 3,
     .minimum_version_id = 2,
+    .post_load = pl011_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(readbuff, PL011State),
         VMSTATE_UINT32(flags, PL011State),
-- 
2.34.1

