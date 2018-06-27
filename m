Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp6302325wrq;
        Wed, 27 Jun 2018 07:39:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdMTn9324WY+WHMk/I++VhfAPAAmioWDf9O28/0SDQCJl5nNJynfzLLtI05iYo3mufPznEd
X-Received: by 2002:a0c:a611:: with SMTP id s17-v6mr5614679qva.2.1530110375593;
        Wed, 27 Jun 2018 07:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530110375; cv=none;
        d=google.com; s=arc-20160816;
        b=zB7/V30KLw9QMnLTL9zkS2+B3BKxCdJa8edtpZ4aClFUupuJW2ZobK1lB4gUntP9El
         VnwXeQnyckrwVOO8FFZxrSJLYqlWteuvOq0ojZ+D4GcmvEa1GLAgE5Ne/q6R0a33rLvd
         2cIwKdkqcd+A7ImG45EysFLDtdjaCPsHH6NBUfATx663pkCoROjULd54B91wTMGYB3Nv
         u5Gyc7RGyjhhifMS9enIh4cXnHG4GbYTQTUIIKSB2MRXluzvH7RUjg44L5Epv3i8KTb4
         FaTW4SR2sJkGQs+uBJUhDs/4XMil+Y42+YQvKKiji9J4zdlisUutu0J2KV5tAnd72KRu
         ejqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=eHuIGU/0eRqJKrVyJV+m6JVRkowoxtsGru3YLticO2M=;
        b=ACqo87x7A8/L9SSG5PubVegMJH3X46QTsgWRLICZG0JNeu3HdS/GFfD2vTz+aXzV/S
         Bt8sDWiE+ZuvWTChxJpQNtaqDaUStqQVRR1wSVJhf8m7wW/DYiK3r0EALDDvEVj/cNHf
         YL5O0clGJWh/PJbBq9vsfBEOqRK7YRMk2UKLXqa4JskLPlwhqNmGvoVjypUY0BKZ6oQf
         fv5PbrvRY/dKG8FLwEAKT+6kfy1yLVReefUpcPRQkR/IqqaC29pUhvJ3Zu+hFJiPlyFe
         WzMAaVELJIa/9kRcV8RusT4l6lb6FkyBkTm911L3APIMtFJVcK+XFJD5CLu+1juBPiiO
         X5xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qqumr0KC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c138-v6si2551507qka.130.2018.06.27.07.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jun 2018 07:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qqumr0KC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYBba-0004ty-U5
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 10:39:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fYBaz-0004il-DI
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 10:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fYBay-0002zP-G6
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 10:38:57 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:45041)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fYBay-0002z8-A0; Wed, 27 Jun 2018 10:38:56 -0400
Received: by mail-pl0-x243.google.com with SMTP id m16-v6so1134886pls.11;
	Wed, 27 Jun 2018 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eHuIGU/0eRqJKrVyJV+m6JVRkowoxtsGru3YLticO2M=;
	b=qqumr0KCbZ5CqepGc8N46QNcDI0M0TJSCxd8QiI3M3voz7+3ZzTgUhB46eULGjCkIJ
	lKuQMKkDVP76oYWza3ZCpiFMFeI7acZojX5NxlmqKYBW/+RWIyYLDrJ9oPfk64KLhN+G
	7PIaAoRb9ygQLLeswcTW37vBEKnftE0u3ct+CFILHrFXC+ckfAtMsr8vyeLdhtxC0iaC
	7YxLWR/cWzjiNBw4wBEY4wd2qw3FTcl6HcHYy4f4v+OjXaqG5UunB88u8aFRavknQHVT
	SlF5LeDS1HB3N7LGrriRuAupnj9x4nb5aUL8n/ypA9bbBXDyJFEw7QMeSDiXmJBSwZg9
	Uv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=eHuIGU/0eRqJKrVyJV+m6JVRkowoxtsGru3YLticO2M=;
	b=Z+KRxjBgfThzgLuy1s57qrPXKpOQX/jenjzNAMv7ZTcLxT3uenxumSrFRjYBsICfqr
	6ulCdlUlFCtg6aXikJsIsISstMkIA8nPwqDJyjttiVhnRTj1kd26hYSuTmSVLbIJbcgM
	vS8HtAf3UwGocrCXJCv8D6CfnX71reeD/2Z1V9bxlsQaZjSgVwEHBnr+AQ43xcczFK/O
	cZZoE7ZmNvz+UQIuT3JARLgTGIx97uxQn0DMnT4wmQ1N6WdqqA72a1lulU45v5042/sM
	yP0RsXZfo4jNBDpNd9/YbynhJ/hCG9UpRqXUTbXBfezRpzGzBEpNXyFJzyfof913fa/s
	M4qw==
X-Gm-Message-State: APt69E3x/Fl1E04mVklENBDh2Z7Q8P+657vvqeu/d9CBNu404SUwQmKt
	vZ+xhtC19I0sDVY1Io77PDEgGITW
X-Received: by 2002:a17:902:7e43:: with SMTP id
	a3-v6mr5752494pln.151.1530110335255; 
	Wed, 27 Jun 2018 07:38:55 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	r86-v6sm7619535pfd.154.2018.06.27.07.38.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Jun 2018 07:38:54 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 28 Jun 2018 00:08:47 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 00:08:15 +0930
Message-Id: <20180627143815.1829-4-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627143815.1829-1-joel@jms.id.au>
References: <20180627143815.1829-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-devel] [PATCH v2 3/3] MAINTAINERS: Add NRF51 entry
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /LZQ3xhIP014

This contains the NRF51, and the machine that uses it, the BBC
micro:bit.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c626f6a079e..fef3d71dbef7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -656,6 +656,14 @@ F: include/hw/*/*aspeed*
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 
+NRF51
+M: Joel Stanley <joel@jms.id.au>
+L: qemu-arm@nognu.org
+S: Maintained
+F: hw/arm/nrf51_soc.c
+F: hw/arm/microbit.c
+F: include/hw/arm/nrf51_soc.h
+
 CRIS Machines
 -------------
 Axis Dev88
-- 
2.17.1

