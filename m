Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1408326lfp;
        Thu, 6 Feb 2020 05:01:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwkT1/p4mr8kdogIcnhjlXbVzKsm6YAk4rdA3d3+qWHFXWoOj7gaRKdvkQp9mXsXZR6MSbA
X-Received: by 2002:aed:2ac5:: with SMTP id t63mr2312435qtd.315.1580994092988;
        Thu, 06 Feb 2020 05:01:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580994092; cv=none;
        d=google.com; s=arc-20160816;
        b=IPQmsSr+U4El8Q2rixhYO+AWzYX/ux6AOi9pZgeYkavuFUfPoZOWjkHgFG08qTmKXb
         VgOpIzbVw4DA1Pf4b+F+bnrOP7EH+hshcYZXocGAay1tpcvxEHdycxymLmwtdCfPFvsq
         gQaiJcb4F4lXnEYQTWrAmoLTD0RDCHjc0VuTmiI+9AdzQWb4Sm9LPPpwkxbYdkJEPevT
         KyYrNYQZk2JaxFWazP69LRrnuBXrEhft9sZIuMouP2fZ3lhwQGn9Rvimi0DS3hts1SdG
         /BQ6kcG5jcRMiiT10QIt7NVSSX5cIJ7zAMlrKcqd0rMjMLa/71gBxvPQPGn0akoCKbug
         UxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=qPqoQcvHDeQtnhdxTOvQtc9fUTtc0MGkEWE/is6kQX8=;
        b=baR7Zj3KMmIc5gI9vI1/t/N0Ae6LQCC1orwEfOuQk8IyIUz5A0lJXRcB93DTL7k4wn
         NJ1IFi7Z8UBX66ipmFsKEzBWnNQhbwTSGLYUFBtjTN7r7ufPUHaxnlNVMRtv3yNaJEGM
         c7L+WgJkdgSlW9is5doQd9Ta943VXKuHl9sG2dwsevkPUB/dGO5j3EiPUZYWwSA25E92
         hpK+KIJ+LDqK1jCUXcM6aTrl6Xx9oswm41uoP1CfTU+W9MArNNVgxvp2m7dft5EfWFcV
         Xoarl/qieL5QI/SiEguMBWljcjuakFPAFHCVGRvROX6g0ekk8VqefXlHDBIpm06EtWC8
         1Yzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7si1539479qvs.62.2020.02.06.05.01.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 05:01:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izgmi-0006dy-Cj
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 08:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56783)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1izgcl-0001YE-8G
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:51:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1izgck-0006bw-4b
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:51:15 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:58643)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1izgcj-0006XH-QX; Thu, 06 Feb 2020 07:51:14 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MA7X0-1ipGDR2F8E-00BbCn; Thu, 06 Feb 2020 13:50:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/12] hw/i386/vmmouse: Fix crash when using the vmmouse on a
 machine without vmport
Date: Thu,  6 Feb 2020 13:50:21 +0100
Message-Id: <20200206125027.1926263-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
References: <20200206125027.1926263-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W1eH0lsjt6jCmCVV74la6b76emMsVYrvt3vX9vKnSUbZyYJ1LxV
 vtdSYnTft+amupyioUNYFMtJdy8/g//VcZz7uFPjMidplOCS6YfqZmWLZCwx1ZIWrIYjG9l
 y61aZRme2DuQEx7Zc2iaqSnN89jnovLuJSzXeMci1JUogfrEXnKtjO2S9G1N2AYP9kCXOhj
 bNbhcsMNb4iZUJzDoKmww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0MfJi3yqHXI=:USKbxS+q6G353dEWeijF0b
 EK2ts37obxszI2JCLXU29w1ksJwOFewxKDy27S3Q5Xhrz2o3XOTRPZnqfnJ0wzJNTsB3rgiWR
 6TqZXwqCbvdYxtOswWNyLVVdWtz0b+sjQC2n+9SXSp4D7IvblHcJIUSp0u7d0l/GPP9Zx8BtE
 NoVgoRl9QOqYwjpVYTakhKSa3lfeNuFeeiKgs8MFqlk+OvftJzPP73ARsZ2YeW0BnqvCIYbSR
 CLgvGMjQh0zALkd8NE9jR9UvgVfOEq2cQO9TSCl/TYc8VsSLU65ez21LfxMsRmENo5ZzrjMMV
 ARDecpr+6Irb0aKYvrNMWWFUOXCHLKGBpjrYIgYA6uKezP0MV9xKFG2TKLbL53jmg87r13mhv
 XC/YEKJSZuAqnHTIKeHiNO4sd6IM8Whj3JJBhYHp43ehAP1JnPt8HKX45OXhoTpeErpCniZLC
 bS7sQB8EGFeoXvcp0GD8pSbF1YE3zk7pqGigEarj/wuAY72NG/jeH3IzVuKkKUxjjz3TraUg2
 nihkNBbEvUw3ST+H5po1f7bvGylx6VRsMFd7UZZnWnVgWgiL2UWOiBS8ouEeKVAOiM5ndxOp/
 q6VtFwxOmSoC+ohbaQSpAsaSXG15bct0YGJTVgARmKGPqIksiRQGT1kCTXM9ycJJwHQJdMCXr
 Oudoi5Jyn0xVDGwzQYu4iqnP72/kN5DQEOCphgc1N0oKh7sfLWO2v8wlfREN9Jv3O21gsI8zz
 63+ggC0DjmAZ7QT1dwlfch+J+nrm0flDRL2BJQnnLRepqPrOK4NZd+VPswVY1saEs7k5lp35z
 iB6j1SDhXFXscf04HhP5cReUpqrgcWMks0qiO373956cMzFE+veARtPMUn8l/PBA0vIakyu
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3HNNpC5SQj5S

From: Thomas Huth <thuth@redhat.com>

QEMU currently crashes when the user tries to use the "vmmouse" on a
machine without vmport, e.g.:

 $ x86_64-softmmu/qemu-system-x86_64 -machine microvm -device vmmouse
 Segmentation fault (core dumped)

or:

 $ x86_64-softmmu/qemu-system-x86_64 -device vmmouse -M pc,vmport=off
 Segmentation fault (core dumped)

Let's avoid the crash by checking for the vmport device first.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20200129112954.4282-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/vmmouse.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index 7c2a3755271a..e8e62bd96b8c 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "ui/console.h"
 #include "hw/i386/pc.h"
 #include "hw/input/i8042.h"
@@ -269,6 +270,11 @@ static void vmmouse_realizefn(DeviceState *dev, Error **errp)
 
     DPRINTF("vmmouse_init\n");
 
+    if (!object_resolve_path_type("", TYPE_VMPORT, NULL)) {
+        error_setg(errp, "vmmouse needs a machine with vmport");
+        return;
+    }
+
     vmport_register(VMMOUSE_STATUS, vmmouse_ioport_read, s);
     vmport_register(VMMOUSE_COMMAND, vmmouse_ioport_read, s);
     vmport_register(VMMOUSE_DATA, vmmouse_ioport_read, s);
-- 
2.24.1

