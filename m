Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp3028203ejb;
        Wed, 25 Oct 2023 14:06:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY+YTbzAG+LSbhpE56l0m6MrzF6wY5CfhcqWJZrWMdjPFirP7W9yRRrhleBnbnqhFJavOp
X-Received: by 2002:a2e:b8c4:0:b0:2c5:e0:1634 with SMTP id s4-20020a2eb8c4000000b002c500e01634mr11833783ljp.35.1698267967530;
        Wed, 25 Oct 2023 14:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698267967; cv=none;
        d=google.com; s=arc-20160816;
        b=XdHSqXVEXIn0SGgJl74ldYIjLqpCaD2d+QGUL4W7OsiWl+9mrw5G1uK65E076emgN4
         F9WiB1RYyr/CiVCxRkJJ3APjE7y/ZWJ6TXU3BNnjxcdC32cDI9wOvzJsPqGH7hJPm6Ky
         Dhox8uMZaXJpncaQE57DcxhJnC4USEKchUN/D2m/jBCZIgu+eHtvY2wtF1hVipX8Movu
         RS/quiYlBXLthJ3S+zgLGDv1ErySfpnWyf9f8VJjqSZpdGktOlchAuudsLx3SdfLzByL
         7h/RvWH7L9RjpNnfwV/eEPJYT7mCf06IStoXB7yZ1N2usfyt/flaaabCWe32Mpe3WUEk
         qBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-id:mime-version
         :references:message-id:in-reply-to:subject:cc:to:from:date;
        bh=vmO+CjMOwhbm4SEl/H/mjA7TkmPsFKdKQH2b0UYBGaA=;
        fh=gHgTXW+HYQlfXOTlyX5PQSNotlP/s1ZHeLT9aaJYBuQ=;
        b=R+xD1ei8oc6w18khahJ9AwoNm4JhxvjQj7NXPlRT6CqTQQwj60sZOzZNvpnCZsI27y
         PyszUrkIGeFlVVWWDQMFTL4dse+B6qNwWjTq1hUmkM+Ub4NGaLwCGVMWfEk+fD5bVJ8V
         56oMDyQqnDOE1MFNcTjSJ7fNuuI2MGCY35luen9gYJkul2ikfaq8dyVq8oHBP+R5JZ8J
         uu7TSZjHi9si3fy/U09kJrYc1S2AXIXgA1TyeawZJZmDRqtrolhtc7UZmfIrtgGdb8IU
         Rj9r61Q614D6+Snvy9lHpQ8Ts8ZgWP98jq25/zPcPtcOgNAoi37Zema8SXosqrELu7WA
         obww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a05600c445100b004063cddc2fbsi562925wmn.11.2023.10.25.14.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 14:06:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvl4Z-00014l-S2; Wed, 25 Oct 2023 17:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qvl4R-00012s-4V; Wed, 25 Oct 2023 17:05:44 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qvl4O-0001JC-AP; Wed, 25 Oct 2023 17:05:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2298B756066;
 Wed, 25 Oct 2023 23:05:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D8F2B7456A7; Wed, 25 Oct 2023 23:05:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D6F46745681;
 Wed, 25 Oct 2023 23:05:36 +0200 (CEST)
Date: Wed, 25 Oct 2023 23:05:36 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, 
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 22/23] hw/display: make ATI_VGA depend on PIXMAN
In-Reply-To: <20231025190818.3278423-23-marcandre.lureau@redhat.com>
Message-ID: <63e8196a-da54-83fa-0eea-ed9a4b669186@eik.bme.hu>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
 <20231025190818.3278423-23-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1313484981-1698267825=:42723"
Content-ID: <fb638488-a307-f23b-1920-ba66f28b6179@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: dZ98+5DNAhH7

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1313484981-1698267825=:42723
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <f73a3489-2682-4edb-3957-10b06512df60@eik.bme.hu>

On Wed, 25 Oct 2023, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> configs/devices/mips64el-softmmu/default.mak | 2 +-
> hw/display/Kconfig                           | 2 +-
> hw/display/meson.build                       | 2 +-
> 3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/devices/mips64el-softmmu/default.mak
> index d5188f7ea5..8d85607571 100644
> --- a/configs/devices/mips64el-softmmu/default.mak
> +++ b/configs/devices/mips64el-softmmu/default.mak
> @@ -3,7 +3,7 @@
> include ../mips-softmmu/common.mak
> CONFIG_FULOONG=y
> CONFIG_LOONGSON3V=y
> -CONFIG_ATI_VGA=y
> +# CONFIG_ATI_VGA=n

I think I've asked this before but forgot the answer... However fuloong2e 
has an on board ati-vga so does this (or should it) disable CONFIG_FULOONG 
when !PIXMAN? Or that machine should omit the on board graphics in this 
case?

Regards,
BALATON Zoltan

> CONFIG_RTL8139_PCI=y
> CONFIG_JAZZ=y
> CONFIG_VT82C686=y
> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> index 1aafe1923d..4d8a6c4af8 100644
> --- a/hw/display/Kconfig
> +++ b/hw/display/Kconfig
> @@ -125,7 +125,7 @@ config DPCD
> config ATI_VGA
>     bool
>     default y if PCI_DEVICES
> -    depends on PCI
> +    depends on PCI && PIXMAN
>     select VGA
>     select BITBANG_I2C
>     select DDC
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index 9c06aaee20..344dfe3d8c 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -62,7 +62,7 @@ system_ss.add(when: 'CONFIG_XLNX_DISPLAYPORT', if_true: files('xlnx_dp.c'))
>
> system_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
>
> -system_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
> +system_ss.add(when: 'CONFIG_ATI_VGA', if_true: [files('ati.c', 'ati_2d.c', 'ati_dbg.c'), pixman])
>
>
> if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
>
--3866299591-1313484981-1698267825=:42723--
