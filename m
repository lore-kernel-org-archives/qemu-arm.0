Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2339629wru;
        Fri, 28 Jun 2019 03:40:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytrnntaa3Rqv1tqvAGvFTRTpaMJIu3WmHxQoszvuEHgsijvTqsZ8aVPr9/bYXhT36/9BFM
X-Received: by 2002:a17:906:6550:: with SMTP id u16mr8028285ejn.7.1561718431654;
        Fri, 28 Jun 2019 03:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561718431; cv=none;
        d=google.com; s=arc-20160816;
        b=atgZXrQXwt1bHKXnsHvihKueY4XLc0N0jrvvzkk4gfp1mgzlcr/cw9VPSzJGje2YHK
         Q2tXGcaf9fceXmSXnbTg5wfqEzCDYg+/u4lRwCCkQznC8aXR1LjM324x4xa8mdxmIcCQ
         NiF+6iSmFi+UgDmXDhTrbfoegNLKOr0hjJd1Rr+yhReWkoJH3wNcZ6gnm4XFtansZhAC
         nWhWn2WkRU8O8tmkO9aDQmdy4qp9dWg95IHTOxUNlKZR9YJMUerSrnQaDoUWIcY+8Cng
         CaEPdbvUDJRAUpR0Iv7//VxKpVcNmWcXnUsCNUbwuECC3Hw5SUip4evm70zeAphooMvF
         Y+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=q52iBGAqOX0ewXQmhc5oHUO2e1gEMvE7Tn6VbXqqHFI=;
        b=jOJJGTguVYzFF7aDf+iwKkvI68vAf8SlUjE1rZg1vmY+64d6oXGf8HsXp2yxGPIteo
         9TYDgFZwuM8yfo6LMdQQNe3qj7+Ju9emSML4x+g/s29fQ3R3UpCjZlwQy3E2AbwSxOSs
         CDK+H1Rx7XCC64TrFjU2XVw/PyV84oFrw6kopoQd9jqYpGrjD03PP8Vvi8m5RrMTGZ+0
         lHSv5EjUHVJYMGEWzfnsriXdEJ7CsoOcOUL7eRe/fWmkrOxJGRWI/wDTLI3/ik/dhCgp
         69Iko4OlfjWOXm0J0AQuAHH3jSWNcqFBotzO+IdYfBJDSW0EXzj+t2+YTEcWT80mtCSr
         7QJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z23si1661346edd.410.2019.06.28.03.40.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 03:40:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hgoIw-0002H6-Md
	for alex.bennee@linaro.org; Fri, 28 Jun 2019 06:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60461)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hgoIk-0002Cl-QK
 for qemu-arm@nongnu.org; Fri, 28 Jun 2019 06:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hgoIh-00061Z-6e
 for qemu-arm@nongnu.org; Fri, 28 Jun 2019 06:40:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50644)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hgoIg-0005yF-Ua; Fri, 28 Jun 2019 06:40:15 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7403059473;
 Fri, 28 Jun 2019 10:40:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F6A860BEC;
 Fri, 28 Jun 2019 10:39:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 20AF81747D; Fri, 28 Jun 2019 12:39:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Jun 2019 12:39:55 +0200
Message-Id: <20190628103957.9504-5-kraxel@redhat.com>
In-Reply-To: <20190628103957.9504-1-kraxel@redhat.com>
References: <20190628103957.9504-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 28 Jun 2019 10:40:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 4/6] seabios: add config for ati vgabios
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8/IQlSrjf30w

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-id: 20190620151104.2678-2-kraxel@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/config.vga-ati | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 roms/config.vga-ati

diff --git a/roms/config.vga-ati b/roms/config.vga-ati
new file mode 100644
index 000000000000..12506b664442
--- /dev/null
+++ b/roms/config.vga-ati
@@ -0,0 +1,4 @@
+CONFIG_QEMU=y
+CONFIG_BUILD_VGABIOS=y
+CONFIG_VGA_ATI=y
+CONFIG_VGA_PCI=y
-- 
2.18.1

