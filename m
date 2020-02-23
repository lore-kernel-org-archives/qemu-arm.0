Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4411288lfg;
        Sun, 23 Feb 2020 15:11:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqx8lOAOCZCkScdQSowKPrZZoBxEpfuDkn1Eov2W+a/6FufGK5htECbsq8OELzff3ZcTstlZ
X-Received: by 2002:ac8:3fa9:: with SMTP id d38mr42002171qtk.333.1582499464180;
        Sun, 23 Feb 2020 15:11:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582499464; cv=none;
        d=google.com; s=arc-20160816;
        b=RcYVw1FeBERF3MdPYj8AFJmbmyHNmX0Aom/vDviK+fjTWoF4KNb/etXCMRMjJ6xr3P
         4hpbqSbp0cEgyaTPof2Tmq6RXWzr14zR0uBVWE8vPoSgzNg9OfZCETflPatlaFoqwSPR
         jR6ZOybS36lLiGdqR8TMpku4Xrb6owm/pFeOaKFwstZmFrdPUmjJaZXaAqdSFyc5fx7D
         qd8AqaVt9Yw7GGUbkQgaRAC95bafEOmt+c6+effc8KTl3SNlBsvmmw7G1z1bTUAjiIlT
         f0RfaANpcHAUanTaNZJbajoTLpYAwd4s55rNQtkA4k+LfXPYEopDlbUAYYpmjVLPG3m1
         QIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=2JtFWCLlvKrPzw6359S9afKJXhhVBFgj6XfWSRDbCzY=;
        b=JUJ4BSaZrYXHmd+8IQx44YjjRoorECBXSpiDCl5sjDgUxclA8joGg7qCFAzEYQwSAD
         Ig8UnrRxy7wLvy2w4rN7t8DCqOeqdaNfP6kH4Mf67Z8KGqZOQ6fJsfTMBwsZ2F+zvAdo
         zEWyz0iNBHQwiNDpUfFiOaodIuN4DuTNrnSgXicK/WZ/JiCfbfGVKUt0ZLk4mkD/KpJf
         BERB0hF776xfSvCoxqztSEWmCHxfzyz4XtYkk9uldz9Y/FHSaBnH0bd9lBOwVyUylgUZ
         Agjap9HFeiJz7v6fHiKFBo11ezUHtOVMtKUua5qNGjcFcGXKzsCBgk/zAPRu0/1+dSHO
         k4tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YrUzpcxz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c188si5197994qkb.310.2020.02.23.15.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 15:11:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YrUzpcxz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j60Ot-0001IW-33
	for alex.bennee@linaro.org; Sun, 23 Feb 2020 18:11:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j60Oj-0001Hp-Tb
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:10:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j60Oi-000892-El
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:10:53 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55842
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j60Oi-00087w-5Y
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582499450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2JtFWCLlvKrPzw6359S9afKJXhhVBFgj6XfWSRDbCzY=;
 b=YrUzpcxzBkh74z1EKKz8zx4d4GrYOwBXDZCMnj28sCZf4DeUZ3P92psZwMNEKZJKgtT0tW
 I/lqHWrmMUT09JFev70ggiMgq/ugEA4xHPVNASluXlmOnlulZ+XqBUc+3X8Yr5OxiqEX9h
 Z1zoDQ47bcfo+cTpQAkqx7x5hn1meZk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-_GuoO0pTO-GJ4lE2PrmAsQ-1; Sun, 23 Feb 2020 18:10:48 -0500
X-MC-Unique: _GuoO0pTO-GJ4lE2PrmAsQ-1
Received: by mail-wr1-f69.google.com with SMTP id t3so2852917wrp.2
 for <qemu-arm@nongnu.org>; Sun, 23 Feb 2020 15:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r73RMxZRMG+NmOKyR3pA63JKzPvw0kuX26+4+fo0u6k=;
 b=qhHouDOAFDY4nMmvdrK1gDalIlht2GomFdAk9QVd/0Q0x5hlhWm8UjzVUesbRTIQb9
 55i+rN4C6J1pqu1CH3WSOU177uOCc0Zdnx0p9clzDE/ZCWeyvBbRZWE7GO10zFRKzC66
 un22jDwcERfGDfEwGBBtutNTL5Oq3Fgjft0P8YU9IlR5p3a5NxS46+CqQpu2dbGolEuz
 yb7dBZe0zxkn0b7RTXh2PjVjpDUPuT11X+A5PMoMTr4OtF94b1/CfDiKjNQLCCghGw5s
 SEzH8OnMTQDdv/SYHcyos6dyZ9g4YtHBDzqBoiWEF5cDYpouc23AdkqQ9KNrLAkiyDJY
 jUag==
X-Gm-Message-State: APjAAAX1LorB4vGFKQNRN4kCLb2WUr5APBEYIDVcJxAm8TxfyY/sGUWI
 hY/e5Bc4gwHKSv/nKgbzwaQvWJo4WcRQDqrhvzPa42PZC/06/YZk9SdbrLtq9NIkPLKuhfM3s/F
 jJhM5oJZKMLGa
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr18350041wmk.68.1582499447903; 
 Sun, 23 Feb 2020 15:10:47 -0800 (PST)
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr18350022wmk.68.1582499447603; 
 Sun, 23 Feb 2020 15:10:47 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id r6sm15777598wrp.95.2020.02.23.15.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 15:10:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/arm/gumstix: Trivial cleanups
Date: Mon, 24 Feb 2020 00:10:42 +0100
Message-Id: <20200223231044.8003-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CMn0hN3buhqK

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Two house keeping patches while looking at the Gumstix boards,
to make the code slightly more readable/documented.

Philippe Mathieu-Daud=C3=A9 (2):
  hw/arm/gumstix: Simplify since the machines are little-endian only
  hw/arm/gumstix: Use the IEC binary prefix definitions

 hw/arm/gumstix.c | 42 ++++++++++++++----------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

--=20
2.21.1

