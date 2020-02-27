Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4977879lfg;
        Thu, 27 Feb 2020 14:03:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbsoNsXxJSWfve+VnitbW4olu3a8VuwYfcgcOxCPxaB9AA5PU23Eyn1+arHYl2gc7XBTWG
X-Received: by 2002:a05:6214:6aa:: with SMTP id s10mr1205401qvz.138.1582841019516;
        Thu, 27 Feb 2020 14:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582841019; cv=none;
        d=google.com; s=arc-20160816;
        b=vULS+9TENXnszPN5t5qLCTFHo0g6SWrHk8KhzHtYc4ujeLio2W0/uSZoZanh6l4Rs/
         vI6vbLOagkXp3DaXw0wRNyIAQ6Z+yjJ9bBc+YRlyInAVxw0JKiq2dGNk2ySly5RohNWt
         8s026n6W10lkvvvU2leykf2QTJQHcDjNW1MHfIk6ZqyHS0RlSJuSXGBs8te9bYr3+pAZ
         jlCq/9chq1eRPRpt5PQT6fS3I2HeaVFdZ95fS0xEcH1WS/OyZudCwozdYPYU22+e2+p0
         m8l9VYfGX+J5Lr0HswqF02/oWfl9/gz9q24UDBc8J/Zce1LexjvWZqFa8nVkVDUb+KxI
         SeTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=kNMFlIjm8XBJIEBAtxi3IHrtpIfU7DEVVdeoiVTfm0o=;
        b=T9teIvz3xtcD4zdFSI2GN+FHYqM/eCnUHQCYzy5WVTxlF2+JQUzgGv02SRJYKYw6Wb
         LSPsNn3ShBRezkLH8kpDs1pOfOEG9ikXn0iMOzsIdgZ4ynuwtQsQMYxdHryJVRgQcRLi
         e7bb+hc+3ajrgxHeCJ4YxzL6FtcBqRETl1AhcY4pNlObvEz9FvkzYaVyGWqgIzBfXcYf
         D8DXpu4TtrH8vBKzyYk06dvE6qyYhnC3EugWls6tx960vWYu/u36SH8K/4WRXiykIAg1
         N3B3q5YWuhYhC33MO2ku8hFkFAXONZ0mNHoOuDXlH7xVPc407TC7ETEG0dqOPJ654lEk
         +OcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h+Z7qLYw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w26si467528qtv.74.2020.02.27.14.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 14:03:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h+Z7qLYw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7RFq-00031W-Vz
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 17:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44946)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j7REK-00019E-Dq
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 17:02:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j7REI-0003lM-Qg
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 17:02:04 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33915)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1j7REC-0003js-Qq; Thu, 27 Feb 2020 17:01:57 -0500
Received: by mail-wr1-x441.google.com with SMTP id z15so720866wrl.1;
 Thu, 27 Feb 2020 14:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kNMFlIjm8XBJIEBAtxi3IHrtpIfU7DEVVdeoiVTfm0o=;
 b=h+Z7qLYwpV96cJpRs4xBR8CbE+1g/hBRgA2WQrpaJUzf81kgCqfMTi8D5Y0y6pXMmf
 856AeXTiwadfM1Xcy2kTQ9P/2g45TPcLGKcfqfraFya9Z4gYUKowZh2Bi1OTPR7VK85E
 QOwgXzPETiFYHea9YbLFZwvNtu3FfNMtAbypVjqNRzXZ9z27xefbb2XaSA0adtyxxH5B
 SnuyoJg81CMR+HjuYO1ETdwrnKS916qIRHAnU1vqD6Rp5Gr+ILMUCBc3MMiVivAbVpWU
 OTWfmAV+7DQnY5RmkdXRpgObij+M8dduEAlXU9kDpDF0+4HnLtR97xYVuzUaAIXtJBgz
 oauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kNMFlIjm8XBJIEBAtxi3IHrtpIfU7DEVVdeoiVTfm0o=;
 b=hQgte0SEv01JQ+rUnmyKLNETlyEYrBFtyAuL9nGg7X9UyEwdf3RwQQ+h+fMEIk+nEc
 K5sx/2eeu7dm1r2sHvwiHb0CrV8zmUUuLzR+vhFteF6Xhc19jroRs3zmHLWVKm63U3vX
 RX5rpYz0N/XVf2WLKr5bm1OP7zh+a1fpcnyiyKC2RuMmy7MRaXm9rywMtYGNXD24WrOY
 B26TX0+JvZ91Hc0JUcf3pm3fBc57u89IrjdpWuhAC6zWhwqEPuYIJ2N4vCpZBvTIMFyj
 CPAvWE7oPT3Sc+EFyzGNKCzbOHcYBuI7nJ25oPJ8Ihc23klyz2cXfKgcmlkj7m8w5c/M
 GHog==
X-Gm-Message-State: APjAAAWLiV9uDkSwm00HAzZosG81to38a9a3AAwlIi+0JY34pMDx3Cbe
 nXiqGh+ZPwyo9aN/JVJGNCeklMDf
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr893521wrw.47.1582840915381;
 Thu, 27 Feb 2020 14:01:55 -0800 (PST)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id z14sm6447040wrg.76.2020.02.27.14.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 14:01:54 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/4] hw/arm/cubieboard: correct CPU type and add machine
 argument checks
Date: Thu, 27 Feb 2020 23:01:45 +0100
Message-Id: <20200227220149.6845-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: b.galvani@gmail.com, peter.maydell@linaro.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6WxQA/txKmIo

These patches change the Cubieboard machine definition to use the
correct CPU type, which is ARM Cortex-A8 instead of ARM Cortex-A9.

Additionally, add some sanity checks for the machine input
arguments in the initialization function.

Niek Linnenbank (4):
  hw/arm/cubieboard: use ARM Cortex-A8 as the default CPU in machine
    definition
  hw/arm/cubieboard: restrict allowed CPU type to ARM Cortex-A8
  hw/arm/cubieboard: restrict allowed RAM size to 512MiB and 1GiB
  hw/arm/cubieboard: report error when using unsupported -bios argument

 hw/arm/cubieboard.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

-- 
2.17.1

