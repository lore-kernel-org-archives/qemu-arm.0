Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA14CD98C7
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 16:54:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXifU-0001wx-AM; Thu, 11 Jun 2026 12:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wXifS-0001vX-1B
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 12:54:10 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wXifQ-0006m1-7H
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 12:54:09 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-6607e80a846so53656d50.2
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 09:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781196847; cv=none;
 d=google.com; s=arc-20240605;
 b=WvBbwWD/HCJe5u4h82qXDimNz4Ck2POhtY1+r/6qCv8kUz5rlN/XYwQ+5Unou7moFA
 eGDu3U8hu7Cf8lUlq0yjwR/VtYovVKCPz28qDgFEjVyZnlWwFB8uclIIoLN2wDcJvHl5
 vQmfZjNolNoGApCocvtmkVMM7Mp+rTjywKVLlYHsmCrZ91KDIiY1wfeAVZ5G6sNGCw7P
 c/iq11MlGgxotichgDwOg4evj+AEvk0J8VkJVYCF11QLoDzcnLLloUg/IYF+WIXB0qaE
 Od2guw1/zK+XkebC2dHtHl8bThK1RWgQlL4/TJSGwGXlM1gIIyIC40l0TbMutYXnpPzH
 aesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=QaqbYXHxzpGu3QvISyD4fmu8tEvOHjOFgehRi8Xo7QA=;
 fh=W/FoOUQfNkGqQHz0BcBg7wyvgaDDmtv7U1pXl3moN14=;
 b=KwNp+h+QcK7ajq4xfXm92h7bLEzCBV+ZdCudFd+9MHl4eGqCQGHjSNEzYzWsrQ6aY3
 tBP7U010F4tOUPIofqLIS9XEJeO3eBqkLDQ9HoJPXZix0/i33L3AbTCMxosA0Vwyq+z1
 jBFkDCI+ZeeGoUnvc4HP9AVKh/PXO+sqNN2F4OhXXCFfdmgMZt4ny7VbfhWRn+br9f9F
 wyvlvutwk7KzJuTXxWWKla11Yxu76Ca1nbfj/cJ84jWvwwZydFoOayO8O4CTvCaP64We
 ugl9ofAP12HKXJgLRD7CUiMwLEWZyncw3GKrYrrfgA031XCFVYGNSPv2/Q1WcQ+xCnlg
 wDYw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781196847; x=1781801647; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QaqbYXHxzpGu3QvISyD4fmu8tEvOHjOFgehRi8Xo7QA=;
 b=s2DFtvcgDQfglQKeic9d+tdwEZntrICk0NXcFjfYNWOgWraZGZhn+jPeVKsR0d4rSc
 MoSvxa7aeltfuRLS5QDyXNbTbqt9lrvHss4KONoADGAHWZFjtPmG53FaVRMmwGnNC+g5
 3QUglZewXj7eJMosICrn97FQeUCEGRnEdy0WumAWLQtJcNze1nkJ2S1JCN1I0T3mMSAS
 jcGy9qDbGWgw4J7oRy6qnUayZT6Rj+ldZHBkJCh/ESibuoaZl8X5alywYk0TguCP2vxL
 8huRd4uMkeOeU4P2N1sL/MuOXItYxb19daS51h6ctPrZgTr++6mcZjs9Tnk9yIoW5QF+
 iFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781196847; x=1781801647;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QaqbYXHxzpGu3QvISyD4fmu8tEvOHjOFgehRi8Xo7QA=;
 b=NH0lUNcG4dkhYlaPS/TtDEK7lbA0LbnZDswg7zQqXAGZ26ti48+YVKbCMdyts+hmKR
 aZAK5sfJYJavmxNi05GmrYGS3AmBsj6cViz0jqBqAVXkQq6RDeD2OEBmrgl2osXyNAFc
 SdcuhpGhV2vetZJIA3x6OPH249tR5cBagXStoLk/1/Lb4j5UnYLOo2bpVJqZspEzcIlK
 Qt+/B5KHeT5z89rSbRTyU0EpSc2d6bPujiC+zFMVBVaNrBlZxtX6Zhj0/nrnWNgh6urB
 eNSlFTJASYZ2/8hmKTGJq7iH3azCbcIXBYr/YTLY8nrV+quSMaal3f5Kczs3+xRajg+R
 ORjg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8gvoqPyCO5YxY3LI9GtTSTd+eAUUFRpoVJ6qsMD1Fo5kzH8KSINZuefntsVz6uHal7DEaLFzqfxg==@nongnu.org
X-Gm-Message-State: AOJu0YzlE4xagkur/W3Lkk28oy2yu0YfWPzgQJEAynwh2heKmLVIIrEi
 515RO4RLkN5x+08ZJAJ40Bsjd+helfmsmCCIH/DavIVYiPD5yTQ1RyPmEnOiej8glOUO+ep8jLS
 Q1sn0h9tohNmxTDx9GQd6ZasPOjQs0ZvCi4vxLrwt9Q==
X-Gm-Gg: Acq92OFArbR9+ltZgFK6fIvJleZx++8qGoKBP74uyjgUClh6G8Y2xT/ol3uMe/QXAzc
 KvKM2U1N6mowPp6IOUwutU8fwTMl+c1xeyAh6z8VC2PlxfjPzSY/obayzb0oNTlAcJEyCMdGxBZ
 UofeKQfIJLxPL99ZyA4pUJeaE1fGWN8Kok/m/M0Hy9Q8dSFgYvfbN8LfZPVXZBN9xs8mI35kyyb
 fvH+s96YfJNO7zbgcpltTe24YuT0iZkutLeJz81IZ28K5UwZ9YXfnf0AP0Bu0y7BXzc6c1FOMGT
 q0l1WRjSGvbWqfE4C/2h8wyc/QlkpKAJwy8r7Mm1u2PHb6u2VsDX9G6UyRABdLNHGfA=
X-Received: by 2002:a53:ac91:0:b0:662:5e4d:2bd1 with SMTP id
 956f58d0204a3-66269651897mr3148022d50.23.1781196846777; Thu, 11 Jun 2026
 09:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <3726a607-6cac-41f1-b402-0eed7c4e3fe3@redhat.com>
 <20260611023428-mutt-send-email-mst@kernel.org>
 <0c3f1dba-3b2c-43c5-b181-1426f6da0951@redhat.com>
 <CAFEAcA8Q9qEaZS8wCpZQ-4jpAnQ9JXvnb7iSeRTdhJ9Y3BcCRg@mail.gmail.com>
 <20260611093049-mutt-send-email-mst@kernel.org>
 <CAFEAcA-8Hv0o3PibjH=8jixsHyunH2HkOAMQVqHkGr34b1Ascg@mail.gmail.com>
 <20260611110156-mutt-send-email-mst@kernel.org>
 <CAFEAcA_2oZepwCoPS+cMgdnrSTj=mCGzdFZf5gGRHJK13yqaKQ@mail.gmail.com>
 <20260611114811-mutt-send-email-mst@kernel.org>
 <CAFEAcA9HUGfDgHjvCemPPNkp6FfvQp+4y7qCnw+ROFpG3+ybMw@mail.gmail.com>
 <20260611123952-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260611123952-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jun 2026 17:53:54 +0100
X-Gm-Features: AVVi8CcsPdd0mVQrbwuS3FL1IDbLwGAE2HTdEThBo87ET2mLg8p8Yo-q4T0Ywt4
Message-ID: <CAFEAcA8vOMd64cCkfCyc1wNbjEY+bnhFPce-V_WbAuXrUnP8cw@mail.gmail.com>
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Pavel Hrdina <phrdina@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jugraham@redhat.com, 
 shan.gavin@gmail.com, Alex Williamson <alex@shazbot.org>, 
 David Hildenbrand <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 11 Jun 2026 at 17:42, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jun 11, 2026 at 05:16:09PM +0100, Peter Maydell wrote:
> > On Thu, 11 Jun 2026 at 16:57, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > Then I'd like to see an example where we have an actual good reason
> > > to do execute arbitrary width accesses on device RAM when the
> > > driver does not execute them, please.
> >
> > That's the case we started with, with this GPU where the
> > virtio data structures are in this PCI BAR. We want the
> > virtio backend to have the freedom to say "I'm just going
> > to assume the ring buffer etc is in RAM, and I don't need to
> > care about carefully ensuring that I only do word accesses".
>
> virtio backend does not need to assume anything. any spec
> compliant guest guarantees it. any address given to
> a virtio device is ram.

OK, but how do we tell if the mmap() PCI BAR we have is RAM
or not ? Some of them are, some of them aren't...

-- PMM

