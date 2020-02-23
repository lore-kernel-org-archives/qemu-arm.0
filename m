Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4421848lfg;
        Sun, 23 Feb 2020 15:27:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqya6DKngSXUx3LStuNE6bXycndYg7+e7oYjstlvYmbK9jvnY0oK5hJnwGxV6kcfOIGhF1n6
X-Received: by 2002:a37:b5c1:: with SMTP id e184mr48989444qkf.189.1582500424239;
        Sun, 23 Feb 2020 15:27:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582500424; cv=none;
        d=google.com; s=arc-20160816;
        b=qQv3+cRsUu0MdQbVr409AnqFF+77WqYjLft04yJXX/e2TGAJfZ5Um+HKG+xRYtcFuI
         /ooySNFS2EzEGfyVI1/K+JI1xSr0NB/NZycOiViOxQuukqxYipBXxr3idKSV8Pa2jd74
         y/b4yU1086xAnklTNcNTCyfzJ9crLGE3B51kP2GsAOBqdDzm4uDX1QTjpSuqZh5VGhPt
         MFlrzPWtj8fw4JZ8crlFETYc/zfhYofunbblSM1W4ZY5Tm/YBa0UDa+7zUb0uC31o5Kr
         0GclrfH2PZfuqwGAacTcqCpXqm85XvKE8CN4Z/fDZViWpV2rGAHQ1U5ZYkBM57LI0cX6
         Iedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4RA2RXjVvief1/X+N/X14XUkKx3HWkHABgxWL5qIrf0=;
        b=Wz+ravNWfjswOz7xLXlyq6HmypquHDWq4OvvGfHIyyVWR0uT7rMCUVH9omGAz4TPR0
         p4xHqKxeEoghCI6MluOxGuSIqCFh83m2qVJhQuNY7L4CswsSgYctd3UeWhYVSxUWEIlw
         ZediSsIahFm91VRncdw0gf+MbxK4hPD5tDJEi9OVNg0ssPFhD1hm6Z4utf3ah4y13NwS
         Xm7Y/zcI51KgLPREMdXVSW0DKQpcNZAva20w75D2qQemyUOAnNJhk49pxvEK4eTmVZIT
         SrTJgDrS3Oxk8iTXDrIAS7i5Spya4f2C+BJ8lPWVl+4fxW0xNPFcQM+RZu5DAWtVg1If
         WH8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CjQ/0QnY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19si5151086qtf.272.2020.02.23.15.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 15:27:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CjQ/0QnY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j60eN-0007rO-MT
	for alex.bennee@linaro.org; Sun, 23 Feb 2020 18:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j60ct-0005mK-Ap
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:25:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j60cr-0004Pw-85
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:25:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29075
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j60cr-0004PK-36
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582500327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4RA2RXjVvief1/X+N/X14XUkKx3HWkHABgxWL5qIrf0=;
 b=CjQ/0QnY+yLza+qIV3iBXVJoKKbkYAxSYN38tcmsDsDyqGjWQtVlD2TZBjcIrmPeKznrqz
 MlJeY82PAknjcUPr2VH5OJWoIpKRMB040BjgTHJ68dQF1uqcFerKyUw+pJ1GnU4j9viPrv
 c0acbZ6yHHZrVORGXDP0JdIWQj19GBg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-3So6XZIWM9usrb7tAqf9vQ-1; Sun, 23 Feb 2020 18:25:20 -0500
X-MC-Unique: 3So6XZIWM9usrb7tAqf9vQ-1
Received: by mail-wr1-f71.google.com with SMTP id n23so4641352wra.20
 for <qemu-arm@nongnu.org>; Sun, 23 Feb 2020 15:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jQfvOcsnThQ84nK0vy5Vkt9YJVQSFCuJ8L7E/yhcLcU=;
 b=OZl657jqm60XF5Eeob4NHegZyZ8KS47s8l1oqOtTHghV0RN4TpckQLaZvOnH7LvAJL
 /4iohyqmuNL2Pr6jer6Dwk8/WpOnV4UgD/S0/MZbC06SFnKeYb/tX5BWEmuZE4BVTjQZ
 96moOFGYYWSeC5eHg2SGZn+6wy5CJMZ8dHBMsRJ/eCU5YbNB6TeRTO24QOLJ4t8TAYEc
 0x/nKmyI5HrqUvC5PvP/avKA17wPZVOEifhPMYjRuweRh5LBFPcuqqfXrc0OeJ3iUUcz
 YEZSOpCZJoZQ8Yq1CT/fLWrVXOOdLrfbXtXCvceWWWtKwPh37hNe8kJC7IFVQb0JJlig
 dEig==
X-Gm-Message-State: APjAAAXKHpgKjF7mqHIXyqepxoaq2SGmxZUxarFMDij3jU02FSEMZx6f
 SX2qh2He8jsm6am8zY7dwvyOAwSE0wcbfIm4/tLy9JQk9Zhtw6Kpc5KmCCoLL/iZhKzC3SnBQ08
 laIEyse0B5t1g
X-Received: by 2002:a5d:4dc5:: with SMTP id f5mr64411060wru.114.1582500318816; 
 Sun, 23 Feb 2020 15:25:18 -0800 (PST)
X-Received: by 2002:a5d:4dc5:: with SMTP id f5mr64411045wru.114.1582500318622; 
 Sun, 23 Feb 2020 15:25:18 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id c9sm15671102wrq.44.2020.02.23.15.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 15:25:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/arm/integratorcp: Map Audio controller and parallel
 flash
Date: Mon, 24 Feb 2020 00:25:14 +0100
Message-Id: <20200223232516.13802-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CLM2KiMNFzYQ

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

While looking whether Thomas's test patch [*] requires a respin
or not, I noticed we could complete the integrator model.
Thomas patch still applies properly ;)

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg675828.html

Philippe Mathieu-Daud=C3=A9 (2):
  hw/arm/integratorcp: Map the audio codec controller
  hw/arm/integratorcp: Map a CFI parallel flash

 hw/arm/integratorcp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

--=20
2.21.1

