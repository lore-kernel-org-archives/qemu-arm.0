Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4713190wrh;
        Tue, 30 Apr 2019 06:15:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyWWGTs9vDKzwyiJfxFH/d7uXzHBvMHYrYfXKuJsNQ5xCN2qPp5dqnEuPCWMR26OET7r9kw
X-Received: by 2002:a5d:684c:: with SMTP id o12mr9371455wrw.308.1556630137787;
        Tue, 30 Apr 2019 06:15:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556630137; cv=none;
        d=google.com; s=arc-20160816;
        b=t2048uSAIxzPYw99wN+KtNcDbDICGS1TX3+kAsbYMDz0ZUPeG+8I/Bfl/FfGKwtj48
         LmIfv9s7jzTyirBj/NFSDbe/uiPF90ov4bWKzsE8P6sGCF45MH0Nv6YKe3HmJrWZSjQV
         DOYbLvfEXgKIV20tz2Mb42ZrAImvSGDW6EycQrQfufQIyOm1nBhW8jdcG0ODsI9xZYMK
         8+zvw0pTpMRgUdM+K9ygYFsGw488FjMR2w0Qvr3S5LaAiQyzd+9SXuxrjwhyuNR+WP33
         2W6mebzRQ4uR/J6zvGvt0b6vZ9pb27liHUJdpdHZmcsXa9TfTBG9WbThw8STt5uwsqf9
         luww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=w6vzehaCUPSzmkvOvH14Y6PaZ3vtUSQ/vmVeOZradMw=;
        b=pK5qxw1v1A7vM7iuhzuBKirsRqZ/S2SVPaYYixKojPVdPOXb0REkdfibAmxCdsLC5a
         4SAYLpxkisGKTf6dh48/5rtC+WhFg+DwHSnuXq6av5FDbHv51YfbuyVSa0PWCIJ5+Aou
         G0fnUKOvL8QgWh4RYFduVvoCn6CSQW3qxyXAO7F95mpTv/R5pik9mLN34DCW7SWVf5hi
         Xe1vxaleSJ3wIFNMxls1dBmP1D6RPz+FXVkPJDSkV3HzgO6Fv/1BqIrEOHSPNNlmMhAU
         NQ91MIX+ibcNwCDUv5ORdqrmRdkzCu52rWhbl4KdmOV8ZmccIP9gZ/0tt41ipc493LYK
         Gb6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nw7Iu52m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1si25770031wrp.456.2019.04.30.06.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 06:15:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nw7Iu52m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLSbg-00010q-Q4
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 09:15:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLSaq-00010a-3N
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLSap-0002AG-5T
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:14:44 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38669)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLSao-000292-TT
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:14:43 -0400
Received: by mail-wr1-x443.google.com with SMTP id k16so20992005wrn.5
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 06:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w6vzehaCUPSzmkvOvH14Y6PaZ3vtUSQ/vmVeOZradMw=;
	b=Nw7Iu52miYbreKaP04SnKTM5paCXaH+E9+ZUSeEuI2DkvQfwkybnxXt63/53whpbmX
	f+exjTAXv358SZsX8V5eB7hG2GWhzFQFTZpGe2iGo929nFQn3bsjF9FHkmccyP4UWu5B
	oRJuHr5EYiDoKaSzeGQjpmaqTefgIsOxo3jMnZahNnqdmqXpqwgfcaj2vTXXB3cqlSm3
	FLS5osifAjqYzTQ8Kgh4O5aoHiqf/JyHFRtHrCO6JAQpDsmsoQruSx3IXVQE5kZjm3MA
	9OzWHeTkmHDVaAWdKXs1u8RL4Wq2CrHeFAYtMmgpqRuM2Xz3u05hVddFD+CdTSk62cQT
	rbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w6vzehaCUPSzmkvOvH14Y6PaZ3vtUSQ/vmVeOZradMw=;
	b=eAKQjFb0pKQnBSFfdbCRVh7iU/W5v1pdcMMR7GOgGv9ZQR2DD4MlY74v7wCRxvk6Da
	bno4GA8Cy+xKRv/Jy6M4U4tnOqCswOvNALiWuMcuq0I2zT9iWUdYHKxiZMeWPm1IYFNH
	ScH+GLz14KpUOUtx877xBoV5ZKmnmheB/lcl60Gy0qj9G3BqqPFXyPetO2Vba9MoUlBd
	0EWa1RXr0EQkoLBZXGzWhfmR87LlRLoTSEt2oVvNThN1wP8fSXHnTq0DZSu3bOw5Hy3D
	ElqyuJrsB5xicLoDT5YoPOfWQJeMHziM/GTUiwY2r1BUXTydjoXHdlVLpTwyP5C4Apwp
	BZhA==
X-Gm-Message-State: APjAAAX6QcoSp2rI4ZGXcWcu8yvBfSyhC2CpOcv6sTVmBbHy3GPI9n83
	lyqj25yEZfKChLYYglv8eflBH3ord1U=
X-Received: by 2002:adf:cd05:: with SMTP id w5mr2696917wrm.84.1556630081614;
	Tue, 30 Apr 2019 06:14:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	a12sm16557460wrh.46.2019.04.30.06.14.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 06:14:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 14:14:35 +0100
Message-Id: <20190430131439.25251-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH 0/4] target/arm: four minor M-profile bug fixes
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NKbCKbc1zZM4

These patches are fixes for some minor bugs that I noticed while
writing and testing the M-profile FPU support. They're not FPU
related, so I didn't want to mix them up with that large patchset...

thanks
-- PMM

Peter Maydell (4):
  hw/arm/armv7m_nvic: Check subpriority in nvic_recompute_state_secure()
  hw/intc/armv7m_nvic: NS BFAR and BFSR are RAZ/WI if BFHFNMINS == 0
  hw/intc/armv7m_nvic: Don't enable ARMV7M_EXCP_DEBUG from reset
  target/arm: Implement XPSR GE bits

 target/arm/cpu.h      |  4 ++++
 hw/intc/armv7m_nvic.c | 40 ++++++++++++++++++++++++++++++++++------
 target/arm/helper.c   | 12 ++++++++++--
 3 files changed, 48 insertions(+), 8 deletions(-)

-- 
2.20.1

