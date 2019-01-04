Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp693525wrt;
        Fri, 4 Jan 2019 07:02:58 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6Tg8vnZpN2+Hr+2Lxfmbec74KusfaaosxByTJQfjTFqZhfiIjPsbbNCB+xgMpk3zQcmIDb
X-Received: by 2002:a0c:c70a:: with SMTP id w10mr50743660qvi.143.1546614178393;
        Fri, 04 Jan 2019 07:02:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546614178; cv=none;
        d=google.com; s=arc-20160816;
        b=amrgvq/T59rxNH3UOMxTVyS4s1Zl0PHLnWLM6OwIV+buCY79VMcezjnemMr/WG2PtD
         Xr55vDhJrZnq8ZX4ZPJpu4NHJXC6DqltGLuM4AnnOfhAQNUc3A0ca0pTJhFE/GRjyI0B
         frwct5PvdWBwUd3cclUpsbv5VOQyr6rvOVpk/3R1AnxiXXDs+0yFERf5uFinQOYYTePd
         MaLADo1q7iy+CvDx+DYgJ15rjag+CDnSibH7jLVs4Yjc0Rka4/lCmpqE8iQZu+1029sU
         uFZIAvkHpYPfEnyyfT11d0r98nvGlcimk69/22QWWCiRFT0aPjsROGo66B6619t7I7QY
         iASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=+WC7TLyWkA+Qi0UXRgVgiSRlF9NnVzSAAN+uYuYMqw4=;
        b=kn/Cqmx1MvpKvt0dEE1UYXDCr3/V8fthIxSQRa0cVVwWsCNicoPJG3fHDwVqZAwhz2
         fxK5NOb8mdDW0sVlm4cp6g1cY8H3mOGVwP8ma4yBKUgB1YDlwCtiDBre/bhOcFNSyRxi
         0YFr7pmX1Y3zf9DFlZPtjV2X/TRRVazaHrwl9okagWrsgGgs3CDSgnBEZPQP4OveX22O
         DXDiNxqoniK2ULLd61yARFJ0h+ZCrDRLGaFRegCsCqlxAmZLNzhJWihlNS7B6fkcijZQ
         7y0jKqNd/08ltWKzfeeXRXPpwP0GNPVBmX8uJVwajBhfjaiyu/blNABNSpiYOpRIyq1j
         9QkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h34si6199337qtd.155.2019.01.04.07.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 07:02:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfQzv-0006Ay-PO
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 10:02:55 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gfQzh-0006Ae-VP
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 10:02:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gfQzd-0000oA-1a
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 10:02:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gfQzc-0000nP-SE; Fri, 04 Jan 2019 10:02:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22E6C7AEB6;
	Fri,  4 Jan 2019 15:02:36 +0000 (UTC)
Received: from thuth.com (dhcp-200-199.str.redhat.com [10.33.200.199])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09C9D194A8;
	Fri,  4 Jan 2019 15:02:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri,  4 Jan 2019 16:02:26 +0100
Message-Id: <1546614146-10525-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 04 Jan 2019 15:02:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/audio/marvell: Don't include unnecessary
 i2c.h header file
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4qE8OEFu/8hH

This device does not use I2C, so no need to include the header file here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/audio/marvell_88w8618.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index 6600ab4..035dd76 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -12,7 +12,6 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "hw/hw.h"
-#include "hw/i2c/i2c.h"
 #include "hw/audio/wm8750.h"
 #include "audio/audio.h"
 #include "qapi/error.h"
-- 
1.8.3.1

