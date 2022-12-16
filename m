Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1286091ejb;
        Fri, 16 Dec 2022 03:06:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvfojc2w8H109D4Hrunxf/FOAz7Ci+ixkt17K+bjDG5/jio3vae3xUzA/XrZWEG49b4x/ee
X-Received: by 2002:a05:6122:128:b0:3cc:110e:b81e with SMTP id a8-20020a056122012800b003cc110eb81emr236078vko.8.1671188798002;
        Fri, 16 Dec 2022 03:06:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671188797; cv=none;
        d=google.com; s=arc-20160816;
        b=goVQL17PHgRYyB9YrVtZNr4hCMsqMe34eJAKkuBKTthQNj4q2eUoBYkNB3SWj61S77
         i/gztEgvXarNJc7yNsGjcEjsrQnv83XrRcHNw5CcJKqAHTHc/so+rWjAFbEPCz7+jqhi
         961Ma0/BHE77hsBaC4XvbqTCTu4Sle/AoSAwyfljWKWB/ungBfRoYbSMZ4PW7l+oWwKA
         U4gQWQbmaz58KmDpHhG21tj2S8rUP5lb2Vne/gSrFm9bzAGWRebZC4LGWOLX8ALn5DoM
         lxvHaPzWn29vWyPs4n1cCqzN5GVH7EvRUeFtTTJ8SFJrerInjWjou/2+vW2Agtduktdn
         wUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TNN1Lwj9oUu+SRPkrk8oHxVGSEWLKpNEs9hevHnxj7o=;
        b=ILRN+3N+RhxsWki2GuG46xEg+dd8MNTRtjWcflRcUjUzaCqjykhn0wn16Qe8Vut0aR
         48Q24YYV5TbR8X6lEw+lR/CI4ZkZd05cwAREsWUMkmiXy7gf3k6pBumWRUvz+yT8svI7
         YUcTSIEr1OQYKVWTmQrUemNCZ2uLqfNE3+s2JDwfkbDAnQ1F23xU1HpeW5i7Q8MzN/zW
         gTuo2lqqXTiZPTZYwKfo9ryVsFFt+K9UI79HO3Vp9aAaDDhTHkbqn4W/JclNlm7xVHx/
         oOX/qhfeKHTyZ2jIvhpV/qNJwkXf6UjMWpfF/2HwJExK1/yRIEmzwHwApobk6xq8LLeO
         XkkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4viZyI7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a37ab0e000000b006c9b99b444dsi816413qke.599.2022.12.16.03.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Dec 2022 03:06:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4viZyI7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p68XU-0003jh-2q; Fri, 16 Dec 2022 06:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p68XS-0003jN-Ik
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 06:06:02 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p68XR-0001qp-0B
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 06:06:02 -0500
Received: by mail-pl1-x632.google.com with SMTP id x2so1921809plb.13
 for <qemu-arm@nongnu.org>; Fri, 16 Dec 2022 03:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TNN1Lwj9oUu+SRPkrk8oHxVGSEWLKpNEs9hevHnxj7o=;
 b=Y4viZyI7R3weTKutbIsm5AbIDGieJdaxQei98ZfMvnUk463SJYj8t/wJqYLpAwsCPj
 Iq17ITYehvtaS5Q10Sdy4Lz9jaZIM993rkxPr7rH0SGXsZWKx29/AmuNv/fruNhJ9Bs5
 4wpy3/iDo3Y9/CLah6Qptb/JHo/LHZJjoYZSYW74FDQAkx2kycfU5+05p7IqTKytlSmI
 RYKsnE3OdF7xLpd9I1uKmuIZJ2StA1AJRAunDk0B6EGOeQ745zsG1FKfQOSKYnf4eV4/
 cMKKEPAaU56mM2R24/pxggofDKsvk2ckz+do8yPGKg6ujLiTgCpFq2R6649voY0Xg6d6
 vC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TNN1Lwj9oUu+SRPkrk8oHxVGSEWLKpNEs9hevHnxj7o=;
 b=6/QA6hK29Y3QqQXpRFPi8mvH+MG2sBHj4LjDDfM6hCctjujigYROXWqmw5TkI/dhxS
 mbxzvVa7e7Vj36H/0dBz2iz54hHLhY4E1Dl7UPB0aiHx8Afr77rB0ukaJH86c6GpddU2
 svStcJYR8zMCfESBo+7rlJkasGpvkzisrYhNkhbkAIETUJfR+r1hr+53xmEfo7blWbzO
 gIy7EPCyvcWV/tMH8QbiP5Rr5pthU+I2MjFU7ljHo9Rg906QHaYpBwLOMURhAY386ioO
 QY+SVxuxWrK2KlG4vCGWGxiG4+2ZpgxtUkO23khVZ2Z+rDRSJA7gvyF92LFCdEMhxQX+
 4RIA==
X-Gm-Message-State: ANoB5plqOayAzicX5SiONI46Fn5Lt8UGs6GkALZE8IDM1t8VYyKWmyle
 UPpJEQdfQznuv9xdmMIODDonMsnPNehFJfT+fYHOaQ==
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr36592323plt.60.1671188758418; Fri, 16
 Dec 2022 03:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20221216101234.2202009-1-kraxel@redhat.com>
 <20221216101234.2202009-2-kraxel@redhat.com>
In-Reply-To: <20221216101234.2202009-2-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 11:05:46 +0000
Message-ID: <CAFEAcA8Sfft6hB2hRyht9vRg3xYq3kTWjqd4s2GreYZqH3O3=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm: allow flash images being smaller than the
 available space
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +VdUtEwvdmPF

On Fri, 16 Dec 2022 at 10:12, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Query block device backing flash for size and use that instead of
> requiring the block device being exactly 64M in size.  This allows
> to use edk2 firmware builds without padding, i.e. use QEMU_EFI.fd
> (which is /way/ smaller than 64M) as-is.
>
> -rw-r--r--. 1 root root 67108864 Dec 12 23:45 QEMU_EFI-pflash.raw
> -rw-r--r--. 1 root root  2097152 Dec 12 23:45 QEMU_EFI.fd
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/arm/virt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b87135085610..c71ae2cd73f7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -43,6 +43,7 @@
>  #include "hw/vfio/vfio-amd-xgbe.h"
>  #include "hw/display/ramfb.h"
>  #include "net/net.h"
> +#include "sysemu/block-backend.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/runstate.h"
> @@ -1134,6 +1135,21 @@ static void virt_flash_map1(PFlashCFI01 *flash,
>                              MemoryRegion *sysmem)
>  {
>      DeviceState *dev = DEVICE(flash);
> +    BlockBackend *blk;
> +
> +    blk = pflash_cfi01_get_blk(flash);
> +    if (blk) {
> +        hwaddr blksize = blk_getlength(blk);
> +
> +        if (blksize == 0 || blksize > size ||
> +            !QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE)) {
> +            error_report("system firmware block device %s"
> +                         " has invalid size %" PRId64,
> +                         blk_name(blk), size);
> +            exit(1);
> +        }
> +        size = blksize;
> +    }
>
>      assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
>      assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
> --
> 2.38.1

We've had at least three threads about this already, attempting
various approaches. Please read up on them and the discussions
that ensued from those patches before having another go at it.

The problem with this idea is that the size of the flash device
exposed to the guest should not depend on the size of the backing
file the user provides -- it's a fact about the machine and
also if it varies it's easy for the user to back themselves into
a corner where they can't migrate to a destination where the
backing file is larger, or they can't add new variables to the
EFI store because the backing file is too small.

thanks
-- PMM
