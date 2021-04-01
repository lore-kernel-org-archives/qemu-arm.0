Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp455026lfg;
        Thu, 1 Apr 2021 05:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyknwET3OhP6K9vjxAFzHdxmgjDu3672Ieleo2ZGuvMTR6lY14WUA+0pEH5JUTTFgeZEIZ1
X-Received: by 2002:a92:c50c:: with SMTP id r12mr6642962ilg.52.1617281781742;
        Thu, 01 Apr 2021 05:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617281781; cv=none;
        d=google.com; s=arc-20160816;
        b=OJl52EtY6riUw8LSWHl69v9z+SjAFEYRmUR8x9+ZeXoMNIEYhdHsYejMW2ekffPT0n
         DUPZ8pIAuaCpLrnKoVcKJAbtqOU8XqWP9ie6gzKCTX4UbCMOgKbSyYq1NqIVQLDB0wb3
         cehVOBISqqu6eZVcBE5/nZy/w/TkY6O4jImr2xfktC03Ml+lSUoj7hRW49iqzezwqFCM
         D52KtuUiiouuHCQ7VG6/e4awIBp/uZ/crGhjt3kwnVESoB0/DYPw/Fuc0JF9eUpeMyCX
         jPqUmu9cpQlDGMpq1g97zliXtuw86LVvc6B8i9vC+z14rEo9M/Td8gqUStqUFij42WTC
         CGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3J/atxW6sPYnXqaJSp9SobS3v6A+MNQfu9eol6wNQ30=;
        b=R4HJLdBHS8o8SFJFSChR9NDLfE1mEPywEt/wZ52QUuccjbBzUBh6jJm0/A+T5WtNd3
         yLUhi85mjmDC8ODL6uyh5ivuPo8FdtP15S08+gYgPJluSOxXOpz++wtWWAY9o2JqqRnX
         9bpO2gVWFmykIon76G1ieQvw/5wA2MUrIPUNVzAhl/k9IMLytqNPS8E5/b4jXg2XMzeC
         JHdALbVB2YT5zXQx6shZUjk51PjMSKaUTQtA2ep9ZtGLZybvJ0dGXE/CCyV3QPC848Ut
         9Bm1Y2MG6r7EqeQaLApZX4p1GdEgB4Hb58tlwFSWmEpMwAnYJ1cNxKn9QXEAWXsNm0BU
         c1bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KLY2oOlZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si4547597ilm.155.2021.04.01.05.56.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 05:56:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KLY2oOlZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRws1-0001lW-22
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 08:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrY-0001i0-KB
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 08:55:52 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:33729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrW-0002y9-2I
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 08:55:52 -0400
Received: by mail-oi1-x229.google.com with SMTP id w70so1717082oie.0
 for <qemu-arm@nongnu.org>; Thu, 01 Apr 2021 05:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3J/atxW6sPYnXqaJSp9SobS3v6A+MNQfu9eol6wNQ30=;
 b=KLY2oOlZTJhTWb3UIrY7e18uqGaEK2xvaLysjy7MJtXDUs070MMjii5B4pBurCYFB9
 qySEVXiBaIzM0zCr1wF5LRLFklKjryKdF4V+Ug1skqIkv8ikHCHm+kZ5tpmWtdi5UGu2
 /97WcZu7SwcIDTJ9VvhwmCa4kSEfeYP9+39Ih4ic7s689TE6ePHfbRFrhhF6w6lgZUkI
 ZLw+KHl7q9hCrNC0agH+YU+Yts7W4j2ihJVWC4h/P2XxEFxRwJdARNVx+zRc61IRYOMr
 5pYDPuQG8slq6+QpGrJpgfKnqoe9JhyDu/ob63LNibEFpMHwzlMII2tepurVV8KyYQge
 lNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3J/atxW6sPYnXqaJSp9SobS3v6A+MNQfu9eol6wNQ30=;
 b=OADIBlmIPryrn5/daeznaRUMONBLeCgJgSDEwhIRabU28/iq5MPqHpk24MD7aJn55G
 mqWjAu+1ekyFV0L6HeO2zYG7ydZlZUdY/nR8Z51GjGZY4yklBj+6mTsG77vvdxBHDJ1B
 zteiBsZ+1LhQZ/KkYpQHEQoAuVcSv8/a5jR4p0UykIFEwiwUWlqKqZeJYRa813p72pY/
 bK3GolSrP8x5oHkqEbhZREEHE/EloYP5sOjHs4sE+1axPaAeUE11yPIktD1Pm2NN8UUZ
 bEPPWtWFnNBxjWsttCbVa0NQluJDiU/BcTtMrxE1Wwwh7EDUkh7AhAJPQ/iyW8mlEKTe
 aIkQ==
X-Gm-Message-State: AOAM53117A3N1m0MFqgD7fZ4/xuombABqRQnoEjwh9lkr6AM3Q8iG/RK
 7KIyjyfDUnWS29qTga7+sQRE
X-Received: by 2002:aca:d514:: with SMTP id m20mr5850356oig.47.1617281749029; 
 Thu, 01 Apr 2021 05:55:49 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id w11sm1082245ooc.35.2021.04.01.05.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 05:55:48 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH RESEND v2 2/6] target/arm/kvm: Add helper to detect el2 when
 using KVM
Date: Thu,  1 Apr 2021 12:55:34 +0000
Message-Id: <65b8771bfecada08bf02c9cf87c2f0f9cdf943b3.1617281290.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281290.git.haibo.xu@linaro.org>
References: <cover.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=haibo.xu@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AxCLTwAkr9zz

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/kvm64.c   |  5 +++++
 target/arm/kvm_arm.h | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db9..9cacaf2eb8 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -721,6 +721,11 @@ bool kvm_arm_steal_time_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 }
 
+bool kvm_arm_el2_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL2);
+}
+
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
 void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 34f8daa377..7d7fc7981b 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -285,6 +285,14 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
  */
 bool kvm_arm_steal_time_supported(void);
 
+/**
+ * kvm_arm_el2_supported:
+ *
+ * Returns: true if KVM can enable el2(nested virtualization)
+ * and false otherwise.
+ */
+bool kvm_arm_el2_supported(void);
+
 /**
  * kvm_arm_aarch32_supported:
  *
@@ -398,6 +406,11 @@ static inline bool kvm_arm_steal_time_supported(void)
     return false;
 }
 
+static inline bool kvm_arm_el2_supported(void)
+{
+    return false;
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
-- 
2.17.1

