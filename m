Received: by 10.223.197.9 with SMTP id q9csp2472560wrf;
        Mon, 9 Oct 2017 06:51:44 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBGLukp98wmLb1Cp2FpxhILbJH2dqWgXZEHs3tN1QzZgXpi01qyOmMJJpF0DVMb/vjmwBbn
X-Received: by 10.200.14.14 with SMTP id a14mr13769076qti.196.1507557104608;
        Mon, 09 Oct 2017 06:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507557104; cv=none;
        d=google.com; s=arc-20160816;
        b=UYsbqVBpScAyUrA+kEh4zUhSIcppC/1y0LVXLuyAFv1frwCBtUOFmmVueYbjeJT/Gs
         ztrwYPreW7Y7p+/t8353gm2Tn9TqKgRf8vvSoRnGykJoJEAqyueZICdK+9fXjvatBr5a
         2FHZnEMF4zFxTvrA9CU3ZdABtdl7J87J4YVLMCcw1J44IdvxDF6+xi9v4fTHYAIXkFEq
         pTiO9wR3rv2SGf4kOJcOHwVfIrRwByUuUrSPy6IclVLsyh71wvPBkrfMpeUTfdRWgaq1
         YHixdGKPIeLxpm1L/ziRFqUX+InURDVmdjUSFBa71KtduouzvZeLzMXNh3gKNkkpzRXM
         Y9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Qs9Mwb9RgNKEmO5MBIOJUrybtGWUJwYhs35qW+fajDk=;
        b=oyhtTC4HS41RWpv3YlSnrjpub+4iV3THGJ2ZhjNYWmlR7nXRZo2zn1CJ+dj4yY8jK7
         nSOFT1xWFlxV9zaIlGF3XYDFpC/WIIJTXhDiA24wTo9hpaJZDeTs4IzK78YX8K/5ng46
         yX3TFfTIt9wxcg0uBE2/K4jGtvmKoipuLrejkHjG6oYFzTbLt9CSoK5d1vQwHmGNf8ni
         TM455BkchsoBDHu0WBgcZHt4zNb2wtFdSUg4ya5ZcbQY/XNONlh6HpUpmqHCvjwFQpdl
         SEUPUgK6SkV0Xzwbq5Jz4WJ+GnLaizVGI3lOToHp9cD0tPBIX7kimN6P4I8csIbMjWfC
         OP1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z57si5749572qta.43.2017.10.09.06.51.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 06:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1YTA-0003M7-3W
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 09:51:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQW-0001QP-I3
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:49:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQR-00049N-3N
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:49:00 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1e1YQQ-0003zX-T1; Mon, 09 Oct 2017 09:48:55 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1e1YQA-0004WU-Rs; Mon, 09 Oct 2017 14:48:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Oct 2017 14:48:31 +0100
Message-Id: <1507556919-24992-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/9] target/arm: Add M profile secure MMU index
 values to get_a32_user_mem_index()
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
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 12eFIZuXT7b4

Add the M profile secure MMU index values to the switch in
get_a32_user_mem_index() so that LDRT/STRT work correctly
rather than asserting at translate time.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ab1a12a..e1b83b7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -165,6 +165,10 @@ static inline int get_a32_user_mem_index(DisasContext *s)
     case ARMMMUIdx_MPriv:
     case ARMMMUIdx_MNegPri:
         return arm_to_core_mmu_idx(ARMMMUIdx_MUser);
+    case ARMMMUIdx_MSUser:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSNegPri:
+        return arm_to_core_mmu_idx(ARMMMUIdx_MSUser);
     case ARMMMUIdx_S2NS:
     default:
         g_assert_not_reached();
-- 
2.7.4

