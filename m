Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379464ejx;
        Mon, 5 Dec 2022 01:56:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Z62G54PXl+Qonu6foRQWScTmMqLgXYhCvu+v1bwgvnL/QEU2Rk9hsDU9rlV4TxFx1I4Sw
X-Received: by 2002:a05:620a:10b2:b0:6fc:c8ff:731b with SMTP id h18-20020a05620a10b200b006fcc8ff731bmr6850008qkk.410.1670234213753;
        Mon, 05 Dec 2022 01:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234213; cv=none;
        d=google.com; s=arc-20160816;
        b=jv+QPfFmiMi4wmtRFy6ZUM/8p1HeTcIrEVB/odzDLvuboEaL+UQeLZga1UEZ0+Pf8M
         WwN/WuT92I1tFXb8lUy7HTg2JYe8cXKiIcCcNGG+dvyZc6IdhK0mE4Mj9er4Nqidc7TA
         9sakhd64gFQta6nuJQlPvOy7fAsCXokCVtM3UpDtJNvE+zzkjrqtcZtOoh/T3pKjkV03
         dCrbViO2BMj38YLkGWaKpzBQx+83WaGY09PLza6kmWQgCfHv+54rnyETgg4ghH+j067T
         hfxl/WDqGtxoaGkM9avQT8afh91sFJSFGf7aWTBgDMFXovijatTOB5tci9ncmTdvnewv
         9EBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=zIIhGLkTAu6ClR7YeoqlcUrXmblUdO5TWS3HNnwwmnY=;
        b=NeV+DhkPkqYBVFFnyedfc+77hSsOq0aDcoLzCptq0imnE3Fp2HrEzgePLhJD+l3Ih2
         hq4AnUVyi+GjeA3shV92pqGZ41WMtO8qt3ohcMyr5w2DXW+QZyHVTRpnueQSAj3JoIR5
         Xwkj3QKLAWIcCPvWKHl1M7yVpAuGYpBZwSSM717mkmMleqp4DbbAdDHkLZSxjaWBX4wa
         800oQZAIs2DXr4Hmaf6beXaXmVtzcMz6NnwKfkzFO1rw3s3spaR0nWL6mK93YXoZ9O3S
         vxaodZ7/3/TfyFEzk5z+bLkHqo5V/P5/Gtgir5ZL2CT50VLWhhh53CEW+w1AsHdtnq67
         URNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iTs1ZGVo;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d12-20020ac8118c000000b0034b66d9bbd2si3273368qtj.652.2022.12.05.01.56.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:56:53 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iTs1ZGVo;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234213;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zIIhGLkTAu6ClR7YeoqlcUrXmblUdO5TWS3HNnwwmnY=;
	b=iTs1ZGVoqasLIX959pLl7nm0E/xrEA0YJEvZClh4n9wlpJjYOAizkcGPKeRabSMOkYNHDD
	Gm9goYwce9BJVuRtpmwQblbSwEhWNQzdUuUkzTAMTS5CoBLjKEWpMrWC3/A1WkN8yPXwDR
	WOJ1B4brxlXlBxksedW9ivjE0kyx6VE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-cDJkjrjpOwCFhds0cI7YRA-1; Mon, 05 Dec 2022 04:56:50 -0500
X-MC-Unique: cDJkjrjpOwCFhds0cI7YRA-1
Received: by mail-wr1-f69.google.com with SMTP id i25-20020adfaad9000000b002426945fa63so278195wrc.6
        for <alex.bennee@linaro.org>; Mon, 05 Dec 2022 01:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIIhGLkTAu6ClR7YeoqlcUrXmblUdO5TWS3HNnwwmnY=;
        b=H6znuuelQ41WHCB0SFvNwFCGPKr9taASd2k1KpLxFtSEM6dXYoKhigJQwo9dAd9Fig
         zwAIiUXPgcGV4+bYMvx/jwY0wjSZylnpIscX4q6OJj2Oqun7dmSsN9Lz9CxGMSjFcW7Y
         yA4YdVwl12tcdqeBSIzD1wPLUwQFnWjnjrEWbyMj20M2bg6LN+Kz4YF9bngm7vfxnN2J
         aJ+spikG1y2NPNiKDGe+dCTi6Ag1TkW+Vvj2NPUEKyFboofdB7FqXy7UrwdSZ8eT8z8F
         SzJ2jl0eIOdMP5O/7FKGyfk9S/ECohVloJuPg6eWcZrd8279t6YxHDw/HohNcanMZc5/
         +GOA==
X-Gm-Message-State: ANoB5pnWqWWMed28TriUPAIynNMy0iTjlavKSJqdjOr2Bc7jWYSEz4Oc
	J0BFBePQgfJMi3istyN5JYcP0SRlbKaf/MR6jGgXAhD0UVgt5dTUV/MNvVZ9ILM52L1zllEuJ6K
	XFuIxklB5C4j9TzNL
X-Received: by 2002:a05:600c:414d:b0:3d0:878e:6fed with SMTP id h13-20020a05600c414d00b003d0878e6fedmr9425514wmm.150.1670234209243;
        Mon, 05 Dec 2022 01:56:49 -0800 (PST)
X-Received: by 2002:a05:600c:414d:b0:3d0:878e:6fed with SMTP id h13-20020a05600c414d00b003d0878e6fedmr9425479wmm.150.1670234209006;
        Mon, 05 Dec 2022 01:56:49 -0800 (PST)
Return-Path: <quintela@redhat.com>
Received: from redhat.com ([137.101.155.210])
        by smtp.gmail.com with ESMTPSA id bg28-20020a05600c3c9c00b003cfa3a12660sm26793090wmb.1.2022.12.05.01.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 01:56:48 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,  Thomas Huth <huth@tuxfamily.org>,  Viresh
 Kumar <viresh.kumar@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,  Mathieu
 Poirier <mathieu.poirier@linaro.org>,  Laurent Vivier <laurent@vivier.eu>,
  Eric Blake <eblake@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Raphael Norwitz
 <raphael.norwitz@nutanix.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
  virtio-fs@redhat.com,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Christian
 Borntraeger <borntraeger@linux.ibm.com>,  "Gonglei (Arei)"
 <arei.gonglei@huawei.com>,  qemu-block@nongnu.org,  Xiaojuan Yang
 <yangxiaojuan@loongson.cn>,  Thomas Huth <thuth@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Eduardo Habkost <eduardo@habkost.net>,
  Gerd Hoffmann <kraxel@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Alex Williamson <alex.williamson@redhat.com>,
  Eric Farman <farman@linux.ibm.com>,  Halil Pasic <pasic@linux.ibm.com>,
  Peter Maydell <peter.maydell@linaro.org>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Jason Wang <jasowang@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Song Gao <gaosong@loongson.cn>,
  qemu-s390x@nongnu.org,  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
  Klaus Jensen <its@irrelevant.dk>,  John Snow <jsnow@redhat.com>,  Michael
 Tokarev <mjt@tls.msk.ru>,  qemu-arm@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Keith
 Busch <kbusch@kernel.org>,  David Hildenbrand <david@redhat.com>,
  qemu-trivial@nongnu.org,  Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 00/51] migration patches for VFIO
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com> (Juan Quintela's
	message of "Mon, 5 Dec 2022 10:51:37 +0100")
References: <20221205095228.1314-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Mon, 05 Dec 2022 10:56:47 +0100
Message-ID: <87v8mqb2cg.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FtLPtFNHd6bK

Juan Quintela <quintela@redhat.com> wrote:
> Hi

Nack myself

This patch series should be sent against my next-8.0 branch, not master.

Sorry for the noise.

Will resend.

>
> On this v2:
>
> - Remove the stop of the guest to calculate the size
> - Rebase on latest upstream.
>
> Please review.
>
> [v1/RFC]
> VFIO migration has several requirements:
> - the size of the state is only known when the guest is stopped
> - they need to send possible lots of data.
>
> this series only address the 1st set of problems.
>
> What they do:
> - res_compatible parameter was not used anywhere, just add that informati=
on to res_postcopy.
> - Remove QEMUFILE parameter from save_live_pending
> - Split save_live_pending into
>   * save_pending_estimate(): the pending state size without trying too ha=
rd
>   * save_pending_exact(): the real pending state size, it is called with =
the guest stopped.
> - Now save_pending_* don't need the threshold parameter
> - HACK a way to stop the guest before moving there.
>
> ToDo:
> - autoconverge test is broken, no real clue why, but it is possible that =
the test is wrong.
>
> - Make an artifact to be able to send massive amount of data in the save =
state stage (probably more multifd channels).
>
> - Be able to not having to start the guest between cheking the state pend=
ing size and migration_completion().
>
> Please review.
>
> Thanks, Juan.
>
> Alex Benn=C3=A9e (4):
>   tests/qtests: override "force-legacy" for gpio virtio-mmio tests
>   hw/virtio: add started_vu status field to vhost-user-gpio
>   hw/virtio: generalise CHR_EVENT_CLOSED handling
>   include/hw: VM state takes precedence in virtio_device_should_start
>
> Evgeny Ermakov (2):
>   target/arm: Set TCGCPUOps.restore_state_to_opc for v7m
>   hw/display/next-fb: Fix comment typo
>
> Gerd Hoffmann (2):
>   update seabios source from 1.16.0 to 1.16.1
>   update seabios binaries to 1.16.1
>
> Juan Quintela (9):
>   multifd: Create page_size fields into both MultiFD{Recv,Send}Params
>   multifd: Create page_count fields into both MultiFD{Recv,Send}Params
>   migration: Export ram_transferred_ram()
>   migration: Export ram_release_page()
>   migration: Remove res_compatible parameter
>   migration: No save_live_pending() method uses the QEMUFile parameter
>   migration: Split save_live_pending() into state_pending_*
>   migration: Remove unused threshold_size parameter
>   migration: simplify migration_iteration_run()
>
> Klaus Jensen (5):
>   hw/nvme: fix aio cancel in format
>   hw/nvme: fix aio cancel in flush
>   hw/nvme: fix aio cancel in zone reset
>   hw/nvme: fix aio cancel in dsm
>   hw/nvme: remove copy bh scheduling
>
> Paolo Bonzini (1):
>   target/i386: allow MMX instructions with CR4.OSFXSR=3D0
>
> Peter Xu (15):
>   migration: Take bitmap mutex when completing ram migration
>   migration: Add postcopy_preempt_active()
>   migration: Cleanup xbzrle zero page cache update logic
>   migration: Trivial cleanup save_page_header() on same block check
>   migration: Remove RAMState.f references in compression code
>   migration: Yield bitmap_mutex properly when sending/sleeping
>   migration: Use atomic ops properly for page accountings
>   migration: Teach PSS about host page
>   migration: Introduce pss_channel
>   migration: Add pss_init()
>   migration: Make PageSearchStatus part of RAMState
>   migration: Move last_sent_block into PageSearchStatus
>   migration: Send requested page directly in rp-return thread
>   migration: Remove old preempt code around state maintainance
>   migration: Drop rs->f
>
> Philippe Mathieu-Daud=C3=A9 (5):
>   hw/display/qxl: Have qxl_log_command Return early if no log_cmd
>     handler
>   hw/display/qxl: Document qxl_phys2virt()
>   hw/display/qxl: Pass requested buffer size to qxl_phys2virt()
>   hw/display/qxl: Avoid buffer overrun in qxl_phys2virt (CVE-2022-4144)
>   hw/display/qxl: Assert memory slot fits in preallocated MemoryRegion
>
> Richard Henderson (2):
>   replay: Fix declaration of replay_read_next_clock
>   target/i386: Always completely initialize TranslateFault
>
> Stefan Hajnoczi (2):
>   block-backend: avoid bdrv_unregister_buf() NULL pointer deref
>   Update VERSION for v7.2.0-rc3
>
> Stefano Garzarella (1):
>   vhost: enable vrings in vhost_dev_start() for vhost-user devices
>
> Thomas Huth (2):
>   tests/qtest/migration-test: Fix unlink error and memory leaks
>   target/s390x/tcg: Fix and improve the SACF instruction
>
> Xiaojuan Yang (1):
>   hw/loongarch/virt: Add cfi01 pflash device
