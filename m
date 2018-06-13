Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp626097wrq;
        Wed, 13 Jun 2018 05:30:41 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLzAKuEKKMMnoHyqIqVUWBuvEkfTpAAW+I40WvMpAlo999orPucsG40Wq0E0OzgG9BvVNdV
X-Received: by 2002:a37:78c5:: with SMTP id t188-v6mr3959956qkc.283.1528893041612;
        Wed, 13 Jun 2018 05:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528893041; cv=none;
        d=google.com; s=arc-20160816;
        b=JrPRAh+H6LB8A+Tn8skEfLEcOEMyYyYIizNMTMfZEQPmO/BSL6QpJqwcg5vFc/nc1e
         7fW6WwiM6XvEA1vHdrBNAYLBIRjY1oBKT013OkuvxFY6JiAJENcMgCB8Cfylx5cgnT8B
         uCB6pnB1vkOc9ZvyDc0XrtxL6jCeqMPoqRA/B1NVfJgpnKw9L6icedP9Vixs3HZtClKr
         zNPF1l0Sc4VFl/UkzGRngvgStDacF7hUjUWcC7/I/+FMmsnRch+XpNReLNJ4uKNiH4ud
         iCXnThcorTcHCcmtupOoLBER7y5HJrm5G5xU0V+e0Hu6n4MUQhh6MpXLTVddFcEbljo9
         TngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=iuxudnqJXCSPDtR7OryT0XG20mPwQl5CeK/v2smy0zw=;
        b=zGy/KZfpTtP05VrXVKP43gE9u5YpQmvwrF93Hz4+G7m1riPoRWoLwByf8rYs1HcEJB
         2xVm2E2hxm0FCbrRNP0b0BG6QwEgylgom0nnXEkaE1qAB4rUOlq1iW0EhBs0XhRKiwNJ
         K6ZAn1oFN18GDYhi0Xln5TmXyPS9ngdfZbUPAMov9hHETF1/BH/b2cAYNxPgxPNCKsUd
         FHBh0h7M+zL+popFrstdgASSpEHVeEzPXg2uBcrDGZNhpApbnxHMDpWaM6K2ZX5/XfFa
         KqOQYVhib4xO7kAKuPj/7P5MK9Kcao2docz5p5MVWjl0nb5DJ0rjyK30wNzW65rPkgVR
         fW/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u17-v6si1966541qtk.156.2018.06.13.05.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 05:30:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT4vB-00030E-3r
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 08:30:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fT4ub-0002ya-Ie
	for qemu-devel@nongnu.org; Wed, 13 Jun 2018 08:30:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fT4uY-0006OJ-Cr
	for qemu-devel@nongnu.org; Wed, 13 Jun 2018 08:30:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53108 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fT4uV-00069O-0U; Wed, 13 Jun 2018 08:29:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E7038185331;
	Wed, 13 Jun 2018 12:29:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A3541117641;
	Wed, 13 Jun 2018 12:29:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 1E962409E4; Wed, 13 Jun 2018 14:29:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 13 Jun 2018 14:29:48 +0200
Message-Id: <20180613122948.18149-5-kraxel@redhat.com>
In-Reply-To: <20180613122948.18149-1-kraxel@redhat.com>
References: <20180613122948.18149-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 12:29:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 12:29:58 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v5 4/4] Add ramfb MAINTAINERS entry
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 58QM4UrbkAEW

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a94517e9e..2401028766 100644
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

