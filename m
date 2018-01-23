Received: by 10.28.71.27 with SMTP id u27csp3780246wma;
        Tue, 23 Jan 2018 00:28:38 -0800 (PST)
X-Google-Smtp-Source: AH8x225Q33BA4EzGbTkZYbqeA0y0EdMMxqD9p/U+VNtzXkHeC87WaC5zZu59HvcHGSWByxw4rcIl
X-Received: by 10.129.94.84 with SMTP id s81mr1572235ywb.243.1516696118260;
        Tue, 23 Jan 2018 00:28:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516696118; cv=none;
        d=google.com; s=arc-20160816;
        b=oWqG29Z5CGI2g1PsBLHxi4RnTa2zzvKkCpRXbMgw2wJKRF/yuw787InjGqG0DCNRPQ
         3yUx6naNBAMvTJFy0IoeLURl2gYzs1dmcyjWRPvsP5UN7diCdTAoPJWN41G9tUCqJWSJ
         QFqS3EjXogOK+/jXevubv2YriTmEwdDCSdY0hV2O0nuevrRsiuyumpRTCOnsGX+POTFW
         h53o4B86FsK2SfosPv4DE8/IyUoXfy/2lrQ4sG97Mmp4IGMUaIgiQAN0ejKcLPGUsb+S
         3efB3yTBaT/WwENGsZpOsHfzAf3yeMXTM6jCMwHPA2Pj7hxqaT7J/ZNhG5dyy3p3aY4t
         1D8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=lSaAjJyrd8OGlDHyhkpiKcBGP+FR90B8FAV7J2ShRdI=;
        b=mb90e/j8iFlqODLVThYH8AbX1UtB91KTpUO+s9cmE2JS5OVY0q4/pVBIyFB8yl0iBa
         VHKOZsU9urutiHJg0QIKC47n7XKe+zl/R65vstHwBHMEqegb8/U+snEA4yCIhYG6beTQ
         xmc7yy3qTWaKS+9b0b9s0lbClr0mb/+tbg7zjgfuXWer46Hhqt+5N2jn7FLFnjEh6wTr
         FYHEHOWfHwL9IhfF+Ov3OoqoN6po0Uba14VzPpSfaKZ+Knp9/y8B9B3kwQT0LDSdlI9w
         UWo9nNUVVd5OsnHWI4uXu/IQNmfO4x2i5bMZrV1CpAYXIBTaz3Gu5UvsW217yX/SgjYl
         7kCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z142si3930318ywz.443.2018.01.23.00.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:28:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtwb-00068J-KS
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:28:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfV-000898-Uq
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfV-0002Ke-55
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57188)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtfP-0002GE-0e; Tue, 23 Jan 2018 03:10:51 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34C9E8125C;
	Tue, 23 Jan 2018 08:10:50 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB5CAD1E7;
	Tue, 23 Jan 2018 08:10:48 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:21 +0100
Message-Id: <1516694904-64879-23-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 23 Jan 2018 08:10:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 22/25] tilegx: cpu: add CPU_RESOLVING_TYPE
 macro
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sj0FZ2SGqeuz

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Eduardo Habkost <ehabkost@redhat.com>
---
 target/tilegx/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/tilegx/cpu.h b/target/tilegx/cpu.h
index 71cea04..a73215e 100644
--- a/target/tilegx/cpu.h
+++ b/target/tilegx/cpu.h
@@ -165,6 +165,7 @@ void tilegx_tcg_init(void);
 int cpu_tilegx_signal_handler(int host_signum, void *pinfo, void *puc);
 
 #define cpu_init(cpu_model) cpu_generic_init(TYPE_TILEGX_CPU, cpu_model)
+#define CPU_RESOLVING_TYPE TYPE_TILEGX_CPU
 
 #define cpu_signal_handler cpu_tilegx_signal_handler
 
-- 
2.7.4

