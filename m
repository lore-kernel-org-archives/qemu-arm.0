Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2811450ejb;
        Mon, 20 Feb 2023 18:20:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/XlNd7ICQAjKCHELZTF2dT3pBXJbcIz/qzCZO4bPG8Cf7+/vkYby7D+LXKZVYudG+KgNeM
X-Received: by 2002:ac8:7e8f:0:b0:3b9:b66a:2569 with SMTP id w15-20020ac87e8f000000b003b9b66a2569mr16990949qtj.7.1676946035921;
        Mon, 20 Feb 2023 18:20:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676946035; cv=none;
        d=google.com; s=arc-20160816;
        b=sLOLURZfGve9F+DcSyi0IsPP2RN9Ln0fSQzIThOPuk/cv1WEdv7ftj9ZEIS2U8YnN+
         Um8V2T/74L3Ps7BzptOtxuESb2JU4dsB9yus/BwGUo7f6zm48wI8D7v3dnvKDHIlMt2K
         7sVoprfulcIuRS7CPbmf/aDPuWOQMYzhO117EgTmKloDLbaF5XkIVk01xRPkPyGkQ9J5
         iaQZys02edF5a/Xx9NzC/vtYUqWXcMAhWPlKlqlxaobnvj13V3lxriNyannzAsy/pMpY
         rvmhbFgEeMwNPuoNjptjK6kn36QEgzYHfm1MxJ1wmYcYwE0iL9MTGNijp813WDFVvz0e
         K2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ktLcLczpC5J61u+Wz7S4IYVLAaoqvKihU89wRw7bX20=;
        b=w5begakHkkLpPoTaA/0LPwJZGzjhl1lG808KZCz+IkIXm2znwSYZFi8BUs3Uc8JAFC
         Fmn/w3PxR/JKEBCckrcdiihjZ+IajCgr6lqa3hUdBHRwk61XFSjEA1Ek6MaynybWYbB1
         HY75Qd85hUZ1Ee97218XQ3p2gr4/VuWL3Aqtp91dDwNs3GwLwZ7pfx50qf0U8pW7XBzB
         6HcuV84l73O7OhvUPS4a6banW9a2GpzWYN5vLpmFcdi9Mwzrn3a0iCaWN3pUjIDuYJY7
         qxlxHhnzbOqB/Pwp0wgrGaWhqL46oR0wHGhD0DndZTG8bBrHIzahc2uGe+/4GM/hFRLq
         cyxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZUrhFly4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18-20020ac85c12000000b003b2de9d130fsi10839256qti.35.2023.02.20.18.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 18:20:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZUrhFly4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUIGQ-0001fW-UL; Mon, 20 Feb 2023 21:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGJ-0001dq-IZ
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:12 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGH-0008FY-Vi
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:11 -0500
Received: by mail-pl1-x62a.google.com with SMTP id bh1so3458740plb.11
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 18:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ktLcLczpC5J61u+Wz7S4IYVLAaoqvKihU89wRw7bX20=;
 b=ZUrhFly49U/YhRsfWD+/QRbNDqwjpvVhWlDjIlzCJKh9BEDeG4Rvki8KrgQ/Cw3w+I
 zJARHCSnJ1E8RTg2vFnUcbDjTHXc0pznpN3flUTryJjlyFZmBBYUTkUcJs+8OaBPB2Lp
 i5rTGWzfDnEI4NfL4+WPnBscvTVdM2CR+WdVLXllxbH6GIwE8ICJ4jQ17gn3zpw6NSTt
 TdSYSsL/R+WvlEFDpgM8l4EaiCIxREnKSiaQM0Rvn8yxw/cOvTcRRv1/6ioQ0VBB3xkQ
 Am2UJosyteBQUAixFx8BgoMtNw3yJdiswguPsEbm1vHg5ZT8jOh/jlWP6ehiWcV/kSYw
 vebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ktLcLczpC5J61u+Wz7S4IYVLAaoqvKihU89wRw7bX20=;
 b=3bAH7W1vTzW66dCbesvvWeaVkrP4hrhLkSeOgvgpArEx3tcz5EC/YaKRW1219o61/t
 HXrWOwNLf6LPLoZ/kwFTGUoGAbiNPdUWYwDYhSml7cgxYg/9Xfh7/e7Faz8MNeJUrJ3/
 aKZLv8WoWigPoSMYfXpAcoAjd6aWaHa4d+0bIALGus9BgnuvrysXsLuyW1qIRjElnqEi
 13wSQyZkjj7Ve9NkK871ANWbrxtwK9E1T7kuG0gc6xjDO0onYj7KOy2OuGuFpidvLMtT
 t4osNJxwnbwMHPaHr4kPDUGRJ5E593HZhI7lque8rSUt/HHtDBcbBAAqwEURh/XfMJYy
 n3sQ==
X-Gm-Message-State: AO0yUKWMXNntl0c+gjBOkA9plF7UbilNAlvgwLRQkPS4eru9jW87wb9y
 WZCk0Cpe7ErxCH5qxuaGZBIJQA==
X-Received: by 2002:a17:902:d2cc:b0:19a:8316:6b51 with SMTP id
 n12-20020a170902d2cc00b0019a83166b51mr3585530plc.4.1676946008645; 
 Mon, 20 Feb 2023 18:20:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 09/14] target/arm: Simplify iteration over bit widths
Date: Mon, 20 Feb 2023 16:19:46 -1000
Message-Id: <20230221021951.453601-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: JfLyLWiahgKi

Order suf[] by the log8 of the width.
Use ARRAY_SIZE instead of hard-coding 128.

This changes the order of the union definitions,
but retains the order of the union-of-union members.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 36166bf81e..3d9e9e97c8 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -240,8 +240,8 @@ static void output_vector_union_type(GString *s, int reg_width,
         { "int8", 8, 'b', 's' },
     };
 
-    static const char suf[] = { 'q', 'd', 's', 'h', 'b' };
-    int i, j, bits;
+    static const char suf[] = { 'b', 'h', 's', 'd', 'q' };
+    int i, j;
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
@@ -256,7 +256,9 @@ static void output_vector_union_type(GString *s, int reg_width,
      * signed and potentially float versions of each size from 128 to
      * 8 bits.
      */
-    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+    for (i = 0; i < ARRAY_SIZE(suf); i++) {
+        int bits = 8 << i;
+
         g_string_append_printf(s, "<union id=\"%sn%c\">", name, suf[i]);
         for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
             if (vec_lanes[j].size == bits) {
@@ -270,7 +272,7 @@ static void output_vector_union_type(GString *s, int reg_width,
 
     /* And now the final union of unions */
     g_string_append_printf(s, "<union id=\"%s\">", name);
-    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+    for (i = ARRAY_SIZE(suf) - 1; i >= 0; i--) {
         g_string_append_printf(s, "<field name=\"%c\" type=\"%sn%c\"/>",
                                suf[i], name, suf[i]);
     }
-- 
2.34.1

