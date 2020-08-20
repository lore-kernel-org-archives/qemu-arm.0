Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp897737lfy;
        Wed, 19 Aug 2020 17:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaqIn+uBcDYdogrx77EX9PQFhlwQ/geVmV66qHYy9l+lfXGuG+SZUVVSXRulmhAp+WQLuu
X-Received: by 2002:a25:2550:: with SMTP id l77mr1427547ybl.440.1597882693408;
        Wed, 19 Aug 2020 17:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597882693; cv=none;
        d=google.com; s=arc-20160816;
        b=NtNNesU/sDkDTfrL/CB7ypH4xb2opqJ66Ex+Cb6ghnNDOJTXpAxXSOjHIj43iAFZEq
         N/qdX9KmRxRiunRBDWCa69xq9fy9ANt/NZO1c9aX2+zmOUVF7uFe71UGAK8R+Xw9v/pG
         8gBrSU75xEKjjzSCqNGeKd9Zphy4svjbGNrMr+8eCW9jO6n1jHoD3uEo1vV0/4KYdeEM
         S8bjwQTIdDo9XiF4xSei+y7lWNypkN5YnO7J4sjmCxMRvxttmPz5r1dZ8l6SogJUgfwj
         deReml6DW4RTOAaYuQ+2eOWkI68eO0nXwCqddHDDam1uokIUVT7VBtEJgyJ31Sz1fRDR
         D/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jIIWkn7eYfLAAccpctTQZkTNA3/S5l7UqUEgwJHv45s=;
        b=kaiabb8dLVpD9oyTgJ4dGIfp4H0SHjEnK7ouynr8Zlkl6ENxL9Apk+WkDDeEOSbKDj
         TQlwqc/TTZRjtLP8TWa1EmVDEFOymkQ4+G6n5FLm5qZ6Ivx+0rvO5i5HAzuL/W1wTX8Q
         A/CYNJvP4UQ98eIt7kerFBtzPLv/g5cIMmCl3WbrFWcB9wFQuhhWqoIxKP3QXtEGKIRU
         sf8TS06WV10+Dx5uvgV6X+JHRxbbBfFaZBtbCflM5bxvLlpkAuXbaJmksb1cHjauBzJ3
         jMa72yOSRHjtjK3UyeYQFGcwFW7A6W97QDdnCZrnmi7CGZ8JqpyskEOA8NBb4ZgLAj3+
         hzdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KIheRwwg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o186si268106ybo.358.2020.08.19.17.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 17:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KIheRwwg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8YHU-0005tS-OS
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 20:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YCW-0005El-Qq
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:13:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51676
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YCU-0002J1-VN
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIIWkn7eYfLAAccpctTQZkTNA3/S5l7UqUEgwJHv45s=;
 b=KIheRwwgkMB3OwJiGZRaFRvpaPRSV7ylNQwMkLF+AkABhPkRj9P+CjS9FrY1jdL45ItyT7
 KOMZMUBmLeaszx8GEXRoYf8Kvag6HRYpTvGTNoN6G7YvkDFnrBh7mtDi/FwzY/FhJsEjin
 0Aq2bsP29b3BP+Q+lShFIUHEZchSVTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-nUL9yCUnMcuo_AptWyw6nw-1; Wed, 19 Aug 2020 20:12:58 -0400
X-MC-Unique: nUL9yCUnMcuo_AptWyw6nw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 569671084C8C;
 Thu, 20 Aug 2020 00:12:57 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EF1B5C1D0;
 Thu, 20 Aug 2020 00:12:56 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/58] aspeed_timer: Fix ASPEED_TIMER macro definition
Date: Wed, 19 Aug 2020 20:11:48 -0400
Message-Id: <20200820001236.1284548-11-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 20:13:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8rcl6I+7siC9

The macro definition had an extra semicolon.  This was never
noticed because the macro was only being used where it didn't
make a difference.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2: none

---
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/timer/aspeed_timer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index 948329893c..d7c7d8ad28 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -26,7 +26,7 @@
 #include "hw/misc/aspeed_scu.h"
 
 #define ASPEED_TIMER(obj) \
-    OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
+    OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER)
 #define TYPE_ASPEED_TIMER "aspeed.timer"
 #define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
 #define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
-- 
2.26.2

