Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7781176wrx;
        Fri, 22 Feb 2019 23:49:47 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibf8ZrOcfwfBtZyIrP7vghOPrOWVt0GM6ArIJiS3gTYwKQwY4613XVZ6qeuRBVU0kkD3sNM
X-Received: by 2002:a81:7446:: with SMTP id p67mr6454539ywc.233.1550908187674;
        Fri, 22 Feb 2019 23:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908187; cv=none;
        d=google.com; s=arc-20160816;
        b=BkaG55QdRPcOT+530LxR8S2AL9N5UZKRcysrch94tZCQFfGvbzK9W19oXL8bEtFQAk
         gOwGkaNM9PsrTm+zzjgwmtNClv7RAAV5hOTW5TCucSd9wBFxfXI/QB1w2xf2RIzhUSKw
         Gnkat1D8I2ZON0BGT38WjgtOWs0BvreFCpw9Ti+qLXnrErEtZ8c3ScPqx8bIyLVhZ0UN
         /AfPx9GoaPiFo7MEoR7b9f5wsS2O/djmQGN2tZxpbzivLDZ1kgiXxr4KPevsMIxoyXCU
         qI5dUxbWAQG5UnIL7pMWHb15qdl8QsgaGLqk45cCxyt07PoFRMBa3d44SJCVOppPsFLi
         Am0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Hn4exH6ZDEJFW4IRuqF0LiKOarX/VjfrfzwwtAQO6LY=;
        b=aul66tgtR6qFt9rL3iLKDD6L8Hux/UmhsqtPAZCGeiV+j6BJ+u9efkRkqCOm2CYivg
         yEZvyzxelf+RWeRxRK2Gt/TGG6Ef2dv7SZAm8F2x9SS5/YWqDAxjRW+HK5ds6VKlnhLR
         8GmsAROudbgF5b6G772q0WgZwirOY2c3oQQ9YShLcaITsDv6+hxvbr/5L1rpwZVCbGsD
         lAbQIouZzJwhEuUXnBkjd8JzV/djeYU6k1bLLF3m0r2wnAss3XDleqWTJl7CcSvYNemV
         x2mLtgzPWhSWGkfxsKkS9xkWGYWQAA28vyYxiHEXgkuNgfVL7s3m6gAKvlQS2yKzlcDY
         xJXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si2080329ybq.96.2019.02.22.23.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:49:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxS4B-0004Pj-2h
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:49:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS3y-0004Nt-R6
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS3x-0001jz-Vj
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43658)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS3w-0001h7-9O; Sat, 23 Feb 2019 02:49:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F0A83082B52;
	Sat, 23 Feb 2019 07:49:31 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B65FE5D9CA;
	Sat, 23 Feb 2019 07:49:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:48:53 +0100
Message-Id: <1550908162-22644-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Sat, 23 Feb 2019 07:49:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 01/30] hw/arm/Kconfig: Add a config switch for
 MUSCA
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aAgPm4GcsAYJ

The musca machine has been added recently, so we need now a Kconfig
switch for this, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 I assume Paolo will add this config switch to his next iteration
 of the Kconfig patches already, so in that case this patch can be
 dropped / ignored.

 hw/arm/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3176680..ac5faca 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -18,6 +18,9 @@ config INTEGRATOR
 config MAINSTONE
     bool
 
+config MUSCA
+    bool
+
 config MUSICPAL
     bool
     select PTIMER
-- 
1.8.3.1

