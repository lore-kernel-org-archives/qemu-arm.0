Received: by 10.25.208.137 with SMTP id h131csp1145126lfg;
        Mon, 16 May 2016 00:55:53 -0700 (PDT)
X-Received: by 10.129.92.193 with SMTP id q184mr7839219ywb.33.1463385352951;
        Mon, 16 May 2016 00:55:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k78si9469894ybf.119.2016.05.16.00.55.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 00:55:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2DNY-0003kW-Ix
	for alex.bennee@linaro.org; Mon, 16 May 2016 03:55:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <21521131@zju.edu.cn>) id 1b2CeO-00029P-Mx
	for qemu-arm@nongnu.org; Mon, 16 May 2016 03:09:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <21521131@zju.edu.cn>) id 1b2CeJ-0007JS-LN
	for qemu-arm@nongnu.org; Mon, 16 May 2016 03:09:12 -0400
Received: from [124.160.105.205] (port=21823 helo=zju.edu.cn)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <21521131@zju.edu.cn>) id 1b2CeI-0007IF-VK
	for qemu-arm@nongnu.org; Mon, 16 May 2016 03:09:07 -0400
Received: by ajax-webmail-mailapp1 (Coremail) ; Mon, 16 May 2016 14:35:39
	+0800 (GMT+08:00)
Date: Mon, 16 May 2016 14:35:39 +0800 (GMT+08:00)
From: 21521131@zju.edu.cn
To: qemu-arm <qemu-arm@nongnu.org>
Message-ID: <2b8f6d83.266f6.154b846f92c.Coremail.21521131@zju.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_556997_1772347480.1463380539691"
X-Originating-IP: [10.214.147.15]
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 4.0.8 dev build
	20150107(58648.7033.6860) Copyright (c) 2002-2016 www.mailtech.cn zju
X-SendMailWithSms: false
X-CM-TRANSID: HwbKCkDZCh87ajlXbZOQAA--.3168W
X-CM-SenderInfo: qsrvjiartrq6lmxovvfxof0/1tbiAg6Gf1Zdsxmz1QATsh
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUb90S07vEb7Iv0x
	C_Xr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
	bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
	CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
	z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wCS07vE84ACjcxK6I8E87Iv67AKxVW0oV
	Cq3wCS07vE84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DMIAIbVAS0I0E0xvYzxvE52x0
	82IY62kv0487MIAIbVAqx4xG64xvF2IEw4CE5I8CrVC2j2WlV2xY6cIj6xIIjxv20xvE14
	v26r1j6r18MIAIbVAv7VC2z280aVAFwI0_Jr0_Gr1lV2xY6cvjeVCFs4IE7xkEbVWUJVW8
	JwCS07vE7I0Y64k_MIAIbVCY0x0Ix7I2Y4AK64vIr41lV2xY6xCjnVCjjxCrMIAIbVCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwCS07vEx2IqxVAqx4xG67AKxVWUGVWUWwCS07vEx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlV2xY6I8E67AF67kF1VAFwI0_Jr0_JrylV2xY6IIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lV2xY6IIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCS07vEIxAI
	cVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lV2xY6IIF0xvEx4A2jsIE14v26r1j6r4UMIAIbV
	CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 124.160.105.205
X-Mailman-Approved-At: Mon, 16 May 2016 03:55:49 -0400
Subject: [Qemu-arm] help! I have downloaded "debian-8.4.0-armel-CD-1.iso"
 from "http://get.debian.org/cdimage/release/current/armel/iso-cd/"
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
X-TUID: 4aQ3TYFTkuiR

------=_Part_556997_1772347480.1463380539691
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit

Hello! I have downloaded an iso image file from website "http://get.debian.org/cdimage/release/current/armel/iso-cd/", I downloaded the "debian-8.4.0-armel-CD-1.iso", but i don't know how to use qemu-system-arm to run it. Is it supported?
How to boot the iso image using qemu-system-arm?


GaoJin
------=_Part_556997_1772347480.1463380539691
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: 7bit

<div>Hello! I have downloaded an iso image file from website&nbsp;"http://get.debian.org/cdimage/release/current/armel/iso-cd/", I downloaded the "<a href="http://get.debian.org/cdimage/release/current/armel/iso-cd/debian-8.4.0-armel-CD-1.iso" style="line-height: normal;" target="_blank">debian-8.4.0-armel-CD-1.iso</a>", but i don't know how to use qemu-system-arm to run it. Is it supported?</div>How to boot the iso image using qemu-system-arm?<div><br></div><div>GaoJin</div>
------=_Part_556997_1772347480.1463380539691--

