Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5081524ejc;
        Thu, 31 Aug 2023 06:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhgFVt8HDkxWdsPRXq0NsB+nCJ4GOX2eC7I+ufZLRBRtJRkW1ZQgRDZ+BgBytP3wHgVf5Z
X-Received: by 2002:a05:6870:e414:b0:1c8:d098:f94 with SMTP id n20-20020a056870e41400b001c8d0980f94mr6246440oag.17.1693487368152;
        Thu, 31 Aug 2023 06:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487368; cv=none;
        d=google.com; s=arc-20160816;
        b=Zvzkstf1E/jjdOyVocfqYa0PQT3QAbLR3L4R65cf0WPRb/UaEWxDA6Jjw1/kfcg/3y
         k27VZcqSNpTjjWg5gWJU2f3fSrx23x7my//rqmAhFSE3K4x6wiqFZE8BOaJMliPS5k+j
         IZecRAEnrpNgO2IMgt3PQ5GcWecURP3klhOx18OStPvyd5FbcnfQedU4dWcVo0i44Es+
         jgYuGj5L2sLripVz89LL3cc0n0/1/oiomlO/Pa9koNwMX0OeAk6XuwzT5zlmxBE2pi0s
         XShhzDPNE5w97e7T0htO3KYk3ytXwZkVJqk7FPNCONCyAr9P0arOh3QwNTrg4Q4qYZO/
         BFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=w2l3etk60u9ufgIOfv/s6JAhxToUw77UDbpQWhQFU8I=;
        fh=ehJgi6qtc5GgGFSi7kUe5Uk36tkdtVlia04EiCfbU/Y=;
        b=ZmZlHS11DyS0aW8b6IG9rPDts+v3KECARtpAL907lil4EvCCIp/KXvpafgZ0wjhpzV
         7wCkg2iFprMa4EVE2Ola5dmdp/yptk6zsE53279dX2sxIeyJEapHmnYRM0oUq2LxpzgB
         vNn22g07ZF0XRLo5JAC6NWR3poyZfCm/nfhPzOmgPvRWhgFje1zPhnInEFF0nhBduLdG
         CGtTJ1A954fYLcwA9SiRzDHq6Q5szgm12oCwIrFTm1t/QpbA8Gpj+vVTOhyLt2/KJjCE
         V6cTwQm6TPJ3b/vGfPC6SN5yVLfKE4B437N8JNEJXdgxtBoDY33KoeiimfevcOjTzUYf
         OidQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mwo5Z+As;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020a0cc986000000b0063f82aafb9asi837364qvk.299.2023.08.31.06.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mwo5Z+As;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbhJT-0005M5-Gb; Thu, 31 Aug 2023 09:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFn-0003Mu-Of
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:58:33 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFl-0005bs-Bq
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:58:31 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4018af103bcso4756455e9.1
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486708; x=1694091508; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w2l3etk60u9ufgIOfv/s6JAhxToUw77UDbpQWhQFU8I=;
 b=Mwo5Z+AsbGQCYpaTW6CftIo1L21sFXa9Xrb3tkMT3yuXCyDAPdeZdc1vQhUobpceBx
 6hk5xLrU4g/wpD1chFcenaIXOB8Us8I8u2iYcYLbmRLNq5OhiRtXiEbM0UGq149bYWc9
 qMjBnH0oAU0qYVOOIN2JvpKvLkQtZ8zfS1fhGP7gVnr9MOe7sjQfH+g5kb8DxAtCjRXh
 3QH0+jUePmRRIac/bh6aRGXyBXTPFiZwxa496CreC69ldKWyXQHt74RsFU/ZlSAON5DJ
 3GYFknVOYpIV5TvC1fZ0ZzNbUP62QTfwBaDIDOskFkhacR9mCicVLg4j43rpwT1gNF19
 BOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486708; x=1694091508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2l3etk60u9ufgIOfv/s6JAhxToUw77UDbpQWhQFU8I=;
 b=Ps2MJ2G1wtDUW2Qsvm32Mlnw7rounJemj7zPEVxBP+Ze6VudMgB0YGUZqDHBDlNiJ2
 PGP56GI8bbeKqaEtmUnrxYAtHkKPCQjsxVqjfPJMF2p9EXqXRo45ubV7ZBsTB8+/sC4L
 vBWRAPsZDhIgdIE3ZzYfe437N7rrTKw8+wagk+rUsUFxXxGjsimonKcp1LxJxjZR8eie
 fhqTz1wWYb8G1CmwF86McFS2EXcIDPSbs4KeFPC5DW+L53wXcdYGTYRa7zX1tdomy4LA
 O/AuUN8VOQR7gAXXLFYSyI5KpUP2ECSzv+T9np8E+p6hb2jr6epj5/RsTlb99PgpvyT5
 KI2Q==
X-Gm-Message-State: AOJu0YxG/h7zJuLuN/NiurNmvFo6bpG7FVAfcJSWwvo1A0hmDalPfdsL
 OPJvkX0vomWSol60NwB7CfoA3BKCpQjWMywYgv8=
X-Received: by 2002:a05:600c:3591:b0:401:bc03:1aae with SMTP id
 p17-20020a05600c359100b00401bc031aaemr2130849wmq.12.1693486708110; 
 Thu, 31 Aug 2023 05:58:28 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 hn8-20020a05600ca38800b003fee6e170f9sm1902522wmb.45.2023.08.31.05.58.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:58:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 17/41] qemu/processor: Remove unused 'qemu/atomic.h' header
Date: Thu, 31 Aug 2023 14:56:19 +0200
Message-ID: <20230831125646.67855-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: gQc6XpI5Vlwp

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-11-philmd@linaro.org>
---
 include/qemu/processor.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/qemu/processor.h b/include/qemu/processor.h
index 8e16c9277d..9f0dcdf28f 100644
--- a/include/qemu/processor.h
+++ b/include/qemu/processor.h
@@ -7,8 +7,6 @@
 #ifndef QEMU_PROCESSOR_H
 #define QEMU_PROCESSOR_H
 
-#include "qemu/atomic.h"
-
 #if defined(__i386__) || defined(__x86_64__)
 # define cpu_relax() asm volatile("rep; nop" ::: "memory")
 
-- 
2.41.0

