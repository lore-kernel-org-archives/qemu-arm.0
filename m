Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4918557lfg;
        Tue, 29 Jun 2021 06:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0hfkcW5rH+VBBtHct66dtXwpjH9ZlWgwuo8kKOMGG2t4V6/vjraVtMxcSoLkc730j+/Bo
X-Received: by 2002:a25:41c7:: with SMTP id o190mr847394yba.256.1624971773854;
        Tue, 29 Jun 2021 06:02:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624971773; cv=none;
        d=google.com; s=arc-20160816;
        b=Igk1zaRdP3tt7Y3x/2gOM4yqGtJJUDm8tsiMoxltIFx2er/afSSLoF85D4Fm1XrHvc
         87IpOTkuqjc0HlSa9n9Kxut21FU2C0PgUhTenUz6uw6sE71xSXTb8vcqcqdngAXpCtEC
         hrnPGy4kZSfl1zLsCesXHJSBCBwX1CXfwIILdiD9ERVqXEdF47pmo6xuPm1XDsX7K05V
         0LN9FVf9o3o6IfRJ0WUjAphuD8+MmIBZk61WFKmnlhixsyFu3ODdUjRWyVo4Ap0o+ngb
         PjAuyI4ghmcTI7WsT1kGTXYFzjGmh7UBUQkgu0d8C9MkCFc7JM6j/JLKXS8zQ2IUnvak
         SUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=t96usFaTT/auIqk0nBwHO+T06RoY/SOkx6WiKgi4Rqo=;
        b=dgUN4eOkz0DV5BDNP4jIblkiQdD5JRfOHlkQcGTKGA2SyDlxfhs5YRO9KHVevkTm9q
         4gmHAIaTYUxrIcSMFHhY/YktTtXzjvqgfLsiVfYGh8BxhpU48oH3s7cInSVgstbpZ6l2
         EenG+rccF1oYExVGZk+mb10XTX9jQ0Kt3dYBf4iDVg0FZs2PGNqUh3A9dgr4MsHFJq+d
         xwjfzYXBvm5oL1zaVRtISsH3le9K2eBCuOvFPMYW8JarqxMmPi5G+bIMBw9/hl4N0i6S
         p/lPzbts9kJFA7NlbN8lEeTy/T3uxyfJ/zIwzJfn0ZRBfQYIDNUJLxJzEupELze3Q7A/
         oMnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vmware.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si17127171ybj.70.2021.06.29.06.02.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 06:02:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vmware.com
Received: from localhost ([::1]:54522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyDO9-0000pW-7U
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 09:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnick@vmware.com>)
 id 1ly9K7-0002dn-QA; Tue, 29 Jun 2021 04:42:27 -0400
Received: from ex13-edg-ou-002.vmware.com ([208.91.0.190]:33762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <hnick@vmware.com>)
 id 1ly9K5-0006YL-Tr; Tue, 29 Jun 2021 04:42:27 -0400
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 29 Jun 2021 01:27:14 -0700
Received: from bos2-arm-build.eng.vmware.com (bos2-arm-build.eng.vmware.com
 [10.118.233.19])
 by sc9-mailhost2.vmware.com (Postfix) with SMTP id 107202022A;
 Tue, 29 Jun 2021 01:27:13 -0700 (PDT)
Received: by bos2-arm-build.eng.vmware.com (sSMTP sendmail emulation);
 Tue, 29 Jun 2021 09:27:13 +0100
From: <hnick@vmware.com>
To: 
Subject: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
Date: Tue, 29 Jun 2021 09:27:13 +0100
Message-ID: <20210629082713.31396-1-hnick@vmware.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-002.vmware.com: hnick@vmware.com does not
 designate permitted sender hosts)
Received-SPF: pass client-ip=208.91.0.190; envelope-from=hnick@vmware.com;
 helo=EX13-EDG-OU-002.vmware.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Jun 2021 08:59:13 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Nick Hudson <hnick@vmware.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jSW8NMttobLA

Signed-off-by: Nick Hudson <hnick@vmware.com>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a66c1f0b9e..7267af7924 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6330,7 +6330,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      * We don't implement the configurable EL0 access.
      */
     { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
+      .cp = 14, .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
       .type = ARM_CP_ALIAS,
       .access = PL1_R, .accessfn = access_tda,
       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
-- 
2.17.1

