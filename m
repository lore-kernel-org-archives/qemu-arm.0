Received: by 10.223.188.70 with SMTP id a6csp6276610wrh;
        Tue, 29 Aug 2017 10:32:42 -0700 (PDT)
X-Received: by 10.55.101.23 with SMTP id z23mr6965409qkb.92.1504027962203;
        Tue, 29 Aug 2017 10:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504027962; cv=none;
        d=google.com; s=arc-20160816;
        b=0Z0AU17EkazyeYvtGla67WQOzSxlNc7a5+iRaMgY94bvQsffAXobJ06a/LaKTOA1+B
         UAg+uIOJmnidpABtE2vMpuhpePtNsCvT7R71GHWl3oBd5FU7Stjv3NvC+76HHPfhyXhQ
         lI5o3JNrjihz4bx4FcWxN7+HdTAIXgbSW8kg0SCe56ChXVOvGtV3TzhP0aWwMdQLPcnW
         Qso17iifkWoxIgo4IzeU0tT5b0sGGAHEqTlLTPqMVf1y9uTUtWqOaUlWwGAB8OVZ6Xb6
         w3i8tfLsVI4IVF19Fze4qQmLBx7x6EyHnYBK46q6m+GLUzhq6OcKMRwcgpDLiJ1mL4Ml
         LaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=QE8qVzZ6qug7v2sp4lilVZoojLLBjVQrsluNDtshDK8=;
        b=ndf05SOCq54wBw2XMa+MqH9sUGMOQHcfhC3LTP7J+27kTTTsJG4XJ2kImDb0hlVEEH
         1DbfExPuJxyON5pnkQgYJKHrNzTk9Odg2ytofux2grOW4O/ZOoxAtqW8ToTqWfO59I5r
         LA1DooeI9OKa853tTJgA3/zxlz02fadZRrUL+zXoznBHC2FE5OSdSm+wpcgnTyX48W1M
         9D3A4gd9kNMLmnYH78VsNVIKyZeqiRJICBByOYQlZlfSvksHvZDbHeyOQwNGoBFyhr5Y
         cBrRHH1s9pjMl2AzuOL9kdRTE+ITp5B8dBSSD+grRCbVt3dFPd5LZQLKI95MSdqDGGST
         hfkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l2Rqav9D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z128si3362593qkc.370.2017.08.29.10.32.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 10:32:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l2Rqav9D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmkNT-00025p-Rs
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 13:32:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bobby.prani@gmail.com>) id 1dmkNN-00025X-PH
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 13:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bobby.prani@gmail.com>) id 1dmkNI-0005Ze-Sk
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 13:32:33 -0400
Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241]:34149)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bobby.prani@gmail.com>)
	id 1dmkNI-0005ZY-Nt; Tue, 29 Aug 2017 13:32:28 -0400
Received: by mail-yw0-x241.google.com with SMTP id h127so2497739ywf.1;
	Tue, 29 Aug 2017 10:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=QE8qVzZ6qug7v2sp4lilVZoojLLBjVQrsluNDtshDK8=;
	b=l2Rqav9DGTDRgmG0uVeWKow3p93Ps4E2Wop54gudweIzYfOhRyZCgOYlTNCiAC07G+
	Yjy3m1kT8b8bNYmE5/FXThrfcS9SNMIBGmWWDoahx5S12BDi0rS09vFrdVMYffGOE4Y6
	Ig0D6iq2kV8gxlvgORDX5VrxGh6NrGpdR71CzSRrlhaTtAC2dS83wZ5KGYJYsR0hlISn
	9Dd9mBrVsyQsDfTRfXfW09J24WfmZ8u/5vFspLsICv4U5qpJ83AqoOV7P4jbR2cpQjAS
	lGhFwXrTnIQPYa9W6+o0xE4+rIOCaSI5noGtb/rRIzh5hiK2Lqa+gBObMH2meDrY0Gwv
	vAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QE8qVzZ6qug7v2sp4lilVZoojLLBjVQrsluNDtshDK8=;
	b=oD8FNLxLKMEJHBUgJHJrYOSW1/pZX5HFIqpJ7cPJjKW31Jh6cbrx2z2FNLhaPmxNqN
	9YjFg2eiJMH5T44BsMypTGznrXUpetPpXlJshl0+/dIO51E3KGlRP5Y0DOLBgWRRPs4z
	Wy4mv2R9eBnuUPIyKc3FtfKjeI/ZCA6regsHlg0alIDgioqB6ZiyISICcK7L1Z5Y44IC
	rGDwqiWn8kveiH7e3pz6TqibqLrPzgibl4utlUQ2dmm4LnC6hxKcTvIW550D1XLLC7lE
	fITZcrUdfeAJ9YVyDd7uFkng0HjMmHwUzQVZewLOKF7a2Dvw2gGwyzE0RsR6lPE0ftYM
	QHNg==
X-Gm-Message-State: AHYfb5gZKX45tIbRxCBuURWJk2MSAz894H0va4ElB6WICZghJZ9r6usW
	YdPJXRzM6Cq1GZe6pew=
X-Received: by 10.129.166.196 with SMTP id d187mr1088557ywh.353.1504027947905; 
	Tue, 29 Aug 2017 10:32:27 -0700 (PDT)
Received: from localhost.localdomain ([98.192.46.210])
	by smtp.gmail.com with ESMTPSA id
	n77sm1259513ywd.42.2017.08.29.10.32.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 10:32:27 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM cores),
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Tue, 29 Aug 2017 13:32:26 -0400
Message-Id: <20170829173226.7625-1-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.13.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::241
Subject: [Qemu-arm] [PATCH] arm_gicv3_kvm: Fix compile warning
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lD0U+F4gsaRc

Fix the following warning:

/home/pranith/qemu/hw/intc/arm_gicv3_kvm.c:296:17: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
            if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
                ^             ~
/home/pranith/qemu/hw/intc/arm_gicv3_kvm.c:296:17: note: add parentheses after the '!' to evaluate the bitwise operator first
            if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
                ^
/home/pranith/qemu/hw/intc/arm_gicv3_kvm.c:296:17: note: add parentheses around left hand side expression to silence this warning
            if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
                ^

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 hw/intc/arm_gicv3_kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 6051c77705..481fe5405a 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -293,7 +293,7 @@ static void kvm_arm_gicv3_put(GICv3State *s)
             kvm_gicr_access(s, GICR_PROPBASER + 4, ncpu, &regh, true);
 
             reg64 = c->gicr_pendbaser;
-            if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
+            if (!(c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)) {
                 /* Setting PTZ is advised if LPIs are disabled, to reduce
                  * GIC initialization time.
                  */
-- 
2.11.0

