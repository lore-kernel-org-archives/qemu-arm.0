Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp268892wru;
        Fri, 3 Aug 2018 09:37:16 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpddgvXaBrP/64Npw+GFc6Zw5lQ7mH2/3sKuNxmCIXeK+eDStn3gbpHbRz1wj1zMpIRCanJz
X-Received: by 2002:a37:ae86:: with SMTP id x128-v6mr4243221qke.25.1533314236305;
        Fri, 03 Aug 2018 09:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533314236; cv=none;
        d=google.com; s=arc-20160816;
        b=q13s0S9JmGKncEurUlmhpvFj5vLCCtpJtgCdeXLexWrzN/LIgRh5GJWipnY74oqcmp
         mYqMXGja6ye7CPjwjl+O1hdAwEMeOP1G7pNNrmtZU0vsnj+ujofh/mZAo3hc6qSl4pMh
         mpmHKmdbE4E/c7wsm5uk7OQhUZKkbeLcmYg1LzuEdVB6SN/qVZwe4r280ZuErBB6pP5/
         NPiD7rIFAWHZ0GaQWvX4vQi5kTDrw85ll0jff9y9VD2vQdXF76rgTFVq392V3ADqJdWe
         j+gQBFw5GxrRr+8AC4qGKu17t5UgTyGjwWPa7z7ieMjM7CXfLxSI6ldIZL69Ok5p6Kcj
         GIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=QDqvJhT/BO4HrPhyv/cBNa3b48L/m9HyHHOuCi6Nhkw=;
        b=ktGI9bJN9XHutcsOPnKd+VAoZtBE1Hrl/2neK4RpamkRsI1wNxirqRE5bubE24wUeH
         XJBLIouqoHMaZd8I5ISIyos+HWfNpQsH088sF9DeuqFC1iS2NfXOEoHyGEx0PqQ3aP0B
         lQJnUchycCL/DuZwImGxePDJqgyK463X0hqOzA+mjmXmLRUad+eTBceQ5VhXXO+AcgXt
         mJ9Ae8MlnaMFm2XyV7h4Tk2h/+8kluVlJdmIU63ZnxyCdMRaDPbqXgDvt8kBQ3R+J5as
         34Yg6UxRHT/xdA2xEJmGqn5yCqdcx5jeozPu+5W33120udPtiFs2CqfbuHeBgyVazmyc
         sJTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o17-v6si148935qta.399.2018.08.03.09.37.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 09:37:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fld4l-0004Ok-Mb
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 12:37:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fld4W-0004OD-Ka
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 12:37:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fld4V-0006WT-Im
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 12:37:00 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fld4V-0006RQ-BX; Fri, 03 Aug 2018 12:36:59 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fld4O-00076T-GZ; Fri, 03 Aug 2018 17:36:52 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  3 Aug 2018 17:36:46 +0100
Message-Id: <20180803163646.31068-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180803163646.31068-1-peter.maydell@linaro.org>
References: <20180803163646.31068-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/3] target/arm: Add dummy needed functions to M
 profile vmstate subsections
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
X-TUID: kNVKVL5u/3KO

Currently the migration code incorrectly treats a subsection with
no .needed function pointer as if it was the subsection list
terminator -- it is ignored and so is everything after it.
Work around this by giving various M profile vmstate structs
a 'needed' function that always returns true.
We reuse m_needed() for this, since it's always true here.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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

