Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1036793wrt;
        Tue, 27 Nov 2018 01:34:40 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VCZqmE+cJ6PCn9g8aWsdfo9kYtpNTxP/ygEOPM+GK59HjeEcxhPCw6tWzG+vXVF3Ndz8ez
X-Received: by 2002:a25:2b05:: with SMTP id r5-v6mr13748647ybr.81.1543311280228;
        Tue, 27 Nov 2018 01:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543311280; cv=none;
        d=google.com; s=arc-20160816;
        b=o6DnyePP2MtYzFuyCbXjUiRFY9pnX38d2vYXO0QNT083/dB0YKkF+XwIS6kL6AQesn
         RZqJpXppEurZgl5hKX/RerWYJeG9OlLUVbfrsUs5cYj4tgx1vHfE6tqFgkFankx8DbjD
         mBq84CTdP2jki0k4E9LZpw+crqe2Hzzft2Qwv0PRi8NmKbkWpMNeGpjkReAHhJJgFHFE
         Vdr5pOfTTg2oKhOH8VjS+hma2mrbgq0RSU3Z5nBML+beiD1zT3I854NRMIkQ/r5VWTVQ
         WiAo3e7HIvna/Uaqb3f/ZMtwGLC+hnwDuPcrprnOudaY0MsYJ+YUqeR3rjNG7a/Elpzr
         8pyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=BvSB5oVXGMZrTWlt/WAPExGiyAAIUguvOYWFdVNm7iE=;
        b=Mw8lAXgqRwcfzzWVUwrHIESsIhbI4JQYjyq9uNpgmTfu0X6DZGyduF6GvABATrdq+P
         uSbKDQLcmyjyvgM96CkfkbCiQtNNSDNLYAPrXEiMqRm7PhP6p/FylB9PG7R3HWWxXhnm
         KPYq5Y4M7RMcaGsepHb34vhoTp762n+WXnuEdIBIoPWNwwvNlfRGxF82uOhMKo4/OMyx
         Fz51ACH9YJKUCyVJF4mXCw/MLzklp2K4Y7/X+1SYKWH4DuyfDXo2nHS2+Up3XuzpEJg/
         Z+fVpvIUMxQxpK2S33vVQoHeGC/p6Jxb6wyrAi6tnAhc7ViG8NsAzy5NcNGVoYtFLq1w
         0oKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k204-v6si2209806ywb.115.2018.11.27.01.34.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 01:34:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRZlP-00081q-JS
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 04:34:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gRZgD-00032x-Jp
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 04:29:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gRZg8-0004e3-Kk
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 04:29:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52668)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gRZg4-0004c4-El; Tue, 27 Nov 2018 04:29:10 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B316580F83;
	Tue, 27 Nov 2018 09:29:05 +0000 (UTC)
Received: from localhost (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55D1419C65;
	Tue, 27 Nov 2018 09:29:01 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Nov 2018 13:27:41 +0400
Message-Id: <20181127092801.21777-9-marcandre.lureau@redhat.com>
In-Reply-To: <20181127092801.21777-1-marcandre.lureau@redhat.com>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 27 Nov 2018 09:29:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v4 08/28] net: cadence_gem: Remove
 incorrect assert()
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
	mbilal <muhammad_bilal@mentor.com>, imammedo@redhat.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1MdLuMz13mV9

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Don't assert on RX descriptor settings when the receiver is
disabled. This fixes an issue with incoming packets on an
unused GEM.

Reported-by: mbilal <muhammad_bilal@mentor.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20181123135450.24829-2-edgar.iglesias@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/cadence_gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index d95cc27f58..7f63411430 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -979,7 +979,6 @@ static ssize_t gem_receive(NetClientState *nc, const =
uint8_t *buf, size_t size)
=20
         /* Do nothing if receive is not enabled. */
         if (!gem_can_receive(nc)) {
-            assert(!first_desc);
             return -1;
         }
=20
--=20
2.20.0.rc1

