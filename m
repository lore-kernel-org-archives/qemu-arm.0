Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp665718wrg;
        Mon, 20 May 2019 14:47:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzaDSWz3BY3CpvSx61g+UDvnoAMr1a5ejxSfF/bL9bzFVUNB8KWW1CcMQvb41t974EDn4eY
X-Received: by 2002:a17:907:20ed:: with SMTP id rh13mr42618023ejb.5.1558388828752;
        Mon, 20 May 2019 14:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558388828; cv=none;
        d=google.com; s=arc-20160816;
        b=Ud6G7iBK9k8UYDMzNop993ZUbxm9GqdOgRW5Xtey6JWvExZyz8H3rmMUNU/9yx6YAJ
         6K6lsYwBen7YJoSG4v8ZdYzOhwozB4w2SB5Wm184NkKV0LsNFFlgH9cLXxRzPD2kAPVg
         f0oK7Hg3VxyuEkwtgX3IFz4KDq6XARJFYSSLlMBcbpRI2hoNhdr33wOAuiex2mV+A/SS
         crLaezAufz4Xx4IRCRZ7XD5QI3/LzC4gD3S2sjVZak85aQMwYZZ2NkWKun8szZTu5DEk
         Py1n4zN/BZT4TGxSCeHunNbsevEMYcgB7xGpjw9c4gYi8wk6VW6i+Rd+tPJwgTSOzIXx
         q/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=1n2NvUHdaMa1rSjKtk2uVFg83c6q/zqI3zb62deobBQ=;
        b=Af6um5g3hYyPI32nswUarMSpSQ87fpyd3cWwCub8xI26qg2pGbFtec8hztR60zgxGj
         VFJbuUxL6X0aVvRhKziY49OUzSHpnXBir0+mKiGBm8SiFolPku+sVebCBSKSQMvvqVHo
         tRTpCQKRd8hEPSmN4NQP1mk/y8YSrx47hHiZ5Wd+WRdoizk+wZqNNHnibplx05fw32jm
         CfjPtR7pT7nhXKTfsONr3l3ip8dsjxSKUDh+B9xTKbLjPkKmoDWYSrz27oT1HF9ln7ja
         0joeny9RDqk08pklsc+1vvYFuhr6XLJWoXlKW9wZyrtizLLxLuyqDtdT+8vNo+zmcTLb
         0yog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b48si1590041edb.318.2019.05.20.14.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 14:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSq7f-0001J6-OS
	for alex.bennee@linaro.org; Mon, 20 May 2019 17:47:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSq4X-0007Lq-Mv
	for qemu-arm@nongnu.org; Mon, 20 May 2019 17:43:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSq4W-0008WF-M9
	for qemu-arm@nongnu.org; Mon, 20 May 2019 17:43:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hSq4W-0008Ve-Gp; Mon, 20 May 2019 17:43:52 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4558A20276;
	Mon, 20 May 2019 21:43:51 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 219EF1001E6C;
	Mon, 20 May 2019 21:43:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 23:43:38 +0200
Message-Id: <20190520214342.13709-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 20 May 2019 21:43:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/4] arm: exynos4: Add dma support for smdkc210
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
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LC0hhmKBNsuX

Another intent to salvage previous work from Guenter Roeck:
https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06302.html

Since v3: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06674.=
html
- rebased
- QOM'ify the SoC code

Since v2: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06459.=
html
- rename init -> create
- create controllers in SoC rather than the board (Peter Maydell)
- add Linux dtsi in commit message

Since v1: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06335.=
html
- Do not factor out pl330_init, which resulted in buggy v1, see:
  https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06448.html

Guenter Roeck (1):
  hw/arm/exynos4210: Add DMA support for the Exynos4210

Philippe Mathieu-Daud=C3=A9 (3):
  hw/arm/exynos4: Remove unuseful debug code
  hw/arm/exynos4: Use the IEC binary prefix definitions
  hw/arm/exynos4210: QOM'ify the Exynos4210 SoC

 hw/arm/exynos4210.c         | 52 ++++++++++++++++++++++++++++++++++---
 hw/arm/exynos4_boards.c     | 38 +++++++--------------------
 include/hw/arm/exynos4210.h |  9 +++++--
 3 files changed, 65 insertions(+), 34 deletions(-)

--=20
2.20.1

