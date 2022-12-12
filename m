Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3038554ejb;
        Sun, 11 Dec 2022 21:46:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5+BH6eO4s1OYgmUXpe5phC0xwkPT858qEVhd3RhiC7mEb0WJIo4rkI5mw6V6wh+TwafpOA
X-Received: by 2002:a0c:e991:0:b0:4c7:356:9d50 with SMTP id z17-20020a0ce991000000b004c703569d50mr18763127qvn.31.1670824015398;
        Sun, 11 Dec 2022 21:46:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670824015; cv=none;
        d=google.com; s=arc-20160816;
        b=MhEOuQcwbQ9rbMOP2vIqI1pmdnj8270dYSgXOH16J7NpBWTqdqaqPfLNbq9fXpdIbZ
         VM+q7ZaQjO23PfrA7GS97sEDSmDcJ+FqYtXtbQpHhaO7D2IoV+V6G4+rTls2eLgUsZ9C
         /QbS1qHvqU1xUj67f9FaHRlFCbJaPSv82L5hbqs9Ef15ortcPhS6RXwOjP9HFqf0t227
         /zYJ/oUBz6gSnFBucDwH5QzFxc60oISG7DK2hv2inV9qJ8ac/5DFSfrJhGVe8q2sTgpY
         +B5qaqvrA6K+Ya1EKLkx0FiEyB54rVdKuh+pQZOzZ4lr8heSW/DSFG2o+KSXlfwdx1uz
         ryNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XWJsj2XdMtZ0sHSuqqPIhYhdNnh9XgITFjD9tnJmWk0=;
        b=oIvEY7n0IliDU2Et/on5zojBVdx6R3Ou2tVt65tDOjH8Pe6Imk+L1at14JOSr2bra0
         a/0M40loG70Na4B6wJLbJ1BZDNliKEOsPy8fKm7bc8q4CYL/3xmzKE9ctQY71HiOS0ds
         TrnZ6pI9Q6okmcT2fV8sE4OykRA7hd2/7inPqAuJ+8XDMdPuAw9LizzZ7RZiBxC5dk5r
         6DfhX/oHddCMJhPDoPIoZqDuaO2IIOf3YggkD0BRvkgi+lK4vzgr+26NVI6Upb60Try8
         zSSCAQMOocsd4bvZC1f+rg6w+BhEPkkYnGXnup8U56NSPYUjnTCd2xEXrLT+CHcuSO7J
         yEDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=aBlwkwYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y29-20020a37f61d000000b006ff0211b876si3631693qkj.158.2022.12.11.21.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Dec 2022 21:46:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=aBlwkwYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p4be3-0006Tx-L9; Mon, 12 Dec 2022 00:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4be1-0006SV-3Q; Mon, 12 Dec 2022 00:46:29 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4bdy-0006jr-3o; Mon, 12 Dec 2022 00:46:27 -0500
Received: by mail-vs1-xe32.google.com with SMTP id h26so10168580vsr.5;
 Sun, 11 Dec 2022 21:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XWJsj2XdMtZ0sHSuqqPIhYhdNnh9XgITFjD9tnJmWk0=;
 b=aBlwkwYRcZe+Ztqg20zVSzDGofNvKEtN0YLXY46p53BjhxE9dbf6Vwko8gVLZz6Ucb
 g/ZtZ0pTUQJuaxJDbtmDre7XKRg46vXdx8kUz2iNJ0OG1ouaK2FlfUvF6aYgCfy7CWKC
 nzO9ohRIe37n5gZQr8td2aC25+4KP2XXqXTzLYq4IrAvgmgh7ZYseajMiYQX3Sn0Iuuz
 tlKkZ1Rv1q6XgxDpSQSmbaUZjPzifMnOtXV0W90XN4ezWx1EHN+qXA9317BYtpGIMyu5
 SuW/BWdKiID4/kWqv4/KEGvq6wsPgaXpvwLfJtGUCEPBrbsa5hmXQ5q3d6w0WjCmI0Me
 rA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XWJsj2XdMtZ0sHSuqqPIhYhdNnh9XgITFjD9tnJmWk0=;
 b=kv3Vt/7XCRUqLRAT+jdfWiwyQ/dzYLvPtw5MIrRfafyL0TRobzS+F5V9uILA8TcnoW
 qezLVL8NLn7MrW8YlV6D+OTYCAZhQzyzCKF4p9DoS/I/gA8AXsZvBT7Rbj5VqHLVjNpZ
 eYI0i6aktIvUc6HoWcWUFFns+H/Y/sCY/Y4u+/vEzrQodCx99NjvVO5QzcfNneAKLrEu
 ngGvfeKRUKx+jzZJ1eMJwABtbYKQC1r6ThLCem1wLWKpQ/Yn+UGmApHTCxr5WYNMYB01
 Im/41pomB7/S960qP8/hHpRGkFHQJwWqu/Of2wnlxOzTTxufqeA7nYMBj8SPsW/cDUSw
 DNkQ==
X-Gm-Message-State: ANoB5pmeXHwTV2hOe6YdlBLS4y1CC5KdO4xujKWdRRHi91H43QGn7ZCQ
 EqMrXYfgkXStAa2E+tyH5BKS6RmQHIK6F7NM7QlKBTqwnLs=
X-Received: by 2002:a05:6102:f09:b0:3a6:eec3:b246 with SMTP id
 v9-20020a0561020f0900b003a6eec3b246mr51493854vss.64.1670823984240; Sun, 11
 Dec 2022 21:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20221210133915.4104305-1-armbru@redhat.com>
 <20221210133915.4104305-2-armbru@redhat.com>
In-Reply-To: <20221210133915.4104305-2-armbru@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Dec 2022 15:45:58 +1000
Message-ID: <CAKmqyKMxg1S=93=nrj9e=CkuKQXW7tOhaw2dpx29ahOX8bB3_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] include/hw/virtio: Break inclusion loop
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com, 
 ani@anisinha.ca, peter.maydell@linaro.org, laurent@vivier.eu, 
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com, bin.meng@windriver.com, 
 palmer@dabbelt.com, marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn, 
 gaosong@loongson.cn, richard.henderson@linaro.org, deller@gmx.de, 
 jasowang@redhat.com, vikram.garhwal@amd.com, francisco.iglesias@amd.com, 
 clg@kaod.org, kraxel@redhat.com, marcandre.lureau@redhat.com, 
 riku.voipio@iki.fi, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-ppc@nongnu.org, crwulff@gmail.com, marex@denx.de
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bMaal1Tj/hE5

On Sat, Dec 10, 2022 at 11:42 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
> former doesn't actually need the latter, so drop that inclusion to
> break the loop.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/virtio/virtio.h | 1 -
>  hw/virtio/virtio.c         | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index a973811cbf..8b68b69e00 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -22,7 +22,6 @@
>  #include "standard-headers/linux/virtio_config.h"
>  #include "standard-headers/linux/virtio_ring.h"
>  #include "qom/object.h"
> -#include "hw/virtio/vhost.h"
>
>  /*
>   * A guest should never accept this. It implies negotiation is broken
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index eb6347ab5d..faedf886da 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -26,6 +26,7 @@
>  #include "qemu/module.h"
>  #include "qom/object_interfaces.h"
>  #include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
>  #include "migration/qemu-file-types.h"
>  #include "qemu/atomic.h"
>  #include "hw/virtio/virtio-bus.h"
> --
> 2.37.3
>
>
