Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2114033njb;
        Mon, 7 Oct 2024 11:10:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxh1Y+/g6AM+LzHt25855RbvLlIleEQaE+3pxja26QvXu7DrvBl77IPoSsXzarjA3kDcmVj5DiWmRbKg==@linaro.org
X-Google-Smtp-Source: AGHT+IEctg0cj134gbfMWVHRDNkycFAm8Lk5LK91s32aNowze3XdVmA1Ty8nPFp/WeoBfWmELMHG
X-Received: by 2002:a05:6122:4692:b0:507:85d0:5e07 with SMTP id 71dfb90a1353d-50c8547b7d0mr7403834e0c.4.1728324646016;
        Mon, 07 Oct 2024 11:10:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728324646; cv=none;
        d=google.com; s=arc-20240605;
        b=BA2bUmAy56xzlPFzg+xeSGaaREEkqPXSi6JmO2QB/KOiyC1TkKKGMOVUPo8jdHtIxr
         MdQk+q1Xh/3XjqVAlDz1aWtdeqcIuUvm9fkbRYeTvPsltg2vA0DsX2hJa/D/ZDvjEW0/
         A0QH33VtLdwRvFRBp30ZZ+9v0f2sj/ZagXkzdKG7DxDcXn5+rwQq9naZJdxatUlumJAL
         9eVGB9jy0dV9OHL3HX8MyfbxShQetA1wTiDNOinOUtjQVjwdJxl4AXUMafxCKSe+Wyc2
         xBDHVzy2WHhyhCTUEI2tDmwsRtKHR6bYTZ9OfjV+p2IE7o/0bq4eWORSt8/hHjam9yVC
         T7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1eSj5QpMbZ5rnpsfhdlZwiyWuJYWZjnW4leXEyjomRw=;
        fh=auXJC/tKo0NauS2eLp45DCrbtD6pqWmgEGswo+uIlZk=;
        b=bF4AVbGltQJs+j4d/l/JMJK8cWIduKUS/7+No1/cSrOF7JNTbiMiGzLbUS+tmFwApX
         RTe9LEX2XsxJLuj+TZnkhgUWwBcL8RUl7dpCs2kvDECoR/i+zK8KR+p8Z/reXUHWR5r4
         s3CG5EEwtH5TnEtQed0dEb4KsMjFR9A7d/cFYQInCe1HEE0sHBfFaC0A7WSYkWYZpGbH
         Sm7JLZXoO6LwAZgD30NGyGSk6TBNw/wSurz9MWSI4cEBK2lSaVG5SToCIiqBq5t3THf6
         wOEpDMbmEcObBlQAdieE0JhgB8kybIFU/NZKSOUQdEyW85fHIMCN6PqhqwonEMngfyFE
         jE6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=05CZlkv2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a412daba14si1033893137.20.2024.10.07.11.10.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 11:10:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=05CZlkv2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxsBp-0000mO-Qu; Mon, 07 Oct 2024 14:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1sxsBh-0000lZ-HD
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 14:10:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1sxsBd-0002vc-0x
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 14:10:29 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2e0946f9a8eso3229855a91.1
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728324622; x=1728929422;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1eSj5QpMbZ5rnpsfhdlZwiyWuJYWZjnW4leXEyjomRw=;
 b=05CZlkv2igqxSI8i4C605Kdmc4SoduJUfYmzIcKFbSvjbz8McL45Qa8g7ET6fzLuTz
 SCLmBOyZEWvVI8ueooX9NSAJIv6OKuZ5n+I5DQoR/qxo6/vncZ3rAG3AwGMnq2+PPmGB
 F7Nw1n/opyPG2zA18mzbDateNdcllJYAMMF9xxq5oi8FKmo4adS8fQFTMy2WbDSJ8FVw
 bxXXknTuxlqM/5sX6FEHog6581sSml7das++lZMD+eUFslz6ylBq4OUR72ot0w9/M03u
 aYEjwEQzeU1IozWXTuBz8ZcmgUkaYo6G4K8PuqKP4GkY9byArMW5REEU1bYha1dxzKXk
 SZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728324622; x=1728929422;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1eSj5QpMbZ5rnpsfhdlZwiyWuJYWZjnW4leXEyjomRw=;
 b=LyCtO1hK8DzPXEHlvmbxv43yV+kl/UfCSpu69FdKOKl8PTc3g2eojFmLcFHGgridCw
 O9pIc6FTemL3/sg3iD4l8v2lZc07h47TBllmgyXq/mfFkzpR+eQpWuX1uR82yxXkVYEx
 qLSVOVBfxWc4GuCnxIGWk0otFYjXGaKPCMWOGkWxGzUUw//F0bNN9LYIuODJ3CeKk7P+
 O5UXWRJjKDXFQ+MKIdZFaU75FuTEb8lFSC0IKhmsLXhmh5bIEnqkSiGwWJ0klzcnNWVS
 eXiqvb0JPjymqBa9pWXH/p5zp57Vxp69YO2M0yUleUj8z0t2cdI3gNevoyfAQfL02kn0
 gIRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2NL6NiDNPPIeeN+76azg8sTFS58sas6ZWWwCqT26KT2ECHxlfYSVwT1NX3M9Ht69WNl9AEFEr9w==@nongnu.org
X-Gm-Message-State: AOJu0YxwoJQ8kQ0mSiIjiFtt+tZrKL8erIbV8k5rvQBfWC+bjLc3HnLV
 eUZIHi5ZMHLkQPXb+KUIv5gOkWS/B8sA6Lt6IB5vWSMhHqirCLDIB2vtYqoJh7A=
X-Received: by 2002:a17:90b:1644:b0:2c9:a3ca:cc98 with SMTP id
 98e67ed59e1d1-2e1e620ead0mr14130251a91.7.1728324622066; 
 Mon, 07 Oct 2024 11:10:22 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:32ed:25ae:21b1:72d6?
 ([2400:4050:a840:1e00:32ed:25ae:21b1:72d6])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e20ae6dfa4sm5732237a91.2.2024.10.07.11.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 11:10:21 -0700 (PDT)
Message-ID: <56369946-06ac-4b0f-b9aa-8e05be835858@daynix.com>
Date: Tue, 8 Oct 2024 03:10:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] hw/vmapple/virtio-blk: Add support for apple
 virtio-blk
To: Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20240928085727.56883-1-phil@philjordan.eu>
 <20240928085727.56883-14-phil@philjordan.eu>
 <053c9224-6940-472a-8c62-276961b75935@daynix.com>
 <CAAibmn3q9ZxEHBiT8gLDWbSnFmZ4Z+gy3XphC0yAWj99ie+j9g@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAAibmn3q9ZxEHBiT8gLDWbSnFmZ4Z+gy3XphC0yAWj99ie+j9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Sq+0Q5LTJQXI

On 2024/10/07 23:31, Phil Dennis-Jordan wrote:
> 
> On Sat, 5 Oct 2024 at 07:47, Akihiko Odaki <akihiko.odaki@daynix.com 
> <mailto:akihiko.odaki@daynix.com>> wrote:
> 
>     On 2024/09/28 17:57, Phil Dennis-Jordan wrote:
>      > From: Alexander Graf <graf@amazon.com <mailto:graf@amazon.com>>
>      >
>      > Apple has its own virtio-blk PCI device ID where it deviates from the
>      > official virtio-pci spec slightly: It puts a new "apple type"
>      > field at a static offset in config space and introduces a new barrier
>      > command.
>      >
>      > This patch first creates a mechanism for virtio-blk downstream
>     classes to
>      > handle unknown commands. It then creates such a downstream class
>     and a new
>      > vmapple-virtio-blk-pci class which support the additional apple
>     type config
>      > identifier as well as the barrier command.
>      >
>      > It then exposes 2 subclasses from that that we can use to expose
>     root and
>      > aux virtio-blk devices: "vmapple-virtio-root" and "vmapple-
>     virtio-aux".
>      >
>      > Signed-off-by: Alexander Graf <graf@amazon.com
>     <mailto:graf@amazon.com>>
>      > Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu
>     <mailto:phil@philjordan.eu>>
>      > ---
>      >   hw/block/virtio-blk.c           |  19 ++-
>      >   hw/vmapple/Kconfig              |   3 +
>      >   hw/vmapple/meson.build          |   1 +
>      >   hw/vmapple/virtio-blk.c         | 212 +++++++++++++++++++++++++
>     +++++++
>      >   include/hw/pci/pci_ids.h        |   1 +
>      >   include/hw/virtio/virtio-blk.h  |  12 +-
>      >   include/hw/vmapple/virtio-blk.h |  39 ++++++
>      >   7 files changed, 282 insertions(+), 5 deletions(-)
>      >   create mode 100644 hw/vmapple/virtio-blk.c
>      >   create mode 100644 include/hw/vmapple/virtio-blk.h
>      >
>      > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
>      > index 115795392c4..cecc4cef9e4 100644
>      > --- a/hw/block/virtio-blk.c
>      > +++ b/hw/block/virtio-blk.c
>      > @@ -50,12 +50,12 @@ static void
>     virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
>      >       req->mr_next = NULL;
>      >   }
>      >
>      > -static void virtio_blk_free_request(VirtIOBlockReq *req)
>      > +void virtio_blk_free_request(VirtIOBlockReq *req)
>      >   {
>      >       g_free(req);
>      >   }
> 
>     This function is identical with g_free(). Perhaps it's better to remove
>     it instead of updating it.
> 
> 
> I'm not sure that's something I should be doing in such a tangential 
> patch series, and it's very much a matter of taste - other operations on 
> VirtIOBlockReq have similar, consistent naming, and this function 
> seemingly hasn't been touched for 7 years.

It is not really consistent when it comes to memory allocation. It 
simply uses virtqueue_pop() or qemu_get_virtqueue_element() without 
function wrappers to get VirtIOBlockReq allocated. It shouldn't be 
necessary for deallocation either.

git blame reveals virtio_blk_free_request() used to be more complex. 
It's more likely that just nobody had a need to remove this function.

> 
> Perhaps virtio-blk maintainer Stefan Hajnoczi could weigh in? (tagged in 
> To:)
> 
> 
>      > -static void virtio_blk_req_complete(VirtIOBlockReq *req,
>     unsigned char status)
>      > +void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char
>     status)
>      >   {
>      >       VirtIOBlock *s = req->dev;
>      >       VirtIODevice *vdev = VIRTIO_DEVICE(s);
>      > @@ -966,8 +966,18 @@ static int
>     virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
>      >           break;
>      >       }
>      >       default:
>      > -        virtio_blk_req_complete(req, VIRTIO_BLK_S_UNSUPP);
>      > -        virtio_blk_free_request(req);
>      > +    {
>      > +        /*
>      > +         * Give subclasses a chance to handle unknown requests.
>     This way the
>      > +         * class lookup is not in the hot path.
>      > +         */
>      > +        VirtIOBlkClass *vbk = VIRTIO_BLK_GET_CLASS(s);
>      > +        if (!vbk->handle_unknown_request ||
>      > +            !vbk->handle_unknown_request(req, mrb, type)) {
>      > +            virtio_blk_req_complete(req, VIRTIO_BLK_S_UNSUPP);
>      > +            virtio_blk_free_request(req);
>      > +        }
>      > +    }
>      >       }
>      >       return 0;
>      >   }
>      > @@ -2044,6 +2054,7 @@ static const TypeInfo virtio_blk_info = {
>      >       .instance_size = sizeof(VirtIOBlock),
>      >       .instance_init = virtio_blk_instance_init,
>      >       .class_init = virtio_blk_class_init,
>      > +    .class_size = sizeof(VirtIOBlkClass),
>      >   };
>      >
>      >   static void virtio_register_types(void)
>      > diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
>      > index 8bbeb9a9237..bcd1be63e3c 100644
>      > --- a/hw/vmapple/Kconfig
>      > +++ b/hw/vmapple/Kconfig
>      > @@ -7,3 +7,6 @@ config VMAPPLE_BDIF
>      >   config VMAPPLE_CFG
>      >       bool
>      >
>      > +config VMAPPLE_VIRTIO_BLK
>      > +    bool
>      > +
>      > diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
>      > index 64b78693a31..bf17cf906c9 100644
>      > --- a/hw/vmapple/meson.build
>      > +++ b/hw/vmapple/meson.build
>      > @@ -1,3 +1,4 @@
>      >   system_ss.add(when: 'CONFIG_VMAPPLE_AES',  if_true: files('aes.c'))
>      >   system_ss.add(when: 'CONFIG_VMAPPLE_BDIF', if_true:
>     files('bdif.c'))
>      >   system_ss.add(when: 'CONFIG_VMAPPLE_CFG',  if_true: files('cfg.c'))
>      > +system_ss.add(when: 'CONFIG_VMAPPLE_VIRTIO_BLK',  if_true:
>     files('virtio-blk.c'))
>      > diff --git a/hw/vmapple/virtio-blk.c b/hw/vmapple/virtio-blk.c
>      > new file mode 100644
>      > index 00000000000..720eaa61a86
>      > --- /dev/null
>      > +++ b/hw/vmapple/virtio-blk.c
>      > @@ -0,0 +1,212 @@
>      > +/*
>      > + * VMApple specific VirtIO Block implementation
>      > + *
>      > + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All
>     Rights Reserved.
>      > + *
>      > + * This work is licensed under the terms of the GNU GPL, version
>     2 or later.
>      > + * See the COPYING file in the top-level directory.
>      > + *
>      > + * VMApple uses almost standard VirtIO Block, but with a few key
>     differences:
>      > + *
>      > + *  - Different PCI device/vendor ID
>      > + *  - An additional "type" identifier to differentiate AUX and
>     Root volumes
>      > + *  - An additional BARRIER command
>      > + */
>      > +
>      > +#include "qemu/osdep.h"
>      > +#include "hw/vmapple/virtio-blk.h"
>      > +#include "qemu/log.h"
>      > +#include "qemu/module.h"
>      > +#include "qapi/error.h"
>      > +
>      > +#define VIRTIO_BLK_T_APPLE_BARRIER     0x10000
>      > +
>      > +#define VIRTIO_APPLE_TYPE_ROOT 1
>      > +#define VIRTIO_APPLE_TYPE_AUX  2
>      > +
>      > +static bool
>     vmapple_virtio_blk_handle_unknown_request(VirtIOBlockReq *req,
>      > +                                                     
>     MultiReqBuffer *mrb,
>      > +                                                      uint32_t type)
>      > +{
>      > +    switch (type) {
>      > +    case VIRTIO_BLK_T_APPLE_BARRIER:
>      > +        /* We ignore barriers for now. YOLO. */
> 
>     It should be LOG_UNIMP instead of a mere comment.
> 
> 
> Fixed in next patch version.
> 
>      > +        virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
>      > +        virtio_blk_free_request(req);
>      > +        return true;
>      > +    default:
>      > +        return false;
>      > +    }
>      > +}
>      > +
>      > +/*
>      > + * VMApple virtio-blk uses the same config format as normal
>     virtio, with one
>      > + * exception: It adds an "apple type" specififer at the same
>     location that
>      > + * the spec reserves for max_secure_erase_sectors. Let's hook
>     into the
>      > + * get_config code path here, run it as usual and then patch in
>     the apple type.
>      > + */
>      > +static void vmapple_virtio_blk_get_config(VirtIODevice *vdev,
>     uint8_t *config)
>      > +{
>      > +    VMAppleVirtIOBlk *dev = VMAPPLE_VIRTIO_BLK(vdev);
>      > +    VMAppleVirtIOBlkClass *vvbk = VMAPPLE_VIRTIO_BLK_GET_CLASS(dev);
>      > +    struct virtio_blk_config *blkcfg = (struct virtio_blk_config
>     *)config;
>      > +
>      > +    vvbk->get_config(vdev, config);
>      > +
>      > +    g_assert(dev->parent_obj.config_size >= endof(struct
>     virtio_blk_config, zoned));
>      > +
>      > +    /* Apple abuses the field for max_secure_erase_sectors as
>     type id */
>      > +    blkcfg->max_secure_erase_sectors = dev->apple_type;
>      > +}
>      > +
>      > +static Property vmapple_virtio_blk_properties[] = {
>      > +    DEFINE_PROP_UINT32("apple-type", VMAppleVirtIOBlk,
>     apple_type, 0),
>      > +    DEFINE_PROP_END_OF_LIST(),
>      > +};
>      > +
>      > +static void vmapple_virtio_blk_class_init(ObjectClass *klass,
>     void *data)
>      > +{
>      > +    DeviceClass *dc = DEVICE_CLASS(klass);
>      > +    VirtIOBlkClass *vbk = VIRTIO_BLK_CLASS(klass);
>      > +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
>      > +    VMAppleVirtIOBlkClass *vvbk = VMAPPLE_VIRTIO_BLK_CLASS(klass);
>      > +
>      > +    vbk->handle_unknown_request =
>     vmapple_virtio_blk_handle_unknown_request;
>      > +    vvbk->get_config = vdc->get_config;
>      > +    vdc->get_config = vmapple_virtio_blk_get_config;
>      > +    device_class_set_props(dc, vmapple_virtio_blk_properties);
>      > +}
>      > +
>      > +static const TypeInfo vmapple_virtio_blk_info = {
>      > +    .name          = TYPE_VMAPPLE_VIRTIO_BLK,
>      > +    .parent        = TYPE_VIRTIO_BLK,
>      > +    .instance_size = sizeof(VMAppleVirtIOBlk),
>      > +    .class_init    = vmapple_virtio_blk_class_init,
>      > +};
>      > +
>      > +/* PCI Devices */
>      > +
>      > +typedef struct VMAppleVirtIOBlkPCI {
>      > +    VirtIOPCIProxy parent_obj;
>      > +    VMAppleVirtIOBlk vdev;
>      > +    uint32_t apple_type;
>      > +} VMAppleVirtIOBlkPCI;
>      > +
>      > +/*
>      > + * vmapple-virtio-blk-pci: This extends VirtioPCIProxy.
>      > + */
>      > +#define TYPE_VMAPPLE_VIRTIO_BLK_PCI "vmapple-virtio-blk-pci-base"
>      > +DECLARE_INSTANCE_CHECKER(VMAppleVirtIOBlkPCI,
>     VMAPPLE_VIRTIO_BLK_PCI,
>      > +                         TYPE_VMAPPLE_VIRTIO_BLK_PCI)
>      > +
>      > +static Property vmapple_virtio_blk_pci_properties[] = {
>      > +    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
>      > +    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
>      > +                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
>      > +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
>      > +                       DEV_NVECTORS_UNSPECIFIED),
>      > +    DEFINE_PROP_END_OF_LIST(),
>      > +};
>      > +
>      > +static void vmapple_virtio_blk_pci_realize(VirtIOPCIProxy
>     *vpci_dev, Error **errp)
>      > +{
>      > +    VMAppleVirtIOBlkPCI *dev = VMAPPLE_VIRTIO_BLK_PCI(vpci_dev);
>      > +    DeviceState *vdev = DEVICE(&dev->vdev);
>      > +    VirtIOBlkConf *conf = &dev->vdev.parent_obj.conf;
>      > +
>      > +    if (conf->num_queues == VIRTIO_BLK_AUTO_NUM_QUEUES) {
>      > +        conf->num_queues = virtio_pci_optimal_num_queues(0);
>      > +    }
>      > +
>      > +    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
>      > +        vpci_dev->nvectors = conf->num_queues + 1;
>      > +    }
>      > +
>      > +    /*
>      > +     * We don't support zones, but we need the additional config
>     space size.
>      > +     * Let's just expose the feature so the rest of the virtio-
>     blk logic
>      > +     * allocates enough space for us. The guest will ignore
>     zones anyway.
>      > +     */
>      > +    virtio_add_feature(&dev->vdev.parent_obj.host_features,
>     VIRTIO_BLK_F_ZONED);
>      > +    /* Propagate the apple type down to the virtio-blk device */
>      > +    qdev_prop_set_uint32(DEVICE(&dev->vdev), "apple-type", dev-
>      >apple_type);
>      > +    /* and spawn the virtio-blk device */
>      > +    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>      > +
>      > +    /*
>      > +     * The virtio-pci machinery adjusts its vendor/device ID
>     based on whether
>      > +     * we support modern or legacy virtio. Let's patch it back
>     to the Apple
>      > +     * identifiers here.
>      > +     */
>      > +    pci_config_set_vendor_id(vpci_dev->pci_dev.config,
>     PCI_VENDOR_ID_APPLE);
>      > +    pci_config_set_device_id(vpci_dev->pci_dev.config,
>     PCI_DEVICE_ID_APPLE_VIRTIO_BLK);
>      > +}
>      > +
>      > +static void vmapple_virtio_blk_pci_class_init(ObjectClass
>     *klass, void *data)
>      > +{
>      > +    DeviceClass *dc = DEVICE_CLASS(klass);
>      > +    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
>      > +    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
>      > +
>      > +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>      > +    device_class_set_props(dc, vmapple_virtio_blk_pci_properties);
>      > +    k->realize = vmapple_virtio_blk_pci_realize;
>      > +    pcidev_k->vendor_id = PCI_VENDOR_ID_APPLE;
>      > +    pcidev_k->device_id = PCI_DEVICE_ID_APPLE_VIRTIO_BLK;
>      > +    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
>      > +    pcidev_k->class_id = PCI_CLASS_STORAGE_SCSI;
>      > +}
>      > +
>      > +static void vmapple_virtio_blk_pci_instance_init(Object *obj)
>      > +{
>      > +    VMAppleVirtIOBlkPCI *dev = VMAPPLE_VIRTIO_BLK_PCI(obj);
>      > +
>      > +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
>      > +                                TYPE_VMAPPLE_VIRTIO_BLK);
>      > +}
>      > +
>      > +static const VirtioPCIDeviceTypeInfo vmapple_virtio_blk_pci_info = {
>      > +    .base_name     = TYPE_VMAPPLE_VIRTIO_BLK_PCI,
>      > +    .generic_name  = "vmapple-virtio-blk-pci",
>      > +    .instance_size = sizeof(VMAppleVirtIOBlkPCI),
>      > +    .instance_init = vmapple_virtio_blk_pci_instance_init,
>      > +    .class_init    = vmapple_virtio_blk_pci_class_init,
>      > +};
>      > +
>      > +static void vmapple_virtio_root_instance_init(Object *obj)
>      > +{
>      > +    VMAppleVirtIOBlkPCI *dev = VMAPPLE_VIRTIO_BLK_PCI(obj);
>      > +
>      > +    dev->apple_type = VIRTIO_APPLE_TYPE_ROOT;
>      > +}
>      > +
>      > +static const TypeInfo vmapple_virtio_root_info = {
>      > +    .name          = TYPE_VMAPPLE_VIRTIO_ROOT,
>      > +    .parent        = "vmapple-virtio-blk-pci",
>      > +    .instance_size = sizeof(VMAppleVirtIOBlkPCI),
>      > +    .instance_init = vmapple_virtio_root_instance_init,
>      > +};
>      > +
>      > +static void vmapple_virtio_aux_instance_init(Object *obj)
>      > +{
>      > +    VMAppleVirtIOBlkPCI *dev = VMAPPLE_VIRTIO_BLK_PCI(obj);
>      > +
>      > +    dev->apple_type = VIRTIO_APPLE_TYPE_AUX;
>      > +}
>      > +
>      > +static const TypeInfo vmapple_virtio_aux_info = {
>      > +    .name          = TYPE_VMAPPLE_VIRTIO_AUX,
>      > +    .parent        = "vmapple-virtio-blk-pci",
>      > +    .instance_size = sizeof(VMAppleVirtIOBlkPCI),
>      > +    .instance_init = vmapple_virtio_aux_instance_init,
>      > +};
>      > +
>      > +static void vmapple_virtio_blk_register_types(void)
>      > +{
>      > +    type_register_static(&vmapple_virtio_blk_info);
>      > +    virtio_pci_types_register(&vmapple_virtio_blk_pci_info);
>      > +    type_register_static(&vmapple_virtio_root_info);
>      > +    type_register_static(&vmapple_virtio_aux_info);
>      > +}
>      > +
>      > +type_init(vmapple_virtio_blk_register_types)
>      > diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
>      > index f1a53fea8d6..33e2898be95 100644
>      > --- a/include/hw/pci/pci_ids.h
>      > +++ b/include/hw/pci/pci_ids.h
>      > @@ -191,6 +191,7 @@
>      >   #define PCI_DEVICE_ID_APPLE_UNI_N_AGP    0x0020
>      >   #define PCI_DEVICE_ID_APPLE_U3_AGP       0x004b
>      >   #define PCI_DEVICE_ID_APPLE_UNI_N_GMAC   0x0021
>      > +#define PCI_DEVICE_ID_APPLE_VIRTIO_BLK   0x1a00
>      >
>      >   #define PCI_VENDOR_ID_SUN                0x108e
>      >   #define PCI_DEVICE_ID_SUN_EBUS           0x1000
>      > diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/
>     virtio-blk.h
>      > index 5c14110c4b1..28d5046ea6c 100644
>      > --- a/include/hw/virtio/virtio-blk.h
>      > +++ b/include/hw/virtio/virtio-blk.h
>      > @@ -24,7 +24,7 @@
>      >   #include "qapi/qapi-types-virtio.h"
>      >
>      >   #define TYPE_VIRTIO_BLK "virtio-blk-device"
>      > -OBJECT_DECLARE_SIMPLE_TYPE(VirtIOBlock, VIRTIO_BLK)
>      > +OBJECT_DECLARE_TYPE(VirtIOBlock, VirtIOBlkClass, VIRTIO_BLK)
>      >
>      >   /* This is the last element of the write scatter-gather list */
>      >   struct virtio_blk_inhdr
>      > @@ -100,6 +100,16 @@ typedef struct MultiReqBuffer {
>      >       bool is_write;
>      >   } MultiReqBuffer;
>      >
>      > +typedef struct VirtIOBlkClass {
>      > +    /*< private >*/
>      > +    VirtioDeviceClass parent;
>      > +    /*< public >*/
>      > +    bool (*handle_unknown_request)(VirtIOBlockReq *req,
>     MultiReqBuffer *mrb,
>      > +                                   uint32_t type);
>      > +} VirtIOBlkClass;
>      > +
>      >   void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
>      > +void virtio_blk_free_request(VirtIOBlockReq *req);
>      > +void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char
>     status);
>      >
>      >   #endif
>      > diff --git a/include/hw/vmapple/virtio-blk.h b/include/hw/
>     vmapple/virtio-blk.h
>      > new file mode 100644
>      > index 00000000000..b23106a3dfb
>      > --- /dev/null
>      > +++ b/include/hw/vmapple/virtio-blk.h
>      > @@ -0,0 +1,39 @@
>      > +/*
>      > + * VMApple specific VirtIO Block implementation
>      > + *
>      > + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All
>     Rights Reserved.
>      > + *
>      > + * This work is licensed under the terms of the GNU GPL, version
>     2 or later.
>      > + * See the COPYING file in the top-level directory.
>      > + */
>      > +
>      > +#ifndef HW_VMAPPLE_CFG_H
>      > +#define HW_VMAPPLE_CFG_H
>      > +
>      > +#include "hw/sysbus.h"
>      > +#include "qom/object.h"
>      > +#include "hw/virtio/virtio-pci.h"
>      > +#include "hw/virtio/virtio-blk.h"
>      > +
>      > +#define TYPE_VMAPPLE_VIRTIO_BLK "vmapple-virtio-blk"
>      > +#define TYPE_VMAPPLE_VIRTIO_ROOT "vmapple-virtio-root"
>      > +#define TYPE_VMAPPLE_VIRTIO_AUX "vmapple-virtio-aux"
>      > +
>      > +OBJECT_DECLARE_TYPE(VMAppleVirtIOBlk, VMAppleVirtIOBlkClass,
>     VMAPPLE_VIRTIO_BLK)
>      > +
>      > +typedef struct VMAppleVirtIOBlkClass {
>      > +    /*< private >*/
>      > +    VirtIOBlkClass parent;
>      > +    /*< public >*/
>      > +    void (*get_config)(VirtIODevice *vdev, uint8_t *config);
>      > +} VMAppleVirtIOBlkClass;
>      > +
>      > +typedef struct VMAppleVirtIOBlk {
>      > +    /* <private> */
>      > +    VirtIOBlock parent_obj;
>      > +
>      > +    /* <public> */
>      > +    uint32_t apple_type;
>      > +} VMAppleVirtIOBlk;
>      > +
>      > +#endif /* HW_VMAPPLE_CFG_H */
> 

