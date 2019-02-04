Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3998512wrt;
        Mon, 4 Feb 2019 12:45:53 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZPFONeBa2AY+AW/WwXlsfQYJ8Nk0bBPH3Bx+uCeuVVJgv5WeFwj7TMVIL/qgCfBvNuwf6T
X-Received: by 2002:a25:9a45:: with SMTP id r5mr1159984ybo.139.1549313153562;
        Mon, 04 Feb 2019 12:45:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549313153; cv=none;
        d=google.com; s=arc-20160816;
        b=V8d5nxB8uU52K5Rq5YFlP3bkrvALdNDvofFmHnSy8+e2eoUUwWoIMhLRpTlpjBOKYD
         xj3PM0mokI/Sziti8xOF4wT6VKCsu8zCbdVDbysjihAGjEWDZQElzDV/fchl754pAD1H
         SjWCG78vItYtA9RtXUvKvVx5Qy5y9cT8q0JI4C+pOrzMvjYqUqUIFhlrKareKXlvYnah
         CyK80BdRR0vkY3Efdwd68u3TKx0x7S3AAhMipaGIdLVkVfvR3kV5k3g6sCXk721JQl8k
         eBbqG3w/0S8uiLRsWS/2ClMPbiLs14yatbaUWwzDDDOL/N15tDYea29HlVJpZ5taxzQG
         mI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=rGxsZawRdsP30cVfGng1cKORxhDqdQZ7I0ZEfQzBHZo=;
        b=uYWF/kxGhxGJZc0nd2k3WHSjOdGC98YXvCY7PfCNrPUoV0Qyu3x9l71QlGEFaYsdD7
         ISusoJViruvFc3BKVeWB02zl33PILoYBRCvt3B5pXeWyGFHal1de+maWr4IQ31PZj1yb
         mebQv+9ZTVUOJf8gnDk5/9iiUlYtfXIQ1T7oZKS8uk7UhH3FMVOpfSttsCXx8SpD/Xn8
         AsO1BzjrLEbT/p/TqFHsDVqEokxPwkZDzUn1ynbFvFxge3zBzg61lqDTPr55agpeI0dp
         sINLURMxz86r4JCLPHbanKn6/OJ7EuPmotMIaOOo3ukchDURexQ8QbCMNhOY6sE8hIyi
         rcNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k129si55780ywg.370.2019.02.04.12.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 12:45:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gql7p-00060H-1Q
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 15:45:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gql7f-0005zt-57
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 15:45:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gql7e-0001XA-75
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 15:45:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52318)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gql7d-0001WA-VS; Mon, 04 Feb 2019 15:45:42 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B674804F5;
	Mon,  4 Feb 2019 20:45:40 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95C348A29B;
	Mon,  4 Feb 2019 20:45:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  4 Feb 2019 21:45:17 +0100
Message-Id: <20190204204517.23698-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 04 Feb 2019 20:45:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/input/tsc210x: Fix building with no verbosity
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Andrzej Zaborowski <balrogg@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JO09tp8KyHu0

When building with TSC_VERBOSE not defined, we get:
      CC      arm-softmmu/hw/input/tsc210x.o
    hw/input/tsc210x.c: In function =E2=80=98tsc2102_data_register_write=E2=
=80=99:
    hw/input/tsc210x.c:554:5: error: label at end of compound statement
         default:
         ^~~~~~~
    hw/input/tsc210x.c: In function =E2=80=98tsc2102_control_register_wri=
te=E2=80=99:
    hw/input/tsc210x.c:638:5: error: label at end of compound statement
         bad_reg:
         ^~~~~~~
    hw/input/tsc210x.c: In function =E2=80=98tsc2102_audio_register_write=
=E2=80=99:
    hw/input/tsc210x.c:766:5: error: label at end of compound statement
         default:
         ^~~~~~~
    make[1]: *** [rules.mak:69: hw/input/tsc210x.o] Error 1

Fix this by replacing the culprit fprintf(stderr) calls by a more
recent API: qemu_log_mask(LOG_GUEST_ERROR). Other fprintf() calls
are left untouched.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/input/tsc210x.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index ded0db9351..2eb3cb9518 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -552,10 +552,8 @@ static void tsc2102_data_register_write(
         return;
=20
     default:
-#ifdef TSC_VERBOSE
-        fprintf(stderr, "tsc2102_data_register_write: "
-                        "no such register: 0x%02x\n", reg);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_data_register_write: "
+                                       "no such register: 0x%02x\n", reg=
);
     }
 }
=20
@@ -636,10 +634,8 @@ static void tsc2102_control_register_write(
=20
     default:
     bad_reg:
-#ifdef TSC_VERBOSE
-        fprintf(stderr, "tsc2102_control_register_write: "
-                        "no such register: 0x%02x\n", reg);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_control_register_write: =
"
+                                       "no such register: 0x%02x\n", reg=
);
     }
 }
=20
@@ -764,10 +760,8 @@ static void tsc2102_audio_register_write(
         return;
=20
     default:
-#ifdef TSC_VERBOSE
-        fprintf(stderr, "tsc2102_audio_register_write: "
-                        "no such register: 0x%02x\n", reg);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_audio_register_write: "
+                                       "no such register: 0x%02x\n", reg=
);
     }
 }
=20
--=20
2.20.1

