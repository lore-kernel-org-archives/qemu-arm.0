Received: by 10.28.173.206 with SMTP id w197csp4105406wme;
        Tue, 16 Jan 2018 07:52:32 -0800 (PST)
X-Google-Smtp-Source: ACJfBouduFVru72WBKrlItLO2HOPWtFIiYnABZGYnw8+hVDtnmp1h3AwkbEQCvZbYrqwKNSWObN8
X-Received: by 10.37.189.204 with SMTP id g12mr15164002ybk.430.1516117952614;
        Tue, 16 Jan 2018 07:52:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516117952; cv=none;
        d=google.com; s=arc-20160816;
        b=U+ZYDc09zzNjIh5X4w5PhF6ghNHTo7pK1pU8vPAj0HnOod+1RSa83UyqCsjMhPCoLo
         /Py3BbvtbCNdB7W9AdZxiMioO+u3Y4FM5/YF6BzsaSQioZGL9YZdAqMeiwR0KRmRD2Jz
         JcC+DrQquf1hIlvNCWM7sPswYmJxDULbMMUVWflDD3QnSgZpNhyV7MDPk2v3noClpmH/
         acBK6QkOABZw3l0XLWpsgWg8UjuxdPe2JS80uJfxzHqMINUbgMPl4dZUxP3if2zc1xkw
         Qtg0DwEm6fk3UO70jdNcvNReJ0XJBlrumEuD+rEe8+j5Pfws+2n8ZMWpfaF+SSCEZdlH
         /VVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=KAV+U60h+Hp6Gx8tYOWdcvJzTLdIp76Lb25Rh2o0qEk=;
        b=xyaIC8uFe41B//i2UXj0fDGhRETxswLdEnPowjomHB3/0v/kSldoaerY3id9xJSIoe
         Ix5KMv1Pk3fiW5GTdc1AU4BjfqPSuWHs0Gr6Ip/2tQyiyLyI/g5zQygi8P5x48knHVKa
         QvgV7QlXb506zNAISCDNqbfzvQ+SXLhE4NEC3OIyYVnnW5WAuXlsAIZNPEsP3c0N00YL
         AN5cayA8f8TK9GzE2HYgqoRdeIPr/lcfE8RKWSDyb1nIMdggMaZ3bbKKRN5T6Y1LJWQY
         rNDVJRt1xb7V61YIvyJ04FjEaPsClnafblfOwhii0Jq09PqhTLpB+76i98efI+JfwuK1
         Pyew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z14si563777ybg.260.2018.01.16.07.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:52:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebTXL-00032P-VT
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:52:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1ebSw5-0008PA-3Y
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 10:14:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1ebSvz-0003Xy-I8
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 10:14:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:29717)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1ebSvz-0003XA-C0; Tue, 16 Jan 2018 10:13:55 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76B71F0CEE;
	Tue, 16 Jan 2018 15:13:54 +0000 (UTC)
Received: from localhost (ovpn-112-58.ams2.redhat.com [10.36.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 821745D70C;
	Tue, 16 Jan 2018 15:13:20 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jan 2018 16:11:50 +0100
Message-Id: <20180116151152.4040-2-marcandre.lureau@redhat.com>
In-Reply-To: <20180116151152.4040-1-marcandre.lureau@redhat.com>
References: <20180116151152.4040-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 16 Jan 2018 15:13:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/3] exynos4210: workaround UBSAN compilation
 error
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
Cc: peter.maydell@linaro.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>, stefanha@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3YiRbW2I+6IC

gcc 5.4.0-6ubuntu1~16.04.5 build with UBSAN enabled error:

  CC      hw/display/exynos4210_fimd.o
/home/petmay01/linaro/qemu-for-merges/hw/display/exynos4210_fimd.c: In
function =E2=80=98fimd_get_buffer_id=E2=80=99:
/home/petmay01/linaro/qemu-for-merges/hw/display/exynos4210_fimd.c:1105:5=
:
error: case label does not reduce to an integer constant
     case FIMD_WINCON_BUF2_STAT:

Because FIMD_WINCON_BUF2_STAT case contains an integer
overflow, use U suffix to get the unsigned type.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/display/exynos4210_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index fd0b2bec65..86e37e93e9 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -98,7 +98,7 @@
 #define FIMD_WINCON_BUFSTATUS       ((1 << 21) | (1 << 31))
 #define FIMD_WINCON_BUF0_STAT       ((0 << 21) | (0 << 31))
 #define FIMD_WINCON_BUF1_STAT       ((1 << 21) | (0 << 31))
-#define FIMD_WINCON_BUF2_STAT       ((0 << 21) | (1 << 31))
+#define FIMD_WINCON_BUF2_STAT       ((0 << 21) | (1U << 31))
 #define FIMD_WINCON_BUFSELECT       ((1 << 20) | (1 << 30))
 #define FIMD_WINCON_BUF0_SEL        ((0 << 20) | (0 << 30))
 #define FIMD_WINCON_BUF1_SEL        ((1 << 20) | (0 << 30))
--=20
2.16.0.rc1.1.gef27df75a1

