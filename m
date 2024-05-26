Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp2838717ejb;
        Sun, 26 May 2024 13:46:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2VWtmyBPBdQILFoXQycqTqKUAMqsacaMnhvOTF6IXUJDUiEwJs6alDD3I9dY7idnbqWuXdYEKdC4Ugk4NFGviTQQD7nkZ
X-Google-Smtp-Source: AGHT+IHXnPdw1/mFTCk+OyWjHJ6Id/rxhpM5JuMGg/EOhdIvhLn9LHaB9olP/NeoN4iX4UgkUgE9
X-Received: by 2002:a05:6214:4346:b0:6ad:7d71:2bc with SMTP id 6a1803df08f44-6ad7d7106cemr18910896d6.38.1716756396551;
        Sun, 26 May 2024 13:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716756396; cv=none;
        d=google.com; s=arc-20160816;
        b=ER/utJczPoKagXL7k4jqlUdXsLMx0ssp3Z5Ko9j/aph9ZFYomyTWe9SJ4tTuJ+l8lT
         Uvp0lZD6Mep5/rszm3T1zO7HKHCNr0IY8xh/2eiN/e32YMi4H9vCDNWLfJpORKtS5ghk
         pT5UCS0DVQ03cT8tq20qhWPEm0uWdri0csAKw2xEmOEmGtf2UYXs5Ubmwn9XNZsiOCsB
         FDclnKpIslzAWJ10AdKC8Kp/1cwqvKeyxF4mngeOfwf+Jp0aI9rxCt/8nllxionIHVI6
         h201aprd+Pj6L3O7GR1+hkHWRf6/uo+xBXRZP4TvOSsvjfaMbve+ZnaaSAB17OG7iGdV
         a0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DsMIKy/L5erl56a6I+mGWGQ4rNvzDGnzn+CAnzypzwo=;
        fh=4e3vr5h7Sr1qFr+Y9L85pi1N0SssSpWbJe1mSoAuYco=;
        b=vu6IWQsvBpEs33veiGKlKzP2fDIWt4AkrPNcr8k9LelfWX4GKeJ8MkDIGjES+XrC5L
         dxEA3JyPt7Wa34IChKstrHtr67dJaLRz+LaPXh3qqOZPSOB8dW9aBk8Et6zfJf0Vyt+0
         oxpIcjd1I2ZKAHSUhT/eV6W5ONvbfARebne9jXlGMPOrWP0lWAcOSdzXwkzD3xPaRh1f
         z2RPCdRj7ubM/5u+XJ73TTU7044j7lK/34MzASVWe0ftBVVmAyt2m8Xg/CKRUqUcxp4W
         FTR9+Enb+OhIu0iDBZ497ZalxifN5E++m7UdGZxw9k+DYit0UKXhsWbiSEAOFhZfVJne
         +jRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tihjwXC6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac117057d7si65507386d6.357.2024.05.26.13.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 May 2024 13:46:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tihjwXC6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBKkh-0002yw-Ff; Sun, 26 May 2024 16:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sBKkf-0002yF-Bh
 for qemu-arm@nongnu.org; Sun, 26 May 2024 16:45:57 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sBKkc-0003fu-NM
 for qemu-arm@nongnu.org; Sun, 26 May 2024 16:45:57 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6f693306b7cso5509495b3a.1
 for <qemu-arm@nongnu.org>; Sun, 26 May 2024 13:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716756353; x=1717361153; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DsMIKy/L5erl56a6I+mGWGQ4rNvzDGnzn+CAnzypzwo=;
 b=tihjwXC6kHqYCCXuT0HsByeg4m7T2bPeldiUZqyXF3i+qgzuk+HYTnVpDgHoHTPUMf
 +2UW9EHnYSmOvjSfd2cun/Xy0+0yAJrhwOnmdqv6b/D2Zct7UQTvBxMUWwys64lU0BC7
 Tke91JNsEFYn1SJ0tHt4UKmBcGBdAmSbvhiBZaBPvjdCRtV2bSCjLqFCoNvzY1Eq2FnZ
 SuxWQaY5rnJxQpzGMQx7IjCwOL7l5YUzpUJSGtsPF0Ibn/vkAtN+joOPZiqGvNFIJZCl
 F4VZN4MUuxnBtbS5QtCQO3FWim5Zl6+LDPXlftqNLQuuTKvv0eS65aIf4J3JYqrnwcat
 xeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716756353; x=1717361153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DsMIKy/L5erl56a6I+mGWGQ4rNvzDGnzn+CAnzypzwo=;
 b=VyyohG4molxHtEm81uPgrDeYsJyDeE8q0memAdfk1fUpO3tmlJuPrahZ7G704v9dAY
 orHUKyOA+QrPYy8WydBfa0hCw04vQh9yt4gCOrZclMbLs9e0wYYM6sAzc8Zz8ATk473j
 nzNddiZaPTtOXtE3KgPbWP2nsjQSo4D3D0uZw/ZtWnVMG4XF2dzIVl6EKfb9DnleN8q8
 j2aAV3sDW2V9YwTMLi/aj4pDijsxtiF8ShjWwC23LWAt12km0hVLIjNBPHkpsgZnyty3
 E66DEC+vm3TXKYrZvdbxHQjyhl7B0yeRDeNcYkCGSRaW4BNDPySnvt9D+OHOHEW0iQMB
 EjCQ==
X-Gm-Message-State: AOJu0Yz+UKmRWGSPaiu1AuTVoxmhertH1lPKpOCbyaFDwnAptymACA6m
 pM5OCL6JOqGwNyJ32mwjHK4Ut4xC3GYgEYi5DChS12/u5YjfFoo9Lgysv64Ntdg=
X-Received: by 2002:a05:6a00:1d8f:b0:6ed:21bc:ed8c with SMTP id
 d2e1a72fcca58-6f8f36f6f75mr9368156b3a.18.1716756352599; 
 Sun, 26 May 2024 13:45:52 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-682226fc4bbsm4658843a12.41.2024.05.26.13.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 May 2024 13:45:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Disable SVE extensions when SVE is disabled
Date: Sun, 26 May 2024 13:45:51 -0700
Message-Id: <20240526204551.553282-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: mtLvU3RYbD93

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2304
Reported-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Marcin added the correct patch to the issue 3 weeks ago, so I'm giving
him authorship here.  I only updated the comment a bit.
Marcin, if you'd reply to this with your s-o-b, that would be helpful.

r~

---
 target/arm/cpu64.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c15d086049..862d2b92fa 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -109,7 +109,11 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
          * No explicit bits enabled, and no implicit bits from sve-max-vq.
          */
         if (!cpu_isar_feature(aa64_sve, cpu)) {
-            /* SVE is disabled and so are all vector lengths.  Good. */
+            /*
+             * SVE is disabled and so are all vector lengths.  Good.
+             * Disable all SVE extensions as well.
+             */
+            cpu->isar.id_aa64zfr0 = 0;
             return;
         }
 
-- 
2.34.1

