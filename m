Received: by 10.223.150.237 with SMTP id u100csp744392wrb;
        Tue, 7 Nov 2017 18:31:01 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TKQFZy+WO/BUWiJ8Q1NwB6uUAPKnMlfxkhUwq2gYJF8ubHTayvUKW4zFx0oMLx7XU3XvVU
X-Received: by 10.129.87.215 with SMTP id l206mr500402ywb.190.1510108261806;
        Tue, 07 Nov 2017 18:31:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510108261; cv=none;
        d=google.com; s=arc-20160816;
        b=q6I2/5z4tBDllw10efQDthuR/9A75yYGCMaZYYOznVbGshOaYhFFnKJQM8CSKZZEMH
         Jd0WNvEExuboZ8wHjL2OMcZO5n8E5tOqeLoZPS/f9AATQaVxS8oAsEMqCDUSAxWhZ5RO
         ciSmwU6Ymo0e7tcLvGWLinAPBPC//9QZ/dJrGcB9uOJfdAL9/tqqc+OGqV558CRABVn/
         Hysw0dEPC/nVuWEskXmgrytT5svhrrb/dbAxK/7yVqFg/Z0CL3TXPuWjK9DByYeONFpb
         0VHz12mAzqFY7Yl8OoOzD8RkFQxTkF47vj6l5rAgGD/hIzqPRcDGH6bHnm5HZ8JMQO0b
         H/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=LBy2Kw8BNiuod2ODEnVVamVGOitElZfYJlHkuDKlMmk=;
        b=PpSN7EUgTqbvRcE9RUNErxw1By7W/9eWw2jsIKEb4qL3bLfjGoL3qtLBbAusA7yWSO
         pUxIBlTn5KAXkARrXU/ozeJuj5uzzF3YrEGAJEmgqzDujpsgUA0uBRrJPWFzy67S/ddU
         nr+3XZOQ8N6hKecyFi6ZV0RG6nDFOjIpVtbIG9uTk+457vrQOA4HOzwgpEnhj3SBwtSG
         RNJrO1Aqrox8u5Sh+69REL7CJ2OQMYWN7SRAnIgP+uhI859OJ6l5w/DbfRVB6p8sZMJb
         tySEazJEYM3POEY8ZmTNlc2qnPnN8LI+tPtPJfSj/qRVcPrrz4rLBJJ1ibwUc6pWa6WR
         4gVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dXT/XEaM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f203si623205ywc.70.2017.11.07.18.31.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 18:31:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dXT/XEaM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCG8r-0000yl-6a
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 21:31:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCG70-0008Nj-4v
	for qemu-devel@nongnu.org; Tue, 07 Nov 2017 21:29:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCG6w-0005H0-1V
	for qemu-devel@nongnu.org; Tue, 07 Nov 2017 21:29:06 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:48542)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCG6v-0005Gk-Sz; Tue, 07 Nov 2017 21:29:01 -0500
Received: by mail-qt0-x244.google.com with SMTP id f8so1622946qta.5;
	Tue, 07 Nov 2017 18:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LBy2Kw8BNiuod2ODEnVVamVGOitElZfYJlHkuDKlMmk=;
	b=dXT/XEaMsc+6PMsQtigTwLBvtKQywCvVulyXXt2wYjixbpQtQv3uNLLTL4ROXBL4j/
	0qv2W4Q31ZO9oazW3c+S0IsIJ+YTjFVFGXIJ5BMdYie8yS0bO/+jPMJpk1bzJREaJH07
	ONAF5XP8ohUd9dAXz2Clg7XohKSQngf1KFDrfmlIvhc8FnUSmvkTEx/1M18dsD0vN7iZ
	UR5M/NlEtKLdtzscNqwFqCVSjLcvzTP4C5DLJhVqAs4WAyEnaSjyizTquc7ThLwg9xgg
	v/6pP1lpzDqvaMrj11UvE22BPoj+Dg0l3zdETab9etzjTGZCAWoeeUH3pmaOV04wfclA
	+9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=LBy2Kw8BNiuod2ODEnVVamVGOitElZfYJlHkuDKlMmk=;
	b=igbGZdJG4/7nbPJ9sqXeSqEmzVcc4rSbdnLMtWS8lnZvYeiZLKqnL9z778dENZUI/H
	ie85NiA1z6I44IpvBkrRDn0yj90MoIlrFkKQwPIZvJ4fhFDgcFOrmzKl4/IsqxCzdWIf
	x0l7emSC1zuBJaC454QWRAZ0PZgS8Mb0/3llMh8cM3RcCfesa46gRauvQmK8uNNu3+rI
	0WSJS7kZHGvx3gz4h695+YgZiNqWkmDihGKAWkoBR+oZfHpizNqSNRdPy237IiAa4jEF
	DTiSfl4Njdr1K7T/99L34Gu6YWSbH6r78vOsoRtTyIk78LiBXIcMwjOMyqMpjGJMzSH0
	jM/w==
X-Gm-Message-State: AJaThX7s5styEoTKNxVrQFZWitT7wJcBAqpRAgWjecM2NvRp+MieuNrD
	3NvNLMauWKfspfF/fC1uksuKzyEO
X-Received: by 10.237.60.154 with SMTP id d26mr1152037qtf.227.1510108141383;
	Tue, 07 Nov 2017 18:29:01 -0800 (PST)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	a190sm1971772qkg.15.2017.11.07.18.28.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 18:29:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue,  7 Nov 2017 23:28:24 -0300
Message-Id: <20171108022828.7242-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171108022828.7242-1-f4bug@amsat.org>
References: <20171108022828.7242-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [RFC PATCH 2/6] hw/arm: deprecate the EP108 board
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cCqbD9XZl/Nq

From: Alistair Francis <alistair.francis@xilinx.com>

The EP108 was an early access development board that is no longer used.
Add an info message to convert any users to the ZCU102 instead. On QEMU
they are both identical.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-zcu102.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index e2d15a1c9d..d42b6e3d3a 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -164,6 +164,8 @@ static void xlnx_ep108_init(MachineState *machine)
 {
     XlnxZCU102 *s = EP108_MACHINE(machine);
 
+    info_report("Please use the ZCU102 machine instead of this machine.");
+
     xlnx_zynqmp_init(s, machine);
 }
 
@@ -180,11 +182,13 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Xilinx ZynqMP EP108 board (Deprecated, please use xlnx-zcu102)";
+    mc->desc = "Xilinx ZynqMP EP108 board";
     mc->init = xlnx_ep108_init;
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
     mc->ignore_memory_transaction_failures = true;
+    mc->deprecated_reason =
+        "The ZCU102 machine has the same features supported";
 }
 
 static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
-- 
2.15.0

