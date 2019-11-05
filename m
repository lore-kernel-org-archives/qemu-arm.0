Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp453495wri;
        Tue, 5 Nov 2019 01:12:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqzQe/IHRhAp0Qz58nJtTpcIJvYXczEaADnw7Yv0U5abYH/O+b0fMFuUSMaeVILQ115t9gfZ
X-Received: by 2002:a37:470b:: with SMTP id u11mr1429968qka.172.1572945155961;
        Tue, 05 Nov 2019 01:12:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572945155; cv=none;
        d=google.com; s=arc-20160816;
        b=U+X64pN9v2lydj0If3G5uvw0kce0749PZLxspJl/dW8BjM5wN4uIuEkMaWrQqaRztI
         jgbfgAZ5FwhxRCPmvArsheuv4UPyGrjl8otyETE9QVve/82xrjPSHwK5kcFkVb9gNCFc
         dEKFMn05CF/mvrBibi4mP2U+Mtzr6xUVQQX2TRa6mkAwazWd9eGEo6WsY841t8ZLf1u7
         p8+WfLLZz4q7lQX/uUTLBU/luw22jCb0ldOdN7/kqNPU6EC/gErm7jv0MgoxQqnF7u3h
         pQ8NaBDLNGblvjutlX9V8606zDcxdzVFvK0hX4GcVmEEo+uaWqlIHDoedoWpW9vYISsY
         xnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=HiQhAh7UIjCJgydyktuYcRZzmdI10XrZEkZmT8+V1+o=;
        b=zSlLVsNEzjl/Wh5ExGcBmcwjJe/Hdp85UUiU8XhLlxaIhWw7O6p1yjI/RILdu/iENs
         gd8moPliK+htalLmbUAag5OEZSgeDka6OopmSUEbn2R1VfyLV0VKRrq0iosjTeSMdwTe
         acRjHdBP6RkLQGxFbC913gT0Q3i4FMwcEINTnWk/x2/XUE6CXsQHQJmOyZaAbPJlT4+J
         yCECjbR98motzRdtaE/WN8W5/FcA7NuzdYaiijtfxNC2bbAXu3GmUzAcWURQ4OaReMeD
         lsV/Gz0jszmWesz4Nse5Q6r1GTza6sOar3W5h27qLmaoo5d+k6dboUUbs5mnNzl3VfVM
         Esng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19si15326878qkf.40.2019.11.05.01.12.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 01:12:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRut8-00051u-LT
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 04:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iRusu-00051I-KT
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iRust-0007jl-B5
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:20 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2190 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iRuss-0007he-V8; Tue, 05 Nov 2019 04:12:19 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1FE66EE9B26D8FE4F05B;
 Tue,  5 Nov 2019 17:12:13 +0800 (CST)
Received: from linux-OtBuvb.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 17:12:06 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 06/14] arm/sdei: add system reset callback
Date: Tue, 5 Nov 2019 17:10:48 +0800
Message-ID: <20191105091056.9541-7-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191105091056.9541-1-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Mark
 Rutland <mark.rutland@arm.com>, Peter Maydell <peter.maydell@linaro.org>,
 James Morse <james.morse@arm.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Jingyi Wang <wangjingyi11@huawei.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wznDGM90TcTh

For this is a logical device which is not attached to system bus, we
cannot use DeviceClass->reset interface directly. Instead we register
our own reset callback to reset SDEI services when system resets.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Signed-off-by: Jingyi Wang <wangjingyi11@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 target/arm/sdei.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/arm/sdei.c b/target/arm/sdei.c
index 0c0212bfa8..6af4a9044b 100644
--- a/target/arm/sdei.c
+++ b/target/arm/sdei.c
@@ -1147,6 +1147,26 @@ static void qemu_sde_init(QemuSDEState *s)
     qemu_private_sde_init(s);
 }
=20
+static void qemu_sde_reset(void *opaque)
+{
+    int64_t         ret =3D 0;
+    CPUState        *cs;
+    QemuSDEState    *s =3D opaque;
+
+    CPU_FOREACH(cs) {
+        QemuSDECpu *sde_cpu =3D get_sde_cpu(s, cs);
+        ret |=3D sdei_private_reset_common(s, cs, true);
+        sde_cpu->masked =3D true;
+        sde_cpu->critical_running_event =3D SDEI_INVALID_EVENT_ID;
+        sde_cpu->normal_running_event =3D SDEI_INVALID_EVENT_ID;
+    }
+
+    ret |=3D sdei_shared_reset_common(s, first_cpu, true);
+    if (ret) {
+        error_report("SDEI system reset failed: 0x%lx", ret);
+    }
+}
+
 static void sde_array_save(QemuSDE **array, int count)
 {
     int i;
@@ -1299,6 +1319,7 @@ static void sdei_initfn(Object *obj)
     sde_state =3D s;
=20
     qemu_sde_init(s);
+    qemu_register_reset(qemu_sde_reset, s);
 }
=20
 static void qemu_sde_class_init(ObjectClass *klass, void *data)
--=20
2.19.1

