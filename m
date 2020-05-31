Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2408227lfc;
        Sun, 31 May 2020 11:01:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDNHTHk0J+zDAqCej/vZ13qtVHVXYfNZImgN8rEFdbU9K0afyEWvYquHwRv3MZX/o2k03N
X-Received: by 2002:a25:354:: with SMTP id 81mr29478891ybd.257.1590948070079;
        Sun, 31 May 2020 11:01:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590948070; cv=none;
        d=google.com; s=arc-20160816;
        b=epv2ef2miMT5EB4HZh2R7PkzPRIWDvmBRT2NlfuChF8Rcl4qhwmMFThmKcCGslkYm5
         wxxFsw04rUmPgikWHFyumA9oeUZm0KrMoVqDiq+df/R3Yv36MhWMM9L3KL497VI23J8O
         2KsqAxTPs8wLlBmVV/BrGmnlYj0/3o3ZOgu6EVpB96MLmouyJkNGVm1zxYBDtQwW2eYT
         JLKHIt1XGybaIfhj0MSig+xmfLXGBNe2XNnJv/rP+Nn5/RgPEIJfFpzc0b0JLDAsvBJ1
         TmGrSuooiaQ+LX8BN/dGN/x7ImHuTE7x0Ef9sq8F8QalPgyJpABXz72WfweK+SkGwO8n
         5X5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RxLw4QcKrYbunBKOIFiXjKfQ22xYQIVcbponl1x6BVE=;
        b=FgKcwgexHyk0w8tDTZ+FZZneikLiWSvvhrLpafuNkxHqg15E6+LcQ6aF3wJhXsoQrn
         MVvnJQfMU///xjRNedshFrxsUN8AU23h6EjIGANpVJUrc0YhLRGjnYyvlqg+7/hkucVo
         ACbjCa3DaU/Zu0N3Yxj5Crt+3pm4swR1Dmky3x66SadS67lytFj9zp4iECEYoG/T/igH
         3u0WFJo2OJVGwyK3+vGJxP4JP4VONc0R3h99H8VWyi31duRVRKdhcQ6yJiOebVxARaWg
         7neI9Vypa4uiOTUzi32HuHWeZL9K2D7wR+ad0Ut7GjG4OzhOCRdO4bYKkQmCyKjJdZsg
         1OAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Khbp+GoB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x124si12092053ybc.82.2020.05.31.11.01.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 May 2020 11:01:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Khbp+GoB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfSGj-0003TA-F7
	for alex.bennee@linaro.org; Sun, 31 May 2020 14:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfSAP-0003jM-GT; Sun, 31 May 2020 13:54:37 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfSAO-0007fm-Lg; Sun, 31 May 2020 13:54:37 -0400
Received: by mail-wr1-x442.google.com with SMTP id p5so3278603wrw.9;
 Sun, 31 May 2020 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RxLw4QcKrYbunBKOIFiXjKfQ22xYQIVcbponl1x6BVE=;
 b=Khbp+GoBcISHb5ous2OLktoshnUtyXO/ouTWpf/PhYqSW0AtUiYvKIzqIdaug01Cxg
 fTpFIwHFS6evRAuvnZ27wTkYQnQ3Q0OqV8+FPc4ug494g4jC2Rp7mROG/cFWw6Kl3nCK
 kbUtdrZASaOx5EU7mVZObufiIVd2Wu+s7v4BKmUnP1Za1CGghP4qzeaeVMsPwIQUs154
 d6L4QoK4LOKQFOxbhtlY0TLzcJOh3C8wNTlNvSRVK20adYtNnyUxdNqbYjmVO3cERhT0
 NJ5Wx8DP6pcJXzfjRpowbkQUfV7hyoX2EdXSGOm3ACVpwDFLhrlhKTPRYSrohjIavf/l
 PPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RxLw4QcKrYbunBKOIFiXjKfQ22xYQIVcbponl1x6BVE=;
 b=VynKJoefzWUemcwXH3XPa8X+8Rt5hG2SAoczOlygBsa7oj5+eGm7ZOidMuHdxNS+kI
 QaYiHulTszcCvs4GKJSNehDwW5I7L7rps3GWCXJLtiEXSvPg/cu6adngSJe7sHyvJVU3
 TCKCDDiKi5QM134UiHx0+h+XAL/vru56XsoSQ8Nbmpzu8DwAMxYn2dGySrjMYbNZ2Cs+
 e+XFeRVlfcZmkCwrsVMwhsfNvCfz1zE3W2z2qSKlUApR6Ndk18VZqj/Q5aZmuRgIh9F8
 R45IYRWh2Qum6qWB2uZ1Gg6IlCoCzEbrxa8Cugz0iqQGlNta/FeEgKgQ1FGVIg8uOzyt
 +ZEA==
X-Gm-Message-State: AOAM532t/XupDdfQyOK1dwKe9vKjXdBalq31rxoDTwdkZlp8IcVdQ+og
 7ZxL1oljziNhWua6OAlUFp6bhjAk
X-Received: by 2002:adf:fe07:: with SMTP id n7mr10524769wrr.240.1590947674465; 
 Sun, 31 May 2020 10:54:34 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id z7sm17862531wrt.6.2020.05.31.10.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:54:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] exec: Restrict 32-bit CPUs to 32-bit address space
Date: Sun, 31 May 2020 19:54:24 +0200
Message-Id: <20200531175425.10329-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200531175425.10329-1-f4bug@amsat.org>
References: <20200531175425.10329-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5BQymUcinM3J

It is pointless to have 32-bit CPUs see a 64-bit address
space, when they can only address the 32 lower bits.

Only create CPU address space with a size it can address.
This makes HMP 'info mtree' command easier to understand
(on 32-bit CPUs).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
This is particularly helpful with the AVR cores.
---
 exec.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 5162f0d12f..d6809a9447 100644
--- a/exec.c
+++ b/exec.c
@@ -2962,9 +2962,17 @@ static void tcg_commit(MemoryListener *listener)
 
 static void memory_map_init(void)
 {
+    uint64_t system_memory_size;
+
+#if TARGET_LONG_BITS >= 64
+    system_memory_size = UINT64_MAX;
+#else
+    system_memory_size = 1ULL << TARGET_LONG_BITS;
+#endif
+
     system_memory = g_malloc(sizeof(*system_memory));
 
-    memory_region_init(system_memory, NULL, "system", UINT64_MAX);
+    memory_region_init(system_memory, NULL, "system", system_memory_size);
     address_space_init(&address_space_memory, system_memory, "memory");
 
     system_io = g_malloc(sizeof(*system_io));
-- 
2.21.3

