Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp597540wru;
        Fri, 27 Jul 2018 04:39:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfEOrRJOI2gUdjlulGJvdqEw56txmnzPFz+VLictpayHVxpeXLTTpF5M4R20tv3TG1kOrXt
X-Received: by 2002:ac8:1bb8:: with SMTP id z53-v6mr5903498qtj.278.1532691563590;
        Fri, 27 Jul 2018 04:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532691563; cv=none;
        d=google.com; s=arc-20160816;
        b=qSjTz10HkXS0Rm2aIncJGnIy1PyADkDRYr9kiiWCGTZDLux1ViA7/7buF0ZAJEgRbh
         608X17Gkr8p2CzlqgCIpev4hhExvLIk+Ulux4yfN1dm8qCcCEai6uUmBAb0nQ/U3Qoja
         QPnp6za+ZVHJ4PmKGXAIvLsbDalY7m+jgqq3blpOzcKrSB5DkO9TzXXFe2VEKhkh+f/L
         VXnSAT1nsq1FBlIewbmbo39WcyI2Xrps5vdraJ4I9vWBTFl4Z71bMfbkQENWtH/2mRAh
         0g/9jijTKjz4tPjlf4KtzaavVSBgpi0LbFbvOzrFcw5JuWgFjt3Glj+2faV7J1/AOvKs
         M5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=b7EupgJQSDpTC3cTQWMqyvKhokdU3QlmqNB/vFhx7VE=;
        b=xxUoPftLxpqImUcPvImMlkFzxSbz4BfZ/QS345a8tAAQVUOmrEiTMS978VhX2W77HX
         IxHFntQM9q4+WkDqTxjsOJVz8ODYhcqjK8yp3cVuDI7SLzKbxZk6h8/vw7baH4huVifd
         RRTVUwwnx3sIdE/WzvMI9tKxL/6TUJih2GSnjAzKx82rOW1oWogX9M9w4mnBpgojizYf
         l0kOh/XqlTIBC0E4pHo5ZmhFmEwPJwObHJfdNgOWG2I1QbXYjUW4aSV1tWqRIzyJVQoe
         57CXji27z6pi7ELPL8fkhTRxA105ZTAHIChF/mcW/jRVtowFgeqgjqDTEPbDsHdsIbq3
         /NhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r26-v6si3186648qva.80.2018.07.27.04.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 04:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj15f-0006JK-2i
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 07:39:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fj15O-0006HG-5x
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 07:39:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fj15N-0004yo-B3
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 07:39:06 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43772)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fj15N-0004rg-4f; Fri, 27 Jul 2018 07:39:05 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fj15E-0002GA-74; Fri, 27 Jul 2018 12:38:56 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 12:38:53 +0100
Message-Id: <20180727113854.20283-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180727113854.20283-1-peter.maydell@linaro.org>
References: <20180727113854.20283-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 1/2] armv7m_nvic: Fix m-security
 subsection name
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jsqwy5D1gaTB

The vmstate save/load code insists that subsections of a VMState must
have names which include their parent VMState's name as a leading
substring.  Unfortunately it neither documents this nor checks it on
device init or state save, but instead fails state load with a
confusing error message ("Missing section footer for armv7m_nvic").

Fix the name of the m-security subsection of the NVIC, so that
state save/load works correctly for the security-enabled NVIC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 6be7fc5266d..cd1e7f17299 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2064,7 +2064,7 @@ static int nvic_security_post_load(void *opaque, int version_id)
 }
 
 static const VMStateDescription vmstate_nvic_security = {
-    .name = "nvic/m-security",
+    .name = "armv7m_nvic/m-security",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = nvic_security_needed,
-- 
2.17.1

