Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3208367lfg;
        Tue, 9 Mar 2021 14:08:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEqUoZ6xPF0TXrUzGwFqWMeV3pXYeZIcf3pL0or0ZnXGgwVM+ydtRmrTag1fCT4QXS3ILE
X-Received: by 2002:a17:906:f8d5:: with SMTP id lh21mr253331ejb.64.1615327704706;
        Tue, 09 Mar 2021 14:08:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615327704; cv=none;
        d=google.com; s=arc-20160816;
        b=uLmrhbJG+nps7kBC8n+72tIKdrdADyZnro6nLW0fYjiNQ0vd6S8nWhycrSF8EhTTN4
         4inYhIF1glllf77fauvnVxN/XmZNZn1rw5uJi6ctGrCo+8P4FhUfr0Trt6iEtkBtEFBJ
         rp+hw/INw5tNSBYkaQFvS9ufiyiLg7Jk1L/7gcNaOifMJ3EjcWd4QGcMqwNDXVrrS55S
         3r14mnBQy9YKMQ+LjfHTIMCt7iKmBiz6aDvqPPto0DLFz1WQAg0qVk3qo0vm0sjOX2c9
         jetCtbagYjrG4p3shBvXztYTmVO3tfQtEbTmlFFjfZ3hZuDgc2rXC6UcYWscr0gAO983
         BzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=TrRfkpaCyAif10vY2NLzElT8H9hcz96S44UT+WnEyM0=;
        b=E9ab9gcXvcVlqkmDR4tJF0JTkFhE3hZT5yJrq9pJljeYeWf9zFVMSfT5y90kLADHN1
         TMDiInlqNZMy6F+AchWTssHylB933LPFAuV8Nno5E83i/9lqeKQYAsX0RQNzEprFTQBp
         yPNnM8iLNAObt9nLzou3OxxtrgsqKOjDC4hgv2RCFnoLD1o7NfRovBlIzuD4IDNoGnmy
         7JQwt8BIq+F0T7YvJBEtcUVSe54sV4t9T2QbMVeQm75gOQShBTv9kozbO0aA2thv7g9R
         QGlwJNMvZSSioUi8BSvj+nJaFl9YSLWSdsFPrGctqgiOf15uxMeihjmqlooBNYkdRua+
         KWjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FgUnxXZs;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id c23si4160355ejd.271.2021.03.09.14.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Mar 2021 14:08:24 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FgUnxXZs;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615327703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrRfkpaCyAif10vY2NLzElT8H9hcz96S44UT+WnEyM0=;
	b=FgUnxXZsgjBvrb3220+nGB0Q8THgSq7pMRjoJj9bSnNJqs/394SltmWFUD0Bcs4VUQ2gLl
	HMRt+fKVq1RKElSa4cpJ4VcSvlWtCTvsL+GkHqs8OJMh4v9W+xHztl/YBhC4SjKjRnu5SB
	BnvkgZ45FIzSZx3/cSCaaxFI6s28Ug4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-yIrO1ubwO7u8uJHaBEMH-A-1; Tue, 09 Mar 2021 17:08:22 -0500
X-MC-Unique: yIrO1ubwO7u8uJHaBEMH-A-1
Received: by mail-ed1-f69.google.com with SMTP id n20so7495994edr.8
        for <alex.bennee@linaro.org>; Tue, 09 Mar 2021 14:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TrRfkpaCyAif10vY2NLzElT8H9hcz96S44UT+WnEyM0=;
        b=iaCXF0h6nctMXzjW6C/2zwMehfzWOdLiGWzIx2k670SmO9H3UsTeBmXHjdtmwwtaf9
         kyiyQO4miJWLVKpHvUKl2VbhkifKj40xdf458jB4O3umXDGN+HJserTBeUzWXv8Kyhlr
         MrbuOqb3Or439agtZgwxXKJNKMZ93HuWQkhckmEvmFmw91IHy5Yf02p25tVTkRYW9l8s
         CogWCrPLEqhH3VI6dM7dDayJA+ZvaTeKKA3gcU2ioB3sDBMIkD0OCYWDNk9Lv0Vtd91T
         O+NigFKawkJtCqdcKRUmVj9QS9AwJOGDSzHLZW8Wzk5bzkIi4LAkfIRBOLgXMICNNGvI
         I2CQ==
X-Gm-Message-State: AOAM533u/k/UuVKQ0Ae7wZ4ly1srscHSp+SXhgT5TeVhneI/KSGOd5ac
	6FBvoF7+vrH+LwIWg6OKXDqWv6z933iKs9FMnnEGbvkuQl+bVIDO26zsJL5tBv8A1Zsm75MPpFr
	Ljvjnoz26xF1X1ffU
X-Received: by 2002:a17:907:d15:: with SMTP id gn21mr180979ejc.337.1615327700939;
        Tue, 09 Mar 2021 14:08:20 -0800 (PST)
X-Received: by 2002:a17:907:d15:: with SMTP id gn21mr180947ejc.337.1615327700754;
        Tue, 09 Mar 2021 14:08:20 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id u15sm10107092eds.6.2021.03.09.14.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 14:08:20 -0800 (PST)
Subject: Re: [PATCH 0/2] sysemu: Let VMChangeStateHandler take boolean
 'running' argument
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
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
 <84048681-32d3-7217-e94c-461501cf550b@redhat.com>
Message-ID: <3112233d-e227-b0c5-4a97-3ad0127a4d12@redhat.com>
Date: Tue, 9 Mar 2021 23:08:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <84048681-32d3-7217-e94c-461501cf550b@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: F1hboC/tjGB7

ping, qemu-trivial maybe?

On 2/22/21 3:34 PM, Philippe Mathieu-Daudé wrote:
> Paolo, this series is fully reviewed, can it go via your
> misc tree?
> 
> On 1/11/21 4:20 PM, Philippe Mathieu-Daudé wrote:
>> Trivial prototype change to clarify the use of the 'running'
>> argument of VMChangeStateHandler.
>>
>> Green CI:
>> https://gitlab.com/philmd/qemu/-/pipelines/239497352
>>
>> Philippe Mathieu-Daudé (2):
>>   sysemu/runstate: Let runstate_is_running() return bool
>>   sysemu: Let VMChangeStateHandler take boolean 'running' argument
>>
>>  include/sysemu/runstate.h   | 12 +++++++++---
>>  target/arm/kvm_arm.h        |  2 +-
>>  target/ppc/cpu-qom.h        |  2 +-
>>  accel/xen/xen-all.c         |  2 +-
>>  audio/audio.c               |  2 +-
>>  block/block-backend.c       |  2 +-
>>  gdbstub.c                   |  2 +-
>>  hw/block/pflash_cfi01.c     |  2 +-
>>  hw/block/virtio-blk.c       |  2 +-
>>  hw/display/qxl.c            |  2 +-
>>  hw/i386/kvm/clock.c         |  2 +-
>>  hw/i386/kvm/i8254.c         |  2 +-
>>  hw/i386/kvmvapic.c          |  2 +-
>>  hw/i386/xen/xen-hvm.c       |  2 +-
>>  hw/ide/core.c               |  2 +-
>>  hw/intc/arm_gicv3_its_kvm.c |  2 +-
>>  hw/intc/arm_gicv3_kvm.c     |  2 +-
>>  hw/intc/spapr_xive_kvm.c    |  2 +-
>>  hw/misc/mac_via.c           |  2 +-
>>  hw/net/e1000e_core.c        |  2 +-
>>  hw/nvram/spapr_nvram.c      |  2 +-
>>  hw/ppc/ppc.c                |  2 +-
>>  hw/ppc/ppc_booke.c          |  2 +-
>>  hw/s390x/tod-kvm.c          |  2 +-
>>  hw/scsi/scsi-bus.c          |  2 +-
>>  hw/usb/hcd-ehci.c           |  2 +-
>>  hw/usb/host-libusb.c        |  2 +-
>>  hw/usb/redirect.c           |  2 +-
>>  hw/vfio/migration.c         |  2 +-
>>  hw/virtio/virtio-rng.c      |  2 +-
>>  hw/virtio/virtio.c          |  2 +-
>>  net/net.c                   |  2 +-
>>  softmmu/memory.c            |  2 +-
>>  softmmu/runstate.c          |  4 ++--
>>  target/arm/kvm.c            |  2 +-
>>  target/i386/kvm/kvm.c       |  2 +-
>>  target/i386/sev.c           |  2 +-
>>  target/i386/whpx/whpx-all.c |  2 +-
>>  target/mips/kvm.c           |  4 ++--
>>  ui/gtk.c                    |  2 +-
>>  ui/spice-core.c             |  2 +-
>>  41 files changed, 51 insertions(+), 45 deletions(-)
>>
> 
