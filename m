Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3695895wrg;
        Tue, 18 Jun 2019 05:59:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqykHFPcgyMpkof/zSRsCOqoy4GEdo2FADiOLVPEH/4h2x6q0Od56soArvIvfgKGAtSjdsM3
X-Received: by 2002:a17:906:2890:: with SMTP id o16mr75676332ejd.80.1560862761069;
        Tue, 18 Jun 2019 05:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560862761; cv=none;
        d=google.com; s=arc-20160816;
        b=LlA8l5pcPY84peFhuuQ2bIrw4coqMhgKV+9KBVsaYQszDpRMsDtMdlAzCuC3te/2d9
         IHAeZI0SMbDJ6INlz1WPX5RpIozPfm000tGaSaB+SvftdF6DKHN8We5u5yUeXIhlBnbI
         +EaS73cUu1YLn4Mn+zozcgN/sYsMj0OxwacsjEqneF4Ucv8AFY6MCU7yXr2oIGHSdqoP
         1rM4tHUmI7Ii1kfA/SvXfe+yidhW2ixCnNyqO287BzvmzmaCiuPsF/Q/AV2WsqNhUNxT
         x8XAqN1vcar5kDAOeXRh4VHkmX5IHktZOjXt/AID7IGvD/L4f/VGEe3XAuJvRPxjn3TA
         ekSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=9fWpsy49pOZEU3fIeipj0urTg1lrcKHWmb9lpIs81yQ=;
        b=wuCDHvOcO4TWI/6GbTCFyuhgUkMDrJlO2Dc/tjWhUf0Mca0Xjhdj0U1T/ShpsGrmdv
         PNp8FIsluxc7SPicBnKlaFHoNHtu7SBZtDtXlqpjYBIfuDgkaDwcSny1vpdUd+Ye2bPK
         Ofy6DB6cPPxQsIbHa2l+WFsucmSkGfO4Fcr83okNwIdVc5ntWMWUy56sjt+9zP+Yt6pG
         6jdS82qNJabWM4NHmyVKSZDpaM2WiJJHSi1jtKidPkWILisMY9lFeUkMEHADsPIklbqz
         sxvVniWlsKd2KOSZzjWuY4XL1kRnigI5sDbavVKqJP+GnJW9jpVtq/UskciMi+SGjOBP
         IzJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 91si7956359edr.174.2019.06.18.05.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 05:59:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdDho-0003ip-6i
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 08:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41382)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1hdDhZ-0003i6-2Q
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 08:59:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1hdDhX-0006wV-OT
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 08:59:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59060)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1hdDhX-0006sQ-J5; Tue, 18 Jun 2019 08:59:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 56817882FF;
 Tue, 18 Jun 2019 12:58:51 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FC6E36FA;
 Tue, 18 Jun 2019 12:58:45 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 18 Jun 2019 14:58:44 +0200
Message-Id: <20190618125844.4863-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 18 Jun 2019 12:58:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm/boot: fix direct kernel boot with initrd
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iYHehMO9Yp4V

Fix the condition used to check whether the initrd fits
into RAM; in some cases if an initrd was also passed on
the command line we would get an error stating that it
was too big to fit into RAM after the kernel. Despite the
error the loader continued anyway, though, so also add an
exit(1) when the initrd is actually too big.

Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
DTB off the end of RAM")
Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b2f93f6beff6..1fb24fbef27e 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1109,10 +1109,11 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
                              info->initrd_filename);
                 exit(1);
             }
-            if (info->initrd_start + initrd_size > info->ram_size) {
+            if (info->initrd_start + initrd_size > ram_end) {
                 error_report("could not load initrd '%s': "
                              "too big to fit into RAM after the kernel",
                              info->initrd_filename);
+                exit(1);
             }
         } else {
             initrd_size =3D 0;
--=20
2.20.1

