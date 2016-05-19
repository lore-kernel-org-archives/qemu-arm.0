Received: by 10.25.208.137 with SMTP id h131csp3299661lfg;
        Thu, 19 May 2016 15:57:51 -0700 (PDT)
X-Received: by 10.140.224.81 with SMTP id u78mr16475654qhb.70.1463698671650;
        Thu, 19 May 2016 15:57:51 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g98si4823281qge.3.2016.05.19.15.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 15:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52439 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3Wt5-0002Zh-3h
	for alex.bennee@linaro.org; Thu, 19 May 2016 18:57:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b3Wpm-0008Jc-JB
	for qemu-devel@nongnu.org; Thu, 19 May 2016 18:54:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b3Wpi-0007FM-DC
	for qemu-devel@nongnu.org; Thu, 19 May 2016 18:54:25 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b3Wpi-0007FI-6F; Thu, 19 May 2016 18:54:22 -0400
Received: by mail-wm0-x244.google.com with SMTP id w143so24717725wmw.3;
	Thu, 19 May 2016 15:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=F3nuB/ugse0+emScA1ZRwNN+hyQQLTUGHAVHRDNVmPo=;
	b=jM0phHELdzSBLTPl9kWadulHRjEck/pryjSsSU+O9oyFCymxpt1M0wAXggApkX7WjR
	/AzJK5ETBz2jxDsNcU0s7IeBZ4i/u3Z3BAd2hnGf0AUxTf68JfCB1UVkGNgZIM/0v+tB
	x5N+e4BGZDmlWMXtUGZt44vHnuo+dvgVDEj3qkK7E1qVoHYjnZ79XVkOpJexAsNMrRCb
	XErEjsJuRCov9HbJ40SxujeJGebcFKpJkR7HMdImvPkPulacep4OazIuRo4YLUK5hyH+
	140kbFVcNeJOFqrqr+UrkmblcrkKaq5B5omT8RL8HnnaJV1HOXzCrMyt2lUqSz41t0SV
	Y/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F3nuB/ugse0+emScA1ZRwNN+hyQQLTUGHAVHRDNVmPo=;
	b=TPUAgZtFYcWjEQoNH1i/FDTFCi61haytRFQE22mSZqgnovUxiXFQxq8NAwE0gOf9kj
	ng0wU1gMZREeJQfKp8xayTtR1DsSkRor9kdZ/2z693jBDeh4d6YSYrIpTmGiwcQGsAUg
	pwE6AXCR2Qekg/Cx7n8ZZhoDWioGzYuqoQylUHSj3CqgBcXUuVQ5LVjwkpvohPgJ1EU4
	BlZXd8GvEBDNJmtxTnYQ56Ncq5Yvv1YPBIm8rZakyhDuTZccHcAFwl42JQ3q63/xrhYu
	qyDlyzMG4eRexgrCiHcjO0Yn+msPrXVh25WMx2V/9N3KKe0rwzAHASv+H74cNmNGRASJ
	pVZA==
X-Gm-Message-State: AOPr4FX+aLe336FRpuUc7ZegzxfCOehoxiwuKsb0BiJaO54ZlIWknKntuqyknUg4Y7g9hw==
X-Received: by 10.194.112.233 with SMTP id it9mr17213338wjb.22.1463698461496; 
	Thu, 19 May 2016 15:54:21 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	131sm1515214wmu.17.2016.05.19.15.54.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 May 2016 15:54:20 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 May 2016 00:54:14 +0200
Message-Id: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-devel] [PATCH v1 0/5] xlnx-zynqmp: Fix various issues with
 KVM runs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	crosthwaite.peter@gmail.com, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YV6/BCpYEn7u

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

(This is a resend of the same v1, I managed to typo my own work email
address in CC in the first send-email :-))

This series fixes a bunch of issues with KVM runs using the ZynqMP
machine.

When using KVM, we don't have support for TrustZone, the RPU subsystem
with Cortex R5s and we also need to use the in-kernel GIC model.

This adds a set of properties to the ZynqMP allowing the creation
of the KVM friendly machine.

I've opted to default the ZynqMP to the KVM friendly machine for
consistensy between KVM and TCG and also because some of the options
are currently of limited use (i.e the RPU) or were actually disabled to
start with (e.g TrustZone sneaked in as we enabled EL3 on the A53s).
I'm OK either way though, so if people think differently we can change
the defaults.

Comments welcome!

Cheers,
Edgar

Edgar E. Iglesias (5):
  xlnx-zynqmp: Add a secure prop to en/disable ARM Security Extensions
  xlnx-zynqmp: Break out RPU setup into a separate function
  xlnx-zynqmp: Make the RPU subsystem optional
  xlnx-zynqmp: Delay realization of GIC until post CPU realization
  xlnx-zynqmp: Use the in kernel GIC model for KVM runs

 hw/arm/xlnx-zynqmp.c         | 156 +++++++++++++++++++++++++++++--------------
 include/hw/arm/xlnx-zynqmp.h |   5 ++
 2 files changed, 110 insertions(+), 51 deletions(-)

-- 
2.5.0

