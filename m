Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7222076wrx;
        Thu, 7 Mar 2019 06:43:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQpFNvWPAJObBSRpGGNu2WEpZg2V3KjA5uyrSzOGOd1EUQCOSDZRq0l+6DU3fZ5aJZzrW4
X-Received: by 2002:a0d:c544:: with SMTP id h65mr10216530ywd.35.1551969805518;
        Thu, 07 Mar 2019 06:43:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969805; cv=none;
        d=google.com; s=arc-20160816;
        b=FApM7gtPEHdqet2h5w+0TeG8/bfCRIEAZjvj/kGiuCAaJyNjED1Aq24pjmquzYaaDP
         Wrgb+8TFh5XK3PbqrUjJVWJlgY+13085oGimMx13lsg1Enptn8RpzhX7aGhtGKogVc2m
         Qc1pKuGG+9bhQO9ScJd+Q7f2iEcPEVdBelyksFtjSJUz+MDBKf+xVEm2jTby/ZzIupvl
         CvCI8qcFAPHm5FL0AsggZ0bHB5nmaPb3wwd4yAB46+YeXP3uij6ahYqcUixhYtBAbQmV
         CjBQc4oTQIQAmq2NsiFnrdHRPEiTRmj/i8M+auAq3CzDfOXy7I8VWRmvx1i+ccGIbrOH
         htBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=uMnfloeqlfTA7eKuFqoy+w2Pz3igFh67uNMUKd0K3tA=;
        b=CR9cI72oTOEjMz3c5RRHH4JNW9gAQzlVgwJ9qAvDRC+VzWk2s/HjqB1Wd9gfcShF1n
         ec+p1sBAVsm9vAVRaEXypcTOVRXUipdv+7PQh06DSjToXvhPIEjryJaP4OV2rMz6SsTW
         0Mwj94ti8GEyYEbbjQpilMO35VzuMNydcH50R7RTl5oQW3CnIcPbSQ+tQVieYHJx+uuJ
         Tsy6z3f+S0pCXVxfPuJuFwhId3LW+wfh6XlZMVSSPXSyK3ttxr27CEWBmrBeo5Q9+U1t
         bWIiq+pXnQa72I38d2uKpWiQAt9VcRj35ptVxwxOCi1wXm40n4p5Yhi35IMhZmhS3OJ3
         fBBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si2698404ywd.413.2019.03.07.06.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1uF3-0008CD-13
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:43:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tv7-0007UY-B0
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tv5-0002lF-3u
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tv4-0002k2-BW; Thu, 07 Mar 2019 09:22:46 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 874D230718E9;
	Thu,  7 Mar 2019 14:22:45 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40CC35C1B5;
	Thu,  7 Mar 2019 14:22:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:54 +0100
Message-Id: <1551968334-18982-30-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 07 Mar 2019 14:22:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 29/29] hw/arm: Remove hard-enablement of the
 remaining PCI devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YNSBgjrjrPb8

The PCI devices should be pulled in by default if PCI_DEVICES
is set, so there is no need anymore to enforce them in the configs
file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index ee95cc0..6b1f6a8 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -33,14 +33,6 @@ CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
 CONFIG_EMCRAFT_SF2=y
 CONFIG_MICROBIT=y
-
-CONFIG_VGA=y
-
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-
-CONFIG_PCIE_PORT=y
-CONFIG_XIO3130=y
-CONFIG_IOH3420=y
-CONFIG_I82801B11=y
-- 
1.8.3.1

