Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp210529wrt;
        Fri, 11 Jan 2019 06:38:55 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6RHHCHKMuNTojVF+KS8SeQ5bqXk/ycTOpRdpiRbYsnOogmJyYAzJxCUhC7zfWBVjAynl+P
X-Received: by 2002:adf:e34b:: with SMTP id n11mr13015783wrj.91.1547217535685;
        Fri, 11 Jan 2019 06:38:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547217535; cv=none;
        d=google.com; s=arc-20160816;
        b=gEBZ5IPWaJvSphQFDjrmvdE0wBfKM0Me+tWxty+5PiaLSWW/oAuqLExUPSYluCg0nF
         MI4kxHNwZr41ZsDWBg6fHnyo/VDTKC/yCYc2q1ZLaefT/kNQzuL20haxYThNSqdbY7Bq
         BSHycVTTaHNkG64ic8z24BL7Lu8yJTIXWjlK40MucF8McHS+1UImyiBOsX/FSnfNs9Ro
         I4IueBkec4ghml9/DpXta6QH0QlxVp0mm6IxhAQ/evp5ZruLEMkSYzCczc3vHcFxkO2B
         p3lWoinWlYBs7s96j+5CLmjfd7+wMifPkELj/Uq2HnQKr8ppoLl4ac9JyyLlxI6gxqUZ
         zCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=19KVCmPKdkJSfFloRiNbwrGwsg+2pqxML5OhEhtYRZE=;
        b=vtAqhW8jKdDv65VRKNi8qQ5nnDCCYW1fOh9sTmTH98zJ3Qmx4vs+UyBGwNE2r5iYgz
         AHgRpZAxCzqqsS6DAfCqlqX7oB9KwmEnjt0kWoUgTnuw73TRb6vB5MxuekaMZEVJP7Oj
         C3vTxE7trVMjQ3DW+Cq+XNNH54IDnkkg4GVeP2zDw6ZX6jfbvpTjvPuMqxU9z07CKv5F
         a0zU0wgp4UeaR0qc4JOrLOciiD054F3emDMvXz6zTzZ6rBt7H928IhpjN3AhpjK6TIeI
         qPXrQKSddYX3+awT5OntBm7HwdUpo3lVAiFqV4sdADBc/csvTuqCBjt8+hdxnDTIhJ0H
         Vphg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si44154149wre.214.2019.01.11.06.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:38:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxxW-0005Z3-Nz
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:38:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxeD-0005uM-3q
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:19:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxR8-0002Dl-5i
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:05:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxR4-0001uA-8u; Fri, 11 Jan 2019 09:05:22 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF9B1C023D;
	Fri, 11 Jan 2019 14:05:20 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D738A5D6A9;
	Fri, 11 Jan 2019 14:04:59 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:04:23 +0100
Message-Id: <20190111140457.2935-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 11 Jan 2019 14:05:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 00/33] typedefs: Remove scarcely used
 declarations
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laszlo Ersek <lersek@redhat.com>, John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ra4v2AJBaJ0

Hi,

Since this file became a hot topic [*], I took previous cleanups
from last year and continue to clean it.

Regards,

Phil.

[*] "HACKING: Clarify the paragraph about typedefs"
https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg02132.html
[*] "Fix duplicated typedefs to be able to compile with Clang in gnu99 mo=
de"
https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg02117.html

Eric Blake (1):
  typedefs: (Re-)sort entries alphabetically

Frediano Ziglio (1):
  spice: Remove unused include

Gerd Hoffmann (6):
  egl-headless: add egl_create_context
  keymaps: remove modifiers include
  keymaps: drop nl-be map
  keymaps: remove common include
  keymaps: drop support for include files
  usb-audio: ignore usb packages with wrong size

Li Qiang (1):
  ioapic: use TYPE_FOO MACRO than constant string

Marc-Andr=C3=A9 Lureau (1):
  configure: bump spice-server required version to 0.12.5

Peter Maydell (2):
  ui/console: Remove qemu_create_display_surface_guestmem()
  linux-user: make pwrite64/pread64(fd, NULL, 0, offset) return 0

Philippe Mathieu-Daud=C3=A9 (15):
  hw/input/ps2: Remove PS2State from "qemu/typedefs.h"
  hw/pcmcia: Remove PCMCIACardState from "qemu/typedefs.h"
  hw/ssi: Remove SSIBus from "qemu/typedefs.h"
  hw/ide/ahci: Remove AllwinnerAHCIState from "qemu/typedefs.h"
  hw/nvram/fw_cfg: Remove various typedefs from "qemu/typedefs.h"
  hw/i2c/smbus: Remove SMBusDevice from "qemu/typedefs.h"
  hw/bt: Remove HCIInfo from "qemu/typedefs.h"
  hw/char/serial: Remove SerialState from "qemu/typedefs.h"
  hw/i386: Remove PCMachineClass from "qemu/typedefs.h"
  range: Remove Range from "qemu/typedefs.h"
  audio: Remove AudioState from "qemu/typedefs.h"
  ui/console: Remove MouseTransformInfo from qemu/typedefs.h
  ui/console: Remove QemuDmaBuf from "qemu/typedefs.h"
  ui/console: Remove DisplayState/DisplaySurface from "qemu/typedefs.h"
  RFC ui/console: Add "ui/pixelformat.h" to declare PixelFormat

Priit Laes (1):
  qom: Include qemu/fprintf-fn.h in cpu.h

Thomas Huth (3):
  hw/audio/marvell: Don't include unnecessary i2c.h header file
  trivial: Don't include isa.h if it is not really necessary
  hw/audio/marvell: Don't include unnecessary i2c.h header file

Tom Deseyn (1):
  Add getsockopt for settable SOL_IPV6 options

Wainer dos Santos Moschetta (1):
  hw/core: fix whitespace in a sentence

--=20
2.17.2

