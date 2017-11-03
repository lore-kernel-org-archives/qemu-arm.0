Received: by 10.223.150.237 with SMTP id u100csp243818wrb;
        Fri, 3 Nov 2017 13:26:57 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TzgkEaegeqaJcaJuJeDmqkqxDWGRhrkyrlK1EKMcYOVQ5mVGYdmru+lAXZud9jfQQaubGB
X-Received: by 10.37.165.5 with SMTP id h5mr5394445ybi.142.1509740817369;
        Fri, 03 Nov 2017 13:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509740817; cv=none;
        d=google.com; s=arc-20160816;
        b=XxHIbALSm7Bzgv9dzd5KyoMtGXJZlZzJ9AeKCftdViy8zCbUKZoHmNSm/tgXb/gMpZ
         SKY3hs9CFmmAmKemvoVoQ5vCCJq7SfaDEEQGKQwZ1vVkN8HDr2n3xMgYSVPxagXEPZ6W
         tQRXo67brGLkq0NDtMNRUGIBQ/v16GPBRyJmIKH1AGAjsemSwLyKfK4PPh/2o9nKbr2A
         sPUQqjzZqhMA/SxYRNy5z675r0QF0NySLsN9yGLp1z2kxXOstKeTP5crsNO3Q203F0JK
         hkedPALWqQ4sFeSD6OiJ5/xx+kKzz8+0oFz1pwN2jRhwwNvw9RVZUazEQpPOxl09UCA/
         trtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=UTq3NH2+J47EBcm4ilBwfwiKjZQoX7oL9BZi5s78xu0=;
        b=zMxneqnVH3jEuIuyVFV8oRjde4MnsiBVArHALnWlT4i0BtiWrcnJHB09QH0xX5iT2n
         g81FE2CSpD1JAPEcjDdLtu8BmAn5lV8idoeZ1vNxh/J1Ud+6ExPZQwtyiooBds3NBy+X
         kxh02xRl35Fu9Y/ISNUaAsreu0Ot32o/JQnG/qid8M3sQiEZcTpoZapDH74JqHViy5dD
         HW+Rc36prYDifJie5XXSLs7wigntrLn9wOGef7tOxtVTgJEcFnWnzDlu6XrHmftByrwr
         BFk2+SEm+i5aNNA2Xpr/IRa6GASfh35d7CGe6dTZSZRISbpoyHqx2+uUKn6ywNQ00jpy
         Sk7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b196si679002yba.73.2017.11.03.13.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 13:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAiYK-0001WW-Mm
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 16:26:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eAiYA-0001WI-FQ
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 16:26:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eAiY7-0000W8-CR
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 16:26:46 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:64866)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eAiY7-0000VV-25; Fri, 03 Nov 2017 16:26:43 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 0M5L11-1dCq1l4BeZ-00zViU; Fri, 03 Nov 2017 21:26:27 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Fri,  3 Nov 2017 21:26:21 +0100
Message-Id: <20171103202624.5956-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171103202624.5956-1-laurent@vivier.eu>
References: <20171103202624.5956-1-laurent@vivier.eu>
X-Provags-ID: V03:K0:HI5tfJBDjPgpDao3BVB6lEjKyHGG6DwE2ZQje4C8RxeevFY0rWh
	fjYCh7WHaxZB/uMhgvXx6X2XPeP37Fxukc+3KGa7bjjxE0PwTxwVQkFUgD5/UxEO6aU1HV0
	5rfNplt7ccZXYk3eDhXtORZ/wjKSVXbuDipINdJfO1NK3R+WdTsAJkbc84NopI6YPnZp7wR
	G1XWfAqXvFj9ojKt0Ia9w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:cTltJCExIq8=:tkfOkpRHBMbPYrp84JgZ91
	aT7aY8K0fLr/znUPUzGzBjZUtVRschlWBk6SikY3ya+H0Ugq5TgYpA5vXJRDgnnUg5H8dwduS
	PlGt+is0GLunBH1Ce5MZD/a2kNzgt+sM/R9VaiUANeNQ53sI98PlPxNI/1kw2slFEzuQHvjMQ
	KYMQCrDZwvi/pbc/sCGLV+4C0q6EImq9kVIVTs0V6e/ADp2QtoM+er7IkO6zqmx4tcRLTW9OX
	quQ9WTWBDdfJp42uMmhVxSYt4qtATGEHJPuS7IbLfsuMMplRG6ovB9EISWPJxQIj/Si5zZJKW
	iR1Bf/KgKucbQwgz0EI4ajDLPDM1VhM2aA9Zex1DopkH7xaTzenvnixgRz3GqEl6U1+txl3R3
	PhaBLSz1fN/F90GFE/L68GqyXZjS3lxUeYIi7BMcXjwnFrWhDiKoqfr2sqlCuLSsp0kCAPpjw
	odFtyB33ss+6pQgrjFF+HkZHc7OZdJVdTIHXEmLG1zz9itLB5wDVVjqVXWGcu85UYaiyTV1uG
	R5RzgfHaD2VzOQ4EehZGVq2FZkKCVXmDlfET17ZP1gG4w57Y24hFtCX7HLA7Neu6quDbZS4NA
	PlvPKcMZ9Fg/KuAuY1nYXe9iDbe7eokFWjrgOEX/6WMtD+72VIDJFw8TIdfcT8GHd5Lynb4rt
	rdslRO8yFmBPI6djeCfa8uQkQpWZsUG3i18fyGHdmrDIIBShEbVRjI0wHZofmyBEoUaNLT/pC
	8AHXBcxwOX0mTOH4RlbgZAvxDCanjvIrnFDp3g==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.133
Subject: [Qemu-arm] [PATCH 1/4] arm: fix float64 helper definitions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Stafford Horne <shorne@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZWUq/GDXcVXG

neon_ceq_f64(), neon_cge_f64() and neon_cgt_f64()
take float64 as parameter, fix the definition in
helper-a64.h

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/arm/helper-a64.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 85d86741db..b5e9ba03c0 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -26,9 +26,9 @@ DEF_HELPER_3(vfp_cmped_a64, i64, f64, f64, ptr)
 DEF_HELPER_FLAGS_5(simd_tbl, TCG_CALL_NO_RWG_SE, i64, env, i64, i64, i32, i32)
 DEF_HELPER_FLAGS_3(vfp_mulxs, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
 DEF_HELPER_FLAGS_3(vfp_mulxd, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
-DEF_HELPER_FLAGS_3(neon_ceq_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
-DEF_HELPER_FLAGS_3(neon_cge_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
-DEF_HELPER_FLAGS_3(neon_cgt_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
+DEF_HELPER_FLAGS_3(neon_ceq_f64, TCG_CALL_NO_RWG, i64, f64, f64, ptr)
+DEF_HELPER_FLAGS_3(neon_cge_f64, TCG_CALL_NO_RWG, i64, f64, f64, ptr)
+DEF_HELPER_FLAGS_3(neon_cgt_f64, TCG_CALL_NO_RWG, i64, f64, f64, ptr)
 DEF_HELPER_FLAGS_3(recpsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
 DEF_HELPER_FLAGS_3(recpsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
 DEF_HELPER_FLAGS_3(rsqrtsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
-- 
2.13.6

