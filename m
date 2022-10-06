Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp474337ocb;
        Thu, 6 Oct 2022 06:24:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5i9quMMcCH9NVbN4zpdwRLXJaHMCmXRrrbDUQuJkTnSys2DfqpRqb6F2BBoQeMrViG45WC
X-Received: by 2002:ac8:7dd2:0:b0:35c:d968:c5d5 with SMTP id c18-20020ac87dd2000000b0035cd968c5d5mr3431861qte.245.1665062666677;
        Thu, 06 Oct 2022 06:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665062666; cv=none;
        d=google.com; s=arc-20160816;
        b=OZoLssZxmYuqXgHp+y86994OcU+hgyMBOI+tgjfUPhe2u4dXE6W/PJ9sOoOAV3D5IC
         iaafkoT4bbiEBkUOMQrqUuouaBf0Td/HjHv1NM/XzdwcG1kMZlfvZSkSj2X9taakjqBn
         v/tAaYpZgGMK5Y1IjMJh3G+/rk9V+rEXgkeuNuw/7V5TD+2wigAU2E+4GmqHMwxzU4Xl
         ZMTG2c80NgffIwSHsfsPh5yboc5TiFr4muw4wAeIMtR65cPz5/IUYGRl/5y5orilXG/V
         hhO6q4CoWD3RISmG+z7s4gKXuBYR98wjArqpPntGJv04vS61Wrn2FMceqDm4czyU2RkC
         aOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=dImHYoUpoT+574q7pKi2NuXHMVT94+B4tlOY57ahyn8=;
        b=W1FbhFiJVOLOG597xzRhHOAcgsyzX02iQYGaSexr46YqtyItlLf30ypljUQP8F596X
         l4hFyo3er0ytuHO9jHtZD5J6dHzEUPtHDiu6lGx0pjUsxNBjodivRhr4yyHq++WMmWue
         L0S9EsfgKy0RtTwsKpmu5ovKt6/jINv5H7rJlU/uak/BnWyb+9JIzQDhkM2fsrAudOos
         ACm5k1VNc0S2QpmgUB0t314HvotWWqp7H4D5M6WWnFjYC8DIomU0lJKiZWVtL+pajcbo
         F7Agtg6WJJY9XF1dUFub2u/H0WY2cK5Zjf/rOAuXM1kuIa6Ej1CRkOru64ejVKzrs91b
         OtZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@tkos.co.il header.s=default header.b=OLB3HCxb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=tkos.co.il
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if7-20020a0562141c4700b0049f65f06559si3539064qvb.301.2022.10.06.06.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 06:24:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@tkos.co.il header.s=default header.b=OLB3HCxb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=tkos.co.il
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogQrS-00069I-7Z
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 09:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baruch@tkos.co.il>)
 id 1ogNzJ-0007rU-MF; Thu, 06 Oct 2022 06:20:22 -0400
Received: from guitar.tkos.co.il ([84.110.109.230]:47869 helo=mail.tkos.co.il)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baruch@tkos.co.il>)
 id 1ogNzC-0004u9-62; Thu, 06 Oct 2022 06:20:21 -0400
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 577024403AE;
 Thu,  6 Oct 2022 13:18:14 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1665051494;
 bh=4H8rCxoz7VuT/+k8uFgTre/SvEacLxL28faqEWXnC6w=;
 h=From:To:Cc:Subject:Date:From;
 b=OLB3HCxbAB7YEKmx9nXCVFVrt2AWeCLUI1KqgeKvUjfHfE4M2Oh3rER2cgmdevbV4
 D4d0LThAYV1y0pxHKO9s+8mmAnl1WuyUQom1puNJZvZK8aRMhJYprsTY8LvSEoJylm
 AKjFOxJWwd1tWQ4bSdmhVOdlhvs+16eCV9gwFcUaU1d5rXWaldRoK1KGpYq4rTfkEM
 mnLgTSPUSajoT3RHBGK4qJT8wrgPCVuMJ1gyAdyNXBH42uu9+FjDRc8ldaMfwp2/SI
 0UIm+ZwD3YIajuNDhmC3yMJtCS3RiSdGOpTAsRT8wXuGAG5SnUwUr3tjg0XeqWZctC
 TviQKKeexVmUg==
From: Baruch Siach <baruch@tkos.co.il>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] hw/char/pl011: fix baud rate calculation
Date: Thu,  6 Oct 2022 13:19:48 +0300
Message-Id: <1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=84.110.109.230; envelope-from=baruch@tkos.co.il;
 helo=mail.tkos.co.il
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Oct 2022 09:20:06 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xrzeMORVr9Mr

The PL011 TRM says that "UARTIBRD = 0 is invalid and UARTFBRD is ignored
when this is the case". But the code looks at FBRD for the invalid case.
Fix this.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 hw/char/pl011.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 6e2d7f75095c..c076813423fc 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -176,7 +176,7 @@ static unsigned int pl011_get_baudrate(const PL011State *s)
 {
     uint64_t clk;
 
-    if (s->fbrd == 0) {
+    if (s->ibrd == 0) {
         return 0;
     }
 
-- 
2.35.1

