Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp452395njb;
        Thu, 4 Jul 2024 01:30:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGdhd6loenT72KAe2hngWmvTPHsAzArZldhOMJoJpXpWt2t81ZTWVRBTVBEtCBS8FLPalJsvKBO0Ir5Y+0Lr1m82j6khrO
X-Google-Smtp-Source: AGHT+IFkOVVTkb4IntyH6ZXun6hvRS5I6RYZ0Ip4Oy6l/ReJo9AU6inLOKdSeJL3CZ2vCO6Qbd96
X-Received: by 2002:ae9:f213:0:b0:79d:7506:f194 with SMTP id af79cd13be357-79eee29b532mr101468385a.48.1720081815663;
        Thu, 04 Jul 2024 01:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720081815; cv=none;
        d=google.com; s=arc-20160816;
        b=e1J2nbgI13IPfv4A4uwvMxAeVzGLtMYN+Wzy0RZahtWRQN1Zsxvq0L8cZvVBJGCpIa
         dXESFCuBuiZw2iOVIpIgYZ1DVwg8DhXy2bluhIvQtkJ9XwQFZ1VUJ0FVhN5/35ZRXXKy
         LTYk+rP0XYXTJn/nd85x95LmiNSzXOOvLb/L7LEpXZVSTeOLmFtUSvRLSYgjm3Ff67qn
         N/cO/mMq/p8W8GdiTBlMJDgWIClyh1QHZA3mpTn/vDySJGr8rIhBa0lnlOJ4IDraSFNA
         1QxSiVHgT9YDWgYMmYu70N0QdwsxoBg0DFkdg6vdtiX2+VObJI9mvMyrEluoQDjcGLSR
         JA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=ldn/wBsNC3iiz+L7VA297fnaGfTh10DuI5Uzi4tUEEg=;
        fh=Vva0SnTfFpZ62XWQNW5X4TL2jFj5cBikmg9Gp1PrOrY=;
        b=N6hQunxdlJHBB1PmauB9rpK4Ofa9qh9vMYkoVRr7zbqIS0CbC0BWErzWm3FQ6Rt9Yb
         qUsrPp+VtFbYW52d6pC6r9uHVZQvml9m00QgfmLXVtekGDKrg+OJ4/Z8ztQCPSuxMTWF
         LsW3ZHiIVUxi0mGZIALARsAtYgFBUSRkq5jC7BgOApL3Jy/d7fR1zNBQa/mVHjbrtcnI
         C4Fr7p5Uxad9QVx2LBHWOPnoh//lTmsxu6PydTvpaEDz7I40AHBBK58+TaGf/TQRkpNW
         YPyCRbAX0QrVdJPmuyI+s/n9pFPe2UOEIQR8EOC37GkHID3h0uaSKYjzAXFFT7p5S0G4
         5/YQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d69307d56si1425541785a.437.2024.07.04.01.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 01:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPHqS-0000NT-9J; Thu, 04 Jul 2024 04:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sPHqQ-0000N8-NK; Thu, 04 Jul 2024 04:29:34 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sPHqO-0002HT-IR; Thu, 04 Jul 2024 04:29:34 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 4 Jul
 2024 16:29:22 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Jul
 2024 16:29:23 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 4 Jul 2024 16:29:22 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 0/8] support AST2700 network
Date: Thu, 4 Jul 2024 16:29:14 +0800
Message-ID: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DRVtS5yCpoMx

change from v1:
- ftgmac100
 - fix coding style
 - support 64 bits dma dram address for AST2700

change from v2:
- ftgmac100: update memory region size to 0x200.
- ftgmac100: introduce a new class(ftgmac100_high),
    class attribute and memop handlers, for FTGMAC100_*_HIGH regs read/write.
- aspeed_ast27x0: update network model to ftgmac100_high to support
  64 bits dram address DMA.
- m25p80: support quad mode for w25q01jvq

change from v3:
- ftgmac100: update memory region size to 64KB.
- ftgmac100: using a property to activate the region for new registers,
  instead of a class
- ftgmac100: introduce TX and RX ring base address high registers
- ftgmac100: split standalone patch for easy review
- ftgmac100: update TX and RX packet buffers address to 64 bits
- aspeed_ast27x0: set dma64 property for AST2700 ftgmac100
- machine_aspeed.py: update to test sdk v09.02 and network for AST2700

Jamin Lin (8):
  hw/net:ftgmac100: update memory region size to 64KB
  hw/net:ftgmac100: update ring base address to 64 bits
  hw/net:ftgmac100: introduce TX and RX ring base address high registers
    to support 64 bits
  hw/net:ftgmac100: update TX and RX packet buffers address to 64 bits
  aspeed/soc: set dma64 property for AST2700 ftgmac100
  hw/block: m25p80: support quad mode for w25q01jvq
  machine_aspeed.py: update to test ASPEED OpenBMC SDK v09.02 for
    AST2700
  machine_aspeed.py: update to test network for AST2700

 hw/arm/aspeed_ast27x0.c         |   3 +
 hw/block/m25p80.c               |  16 ++++
 hw/net/ftgmac100.c              | 147 +++++++++++++++++++++++++++-----
 include/hw/net/ftgmac100.h      |  17 ++--
 tests/avocado/machine_aspeed.py |  12 +--
 5 files changed, 162 insertions(+), 33 deletions(-)

-- 
2.34.1

