Received: by 10.28.4.212 with SMTP id 203csp1807907wme;
        Thu, 3 May 2018 04:56:56 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqo2VABLTIFd0ghItA8d5LW84bsZCwjpDSZoWQr/oCvM/NiQio6NIIw2yT6ApZUXs26zO7J
X-Received: by 10.55.9.142 with SMTP id 136mr17029133qkj.48.1525348616841;
        Thu, 03 May 2018 04:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525348616; cv=none;
        d=google.com; s=arc-20160816;
        b=RebAlPCFE/TdaPvELfGGM7X8aSOZld+PsXFWcGIQN76OSTfLQ+ambaHsiq5sA/sDMs
         WoMtZlNyr3zCjzgM3nUxbA6KX9ScGxHU/6wOT0EYhWKydNELXt4ptJzAiyAV0dTxT/mf
         kFINL/EqsGQJ4QZ5S3j2NCWs39ReD+fPU7lFYZb4okEC3WJcUeJC+2ab5GxK0elV59zn
         JSV8IjJE8F570V45PDqnUuXeIfbtWtzpurgE4otsSJS+LWz/3gyw1eFqmY/h9VcSZSlq
         EWhh+0n2wHt/F6Q6VG4VQU8IWqv9INcVna9Su6IjI/EtDgoKkfLfNfR8csgiYy3K26XH
         P4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=dUSDAqxT0z7rT99CgZLYtiISiBiMyvylvTdNuLJUZY0=;
        b=aB9J+J/lTG5Hl9oh+u1H6WWHJWd8rKQKPOBSBzpnPXUxlen7I65TgIFqEexSt0m+JT
         L/TyUOXwL2pvmtqIskxKZk1R8qpdKPd2qp8DE5NC71BD+U9uiIhm2qoEQCs56RVQEbNo
         Tn1clchz4FMmpyYykQa/R7C6EHnPZfGNzgZq4sDwE4np82l8CLBIYxH5mibU4HJGffNd
         dxwkLOWP9TVW3y8k6tZLv1TfyiGUzK2GwzEWhvczDskAN6BWXukx/DmYg77aQljEEf/h
         6yUUeqboAMlYzVY8QjbUy07rrUOZE+XD200za+hsTsT376jzjXaSKBwDxvGtKjgzgn5Z
         XPxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IPVEgm/V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l45-v6si2638632qtb.322.2018.05.03.04.56.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 04:56:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IPVEgm/V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55521 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fECr2-0005Cw-Bq
	for alex.bennee@linaro.org; Thu, 03 May 2018 07:56:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1fECqa-0005BV-Hd
	for qemu-devel@nongnu.org; Thu, 03 May 2018 07:56:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1fECqV-0006yH-Vh
	for qemu-devel@nongnu.org; Thu, 03 May 2018 07:56:28 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:40381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1fECqV-0006xW-OD; Thu, 03 May 2018 07:56:23 -0400
Received: by mail-lf0-x243.google.com with SMTP id j16-v6so25542382lfb.7;
	Thu, 03 May 2018 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dUSDAqxT0z7rT99CgZLYtiISiBiMyvylvTdNuLJUZY0=;
	b=IPVEgm/V7HxCqixB8diemZ8XUxkBzG87SXX8SH9cRL6DA0R1nT2AMXOjJ0nKAfof7N
	4TN3ehdteJXebEaoS+Y1CXT7IbZPz1YJtkDijhWsgfoGFePrsxrNeqCcrkMzID1EYEN7
	o3CdI88gJnKBo8pFTCraTXB61czSqH7rhQCKpYFwFRfKtinrvbgZERlpKe7uMBckJTjb
	EzoVERUcc3gpAiKo3mz/t8e4WuYsGVF4p0Gum1Tn8i6ltbWLkAtqTJ6V9VGJVZdpwKUW
	wywerF/euinD/lm/1fao+kTR/XJAUR6dIfVb7Bz+7lI9gqxlA3b+4tHI2o4qBekuotad
	y4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dUSDAqxT0z7rT99CgZLYtiISiBiMyvylvTdNuLJUZY0=;
	b=q1Nrozhnhi78xeem5PwzBkx8Mahm7TLlFE8MdeCVVQWPv2Wrg5jjTnxzmlhSusou83
	cU7QALMKfIpI4oBpQ0/p6pHv0swVwsrrOI4t2oa+GPCVgL86RmkLVCDVk7Rvdq7qRLfA
	BLuIAeqz9cDoci8lkCXXHoWXfrKwrx/SA1YW7dIb9b0ZVPoBx3WCD0+guZxINzUGuCw6
	F/SDapQZ3telhy7Va76Wm6t/qmL2JXhMn3dTTLPHTPpIEvsr/fakT2EjS51D+S64YVda
	+9BnENLrmuHoZgM9XcygGnfc02aZPpUPCORW7k4Iwm5BUBSwjsYnhLuivxOEHYUpfxgG
	1WZQ==
X-Gm-Message-State: ALQs6tAPCvVo3ENWLAOsPHYdWIlZ/HM5eqEfS2uU68rRzzj8RrfgOArT
	ICiWrViCzxBgiOb4QPXdWrlk6g==
X-Received: by 2002:a2e:9911:: with SMTP id
	v17-v6mr15591587lji.57.1525348581914; 
	Thu, 03 May 2018 04:56:21 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	h20-v6sm2779291ljj.85.2018.05.03.04.56.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 May 2018 04:56:20 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  3 May 2018 13:56:18 +0200
Message-Id: <20180503115620.10596-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.14.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH v1 0/2] xlnx-zynqmp: Change the Cortex-R5 for
 Cortex-R5F
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
	sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
	alistair@alistair23.me, frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w5ONr2WRQDyc

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The ZynqMP actually has Cortex-R5Fs with the optional FPU enabled.

Cheers,
Edgar


Edgar E. Iglesias (2):
  target-arm: Add the Cortex-R5F
  xlnx-zynqmp: Swap Cortex-R5 for Cortex-R5F

 hw/arm/xlnx-zynqmp.c | 2 +-
 target/arm/cpu.c     | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.14.1

