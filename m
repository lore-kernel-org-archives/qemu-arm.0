Received: by 10.28.4.212 with SMTP id 203csp4286128wme;
        Tue, 8 May 2018 08:12:58 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoCMPh3lx11r3sweL2uFN5V9PXYSBui2pADwdAULX4LUdpxBjmt0+poxuOC+PoZMDmWicie
X-Received: by 10.55.103.200 with SMTP id b191mr3654834qkc.229.1525792378398;
        Tue, 08 May 2018 08:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525792378; cv=none;
        d=google.com; s=arc-20160816;
        b=pB5/lj+mCtjb6q6AUFRJbV2Arrmw6M2RgABC/Jwp5zJHn7YI8Ekkdx9qd2Yxw++Wzl
         30HmnsXQoQTmDLunyjLk1uPRPx8xfzyjKSl4V5V1YWZt4JHP+fKetYIQbriUEilrvMiH
         zN24sEniID4g3Ool2a/40zcKt58sZSHdmKr6xrixmuABbUUzTHoXuWMqemEuI2o4F31Y
         TGPleVvrGz+HrH/gqiPxLlsGOB1zaiHHQ2py3YZPb7by+cJTm80pDqmBek6EqFEInaSB
         WsvzM76sdVgKiRqzOtHsa28+ZUnXJobinCDHYNl/FkdL5K0d92eP5zOtmtPXk6HmMoc+
         PZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=d2jxH82/GPKBOO4SEMTuKEITq54K/cIUV11wFnkdLAw=;
        b=Ek+B/pRvGmWl3FvvmOx2SJIzBj0JioQATrkoRH6i6CO0dWMFeTCRoZh2pdopP+AiVf
         Krb8S9kwOJG7cItqRBH70Z/EIoJEnU7XdYQEDuOwwpMtiiBD2YBi7fT8z2Vpd37YwC30
         9DCZejBBm6rFG2QTEqXbNJT7yIQaUILw3RDlp+u5mp65G8nkDiY4NBoQR5ZkYtwwE0lI
         Cr7uN1UynKV5er1ltiLkoCrsVURnAE1MiCyaW8w9IAc44xWhs8z6Y/fsAxEkYNcvslXT
         lB4VbFu/OEzgVK0uUGRcJLbzmG5ZduL2BuiaJN8yOENH6lT4KEE76rbY4Ydr6Uvw9mt7
         2XUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZoU2GRaY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11-v6si3708998qtg.81.2018.05.08.08.12.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 08:12:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZoU2GRaY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fG4IT-0003p9-Rw
	for alex.bennee@linaro.org; Tue, 08 May 2018 11:12:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG4GL-0002dG-T2
	for qemu-devel@nongnu.org; Tue, 08 May 2018 11:10:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG4GH-0004xa-Si
	for qemu-devel@nongnu.org; Tue, 08 May 2018 11:10:45 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:42452)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG4GH-0004xC-OW; Tue, 08 May 2018 11:10:41 -0400
Received: by mail-qt0-x244.google.com with SMTP id c2-v6so41426565qtn.9;
	Tue, 08 May 2018 08:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d2jxH82/GPKBOO4SEMTuKEITq54K/cIUV11wFnkdLAw=;
	b=ZoU2GRaYlR+agXD9tHD8aLNWVgRSNVavnwU9v8H//hy5FTpoJcrWxblA0pIQ+xth0p
	/gK89obQVBJPupT6b7HWqVkqkTU4i+2qIz8c2fcMB42Ez8rm38JTTj0kaUJxBjX833wv
	5d8WQReVxthV5PznoKfY3bVU3puP5+XbgH9TUmwfel8P+9GNdlAkMaXeLFyxN8uJ2Kad
	yPPfiHDQHd4qelN4MQTaFb6FUA6RkR1auwK8SAQfaB4gjt/XYucQvLQJ8Cgcf9mATF/3
	wJHXvC7vmmvb081h9l0oUCkYtjoz+rQH3rDajAaxzKGkT1QTYmSItJy3jx2sFdDwOD3N
	/j8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=d2jxH82/GPKBOO4SEMTuKEITq54K/cIUV11wFnkdLAw=;
	b=g83p/7K+9ooVXxedmeyUUugd0Hjsk8XfT9BGqYqljd9bbqiTQ8vTasYHO165Ns7w1r
	sPodEEfoaXypkdNh7HZJWWvFtzpQFMtbzQg2AAVeOnhfKxcTSVGckHr3c4qAi/QBEI6p
	dw4IUct2B/N3rE1b+4P2ryszvvON7TWvzb4fmyzkJxz8/wL7GBRnukG2Vu9+RKxzCo7B
	GYPTp8LZzJncWFo/bAMt9IHUefLkUxWJKNjA3p6EBpZ0tTd8t7BPtQ2lnKwsU0Rg+8NP
	6g5gUqeuPt5TY1qNy+g9B2GINxuZNJC6ASr6K2/Pnh9CtId76spFPUb1VRcSoJyfYm3o
	gq4A==
X-Gm-Message-State: ALQs6tBJHp+h8kqzKgFxOJMNHvRXEr6nTjZWJ8aF3tSOGnBv3BG98SDO
	9FwwwXnJrSx82KUPtE1znOc=
X-Received: by 2002:ac8:6612:: with SMTP id
	c18-v6mr38301834qtp.343.1525792241135; 
	Tue, 08 May 2018 08:10:41 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w12-v6sm13305015qtb.80.2018.05.08.08.10.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 May 2018 08:10:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Tue,  8 May 2018 12:10:31 -0300
Message-Id: <20180508151035.16774-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [RFC PATCH 0/4] qemu/typedefs.h cleanup
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q2W7d7BmxoFu

Hi Thomas, Michael,

This is a RFC cleanup following the "s390x: drop an unused include" thread:
http://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg01649.html

I believe we can cut a good third of typedefs.h.

Sending a RFC PoC for comments before continuing in this direction.

Regards,

Phil.

Philippe Mathieu-Daudé (4):
  typedefs: Remove PcGuestInfo from qemu/typedefs.h
  hw/pcmcia: Remove PCMCIACardState from qemu/typedefs.h
  hw/ssi: Remove SSIBus from qemu/typedefs.h
  hw/ide/ahci: Remove AllwinnerAHCIState from qemu/typedefs.h

 hw/arm/strongarm.h      | 1 +
 include/hw/arm/pxa.h    | 2 ++
 include/hw/ide/ahci.h   | 4 ++--
 include/hw/pcmcia.h     | 4 ++--
 include/hw/ssi/ssi.h    | 1 +
 include/qemu/typedefs.h | 4 ----
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.17.0

