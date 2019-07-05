Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3558472wru;
        Fri, 5 Jul 2019 14:08:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyfGVkqy1t0gi9+ripP2rBI++xy4HW6ws7BZSlY3PdMTtNOyMVX+bpVMYJXkjm4M7vfu4bl
X-Received: by 2002:a17:906:264a:: with SMTP id i10mr5423092ejc.10.1562360936404;
        Fri, 05 Jul 2019 14:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562360936; cv=none;
        d=google.com; s=arc-20160816;
        b=ET4HTOf5pA4fbyI70JxZkkiDZEhoGTlIi0p7AXjXNSX4IythhvPTc0pR3iDz6alXqy
         8Hf5iweoMD3UjJCz5qNVohpvfJFP5DJnWxPgmkni6HFNGyHVg7wML8SfYsXKcia/P6iY
         7I+FSiEM2WufOt5CEBBDBQ7/0RSQ4hpmkWBH/LTGMCoOBeNiKwwOP9uOjn3YKXOB9yJt
         YAenVcGi0kEtPt5Olx6Stli7SvmEFO1w0W4Ee5E6MMn6Ku7SV0loCVbH1DP0QXBh0oDY
         KsE/fplnHttrHIYdza1dM6MZHQXfR1FI41MaXte7jyEUBIuKTS3+sMJQCiJtoDYzTcqH
         aGow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=1GzwN6x8RnsZcUT3OdrnBwZBXq18CFunZGnkn7nc9g4=;
        b=KTyAiYsUjAkqUarzkgK6n4uqCuCT/SPd+YeyZMkx7rQVreG8lkWtaQkbhnI3hZ/M6f
         hEy2S1W3pqP84qKcPD5gFwhvLF2RQjS/Kf5HYBkKs4A9uVSAlT2VDHCQyAMgzy8l0xof
         6+de+yQ5b2NqxsDEly89yqo1Lk8AVFsEX05FzhkeOTpE8hrsoOdN5Wh5bCoC0ic0ZaEw
         XD0dcGU/gbgtgiHKr4SEYwX9CSh4qEi+8Q7qr1ER/qWiTd4SSTKzgjZJUfKSC/DjfX0R
         YWoyD+uPpuO1+UQR8Qg5DzFh1osoFSZPpymgFaw/2N9u+iHmCuF5z+FQbPJvmRbrT3nN
         RfSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e57si7990775edd.263.2019.07.05.14.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 14:08:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjVRv-0003qH-Gm
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 17:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34637)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hjUlq-0005zG-FE
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 16:25:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hjUlp-0004Pl-Bo
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 16:25:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55904)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hjUlp-00042N-56; Fri, 05 Jul 2019 16:25:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1DFB6308AA11;
 Fri,  5 Jul 2019 20:25:09 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-45.brq.redhat.com [10.40.204.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21A7561993;
 Fri,  5 Jul 2019 20:25:01 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 22:24:57 +0200
Message-Id: <20190705202500.18853-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 05 Jul 2019 20:25:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1 v4 0/3] hw/ssi/xilinx_spips: Avoid NULL
 pointer deference
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
 Alistair Francis <alistair@alistair23.me>,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IHKlIyurEf8/

v1: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01238.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01586.html
v3: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01657.html
v4
- address Francisco comments from v3
- RFC avoid out-of-bound

Philippe Mathieu-Daud=C3=A9 (3):
  hw/ssi/xilinx_spips: Convert lqspi_read() to read_with_attrs
  hw/ssi/xilinx_spips: Avoid AXI writes to the LQSPI linear memory
  hw/ssi/xilinx_spips: Avoid out-of-bound access to lqspi_buf[]

 hw/ssi/xilinx_spips.c | 43 +++++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 12 deletions(-)

--=20
2.20.1

