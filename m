Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4657153wro;
        Mon, 29 Oct 2018 12:59:55 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dU39oIw/GAG/WXGao6SxkKHeZsxgSfyn3ggIiteeN1UGoNNLhnZ9tyb+UrsumjCWx/SSgb
X-Received: by 2002:ac8:45d5:: with SMTP id e21-v6mr14134374qto.261.1540843195335;
        Mon, 29 Oct 2018 12:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540843195; cv=none;
        d=google.com; s=arc-20160816;
        b=nSvmIUqGb5tzLFzRcHyYebUEoFt/Q44vVUQI/hT3pexbm83WxGRmup7CEmYM2audIC
         FVV/+y4qix4P1wg9LbvtL/8uu2JLqwXFO94IRBAR2E5rPIA2XeTxUwjYceyaYOD1bsiI
         J1LRo3xsGJmg35I54Nn+nKBSEQRBZ/JW1Wl/ndr65jHEMXPxK0gCzWuZQUwcGoBN1EYL
         7MlIUiDwZrWYzRPSciRsphub4KtvBBxjG1IFn4AioipqpDhSKpYHJuD8OGF3yJDT/VQX
         Ou5bHeGH7xO0tFIsVlTVjxzfew0SvLHDME0focqklVsLONSYtkXfDQ971zWo+Zencc/E
         LY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=26BJGedeXvja3GjzSvx10PUzgXXGuMVc0iklsAoIYJ0=;
        b=jUqVNWCA2SZAxw91C4bqDkTpeMWGeiwYo2sqIjprBJ+AP9HZWL6P6qZ0ThE3/Lu4Aw
         WfEW9h9db1lAYA6aKXBPp2EeyaKkzN2M3Wbi/vHG2iEpaZuKCk5ab7Oi5+IB09yaCJYc
         77xf6Ozj8qVhiBBkokn617jw6aCaMxzTHFbPziy9KFOvt8FQoMjKylrHKyI3IuQ+ZAGJ
         UmLsW9JvTAVR87QzW3JB9C/fHd29A+e56DLpeDjD7wSEg0Q4TrZSBJdaufOV9NqN1Rwb
         pS0S1oH4vJGxs6Zp66MWTjpLq3/W0TFVtFrAELrITQJ4a+J1fMDJpcihC1ZGwncjNb9a
         g1bA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s65-v6si9349195qtd.76.2018.10.29.12.59.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 12:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHDha-00015Z-Tl
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 15:59:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHDhT-00015I-3t
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 15:59:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHDhO-0004BQ-NB
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 15:59:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54270)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHDhO-00049U-Gi; Mon, 29 Oct 2018 15:59:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F104308624E;
	Mon, 29 Oct 2018 19:59:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 977BC60BE7;
	Mon, 29 Oct 2018 19:59:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Shannon Zhao <shannon.zhaosl@gmail.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Oct 2018 20:59:31 +0100
Message-Id: <20181029195931.8747-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 29 Oct 2018 19:59:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] MAINTAINERS: Remove bouncing email in ARM ACPI
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Hkzg3rN5I/e

Shannon Zhao's email at Huawei is bouncing: remove it.

    X-Failed-Recipients: zhaoshenglong@huawei.com
    ** Address not found **
    Your message wasn't delivered to zhaoshenglong@huawei.com because the=
 address couldn't be found, or is unable to receive mail.

Note that the section still contains his personal email (see e59f13d76bb)=
.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d794bd7a66..1aa2728aac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -625,7 +625,6 @@ F: hw/*/xlnx*.c
 F: include/hw/*/xlnx*.h
=20
 ARM ACPI Subsystem
-M: Shannon Zhao <zhaoshenglong@huawei.com>
 M: Shannon Zhao <shannon.zhaosl@gmail.com>
 L: qemu-arm@nongnu.org
 S: Maintained
--=20
2.17.2

