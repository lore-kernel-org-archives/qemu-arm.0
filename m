Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1844136lfg;
        Fri, 19 Mar 2021 21:19:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJBnQLEY3HrVV9euQBlz8SevuY6KfT1SEaXF4uVks3mGR4qdcPsZ4O7qSd3gJvfIP2ZSOL
X-Received: by 2002:a25:7d04:: with SMTP id y4mr10541042ybc.402.1616213959601;
        Fri, 19 Mar 2021 21:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616213959; cv=none;
        d=google.com; s=arc-20160816;
        b=WH1RWAzKMNxf22qzihgGJ2QqeNloZsRnOnuXlphZc4ZcRs9iaVLkhz5OChZptUDTyH
         MBKY0vzWGYJxbh0ws+lnPrJvufcJkjI5qEdB+LGq+3WADyffXfX0huu8GjHPrDlHRZPA
         coT6emGOX/7Avpym3nGDNSSPvf9BlA1Fyr/JKo888uzPh3haSeukC6g28zQ5QrIFcBEQ
         GiPvWZr83ktpvPwYYyq+XZJOTyep7Vs7IiJ0jkbmbl4NyQ8tykpXCFrA1B7wtxkZ181H
         QF4NCdmHw8b6xKgwHfbAZ26Dd+c/fjftP3TT9IfixtLjGj65ikYO4IdCZz9PH98vZ+ng
         nRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=lUnwcybZywkU5SwBHHcOsvqNm6NDwGhyBTSUV07CaOU=;
        b=LM4DDUlSeBVkduJnRHAtQktyUJggOvnl9YUZ6sTzIBZRkd9gUu8OEvRcOHdteyXEqp
         XI+CcEIH5vD3hkVjt4DZe3BVPnAvO6LOp3jDrnaf7IOgckkM6SOCFxFD0WbRuRU5+/rS
         KA/0sl1Z8x58CAbu9SD7sBZ74KCLLcaTbEywg6p/9MNZEqzJFwxWQnmC2HSExDD0iuY5
         sbZ70vPvC1Jllxc4Ap4q5CJSBED+9K6OztlNlGyCOkhL18gQKLrJk0BRoStFDvwV67yz
         8eMO/mAvicJBhbaB3lwmCd5RyeSrv4N1EolhBWId+OcdCNmZob3KibEFPqgD2amJz1K5
         gwxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jJwwdqDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s189si1019933ybc.63.2021.03.19.21.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Mar 2021 21:19:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jJwwdqDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lNT54-00044K-UB
	for alex.bennee@linaro.org; Sat, 20 Mar 2021 00:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNT4w-00043x-9E
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 00:19:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNT4s-0001nf-Ht
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 00:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616213945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lUnwcybZywkU5SwBHHcOsvqNm6NDwGhyBTSUV07CaOU=;
 b=jJwwdqDlNE86vvtFaU+MDHnJIPr6zs/80xcECthq9IpDo5pyxbAsOtA486tZqlsg78swRs
 dVXlZDxrIZjL9/+4/GAFxSDV76zSmuBFacJBUNIesHh9I/BywH6PvCJ5ZFq519LO3KVxE8
 8JzcJnzBjNA8xPcEM1QYa/rUZXiEN/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227--mex6WckOJCd8rIK0_Co_A-1; Sat, 20 Mar 2021 00:19:01 -0400
X-MC-Unique: -mex6WckOJCd8rIK0_Co_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8E23107ACCA;
 Sat, 20 Mar 2021 04:18:58 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-40.bne.redhat.com [10.64.54.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 279005C1D1;
 Sat, 20 Mar 2021 04:18:56 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/2] disas/arm-a64.cc: Fix build error
Date: Sat, 20 Mar 2021 12:18:54 +0800
Message-Id: <20210320041854.68668-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aGP9c+kySpB+

This fixes the following build error with gcc v11.0.0:

  # gcc --version
  gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)

  [969/2604] Compiling C++ object libcommon.fa.p/disas_arm-a64.cc.o
  FAILED: libcommon.fa.p/disas_arm-a64.cc.o
    :
  In file included from /usr/include/glib-2.0/glib/gmacros.h:241,
                   from /usr/lib64/glib-2.0/include/glibconfig.h:9,
                   from /usr/include/glib-2.0/glib/gtypes.h:32,
                   from /usr/include/glib-2.0/glib/galloca.h:32,
                   from /usr/include/glib-2.0/glib.h:30,
                   from /home/gavin/sandbox/qemu.main/include/glib-compat.h:32,
                   from /home/gavin/sandbox/qemu.main/include/qemu/osdep.h:126,
                   from ../disas/arm-a64.cc:21:
  /usr/include/c++/11/type_traits:56:3: error: template with C linkage
     56 |   template<typename _Tp, _Tp __v>
        |   ^~~~~~~~
  ../disas/arm-a64.cc:20:1: note: ‘extern "C"’ linkage started here
     20 | extern "C" {
        | ^~~~~~~~~~

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 disas/arm-a64.cc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/disas/arm-a64.cc b/disas/arm-a64.cc
index 9fa779e175..8545c04038 100644
--- a/disas/arm-a64.cc
+++ b/disas/arm-a64.cc
@@ -17,13 +17,13 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "vixl/a64/disasm-a64.h"
+
 extern "C" {
 #include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 }
 
-#include "vixl/a64/disasm-a64.h"
-
 using namespace vixl;
 
 static Decoder *vixl_decoder = NULL;
-- 
2.23.0

