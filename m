Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1798764wrm;
        Fri, 11 Oct 2019 23:54:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVL2bimhp/em8vFsJ3JFcVs/GhqFACwa/k0d4fjvV1zpAkXek3OvVzJ90P+snEnr0hXYfs
X-Received: by 2002:ac8:6783:: with SMTP id b3mr21852281qtp.25.1570863290458;
        Fri, 11 Oct 2019 23:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570863290; cv=none;
        d=google.com; s=arc-20160816;
        b=WzicPFYKBjIQVqaP0e3KWy89Pyidx90Z7H61bqwQh/wW/29nFNzRbpzmW662gb1qU0
         Jmeo+AnQI8K8KMK4H7FWpmwgdIrbCdE5LZ7030YlEjrkHZ1QuWjb75HZRVdFxVKGwUAs
         FH6Ah2wXkCkBdvHW/er40T8qPeOgicLwQSJK2KIGfQav8zYmMexNfu9AxJdU9xf6/XMi
         1AJ4F+FQ84O0fBTE5uXuLjK4MNxMMJTzbqPBuFHt7QNfCRaw/oMm8gLU85t+4DgUz1Im
         4gY/6sl5Ot+WCkNmOWcjZrogvMD3N8FHdvCo7858rs13cLWD/P8DU2IKtYQZuMzaKiT7
         7pvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=dStF/lege5rAzW0SFax7O/GUWyh2+/seaOLfhwfADJ8=;
        b=vRyif8lNFiIUb8BLPWKpkcd6r+T+yv7jRCDdt20tKhvj24QnqsFflbfDZmYQMwrdx+
         ORlTAWgeNKKyYxHalORQ2TjgmHUKAnfleS/rrTmIiQbbLTik8nlQpNQR+HAbPGgOB+sg
         DZcR0XRg3EswFHX1+nsTWxO6/XrLyXlcdMlOjNBR1ILx4D5IQnZrVrNdIbStZ9SRnwsI
         09wrUYqsD9cqcLIe3LRsM+Uqn+pdPdG6ynKqX1HZEhl8vjprYvSs+vc3FfPjXCFCxjWU
         N9Qz+Gfp7WdHETrBkekbMFS4MyWr0VC6yRYHoUNHI7VBBg4z9Iw68IUE1ZErKKEGzUxw
         pjYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n36si12139998qtc.182.2019.10.11.23.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 23:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iJBIf-000464-9Y
	for alex.bennee@linaro.org; Sat, 12 Oct 2019 02:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46877)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iJBIU-00045r-7R
 for qemu-arm@nongnu.org; Sat, 12 Oct 2019 02:54:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iJBIT-0006FR-Ai
 for qemu-arm@nongnu.org; Sat, 12 Oct 2019 02:54:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40040)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iJBIT-0006Et-5L; Sat, 12 Oct 2019 02:54:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 53CBF3091740;
 Sat, 12 Oct 2019 06:54:36 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-46.brq.redhat.com [10.40.204.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 586F95D6C8;
 Sat, 12 Oct 2019 06:54:34 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] MAINTAINERS: Add hw/sd/ssi-sd.c in the SD section
Date: Sat, 12 Oct 2019 08:54:24 +0200
Message-Id: <20191012065426.10772-2-philmd@redhat.com>
In-Reply-To: <20191012065426.10772-1-philmd@redhat.com>
References: <20191012065426.10772-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Sat, 12 Oct 2019 06:54:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y5/Z4pS1AXUz

The hw/sd/ssi-sd.c file is orphean, add it to the SD section.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ca814850e..47eae9fc46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1445,6 +1445,7 @@ S: Odd Fixes
 F: include/hw/sd/sd*
 F: hw/sd/core.c
 F: hw/sd/sd*
+F: hw/sd/ssi-sd.c
 F: tests/sd*
=20
 USB
--=20
2.21.0

