Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3450615wrv;
        Fri, 19 Jul 2019 04:15:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxHglxWRW5ZSm8hghWe2N2JqTcak+Wwm89jfsteoILTrChZdzQV+Zznnok8jWm5brs1pCI6
X-Received: by 2002:a37:8604:: with SMTP id i4mr34141604qkd.255.1563534907054;
        Fri, 19 Jul 2019 04:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563534907; cv=none;
        d=google.com; s=arc-20160816;
        b=X1pWkuhO99tvOvHIDzYqmpYR1BogFcdP7x+G96Q10NHso+FJFsJMglMO6imNgc8+zt
         F6Q8BeNVSnhYImUtNf1YV1b505srS+LbKDgMfzyvxDS4Hg/V6l2os1WF0MHvnE3Z7G7+
         HjQUtmOEvc28ooeym7wqvIz415AWpYyNWnBhGzPFJF+ORXLSbhDP+7FE1YfSRwczygOH
         EWjtmQJzDvJZVZGVcAOrv9zyXdE6B4yEraAqi4qSpuwE/DPI04L7VpDoDtXiUSfsLl8L
         0HydqwMkWZu0TE4xMG89yRp28bOP48ZB5OPrL3/yYKycCbsTzaek/sTg0tJH/owUOQwy
         hr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=tpFGqMVXiZ4GUehmiqJCH/1OyLe53wOtbbRLxE6Nt8Q=;
        b=upH5dqUJHQYDMRwi/fIVJc8FM5PJEXUJLOuoVIMc6nJm3yCv1qP1+qOsYN8PvX7Y3N
         aWJA7VIXHE1gG/prYRLj3t6Uy9OfyAjbITKY2wSgru3eCOm6dT4QC5rtVFfFX/DlInCE
         98su+MeWvf/YNy7LSREwoix4i2FM0PvTufhIf3ef8dCXlQDTKCD5VyjN1baBETVVajze
         /Nt6KagLCO+DnRiK3FQBVR9A3WSoXFdfP6sPV7GIX8USIYESD6XMHZVnn4vixSEzdQh+
         84GFVa6iAlB0Vm/bM+COzO2CiPHSdEcsZ3BkxtSbjbhBsGMeJxeHfcYdQ28hOwvwdifB
         Bsnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si20766828qta.275.2019.07.19.04.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jul 2019 04:15:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hoQqw-0004XS-H5
	for alex.bennee@linaro.org; Fri, 19 Jul 2019 07:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35269)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hoQqs-0004X3-B4
 for qemu-arm@nongnu.org; Fri, 19 Jul 2019 07:15:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hoQqr-0008Ok-Fd
 for qemu-arm@nongnu.org; Fri, 19 Jul 2019 07:15:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49892)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hoQqr-0008Ng-A1; Fri, 19 Jul 2019 07:15:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 160C230821F4;
 Fri, 19 Jul 2019 11:15:00 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E461A61991;
 Fri, 19 Jul 2019 11:14:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 19 Jul 2019 13:14:51 +0200
Message-Id: <20190719111451.12406-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 19 Jul 2019 11:15:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1] target/arm: Add missing break statement
 for Hypervisor Trap Exception
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QpsPeYfGzlZ9

Reported by GCC9 when building with  -Wimplicit-fallthrough=3D2:

  target/arm/helper.c: In function =E2=80=98arm_cpu_do_interrupt_aarch32_=
hyp=E2=80=99:
  target/arm/helper.c:7958:14: error: this statement may fall through [-W=
error=3Dimplicit-fallthrough=3D]
   7958 |         addr =3D 0x14;
        |         ~~~~~^~~~~~
  target/arm/helper.c:7959:5: note: here
   7959 |     default:
        |     ^~~~~~~
  cc1: all warnings being treated as errors

Fixes: b9bc21ff9f9
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 20f8728be1..b74c23a9bc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7956,6 +7956,7 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPUSta=
te *cs)
         break;
     case EXCP_HYP_TRAP:
         addr =3D 0x14;
+        break;
     default:
         cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index)=
;
     }
--=20
2.20.1

