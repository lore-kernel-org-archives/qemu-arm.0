Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp37472ejb;
        Mon, 13 Mar 2023 01:37:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set+5BrHM7vvL4vdINGsf0B0wwPzs714Xpm5SdonXpYlB4eEc007e45HDCd2OB1BrfpvGzJgP
X-Received: by 2002:ac8:5c82:0:b0:3bd:ad1:49c with SMTP id r2-20020ac85c82000000b003bd0ad1049cmr51521756qta.24.1678696619886;
        Mon, 13 Mar 2023 01:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678696619; cv=none;
        d=google.com; s=arc-20160816;
        b=vxiw2gh00DKK9oAIl6xFO9UJ6u8tkreLGVw7CIvptKEp7Epmegr33b9WQHM+f5OerF
         HML1YJZYgTkB4ffq3KL9YRRxKrGwnPHj7mlqT0op4Rgcqhw3AiuB2Vu0tnzB9ibl54oO
         o4T5AnDbDIqtcLjhKHuJnvR9oXRf/doAz1+HCbY5VrKhSsvxNgBmhL2bQku1xRY2KUcX
         hClik+EC2o/ulVjTrlmxeHRTLO+xoN5urYlkGae38VJb13/PZL/jN4E8GME/7dHtshoq
         8dY9XelfOx2I7QV4/emCkKa1EjtIzMP0cykuraciwWVTQw1taPzIc/eY7P3NctHgFAKW
         IKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OWt5vj9MMwXb4l9+uwottEsS1Nl//OGUSfQKqU3untY=;
        b=sPo7ZJjsn612E8+h2jbrD9bkw3hx6PYav75ySH7eHzo+56ahnbjOTenxbjYEGMbIhJ
         4GJBdtmi0aEiB9Sr+p9biVExKCF3ozhoKPlmt0EzVDuS07XCyz/9chOOfgqV3Jf8hKrv
         YfIBXscwXAXoHFhcu/Tmy8pYnwrmAwQlG+G5oFd0TsyoLJDYVYkhTROZv0HOaFr3YWqY
         ObOu+a5xy8TTJG3FFY3Rk52hRTeG09zfR5xK8PE7Zrn/6zVjj0gNjFIStBcNCT8+YP/4
         xlQVknny/KJJ22zgQjdZ5XdFtdmlbkjqJruQsO3s0FeaN1VhlCtTF6YB3deQkUQEnF8Z
         +oqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X47CRGb3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19-20020ac85b93000000b003bce157319fsi4921555qta.524.2023.03.13.01.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Mar 2023 01:36:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X47CRGb3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pbdfY-0007fn-1s; Mon, 13 Mar 2023 04:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbdfW-0007ec-29
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 04:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbdfN-0002Uu-Mc
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 04:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678696584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWt5vj9MMwXb4l9+uwottEsS1Nl//OGUSfQKqU3untY=;
 b=X47CRGb3XaA3Y2sMQ1kWSGAXypOVI0TlgZ58jKdkALmWS35gVuImYuIwjxDw8i2U4uujmK
 qLCMJkxu4/K8OgX8cZ1n48mOqZKFzOTTHHV9Vz28UxXJhvGXsHlqx7KSWoqYASML+yiJhV
 qXMM/96fxz6rR7gjcz2lF+Xa60fpXoA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-JhTnP6vOMj29HT9MozV9pA-1; Mon, 13 Mar 2023 04:36:23 -0400
X-MC-Unique: JhTnP6vOMj29HT9MozV9pA-1
Received: by mail-wr1-f71.google.com with SMTP id
 o15-20020a05600002cf00b002c54a27803cso1927467wry.22
 for <qemu-arm@nongnu.org>; Mon, 13 Mar 2023 01:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678696582;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OWt5vj9MMwXb4l9+uwottEsS1Nl//OGUSfQKqU3untY=;
 b=mC3ZjCygWSFzqgRwYhRpkn6zH1clvmM+gpk2Cc8RSaVWyRv/Q2ZGhtl/PVqIuqH8Jt
 pdh70E5ZkhHfe6PeQ8fn1zmXm+zTzD4I9W3N/1IFqocMt05+3MviTEwSQUwsNiA0RFzZ
 4LNCXfLZrspnKHkyaxDPc+57AqSgwKmt78pxWKPg7pXTcvM2YO2zCgXpNKOz9Oq8Snl9
 K2Doh4F9/YcUprWhhh4x1xKc3htpem7EMw6+DPjabiI8hagwmh7EqhM/VgJmBpcguTX1
 5rCRhV8tnPcHm1SoWIliIj4LIgSBpg8Abs7bYq2RJJFqAyPG5iCe1Sa2ismq4eM9JWQK
 88aw==
X-Gm-Message-State: AO0yUKU4dELloetGV3mdrT6R+rLva8668vSksFWmKEUtnOnrggEl53O/
 odqYpaLC0IUF3nMWdkOwrcPH4Nx+oU2RhOV1pQAGLV1yvloiVnYJIaCiIsck7x1FLjxJPKCp8BX
 bx8LXRX5aUc+0
X-Received: by 2002:a5d:6504:0:b0:2ce:39d3:c9a5 with SMTP id
 x4-20020a5d6504000000b002ce39d3c9a5mr21946651wru.22.1678696582374; 
 Mon, 13 Mar 2023 01:36:22 -0700 (PDT)
X-Received: by 2002:a5d:6504:0:b0:2ce:39d3:c9a5 with SMTP id
 x4-20020a5d6504000000b002ce39d3c9a5mr21946635wru.22.1678696582103; 
 Mon, 13 Mar 2023 01:36:22 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de.
 [109.43.179.26]) by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b002ceaeb4b608sm3160170wrj.34.2023.03.13.01.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:36:21 -0700 (PDT)
Message-ID: <18ea04ff-4ebf-b163-0dcf-f0b8e966bda4@redhat.com>
Date: Mon, 13 Mar 2023 09:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 4/6] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Amit Shah <amit@kernel.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>,
 "open list:New World (mac99)" <qemu-ppc@nongnu.org>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <20230313082417.827484-5-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230313082417.827484-5-alxndr@bu.edu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yEa/b6x5kXqn

On 13/03/2023 09.24, Alexander Bulekov wrote:
> This protects devices from bh->mmio reentrancy issues.
> 
> Thanks: Thomas Huth <thuth@redhat.com> for diagnosing OS X test failure.
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   hw/9pfs/xen-9p-backend.c        | 5 ++++-
>   hw/block/dataplane/virtio-blk.c | 3 ++-
>   hw/block/dataplane/xen-block.c  | 5 +++--
>   hw/char/virtio-serial-bus.c     | 3 ++-
>   hw/display/qxl.c                | 9 ++++++---
>   hw/display/virtio-gpu.c         | 6 ++++--
>   hw/ide/ahci.c                   | 3 ++-
>   hw/ide/ahci_internal.h          | 1 +
>   hw/ide/core.c                   | 4 +++-
>   hw/misc/imx_rngc.c              | 6 ++++--
>   hw/misc/macio/mac_dbdma.c       | 2 +-
>   hw/net/virtio-net.c             | 3 ++-
>   hw/nvme/ctrl.c                  | 6 ++++--
>   hw/scsi/mptsas.c                | 3 ++-
>   hw/scsi/scsi-bus.c              | 3 ++-
>   hw/scsi/vmw_pvscsi.c            | 3 ++-
>   hw/usb/dev-uas.c                | 3 ++-
>   hw/usb/hcd-dwc2.c               | 3 ++-
>   hw/usb/hcd-ehci.c               | 3 ++-
>   hw/usb/hcd-uhci.c               | 2 +-
>   hw/usb/host-libusb.c            | 6 ++++--
>   hw/usb/redirect.c               | 6 ++++--
>   hw/usb/xen-usb.c                | 3 ++-
>   hw/virtio/virtio-balloon.c      | 5 +++--
>   hw/virtio/virtio-crypto.c       | 3 ++-
>   25 files changed, 66 insertions(+), 33 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

