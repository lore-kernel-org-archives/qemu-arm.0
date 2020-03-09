Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1254841lfc;
        Mon, 9 Mar 2020 08:12:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsfgAmvnUvrWdTCNmAR2ckzRfbWed8+ZaWIUjUPSRfcG68nc81opKMv5F4duuTLUvIckjO7
X-Received: by 2002:aed:32e7:: with SMTP id z94mr3589203qtd.382.1583766769096;
        Mon, 09 Mar 2020 08:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583766769; cv=none;
        d=google.com; s=arc-20160816;
        b=br9iBFG9TghJ+yHysjFGqlIv/FJ9QHxW77puLxK+mlPuFB6v6Ieu4GqnSyGQ3dvirU
         oW3mCJJ/jULimHa7D0hmkF5sFfQpTT/FyMyqXDagC+61JiyZh79uV1iC0sWW1jUKaiDT
         NO3dvDxZSZhjUpAAxM5uiu1BdUAZN1psDbh5lvBZbehG0ZYWrEXaqBr0FjslqrSrWKtg
         dYdX8SmAKRqguJgd2+H7WjgjTi94WDFwiATbMuxQoJgduXzK9Y6dfnRQbsm+UQExj/0r
         +gli4r1Iu9ka4PIvYkwnOJCUHwzUifMrPUY/f9U1GEBTQLjkRwpaQ5CEIF4Cp9TuL/tE
         kwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=stmEWgZNlK9uIqEdHCd9ZJNqXvVzu4LquYBLAy8jkbY=;
        b=v1QXuEqIORwgNpJ2QnPfzBQNdTq7k/Z2RZ53CsgvHDnCQi6lUOKeyyWYHlKU4oceZS
         wsqHkJK5ThjgC+EQL1Nq/ldBo3eFZ/Q2Rkw2C7vzZ22rK+dx1fW/E1qjwaMhLdELPJ2W
         p9TMiQOoBUNpHhc7FHNbXAQ2EPJ1dIdmFMh/GkLXh1Sfs1BMI7VGNzs9wKasVrwSzWXK
         Ki+HO+lIdFyywG1wZncrxbQ5KOeXL9lXVEvLvLyGylTF5mSQe7hAps1NaXvMaIIJVn73
         cz3t8FrhAoYPgLWr1IoCoqFQHGYdzZW+QOJ/S71Fr7EfrCUgBe43LUTBvBL4BhvjNRhj
         8W/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si2033971qvm.53.2020.03.09.08.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:12:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBK5I-0003JK-Eb
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2K-0007QF-Rh
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:09:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2I-0007af-Q0
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:09:44 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37311)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2G-0007Ya-Dt; Mon, 09 Mar 2020 11:09:40 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MHX3X-1j7DR62up7-00DXxH; Mon, 09 Mar 2020 16:09:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/33] vl: Add missing "hw/boards.h" include
Date: Mon,  9 Mar 2020 16:08:12 +0100
Message-Id: <20200309150837.3193387-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0Fkei+2Tt1Tdpv8J++VfECwShiRaK3eOrGgS7RSiid7DnfG9jQ7
 wiHY6j6PhMpnumCxFjkerbQ6HhAkUIKw8m/a4HZ5tawrCyfvCwH/sIX4hE+dC1Vpy+nOc0N
 byu+c+a91Nu3kUNh7/b4Yk29kfjlPSmrpewB5Q3haXNQTbDp+d8d4r8D2YtenHl9zffWqsS
 ML/O7o0l0ZYVKQz3xBAvg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mzwa1rvCDwA=:pXKJSSDa+HrCXHL1s9xszf
 nEicKRMDuoRr4cPdjnIc6z0BFL42vaQLcNKyUQkvI/yO4SC4TmUUtWb2bld/im6rsttBxn7Rh
 lBuyX7He+FQbPQisrwdwLV7PiUWwA8R9fAdnegTI9n9qKT16KeXUdeo1dXe0rFHfjrOJl9KFc
 ralgwx9UNhcki3/lBeFJyrmmnc8ZRIUsXS1SxBwdx/+j6HMQkjrbPuqTMdG8RNTgU61rqP7mF
 k4tfaXmcek85v7eptBqp/eKu4NzENr98JlfbTgI8ipZhYpI0vrbwJOzpivvABI2yOMPgWH/en
 ysBGNhYGfF5tsJHmVj5LVWsb3rP5fawdbh12tlQ0cL9MTRi1DiVozkKQ6yKEy9XmhbwWOeDWX
 3XnT5Zs9+Fs+CISWGhQSmRlTFE0ojs3umaM406SKRF6CTLt42PuphAj3zmBCEZv8LIr15TUt4
 ARwLh/gk3TiXEZ06ogccC9KXYksdgoFgx/1B6YQZVflxeDmshtFbU1XNxjAzqyEmnwHXnGIKD
 cZNYUTFij5dXOjVRlDMbD7IDTNYYctyJuyQBoAMb8bh3NiGY9gV04npEtaXC8wwUJOKae2SSf
 mgi4PCcwq0lEpCfooRz4jEdc/61O8zW26OGn3GJPjhiMVAIPAmiL3nEORipsSTLES/wfOqf/N
 o/Aq+wjOANi9v9vPzx1b9ASiDxFF+q3vV325XIK0nQHy04+VYhQ3X8lPzpfhp5TRPLgEnq3Ov
 IN8r2GHKYl08xclBMj74s0nBqIvpXRH++/rJB5QuaA9AqIFp5cccoyn4S0TBrSL/2sDu/BvsX
 vXLm3Ues3mv+FEn7D8J25OrjuUb+m4vQizwd4ZoWNxtBDgqxyfs6+W5T1hGJshO228LVf7l
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KwnhOp410oa3

From: Philippe Mathieu-Daudé <philmd@redhat.com>

vl.c calls machine_usb() declared in "hw/boards.h". Include it.

This fixes (when modifying unrelated headers):

  vl.c:1283:10: error: implicit declaration of function 'machine_usb' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
      if (!machine_usb(current_machine)) {
           ^
  vl.c:1283:10: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
  vl.c:1283:22: error: use of undeclared identifier 'current_machine'
      if (!machine_usb(current_machine)) {
                       ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 softmmu/vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5549f4b61986..ff2685dff845 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/units.h"
+#include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu-version.h"
-- 
2.24.1

