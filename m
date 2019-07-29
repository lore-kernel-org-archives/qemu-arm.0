Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3247380wrv;
        Mon, 29 Jul 2019 08:00:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5I2faTYGplxzoGOD0cXlQKzFb/wXY3+z/zmaCcPXFFVq1rHZZwiJfJA2PD7tXlaxY5euC
X-Received: by 2002:a9f:2265:: with SMTP id 92mr54281046uad.121.1564412447418;
        Mon, 29 Jul 2019 08:00:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o78si13718491vkd.37.2019.07.29.08.00.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 08:00:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1jjxZVGU;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hs78o-0006Tp-HS
	for alex.bennee@linaro.org; Mon, 29 Jul 2019 11:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37810)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs77D-00048G-IO
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 10:59:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs77B-0004Z2-N8
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 10:59:07 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:48188)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs77B-0004Xl-B7; Mon, 29 Jul 2019 10:59:05 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id 10A3F96F67;
 Mon, 29 Jul 2019 14:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hIw9VOnNOvv6i5KDhQD4nJN5V8svLGb1uTTCxjQz4rM=;
 b=1jjxZVGU+7Ozaw6ODz/G0/Dtymc7847a7SEXlr0up1TjHwz5PMFGuNsY8v+4OdwF6eWrkA
 kf1oAzau6OYvz50HU9jrVw3r/b62NoW9nZkcPw4CGQS8O7jgjg1G3ZhFEVuLRwyYgX50Xg
 xKviJU+60D6gFZztOztafbJSCOTxBnI=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:31 +0200
Message-Id: <20190729145654.14644-11-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hIw9VOnNOvv6i5KDhQD4nJN5V8svLGb1uTTCxjQz4rM=;
 b=wAZ0WXR22PWrixZWMTlufg5mgCs2YRIK9liXy/YpNo2FyRBHOlhI1M2/oxXOnbuFtbHPEB
 WBTw0KJinWKLcjNeVinkf3RN5GIbPqEgzGKLI+VyieJ0/498tAq40v7TrCAm+RImD/f2Bb
 Y9C3cVeDb3QBgflR59T/oxcqRfcGlBI=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412344; a=rsa-sha256; cv=none;
 b=58H2EsS5g1GX2LiVQ1ar3zUzQameEIsMpV+poV7zJ7ItawiKv7RzPiwP0+uBl9bZrHyRXI
 JOTPnXCaLtNETogtjm53EgW0Ng1Hx27BenMRzwJ1w5/9iV/T07N+L4ngSTIxVrhEvhbLEI
 aeRfvsbvVTBO61ojGKhKAYOjESDQsUU=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [PATCH v3 10/33] vl.c: remove qbus_reset_all registration
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 kraxel@redhat.com, edgar.iglesias@xilinx.com, hare@suse.com,
 qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, rth@twiddle.net, thuth@redhat.com,
 ehabkost@redhat.com, alistair@alistair23.me, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, jsnow@redhat.com,
 david@gibson.dropbear.id.au, Damien Hedde <damien.hedde@greensocs.com>,
 berrange@redhat.com, cohuck@redhat.com, mark.burton@greensocs.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oNKE+X8lWRGr

Replace deprecated qbus_reset_all by resettable_reset_cold_fn for
the sysbus reset registration.
This does not impact the behavior.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 vl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index b426b32134..5a465c8236 100644
--- a/vl.c
+++ b/vl.c
@@ -4421,7 +4421,11 @@ int main(int argc, char **argv, char **envp)
=20
     /* TODO: once all bus devices are qdevified, this should be done
      * when bus is created by qdev.c */
-    qemu_register_reset(qbus_reset_all_fn, sysbus_get_default());
+    /*
+     * TODO: when we have a main reset container/domain object, use
+     * it to fully benefit from multi-phase reset
+     */
+    qemu_register_reset(resettable_reset_cold_fn, sysbus_get_default());
     qemu_run_machine_init_done_notifiers();
=20
     if (rom_check_and_register_reset() !=3D 0) {
--=20
2.22.0

