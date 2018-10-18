Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2382157wrt;
        Thu, 18 Oct 2018 07:36:30 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62vu1w0T0BuezXdTieqVu2c1nDTtdF8Z7a8sOszVJMuZgPnyftJHxfpfnFxfcRB9pBbyyS8
X-Received: by 2002:a0c:b0a8:: with SMTP id o37mr22044348qvc.49.1539873390685;
        Thu, 18 Oct 2018 07:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873390; cv=none;
        d=google.com; s=arc-20160816;
        b=0qlk+uEp1c4iQoalhBhzWk1z3WjsWOmDTuIgEbZB9u7kfjcShZj5+l3CXbKZmo058e
         QRcsqvOuHEf/JbSOnNUAEweLqG9DtcqG5MfFqBkWv/iKv+Ib+JXwP8BPYalf1yCGqaXe
         5r69FXc/bQ05pacF92FlqLawfOEhgLmKfIXO8U/5wgRJd/KnwKcOYGbAT4hZa6E7f+2D
         SrzQZ2wJeJF07b79bw/FAud9AFv6cWq0J+CEAJUJufiRJQzFJapy734/3JG+iVAA70xv
         dhEECbuqSPfJRFU5e2A/J0UWzSyHJ+njAV8ttwVKc2lmqCJsObKXRgFlHdBo5toR1qQX
         t7Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Talz48iHc8qby5dJnoVPG+OX8KvePgstZGxDBlYZMfA=;
        b=JzB/TgGOyMOBAtXYp0McJOvSEZ7cZvRUz3o5Z15NlEjb7BC61kCU+jSkxZp2KQ37u0
         dBVy/h31+bSlFn159Z/sDRLvq4CdsafpMG919ceZcsbX0Gr7ua072HTS7buTkYONjL83
         jr7gJOIeKxJNfnUKUzwwA2g2OJGhWKi/ZZLcOceLUr48mhT97mFZTDOukJSrzUFcyrXV
         VrDB03rDHadi+gSp+KudetosyAfd+zkWxAy20gVWN8n6JAu4XZYL6IruH3RAOYYRmMZ2
         wuPWq0WZDcTSwZOmruJGWlggUjwOUSnu9kqFXGVLkLQYqIZeae0GinXaHtu4S9L/Aulo
         1tYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z39si2881411qvg.77.2018.10.18.07.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:36:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9Pa-0001fd-6S
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:36:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Kv-0005qy-37
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Kt-0007E5-O0
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53854)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9Kt-0006vO-EI; Thu, 18 Oct 2018 10:31:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B06E188E55;
	Thu, 18 Oct 2018 14:31:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13DA4789A3;
	Thu, 18 Oct 2018 14:31:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:31 +0200
Message-Id: <20181018143042.29588-6-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 18 Oct 2018 14:31:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 05/16] vl: Set machine ram_size,
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
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fqa3t1188zOL

The machine RAM attributes will need to be analyzed during the
configure_accelerator() process. especially kvm_type() arm64
machine callback will use them to know how many IPA/GPA bits are
needed to model the whole RAM range. So let's assign those machine
state fields before calling configure_accelerator.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4: new
---
 vl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/vl.c b/vl.c
index 4e25c78bff..35b426debd 100644
--- a/vl.c
+++ b/vl.c
@@ -4266,6 +4266,9 @@ int main(int argc, char **argv, char **envp)
         object_unref(OBJECT(current_machine));
         exit(1);
     }
+    current_machine->ram_size = ram_size;
+    current_machine->maxram_size = maxram_size;
+    current_machine->ram_slots = ram_slots;
 
     configure_accelerator(current_machine);
 
@@ -4470,9 +4473,6 @@ int main(int argc, char **argv, char **envp)
     replay_checkpoint(CHECKPOINT_INIT);
     qdev_machine_init();
 
-    current_machine->ram_size = ram_size;
-    current_machine->maxram_size = maxram_size;
-    current_machine->ram_slots = ram_slots;
     current_machine->boot_order = boot_order;
 
     /* parse features once if machine provides default cpu_type */
-- 
2.17.1

