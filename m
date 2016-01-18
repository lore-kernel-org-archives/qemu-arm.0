Received: by 10.25.159.19 with SMTP id i19csp1757087lfe;
        Sun, 17 Jan 2016 23:22:37 -0800 (PST)
X-Received: by 10.140.101.130 with SMTP id u2mr30444399qge.71.1453101757120;
        Sun, 17 Jan 2016 23:22:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e132si29568401qhc.70.2016.01.17.23.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:22:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL496-0002R3-KG
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:22:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL493-0002Mz-CU
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:22:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL492-0000sZ-HW
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:22:33 -0500
Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a]:35754)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL48w-0000rF-NU; Mon, 18 Jan 2016 02:22:26 -0500
Received: by mail-pf0-x22a.google.com with SMTP id 65so153252338pff.2;
	Sun, 17 Jan 2016 23:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WBpULlgcadtxkM2lRaKJw2wkeNDTPOCpa5E+LR5duWI=;
	b=lrkdfJ5NBWdUpW2C3qAsZolXZ5fH6E+G47xEq9w1O4+PBu9xOOhnpyIMjhnW41kr/Z
	MPqzvkoH9hDEugj+w3rFkr58AZG6R97KMb7ezgvdk6mislnPHQYL34KgpqnaiaOch+me
	j1jVrlNx8oienZdAWloYHCEWbmjIz2yNDf/eRfrMfhkFJPhQ4BfIDMBV7JkaBzvouiro
	DODB3dpC6YY2kqPtp5eJ/lS4spex5U30tngvvZ91G7R1pRLBwIESZkRRBkkp6JSvsjOf
	Xva8QGykvz/SG8nV4tkQf0y6Xr1dMBt0FOo+ZRuWkcV04IaMspNF07bPvcth46TBPxas
	7yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WBpULlgcadtxkM2lRaKJw2wkeNDTPOCpa5E+LR5duWI=;
	b=k0t1Dj9NSjwZZeHE+jh5ARrPuM7kexIUX3zkuzSMfH8kQdcs6j/bwa7wPHsnYGnzRb
	96UKcTq8AZzwJdDujbGTJMSDJN/jwfUxykgaCOL/6hepazNyaLHkusYanFYSsQLoVcXR
	UhWkWM6nzAcxyLEBhPLTYi1h0wRGld00V7wHSMjsUZsSgdVbkZsnZ9sTyXUCGs3K7vMX
	qqorBgEV2ei0yO5LTIOskIe0wqzYa4ePS7SrWtOPhqeR5Z5cCzg7T+zpr8XV9oovVj4u
	iIyH2PIYvmxH+dtNm22rx+g1pzuOQ1FRVTHISxNL/upj226mKHysslyOW/oK4uhhyrgQ
	dQmw==
X-Gm-Message-State: ALoCoQldOVY8pee8/6qrkHKEXfWLnZQhtpwIITp2sLMDFC2hZDaCa7x+Q4ye2S/ehunqwHta5e2+l/dGTgEHfJeSpk5DNzDfgg==
X-Received: by 10.98.87.20 with SMTP id l20mr34493815pfb.70.1453101746099;
	Sun, 17 Jan 2016 23:22:26 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	f27sm31464897pfj.0.2016.01.17.23.22.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:22:25 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:22:17 -0800
Message-Id: <1453101737-11255-1-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22a
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, linux@roeck-us.net,
	alistair.francis@xilinx.com
Subject: [Qemu-arm] [PATCH] misc: zynq-xadc: Fix off-by-one
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ttn1KzPzS+zH

This bounds check was off-by-one. Fix.

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/misc/zynq-xadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/zynq-xadc.c b/hw/misc/zynq-xadc.c
index 1a32595..d160ff2 100644
--- a/hw/misc/zynq-xadc.c
+++ b/hw/misc/zynq-xadc.c
@@ -220,7 +220,7 @@ static void zynq_xadc_write(void *opaque, hwaddr offset, uint64_t val,
             break;
         }
 
-        if (xadc_reg > ZYNQ_XADC_NUM_ADC_REGS && xadc_cmd != CMD_NOP) {
+        if (xadc_reg >= ZYNQ_XADC_NUM_ADC_REGS && xadc_cmd != CMD_NOP) {
             qemu_log_mask(LOG_GUEST_ERROR, "read/write op to invalid xadc "
                           "reg 0x%x\n", xadc_reg);
             break;
-- 
1.9.1

