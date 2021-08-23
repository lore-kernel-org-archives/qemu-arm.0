Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2030438lfg;
        Mon, 23 Aug 2021 09:45:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyA7HN7YQD316xf1HRyVQ/SrHLr40kenNScj6H02aZ7lmMczba0g7RHLwuX0EUCzJ1JwYj0
X-Received: by 2002:a05:6638:25c3:: with SMTP id u3mr30729177jat.52.1629737104501;
        Mon, 23 Aug 2021 09:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629737104; cv=none;
        d=google.com; s=arc-20160816;
        b=Ts9Co4veWxbEXl4oCx6f9LYE1TS2EulFWhS5/6O8VtSuATq4I+7DqVI7a99Y/83AbM
         eV7QHe8SHXka3JB+W9/mH3Hg73MFJipvN3ARa1iSzF1KR9z56W3q+d/lIer2kj3g0MK1
         ChM/9rTDbIEAF6f1Vnsex9iSMfoCiN8ZToFmA+R4TlxGzwI5avDRry8fQijbTFULOE+M
         N+icFyvVUumLLnqigu6vNJ5zgQI1A5fG+GLgPVEH1YiWKZXP3b2cieF/rd5BdonQeJI5
         pk2pp1gyanYa1FbCtVWK8q621Ws9eC0gU8envO1D13prUEW8tvOYGd2ltJOKZ47j70h1
         5qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Iw86gclMHHcslYfuyGWy7U6haKf3Q0NfRhoUfbCS24o=;
        b=GVohIky0suvl55lMZN62olnwhFd2qJPy1/lG0KLYijIgWKo+QyAqfxaJP6srwC3xHM
         b6jzT6uR59LigpFj37JoPzFN2CX6UpQU9ITe30C74pv8bCOwihRONxjXUmYsWCaaw55q
         yCgvasuGmh7znA+rT9lVXMiZv+jkZcZxANXB/Mnnpi3tXz7yMoLpTNeBfs7OlDF2H9Rb
         J3Ot9AS18ca7qFNjUynvKKiT+VDPbT8jKRN6HM829Sxziju3gAu5c+oZxuyMBSG22cVw
         hK5hJ1r+ywF7W9uaQ5KTglEHMbEQzlMf5qgWGBhrmzeC/16DdZKT0pDUrO4RNxYV8tgp
         jthw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JFTqMPnH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22si14243274jal.57.2021.08.23.09.45.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 09:45:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JFTqMPnH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mID4J-0004z1-PV
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 12:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1U-0008IV-88
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:42:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1Q-0007Em-Hi
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629736922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Iw86gclMHHcslYfuyGWy7U6haKf3Q0NfRhoUfbCS24o=;
 b=JFTqMPnHDW7d/92KAgNIoLqhbnKUfYvY9EVv6R70Oqi8I2+xzshjWIPG9Cdw7eX4HgBuM8
 z58gJj63jQnw9btwmp74cCDVT5fLkfzddVsESiMaACfgywJmNfDL/UG2IUoFxaxP52AH5e
 G+pi2KpmQPUdF5aHvsUzZLxJffF0ILM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-jypbl6tqMlWxCqI0qakvkQ-1; Mon, 23 Aug 2021 12:42:00 -0400
X-MC-Unique: jypbl6tqMlWxCqI0qakvkQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so2151586wmd.2
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 09:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tdQkF+DeGW/PUh7l/wCwp28OizfjkGr6/zWGWFTFV5I=;
 b=rImoWOpMLSLDqah5K2+plurtix/svsp4LdSoZMXqTtqefLjfZcrb7Poxj+R/U/cory
 i3UQ/FISGBdpMk1DDu+RYhnkcU/b7TDtytr5nzSn5SuPB6p1eVNarjo3iSAxMwZ9G5dJ
 R7xLdEVM+z+ZGah8XRZ5dCOhBrI6NvcYXvMjcXKkosW24QCTaK/OkyiOn7TDObbwIFdn
 y+4+Skofx0uYWpFHx5kaWNPDQ7FbOYMIIYmdvC6aDDeYxBzoVaIBzlyfTVVxrvtXk0oo
 94na6Blo0A/xs9skGXB7OIvTrAD+SmQhGrnae5lX3wBT+Yk9G4OkiOa0Lf4Io2y+IJp6
 GL2A==
X-Gm-Message-State: AOAM5338F7KweI0nXaE+mnfQX2bFvZNnQqqGVPNGt6JJeTv9+pe0X3Tx
 1xLIBVA1YZ4pRC5c+aT69XfwYDoSoGd2I3Bn4EJ4a6o1cy77CEuxV9h4AJnhx6nOkOxLQ4ccgTr
 dXk5QSi/DHQ0t
X-Received: by 2002:adf:fa11:: with SMTP id m17mr14389947wrr.323.1629736919341; 
 Mon, 23 Aug 2021 09:41:59 -0700 (PDT)
X-Received: by 2002:adf:fa11:: with SMTP id m17mr14389917wrr.323.1629736919019; 
 Mon, 23 Aug 2021 09:41:59 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b4sm4795851wrp.33.2021.08.23.09.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:41:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/5] physmem: Have flaview API check bus permission
 from MemTxAttrs argument
Date: Mon, 23 Aug 2021 18:41:52 +0200
Message-Id: <20210823164157.751807-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R5vXEHYJLKju

This series aim to kill a recent class of bug, the infamous=0D
"DMA reentrancy" issues found by Alexander while fuzzing.=0D
=0D
Introduce the 'bus_perm' field in MemTxAttrs, defining 3 bits:=0D
=0D
- MEMTXPERM_UNSPECIFIED (current default, unchanged behavior)=0D
- MEMTXPERM_UNRESTRICTED (allow list approach)=0D
- MEMTXPERM_RAM_DEVICE (example of deny list approach)=0D
=0D
If a transaction permission is not allowed (for example access=0D
to non-RAM device), we return the specific MEMTX_BUS_ERROR.=0D
=0D
Permissions are checked in after the flatview is resolved, and=0D
before the access is done, in a new function: flatview_access_allowed().=0D
=0D
I'll post another series on top as example, fixing the SD card=0D
bugs.=0D
=0D
Since v1 ("hw: Forbid DMA write accesses to MMIO regions") [1]:=0D
- rewrite based on Peter / Stefan feedbacks=0D
=0D
Based on "hw: Let the DMA API take a MemTxAttrs argument" [2].=0D
=0D
Supersedes: <20200903110831.353476-1-philmd@redhat.com>=0D
Based-on: <20210702092439.989969-1-philmd@redhat.com>=0D
=0D
[1] https://www.mail-archive.com/qemu-block@nongnu.org/msg72924.html=0D
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg820359.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  softmmu/physmem: Simplify flatview_write and=0D
    address_space_access_valid=0D
  hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_ERROR=0D
  exec/memattrs: Introduce MemTxAttrs::bus_perm field=0D
  softmmu/physmem: Introduce flatview_access_allowed() to check bus=0D
    perms=0D
  softmmu/physmem: Have flaview API check MemTxAttrs::bus_perm field=0D
=0D
 include/exec/memattrs.h    | 21 +++++++++++++=0D
 hw/intc/arm_gicv3_dist.c   |  4 +--=0D
 hw/intc/arm_gicv3_redist.c |  4 +--=0D
 softmmu/physmem.c          | 61 ++++++++++++++++++++++++++++++++------=0D
 4 files changed, 77 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D

