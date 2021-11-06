Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp3181878lfv;
        Fri, 5 Nov 2021 23:47:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkAD2bODxKolzOjvyEGJq4L2gA2nYVrtVmrizsINcHUojgGlbTsD+O4IdEwR9AszNvVNTQ
X-Received: by 2002:a9d:5911:: with SMTP id t17mr50378314oth.30.1636181268762;
        Fri, 05 Nov 2021 23:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636181268; cv=none;
        d=google.com; s=arc-20160816;
        b=mEA5wRov/Vv49v1+1GonNeXg7ISw9Q9fmMzIj4S9V2s9HNG6AjUicBpFXk3UwNLEaE
         ro5WPeV4EMt1ZpHIef6bsLgcOoBvqUJ5vLQCheMi285w9/ZG5CID7c9LDhRZZFm6Ah5S
         Mip5JsJ7vzrlVNncv/Nkdw24hZG32A7gGCjvounMpDp/S06Sw2d4niLfz9w5/G3wiDDh
         Mv7bLjBQRT3sv11XoZvBClISi1btfjgk43v95Dut3dUPDHR1NzhLlRehz1cqMQXytolq
         A/xLwWU1vB1DvG+HOFzqXotSi2+aGh+QoewYwMUccrSfKrNB9YiFi8v7nE8qszrSM9sc
         WwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=qHL6sFGBhTbmtq5+bOM1xMu7YSyQXKymidsSZqIY/CE=;
        b=rPxb0cUaSeJ+/GcvS7x7gad4wsqaKOTZ7qhrIhSpZb5XNIGrWoKODkA7QPNZvFTU9B
         0NgW8VXFkhotMz9WW1yJCuFEw17V/2JcN1Bq98Lk1HxlxJD5ndKV3vGy+xVRDiP7Rhc0
         QkzKm+HO+TYn0XPJLgTh1cUCW9gkf+KWg3CrIEXwyR6LuOKhl5s3GYNuEjOwnPLb9jl6
         fhSL7bZWqAHgt4TTo2rWL62U0Vrc3hNhJDHnc+BkP0MQ6xCpADXBCUoURzwvaV+ytHZR
         dDHwapb2zmUXjxS1X0LDkcWitzGh/FXlC4bDv8mMpIR4jA/VpXHJip7VyMYlD+jn5AKz
         236A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UkDUbpsz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp12si1743961oib.242.2021.11.05.23.47.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Nov 2021 23:47:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UkDUbpsz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mjFUR-0006oJ-Eu
	for alex.bennee@linaro.org; Sat, 06 Nov 2021 02:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjFU2-0006nO-2F
 for qemu-arm@nongnu.org; Sat, 06 Nov 2021 02:47:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjFTz-0007Pg-Qk
 for qemu-arm@nongnu.org; Sat, 06 Nov 2021 02:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636181238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qHL6sFGBhTbmtq5+bOM1xMu7YSyQXKymidsSZqIY/CE=;
 b=UkDUbpszZTrTWHYtG3LJzuJM+o76ZdPA+3bsjQXsRbRv/2WHW7eCQoLCYHE/08/6inRkWm
 5dAr0seXrIfUplLCjc/BmepahmdzpXti1Jq0wmJl9QHAv35Y9eePKOkcIWSnEHf2sb/U4L
 1n1o5+9Hv6TGBEhbZnB/B8ZdPrcqMbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-W45dxtA8P7KwoerKgCKD3Q-1; Sat, 06 Nov 2021 02:47:15 -0400
X-MC-Unique: W45dxtA8P7KwoerKgCKD3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85145800053;
 Sat,  6 Nov 2021 06:47:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B345360C17;
 Sat,  6 Nov 2021 06:47:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 328A211380A7; Sat,  6 Nov 2021 07:47:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH v4 5/7] blockdev: Add a new IF type IF_OTHER
References: <20211103220133.1422879-1-wuhaotsh@google.com>
 <20211103220133.1422879-3-wuhaotsh@google.com>
Date: Sat, 06 Nov 2021 07:47:11 +0100
In-Reply-To: <20211103220133.1422879-3-wuhaotsh@google.com> (Hao Wu's message
 of "Wed, 3 Nov 2021 15:01:31 -0700")
Message-ID: <87a6ihvl00.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, qemu-block@nongnu.org,
 venture@google.com, bin.meng@windriver.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GcQNWGKKu/i9

Hao Wu <wuhaotsh@google.com> writes:

> This type is used to represent block devs that are not suitable to
> be represented by other existing types.

Hinting at intended use wouldn't hurt: ", such as <mumble>"

>
> Signed-of-by: Hao Wu <wuhaotsh@google.com>
> ---
>  blockdev.c                | 3 ++-
>  include/sysemu/blockdev.h | 1 +
>  meson                     | 2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/blockdev.c b/blockdev.c
> index b35072644e..c26cbcc422 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -80,6 +80,7 @@ static const char *const if_name[IF_COUNT] = {
>      [IF_MTD] = "mtd",
>      [IF_SD] = "sd",
>      [IF_VIRTIO] = "virtio",
> +    [IF_OTHER] = "other",
>      [IF_XEN] = "xen",
>  };
>  
> @@ -739,7 +740,7 @@ QemuOptsList qemu_legacy_drive_opts = {
>          },{
>              .name = "if",
>              .type = QEMU_OPT_STRING,
> -            .help = "interface (ide, scsi, sd, mtd, floppy, pflash, virtio)",
> +            .help = "interface (ide, scsi, sd, mtd, floppy, pflash, virtio, other)",
>          },{
>              .name = "file",
>              .type = QEMU_OPT_STRING,
> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> index 32c2d6023c..bce6aab573 100644
> --- a/include/sysemu/blockdev.h
> +++ b/include/sysemu/blockdev.h
> @@ -24,6 +24,7 @@ typedef enum {
>       */
>      IF_NONE = 0,
>      IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
> +    IF_OTHER,
>      IF_COUNT
>  } BlockInterfaceType;
>  
> diff --git a/meson b/meson
> index b25d94e7c7..776acd2a80 160000
> --- a/meson
> +++ b/meson
> @@ -1 +1 @@
> -Subproject commit b25d94e7c77fda05a7fdfe8afe562cf9760d69da
> +Subproject commit 776acd2a805c9b42b4f0375150977df42130317f

Oopsie :)

