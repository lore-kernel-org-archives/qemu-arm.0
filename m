Received: by 10.28.71.27 with SMTP id u27csp3778320wma;
        Tue, 23 Jan 2018 00:25:46 -0800 (PST)
X-Google-Smtp-Source: AH8x226YT/dKE95abNgBtc/zob4uXUdb5sxeps8jAMXpwUz61tVivKeTtN39QXmSMSd885ZAXIkZ
X-Received: by 10.129.236.6 with SMTP id j6mr1586797ywm.160.1516695946663;
        Tue, 23 Jan 2018 00:25:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695946; cv=none;
        d=google.com; s=arc-20160816;
        b=bZDQYe3tORIw7rTNRZxY4vazOOBkHSLbQbqKdcg7J/F1ARqHJyvm3Vv6t9yID7b5VT
         qV8+Fe+h/r74gKFGUomSnC/0ZoKHq1NpRejX+6SsKT0PcMrQQ1e8d4Nav+01XQbFeT5I
         uVIqETuD41aQo7eDQ6StuaE44IiN2Ow9HFDqlO00VeZPX5c4s69uDYAHZ8V5sdKzhYmL
         D/+vHym7z+ly58OhBdgf5K7oSzpvYTb809oPxCVaqckCcv0iwG81sMfmIz66sQwuMHDy
         CbC8jeouuZ6l3i6m45VcEq3sC7LG/+mRemi/K3TpF6/5gI0ptAgyCOIjswYj8xTpHqbz
         WfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=2kD2xQxzYUUbuM6hgO65McsTpplB73DxMY5UTA9Tsk4=;
        b=s0AIeZvIWdh6+ghTeETykm+KQO3yB+NnKb2fISc2KrhU1zTeqJsi2oIXCh3oh6mJHZ
         Atm+ngLtyqTKepUMnhDnRtJW/A2kYRzuNASjEMTH/D0+in0dMVacivCfOxBV0ocHtJ2P
         GzvcFVxnRtSVLd9MDIdqzIGoDJIRwS7In92YVaVCh6TAnfNPGy1iNAZM+d/MVqbsjY+7
         RsGzCU9tFUQGjLowRxAsYUU9xbl/4AJGmyAjDJ8cbmGLrzfoMDLxlIAzWhs02j48zee7
         gTbYDOGEhuK6z4gfnNnGop3t7NXdWKdUyv4Pj3sXbF1QsZwGDWV+TMsnaXku2VGcOKsz
         jDPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i13si2343918ybh.337.2018.01.23.00.25.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:25:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edttq-0003RS-0X
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:25:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfT-00086v-WE
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtfP-0002H9-Gb
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 03:10:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtfN-0002Ev-Dk; Tue, 23 Jan 2018 03:10:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91F743DE3F;
	Tue, 23 Jan 2018 08:10:48 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C8A3D1E7;
	Tue, 23 Jan 2018 08:10:46 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:20 +0100
Message-Id: <1516694904-64879-22-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 23 Jan 2018 08:10:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 21/25] hppa: cpu: add CPU_RESOLVING_TYPE
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ueJJovk586k9

it will be used for providing to cpu name resolving class for
parsing cpu model for system and user emulation code.

Along with change add target to null-machine test, so
that when switch to CPU_RESOLVING_TYPE happens,
test would ensure that null-mchine usecase still works.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Richard Henderson <rth@twiddle.net>
---
 target/hppa/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 8d14077..b92ae3f 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -113,6 +113,7 @@ static inline int cpu_mmu_index(CPUHPPAState *env, bool ifetch)
 void hppa_translate_init(void);
 
 #define cpu_init(cpu_model) cpu_generic_init(TYPE_HPPA_CPU, cpu_model)
+#define CPU_RESOLVING_TYPE TYPE_HPPA_CPU
 
 void hppa_cpu_list(FILE *f, fprintf_function cpu_fprintf);
 
-- 
2.7.4

