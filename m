Received: by 10.223.159.74 with SMTP id f10csp5601619wrg;
        Thu, 7 Dec 2017 10:15:27 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZknMkY6ysJCkwQzT5UIduBha6uhDaZPF158Ohx9i1lA2xuozYdZOSSzeuBFPcVWoPbPdvI
X-Received: by 10.37.53.6 with SMTP id c6mr6804019yba.114.1512670527229;
        Thu, 07 Dec 2017 10:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512670527; cv=none;
        d=google.com; s=arc-20160816;
        b=Hi+wnUKAtQLDPLAcPaRr44/ATDnuvLhjQAt3nn1jLIR4FC7OsyC1s71smOvACl0KFQ
         MGWHI025/5Yc5DXIhWSCw8uxBqczKHO45qlNkFY80itSqXasNYl3plsumqpxwfmCNQ1L
         DLyQtVM+5TDQtQH1Eqy2brsFYWlWy/wS/OyWVZ1SnHgSLgJXOQ97mz3aakOs5E/kSyUg
         ZsvgsPPYO/mRb90qo7HiDtCcwv5khsjOcImuVFmFIsS+LJKE0svpqbIP2tLO767GsLt9
         HiOrXJ+9Ego5DVbxxlM6plFEcIJL9qMSDESukyn+AiY5lRjryTny3iVOVormTQHeoYB1
         xNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=MrnPMjcCFVbIPfwGsqGrqBOkH4LEvn4+mJn/CWsa2MI=;
        b=KxUk0e4ppaAI7xg+wRn3AJ89+oPoRYvCq57AuB8yu/5Zf5J3n7jjZATQ3WEcuHMfl6
         pNdLMjruOuHjtddqdT5fScsjDp565ZqVn1RSokLo/NQS0OYxzF2OdFKkZ09xg4NbE+/S
         HYQ9VA1dEJOmeXd+fC+db6UB8zT1479kQHHFf3o8KbtQYdUiCeopvjdQGBguIftruBeW
         06Col9UMMpOpaoe21WcxcqU11PfwhsgwyWCaobvue/2I7CWcjbijFz9NXUYSOoDPAsjX
         uiFLpHFqZZQwN3KAzDeHL7+G4HQn/iu1jExnfvtJNJ+y292N7Qf0GrddExXf+Khhj8p0
         Ml5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a5si346058ybl.423.2017.12.07.10.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Dec 2017 10:15:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33725 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eN0hi-0008U5-J8
	for alex.bennee@linaro.org; Thu, 07 Dec 2017 13:15:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eN0hK-0008GR-S3
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 13:15:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eN0hK-0006nc-05
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 13:15:02 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eN0hJ-0006li-PQ; Thu, 07 Dec 2017 13:15:01 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eN0hD-00081H-4c; Thu, 07 Dec 2017 18:14:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  7 Dec 2017 18:14:48 +0000
Message-Id: <1512670493-18114-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/6] hw/arm/virt: Check that the CPU realize
 method succeeded
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
Cc: "Richard W . M . Jones" <rjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QKishNOK0E5F

We were passing a NULL error pointer to the object_property_set_bool()
call that realizes the CPU object. This meant that we wouldn't detect
failure, and would plough blindly on to crash later trying to use a
NULL CPU object pointer. Detect errors and fail instead.

In particular, this will be necessary to detect the user error
of using "-cpu host" without "-enable-kvm" once we make the host
CPU type be registered unconditionally rather than only in
kvm_arch_init().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 151592b..62af013 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1402,7 +1402,7 @@ static void machvirt_init(MachineState *machine)
                                      "secure-memory", &error_abort);
         }
 
-        object_property_set_bool(cpuobj, true, "realized", NULL);
+        object_property_set_bool(cpuobj, true, "realized", &error_fatal);
         object_unref(cpuobj);
     }
     fdt_add_timer_nodes(vms);
-- 
2.7.4

