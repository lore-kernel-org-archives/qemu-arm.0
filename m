Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp681418wrg;
        Mon, 20 May 2019 15:07:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4uxa49vafnUaI4aJmGl03AaSOY8tnQ3RXlqscGfvovVBO8ezs8nwRThN7vFnZkxCzTMLW
X-Received: by 2002:a17:906:1fc4:: with SMTP id e4mr41835990ejt.81.1558390020339;
        Mon, 20 May 2019 15:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558390020; cv=none;
        d=google.com; s=arc-20160816;
        b=VtTgh+JbrL2mNFrViZIMj2K3+qQ+znr80W3b46P6dWmf9dUGPUXzZK7x9NSxnmMsxc
         CxQtQm+14UTbLdQj0Q4cDDAomq0DGXr1WRR2i0UcQqBJ0ky3k8G3wI/dzntqf7GRGb8R
         lXNejAhOQGBMlPq0JyrSY3KfIn7KeKeEonLdZMigmmtJDIj3MCJBaS/G3gsu+cR+zME4
         oc44Pqr5MUAL5tExyCkczTvdzKTzPNckIh6r88PXahd2zwfrQXjVCRnVLRFnTU4f9PC9
         iAcOsiOvDX+BaTOQHbEyeBpi9x+vRNuCBI8rhaxvP7v5HO/8/SjKHx4iSaONdvlTwpCQ
         1fTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=KlpNHL/v/anaIc9onQH5hEjQJXL2cVxWwbCFEtiFDL4=;
        b=gvRo6AsdInkNsfcrzhgNQfeVTBu5hVf35uYhDME4Hk745TD5j5lmSGznfKFstkdDjU
         9gkrJvBOev/46yNsEHEJukTmbdVUU0Ib3ld+32TLA51Ace9uBTwFBXIPo1905VbL3bPe
         qdTy9CZAOV2Ol33KtTHgd7lMbOrzvwVOVwRxH6Th+bO6tcOAIda7ffYgw2gS4DX2dtZC
         zUmesMWxE7BvbTMEEN1uw0Y2r2Hrji/8LbTj6UUwQ+1oBINx9sSUjvAkC0Sgj7botTOQ
         hFA9UcJw9U07vXEnKSASuQVQtyS1pKvm4s6xeqEWq6ImcrwroFkvrkuNrSC9bq4Btok7
         hQOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EvL+4maH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y53si1560179edd.360.2019.05.20.15.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 15:07:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EvL+4maH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:42681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSqQt-00026N-7S
	for alex.bennee@linaro.org; Mon, 20 May 2019 18:06:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hSqQc-00024z-5q
	for qemu-arm@nongnu.org; Mon, 20 May 2019 18:06:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hSqQb-0007xi-7o
	for qemu-arm@nongnu.org; Mon, 20 May 2019 18:06:42 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53754)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hSqQY-0007vA-Uv; Mon, 20 May 2019 18:06:39 -0400
Received: by mail-wm1-x344.google.com with SMTP id 198so850380wme.3;
	Mon, 20 May 2019 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KlpNHL/v/anaIc9onQH5hEjQJXL2cVxWwbCFEtiFDL4=;
	b=EvL+4maH6NdCRhulb/0UYtPdOYZZDaZfxAX2LslCQXT+V4ofkomGfZLd5AEEQnjpYD
	DEqp9hjJDSIFRtxGQbatIHi2BNpy86Fm/8W0FXxG/+gfMsTVPufWiu57w+mqJxZldSI+
	fbcEu+Ika0w8wDEmLey4bGh1C7vCMtP16Dy5hgviqJ/Y6P1iFf5MvyQGIgYPczwi3AYC
	wFHemrv4g9VZCrlYZU2BWwfvVnL6WwYDZNnzMzM+TBmB6pc3Qpee/5QAhFN7obXpCYFi
	T50kdg/lPFvxO/Piw6cUSj5LLwPrpQxutTo/aJZ+5jLS408ueJjrjLxvlr5g6ux5ZqPw
	YVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=KlpNHL/v/anaIc9onQH5hEjQJXL2cVxWwbCFEtiFDL4=;
	b=oev1PHXhnhjqRDSLOrh+pYIeeEcL6ASrRfeZTBtzwnCnTTqWgz/JD0bjlCPR2MyvjZ
	mgDE2PGaGpSNZckR+EldIyr71Zq/fesCeSZ8gSGmpJXC1LeEgwplp/mh8LFNBKW0TJ8a
	5nyDRbenwSNoZDagxIjYmubOfDWRw9xz0/AY1N1esijmgn9Dx+iLrnqf2qlrysRQKRQ/
	olZZMaIzfNipd0QN5+Hc0OqXeDcaZ+qS5tzQy7cj6gS6RvQJjB9DUtLJx+HEHNXo+oKQ
	ifUSNjrOaY2MFZuu7vTwWTau7AGqTpyBVCCCl/3d8ZLenPK9mMVDMjpmdRMEB9xmEl2U
	VGWg==
X-Gm-Message-State: APjAAAXB+S/9W0Z3Ru+ahxLRwcCirYbgUqpcMNConZdFChDvkROsZzu5
	3vETU/i3d8QGjGadT780xohmz0nwRds=
X-Received: by 2002:a1c:9a83:: with SMTP id c125mr807121wme.39.1558389996959; 
	Mon, 20 May 2019 15:06:36 -0700 (PDT)
Received: from x1.local (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228]) by smtp.gmail.com with ESMTPSA id
	y40sm35462259wrd.96.2019.05.20.15.06.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 15:06:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Date: Tue, 21 May 2019 00:06:33 +0200
Message-Id: <20190520220635.10961-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH 0/2] tests: Avocado-test for the SmartFusion2
 board
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Caio Carrara <ccarrara@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NQl7eOlJsD9R

Hi,

I added test guide lines from Subbaraya Sundeep [*] to avoid this
board to bitrot.

Regards,

Phil.

[*] https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg03810.html

Philippe Mathieu-Daudé (2):
  BootLinuxConsoleTest: Do not log empty lines
  BootLinuxConsoleTest: Test the SmartFusion2 board

 tests/acceptance/boot_linux_console.py | 33 ++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

-- 
2.19.1

