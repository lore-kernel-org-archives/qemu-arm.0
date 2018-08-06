Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3009358wru;
        Mon, 6 Aug 2018 05:35:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfoYwDewMlW55ti8lg3cg2U4/oyi2WpioH48zw7wcT1Ys1YubSE4yWtme7XPlJf9xPXWlmQ
X-Received: by 2002:a37:2966:: with SMTP id p99-v6mr13093442qkh.390.1533558934111;
        Mon, 06 Aug 2018 05:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533558934; cv=none;
        d=google.com; s=arc-20160816;
        b=cShiUreLUSYlH48Ulm+brssV/yH4tAdOppkZIlJSpYBsrrv0P1pCkGmTMS6xtvimug
         RaIQVuqQ5lIHaH80X4HppfaW9BmarX8h+h/FQRvYnvevHDiQzxRM50rK5JU7WPHADnD2
         DGBAtQD97gCj/3LNsIm/SpPoRet1tFW3UYRCnXjSDxw/y5/HLHC8Oxk+5GOfYz1SL8Bj
         TKYxwz0/LsqVikmGYvz8SgaSfeansRHX0qIi+2lCVrnNlqENTW0bh1iLwATC7Sl4nmaK
         2Iq1xNlP7wzK/0IMWnRq6YjIbT+xzk22iZhY5EYklO9KajGhVneEtQqJRdZqe4nAh+O4
         ZcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=A9kKGbltkLTQ2D7q6RUGjYPUBSMEiavP2OLZz4kwLPc=;
        b=Z/8zmtdVqx9GXumDSDy++T76qFqgqkyEGlUFdmCjhM7fL/4N7C8lh02K+u7M2UDa+V
         PTDwnoe1AiL5RXhb7iHOEWyzCresaso6AIXI2OmiodQe7QC+ZwI1UFU2zmzyKbYDoQ6C
         GBK1YuClCOjsMSOoLPEWiHVSCj/+bma+W7wsTkNCciyaGfMdFz86dKRjdu7mVflTofl5
         xtm2/mxoSmoo+6LdF7hcLbJQhYmzb7Ry3hVV75LHk0laxffc6E/2VFVXB1LTMBTeBZme
         IXQdkhmY9rQ4bi9obrxfrC5noAk4ix1KFSuJLIFgzESGnIDq8kjpm6NYFdIqfsFO0v9S
         MTFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y56-v6si2960897qtk.390.2018.08.06.05.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 05:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmejV-0003Hn-JS
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 08:35:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fmej1-00032S-8Y
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 08:35:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fmej0-0006f0-CR
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 08:35:03 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fmej0-0006ZZ-5b; Mon, 06 Aug 2018 08:35:02 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fmeir-0000xP-C6; Mon, 06 Aug 2018 13:34:53 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  6 Aug 2018 13:34:43 +0100
Message-Id: <20180806123445.1459-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180806123445.1459-1-peter.maydell@linaro.org>
References: <20180806123445.1459-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 v2 3/5] target/arm: Add dummy needed
 functions to M profile vmstate subsections
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
X-TUID: 7tZzMtg8UyFr

Currently the migration code incorrectly treats a subsection with
no .needed function pointer as if it was the subsection list
terminator -- it is ignored and so is everything after it.
Work around this by giving various M profile vmstate structs
a 'needed' function that always returns true.
We reuse m_needed() for this, since it's always true here.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
Not strictly a regression as it only affects M profile CPUs
with the security extensions, and migration of those was
broken anyway in 2.12 due to a different bug.
---
 target/arm/machine.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 2e28d086bdf..ff4ec22bf75 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -184,6 +184,7 @@ static const VMStateDescription vmstate_m_faultmask_primask = {
     .name = "cpu/m/faultmask-primask",
     .version_id = 1,
     .minimum_version_id = 1,
+    .needed = m_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.faultmask[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.primask[M_REG_NS], ARMCPU),
@@ -230,6 +231,7 @@ static const VMStateDescription vmstate_m_scr = {
     .name = "cpu/m/scr",
     .version_id = 1,
     .minimum_version_id = 1,
+    .needed = m_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.scr[M_REG_NS], ARMCPU),
         VMSTATE_END_OF_LIST()
@@ -240,6 +242,7 @@ static const VMStateDescription vmstate_m_other_sp = {
     .name = "cpu/m/other-sp",
     .version_id = 1,
     .minimum_version_id = 1,
+    .needed = m_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.other_sp, ARMCPU),
         VMSTATE_END_OF_LIST()
-- 
2.17.1

