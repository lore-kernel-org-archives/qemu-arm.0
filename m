Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9832474wrt;
        Wed, 5 Dec 2018 12:59:45 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VXOfNw2+SuB0N5wVW/Pa1tERl5HdanSdc053YfVedZXRpG7m06ufPEhXMndExEE5vMs719
X-Received: by 2002:ac8:6c3:: with SMTP id j3mr24603247qth.84.1544043585025;
        Wed, 05 Dec 2018 12:59:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544043585; cv=none;
        d=google.com; s=arc-20160816;
        b=bNs7I4VjGkBus9a6NctVN8OmqeOobl1Dzysn0cLSMTT7ujjwdI8p07LGfh0wEbhFQE
         31H3ULC5Kvcw+uY/AmDUW8gqXwMZAYraun4rL0dC4qamC3wLtBqutfCovDm/1HbJfjl7
         bLOrBCp9IIC7j8AqwhnBG1BgEvmOuz3m6JLrvBXQH8c62/QaDlBKlgzi0KOvxhSy21fh
         NpaGagss8DClM7CoroviBoAc/SHyDD6GBwG+CS9KfqmrYDcocVZr6/bNiEyUiKD09+QV
         tXYn2Ak3Rlz5qao8ALGTPAJ7H2jA473J0oZRiQSnET0pf3le6fNR1ptar3oU+fJirLFH
         0Ecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=U77KvVHyL6Fud+TTqS45dER81a3EO6u6/0yHHS7NW7c=;
        b=WW+bFN08J+VKBBPzLgIKUvFIpllCDmZtNV8PhVJpiqTGKV49OZby+t+zY/I6zUQ/Lq
         0r4R+gSLntcmiSq1haRaYHn6MbRS+g5/LvGkqA61Gnw31ChVICOQbmzdd9c4CEE66rxB
         XCZrRh+2SWqWfmCQ4dg0xUTzFHgMtUcqVT34sViFBXGlPeBiNLPO4Z4r9Kor7qOkvdPY
         ZHWr6nv0ERb7l6DjmWhCwqz8bh5VVtNUSPCgtPSxFgWdZexDZ2l/wuuC3jpMgnGUPkgn
         +ctQf29CylXZGoPmAGxnZKxvzWKWA8N6JQeKZo9OtOqzlMPBqsUkvYWjgl+JXwU0WgQx
         7MTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si7798957qkj.31.2018.12.05.12.59.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 12:59:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUeGm-0008RG-CP
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 15:59:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUeG7-00083z-IR
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 15:59:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUeG6-0002bb-OT
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 15:59:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41734)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gUeG6-0002YK-H9; Wed, 05 Dec 2018 15:59:02 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B14C53083394;
	Wed,  5 Dec 2018 20:59:01 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64AD3194B3;
	Wed,  5 Dec 2018 20:58:54 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Dec 2018 18:58:25 -0200
Message-Id: <20181205205827.19387-4-ehabkost@redhat.com>
In-Reply-To: <20181205205827.19387-1-ehabkost@redhat.com>
References: <20181205205827.19387-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 05 Dec 2018 20:59:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-4.0 3/5] spapr: Use default_machine_opts to
 set suppress_vmdesc
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yTDxV0W1fGaQ

Instead of setting suppress_vmdesc at instance_init time, set
default_machine_opts on spapr_machine_2_2_class_options() to
implement equivalent behavior.

This will let us eliminate the need for separate instance_init
functions for each spapr machine-type.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/ppc/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index f6b60e6fbd..0c3b27a8cc 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4368,13 +4368,13 @@ DEFINE_SPAPR_MACHINE(2_3, "2.3", false);
 static void spapr_machine_2_2_instance_options(MachineState *machine)
 {
     spapr_machine_2_3_instance_options(machine);
-    machine->suppress_vmdesc = true;
 }
 
 static void spapr_machine_2_2_class_options(MachineClass *mc)
 {
     spapr_machine_2_3_class_options(mc);
     SET_MACHINE_COMPAT(mc, SPAPR_COMPAT_2_2);
+    mc->default_machine_opts = "modern-hotplug-events=off,suppress-vmdesc=on";
 }
 DEFINE_SPAPR_MACHINE(2_2, "2.2", false);
 
-- 
2.18.0.rc1.1.g3f1ff2140

