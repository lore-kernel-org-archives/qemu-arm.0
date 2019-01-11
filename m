Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp194406wrt;
        Fri, 11 Jan 2019 06:23:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5ZQ073t4AMcp/36uNFs3J0URdmnPEvK/31/aG3P8bciGNOweuxBi96nKnHaWm2U4uqnSaQ
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr13292005wra.282.1547216587907;
        Fri, 11 Jan 2019 06:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216587; cv=none;
        d=google.com; s=arc-20160816;
        b=HNw7ytFWg23x4yDcB89auaxIixi+r4jnmK7zyWHA/D8H5CaEIC6fFUzzk7kMekuJOS
         WtbPdbEuK2amglSEZO7xO6rS71XnZrxXFrmianyxn+tU+wS59o7JRk5TSfoltdmXYcqw
         KyxtXvYnsor283pn1JQAP6gxEz5NJsXU1pierzdJ45v0IEATmt/GTulhwZSffqnGg+Ib
         J6gusLBN/RXqUbIkrTdl8XJlKZmea8K80FXz19NKSq4MXM46YGgYAol2bKbC9NPUg1/l
         pMJICxsCdtXA7VWyYr7eAKI4YRKsjif2zH82sqmeT3me6jSRH8C/j2le3njOkwP1GXHp
         Dung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=9Bk3/7k+2eQjmrWp22N+59TN7+76/peagraf2frWQW4=;
        b=Da5y2MS9Gahuk3Qqjl5OzHm7v6JdH/nUJxyycr5mdk6jS/Acuzbc83wDDAgwHgSquw
         5WHafQU5UCjkR1rAXT24LDy+Lh64mHnzEsU5CJ+Bc5sefqppOKP94DjMxtiw1yJXfT6+
         ttdINJ8nT+pvqOdzSuy3WZJbx7awjgM06/NhxI+oqMWRwAHn8ontVRN1qZQ9fj90kre6
         rforyIJvkzcumkZcz8FFrJTy2kKrgf6jq7Q2hqLQv2ebNklBZJZt5j+/vAA+omkY8o9x
         ZKa6r2mQZglUHp2OmqG8hX9J6p3RHbmDxkyWBAZgniD7VeTzDWJbX77npTO8U/PTK7Za
         UyTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r205si13135131wme.174.2019.01.11.06.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxiE-0000op-TP
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:23:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxdv-0005j5-BX
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:18:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxXP-0006cM-Su
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:11:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43926)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxXH-0006EX-7q; Fri, 11 Jan 2019 09:11:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 716F8C059B8C;
	Fri, 11 Jan 2019 14:11:44 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7040C5D6A9;
	Fri, 11 Jan 2019 14:11:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:53 +0100
Message-Id: <20190111140857.4211-12-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 11 Jan 2019 14:11:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 11/15] audio: Remove AudioState from
 "qemu/typedefs.h"
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
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EuXqZcatWgJV

Files requiring AudioState already include "audio_int.h".

To clean "qemu/typedefs.h", move the declaration to "audio_int.h"
(removing the forward declaration).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 audio/audio_int.h       | 4 ++--
 include/qemu/typedefs.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 244b454012..6c451b995c 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -191,7 +191,7 @@ struct SWVoiceCap {
     QLIST_ENTRY (SWVoiceCap) entries;
 };
=20
-struct AudioState {
+typedef struct AudioState {
     struct audio_driver *drv;
     void *drv_opaque;
=20
@@ -203,7 +203,7 @@ struct AudioState {
     int nb_hw_voices_out;
     int nb_hw_voices_in;
     int vm_running;
-};
+} AudioState;
=20
 extern const struct mixeng_volume nominal_volume;
=20
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index fb9f29d892..9baebe9d33 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -8,7 +8,6 @@
 typedef struct AdapterInfo AdapterInfo;
 typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
-typedef struct AudioState AudioState;
 typedef struct BdrvDirtyBitmap BdrvDirtyBitmap;
 typedef struct BdrvDirtyBitmapIter BdrvDirtyBitmapIter;
 typedef struct BlockBackend BlockBackend;
--=20
2.17.2

