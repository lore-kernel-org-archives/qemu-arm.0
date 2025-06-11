Received: by 2002:a05:7022:658b:b0:a0:2f73:dc0d with SMTP id bd11csp2492328dlb;
        Tue, 10 Jun 2025 17:37:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCoE96UPJBlqpNNx2ci2Db0pn715gpEchjO6Vq2Mne939JdxLZcKE3n/sSJHgpBz6UNt4mlJY2M1jPdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFrIEaoSp15Sj0aMEedqx3hZbt5s/1+IieMBLi0P8hUZtbYnapVRKllyoMF2tHKqEbQqrr9
X-Received: by 2002:a05:620a:8908:b0:7ca:cd71:2bf8 with SMTP id af79cd13be357-7d3a88ea1f7mr276158885a.54.1749602264449;
        Tue, 10 Jun 2025 17:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749602264; cv=none;
        d=google.com; s=arc-20240605;
        b=Mlm11cjwA3en8usmy94qDaQNV4pI8DL20MtFcy9BTCnS1jPCVOTocLHikXsqDB34Ay
         7AYE2EbQW7LlCyXuYY+xJDcQ8f4fWR75BUH7MMoDxhXOfHma4TdTrMKtgYyIf1o7BFWa
         ThZzfHTS/I2Aet8SvHZ1NZVu4ZuYfOYgkvpwjrONj1zccv9xRqOQtC4a95a4s8Ws238H
         dKnE5GYPyODAGMmOWMgvY3IlrhsVQg+zyvsBMHDGb0BICjObnKjnnBduCPA01Nf1R6je
         db+75UKnXmZVk9cutg2aHjjYPY347qwVj6tnK0+w2VPXa2Wbmp/PahDOQF8xca0ysgTF
         86Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=OamR/HWDEWSHA2vggn6YNvnySV+qhfwexKceXHSxfAg=;
        fh=nZigL1vnINBk1wk2sRJPJZYcIriOWv9eQrAXFoeWWQI=;
        b=gV0yRP7AFf3cWKkxWeNDxYo2umv6xF2sWLWAY5jypTOHAeU2/+XX51REjyjiom6ygF
         WoMKRtQvx4VThF/LzAtLjV2YblqC35Hbu5UpWK11D/d9x64ekLL2QkqC+1aa+DITX3PD
         +XRCekDD27z8IyzwuuBqvIpFaGT6CjEsB3CBMUFfFrX9p0RhGxJX/kB8GQFLtB0Bdwb/
         f6Ct5LWGa73cxM9dtXlM9rEFTLlUs7Hi19DGDdjEsJR9wIZH22wj7prQTtif3rwjr19z
         FPW4/+DI5nX/+L4rTX6clyNlOVpEY/LBCOmQ9ixZA1kFpsIBrlDUAS2+BgBkG/zPm3Hd
         7c5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d25a60fdd4si1148514685a.344.2025.06.10.17.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jun 2025 17:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uP9T2-0002o2-LC; Tue, 10 Jun 2025 20:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1uP9Sy-0002nh-9a; Tue, 10 Jun 2025 20:37:20 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1uP9Sv-0007rZ-PY; Tue, 10 Jun 2025 20:37:20 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5E14255BC03;
 Wed, 11 Jun 2025 02:37:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id Cj7zJjg1X45V; Wed, 11 Jun 2025 02:37:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5364C55BC02; Wed, 11 Jun 2025 02:37:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4E77B745682;
 Wed, 11 Jun 2025 02:37:08 +0200 (CEST)
Date: Wed, 11 Jun 2025 02:37:08 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 4/5] configure: Add dtc option
In-Reply-To: <20250610204131.2862-5-shentey@gmail.com>
Message-ID: <cdfc561e-23a9-607a-d9a8-70e07e73e0fd@eik.bme.hu>
References: <20250610204131.2862-1-shentey@gmail.com>
 <20250610204131.2862-5-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2G+skuSzXSin

On Tue, 10 Jun 2025, Bernhard Beschow wrote:
> The next patch will make dtc mandatory for boards with a bundled DTB, causing
> these boards to be omitted when dtc is missing. Allow packagers to force the
> build of those boards by providing an option.

I don't like this. This might result in some machines missing from some 
distros if they don't notice this and forget to update their packages and 
these are machines I care about. Also what guarantees that we don't get 
bugs by compiling the device tree with different dtc versions which might 
generate different binaries? The binaries we have now are known to work 
and don't take much space so keeping them for convenience might be 
simpler. If it worked so far why change it now?

If this was using dtc from the submodule when not using system libfdt then 
at least it would not result in dropped machines and we had a known 
working dtc to compile with. Why isn't that used when we already have it 
for libfdt?

Regards,
BALATON Zoltan

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> meson.build                   | 12 ++++++++++++
> Kconfig.host                  |  3 +++
> meson_options.txt             |  3 +++
> pc-bios/dtb/meson.build       |  1 -
> scripts/meson-buildoptions.sh |  3 +++
> 5 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 34729c2a3d..8a03fbaed8 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2119,6 +2119,15 @@ if fdt_opt == 'internal'
>   fdt = libfdt_proj.get_variable('libfdt_dep')
> endif
>
> +dtc = not_found
> +dtc_opt = get_option('dtc')
> +if dtc_opt == 'enabled' or (dtc_opt == 'auto' and have_system)
> +  dtc = find_program('dtc', required: dtc_opt == 'enabled')
> +  if not dtc.found() and dtc_opt == 'enabled'
> +    error('dtc not found')
> +  endif
> +endif
> +
> rdma = not_found
> if not get_option('rdma').auto() or have_system
>   rdma_libs = [cc.find_library('rdmacm', has_headers: ['rdma/rdma_cma.h'],
> @@ -2477,6 +2486,7 @@ config_host_data.set('CONFIG_FREEBSD', host_os == 'freebsd')
> config_host_data.set('CONFIG_CAPSTONE', capstone.found())
> config_host_data.set('CONFIG_COCOA', cocoa.found())
> config_host_data.set('CONFIG_DARWIN', host_os == 'darwin')
> +config_host_data.set('CONFIG_DTC', dtc.found())
> config_host_data.set('CONFIG_FDT', fdt.found())
> config_host_data.set('CONFIG_FUZZ', get_option('fuzzing'))
> config_host_data.set('CONFIG_GCOV', get_option('b_coverage'))
> @@ -3314,6 +3324,7 @@ host_kconfig = \
>   (libcbor.found() ? ['CONFIG_LIBCBOR=y'] : []) + \
>   (gnutls.found() ? ['CONFIG_GNUTLS=y'] : []) + \
>   (x11.found() ? ['CONFIG_X11=y'] : []) + \
> +  (dtc.found() ? ['CONFIG_DTC=y'] : []) + \
>   (fdt.found() ? ['CONFIG_FDT=y'] : []) + \
>   (have_vhost_user ? ['CONFIG_VHOST_USER=y'] : []) + \
>   (have_vhost_vdpa ? ['CONFIG_VHOST_VDPA=y'] : []) + \
> @@ -4703,6 +4714,7 @@ summary_info += {'sphinx-build':      sphinx_build}
> if config_host.has_key('GDB')
>   summary_info += {'gdb':             config_host['GDB']}
> endif
> +summary_info += {'dtc':               dtc}
> summary_info += {'iasl':              iasl}
> summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
> if host_os == 'windows' and have_ga
> diff --git a/Kconfig.host b/Kconfig.host
> index 933425c74b..82fc8848dd 100644
> --- a/Kconfig.host
> +++ b/Kconfig.host
> @@ -29,6 +29,9 @@ config IVSHMEM
> config TPM
>     bool
>
> +config DTC
> +    bool
> +
> config FDT
>     bool
>
> diff --git a/meson_options.txt b/meson_options.txt
> index a442be2995..d0e56564fb 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -316,6 +316,9 @@ option('vduse_blk_export', type: 'feature', value: 'auto',
>
> option('capstone', type: 'feature', value: 'auto',
>        description: 'Whether and how to find the capstone library')
> +option('dtc', type: 'combo', value: 'auto',
> +       choices: ['disabled', 'enabled', 'auto'],
> +       description: 'Whether to find the device tree compiler')
> option('fdt', type: 'combo', value: 'auto',
>        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
>        description: 'Whether and how to find the libfdt library')
> diff --git a/pc-bios/dtb/meson.build b/pc-bios/dtb/meson.build
> index 993032949f..9fcdbeff14 100644
> --- a/pc-bios/dtb/meson.build
> +++ b/pc-bios/dtb/meson.build
> @@ -5,7 +5,6 @@ dtbs = [
>   'petalogix-s3adsp1800.dtb',
> ]
>
> -dtc = find_program('dtc', required: false)
> if dtc.found()
>   foreach out : dtbs
>     f = fs.replace_suffix(out, '.dts')
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 73e0770f42..e8c452ffb0 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -116,6 +116,7 @@ meson_options_help() {
>   printf "%s\n" '  dmg             dmg image format support'
>   printf "%s\n" '  docs            Documentations build support'
>   printf "%s\n" '  dsound          DirectSound sound support'
> +  printf "%s\n" '  dtc             Whether to find the device tree compiler'
>   printf "%s\n" '  fuse            FUSE block device export'
>   printf "%s\n" '  fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports'
>   printf "%s\n" '  gcrypt          libgcrypt cryptography support'
> @@ -310,6 +311,8 @@ _meson_option_parse() {
>     --disable-docs) printf "%s" -Ddocs=disabled ;;
>     --enable-dsound) printf "%s" -Ddsound=enabled ;;
>     --disable-dsound) printf "%s" -Ddsound=disabled ;;
> +    --enable-dtc) printf "%s" -Ddtc=enabled ;;
> +    --disable-dtc) printf "%s" -Ddtc=disabled ;;
>     --enable-fdt) printf "%s" -Dfdt=enabled ;;
>     --disable-fdt) printf "%s" -Dfdt=disabled ;;
>     --enable-fdt=*) quote_sh "-Dfdt=$2" ;;
>
