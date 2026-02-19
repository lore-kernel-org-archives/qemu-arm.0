Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAF3E9A058
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 18:12:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt8WD-0005sd-C1; Thu, 19 Feb 2026 13:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1vt8WB-0005s5-Of
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 13:12:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1vt8W9-0003GS-HG
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 13:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771524768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFqHHdZ+40AqTiBEJKKrNPJWy5iXisoXEggwxCMUKeM=;
 b=Y7RzCCP0ducZI9j8B5sPZpuiJJJtUeu5dZDO2HSy/heE6mTprEr3VtefctJNi73YO4jCdg
 tkZEiIxK/I8JM9Lqn0IsTheuc0R0/86EQrEVfywm8sZf8ZUYmrj7RGLKAEYczxw5oP7G3r
 hiLK8Z+SJunyFwwDgB75pOwhuEsoyQU=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-TMgiDX_XOW-fIr8_MOftMQ-1; Thu, 19 Feb 2026 13:12:46 -0500
X-MC-Unique: TMgiDX_XOW-fIr8_MOftMQ-1
X-Mimecast-MFC-AGG-ID: TMgiDX_XOW-fIr8_MOftMQ_1771524765
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-67992287096so17930361eaf.2
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 10:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771524765; x=1772129565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SFqHHdZ+40AqTiBEJKKrNPJWy5iXisoXEggwxCMUKeM=;
 b=u9//z8/Aph8cHR17Zaf7gwmvLRxFQD3j6jRU+tHyFjAWUosgZWxMaL1ruD6TVBDG7W
 3UF/ztOmfgwW91iuVr4LpjGE/wC4lheTJTVSKfZMPoUffHU7VzKkL8+qNfkx5Jb46315
 T9K7dB1yDNcIrS8aOi9dH4JdIBik+SNoy3c9QrWxigIl2R2CwVdZa8zMAg3svANIjo2h
 Umc+JTHd3sPUUO79Gxhf+7sP1I6A7P/9qgiVDvymhqxUs5x+V/UKBryW5qfZP4eCSi2h
 Wi6IU9XS04Xaw5DOg+/Ddz4/Pf8JMGlVF13ufli8FtVC/7n2HK3ia+RNSi3HxidG7d8G
 Ut4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNCK2KIhlvIX8mgx7F0lFhSCtXJ+m01RIG5B4tVk7QcWpHUgwAEEwnZvUZ64fC0v4PHndho288Qg==@nongnu.org
X-Gm-Message-State: AOJu0YzJYkA81jg75vy6czE64tvtcYXp4+qijtaqL7+2SEJAAt4K7Vju
 Ju3HDAkLhIeBTS1jGzhCPzFZqkKijN/wwdIGa/KlnozA3ywTc7VuciEQVzfUh/FESmmOsBILZ9P
 EZpfQlUD1FKgx4KHz49kjPAu1ZDma2ECAgMExFToEGdclD2JsegeUtu/w+f2AquyIZOOnsn97e4
 0+Yf8jmPQPO9dULVsYzSabCm7VR8v+
X-Gm-Gg: AZuq6aIYskiR68srK2eONwrDlqXygtTN5NPqnvgigG2w0te5AwoQKi7T+RTecI9dcVG
 Nkv0f4TVwUCrqJXDsF9yV8TebL2rFOcNU8G/0BhX/YUmCS3D2cFUFGAK8G06DHP/JoFCNK3KUe5
 bygyFodqZMfMk8Yn6v5bTVFnK0vRssNVV/Ja3VRfBf9ZFVW4DzN2bNWrNqvZSsJMUWA9SMXrI/U
 /Z/o0jMB8//w1n6ZVON4+Qf7JfAr2Bi+CH0tQ==
X-Received: by 2002:a05:6820:1623:b0:662:fa38:ed4f with SMTP id
 006d021491bc7-67859a88085mr9561396eaf.23.1771524765493; 
 Thu, 19 Feb 2026 10:12:45 -0800 (PST)
X-Received: by 2002:a05:6820:1623:b0:662:fa38:ed4f with SMTP id
 006d021491bc7-67859a88085mr9561384eaf.23.1771524765082; Thu, 19 Feb 2026
 10:12:45 -0800 (PST)
MIME-Version: 1.0
References: <20260211122759.125094-1-mbawa@redhat.com>
 <CAFEAcA_+eqfTy+7U9igTscue5SMURm3C9yUXvdFTon+ZgSJfAA@mail.gmail.com>
In-Reply-To: <CAFEAcA_+eqfTy+7U9igTscue5SMURm3C9yUXvdFTon+ZgSJfAA@mail.gmail.com>
From: Mohammadfaiz Bawa <mbawa@redhat.com>
Date: Thu, 19 Feb 2026 23:42:29 +0530
X-Gm-Features: AaiRm52G5dJSNFuqQIkAgCq8LBpmPNS1Cbs90FdPXda-2YLTX2bkbc_Yl0ex1Wg
Message-ID: <CAJg9KkwkT0CnnxwrmR4w422OY7ECMyGZFyQLO-Uj92wfSM9E=g@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Add virtio-transports property
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
 philmd@linaro.org, cohuck@redhat.com, eric.auger@redhat.com, 
 sebott@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WuJU8Mhgj5QB58XoS13zMClrsXQLg2zedZLwsAf82Vw_1771524765
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mbawa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Feb 19, 2026 at 12:32=E2=80=AFAM Peter Maydell <peter.maydell@linar=
o.org> wrote:
>
> On Wed, 11 Feb 2026 at 12:28, Mohammadfaiz Bawa <mbawa@redhat.com> wrote:
> >
> > Windows ARM64 guests detect virtio-mmio devices declared in ACPI
> > tables even when no backend is attached. This causes "Unknown
> > devices" (ACPI\LNRO0005) to appear in Device Manager.
> >
> > Until Windows fixes that by supporting, adding a new machine
> > property 'virtio-transports' to control the number of
> > virtio-mmio transports instantiated. The default remains
> > NUM_VIRTIO_TRANSPORTS (32) for backward compatibility.
> > Setting it to 0 allows users to disable virtio-mmio entirely.
> >
> > Usage: -machine virt,virtio-transports=3D0
> >
> > Signed-off-by: Mohammadfaiz Bawa <mbawa@redhat.com>
>
> Applied to target-arm.next, thanks -- but please could you check
> up with the ACPI spec about whether it says anything about what
> to report for empty transports? If it says we should or if it's
> just vague we should probably match the x86 microvm behaviour
> of not showing empty transports, since they can never be
> hotplugged after startup. (This might need to be tied to
> a machine-version, not sure.) Maybe we should also not report
> them in the dtb?
>
> thanks
> -- PMM
>

[https://uefi.org/specs/ACPI/6.6/06_Device_Configuration.html#sta-device-st=
atus]

The ACPI 6.6 spec  (Section 6.3.7) doesn't explicitly forbid listing
empty devices, but without a _STA method OSPM assumes they are
present and functioning. A simple fix is to not list them at all,
matching x86 microvm's approach and applying the same filtering to both
ACPI and DTB.

Tying this to the machine-version is a good idea as it may be required for
backward compatibility.

Thanks,
Faiz


