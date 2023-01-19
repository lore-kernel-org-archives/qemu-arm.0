Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp389287ejc;
        Thu, 19 Jan 2023 06:59:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMX4bLZVNG3LjHbBKMs1md31iURvZSUxBrvuqrGDcUCKYIAlN2Tk3lgdF2dOWD1FmTgbBs
X-Received: by 2002:a05:6102:3443:b0:3d0:d941:d5ac with SMTP id o3-20020a056102344300b003d0d941d5acmr6452199vsj.7.1674140386067;
        Thu, 19 Jan 2023 06:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674140386; cv=none;
        d=google.com; s=arc-20160816;
        b=TWMUDBWFmb06BQTad4j9/BGRIFFZmlisiDFPOtVHAyuKZ9zvphT3TzQgQuhQCZEhPi
         NyGxHAjx2pDTFokIO6s+Dg0uRtd1wzJfpJk9qICsXZ9zmwMmi4k308EPajax3rWe2yyO
         py2afov8UWTwnT9Z5KfaL7N3YQ1Zim13wGGhk5dxDCbon8idyW+E2VSs9zkC6lhjl3wi
         HbgpCRd/p1YTWsJvS9EnHbOl2v9to+sbcbPJ8uflOrQ/Pe1STt1r4TBeCf9kbNdxEbO4
         KWqwuNdOiHfY6G2FzLBXSdWlzQlci08rHS7gCbZPZ2GMVsAFWk+ohL0oMfmOfwRCIpz+
         u6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9MjqM2w9hw3LWgeDOmCQX9tZeJS1teSf33PVNVZfRuA=;
        b=TtNJRHMglrigZzGJ6PmdRgJbkiwpTxuee90E6gh/cMzD05RQh4iU+wrZabeTXlyLJ4
         yJ8LAu5jOagQ4p/MhIO/CjEwr1tnHjLVMDnQcgnZaJ1ALow1trBJ6vj18yIqgp37QRhI
         ucZv61FsTY6IkEUk1g0u2q5ks6qRft0g4DoFb8Q1mtUwfaK5HLJUmsDVwr0p1Cz/p4/G
         xpaXJqnJ+UWiQdBJcu1fSglPg2bOt23V2boQlb3FcI07Fw0pQhcSViryPLwHss1FWzJt
         OaVtSQ0LT9/F3f8hll86vFoSJEr1n1wcahaNHtMc4VstKWpGj1jLt2pCz8sZ0GjZe3wj
         fJuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oGv1leY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi21-20020a05620a319500b00706a1551404si5290310qkb.103.2023.01.19.06.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 06:59:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oGv1leY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIWNi-0006JC-Ss; Thu, 19 Jan 2023 09:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNg-0006IP-A5
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:59:08 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNe-0003Z1-NN
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:59:08 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r9so2140634wrw.4
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 06:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9MjqM2w9hw3LWgeDOmCQX9tZeJS1teSf33PVNVZfRuA=;
 b=oGv1leY41kTrRW2rwI6qM6gjAqfHsvkfBcPUqeJBS6mrskxptcHLv+f+XSyX1U73r3
 zuKKd/4RatU6xOXRNlXg3Ds9U4Uh3ZeWGue5MhL3hOAVohOi+reoHg9aqvhJXh56gdT2
 5o69d9eqinktB2+RXaMwt3zFreg6sniGMTK6zB1IeHHtdro/WITVKhhwkqp3gpWY4+3d
 eyUaQ8qdEas5T8iZmYaadB2PiB/re+O51ATNalxDAvMkvCBz/0iUrct6HNDMT4ECewDh
 36yDEiPl/R2h8jpu1rxaHaDvNX+3tJCE8en0rQW508pjijs/qq4+glkuJFPAQc6aV4+N
 j1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9MjqM2w9hw3LWgeDOmCQX9tZeJS1teSf33PVNVZfRuA=;
 b=5CXAGb2lKtqM4rqbn4ibz3RnKOjJkHC6Zj14x5uuUEjTAsUMl+zfBCNh+OYzdqNgEv
 EFQ1+26jaEjbtAN6ez53ijUO5JBfTvYD+ty7cN3ap1ed1ZIJ5fFrup5c5LAWICZ+3FVD
 RoxS5Yt36kXczitR+AwGLzmSzoIjrYcaMIbbGcJI39Yr5RJYNAiXKID/iL/fYY/qtkYz
 yNusavReoI7PaRW1Qz/Na3r1R5bx+Tongho1y1koKjlPaCYwdPQ7MY8FpHVfdnC+bPSq
 rzpdIAhACbcCkVIq/YRN6BHWDsyxSg3+4qwaSpp+1NFSWnxMd5MIqq0/fdOq7olr7PU3
 Laeg==
X-Gm-Message-State: AFqh2kqVVDT1wIQ7OxFs436tYVwANjuLcLjCW+39bQo0mOzZdHLrXjHQ
 XQrNVjTRMKZW3SC9hNKdQ8rbQg==
X-Received: by 2002:a5d:6581:0:b0:2bb:dad4:9525 with SMTP id
 q1-20020a5d6581000000b002bbdad49525mr9162698wru.10.1674140345186; 
 Thu, 19 Jan 2023 06:59:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a5d4cc8000000b002bdeb0cf706sm14689742wrt.65.2023.01.19.06.59.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:59:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 05/11] tests/qtest/migration-test: Inverse #ifdef'ry ladders
Date: Thu, 19 Jan 2023 15:58:32 +0100
Message-Id: <20230119145838.41835-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: WnUq3jmEHybl

This slighly simplify the logic, and eases the following conversion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index dbde726adf..8beeda4686 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -647,15 +647,15 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     }
 
     if (!getenv("QTEST_LOG") && args->hide_stderr) {
-#ifndef _WIN32
-        ignore_stderr = "2>/dev/null";
-#else
+#ifdef _WIN32
         /*
          * On Windows the QEMU executable is created via CreateProcess() and
          * IO redirection does not work, so don't bother adding IO redirection
          * to the command line.
          */
         ignore_stderr = "";
+#else
+        ignore_stderr = "2>/dev/null";
 #endif
     } else {
         ignore_stderr = "";
-- 
2.38.1

