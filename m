Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5378827lfm;
        Wed, 26 May 2021 05:24:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4c2m0BwW4SpJb8IYmD91wRuIz/ER7KQe0yAEwzAL7Kxze3x0+xzafPHpOpWc+OMey7Cxv
X-Received: by 2002:a67:e997:: with SMTP id b23mr32533483vso.59.1622031874103;
        Wed, 26 May 2021 05:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622031874; cv=none;
        d=google.com; s=arc-20160816;
        b=JPGlZ+fjhQobV0gRv7oNlgn5JAWUdZEC4Q+LvOGEO0SU0tk5DLmtyjWXIOYDdfgH43
         cxk1dkzm2X2ZjdhKhTp/8yAx57yjAUbEgESPkNHjVIdgJSIgbxEGfWkXMF3Ovlyrq96P
         Q0wqj0tPVvnBrbZ44RDa9TC/Y00fZremDwfXkqYVa4GyHZLcjxfGBwuoYzzr98JNp8cK
         Jm+02OHF4B8P+keB8zWuG7TUmQqX3xx0mBe42RxsBDusdX5UFAOxWLOhzkdh/ONjk9I+
         tPeqCJep4SQ15JYQFpGGDH/BaGLFgV7OLh5hZepBIDg7g/jJVS8NbnKn5T7T9gTuuWbO
         kx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YzZcKLssN7IMbDyrpIALXOlPU1SgzuV4mOV0Xk2F1ro=;
        b=st1X1HGyf6LOHIWAADs+X9UX6Mv9tRvh7hfkqMJJ8kVZNh8PuKRPJlk/lT4l4SJfn9
         1uCs+I9wYmVQQ98xJKX2vVtOCz5oo5npRyF03AvG8gZIQ3VxttNiFUSP5bOk1pRU2cPW
         CtE08BNym49GdU130aVgiNdrZyBDndBmh20iIHo4vZbdat3cHnnTKhgPZcRMeyZJJ81x
         D05x+qiZ3dZPcCjOWo3JFy0jZ5DC9JFU5y7bqkr/JPLIRhnkc0qlh8mlSzEoNMb+7mQj
         mGmEJ2HQZ5jDJb6SRcfnSuSYMUqdMfzdAkcJBLlNVV1AzeEdsiC2sPxY5Kc6bkfAZ82q
         Y+8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=EdvBbosO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22si5736157vsj.351.2021.05.26.05.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 May 2021 05:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=EdvBbosO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llsaP-0007i3-Dy
	for alex.bennee@linaro.org; Wed, 26 May 2021 08:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsV7-0001c8-AQ
 for qemu-arm@nongnu.org; Wed, 26 May 2021 08:19:05 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsUy-00033t-Ot
 for qemu-arm@nongnu.org; Wed, 26 May 2021 08:19:05 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so414026wmq.0
 for <qemu-arm@nongnu.org>; Wed, 26 May 2021 05:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YzZcKLssN7IMbDyrpIALXOlPU1SgzuV4mOV0Xk2F1ro=;
 b=EdvBbosOQzKMxr8CF4OHRsrOo+a4DByEwTwhnCH4NvbGm/DN0eTvXW7z47PeIQf7i1
 hWD3UjR24N3L0WVWOr5gbbaK2L1QxOReU24L6OpROSYkH/aIE7SAno+yNp+Gs0FhqLrw
 4Fvan53o8KG8Higqh+wMRfuczEVdoBx9hN77+IwTzjTOi/PiEi+2jJ+5MIP6MIp/mDKt
 0sceW266kQBnSHyyWTQBaVYmQejIDCKq4Ov8G3K96Imol0JZVkLfBsZwEbrDl6K6W/uV
 6QPs+E+Xs2/9HSDLfo9A4VKFNk0hBUqdD3CYSGOULrkgc0Qthw5l4L0pGtSGwQMT4hIO
 chJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YzZcKLssN7IMbDyrpIALXOlPU1SgzuV4mOV0Xk2F1ro=;
 b=VBfExJIrSOGwtOSvPjyI+7i+5WYFWQy1AXvk/bbNZnrnMd9Q4FE5uage/IFprTQg8r
 Uay9CXoJQ7t+gjnbYhZonH2msTyjLkoIbSDXkqvuhQu4ltIaPHOrncO09XceerU2Vl98
 tGiYqFD3yvzyUPuD3f/P+LYL/mrpqwf5MRlm3EKZLoPrrT0L1aNTcRY1sdIRN9OLPHs3
 nNUoLUpoWuENaaejIGZdrjHmCSb7Pxd4HT5sXOHQiYMCTkbUyqfmNBGYAyt2UouWw23+
 u2vK4MWO5boukJIdxyvLhNJoQcU+FHE/0ejoPqW6GmbP+2tAogsD6hjyvYnMn37rqZbM
 m3Eg==
X-Gm-Message-State: AOAM530LA7mZ7j3HSf5p+ycJ8RVxYp/eGO4cYMDaGMktWIzdu88R4H5C
 1w5cQM3VVquBoET1GZMPVmcvmqenJorxw897f0RP6iFtI+38l96lRPYIABZ1SEIHdt6BVByYSn3
 zRXGWh46rdkX5St/VK65VDsBetWAQRDNQ002jhZqXlIOIFJQ10ssh6FjjgiYGBlJfBA==
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr28463396wmq.37.1622031535083; 
 Wed, 26 May 2021 05:18:55 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id q11sm14634522wrx.80.2021.05.26.05.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:18:54 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv2 3/4] target/arm: use raise_exception_ra for MTE check failure
Date: Wed, 26 May 2021 13:18:46 +0100
Message-Id: <20210526121847.1935454-4-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526121847.1935454-1-jamie@nuviainc.com>
References: <20210526121847.1935454-1-jamie@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=jamie@nuviainc.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jamie Iles <jamie@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e4h3qOrz3mdx

Now that raise_exception_ra restores the state before raising the
exception we can use restore_exception_ra to perform the state restore +
exception raising without clobbering the syndrome.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 target/arm/mte_helper.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index a6fccc6e69e2..d48419583747 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -563,20 +563,13 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
 
     switch (tcf) {
     case 1:
-        /*
-         * Tag check fail causes a synchronous exception.
-         *
-         * In restore_state_to_opc, we set the exception syndrome
-         * for the load or store operation.  Unwind first so we
-         * may overwrite that with the syndrome for the tag check.
-         */
-        cpu_restore_state(env_cpu(env), ra, true);
         env->exception.vaddress = dirty_ptr;
 
         is_write = FIELD_EX32(desc, MTEDESC, WRITE);
         syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0,
                                     is_write, 0x11);
-        raise_exception(env, EXCP_DATA_ABORT, syn, exception_target_el(env));
+        raise_exception_ra(env, EXCP_DATA_ABORT, syn,
+                           exception_target_el(env), ra);
         /* noreturn, but fall through to the assert anyway */
 
     case 0:
-- 
2.30.2

