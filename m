Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3009509wru;
        Mon, 6 Aug 2018 05:35:44 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcjeaK0D1U19L2qFw4WAoD4DbP18hEtHNR4cpdxYIfaMQavi53HqitTuKQHzq8wPLB0yr2b
X-Received: by 2002:ae9:e817:: with SMTP id a23-v6mr13079632qkg.213.1533558944341;
        Mon, 06 Aug 2018 05:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533558944; cv=none;
        d=google.com; s=arc-20160816;
        b=F+QZqrHzXaaxq83np9cIrPXOv1sVLtY/haVXSFF4cbQr1nTA99irQ5uIm7O7noMx+Q
         y4CsO/RHpHa17hIQPUtsRJn00qnv3Yo7vBUDIt84jKktWFyIKVWot8U8rE+79NZo3NVW
         Op7NovfigDsK+bmQ7tYv7y0kXBtufhtEbV6o3FzDRL79pWFgw/wDZinT5fCF9Yuknn14
         4ehBXRYsEYj8D5umE2WGdHgecaMUWkqbpd9v4BopsJgS5EZlFkUFKOdkZTyk2dT53ELj
         d+8GVd2TtnUw1eaWv4uhEGu4DU120Kc5toqtp1vO39lKObNuyH+/unh912wouUjEOPYt
         GAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1TUeGhaXZ4Xx2mfKfbBO3ST86mCdnN3fUujZpxcLomU=;
        b=Y52scT7yYZQOQajguZtgDUSzYo/oUgbZ9BuLnqwojruNHpfd1U5IkqfNrj/WTdRMh5
         WBuxN/j8EIkcN7rszcooWMmR8h1+kJPWxfgZX1SHsstUUJGIWG4mNf/8J6bY7jflMHee
         0ym7p2AE9MvfkWvQL2Ch3FuY86nfhuZTjX1QkyzsH//osSkXxv39NzyVZw0ot94rFQgo
         WxRuUiB9/EDi9P0P+oIAI/3Ptv6xbqcxZfmE5r9HWoGQzoLbxJtpYq5G+8437wS2C9BR
         sBoZGa3RddANBdMYddMfEVn0Eba8Vf/jfHad/aKTod3wD4z4cZEg+4unyPzumjIXN65b
         eJ1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y32-v6si6487385qvy.98.2018.08.06.05.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 05:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmejf-0003VQ-RE
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 08:35:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fmej2-00033I-5P
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 08:35:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fmej1-0006fe-Ab
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 08:35:04 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fmej1-0006ZZ-2w; Mon, 06 Aug 2018 08:35:03 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fmeip-0000wy-N6; Mon, 06 Aug 2018 13:34:51 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  6 Aug 2018 13:34:42 +0100
Message-Id: <20180806123445.1459-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180806123445.1459-1-peter.maydell@linaro.org>
References: <20180806123445.1459-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 v2 2/5] hw/intc/arm_gicv3_common: Combine
 duplicate .subsections in vmstate_gicv3_cpu
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
Cc: Shannon Zhao <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UbU21oYMuJ2l

Commit 6692aac411199064 accidentally introduced a second initialization
of the .subsections field of vmstate_gicv3_cpu, instead of adding
the new subsection to the existing list. The effect of this was
probably that migration of GICv3 with virtualization enabled was
broken (or alternatively that migration of ICC_SRE_EL1 was broken,
depending on which of the two initializers the compiler used).
Combine the two into a single list.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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

