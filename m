Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4694463lfg;
        Tue, 16 Mar 2021 08:52:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLHF2t8rkVQ/typO7jjzKjs52p4ducC9ZnoUONiifsM/HzB3vTsqOUY6NFHnStI4i+Z5EW
X-Received: by 2002:a37:8206:: with SMTP id e6mr222055qkd.169.1615909940908;
        Tue, 16 Mar 2021 08:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615909940; cv=none;
        d=google.com; s=arc-20160816;
        b=HeVwZBPghHRVqWf1tpZr1YfGGTKdszJAs1/+Cx9MdZpj92bHB4DkHSqwibuAuYEnJ5
         07eG+2OHTtQmBmQD5ogqX9m7gfXAcBIohH6ww+sFO0UaU2zuDmftG/cTyNHhRxx/e+GI
         l8K/nin8pNrcVk4pZK4BXBZXtlMZe8ArBon5ME34C0ELkUAqt6rxRp1o8w51nyB6QyYn
         ThQY6PYW9SeDC3rkJcNysv4GcTA4X32P4ChKWTBnIt5UUf+3VXv5zmyoZP1x7miPV+hM
         T4Y4c4hgb5dpi3TcDaDL8lrRs9MetVhGCt0Vk3a5DtQiXy+IkM+rBXlR0iedqGFkhgZe
         +I5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
        b=eCiLpvgPdCiC+ypz72DtQekoHy8pWk06lNqcEvT2zzlcO7EVGlWL2fL+3O+D1EIx/q
         c9HOZG29ZRYTjxjZoTeg36TtfGBMJKwJJXmpkCBgqzAw1cqA5QLUNY6ItDIhlfYDZAZi
         6I6QCgwIYAF5lsvo5hP6mDNOaC6BiTYbI822ds1Y7GkMfiiYGxY7MHW80yE/WLoUI4pn
         2ut9PJodcoTN4Rawu4uxBifgBeRwyJb4KnVTnaqXGrTcXPI2bd63TPoKnfyzTVWginhQ
         yOZCgH2BrTR3Dk7oP29+rdKVyMsqY+zK6nr+G8U/2bs+HnhGiezDtEOYYcNqSmn+4Q8D
         ADmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=VS8mzgVY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si9311588qta.69.2021.03.16.08.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 08:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=VS8mzgVY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMBzY-0001Xd-3p
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 11:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBwl-0007zk-Op
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:49:27 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:33807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBwj-0002Px-Pn
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:49:27 -0400
Received: by mail-qk1-x735.google.com with SMTP id t4so35714158qkp.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=VS8mzgVY32MG68ZlVn116fF8dj2TmmkgFUpbQStbKazVD1iikaWakiviSM3pYNKUL6
 Dc4pc+hTXPdOq438cBzaNUYXPpt0m9qGDAiqdhbbiVlFYncpkRgPq4J0OWhrZ18oVECQ
 nJGA/OxfJgq2g/h+mV3tMhI6lem76C3pG5xZHgy2iXJaY4ygKofS0HyP2d6vMiKxb7gs
 f//jKmVYNQ8Fzkp89seFkBiXMspbu8NCeycLu4OU8KBfhfT4GKSTI2Gevc051PompavD
 0EavpcT3MDHarfvpUkyDY5ARifVg4KtUl1V+QPWChWbzbdeemwpQ5F61J29n4yy7bnb1
 Z9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=XQJedZqc3gqiX697y9UDQRgBAYzABLm8DiUUCjQM50N/e80KCRCL5fz25I1Y5v0Jpy
 yXkyKFuCV84JRHKe/EyxiOId5PL8UQ/vZ+AsxiP/MzRzlsgkS3XYRvLp4AQzNpQhLZIo
 RQhkcSzgR9MKJVRveWOIO4mkyfp0yW1JErx8UmCP/cnSURDk0s7XRJ9fP10CdolfQVAA
 BTNnQ0uAja/QN5Dv60V46MxzYlfJcLMsuNZDF+lsHx7ODvHHxpxLrQ/YBRceT/uPEfFP
 OivZtdZUW/TC4njaF/u5P5e7PQlU1xssnK1tzVuk+NMMPn0XBj0qae2hlYDz7C52f20G
 P9Yw==
X-Gm-Message-State: AOAM530O6BfFdFf7TtaNtUtVyB9wmJS6woojajqFi0MgjCjay6CzCiz1
 r2vKuWrl5/6INfjfS+HXZJABrg==
X-Received: by 2002:a37:a38e:: with SMTP id m136mr254106qke.250.1615909764899; 
 Tue, 16 Mar 2021 08:49:24 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id n5sm14855623qkp.133.2021.03.16.08.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 08:49:24 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v4 3/3] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Tue, 16 Mar 2021 09:49:10 -0600
Message-Id: <20210316154910.25804-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316154910.25804-1-rebecca@nuviainc.com>
References: <20210316154910.25804-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G+0dMJ3L7NhK

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c1..f42803ecaf1d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2

