Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1462917ejb;
        Fri, 3 Feb 2023 06:57:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+F3zg8xP1MRqSIHvouOtVjSMNZEV7lUvJS6qpY2uoFJ5IXAuSLg4OOK+rNTHfRQmS0RIZ6
X-Received: by 2002:a05:622a:612:b0:3b9:cbb9:40e7 with SMTP id z18-20020a05622a061200b003b9cbb940e7mr11912809qta.54.1675436231222;
        Fri, 03 Feb 2023 06:57:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675436231; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0Rpg2rSaeGRvpkB1cgLUILyHM6G3/TodI8UWRZigL2xQblr++EDYk+8o+TGbODIQP
         YgAaqy5VWVdyQIuP0qvHkPoBBxpvbspEiLmerAQ0csRj+lVURSWRKrKLbiZvqMkbbwwq
         7zFCAm9yZGPMyewfu+3qhpLAlyZX1XXP+gNacaN3Jd5Neg4U64O0bNFr1i1s1kYdFFdr
         L04gLy3marTU8HcGJxPIj5vCfLB0PaGSelW0FoIq3BeOCEakC/eRPWmEW3P995XF3jsT
         GFIWdu1UUf4Ap20E9W6n73fZsB6ZAf1hWyl+xOonGGA5MtlYB6fRDHcoIrtnmtoYCe2D
         kn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tZif2it4bxphJIlcF0dFkRLHSBXoWvT693QwJQjGzNo=;
        b=itIxydu1We2IUqz7g44FoKMNv/NdhVWIUbNSk9mSywfGXrOpIAnv9KduhZzZv/+Jxj
         Z0HaAgkC6Jh0dmHA0j3KTu9CiKQconZiW4xB7s2RiUEbU3EAjleJM56mOkr8MyLLUlsp
         gVNsPhBTgxMcLNdDwKN6T6knO2HkIY013A1fkiK6pXvKhyOIcjjDjajlSfJfJydQiRhs
         5+vvT8lVQIYTs7J8hFSqg2eZIyDCdiZeeOZaTzgZF8tQo7cLkQgNIrvqT1G7x6IgAG13
         JGLnaE4EeazsEuPh1Uui9TdpGvNLuAu7LRqJQGWUK8g6htTWr3lDREcGXE5aULAnnQhp
         ZtuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e65UkPC5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19-20020ac85a93000000b003a7e873fabfsi1985821qtc.119.2023.02.03.06.57.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 06:57:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e65UkPC5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNxTy-0001zE-Fb; Fri, 03 Feb 2023 09:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTo-0001sS-SP
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:55:57 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTn-0005tS-C8
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:55:56 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso4052414wms.3
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 06:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZif2it4bxphJIlcF0dFkRLHSBXoWvT693QwJQjGzNo=;
 b=e65UkPC5QmpQDXpDZHki8/zuv9g086olkHcGAS66BX1U36sGP9oqOQf4gfvLXbmgWM
 ist1JU9OllFI7yZCBz6tNz6Ha/Ggei4zZSLQlDvRC+oetWcabyhOVeDcHTKcfE/DeOXT
 UlGqCAdz7du7/qgnw12RyoKAAetuy1z94c84H3hjNjLeW+PcZ5U7DVDaMLJ7lxhPexoJ
 7jWJoIXNxbYR1XVgjE4nrS34K2iwKa+Fty3/Y9CwuYFmLH5RIrznYxJNDAPD8lsJEfUP
 P3jb9eGztYmj2MmzbdXCcLIFEU/loAdFWayXAa0CLBy7FJIdV3Cx8dFVHr8zwUYJFjJ3
 r1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZif2it4bxphJIlcF0dFkRLHSBXoWvT693QwJQjGzNo=;
 b=ccqyRMOapdrNXNjcJm/Jo/SKEg0i4GlWslATJ7GP3oU3iewukMqBhYUEZaVmo8GGPg
 oIhjL+R+bavc/qYycJ1zCYdtP5cNAyiETETYpByfiHP1YeSoTf7juLrak26PR4ryYhCW
 iYH6RAcDiB+ZXrFjfobyXZmrNnM4D3wK9TRLmCdC/AOvrV5GItuJ3sM1UTs30++uxzZ7
 Gk9GOfDV0aeQ4FyPrpKFfYmGQ3DlUjnd7qKh3NKp42Lql1FjVSzFcjlQw/FM2m2cxEip
 u76zEZj/LZNNoV0oa9SaH8zj3a6H4Hi1m7NF+i3tp+JO/Ga8ft9CAGLQMvroYT91cJAq
 Kb+Q==
X-Gm-Message-State: AO0yUKVd0qxIx9VcvnR9bBEMXUs0ESD7r6vTnQrz1FxIc5u/UxVo2BXE
 LDByAeOjvjfCVnx7WQSSMz/eTQ==
X-Received: by 2002:a05:600c:3491:b0:3db:fc4:d018 with SMTP id
 a17-20020a05600c349100b003db0fc4d018mr10875768wmq.40.1675436153732; 
 Fri, 03 Feb 2023 06:55:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adfd083000000b002bfbda53b98sm2162717wrh.35.2023.02.03.06.55.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:55:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 03/15] linux-user/syscall: Do not open-code
 qdev_unrealize_and_unref()
Date: Fri,  3 Feb 2023 15:55:24 +0100
Message-Id: <20230203145536.17585-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: NyBMLld5/eSb

(See commits dc3edf8d8a "Convert to qdev_unrealize() manually"
 and 981c3dcd94 "Convert to qdev_unrealize() with Coccinelle").

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/syscall.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1f8c10f8ef..9299f71126 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8642,8 +8642,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         if (CPU_NEXT(first_cpu)) {
             TaskState *ts = cpu->opaque;
 
-            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
-            object_unref(OBJECT(cpu));
+            qdev_unrealize_and_unref(DEVICE(cpu), NULL);
             /*
              * At this point the CPU should be unrealized and removed
              * from cpu lists. We can clean-up the rest of the thread
-- 
2.38.1

