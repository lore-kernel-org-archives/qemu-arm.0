Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3720747wrq;
        Mon, 18 Jun 2018 02:58:18 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK3G6f3V0l07gatDan6NOEqj+M2uvC0Akeu9QHQQ61nqGhFBQM11oKYZFk8W6kHhMmgHGSW
X-Received: by 2002:a37:1399:: with SMTP id 25-v6mr7656184qkt.83.1529315898490;
        Mon, 18 Jun 2018 02:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529315898; cv=none;
        d=google.com; s=arc-20160816;
        b=MKSbq4Oku35CJfSBPN6vM7ePr2CWBjsmp/3AYP9nV3nHY5iOGyfQVJY6IoBTYpo3GB
         rikmEWvIvrUlrFv7CTZUr+1Hiqnt3GXVG6aRrPBO1jgNWMfja6/rtfqY1VWD7dfYTfpj
         rNWvI9NCp4WoF1exjqCe6IuugeHKZeGsC99/cusla4RMrn6dzRX/VffKy8G8y6BsfRlb
         5X2YnAMjV4AgXOwY36H1p1shvk4dXF6qutFwVJ7qg+zDgi+yIvt0pg8lUWdSrTn/ZJzZ
         EVccmqdAoz9fTiGo2dizQ/uBpqCATYpF9yLPB2uYx6JlE8t2a9pd/FtBFM6TcBl1Hunt
         18Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=VdBwEscpEtzAtQlmxtP5s7JsnnCDbGvMF88G5Ki1WNE=;
        b=Z/ZAwfLZt764KIpqQY1gX3cOta/dSf4Kq8AVo7kkiwk09ioPNDRAm/f+6dOflULjNp
         77FNQAkQtOt1TdysNSOSSylMJpQWmz3MSiVrFdY0aog9Rgh7jGYeSAvZi6aKjt6vlWzs
         Gglf5l2WNgJ21WS2dtiuTlY9Qi2G9oWVWLSsPoGIbWOvBOtFiPDiUVKMJBEydyRWsyzT
         0d1y1dIpGeZiQMEMz75fFAEe/WyHKcTd86/syCzops2Dh6wcdzgXBAVTlrJ8ucpXDNHz
         bh+WUwlh41u8ra9v2hVqK3BNmjn9SJqEzhXky1X3+PQGcIvNzftukki0urNNBchtIUiH
         7Onw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y81-v6si1169732qkg.368.2018.06.18.02.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jun 2018 02:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33726 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fUqvS-0001KC-0C
	for alex.bennee@linaro.org; Mon, 18 Jun 2018 05:58:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fUqvD-0001Ik-T9
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 05:58:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fUqvA-0003IB-SQ
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 05:58:03 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57142 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fUqvA-0003Hp-Ny; Mon, 18 Jun 2018 05:58:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D222881663C3;
	Mon, 18 Jun 2018 09:57:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 503EB2026D69;
	Mon, 18 Jun 2018 09:57:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 8A5D524EF15; Mon, 18 Jun 2018 11:57:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Jun 2018 11:57:58 +0200
Message-Id: <20180618095758.5006-5-kraxel@redhat.com>
In-Reply-To: <20180618095758.5006-1-kraxel@redhat.com>
References: <20180618095758.5006-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 18 Jun 2018 09:57:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 18 Jun 2018 09:57:59 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 4/4] Add ramfb MAINTAINERS entry
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k8y8J656mYxH

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Message-id: 20180613122948.18149-5-kraxel@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fb5f38f9f..da91501c7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1331,6 +1331,12 @@ F: hw/display/bochs-display.c
 F: include/hw/display/vga.h
 F: include/hw/display/bochs-vbe.h
 
+ramfb
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Maintained
+F: hw/display/ramfb*.c
+F: include/hw/display/ramfb.h
+
 virtio-gpu
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Maintained
-- 
2.9.3

