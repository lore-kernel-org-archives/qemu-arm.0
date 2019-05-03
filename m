Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp809756wrh;
        Fri, 3 May 2019 10:14:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGXXrdQsxkYNlDbqvflVDWJ7edclr8fektwsouqgDrfAiC9+aS7GFF/Sbekp2q1vFP2aTK
X-Received: by 2002:adf:f50e:: with SMTP id q14mr8088070wro.48.1556903682014;
        Fri, 03 May 2019 10:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556903682; cv=none;
        d=google.com; s=arc-20160816;
        b=sLX2dQ8BQKA6R7YusNJGeVvitUWURSYr7cUeWLhIMStGBQPqsQmVN4bsaw04Eu1pl0
         /WOHQtTKJipvIz+3yptkk+ORiYOpcMr43y03sfUUAwwyb7Zl0C6Gc9S3g855XmZsd4/Y
         F6jCHuNX5maOPYBBLQm6meomj7dkHeHz+E71fTUtrKjXOfpVHXm+UuKBvJX0XXoP3H5R
         hju3+dlqTOA+mHHqqwjYszD1jdrCyj+570xwPSePYgKIH0g1BsLiuHde+PdSD1s6LLrr
         yLGGacdiqYlXWB3lWpWXgwLxlzCJza5rnituf4iAH0R2wFKvMpenwgo4QOx7A9+z6LiP
         xbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=gxn73yHrkMnhu3Hh5HOdigs39onYkcXmr918feAXYD0=;
        b=Ko5UwYIBjVXCFSBjnJQ3BCaAJATrbb8fxH7T/sG3ALr5Y6lF04CiQEUDcW8iiSPIJv
         F3W/vmZz31toa7DjehXhKT/jAkNwkm0j6yo9brkmAUlRwRttqJpf/xZrz6Y/FsY6fbKG
         l9wpV1XZ1agr6J+eM2NdUnALxFp7DdQkMlBwZY569afb9MV0vJm6CnHQ9FPWuXpDAPzw
         /YKwhRnaxj+1kgEDA2R6zWsgK/SyeriGn2Hs+zCJ6lIwn0LR4hHDv161hinlL5Wp0bD1
         60vEPOgCYPzhPcs8VWl1xdn4gEE0iojBn2vKvKFprLMy4v5eTY5HFwNe73Dm3/phCF3y
         Iibw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QahufIIK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si1930833wrn.233.2019.05.03.10.14.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 10:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QahufIIK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMblh-0007Hw-1h
	for alex.bennee@linaro.org; Fri, 03 May 2019 13:14:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMbku-0006aL-MN
	for qemu-arm@nongnu.org; Fri, 03 May 2019 13:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMbkt-00012Y-Hd
	for qemu-arm@nongnu.org; Fri, 03 May 2019 13:13:52 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35528)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMbkt-00011F-96
	for qemu-arm@nongnu.org; Fri, 03 May 2019 13:13:51 -0400
Received: by mail-wr1-x443.google.com with SMTP id h15so3070833wrb.2
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 10:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gxn73yHrkMnhu3Hh5HOdigs39onYkcXmr918feAXYD0=;
	b=QahufIIKjmZm06ldWfS9a9TJaafGGew9iKqqUBgijAzO7WZTUvnIJJxmDct5205stW
	uKQ+4dwvgEz1dSWmI7nEabVqMpY5YiJOtw+WV8aQhmLWQDj2inGgLQEhPS58709MPlFm
	/9x9L4lk9PFArFdng/aH+q/NNvdj8c3J/ytGqaEib2Puu7IdLgzsZ8O0eBe7D/xoyIjE
	ELaMSFkIt7nEG+jkPSmHxpx7HN0CXI66Db0gtCPdD//MN5cvIIFWcmnrOPwesNAp5pKk
	QgThaS1tX0zWAMHcSFHPPzpdkF6HVYhSBvouVdF5lbAX6SD4EdnnOq/couwG3D9eaJM+
	8sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gxn73yHrkMnhu3Hh5HOdigs39onYkcXmr918feAXYD0=;
	b=DZFO/+MPOlM60w1LfLDS3jA4fGOrCuqQ2s6AIIdFQBYZnMsgIVhtjn77SQPj7yfYBK
	4WzjFl+WzRCQ0u8xOxtk0m7mvV6m7H3oh4PJuIsovEJQRyZOpGu58rxj8b9LV0a5uX54
	NMFOBQOKG3gbzgOVO2GaMs+72CbG7th8WVjLZEhlrExxVwVlqQqE/m9NQA+ui7BNf0lN
	q2AqZ80d2RQDYv+Ug4GFMd21vU/V6Idpy5RruUq0lBDDY/yrMgoE/ssgrAG2OGVcf4Zj
	6CpDmy8o9HoT8N9jQIsbhYXVzekLk8hefTyBOJwvLcozDpmVTJbcJP7//YJ5tMchyX9F
	0JKA==
X-Gm-Message-State: APjAAAXIfhGkIhwGFtdIo2bWhWAEbztWOZVxMdUKrTiZ3DGoTZwiSEE8
	kDSRGrIn4hm2DXLp44P/Kp+0mxRLKXs=
X-Received: by 2002:a5d:464f:: with SMTP id j15mr7875159wrs.265.1556903629942; 
	Fri, 03 May 2019 10:13:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id e5sm1717671wrh.79.2019.05.03.10.13.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 10:13:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  3 May 2019 18:13:45 +0100
Message-Id: <20190503171347.13747-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 0/2] hw/arm/boot: handle large Images more
 gracefully
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
Cc: Mark Rutland <mark.rutland@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: olIO3O6B3FGU

This patchset attempts to fix https://bugs.launchpad.net/qemu/+bug/1823998
which reports that we don't handle kernels larger than 128MB
correctly, because we allow the initrd to be placed over the
tail end of the kernel. AArch64 kernel Image files (since v3.17)
report the total size they require (including any BSS area that
isn't in the Image itself), so we can use that to be sure we
place the initrd sufficiently far into the RAM.

Patch 1 in this series adjusts our "where do we put the initrd"
heuristic so that it always places it at least after whatever
our best guess at the kernel size is. (This might still not
be right for images like self-decompressing 32-bit kernels, where
there's no way to know how big the kernel will be after
decompression.) Patch 2 makes load_aarch64_image() return the
kernel size as indicated in the Image file header, so that for
the specific case of AArch64 Image files we will definitely not
put the initrd on top of them.

I've given this a quick smoke test but I don't have a very large
Image kernel to hand, so testing appreciated.

thanks
-- PMM

Peter Maydell (2):
  hw/arm/boot: Avoid placing the initrd on top of the kernel
  hw/arm/boot: Honour image size field in AArch64 Image format kernels

 hw/arm/boot.c | 51 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 16 deletions(-)

-- 
2.20.1

