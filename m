Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5932673lfp;
        Tue, 18 Feb 2020 01:35:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1m2ciOMsVjXcl43S1Z3eg+XN86PAg+FhfVjc+3kxOFj5UeGdvpUC6E/sQOOvdqhn9/cKx
X-Received: by 2002:aed:3f70:: with SMTP id q45mr16192226qtf.310.1582018554599;
        Tue, 18 Feb 2020 01:35:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582018554; cv=none;
        d=google.com; s=arc-20160816;
        b=f1HBdszIi9i7yMnL5W8RCvhPXaW6v4/klO3oxWyomWMpAwsQgcB5aE4A5nTilkiBXo
         9FFxSSUXuUhAjtp9yNWNkRxK54w/L9EhJY4zX4NLB4+LIR6VP+cENMcjUm8QsSbqRebS
         9qFTy68AbmedPhAm6s8aRLHZB3yzW0I72p3bWhEVGcYIGB39BGI/ucK8GOuUrnHzgEtS
         /Dgi7cUZ16kVu4nCertIpyeJnvTM7sIB4KFSOTMK2MhMhMMqKg+1wjzC/L2ADnsDIB8/
         Mu492xYOmXpTILgiDtnXmRyWjL7HFZKuL56CvzEFxb/gR+jQgCZaHMRprsj0ddlf7tRF
         orBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=j/EdDI2CtMVN9fdl6+h7xbjhrRwwWIt4TPFM6oFFcSc=;
        b=lgUQj2yYDNEH21CnaBSsM9z0U8iUupusmswdh2cGGvageh6SZzXQbQ6fGaHuezo1oK
         QXS1hNkTNUYGJkhk/j6E4NpAO8C3TKo6NV8jQvjwhNccHW5galwPL3nZqWuEZm28Hvk2
         XnlwyVjxtFEldSyWxleGeeJ0XRmA8hq8sGeeOi4c0fG0tFyy1jIJayBjj0wITemWUA3B
         rf2oIItwqW7Aa4PGioUT0GuQ8Q2bRl0KnG7XHV4awlK3fooW3VcVzABGw8kc+aQF61v7
         5wlU+CCC3m5dfvFE+Mhpxyo6VuHB5LdMe0cyu+RmDdK3UPhVE/85FnQjseSsgLw2zTIb
         mJnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SBT0J6GF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si1630813qke.28.2020.02.18.01.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:35:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SBT0J6GF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zII-0000eq-3O
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zF0-00067g-Ev
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:32:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zEy-0001A8-7C
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:32:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40846
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zEy-00019r-43
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j/EdDI2CtMVN9fdl6+h7xbjhrRwwWIt4TPFM6oFFcSc=;
 b=SBT0J6GFs9xYnHb4AJuPuZO72htGZYByykmLRfcDgIN1P6g83nbo1RbzN4f0mlbIaEoWKx
 9Hj9x9ZC+Vb6kEIjz4+wdzbnJzvQaTGpeZ2beRYnC+wxdgO8VIDzcxoLI6kWD5dHNU9wMf
 e6XXYgkpLYJfw3CjvMnN0lTkdPqimWs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-b80yVCO9MFGFs92ugQ3B5w-1; Tue, 18 Feb 2020 04:32:22 -0500
Received: by mail-wr1-f71.google.com with SMTP id j4so10493450wrs.13
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 01:32:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d11KEHy00cHcmoOZmfkiJiWUsKxIDwvg0E/JJImsCd0=;
 b=G8Iw2T0L1Gx6dTm3AL6yiT+xrECuOKRqjUKo8iAzkZ6R1kYhLZBKVFmkRWQEioJADw
 26DI4srxfEwpVAVvq3UR84kP3H08jbV6yK5O6/TuX4t73k14hBf8FWBFZAIaTsNwhxwC
 ZKM4lgQ7WeRqNVsgvbY0tBDfCtPe8uvQkWiK4tfRJ1UzmeOGVtv1Hh/2bnuXozFZ9lPa
 bu8s/F04BJNQuweYpDw6zKnI/9w+x+E5qM0+Qfq9K4ZD4oNTUdGUt1dSYVLBEZedgQaD
 3lIxw0d+ABa2J1FzWEzsFsSRVEwyCIHYWPRUjY5TZupsT+5xPEfrICqSNC8284GhIjjT
 wXig==
X-Gm-Message-State: APjAAAVsg2yXwa/+iOKLipahCWCbEtXG70UDOilQk9bF6i8nwgiavzVT
 0/2vTgTJtuPB9iBIhuRizqMPpMEpvOj72yLARwhYw+fkyOoA11tVAGgtlKb/5nawqoW80LVQJlA
 mseDuWcEpDxaAgVA=
X-Received: by 2002:adf:82c7:: with SMTP id 65mr856660wrc.374.1582018340713;
 Tue, 18 Feb 2020 01:32:20 -0800 (PST)
X-Received: by 2002:adf:82c7:: with SMTP id 65mr856594wrc.374.1582018340337;
 Tue, 18 Feb 2020 01:32:20 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id v8sm5146891wrw.2.2020.02.18.01.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:32:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/13] trivial: Detect and remove superfluous semicolons in C
 code
Date: Tue, 18 Feb 2020 10:32:04 +0100
Message-Id: <20200218093217.25156-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-MC-Unique: b80yVCO9MFGFs92ugQ3B5w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ClQ8Kunr/Gqq

Luc noticed a superfluous trailing semicolon:
https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg04593.html

Prevent that by modifying checkpatch.pl and clean the codebase.

Philippe Mathieu-Daud=C3=A9 (13):
  scripts/checkpatch.pl: Detect superfluous semicolon in C code
  audio/alsaaudio: Remove superfluous semicolons
  block: Remove superfluous semicolons
  block/io_uring: Remove superfluous semicolon
  hw/arm/xlnx-versal: Remove superfluous semicolon
  hw/m68k/next-cube: Remove superfluous semicolon
  hw/scsi/esp: Remove superfluous semicolon
  hw/vfio/display: Remove superfluous semicolon
  migration/multifd: Remove superfluous semicolon
  ui/input-barrier: Remove superfluous semicolon
  target/i386/whpx: Remove superfluous semicolon
  tests/qtest/libqos/qgraph: Remove superfluous semicolons
  contrib/rdmacm-mux: Remove superfluous semicolon

 audio/alsaaudio.c           | 4 ++--
 block.c                     | 4 ++--
 block/io_uring.c            | 2 +-
 contrib/rdmacm-mux/main.c   | 2 +-
 hw/arm/xlnx-versal-virt.c   | 2 +-
 hw/m68k/next-cube.c         | 2 +-
 hw/scsi/esp.c               | 2 +-
 hw/vfio/display.c           | 2 +-
 migration/multifd.c         | 2 +-
 target/i386/whpx-all.c      | 2 +-
 tests/qtest/libqos/qgraph.c | 4 ++--
 ui/input-barrier.c          | 2 +-
 scripts/checkpatch.pl       | 5 +++++
 13 files changed, 20 insertions(+), 15 deletions(-)

--=20
2.21.1

