Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp269189wru;
        Fri, 3 Aug 2018 09:37:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpftQtSbv0UwgtDW32gXJUFXIZhBHabH/J1qU6mcAobmhmT3JROrI3ZIsFf2fi/whMLIGTOx
X-Received: by 2002:a0c:891a:: with SMTP id 26-v6mr4209968qvp.195.1533314253954;
        Fri, 03 Aug 2018 09:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533314253; cv=none;
        d=google.com; s=arc-20160816;
        b=LgAUjkgX94fJwUOrTqIJNUYRo3RahGFn+fQrY0Nx5RnIw9LjNqrWDv2HE+/TGzq69w
         Eqah4P5vJqTSqnbpOMNGAmVVOufVqOxUcFdsAVrXB2RlfDumlC1rr3bzf0rT1F0do35z
         oaN9gDFp6o0PC7T58xMbY5pG1VjFaCKpdkfK4tOonutnqthLOc7s9/XR8L2SuAGQBYYz
         36+zKK0B04UhbCWXa4UyJO+qF8oU+u7fpdNZToL1nV4nmuFbsH+dUmgroxwoqh9AdwQu
         eeztUQgfF4BTuSbpLDJYJFF3nYx0u4Lm+yVZZr1YKMlGYxubXrNBuWV8cABY+l4mF5Nh
         ZZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=iY0v9pTL6lBK1FjCmjFHbuRVUHtSt05VkKYg7v/+3go=;
        b=B8DoeASr+6exLXyfJBjTTibrh2Gj5BujK48IEeRADDmLE/9iVYaOyeRJJ2WG2mGVvn
         OV0o0w69xBRbOuXikoOoqmQYdp2lZhORrXADVvDXMio/8y96xn2srchTTe2Axu6VuPC5
         /S1TwvnXYJK0H2qNNXdXZ7/MDovkohKxKBY7v9CqOD8jIrIQBHAQR/5f6D4JoMOns8wL
         uugVfPByVD2OFCltgLSiiB4d2967GDK/oPd2kDxCnTMUsO8hoVz9XuLgT2d42BQS1kiE
         vcaxAYhZ4nPNiSxACGYDfnTVJblsuTcrIduxFWQ61ggi0uagc0TeH8k7uKuMJA+dUq5m
         bJ4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d1-v6si4468678qth.268.2018.08.03.09.37.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 09:37:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fld53-0004Zo-Eb
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 12:37:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fld4X-0004OL-Mb
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 12:37:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fld4W-0006XU-I3
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 12:37:01 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fld4W-0006RQ-9t; Fri, 03 Aug 2018 12:37:00 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fld4N-00076C-JV; Fri, 03 Aug 2018 17:36:51 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  3 Aug 2018 17:36:45 +0100
Message-Id: <20180803163646.31068-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180803163646.31068-1-peter.maydell@linaro.org>
References: <20180803163646.31068-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/3] hw/intc/arm_gicv3_common: Combine duplicate
 .subsections in vmstate_gicv3_cpu
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
Cc: Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h+7wZ/A5zrhx

Commit 6692aac411199064 accidentally introduced a second initialization
of the .subsections field of vmstate_gicv3_cpu, instead of adding
the new subsection to the existing list. The effect of this was
probably that migration of GICv3 with virtualization enabled was
broken (or alternatively that migration of ICC_SRE_EL1 was broken,
depending on which of the two initializers the compiler used).
Combine the two into a single list.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not strictly a 2.12 regression.
---
 hw/intc/arm_gicv3_common.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index e58bc8b8105..e1a8999cf5b 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -134,9 +134,6 @@ static const VMStateDescription vmstate_gicv3_cpu = {
     },
     .subsections = (const VMStateDescription * []) {
         &vmstate_gicv3_cpu_virt,
-        NULL
-    },
-    .subsections = (const VMStateDescription * []) {
         &vmstate_gicv3_cpu_sre_el1,
         NULL
     }
-- 
2.17.1

