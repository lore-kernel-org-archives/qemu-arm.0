Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp272983lfg;
        Fri, 5 Mar 2021 03:58:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpo5Faor+NKV3WEIbK+pQnT9CE/qcMERnPG9fGN2ZekDQB9QxyH/L9PJaZkd/n2Ma06d2Y
X-Received: by 2002:a05:6e02:152f:: with SMTP id i15mr8297822ilu.183.1614945492374;
        Fri, 05 Mar 2021 03:58:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614945492; cv=none;
        d=google.com; s=arc-20160816;
        b=EkxRgLT1UoRdqXJc0KCAa5bJm3eZyb/RvCqBj7ZFFPfY2VUzRZQ8spPRFZtR817s4e
         nWw8Avld0myZRUEpfpVisWF/14NxHPAYDZHUJdfeZ6xK2IqJV00ZCFtd2MRhAJilydhq
         1/0fFHn0EiDSeZeZ1LpkkRcILVgItb2BwDkkp9N3+iYH02KWnOU4H8gyKCsxPhtnXQ6y
         UyPh1FJ02ZNu3sArwmAnLuCAPakcHs6fYJYcqjl7Mo/aX2ZWBY9cnJ7DS5SZ8n3ATiIe
         2I2GnreOWkLGDlrruV2w7AihyMacfH6hl+4oTSYbRmZlyR0HA4hm2cqQuCKqToyDDW6j
         KI9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=etJ2pL39JMnOlHW+dUpKkYovPnt5BxDZyU4oZ8AaA+s=;
        b=QKIqK/EF4vDnehRgDBsGUwF8/8KP8fEB8ta/K97dFVx1n9mic+t9s7AC1ZhI36eVVp
         U+uuCUpK4HSoEJUZpwpiXD7Fa23bTuLJ9J8wXzQjwSmkCkOkxTgVVsIp9CuHFj8mK12A
         ypesSO66Hwy3UQeNaTAXsrcDTyIc5s6HMLoTJM4sGKWXafcymXh3eSz0UMm91xMK868N
         ohOsbKieN2IbmXPlt48GYHaRRp4xfWYgi4RM61hGgrYMBeCFY5rNWb9ioEkiCkCcDEXC
         1aXSCHR5w+4+zsPBrX6Uc1qdxsbvBpJpGkymETI0AjJgk/tS8s9Be7hp6xqrrncdU/Pw
         t/uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LV3QJk8R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si2312719ilh.9.2021.03.05.03.58.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 03:58:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LV3QJk8R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lI95v-0008Mk-Me
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 06:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI95B-00081y-6a
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 06:57:25 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI957-00041p-TR
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 06:57:24 -0500
Received: by mail-ed1-x52b.google.com with SMTP id w9so2153030edt.13
 for <qemu-arm@nongnu.org>; Fri, 05 Mar 2021 03:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=etJ2pL39JMnOlHW+dUpKkYovPnt5BxDZyU4oZ8AaA+s=;
 b=LV3QJk8RbHxdITUpqM5XHV2mrruM95Wmx5zUk8qrxv6TKWlQC1CpvnGR/EWBhgHTIB
 E1Fbs+Ipzjc8ALypma/u606jfTbUsdsVdzklLeJ3PLfVhsmQAQIYl7kXtMbLX0KYeYzf
 mzzy707CjaWqNHS6Y9ywpOFPVSUbz8G1W6HWALeE4L9AMrK94K0zKUdjv/YmjPIdKMp5
 AU6HtjxFO0eSPOvm3CyqbNfpHnKyYqQnTCuoWFBao6q1WJVPCxoPay4TJDLYesMnOHHP
 /aXwf8nxXrhgbhwhTIhweKKlDYf8ZWDQeF1skIh+aptFw7ryNSVsTn3PS8qEJf5WuODV
 WTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=etJ2pL39JMnOlHW+dUpKkYovPnt5BxDZyU4oZ8AaA+s=;
 b=TnwaNLyaWYc3jMbhuieXgT+0JX2IP2r/En3YIRBtQrxGEg357dhhvWtrq+M1otZm0O
 XriXHOq+x2aMBX74sRUkxfvvZmo75EFxi8VaTLKdsw99jr3AlUwkM9P+6Vu7QASGO1WR
 GIy7C6T8vs62C5DqYyqeCwwsiZ7JIxnzwdjzJ8DnuuDk5BJchHuV6Z78zWpIwu1wtnvo
 UL8XQBSg8E/dg7GiBgR7/Xvs+f1j+SztsXw6mkwxCuF1K7jy36zDiWIyUef0WHP4HNRD
 vFY3sLIAa0MB50iWQsfOT9gx4uqppHvU3hRygRAQDEIHgG05ERuMweytyOd8/x1YMf1P
 dMkA==
X-Gm-Message-State: AOAM530s9ALtIvy5SY+SnzVGhurVaDPb/+bAXJQkrgSLS66qGo+HhoAT
 1RvT6Kr/mqbNwbvspIkStC93hSgHQll5R5gkyS85QX/Ydac=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr8567871edt.251.1614945440175; 
 Fri, 05 Mar 2021 03:57:20 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA_W0AhNYs7+9hn1H6B2DL+UnSdhrj2JsBS4vCZ6fEd_pw@mail.gmail.com>
 <20210225053606.385884-1-schspa@gmail.com>
In-Reply-To: <20210225053606.385884-1-schspa@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:57:04 +0000
Message-ID: <CAFEAcA_8EDULp2aZoJb=i4EFHEuy29L9QpJMd6nCzKLmuEAhHw@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-mmio: improve virtio-mmio get_dev_path alog
To: schspa <schspa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EJiqSjkpE53v

On Thu, 25 Feb 2021 at 05:36, schspa <schspa@gmail.com> wrote:
>
> At the moment the following QEMU command line triggers an assertion
> failure On xlnx-versal SOC:
>   qemu-system-aarch64 \
>       -machine xlnx-versal-virt -nographic -smp 2 -m 128 \
>       -fsdev local,id=shareid,path=${HOME}/work,security_model=none \
>       -device virtio-9p-device,fsdev=shareid,mount_tag=share \
>       -fsdev local,id=shareid1,path=${HOME}/Music,security_model=none \
>       -device virtio-9p-device,fsdev=shareid1,mount_tag=share1
>
>   qemu-system-aarch64: ../migration/savevm.c:860:
>   vmstate_register_with_alias_id:
>   Assertion `!se->compat || se->instance_id == 0' failed.
>
> This problem was fixed on arm virt platform in commit f58b39d2d5b
> ("virtio-mmio: format transport base address in BusClass.get_dev_path")
>
> It works perfectly on arm virt platform. but there is still there on
> xlnx-versal SOC.
>
> The main difference between arm virt and xlnx-versal is they use
> different way to create virtio-mmio qdev. on arm virt, it calls
> sysbus_create_simple("virtio-mmio", base, pic[irq]); which will call
> sysbus_mmio_map internally and assign base address to subsys device
> mmio correctly. but xlnx-versal's implements won't do this.
>
> However, xlnx-versal can't switch to sysbus_create_simple() to create
> virtio-mmio device. It's because xlnx-versal's cpu use
> VersalVirt.soc.fpd.apu.mr as it's memory. which is subregion of
> system_memory. sysbus_create_simple will add virtio to system_memory,
> which can't be accessed by cpu.
>
> Besides, xlnx-versal can't add sysbus_mmio_map api call too, because
> this will add memory region to system_memory, and it can't be added
> to VersalVirt.soc.fpd.apu.mr again.
>
> We can solve this by assign correct base address offset on dev_path.
>
> This path was test on aarch64 virt & xlnx-versal platform.
>
> Signed-off-by: schspa <schspa@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Applied to target-arm.next, thanks (unless MST would rather it
go in via another route).

-- PMM
