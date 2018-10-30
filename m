Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5467587wro;
        Tue, 30 Oct 2018 04:52:14 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d6fx0vL3U7hIKzuFD68/3E6xd1+TaIkvkvukJSSp5isia6jszBMDZW0hIGGKUzPM1VQN50
X-Received: by 2002:ae9:de01:: with SMTP id s1-v6mr16063678qkf.258.1540900333930;
        Tue, 30 Oct 2018 04:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540900333; cv=none;
        d=google.com; s=arc-20160816;
        b=JeUwD6nSJeTSfRHD5HqmtZYdGSyKg+Zy/ov1diQT2ckR0gNGKFTfQYzVqQsgRwTIHN
         xQIWipX91AXLh+5yrC+bPj6ZPlALJATvAwEzzk1mDQ5luEaAh5ZDI+C2kXI3nd33LLRz
         aQdZpKhClJZJLlrZX9PpMU2CujZmHnJofPel810jrCqGx7TVqs87Iyq496tQI2yr71Ov
         U7TCu5gZeYJ+Jk8RDWTj9e7fppPuLIApLHPtP5yZ7ox3DqlwIfmWEUuys7C+WOV+6DsC
         /IcArmJ69rhNzGjxK1PfaOqECcBd9SOR5Zqr47qzmX8jFoX/8krJDWRYTEnSm79P3S2q
         S98A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=7NObw8CbURbxnPfVwE4c4Jm2dTSGRqz5rFlZP2A5miw=;
        b=WHCrXC/VE0eWRMnyXbkDxxBZM+VNiCVFPf35jfGRvgVSVZiNm/hNu/pLsm6Eoe4Ppi
         HjUJdeQqx0LRdsbil4sFU64wohLOpaNTLXFOcE3jwZG6FXhgjxQVU3qY6IBANSqpVcvj
         2/+mBqYECN1jvQV2Zz7QJ8GeYAN9pcKU9smJTzuasUR1qjSd87luPIHUGor6efgU5xbJ
         uacpJ+g8gJW1VoRYbmdpOMlZAoy2vrhRp/tvNLQVL4OmseG7vWReinbT8iT9AV3CEiOu
         Scx/xXCn56hfVI/Lu1FrAtbYv4P5ovicG8WIYFeY6Cr4M+V4fIt5Gz4nrls/D9FLKN0i
         tbzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38-v6si9708190qte.18.2018.10.30.04.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 04:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHSZB-00031Q-BE
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 07:52:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHSOZ-0001GZ-9z
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 07:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHSOW-0003on-41
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 07:41:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58166)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHSOM-0003Zj-QZ; Tue, 30 Oct 2018 07:41:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F19403112C7A;
	Tue, 30 Oct 2018 11:40:59 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 259EE5F7E2;
	Tue, 30 Oct 2018 11:40:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Tue, 30 Oct 2018 12:40:46 +0100
Message-Id: <20181030114048.21527-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 30 Oct 2018 11:41:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/2] hw/arm/exynos4: Add DMA support for
 SMDKC210 board
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D50n6w+5btc4

Hi, this series is another intent to salvage previous work from Guenter R=
oeck:
https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06302.html

Since v1: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06335.=
html
- Do not factor out pl330_init, which resulted in buggy v1, see:
  https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06448.html

Regards,

Phil.

Guenter Roeck (1):
  arm: exynos4: Add dma support for smdkc210

Philippe Mathieu-Daud=C3=A9 (1):
  hw/arm/xilinx_zynq: Use the ARRAY_SIZE macro

 hw/arm/exynos4_boards.c | 24 ++++++++++++++++++++++++
 hw/arm/xilinx_zynq.c    |  2 +-
 2 files changed, 25 insertions(+), 1 deletion(-)

--=20
2.17.2

