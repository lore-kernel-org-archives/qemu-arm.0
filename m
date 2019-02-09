Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp299806wrq;
        Fri, 8 Feb 2019 22:53:59 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYquc1FfBu8QtaOrf3T0Zy4LgH/aMJz6/W70DtRjZ7mVTYteUX/F+nEuUUbyTt6We2BkFTZ
X-Received: by 2002:adf:9226:: with SMTP id 35mr19280298wrj.61.1549695239514;
        Fri, 08 Feb 2019 22:53:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549695239; cv=none;
        d=google.com; s=arc-20160816;
        b=vcWgZqCaAV9YfSztFa/rfpGOqL86NIuQJfJbh0X+J+v27BKp575ozcc309i9BC+nw5
         jv+8J7hd3hAOYEhbYoG7AAdDNG9w7YCpGuk52sj8JnFAfYSa2zyJZv4BFx/QoWIW5Kl/
         VMpQziEgCyQSTd6x/CXzJVpe7gaOFuAmuqrbMBC3g477TuYJvdryGQqocyosZB1LTD0Y
         vK9cCL+mrmzUKMqCnTHNOZKKOXTBVXjJwFEWn0hQ2DvEhjtegjo27aay3yWSy/rnKeYo
         jG4OJX23HOBgTppSmXKDo3JD9BAm6dWfi4y/cpKLlu1ToNycF7FnE4/L4LqsflgPmIPh
         899w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=GkOrr+VGPFchERrz7/umGS5sN6CpNU/LksBdqCIe3w0=;
        b=X4Ux5w+++U3971pQo6y7HhdrZc3TB+5GAB+nocUXCpEZbXXlmOHNJvkfMntt+X4oM9
         bVz9yDWvzT0K895dwF1JT1qf9mUmKAHfgqQhpAaWtzNpYIrYbRblVgii+YK7atE6R2Fq
         i9dc8tslf74YdnoyyeIjFJ0yXxOobbGbWgmqAYFp0TKoGvwy07F+fGXBmE8tlU/eg3sW
         mEqweqTCVf9ngMQAS1bLGeCFquTj21PVwaRw4xNwrTgRMrQoo3WpBqYgD+TUQj5k03b9
         BjrD7juYn5kC64t13K8Pg2ryIVSR/MB2Cv/Shwmh+Y/+p25iRaF6X13t9ucblJ09upaO
         NBgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si3017115wrt.83.2019.02.08.22.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:53:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMWU-0006iK-Ho
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:53:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJt-0004XJ-0W
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJr-0004Xv-SW
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:13111)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMJn-000421-Nd; Sat, 09 Feb 2019 01:40:53 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99C8C85A03;
	Sat,  9 Feb 2019 06:40:28 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B17CD62662;
	Sat,  9 Feb 2019 06:40:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:23 +0100
Message-Id: <1549694366-1284-23-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sat, 09 Feb 2019 06:40:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 22/25] hw/arm: Express dependencies of nrf51
 Kconfig
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
Cc: qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lHkjzAHi+Cwd

Add Kconfig dependencies for the NRF51 / microbit machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c4b3cd2..aad2dd3 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -379,6 +379,8 @@ config FSL_IMX6UL
 
 config NRF51_SOC
     bool
+    select I2C
+    select ARM_V7M
 
 config MSF2
     bool
-- 
1.8.3.1

