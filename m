Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp189572wrt;
        Fri, 11 Jan 2019 06:18:57 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7EfubZggOt8nvNfDva//vQKNgixh4BcZeptbZBLpK+r5+uPC1kOhfrna7ryOjOelAYrvNv
X-Received: by 2002:a1c:cf82:: with SMTP id f124mr2542136wmg.95.1547216337085;
        Fri, 11 Jan 2019 06:18:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216337; cv=none;
        d=google.com; s=arc-20160816;
        b=dIGKXim5hYziSkAPwKx7+4GHSh8a1kKUBx9BHO58XeQh2Z7mpPpgC1+AV4MCOqHtmB
         3pj7c+OY3jV3LLy9Y8fTV8fEdEYFn0up3goUIYmfloZi7OUYdSSULb8G1j83zAO0OPYm
         hdomNNhmYu4z6tmKJEUnGbbJATo255EZcNQB34sild+Gi6rot6yuuYXu+6JdKC+m+B07
         B7N3Lq/751wfFrZaEz387ThtFoq3gStyCSt5VvVqrEp9qlDV00pplvAZfcaXa7CcEqYW
         CJxhqFHXfhXN9ubaDeXut74fbgWO9g4Gu9fT7jYWlkHBohEIW3oVkZErMO8o4c365Il/
         9KTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UZdt8nua/sJxBmqVPjSiF9kwDTtqHtZxOFO+PmzRsGI=;
        b=TwSpNWGPrwH38xNd7NE1phZpSauDvmOd4066C+KglUWUTCnWilKbIidPURWjni3pfV
         C5eU1FG8eNHclDGS7l72CDnnrCiVyN5Bf2wb2eb7QWAH/Hzyd5Dt7DI2/MEplt2xAmYj
         ngRRdVOQMGbRfOWAKxIKgkNYgUPLhydYEZttvOKF2qELbjKfepbXxzktAQxBV0AXc0E1
         /bFtpW6bFE2PzCCp1qdb34SnEk0kWrRyHJ1I18UyzrPMNnON0fgE205AKtW/AqqPirig
         7v8NmMzi/NoAXnMQ5YVg9baCqQKPGvWo/cNh2wQMwunrQrWUKfn17QDLa2hs4azjk1WJ
         EyxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si13320709wmd.69.2019.01.11.06.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:18:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxeB-0005tj-Tx
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:18:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxdt-0005cg-DH
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:18:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxXb-000728-5Y
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:12:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44514)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxXZ-0006x7-1p; Fri, 11 Jan 2019 09:12:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32C9C804FA;
	Fri, 11 Jan 2019 14:12:04 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 576D65D6A9;
	Fri, 11 Jan 2019 14:12:00 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:56 +0100
Message-Id: <20190111140857.4211-15-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 11 Jan 2019 14:12:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 14/15] ui/console: Remove
 DisplayState/DisplaySurface from "qemu/typedefs.h"
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
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fs0grTL4ombk

Files requiring DisplayState/DisplaySurface already include "ui/console.h=
".

To clean "qemu/typedefs.h", move the declarations to "ui/console.h"
(removing DisplaySurface forward declaration).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/qemu/typedefs.h | 2 --
 include/ui/console.h    | 6 ++++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 55f4de7259..af0dc6e065 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -24,8 +24,6 @@ typedef struct DeviceListener DeviceListener;
 typedef struct DeviceState DeviceState;
 typedef struct DirtyBitmapSnapshot DirtyBitmapSnapshot;
 typedef struct DisplayChangeListener DisplayChangeListener;
-typedef struct DisplayState DisplayState;
-typedef struct DisplaySurface DisplaySurface;
 typedef struct DriveInfo DriveInfo;
 typedef struct Error Error;
 typedef struct EventNotifier EventNotifier;
diff --git a/include/ui/console.h b/include/ui/console.h
index 8396387c47..aa9f975544 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -131,7 +131,7 @@ struct PixelFormat {
     uint8_t rbits, gbits, bbits, abits;
 };
=20
-struct DisplaySurface {
+typedef struct DisplaySurface {
     pixman_format_code_t format;
     pixman_image_t *image;
     uint8_t flags;
@@ -140,7 +140,7 @@ struct DisplaySurface {
     GLenum gltype;
     GLuint texture;
 #endif
-};
+} DisplaySurface;
=20
 typedef struct QemuUIInfo {
     /* geometry */
@@ -189,6 +189,8 @@ typedef struct QemuDmaBuf {
     bool      y0_top;
 } QemuDmaBuf;
=20
+typedef struct DisplayState DisplayState;
+
 typedef struct DisplayChangeListenerOps {
     const char *dpy_name;
=20
--=20
2.17.2

