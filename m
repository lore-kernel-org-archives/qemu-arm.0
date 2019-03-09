Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9722868wrx;
        Sat, 9 Mar 2019 10:19:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqw8pg4yH1Wv1TqGkCeXaFcccbDz1sX0ZcfnkelU/7r5h4/XvHzfNOyls0wbrTR2ubUemW+v
X-Received: by 2002:a25:be0d:: with SMTP id h13mr21451404ybk.24.1552155590970;
        Sat, 09 Mar 2019 10:19:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552155590; cv=none;
        d=google.com; s=arc-20160816;
        b=jVBTKlnUStZM9P9pc/QdC2fvHzbReZKgCaRQAYpHAZNwmIsYDyNa93vzFSSloWZlmx
         sA8x0YO526tle2+5ChyGd+9fgd6JOj2ZkAXHms4JRzITDyk4KV6sYMAUyQ2oFl5cHSLe
         ibyoKZeyqDVM/ekvEGYmve8gts7p3Nhf8i3zWPtmYhYcXUE9RDu5FSF6M2EnA2h9VdLG
         czpB9MKUtWQ9vQxN8uchLL09oVNSdW9mxy4x8msnu4hgDWX5o1/JfvBjfHCdct3w59nf
         oJNrXsqb/kSUDkWbgifasCk2LXwW6LMFHvaG1ndMaJ3lfESfsoYoXA5Bxdcq7vnO/RJA
         W42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=hahO3yfOE6JAY1QtcfrV5swaPE+HuKrug9Dgf0nPv+0=;
        b=CwOZHQD7f3AI7z5BbN5JiClY3C2rWAHJ2q96wEs0CwTNtf2Q0pkONChx96HMuW3bW/
         YzHBXIGtCmybe8micNlwbEUv/WirbGEAw/krMiWdy1nTwKg0RPdyGlzMDGtKOtoBIcJ5
         7Z/0aPZk72YZBUf+zyCh2RGOg3J23jrCVavO3gTJcnHKln0gxyxJjBu40H5Z90HqQKKe
         e+0RG7BvE6qPoWq2/wL8SE+BQt/tNYkDydDOo3/ki2zjDBVfX9MFr43MSSjDzNdIgjTp
         yMJ6nkML9JRhVClcNnccJjMIUdPKtCsp/RhUg2LjEnNKQVMIkB9Wx2W/ND6Seo/HDJkl
         OCLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t185si595702yba.139.2019.03.09.10.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 10:19:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33904 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2gZa-00010s-AA
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 13:19:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2gZJ-00010k-EQ
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 13:19:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2gZI-00048f-N4
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 13:19:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h2gZI-00047t-GO; Sat, 09 Mar 2019 13:19:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33754300486F;
	Sat,  9 Mar 2019 18:19:30 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B65AA60A35;
	Sat,  9 Mar 2019 18:19:22 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat,  9 Mar 2019 19:19:18 +0100
Message-Id: <20190309181920.30553-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Sat, 09 Mar 2019 18:19:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 0/2] fw_cfg: Trivial cleanups
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ygd53WSi7RJa

Hi Laurent,

These 2 patches are trivial cleanups extracted from a bigger fw_cfg serie=
s.

Please consider for your next Trivial pull request.

Regards,

Phil.

v2: https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg02522.html
v1: https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01598.html

Philippe Mathieu-Daud=C3=A9 (2):
  hw/arm/virt: Remove null-check in virt_build_smbios()
  hw/nvram/fw_cfg: Use the ldst API

 hw/arm/virt.c     | 4 ----
 hw/nvram/fw_cfg.c | 4 ++--
 2 files changed, 2 insertions(+), 6 deletions(-)

--=20
2.20.1

