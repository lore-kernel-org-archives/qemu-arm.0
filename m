Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11491854wrx;
        Tue, 26 Feb 2019 12:49:24 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbyaAGqjzq426uNXCQ04ABMMoxgWhZxabSsxFEzhb891YNG/Bxr8hCxkGhM+ZyVZGh1pXpb
X-Received: by 2002:a81:70d7:: with SMTP id l206mr20157152ywc.141.1551214164745;
        Tue, 26 Feb 2019 12:49:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551214164; cv=none;
        d=google.com; s=arc-20160816;
        b=YF4TkCVqWxqcmesmnssQGgDfbHspGjQuQg/DsjL7TlTrQRmwc9uNltJuKmsxQQOf+w
         KA5Z6RH9EFbVxpjCPDezUckSyFvuh3AXP09rBBg/j86I9TM7mQTSCu9b0lNhxLDZm8dF
         l6U6ZxHVew7MMbXbc3xsdbMPHjkhl7+P/ATxPXfiOyfyajkQPEWcXG4atW6A/ZzJXqLo
         aZDqWOepe70sshZPNKvTml7ExuKxDfzF6r50PWdUDs/m67hzWEuwbtBKq/enjfNYm4Jk
         PtM6x0WKZ+t+pY5SQa2jYp3GF0TxLbyGMTJkGPFGWGUoPZi26wvB/G44sl2/oWI6pzNG
         ttrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3ZU/w5s3aqCJwqFuNMmMLFEPqRqeQab6hCDJZVmU42E=;
        b=hSLnyS8ZX2fTpQSJ3rP54J617+YkVwUvhFUIprae+63zJkXOy0vi5+xAiznG44mgzB
         blN3lsA25cynF5p7P6lbDBA7Js4tkhQKty+NgKCE4IgHcgqCEhDEQryM10OBInXiMW7E
         Y0Y0Hh+HwpgJzB7lLbW+PUHtEXYn028UrJMe0idoS+PwKghXthBxOaEo6vZ5yMVE3beg
         FJ6d/IwxeWi4Ywbkbx6xWjBDDfEgOvlbDR70rRtcO15Bp+03wxuFakuVdTqbd1BezAHh
         XkBp/Nq/GgH7l4N++eUk5uJDFsynMakr3SeSe0lfPqAnPO5RquX//YupFmHEdIDDYYro
         3x5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si7489107ybi.282.2019.02.26.12.49.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 12:49:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:32960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyjfI-0000Cb-4j
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 15:49:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjbJ-0005mA-CU
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 15:45:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjbI-0008Tp-MZ
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 15:45:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40634)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyjbI-0008TJ-Fz; Tue, 26 Feb 2019 15:45:16 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD86630DDBB3;
	Tue, 26 Feb 2019 20:45:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2B635D6A6;
	Tue, 26 Feb 2019 20:45:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 21:44:27 +0100
Message-Id: <20190226204439.2296-7-eric.auger@redhat.com>
In-Reply-To: <20190226204439.2296-1-eric.auger@redhat.com>
References: <20190226204439.2296-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 26 Feb 2019 20:45:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v9 06/18] vl: Set machine ram_size,
 maxram_size and ram_slots earlier
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yloq1XNi5bf+

The machine RAM attributes will need to be analyzed during the
configure_accelerator() process. especially kvm_type() arm64
machine callback will use them to know how many IPA/GPA bits are
needed to model the whole RAM range. So let's assign those machine
state fields before calling configure_accelerator.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v7 -> v8:
- added Igor's R-b

v6 -> v7:
- add Peter's R-b

v4: new
---
 vl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/vl.c b/vl.c
index 502857a176..fd0d51320d 100644
--- a/vl.c
+++ b/vl.c
@@ -4239,6 +4239,9 @@ int main(int argc, char **argv, char **envp)
     machine_opts =3D qemu_get_machine_opts();
     qemu_opt_foreach(machine_opts, machine_set_property, current_machine=
,
                      &error_fatal);
+    current_machine->ram_size =3D ram_size;
+    current_machine->maxram_size =3D maxram_size;
+    current_machine->ram_slots =3D ram_slots;
=20
     configure_accelerator(current_machine, argv[0]);
=20
@@ -4434,9 +4437,6 @@ int main(int argc, char **argv, char **envp)
     replay_checkpoint(CHECKPOINT_INIT);
     qdev_machine_init();
=20
-    current_machine->ram_size =3D ram_size;
-    current_machine->maxram_size =3D maxram_size;
-    current_machine->ram_slots =3D ram_slots;
     current_machine->boot_order =3D boot_order;
=20
     /* parse features once if machine provides default cpu_type */
--=20
2.20.1

