Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp114822ejb;
        Wed, 7 Jun 2023 02:21:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Oz14exlzF7vFL46xuCkHNXjoGejdNEBq9COrImYZXuT8GF6vdN0TyvNKRoOaNzOgL3ut+
X-Received: by 2002:ac8:5bd6:0:b0:3f3:96c9:b071 with SMTP id b22-20020ac85bd6000000b003f396c9b071mr2872887qtb.26.1686129719348;
        Wed, 07 Jun 2023 02:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686129719; cv=none;
        d=google.com; s=arc-20160816;
        b=tnNOoWE1uZDFmRnP6ccGniTQsBBZ1yi/Pe6CTx/KlcrHtehROOqwsLj/Wp0wkLmLld
         TKaA4Xfmmvy2KNM7qjN2tfdLXpO968XfqUVjfEO801d5QEabE7LbgFfndNFExyIZRoHp
         WAyfjPudtijcFjCQ8N1jRTpezRTGQUYaFpcFulaYG4ZUSyHj4ibdgK2mh4M3wmNHTOed
         Gv9BeFpCa0rucmrH6ZSyaqoAbpwZ2fqFqOE9Gm3eUN9Dr3W0LrETNxaDqattk7noC4QS
         l7swnmkUimFyidchYQVNWAhwQVTQr1bWnLOVZqa6OwmnywYwARpYkxSeSxj9jN1CgNm1
         KVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=K6+3mXhasylhG3NCAfJQFpQhKfNebLWVdmyRgMEPFLw=;
        b=in4lmLeaqBxtguYhpMhL72D9IUO+TvvdMzoO0+yfZiqK4sQDr56jg1IusYLcnonGmw
         MOj8iwoDCuCltr21gol1TYgcBTFHmj4sP6Qq9kQRDk22vhgJVAxhqrdiVYxG4rBNTQHJ
         YSmJEpzkTbozq+X1wQB+KzZ0UTaSwtWskopkNqTb87/0zkECpbX2UxRGItZPR3Ma6q08
         GFB6/b2XGv1+rKEJSKS+BxEZNnHsiOrKmEVugT9wGyd5PQvFsafA+aFW7MdwEsWRIsn3
         icaKrF2UFGmGT+Ag9XuyC7loNarkbUUG+vl0FRsNXxWH2bdlRJAKNFh/GNmBBaLBhIxB
         VyhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14-20020a05622a014e00b003f684047805si7590386qtw.96.2023.06.07.02.21.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 02:21:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6pMH-0002ER-2R; Wed, 07 Jun 2023 05:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6pMG-0002EE-0b; Wed, 07 Jun 2023 05:21:36 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6pMA-0002ys-Mn; Wed, 07 Jun 2023 05:21:35 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 43D6A260AA3;
 Wed,  7 Jun 2023 11:21:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBbrlmDbPKqj; Wed,  7 Jun 2023 11:21:23 +0200 (CEST)
Received: from applejack.lan (83.21.93.182.ipv4.supernova.orange.pl
 [83.21.93.182])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 184BA260251;
 Wed,  7 Jun 2023 11:21:22 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/1] hw/arm/Kconfig: sbsa-ref uses Bochs display
Date: Wed,  7 Jun 2023 11:21:12 +0200
Message-Id: <20230607092112.655098-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m3ftw00l1pDl

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>

---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0f42c556d7..4484de67e8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -249,6 +249,7 @@ config SBSA_REF
     select PL061 # GPIO
     select USB_EHCI_SYSBUS
     select WDT_SBSA
+    select BOCHS_DISPLAY
 
 config SABRELITE
     bool
-- 
2.40.1

