Received: by 10.28.71.27 with SMTP id u27csp1604601wma;
        Wed, 7 Feb 2018 21:51:41 -0800 (PST)
X-Google-Smtp-Source: AH8x226jcAccjzhZHdyVD8HCMVrxfz6Ypvh4qpw+i4JKKGVR2LLb0EUvjHoKPEHRmNvNHe0QYXlo
X-Received: by 10.129.82.137 with SMTP id g131mr5676581ywb.145.1518069101059;
        Wed, 07 Feb 2018 21:51:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518069101; cv=none;
        d=google.com; s=arc-20160816;
        b=OrOF/lndjfUqs3aE0ezq3k6u3zy0faOnybLirR1ndGuzQ68VrDoQpWET0h9EIsHWJT
         ymL8QP26UaJNpSb4talDnr9iW0XVqphvAA2tG/qVnM33hgJ1DD/avlF828wF8DjpkuUR
         PIEDGv3ToliKjDZkdYuaZGxV9i+Ixa4wRH2Z+RWpvybSnTh9cayWpp3sQ7R6dc7mOjRr
         2RouPnFO6iyDH+S7LppqiMnGXAhi6HttkxsfwCEhPUTTbW2Y25czSOh7fQNM8XreuVwS
         Rx+rPY4yeSXSKWHdjKlKiJN9ohNN5a/hV9/Nd+7/earz65mH+ETZs60ysEmovl5HSNUQ
         4yqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=v4DGJwOvNTdvl3br7eQtoQT7+Suq0U1bfV/6ppuRaPw=;
        b=XDiaD96sFFjFkxYdOmmQ9XOav584sioV4vFY+ciCNTZDb5dVYI3/cRw+H4LYA3rL0J
         ETB1RU5rWnaM0SnjTLMxm8xJM2lL8+v9qsJYNv732DENwWN/33Ug3f9vgyu5D4dhXAGw
         KtGJnhX3nsi7gscV6C/M0+Bj5482bk5WWaKLHGotVPtu5bfdMxn7WkqMgZqrcbedNire
         w9E7J8SV1i2Gzi3GqBgP0CjZsJoSH+YDeJwnRxy4wMBvoLyd4Pv3O0qr6dSgKs4YdNQZ
         9T5/4D59cnPX8c7V9qdaxrG/Hh8dtqzgfg7BnvncVKftCeQSqxfLXsndF61KLm80V9a3
         maIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RNMsySBQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t32si531404ybd.776.2018.02.07.21.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Feb 2018 21:51:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RNMsySBQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejf7U-0001tQ-HK
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 00:51:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <penberg@gmail.com>) id 1ejf7D-0001sV-Q5
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 00:51:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <penberg@gmail.com>) id 1ejf7A-0000PJ-Nz
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 00:51:23 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:42218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <penberg@gmail.com>)
	id 1ejf7A-0000Ot-Fx; Thu, 08 Feb 2018 00:51:20 -0500
Received: by mail-lf0-x244.google.com with SMTP id q17so4695392lfa.9;
	Wed, 07 Feb 2018 21:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v4DGJwOvNTdvl3br7eQtoQT7+Suq0U1bfV/6ppuRaPw=;
	b=RNMsySBQsJrEIK6UOFU8XcPekUq1gZBt1/JZb22sIUboGQKQHwwOud1NkCIolqRXSY
	xVe35U5ulwoaQ6yYGmpASBI+z/IzdY2iR/7dUyGMUcsBkoT2GN26HtgHGgsJaLoAel03
	B00+Lf4f4/1fqLr7ySlDkytFMezc3A6RkP9wy8/lorWc8xMAl9ewg35qFSe2RUVKLWei
	MzJxzuc+MoTNEVTAlCM1pU3/zznnwuAcv9BSidimKR9Gdik6pF4A6QKt/woiIpS3uGLs
	yopHveJwe7oRMQ6sguFCqyyv6TYPxjtaJwaQrGdzosT+s5ZfrklGw3ry1m69KPQjlCgI
	lAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=v4DGJwOvNTdvl3br7eQtoQT7+Suq0U1bfV/6ppuRaPw=;
	b=AKChsm2ZQeg2ECGR9OB7ucn2GJ7SGLwnNSaswRi2mMqnsNB6XFRiRg8scWNEhR/R/F
	TEZvliyrYw0r1sXaJoG5mJ+muXFlaaty5sRtjDxnN7/lRsdnM37IqO52392GhCDyDSgV
	IOdrXN/hQcPzm745qEvPvTgBOC7v3tBEcWr426hXQI9/414Dp2k1lnTp41qwEZ0Nw7Oo
	+fOyHUFqzLs/x+1Jl1G/bAFx1d+FslCke7pPmBV34aRH9H+kdy+/pF219tt4wNb7phxf
	9KZR3XnzzMvuWNP/iNKUqV0jsez4fsUPtqNtckTkSPQUsip2Svt2weI02psqiourTl3U
	P5QQ==
X-Gm-Message-State: APf1xPBCUDvRGI6Zuk2GxsRzxO7gotMxOYoxCQUFMgtZY8WQ3kkB6pY3
	hhFMaCG2OsX80isocfxXu5j6UUN5
X-Received: by 10.25.206.131 with SMTP id e125mr5997556lfg.145.1518069078673; 
	Wed, 07 Feb 2018 21:51:18 -0800 (PST)
Received: from localhost.localdomain (81-175-247-183.bb.dnainternet.fi.
	[81.175.247.183])
	by smtp.gmail.com with ESMTPSA id u24sm222525lje.5.2018.02.07.21.51.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Feb 2018 21:51:17 -0800 (PST)
From: Pekka Enberg <penberg@iki.fi>
To: qemu-devel@nongnu.org
Date: Thu,  8 Feb 2018 07:50:36 +0200
Message-Id: <20180208055039.24666-1-penberg@iki.fi>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-devel] [PATCH v1 0/3] Raspberry Pi 3 support
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rIsTN5S91vEh

This patch series adds support for Raspberry Pi 3 as a new machine model
"raspi3", which is an extension of the "raspi2" model with the following
differences:

  - Default CPU type is "cortex-a53"
  - Firmware is at address 0x80000
  - Board ID is 0xc44 and board revision is 0xa02082

The patches were written by me but I used Zoltán Baldaszti's previous
work as a reference (with permission from the author):
    
  https://github.com/bztsrc/qemu-raspi3

Also available from:

  git@github.com:penberg/qemu.git raspi3/v1

Pekka Enberg (3):
  bcm2836: Make CPU type configurable
  raspi: Raspberry Pi 3 support
  raspi: Add "raspi3" machine type

 hw/arm/bcm2836.c         | 17 ++++++++-------
 hw/arm/raspi.c           | 55 +++++++++++++++++++++++++++++++++++++++---------
 include/hw/arm/bcm2836.h |  1 +
 3 files changed, 55 insertions(+), 18 deletions(-)

-- 
2.14.3

