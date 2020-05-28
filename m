Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp489189lfc;
        Thu, 28 May 2020 05:45:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2cVhUDDzmj7XJkaqKfyChWqcySxHDL8F3k7oDk8AcQGJR8SGhbA1MbGu1b/mf2z/yRLLq
X-Received: by 2002:a25:dd87:: with SMTP id u129mr5179610ybg.83.1590669930071;
        Thu, 28 May 2020 05:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669930; cv=none;
        d=google.com; s=arc-20160816;
        b=hclUGuzkmpHm3adr9SU4wLilU2mI3PJXZ3laUsBfFL+k2/z1omJbnj2Ghqg7kZPEZb
         LciaOL2Iry9eXvpl0pQWEos+68PhIeI5cS6e6u2wFjJc+8Z7FlHzUQ6xXd91HajMNKuQ
         NqVbQU6DQzwmk0y6m7LRa9oliatZkq2ny15WOrjtFuTWQsodQLV3iK1ZMBRXfSOI3exb
         ycdRih7w+Il+zYj5RVVh51M/nlGERct0vsmA00zvXcKlzXJB8jYtFyLNsNTqaYDhou6J
         5bl55RXiXgQTgkx41rzJjY2+1w+F3oi/NLIbOhh8oTRkW+LtdReDTgHWUZMtMt6zmxxx
         DQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O28inHDVpVZDhPHiuyyYR/itAk5vSTfRey6DnLy0yh4=;
        b=GQ7mKCZ9kklFyVMoGmIwMldNRGtseiYAIK4YHVnfjrf24CssMl50VposiocIArlUJ4
         V8TnTEgjsN8NIxQ184TQN3AC7e0KB/itS5kBsZQCrlXVDq3BjuinqWVxBnoxtpJiJROI
         qYoUuPX+fhmiAKwfgwqOHHZBS8NwLO6AFf3oWYp9az24gXZM7NgLIESaVM0dBbUwWvHw
         tJK5Mf4LoxvWqJT/ggmfmZd8WLGtay73vTGxE6tgboojgHvo0NvotZfnetlLS301K6op
         sM6RqZf+t9dlcWhLkr2U6YzF2nt+I73tZjGia4LLYl1yTHtausdSS9+qg9BOYWfaHvfR
         9LXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E8NaT+hU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si7713813ybt.230.2020.05.28.05.45.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E8NaT+hU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHub-0003ka-Cc
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHmC-0002WW-Vr
 for qemu-devel@nongnu.org; Thu, 28 May 2020 08:36:49 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29057
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHmC-0005P4-4g
 for qemu-devel@nongnu.org; Thu, 28 May 2020 08:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O28inHDVpVZDhPHiuyyYR/itAk5vSTfRey6DnLy0yh4=;
 b=E8NaT+hUItrs1yZqDLNS4YXuxG22wibDOJh6B1sHM56TuFdbbreuai1zQABJT9CQFc5x29
 qIti6sBPr1TTVgiOi7hcnrklKUgpyjIBPxniRwJsDHil2zUvKccoYo4DMqzUwHKYE4QpdU
 p9LAV45ji/02RjjDnIC+7q0Jp/ITUv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-agnOQl7SOzCNxWJBmamIUQ-1; Thu, 28 May 2020 08:36:18 -0400
X-MC-Unique: agnOQl7SOzCNxWJBmamIUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8B6E8005AA;
 Thu, 28 May 2020 12:36:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BFBF5C1C8;
 Thu, 28 May 2020 12:36:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 606A19DAD; Thu, 28 May 2020 14:36:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/21] hw/display/edid: Add missing 'qdev-properties.h' header
Date: Thu, 28 May 2020 14:35:49 +0200
Message-Id: <20200528123609.27362-2-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 02:50:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R5hX7G9gAVVW

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When trying to consume the DEFINE_EDID_PROPERTIES() macro
by including "hw/display/edid.h", we get this build failure:

  include/hw/display/edid.h:24:5: error: implicit declaration of
  function ‘DEFINE_PROP_UINT32’ [-Werror=implicit-function-declaration]
     24 |     DEFINE_PROP_UINT32("xres", _state, _edid_info.prefx, 0),    \
        |     ^~~~~~~~~~~~~~~~~~

Headers should be self-contained, and one shouldn't have to
dig to find the missing headers.
In this case "hw/qdev-properties.h" is missing. Add it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200526062252.19852-2-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/display/edid.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/display/edid.h b/include/hw/display/edid.h
index ff99dc0a052b..23371ee82c63 100644
--- a/include/hw/display/edid.h
+++ b/include/hw/display/edid.h
@@ -2,6 +2,7 @@
 #define EDID_H
 
 #include "qom/object.h"
+#include "hw/qdev-properties.h"
 
 typedef struct qemu_edid_info {
     const char *vendor; /* http://www.uefi.org/pnp_id_list */
-- 
2.18.4

