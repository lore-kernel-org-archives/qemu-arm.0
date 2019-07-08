Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp2291076wrb;
        Mon, 8 Jul 2019 03:48:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUfby2j9Gt3BPeoPeX85er4gP/cnzQKmwdKm/LM0cCiz10HXMOasgdmtkZ/alMYYmji23l
X-Received: by 2002:a17:906:948c:: with SMTP id t12mr15915071ejx.222.1562582912951;
        Mon, 08 Jul 2019 03:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562582912; cv=none;
        d=google.com; s=arc-20160816;
        b=oG+qLzEYnx7K0/3CUysG4Ifw2eph3mbBFY0i8PzDMSaShYlj8eXgLrv3Au03ptuGJa
         D+7UhHozbrcxDNYOee52GqThZd4MFLZ+6L8oR0RnNGdYLVEdvGeOJ2tpqxSlLvnAW0VT
         bOwK6tLKye75mvwDrRQ6vZqz/Oy41klNao9hyIuWAK5nZ5YT1uSNzag9gNkovZDd/o0I
         zFHqwe4BSWmNtW2FCs4domVi0GZOtSCCveQB5jX/m57qY5E5cgiLaEiDG5KmVfJyMJ/V
         dW/Rm7PJga8f+Bt3WtRyr+TD/wMHliGYWa1IPjqPQZh75Z51CMm+45nhlUmWC+zE7g7J
         JJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=Y2btZEXIHBfcffdTxSefPIzBgNRxeOTwfyYWvH3cwUQ=;
        b=DCrfoTQaUi5IRbj91LygiX2eznxM56qJCQgED6A3zpt5CosPtfOHrXKNCNjSVJ6mo2
         XppZWRTkshc6lq8Km+xqWsGyy5Z2d1emXAJAzudf1HWtUB6iC9uKRgHVI5LqQaQHRzin
         6vuZ22dCKcmOY5M1dPXvCwWS1WebRm5QRUmNZ6KD50IMOUwJxPKAfJTMiNO26vD00M1U
         uh0uLVq6F2JXjD/ECwxoIRXIQQvy90mTFNSwpcjSzcPXBNYOcoNJuGQusd1BGoKHn3Tt
         1SYXiOg7hGKfxcSMlGiTSg/xhslgnQ5rCbwE1Lwud+eltzQSXXJ5v8hKLxkfMSlj3sMw
         VGYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si9972072eje.173.2019.07.08.03.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2019 03:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkRCB-0002oU-0y
	for alex.bennee@linaro.org; Mon, 08 Jul 2019 06:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39829)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkRBx-0002nA-CR
 for qemu-arm@nongnu.org; Mon, 08 Jul 2019 06:48:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkRBu-0006AX-Nf
 for qemu-arm@nongnu.org; Mon, 08 Jul 2019 06:48:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59102)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hkRBu-00069n-Gn; Mon, 08 Jul 2019 06:48:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 099FCC05B038;
 Mon,  8 Jul 2019 10:48:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-112.brq.redhat.com [10.40.204.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B770057986;
 Mon,  8 Jul 2019 10:47:56 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  8 Jul 2019 12:47:47 +0200
Message-Id: <20190708104750.1071-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 08 Jul 2019 10:48:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1 v5 0/3] hw/ssi/xilinx_spips: Avoid NULL
 dereference and out-of-bound access
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-stable@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y4J7JqOaFKcZ

v1: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01238.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01586.html
v3: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01657.html
v4: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01777.html
v5:
- address Francisco comments from v4

Philippe Mathieu-Daud=C3=A9 (3):
  hw/ssi/xilinx_spips: Convert lqspi_read() to read_with_attrs
  hw/ssi/xilinx_spips: Avoid AXI writes to the LQSPI linear memory
  hw/ssi/xilinx_spips: Avoid out-of-bound access to lqspi_buf[]

 hw/ssi/xilinx_spips.c | 43 +++++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 12 deletions(-)

--=20
2.20.1

