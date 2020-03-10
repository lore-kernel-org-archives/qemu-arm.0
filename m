Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1241578lfc;
        Tue, 10 Mar 2020 14:51:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtbnXQaIFW0nrJhsqvUBBAYnKfS0oEO2xMXG5aEHRTX5Qwp16ZhfjXYEaor1Ipf9j3Eqs+g
X-Received: by 2002:ad4:580b:: with SMTP id dd11mr271873qvb.58.1583877119535;
        Tue, 10 Mar 2020 14:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583877119; cv=none;
        d=google.com; s=arc-20160816;
        b=W6zB8YjMNg4fujIwxWTc2rKekHQz6Zal8YSVhcpKCe4RRcpgl0SeNJhQMyc/RNhR6l
         sqBa6jzJ8ZxP63/WHa2zuPRCYKg0BXpGGgTwn7QQ9khXvWmy/NYS+bqibeZAuWVkXwXr
         PX8S8BD2w8yfI3VhZTV2mwfdIsulSfK9N5kb3dxLIszNJVxy+objtFg52pemQyZmAejw
         gZIU16gWR2UZayaPlSji3yuqS9xbl5sPMD5RQny1vnGdGu5xWc/pySFFW4WMrJLticDH
         Ux/cn/tr0toPOLYz+dAviNdkr+WrVniXZz0wcleNMRKikONWrbIXFYlLaHPWw5CffD5g
         vsiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=utzyS3UmdZ0hCp124moa/MGYfoU+EGB6ZWqJZIL2aiw=;
        b=of4/RlfYtpKJ8xoH6vb/XkY2K7O0dVi/cUpJjlyD6iBzl6m0/M2vHsqi6M+dYxjls+
         gkrA4T6KmGG18h8RTAxfWn2I0XvrlLBSFV7f1cxhbH8rye3eYGGnG0PVHry30P5a5T0U
         oc7Rm2yLwXufJVLH1ZfJOxqqdbXDEh6WK+mZPyk80zWok4927FbYaL3Lq+A3kci1AwSy
         vd1VyqndiyBai13CJ8vP6tzIT76otT18/BMDARHevDrO8hTE+pD9eQCZDv0Door3fbdg
         gSHocxIunU2/mvNmdlMlMpmJEiOTPV/Yv02GPKBiDDqcNNWb0oLt4uMPJ3odX/SWRZTD
         akzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F69MYuMF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x140si8839169qkb.43.2020.03.10.14.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 14:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F69MYuMF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBmn8-0005Al-VL
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 17:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34559)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jBmn1-00058Q-7i
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 17:51:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jBmn0-0006sT-5f
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 17:51:50 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:40556)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jBmmz-0006qu-V8; Tue, 10 Mar 2020 17:51:50 -0400
Received: by mail-pj1-x1044.google.com with SMTP id gv19so1007329pjb.5;
 Tue, 10 Mar 2020 14:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=utzyS3UmdZ0hCp124moa/MGYfoU+EGB6ZWqJZIL2aiw=;
 b=F69MYuMF/s0xrgiwGXfzFwd5MJV+CfmnegR2bL2G+As6s+4jMtRIHYYpMlkoeuN1LL
 N6X87+L7ogqqgfTmEvT1UWirKUdlntOJ1uugnFzfy2P3mBPS6+MMo06tFLV5Lc5ReamO
 8l+cPgBzYwZc6M8iv9wkiaG5AjqcVDs4IH+lgTt0M5UCEfjuu4GEew7x5VBfiX3urf5e
 cmaFoOdZPaNJs/NWnyClt6H6Yk0IFzuF3fsbBF0EgbMxHsJ/mXZHCqDR+VVVsMoyvr0j
 9LGINRdn5v1CLGtSV+XRhA7XZaqSZ4G8NWZz4CJO9oWFsRqbatrHQdqFuNnXoMx02v+5
 rAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=utzyS3UmdZ0hCp124moa/MGYfoU+EGB6ZWqJZIL2aiw=;
 b=hxKnrmkl14QSz/8W0dx7YSos2HvxbzPRQM6T+6lELUFu+u0zNn09IvBdI3XhJLznWG
 CzylOxBjisR5Cb0NzlcQ+QTneWGNOpQDgTmczkotYClSVTQpQ2HJGWRH4thbXA9RWHau
 bKAdqLQURep7B9+4cT1/B06xr3Z8MHDOKF5+zLJcGrShhqOyhxnwuXSxU/ZoLxT40Xha
 fIgSt4QWpmUSgXwd+mBznC02Dt2IBgZ3bX6EyFOKqXBedkE2ZbTCVwNyYAFGw0eBGPiv
 xhdpD5FQ4W83yuTzYMw+Pk3UZ025TfeK6b9ZEPLotsotwI99boywgC1oVaDyI5p8lhzi
 U/vQ==
X-Gm-Message-State: ANhLgQ1UcRN9bVXFVwwlBujOHrDyDgnKn0/UXRX/d7hmcrHkKkw1ZKKI
 kyM+2wpbQZ1tSWF+CcimkSY=
X-Received: by 2002:a17:902:b183:: with SMTP id s3mr13346plr.33.1583877108849; 
 Tue, 10 Mar 2020 14:51:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id x9sm17986200pfa.188.2020.03.10.14.51.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Mar 2020 14:51:48 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/2] hw/arm: fsl-imx25: Connect eSDHC and USB controllers
Date: Tue, 10 Mar 2020 14:51:44 -0700
Message-Id: <20200310215146.19688-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6yygx5/PKyES

The following two patches wire up eSDHC and USB controllers for fsl-imx25.
With these patches in place, the imx25-pdk emulation can boot from SD cards
and from USB.

----------------------------------------------------------------
Guenter Roeck (2):
      hw/arm: fsl-imx25: Wire up eSDHC controllers
      hw/arm/fsl-imx25: Wire up USB controllers

 hw/arm/fsl-imx25.c         | 56 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/imx25_pdk.c         | 16 +++++++++++++
 include/hw/arm/fsl-imx25.h | 18 +++++++++++++++
 3 files changed, 90 insertions(+)
