Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp3529487lff;
        Wed, 4 Aug 2021 07:38:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFPkTe92qSk/Zgeq9hj0ZMJEVR/dY9TcrGEiUB+OXBP40PPhZ0Q2wZAHdo5/ibnzAggnSD
X-Received: by 2002:a50:8713:: with SMTP id i19mr56287edb.310.1628087924576;
        Wed, 04 Aug 2021 07:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628087924; cv=none;
        d=google.com; s=arc-20160816;
        b=q+qDdVWs7xpOno1obPDoZGz14pZORaF5eXOZUQWhIhSH3tVezI/ne1cpHUGKXwOh8l
         QBD+WDzVw0QBBQq89FC+xs6/Di06M/+I4/hLhJoWDq9eGqVVf/aFCcMBXZVv594M0mUS
         XCtrLYVj+cbcTmKUMv5PtKIKIIKEMCy7lMKIV/SKu2mkmNgc4roIyLQisNphjJE3lJS8
         F9QQMALDpNa4F0nNbwr+468IXNHcjyReppdGrN5Ttm2DbsupcruaL/uBvgN6GjOoZhb/
         qGh6ahDgDv44Q6LHZM0TlKS5nNPA88mct8WuAOtjwRLkET+Kc/eJfhtJY75WpxhFBeZD
         ZQyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=p6d17G2f/vY6Ohutt77Uwcqq6xVqFidX+CoxKbVzyPE=;
        b=RjCpMrncY/4QURooiOCBwUxclwjYjbji0VA/Hlu7E3kzMEexOGyF8naHEQ3tpCso+4
         7NHUTlQl634WB7Jpei5UweY5LwXu7n2Fn7j65rrtzuv7Ht++CylCZTaN09Y2UH0n08Na
         znCXV8TkyBQ8v48A6qR7ZiWEbezV3bnm2lVjxgIxgPJxG1wyHFJh1yg1wCyEgPSRZprA
         c2Iq/tfUYeknbpqOIU0LPUb7uhAJ06R4Hqry3vhitZlkYkR3xUCGX+uEjyQkGTbagjiu
         UsKgDyXfWB/gQU15v31SjLeytqWyYJIc0/WzQOBZrtGvhI6JVqWqfWR9E+4s2nJMFZM/
         93Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cLrl6hB9;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id y19si2231824edw.429.2021.08.04.07.38.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Aug 2021 07:38:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cLrl6hB9;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628087923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p6d17G2f/vY6Ohutt77Uwcqq6xVqFidX+CoxKbVzyPE=;
	b=cLrl6hB9r6KJa6dO2HlEBZbvf7Vy3O0Ya4ft+5/+zInlSGHdasiHgfijKZZCBa7sfoIOja
	1v+UApix60VUynBI5av0hdPI64CIR6h7S030D/3xS5Al0k97gl4iRUVKyRIyJPtGMJUuI7
	t4aPpGMvMg45mhPy9cqF2eKV7NRb000=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-lCpcxupgMoOhJMbThaXKxA-1; Wed, 04 Aug 2021 10:38:42 -0400
X-MC-Unique: lCpcxupgMoOhJMbThaXKxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5DBC87D543;
	Wed,  4 Aug 2021 14:38:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D4DB5D9C6;
	Wed,  4 Aug 2021 14:38:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 288611800983; Wed,  4 Aug 2021 16:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 0/7] tcg: some small towards more modular tcg
Date: Wed,  4 Aug 2021 16:38:19 +0200
Message-Id: <20210804143826.3402872-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 2C6bMjJX0Krz

=0D
=0D
Gerd Hoffmann (7):=0D
  plugins: register qemu_plugin_opts using opts_init()=0D
  tcg/module: move hmp.c to tcg module=0D
  tcg/module: move cpu-exec-common.c from tcg_ss to specific_ss=0D
  tcg/module: add some infrastructure for modular tcg.=0D
  tcg/module: Add tlb_flush to TCGModuleOps=0D
  tcg/module: Add tlb_flush_page to TCGModuleOps=0D
  tcg/module: Add tlb_reset_dirty to TCGModuleOps=0D
=0D
 include/exec/exec-all.h       |  8 +-------=0D
 include/qemu/plugin.h         |  7 -------=0D
 include/tcg/tcg-module.h      | 15 +++++++++++++++=0D
 accel/tcg/cpu-exec-common.c   |  8 ++++++++=0D
 accel/tcg/cputlb.c            | 11 ++++++++++-=0D
 accel/tcg/tcg-module.c        | 24 ++++++++++++++++++++++++=0D
 accel/tcg/translate-all.c     |  8 --------=0D
 cpu.c                         |  2 +-=0D
 linux-user/main.c             |  2 +-=0D
 plugins/loader.c              |  9 ++++++++-=0D
 softmmu/physmem.c             | 12 ++++++------=0D
 softmmu/vl.c                  |  1 -=0D
 target/arm/helper.c           | 26 +++++++++++++-------------=0D
 target/i386/helper.c          |  8 ++++----=0D
 target/i386/machine.c         |  2 +-=0D
 target/i386/tcg/fpu_helper.c  |  2 +-=0D
 target/i386/tcg/misc_helper.c |  2 +-=0D
 target/mips/sysemu/cp0.c      |  2 +-=0D
 target/s390x/gdbstub.c        |  2 +-=0D
 target/s390x/sigp.c           |  2 +-=0D
 accel/tcg/meson.build         | 11 +++++++++--=0D
 21 files changed, 106 insertions(+), 58 deletions(-)=0D
 create mode 100644 include/tcg/tcg-module.h=0D
 create mode 100644 accel/tcg/tcg-module.c=0D
=0D
--=20=0D
2.31.1=0D
=0D
