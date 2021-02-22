Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1786851lfc;
        Mon, 22 Feb 2021 06:35:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOBp2Cf1vOSyDnL2JkveZlKOS9Z7vtM3hebHPGg6AUqtK7AE+tJGvfdn06Jh+3tKdNsRYU
X-Received: by 2002:a17:906:c7c5:: with SMTP id dc5mr13067852ejb.470.1614004508269;
        Mon, 22 Feb 2021 06:35:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614004508; cv=none;
        d=google.com; s=arc-20160816;
        b=SwM57yLGbPfJmIWsYGf/WrBedg95uuTHkoY7wuBCicNVp3lTBrb43/k4CWxaQE0Dyj
         4t22JT2ACK4tZ49CcHFEiwqz85X1MfIR9tfi5rsbgl0Bq0crf3Pz3KnoRe2T3bOLZ33C
         Cv6yJQKLPEhOgBV7n4+lJuEWXBdNcj+pEO6mqdIq5XJBeHEa5B/8ryN8GK4OXsWE4EOo
         xNB0rJokzUSPvfcTAycaFPecYhGHscQfdGNhp5nRF702D4k6jc73z1MRMch2hjdPFvc6
         wnqYUGaTbPHHi1pj3aqqobVPVdr71MBYS4ZnQvSfigK6vpmuEsYw13jZhacN5LU0sx3w
         vtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ROXc4pPESl2hnVPAmTj87jG8Y89YLot+XFk/YVIBdHE=;
        b=Ju263zVuIz/aI9pujHNxfYqUZo+bDi82Zxmjdzmp4KPZagHF5j9AlEz7PokX7/1sqs
         hq17HnZx4X7/qRZ6NwZKo3jysy2XPwWTBGBRrqxjJYE5AymIbBg7mIxvp4wNkw8ixMvx
         vesKS4f+cq2JLiTNqR7PCGF6eYx1QRyRMiaeX8UeZoNm62dVA1xjvNhz7rnM8LrjcvAo
         2RM/wpielq8irvQ+F0O6SNmuU7xDoUHhLtHqj9+JZDEHE5znPP9/gSSENtQpLTDmZOyE
         q9xhr6AHq2L70crBBlC0VFoTXwxdHd2Ru7xpWg5cUI9IMv66ez85w6EmbaPB/naIgHeu
         qvoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Jt/qkbBE";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id n5si1257790ejb.640.2021.02.22.06.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Feb 2021 06:35:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Jt/qkbBE";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614004507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ROXc4pPESl2hnVPAmTj87jG8Y89YLot+XFk/YVIBdHE=;
	b=Jt/qkbBEPmMixjX8Cxmjpq12XhW8YqfqzH4LeJZ4Jz/LKMaiCBixxwVJPaSdSPFbCFv1mQ
	WH9g8IyAs+SzBrH6xpMoYXuA7YmAWy2Q3xBFYKWhQMR33ANBkifNATxUHG5x1LS5Q369UL
	q7W23asOTJq3K5jwts0i5kia39LnG/Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-D5AI-G5YODiYB2H-30P_yA-1; Mon, 22 Feb 2021 09:35:05 -0500
X-MC-Unique: D5AI-G5YODiYB2H-30P_yA-1
Received: by mail-ed1-f70.google.com with SMTP id dk21so7070951edb.10
        for <alex.bennee@linaro.org>; Mon, 22 Feb 2021 06:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ROXc4pPESl2hnVPAmTj87jG8Y89YLot+XFk/YVIBdHE=;
        b=ZZnN9V/eDVcSsaA1UcaU/1GKlKEOzadCIFv3+QUvcEqfcCisBPB2LUQDfcEUmWo9Z8
         TXuL0gFIMBvyV77zfZ7g5V4kE0adCWwpldF2+6PW7hoA0rIPdxsoJ1v2jRxMXzqx9fcr
         vdilRaPprAre5tw7Rq5Kjuje7WrhD9DhLPKZZGmjCkFOJZgmY6mYNHbqxkGwwJt+R7xV
         qkobydzZ3w+YkK/DqnDTvGlxvho9JDHG6LRAwB9x7bLqls4ridhoo+xivnjg4769HAXz
         6cHxRIqIMkZ3Lp3LyRNRiGxniQgfcoZfeynY1AsllvfT2uVdioRnHRg3WWdz8FYiyxIM
         lblA==
X-Gm-Message-State: AOAM533NwJG/cgTNQpUDWJBDZNQHh9XSidC0+sDe7VOgJHJVi+NKst1c
	MnjyHG7vh1sdb3MdCqurHC0eQNye3NsHLmmDrOA18/T94+pryoqUaxTRNkAL4LjrWBEdH9MXaaO
	23xk+FMP2OUcfrDaq
X-Received: by 2002:a50:9dc9:: with SMTP id l9mr22865692edk.377.1614004503648;
        Mon, 22 Feb 2021 06:35:03 -0800 (PST)
X-Received: by 2002:a50:9dc9:: with SMTP id l9mr22865651edk.377.1614004503527;
        Mon, 22 Feb 2021 06:35:03 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id s14sm10457606ejf.47.2021.02.22.06.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 06:35:02 -0800 (PST)
Subject: Re: [PATCH 0/2] sysemu: Let VMChangeStateHandler take boolean
 'running' argument
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Amit Shah <amit@kernel.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 qemu-ppc@nongnu.org, kvm@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-block@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210111152020.1422021-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <84048681-32d3-7217-e94c-461501cf550b@redhat.com>
Date: Mon, 22 Feb 2021 15:34:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210111152020.1422021-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: FUUKfFm76XZS

Paolo, this series is fully reviewed, can it go via your
misc tree?

On 1/11/21 4:20 PM, Philippe Mathieu-Daudé wrote:
> Trivial prototype change to clarify the use of the 'running'
> argument of VMChangeStateHandler.
> 
> Green CI:
> https://gitlab.com/philmd/qemu/-/pipelines/239497352
> 
> Philippe Mathieu-Daudé (2):
>   sysemu/runstate: Let runstate_is_running() return bool
>   sysemu: Let VMChangeStateHandler take boolean 'running' argument
> 
>  include/sysemu/runstate.h   | 12 +++++++++---
>  target/arm/kvm_arm.h        |  2 +-
>  target/ppc/cpu-qom.h        |  2 +-
>  accel/xen/xen-all.c         |  2 +-
>  audio/audio.c               |  2 +-
>  block/block-backend.c       |  2 +-
>  gdbstub.c                   |  2 +-
>  hw/block/pflash_cfi01.c     |  2 +-
>  hw/block/virtio-blk.c       |  2 +-
>  hw/display/qxl.c            |  2 +-
>  hw/i386/kvm/clock.c         |  2 +-
>  hw/i386/kvm/i8254.c         |  2 +-
>  hw/i386/kvmvapic.c          |  2 +-
>  hw/i386/xen/xen-hvm.c       |  2 +-
>  hw/ide/core.c               |  2 +-
>  hw/intc/arm_gicv3_its_kvm.c |  2 +-
>  hw/intc/arm_gicv3_kvm.c     |  2 +-
>  hw/intc/spapr_xive_kvm.c    |  2 +-
>  hw/misc/mac_via.c           |  2 +-
>  hw/net/e1000e_core.c        |  2 +-
>  hw/nvram/spapr_nvram.c      |  2 +-
>  hw/ppc/ppc.c                |  2 +-
>  hw/ppc/ppc_booke.c          |  2 +-
>  hw/s390x/tod-kvm.c          |  2 +-
>  hw/scsi/scsi-bus.c          |  2 +-
>  hw/usb/hcd-ehci.c           |  2 +-
>  hw/usb/host-libusb.c        |  2 +-
>  hw/usb/redirect.c           |  2 +-
>  hw/vfio/migration.c         |  2 +-
>  hw/virtio/virtio-rng.c      |  2 +-
>  hw/virtio/virtio.c          |  2 +-
>  net/net.c                   |  2 +-
>  softmmu/memory.c            |  2 +-
>  softmmu/runstate.c          |  4 ++--
>  target/arm/kvm.c            |  2 +-
>  target/i386/kvm/kvm.c       |  2 +-
>  target/i386/sev.c           |  2 +-
>  target/i386/whpx/whpx-all.c |  2 +-
>  target/mips/kvm.c           |  4 ++--
>  ui/gtk.c                    |  2 +-
>  ui/spice-core.c             |  2 +-
>  41 files changed, 51 insertions(+), 45 deletions(-)
> 
