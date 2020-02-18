Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5938927lfp;
        Tue, 18 Feb 2020 01:44:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqx69WISgnBdwcncGP2aABZ6co5SrxSIv4U1tXDGJZE6Q5SaTWbieKqPqItfx7z5NUKSELM3
X-Received: by 2002:a05:620a:1366:: with SMTP id d6mr17767137qkl.230.1582019059429;
        Tue, 18 Feb 2020 01:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019059; cv=none;
        d=google.com; s=arc-20160816;
        b=f/jM0cvQ3qx8u3f04zsfNGbWow5ypibHlcrwJKLWUo+u+CSNqmtnAV39TYbvflf7vy
         7Mtx+NPqgZwWWzkx73oqJESkSVJRKebvAJybGrCGxYi8kMVVwHEjtolCOlfQwKIt62EI
         T2yaNXBRaZWjByGqMzK/ZxKo0Gl+fHtHhYowTR8NHfcIApckS2H7IJuB3BddM/Dk6C1S
         kzHp4Q7Rz+OTW3gufO0zz5m9Apq6z4bVpAU0cyAvfZAX2Ye/If3U9FBKpEPH1HXXFUx0
         vHIHYkGc32Jy3d04UFF1j+/fdPuQ9xOXBJOCHUbxinRrsx6N3cvcfCHF9Vku3XKD8KHY
         DWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=j/EdDI2CtMVN9fdl6+h7xbjhrRwwWIt4TPFM6oFFcSc=;
        b=D8Z+93uBrkHXdvs/sz7cXDlYQ7xf9azwQb14lTp3q38GG5WLw5TzuGgYoc2DPrbiWV
         cRrN73SVsqgpHEzxkxnj0CFxF9HV2E+yDafDfgYnKWaZY2f1GqRZ8iXUpubRpfL1GLqa
         RTMIxsXVTZWepev8EirCsth2ysaY+yox4I/IIeWO5lDmho8rKP36oJCS2aV9mbcQ84gm
         wtMHoyt5gi8aGp1JL57y537uC1r5AxZd+Zv3JnMCtKtiz7W64GpBgskq0Fx3757eZC9d
         jgNgGKDrhbwJ9Umbjx64nvYRwgViy++LZDBWHGWgCGWmWvhcb6zsaihu/BUTE5QUT9e2
         loLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PzuSllLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t207si1686905qke.107.2020.02.18.01.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:44:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PzuSllLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59113 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zQQ-00010f-Rz
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43112)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQI-00010N-Fo
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQH-0005mn-9o
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20242
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQH-0005mU-6w
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j/EdDI2CtMVN9fdl6+h7xbjhrRwwWIt4TPFM6oFFcSc=;
 b=PzuSllLRkQQBsWwHnwglCe0ykYChZ3g9tbYn0LvTT71QyAGJiq6eifqmPD6YmknJ8Qp0FN
 vXtf9cp19E2seEb2xiNVVmQxC4ncIpfpRyASlnUylyc+zek20nBPzEFkIpmNK6Lt6EGBC5
 tBaRL+qRj66YOFbnaweBSh1EAcDqyUs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-3kvb36CqOPO32poKjyOqjA-1; Tue, 18 Feb 2020 04:44:07 -0500
Received: by mail-wm1-f72.google.com with SMTP id d4so872408wmd.7
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d11KEHy00cHcmoOZmfkiJiWUsKxIDwvg0E/JJImsCd0=;
 b=r/VYLdrY+zYAzgYRXvlBbPeIAJy2Ga3VHxuBxnPuTCyfL3zLW4rrYOtOstvWzoUKxj
 TfgDIhR7gKeCOB9//yNtxa6zQ6EEcglzvxx5EwXvOQ7d6kZpnaFQ0MhOySDiNNJQzbm6
 MXOFtIikqhqPqKRVV3OzU1+9TGHBkCubNBw1Bt5EreginrENq6mBDqz3FTSP5qEt3Rr+
 Zp5fl43QZ8A8gVvI3YoAAhdTGI2nhW1V+V8Ysq9i3JaZWHD0071FX21alZhb5EOBEeJm
 1iTFTEBih+/EgC8suAqVx6c15NEmN/Dbgs3XzlaKNQDlN64Ee46R/Xv0oNjeOSci08op
 5EFA==
X-Gm-Message-State: APjAAAX5xAG87MBPDpw9Ai/3soUZI+crMfEwOGFxX5gqYAo+Gjzl8Sk/
 T/LMLi6OXf6+bGR1hjIzgTQIu9wn6YXT6n8ViroaKTrjilNxgZX2DMlPBwt+xGqGcsrT0cfX+Hz
 aXpi3oLQXq0S4
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr2144547wmg.151.1582019045980; 
 Tue, 18 Feb 2020 01:44:05 -0800 (PST)
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr2144493wmg.151.1582019045623; 
 Tue, 18 Feb 2020 01:44:05 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 00/13] trivial: Detect and remove superfluous
 semicolons in C code
Date: Tue, 18 Feb 2020 10:43:49 +0100
Message-Id: <20200218094402.26625-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-MC-Unique: 3kvb36CqOPO32poKjyOqjA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HLlGENc5RvYC

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

