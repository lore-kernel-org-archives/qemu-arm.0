Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp340241wrp;
        Tue, 3 Sep 2019 04:49:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwhFtLjLdQBnjsB6iNtCOpQas0xoVkhWfOICDeVBa6A7CUBBGeij7xzqXptnHRAhPZ40WpZ
X-Received: by 2002:ac8:269a:: with SMTP id 26mr34277032qto.186.1567511396927;
        Tue, 03 Sep 2019 04:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567511396; cv=none;
        d=google.com; s=arc-20160816;
        b=V6AQWMaObf4ev8A3BBBEVcraEU2FP+7X6Lhy/J+w/78Xuf9nSKUxrsgSoiXVyPKN+p
         TM05fk77LZQwV60m9LjAQQMunJN2ihkqw1MRAvNFw21fp9hXnFLwwXHmtkEJpV9Il3Yu
         iD1agmr2bQqkjZ1+WGoxWvaBGFy5UFoyPj5cxb5kW7spXzhLg5mOd05bhYTUny1G8OI1
         KNtkWEjh2G3d6B5W3qG+q9yW+5v50qkpZtratrAhgFSdPZKzhMYayRLEYQ6ofebtojFk
         mlbmLbgwIh61dSyQD6eDzPymLEDl8ZWuN4BcgU2fReLzsw4X1+pFZSzwmYCIe4+LXTC0
         ofgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=wZqP6FJt+hTiFXJxez94gMCZ8XVH8RAjHZBLeVhT+z0=;
        b=lafiX3Zb+HwE0CarpcACCFG/W0232C7KrDU/NhbQUk/8pbq6qwFUk9l22B2n2emTYY
         PZd2rQandIA8HMFvFdCIJjT9wI8lEerCe4mhYYK4Vzc1GcBLjrGbDXp3Nk5TY1XNbykn
         NgW4W+95FgJIUUnzhFSgOUMsFPj8TZcnnHFRC3tQEZCEB8upfOvYiLEnpAcAqyzNAhkY
         DerzGgVDl3AxeDNKFOa07Hdg7Q9rXnuWxoqqAS2elHAymbVSWg/pQ6u6xrVTY00r7LqZ
         9zXQiSikAJNL8R1W4CiZG5t0MvzfM32lOOPph4ZVujiD72rNqzmuCpFKIOkKpgzaXmZO
         CLXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si5448757qvg.184.2019.09.03.04.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 04:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i57Jr-0006kf-Pj
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 07:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i57Hk-0004zK-5v
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 07:47:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i57Hj-0005uU-7b
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 07:47:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52158)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i57Hh-0005sZ-6n; Tue, 03 Sep 2019 07:47:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 858F25AFD9;
 Tue,  3 Sep 2019 11:47:40 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-102.brq.redhat.com [10.40.204.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A12C5DAAC;
 Tue,  3 Sep 2019 11:47:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 13:47:25 +0200
Message-Id: <20190903114729.3400-2-philmd@redhat.com>
In-Reply-To: <20190903114729.3400-1-philmd@redhat.com>
References: <20190903114729.3400-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 03 Sep 2019 11:47:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 1/5] Kconfig: Expose CONFIG_TCG to
 minikconf.py
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HDty/hYSJl8Q

Expose the CONFIG_TCG selector to let minikconf.py uses it.

This is useful with the --disable-tcg build, to deselect
devices that are TCG-dependent.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Kconfig.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Kconfig.host b/Kconfig.host
index bb6e116e2a..c7caa47dfb 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -2,6 +2,10 @@
 # down to Kconfig.  See also MINIKCONF_ARGS in the Makefile:
 # these two need to be kept in sync.
=20
+config TCG
+    bool
+    default y
+
 config KVM
     bool
=20
--=20
2.20.1

