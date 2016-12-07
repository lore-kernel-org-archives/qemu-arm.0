Received: by 10.25.159.131 with SMTP id i125csp158267lfe;
        Tue, 6 Dec 2016 20:32:06 -0800 (PST)
X-Received: by 10.237.38.37 with SMTP id z34mr66200777qtc.73.1481085126579;
        Tue, 06 Dec 2016 20:32:06 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id v90si13494400qte.313.2016.12.06.20.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Dec 2016 20:32:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cETtl-0005Np-W2
	for alex.bennee@linaro.org; Tue, 06 Dec 2016 23:32:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cETtC-0005Lm-Eh
	for qemu-devel@nongnu.org; Tue, 06 Dec 2016 23:31:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cETt7-0006aY-Is
	for qemu-devel@nongnu.org; Tue, 06 Dec 2016 23:31:30 -0500
Received: from mail-qt0-f195.google.com ([209.85.216.195]:34157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1cETt7-0006aU-EO; Tue, 06 Dec 2016 23:31:25 -0500
Received: by mail-qt0-f195.google.com with SMTP id l20so43033707qta.1;
	Tue, 06 Dec 2016 20:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=uJveMl67LwyIqYQ24AFrfXdYfTDCNzilBkzOXPf3wYQ=;
	b=HVVoNYOTmO349a4x6pkHasAFiYe2paocbNFa2gBj6UlZmmbakKbp+TAgBtw4WAHO7d
	i+cPRRUC+tjwAl99QT1pGpclAGgb2zb9peheonk4Q9/EzE3SUn+EbTKaNV9wMwODr0Kn
	+mSTDD1ckbQwkc0CwCrF1NMz3Jf7aBcx00L6w2PdTjm7rAEJhRvJhbynJZPq2rCqgy81
	XSYnFQIZYn/mV7hqUtFbhdyNxVmNwT3qmRhSMrpNXTgveCOBzz3Wo0hTQpY7gTzL/25L
	CN22o9Zk6Ntl2hxlKUXBJASdWlf4YcTJ0b6qrsxFXi2kwj8i1ImqKefvLrxB+29Vfbm8
	qoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=uJveMl67LwyIqYQ24AFrfXdYfTDCNzilBkzOXPf3wYQ=;
	b=FiqKAHNweXCDQiaIUhSqNWV2kRPw9ST7y64ibRvXO7LAIwpg+nG21O86Lb/spE6U33
	d4dSc3NFSqoWp5R9CarRvlRwCFiFBUS0Xpda1k7zpxipGMjapvK+fqn20YfnVaW/CUb7
	6W18VqAHtv0UR25ibA3U6ZeMaR7coOY5C+e5nlsP1Xd0w6+jpei1T7zdO2Jq4TqkbxrF
	PE4BbybwWDMn0Bmq20knD6sfr8cDmxSUNHRjpLtlfA8TVxtn/EcgdWp6pOuywudiWU39
	TvweGmNw5NxT6U8OBr+QzB+BEXfNFV0Xp+DNdNYaf9TF8OyfcwqKLaA9zeobK2BVvU0q
	paag==
X-Gm-Message-State: AKaTC01BvBGY9s9u8gecz6RxmIU06h4wYgSJGJy59hEHgOaa+eHrmhRSrXudz8bIEHPJQg==
X-Received: by 10.200.38.200 with SMTP id 8mr57005222qtp.81.1481085024534;
	Tue, 06 Dec 2016 20:30:24 -0800 (PST)
Received: from bigtime.twiddle.net.com
	([2602:47:d954:1500:5e51:4fff:fe40:9c64])
	by smtp.gmail.com with ESMTPSA id
	i41sm13911947qtc.18.2016.12.06.20.30.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 20:30:23 -0800 (PST)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Tue,  6 Dec 2016 20:30:18 -0800
Message-Id: <1481085020-2614-1-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.195
Subject: [Qemu-devel] [PATCH 0/2] target-arm aarch64 big-endian fixes
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f8AyOkBvYVc+

I ran Alex's risu tests on an s390x host, and ran into two
problems not related to the s390 backend.


r~


Richard Henderson (2):
  target-arm: Fix aarch64 disas_ldst_single_struct
  target-arm: Fix aarch64 vec_reg_offset

 target-arm/translate-a64.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.7.4

