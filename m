Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3377691ejx;
        Mon, 5 Dec 2022 01:52:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Six8i76S8UMYlWYhSli/0UCvnL9IAN6hv4T+HQJweTTxfJgo4/dHxfOgczmdvy8nNpNcG
X-Received: by 2002:ac8:5796:0:b0:3a6:94f7:abd7 with SMTP id v22-20020ac85796000000b003a694f7abd7mr15231202qta.317.1670233966609;
        Mon, 05 Dec 2022 01:52:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670233966; cv=none;
        d=google.com; s=arc-20160816;
        b=sCewc+JwYTmA3IGUXfaYB9zx+7UOFiKDWb3oOYoEkPIPos4cj/apRD76xBKgASTuLv
         6FKaPfxdcFyivWu80KnuMtR6ucFIHnMtwUTNoubHPgBlkzgkoy4H+8OFB7Hdto05Jc/g
         ekC8Lw8/db4CT+9h1e1abW4tMkjF5Iv0WmPX8+zWT4BnrzihJ1NVKzQ3E/DpOhBTalMG
         E5eREk71sI8fUXJidiN3uaXXUrhU+OrfPlgcpuf4X7WXkOKxYfKQfbkEkmWQ7XZV9HEf
         Oo+qsHL3+nj88QoeYab7A+1rVudawPgt2efg0NEU92K9gcGjZDnRRB1ELIAzESXdm8tz
         Z/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=okeonkb2O++Krxrb9t+hNwq8JIpCuDdo2NcbeqlenYE=;
        b=OkLLgbqDKUrQYLspWYJQnqBrN7vJfE1mzKfo/uebFnVTMIHxgS3FGF4k5jbL0k5CoS
         fm12mymgr9bKsSxuJVnQDBBpPHlkZsapLHFV6E/Q9M0S/f5zVvlHx4dxlFIqM8hYd4kj
         3ti0KvsyujgQeztoDP+iSvEOasg7ew1eGE+Kcs5IlPzxZaUwkGu0HGS/WN7GutB4KxQd
         VTqPQ8IjVh+eKkexVT0S6zGPqH0FuM3hOl8+6eL59VoswDO49NAHDZTxfLn/ywL+aMm7
         ACbdb61AJG94RnlEmtZDPmhT/tCYuFpsZriPEha1dY4I2gb7VFn2BDoAmbxH2QTGBxzg
         M7kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qjp4N27S;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id fb7-20020a05622a480700b003a496373dacsi4306222qtb.531.2022.12.05.01.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:52:46 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qjp4N27S;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670233966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=okeonkb2O++Krxrb9t+hNwq8JIpCuDdo2NcbeqlenYE=;
	b=Qjp4N27SVnYZW7Zxx17IkOG5ShPIw3a9lNKPPUf1JiekF18a2h+QoXSn5gQ0JeeL2CtQrX
	yr7+VPgHC3f7MnFVYI+Ws9oKtk4SvmiKgBmSnlUwXXvYiIl2XvvaZueniIuX/7CM6tMzzw
	ZBFhkxfH9fc+3AngUrkLLeUhDw37PAk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-eQ27QNs8O4SFskwS6XkxrQ-1; Mon, 05 Dec 2022 04:52:42 -0500
X-MC-Unique: eQ27QNs8O4SFskwS6XkxrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB43E8339C5;
	Mon,  5 Dec 2022 09:52:40 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B4F42166B2A;
	Mon,  5 Dec 2022 09:52:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	virtio-fs@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Klaus Jensen <its@irrelevant.dk>,
	John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 00/51] migration patches for VFIO
Date: Mon,  5 Dec 2022 10:51:37 +0100
Message-Id: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: Oqx5CtsphjFQ

Hi

On this v2:

- Remove the stop of the guest to calculate the size
- Rebase on latest upstream.

Please review.

[v1/RFC]
VFIO migration has several requirements:
- the size of the state is only known when the guest is stopped
- they need to send possible lots of data.

this series only address the 1st set of problems.

What they do:
- res_compatible parameter was not used anywhere, just add that information to res_postcopy.
- Remove QEMUFILE parameter from save_live_pending
- Split save_live_pending into
  * save_pending_estimate(): the pending state size without trying too hard
  * save_pending_exact(): the real pending state size, it is called with the guest stopped.
- Now save_pending_* don't need the threshold parameter
- HACK a way to stop the guest before moving there.

ToDo:
- autoconverge test is broken, no real clue why, but it is possible that the test is wrong.

- Make an artifact to be able to send massive amount of data in the save state stage (probably more multifd channels).

- Be able to not having to start the guest between cheking the state pending size and migration_completion().

Please review.

Thanks, Juan.

Alex Bennée (4):
  tests/qtests: override "force-legacy" for gpio virtio-mmio tests
  hw/virtio: add started_vu status field to vhost-user-gpio
  hw/virtio: generalise CHR_EVENT_CLOSED handling
  include/hw: VM state takes precedence in virtio_device_should_start

Evgeny Ermakov (2):
  target/arm: Set TCGCPUOps.restore_state_to_opc for v7m
  hw/display/next-fb: Fix comment typo

Gerd Hoffmann (2):
  update seabios source from 1.16.0 to 1.16.1
  update seabios binaries to 1.16.1

Juan Quintela (9):
  multifd: Create page_size fields into both MultiFD{Recv,Send}Params
  multifd: Create page_count fields into both MultiFD{Recv,Send}Params
  migration: Export ram_transferred_ram()
  migration: Export ram_release_page()
  migration: Remove res_compatible parameter
  migration: No save_live_pending() method uses the QEMUFile parameter
  migration: Split save_live_pending() into state_pending_*
  migration: Remove unused threshold_size parameter
  migration: simplify migration_iteration_run()

Klaus Jensen (5):
  hw/nvme: fix aio cancel in format
  hw/nvme: fix aio cancel in flush
  hw/nvme: fix aio cancel in zone reset
  hw/nvme: fix aio cancel in dsm
  hw/nvme: remove copy bh scheduling

Paolo Bonzini (1):
  target/i386: allow MMX instructions with CR4.OSFXSR=0

Peter Xu (15):
  migration: Take bitmap mutex when completing ram migration
  migration: Add postcopy_preempt_active()
  migration: Cleanup xbzrle zero page cache update logic
  migration: Trivial cleanup save_page_header() on same block check
  migration: Remove RAMState.f references in compression code
  migration: Yield bitmap_mutex properly when sending/sleeping
  migration: Use atomic ops properly for page accountings
  migration: Teach PSS about host page
  migration: Introduce pss_channel
  migration: Add pss_init()
  migration: Make PageSearchStatus part of RAMState
  migration: Move last_sent_block into PageSearchStatus
  migration: Send requested page directly in rp-return thread
  migration: Remove old preempt code around state maintainance
  migration: Drop rs->f

Philippe Mathieu-Daudé (5):
  hw/display/qxl: Have qxl_log_command Return early if no log_cmd
    handler
  hw/display/qxl: Document qxl_phys2virt()
  hw/display/qxl: Pass requested buffer size to qxl_phys2virt()
  hw/display/qxl: Avoid buffer overrun in qxl_phys2virt (CVE-2022-4144)
  hw/display/qxl: Assert memory slot fits in preallocated MemoryRegion

Richard Henderson (2):
  replay: Fix declaration of replay_read_next_clock
  target/i386: Always completely initialize TranslateFault

Stefan Hajnoczi (2):
  block-backend: avoid bdrv_unregister_buf() NULL pointer deref
  Update VERSION for v7.2.0-rc3

Stefano Garzarella (1):
  vhost: enable vrings in vhost_dev_start() for vhost-user devices

Thomas Huth (2):
  tests/qtest/migration-test: Fix unlink error and memory leaks
  target/s390x/tcg: Fix and improve the SACF instruction

Xiaojuan Yang (1):
  hw/loongarch/virt: Add cfi01 pflash device

-- 
2.38.1
