Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B44CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 22:01:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEEE1-0005A0-Li; Wed, 29 Oct 2025 18:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEEDy-000537-Ro
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 18:01:00 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEEDp-0000P5-Sn
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 18:00:57 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso1575195e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 15:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761775241; x=1762380041; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duuy25QCgDexk3mrUIcN43kXo2ogvu1PpVOfOdefns0=;
 b=DmVbyDNXkSUqYW/jrbWXtyk6sPC/6gEujmVf4DbvOgZ6511DpB93MT00qvWlnRoTuD
 7HbQT9Njb/FTIL9rmLRrGi4Re3JIpZd3YM0zYTmXlJfy+w8gq92k+5HNzgZwMZAxBJH+
 0Sv7BtWwkoVTAGpUtwtLrAKPifNxMFXZWH5PVgMf6XBVsjIDObImoll6KFclxraoitoN
 kRXEO90Q0WHDkis4IMuxMAGGwVUDLcw0EisE+UG318V2GTJRWmxVPibwJEmj7ZR/adAI
 NFYPngQYy9nbtOvCSX17Dn/o0w7cTLC97h9EWe/xwTnieu/iy3paRO7bWl6M1SO4K69A
 c7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761775241; x=1762380041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=duuy25QCgDexk3mrUIcN43kXo2ogvu1PpVOfOdefns0=;
 b=htiAbCZHA2CfzghR0XqS1gMIHXLpfzBnOnbakcaeS6r3wG34ddjS61h2977diUIR6V
 4lSPqkTjzX/3H+0QxlyHdYvNtH6IKeJHzjU0s/BcMOtz8YmTqGoSRn18xa4d5e4nRVG2
 pC2QwAh+YqEXlrNrF0Qn99IRJSBULhKILmn/8b/ksLZfUKFMVWdt+utmBBxqe7h55Twm
 4OAlvAxzePs1/JoTGmssEmmBT0vLCE12VsJOGyHEDhYUOLKj4mcIXeP6oqP5WjJveI90
 VcUOl/8+26olbQvRSHz8HfKrsVl7sjt/dVfIMWAQ0v9P3ksZ1jmeiXpGwoK0nrlRYQWV
 kJPg==
X-Gm-Message-State: AOJu0Yw/YgIiYi2C6W34JKyS7HRwn6FTplofZdr7tR73r58g7E6+Dt7+
 RsttgHn5Rdu/5xnY4uKQNrLkryEX5MAxa1E+tN8w7IeYbkAh86FkNiB7LOGzKLMsroeX9zY1lh9
 Fq0LTUV4=
X-Gm-Gg: ASbGncsVETZB3Fa6vkR7TV2yIruVbcFn0IC8Vsa2+1GhRliiCCva+8RDBMATYVTnWA9
 rh+uUPQmz3LAsyc4KxrUln+BOF+Wbg9loGEtsvyLTlk8Ucs83HWF2AieyYXXAbFIE7iHve66pUd
 R4DjYTzkFUQ0rHMJCzW6gIB9Sr1e0+0g/AHcYmkaKMEdVHv8H3Em4M7vyRH92LuesCIsaYv1XL+
 gtjwJRgegjCvJOJKA3l+GYn7oevn6w/KVo4BrSmEVk8zjfsy1YOSf96iTaw2YuZPfzAQDeRkhir
 llZ+zpDxzVC39Tw+42aKGvESdjtzmUE9/op+3/QlAE6x8usOOkBW+Rxy3ZKaOWcNao0Xcn5sXCn
 HUMPu3Y79ti274N5MDKMS/uagxld6cZmWD0+42FH1cIlMAZeYqhXum9VVt3VYXt2ML1myhrayxv
 f90uzf/eofp2m+TJCXhl8mMXhmZCA9DKYSyxermAzllw5Zh7PwUQ==
X-Google-Smtp-Source: AGHT+IFL+2b301wjnMEbUO9ieOfomnCRNXNE7IcsbQWokfS/W+DYoao33XsfSveF1YTos1EsQTTvLw==
X-Received: by 2002:a05:600c:4e09:b0:46e:206a:78cc with SMTP id
 5b1f17b1804b1-4771e1e1079mr46937445e9.28.1761775241498; 
 Wed, 29 Oct 2025 15:00:41 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718ffa42bsm52858005e9.4.2025.10.29.15.00.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 15:00:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 20/23] hw/xen: Use BITS_PER_BYTE & MAKE_64BIT_MASK() in
 req_size_bits()
Date: Wed, 29 Oct 2025 22:39:57 +0100
Message-ID: <20251029214001.99824-21-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Replace magic 8 by BITS_PER_BYTE, use MAKE_64BIT_MASK()
instead of open coding it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Message-Id: <20251022140114.72372-2-philmd@linaro.org>
---
 hw/xen/xen-hvm-common.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 52e2cce397a..258014370e1 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "exec/target_long.h"
@@ -448,12 +449,14 @@ static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
 
 static void handle_ioreq(XenIOState *state, ioreq_t *req)
 {
+    size_t req_size_bits = req->size * BITS_PER_BYTE;
+
     trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
                        req->addr, req->data, req->count, req->size);
 
     if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
             (req->size < sizeof (target_ulong))) {
-        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
+        req->data &= MAKE_64BIT_MASK(0, req_size_bits);
     }
 
     if (req->dir == IOREQ_WRITE)
-- 
2.51.0


