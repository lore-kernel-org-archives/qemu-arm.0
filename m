Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp615992ocb;
        Thu, 6 Oct 2022 09:47:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM464HfLSvD7k0+ZFqv9jjvPeHeqCyJdnI4mHv0e/yoYqz1cnvuHm4WHoxYjnn00YATt0oYb
X-Received: by 2002:ae9:f707:0:b0:6e7:2317:8318 with SMTP id s7-20020ae9f707000000b006e723178318mr758411qkg.571.1665074823669;
        Thu, 06 Oct 2022 09:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665074823; cv=none;
        d=google.com; s=arc-20160816;
        b=Oqc0LkKjViA7TlICXl8xSrsb8BfhGQXxVXHyAEOnwYzi8cpJWDKXZRXE8QF5Cs7y5+
         fcaraNhg8QrCWJf7DbV9g0oJVFiYOjM7f9sSqpeYYDcram3C+utVb077/s8khHBbYr25
         AoqNJoJkvTTzz+PgUr0CTsFLBXJL5KJtnwhG0MhYmXYjy2DbR3bdhDPIU3uYtFGpSx75
         edCBq2EFFEcIlc571KMauM4Mr0ko5I8x1Apcp3jOkNEzBoZAurZky8NlxVPfNrrM4dlp
         IPsj2g+4QhcTC04DdRARCTR+APKysZRshFFRzCJcGJW5aFBzJIDoHVqXcJN2Dl2qIxYj
         ehXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=D8z3l+na9h9tlSJCYr3XZQbeJwsSdN6lLYMfuwIJIgw=;
        b=CnoyN7zPxer4Fg7N+B8EcGB0Y9fgGvLGfhZaYnZZabu0l6cF3UQiR8IFzmzq2xIAWL
         ksCdJR8+L4BJDK9cJUNJgb3UiieNHWM7nLEI/HhN5iThkhSbTk4GVbJTHAV6Zw2UMdo1
         RKeGymuAKz0PB6cUYhn9tVA8crbHNISQHXhKtx1hq4iNU6FNwN1WfTlX4ME/t7vRT5aM
         MAXvcwxqNlFtrD0fuTYKAdjPcya8D2LsUsOS2keOwPxzjeorC5gRG+p5ZE7ZFxW8q5Zx
         l0+oJX26MxPEQhKlKNFvkFjHVhuQhPwOWWzMTxxc5CraNH8wi7L/UwNLK3+3YwUOb2XR
         m8TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=buMl7aG3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020ac85c08000000b0035bb10fdfb1si38573qti.349.2022.10.06.09.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 09:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=buMl7aG3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogU1X-0006Ms-6f
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 12:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogStW-0003Ia-By
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogStT-00007M-Ee
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D8z3l+na9h9tlSJCYr3XZQbeJwsSdN6lLYMfuwIJIgw=;
 b=buMl7aG3kwImYKHjS4GOQToNtDMdcW4/ywIP3Gy9klJ3zi6dWYcGd+A4HWEVrQo2gIlFI/
 Bb0ZZCWCU+UnNCEd8agKVJQJRn7Hr09d2zBGWA9pt4eZDgi27j6pWTNgwPmf/KnLjTHndR
 ElQFJRbKMv0sr2lhJLsrjIv/h8uS42I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-cMAhn_r9OzmoMEUVXiUGvA-1; Thu, 06 Oct 2022 11:34:35 -0400
X-MC-Unique: cMAhn_r9OzmoMEUVXiUGvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3D70101AA5D;
 Thu,  6 Oct 2022 15:34:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A45472011566;
 Thu,  6 Oct 2022 15:34:33 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 viktor.prutyanov@redhat.com, Greg Kurz <groug@kaod.org>,
 frankja@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 00/10] Dump patches
Date: Thu,  6 Oct 2022 19:34:19 +0400
Message-Id: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FzgD1Jr8mhBW

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:

  Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/dump-pull-request

for you to fetch changes up to 94d788408d2d5a6474c99b2c9cf06913b9db7c58:

  dump: fix kdump to work over non-aligned blocks (2022-10-06 19:31:54 +0400)

----------------------------------------------------------------
dump patches

Hi

Includes:
- the first patches from "[PATCH v5 00/18] dump: Add arch section and s390x PV dump"
- "[PATCH v2 0/2] Fix dumping in kdump format with non-aligned memory"

----------------------------------------------------------------

Janosch Frank (8):
  dump: Replace opaque DumpState pointer with a typed one
  dump: Rename write_elf_loads to write_elf_phdr_loads
  dump: Refactor dump_iterate and introduce dump_filter_memblock_*()
  dump: Rework get_start_block
  dump: Rework filter area variables
  dump: Rework dump_calculate_size function
  dump: Split elf header functions into prepare and write
  dump: Rename write_elf*_phdr_note to prepare_elf*_phdr_note

Marc-André Lureau (2):
  dump: simplify a bit kdump get_next_page()
  dump: fix kdump to work over non-aligned blocks

 include/hw/core/sysemu-cpu-ops.h |   8 +-
 include/qemu/typedefs.h          |   1 +
 include/sysemu/dump.h            |  15 +-
 target/arm/cpu.h                 |   4 +-
 target/i386/cpu.h                |   8 +-
 target/ppc/cpu.h                 |   4 +-
 target/riscv/cpu.h               |   4 +-
 target/s390x/s390x-internal.h    |   2 +-
 dump/dump.c                      | 361 +++++++++++++++++--------------
 target/arm/arch_dump.c           |   6 +-
 target/i386/arch_dump.c          |  30 +--
 target/ppc/arch_dump.c           |  18 +-
 target/riscv/arch_dump.c         |   6 +-
 target/s390x/arch_dump.c         |  10 +-
 14 files changed, 259 insertions(+), 218 deletions(-)

-- 
2.37.3

