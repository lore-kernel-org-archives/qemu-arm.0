Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp870910wrt;
        Fri, 4 Jan 2019 10:10:39 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V8hKCSihrLOKYt6PbUqWv/J3stuIad3Sdpj2N2HX7fjFRVxFlegkvi3m5qIgu4v1zN/fh2
X-Received: by 2002:ac8:2f38:: with SMTP id j53mr49626383qta.87.1546625439848;
        Fri, 04 Jan 2019 10:10:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546625439; cv=none;
        d=google.com; s=arc-20160816;
        b=lTU2bJGrg0ewgKh4/XxERoiClTxv2ELSBbI44kBf05TC/gSnlgVHkfZBPT5eptYFJ9
         HmPn8GrW9Fj0CaLQngLZ4ytOWjcCwl2dRuL8RgK79oTxut2YttC2RDobR+7AzFXvt87b
         tdMPcGFQRbNY7kSM1C8Tw3VX8at3QOg7PHM7jSRG+6KHMPEWvI5QOZ6C6UDcOysgxdHL
         y+h+qa/MBmRVYuoNnS0DyQqDsO0Su+f+eRumXVSVDWwbJMqIhRmy05gPU+KCquIfJjHp
         pYjCEYbFl68434DKodSVZjLvAg448hySRD4EFI8ISYS9Ykglwf4XH8ipT8A8CFBW7+6O
         0FBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=g73hqUsQXwv54PbEjLZXzwHwM93kGNkPfQLusDk4vhU=;
        b=HjoHSBPvx7P/Dhuuojw6uO1FAYspeFPoxDlJbrQFbclHzmJy1x1uHJQK5wODjXrPVX
         /qxiQkSLJl2yafoA3n9y4jn3vmUCjsLx43zKxIa5PKbDQNW014LWbNuC54VvoNSClfXC
         pqtrOARaDM9GwKBe4FmXiybASUD2+4vb2Jie3h8RBeeB1j0OK0s4jJKUKaxy2QcLEwFY
         L+7in1ayFOsrJ2BqlXmytiOMcAvZIxY0TGyAIftNxCPPwfck295/v4dDQD9ALKY/If7O
         vZHSlq1/VYL0ri1Xwn/rLSiFVuky1F4YEQdC0Jhm2Vay9BVI06vTfUALvw3OmHsbSxAW
         FoVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id r11si799188qvk.194.2019.01.04.10.10.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:10:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTvb-0007zO-6H
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:10:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTml-00054z-Qu
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:01:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTmi-0005OM-LE
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:01:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTmf-0005Jd-ON; Fri, 04 Jan 2019 13:01:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C230181F0C;
	Fri,  4 Jan 2019 18:01:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C02D5D6A9;
	Fri,  4 Jan 2019 18:01:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:41 +0100
Message-Id: <20190104175847.6290-11-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 04 Jan 2019 18:01:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 10/16] typedefs: Remove MouseTransformInfo
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ynLKg8320xk0

MouseTransformInfo is only used in "ui/console.h", there is no
need to expose it via "qemu/typedefs.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/qemu/typedefs.h | 1 -
 include/ui/console.h    | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 5d2b2925fb..927b340bb4 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -56,7 +56,6 @@ typedef struct MigrationIncomingState MigrationIncoming=
State;
 typedef struct MigrationState MigrationState;
 typedef struct Monitor Monitor;
 typedef struct MonitorDef MonitorDef;
-typedef struct MouseTransformInfo MouseTransformInfo;
 typedef struct MSIMessage MSIMessage;
 typedef struct NetClientState NetClientState;
 typedef struct NetFilterState NetFilterState;
diff --git a/include/ui/console.h b/include/ui/console.h
index c17803c530..28fd76c1c5 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -65,13 +65,13 @@ void qemu_remove_led_event_handler(QEMUPutLEDEntry *e=
ntry);
=20
 void kbd_put_ledstate(int ledstate);
=20
-struct MouseTransformInfo {
+typedef struct MouseTransformInfo {
     /* Touchscreen resolution */
     int x;
     int y;
     /* Calibration values as used/generated by tslib */
     int a[7];
-};
+} MouseTransformInfo;
=20
 void hmp_mouse_set(Monitor *mon, const QDict *qdict);
=20
--=20
2.17.2

