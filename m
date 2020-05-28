Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp485700lfc;
        Thu, 28 May 2020 05:40:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3bFMNpaMEe1o5h1PCnmxLkeab5owuzUB7R/+VBVrWKYzSRoEJLle3AgRSZPK2rAukghPj
X-Received: by 2002:a37:d245:: with SMTP id f66mr2643822qkj.452.1590669633140;
        Thu, 28 May 2020 05:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669633; cv=none;
        d=google.com; s=arc-20160816;
        b=pxsNa0Bk3RXjyfa4EUiqlFsjm6se7JJQ/RkxhcaMlpO4Lotgqf6Zo/8hzZitR8uwAm
         Q8DRcWZvKJeG1ZP1Yy1NwUlSUN4GgQap/BAVflAbZwvkSOm7EPT4fQnXlXSWQshE6KN9
         wXobeHSg5V95a7yL4P8V3pBOklRNTMw/ZKPJL/Xb0fXXAK+DTb1TfJgUcfi4c16DRu1h
         s4882qIH3+NF3edKEq/OL3Pw+V/xPeyb+7Q4Cxp7JtTopU9To8LL1HHULylzZLvIEdY1
         qrjEfgWY4/4vxpEAfgDm3XkCdCxXqPjehj0OHFJkUkJipanABwaF8T1rcb+/Cl9rKOgf
         QgdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YFanjQRCf3qFEQWnXhLdapqjyquW4MPJ3aMF997XDHM=;
        b=QjkM+S1ZmCL4BSS0CCLSb3FD11yfnHqDU1fTI/0AdFx1bHlK2Vf5o1QeYjF2NjYZUM
         065e3xfN40Ha1HL7kkdBVkLRk4SA7EtSAquT0jSptQryndK8H1Y+bdjQ4n+Gx6S5kih5
         dfj7aFBIE1iBSkItJd9MTdWzBJFdOmM18KBCd7BjPUd2ieK5D6J0Z+QkniJ201YL4+l/
         nIKeib1MjXCPW/xFi7xoiizzJYPz1+fBr++p/+0NH/MMn+TWgICFWRJavW8uXsfy5usV
         z9+wh1DRiS8B1h8zS5MqjWT3CTQmf1X14VXcQv++uR88PxidawMctq2R9Rq1By/gbxO8
         sTDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="jQ/fec9Q";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a195si3597352qkc.68.2020.05.28.05.40.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="jQ/fec9Q";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHpo-0001NX-Gr
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHls-0001ZA-FG
 for qemu-devel@nongnu.org; Thu, 28 May 2020 08:36:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34731
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlp-00059h-E3
 for qemu-devel@nongnu.org; Thu, 28 May 2020 08:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFanjQRCf3qFEQWnXhLdapqjyquW4MPJ3aMF997XDHM=;
 b=jQ/fec9Ql9JbZ9cIT/hQgWHeQ4ZvvVNM0IW3MDXf9qHQuewoG2EECAYvrUt+RHmAltlyeV
 PAxlvTehe3/+/b5CtNhrxbsMiIWT1M3sE1ljNtWHsz7oPtJNhTwXSu60CBsXyXiDUPCNy2
 IfvhcDS6Zqgv8VmO5mPu4TLrPXW9Sgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-p15FU9h1MTOT3ByajxYeWQ-1; Thu, 28 May 2020 08:36:21 -0400
X-MC-Unique: p15FU9h1MTOT3ByajxYeWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A457E8018A4;
 Thu, 28 May 2020 12:36:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D36607E467;
 Thu, 28 May 2020 12:36:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E36269D63; Thu, 28 May 2020 14:36:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/21] sm501: Convert printf + abort to qemu_log_mask
Date: Thu, 28 May 2020 14:36:03 +0200
Message-Id: <20200528123609.27362-16-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 01:51:20
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yzqy9kap7Wy3

From: BALATON Zoltan <balaton@eik.bme.hu>

Some places already use qemu_log_mask() to log unimplemented features
or errors but some others have printf() then abort(). Convert these to
qemu_log_mask() and avoid aborting to prevent guests to easily cause
denial of service.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 305af87f59d81e92f2aaff09eb8a3603b8baa322.1590089984.git.balaton@eik.bme.hu
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/sm501.c | 57 ++++++++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index acc692531ac7..bd3ccfe311c8 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -727,8 +727,8 @@ static void sm501_2d_operation(SM501State *s)
     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
 
     if (addressing != 0x0) {
-        printf("%s: only XY addressing is supported.\n", __func__);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: only XY addressing is supported.\n");
+        return;
     }
 
     if (rop_mode == 0) {
@@ -754,8 +754,8 @@ static void sm501_2d_operation(SM501State *s)
 
     if ((s->twoD_source_base & 0x08000000) ||
         (s->twoD_destination_base & 0x08000000)) {
-        printf("%s: only local memory is supported.\n", __func__);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: only local memory is supported.\n");
+        return;
     }
 
     switch (operation) {
@@ -823,9 +823,9 @@ static void sm501_2d_operation(SM501State *s)
         break;
 
     default:
-        printf("non-implemented SM501 2D operation. %d\n", operation);
-        abort();
-        break;
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented 2D operation: %d\n",
+                      operation);
+        return;
     }
 
     if (dst_base >= get_fb_addr(s, crt) &&
@@ -892,9 +892,8 @@ static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("sm501 system config : not implemented register read."
-               " addr=%x\n", (int)addr);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented system config"
+                      "register read. addr=%" HWADDR_PRIx "\n", addr);
     }
 
     return ret;
@@ -948,15 +947,15 @@ static void sm501_system_config_write(void *opaque, hwaddr addr,
         break;
     case SM501_ENDIAN_CONTROL:
         if (value & 0x00000001) {
-            printf("sm501 system config : big endian mode not implemented.\n");
-            abort();
+            qemu_log_mask(LOG_UNIMP, "sm501: system config big endian mode not"
+                          " implemented.\n");
         }
         break;
 
     default:
-        printf("sm501 system config : not implemented register write."
-               " addr=%x, val=%x\n", (int)addr, (uint32_t)value);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented system config"
+                      "register write. addr=%" HWADDR_PRIx
+                      ", val=%" PRIx64 "\n", addr, value);
     }
 }
 
@@ -1207,9 +1206,8 @@ static uint64_t sm501_disp_ctrl_read(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("sm501 disp ctrl : not implemented register read."
-               " addr=%x\n", (int)addr);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented disp ctrl register "
+                      "read. addr=%" HWADDR_PRIx "\n", addr);
     }
 
     return ret;
@@ -1345,9 +1343,9 @@ static void sm501_disp_ctrl_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("sm501 disp ctrl : not implemented register write."
-               " addr=%x, val=%x\n", (int)addr, (unsigned)value);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented disp ctrl register "
+                      "write. addr=%" HWADDR_PRIx
+                      ", val=%" PRIx64 "\n", addr, value);
     }
 }
 
@@ -1433,9 +1431,8 @@ static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
         ret = 0; /* Should return interrupt status */
         break;
     default:
-        printf("sm501 disp ctrl : not implemented register read."
-               " addr=%x\n", (int)addr);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented disp ctrl register "
+                      "read. addr=%" HWADDR_PRIx "\n", addr);
     }
 
     return ret;
@@ -1520,9 +1517,9 @@ static void sm501_2d_engine_write(void *opaque, hwaddr addr,
         /* ignored, writing 0 should clear interrupt status */
         break;
     default:
-        printf("sm501 2d engine : not implemented register write."
-               " addr=%x, val=%x\n", (int)addr, (unsigned)value);
-        abort();
+        qemu_log_mask(LOG_UNIMP, "sm501: not implemented 2d engine register "
+                      "write. addr=%" HWADDR_PRIx
+                      ", val=%" PRIx64 "\n", addr, value);
     }
 }
 
@@ -1670,9 +1667,9 @@ static void sm501_update_display(void *opaque)
         draw_line = draw_line32_funcs[dst_depth_index];
         break;
     default:
-        printf("sm501 update display : invalid control register value.\n");
-        abort();
-        break;
+        qemu_log_mask(LOG_GUEST_ERROR, "sm501: update display"
+                      "invalid control register value.\n");
+        return;
     }
 
     /* set up to draw hardware cursor */
-- 
2.18.4

