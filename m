Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2736833lfb;
        Fri, 27 Nov 2020 11:44:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXsu2aMvS9hrjv3/ZKE35ynmTO2c981li6QL3Rman+eadOtLgnjWtWSj3enEkc5a954qEi
X-Received: by 2002:a25:2d05:: with SMTP id t5mr17458154ybt.297.1606506257597;
        Fri, 27 Nov 2020 11:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606506257; cv=none;
        d=google.com; s=arc-20160816;
        b=0xfYqGauC1LYWIofOUV3UiaEm0Fk74979j9sS/+CLNBxgKz7CdxkIcRY3T+RpEk81f
         DaHZfoK9AnzsRBLdfCtRRomvOv9a5LyHwNsiVdLZnRxfqBT/ncR9gndXq0IRly0S55A6
         L/5l2wplhty9mZUnt6ELqEFouAodQqb9lHgqTeRADP19FzaBKbRxW+QoQjCOHe6Oxga8
         VEWg/VekF2kJjDbJl+DrdjzjbfJk/mPSPKDZkMKIoQBNUR5mVMGbN7Fl/2p3A8Dp60qF
         0NMWR7ZHct7MNBjynYAaCrYK37U7g8PKVymno5i5pTMZMcsDOfxklmr2y6wc8Ku6D0Fw
         Bj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=K5L/NgzK1aQhmeDcIW0dPBf6s+9ODINMqT8PDudjCWQ=;
        b=oM+Zz0Io9kw4WO7eBlgkly16WXAyeHhMka62oqLtYd+P03kOJ6mW4D9/G9IrBcntWO
         mpF1mMrdxby/wzMc+nha4OfU9eHolc9tgPhXRSa4XAXhuGr/bEKGsDZgxC9Kfe7TIYHC
         /N4LPwEK/qT9ile5wVOr3kbdBspY9f753de0nR07xPVhzqkhAtXfQxjKvtX7ZfTSALhd
         1SLwwyvvoGaCxRP3GdBrEIjsfBwRkbHn4AOqCFNiFCxTAObvuR/DAH8FouU4zgg7tOnX
         RIDjMqDSUZv38ZWlV1D/eSA0FdQoL2zTJP6yA1nTZBV2JFiSXnBGcjyiWIhHKtR4ED/F
         z+/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=Pq7uOM0R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 135si8694783ybf.156.2020.11.27.11.44.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 11:44:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=Pq7uOM0R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kijfE-0002S9-W1
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 14:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kijf5-0002Rf-US; Fri, 27 Nov 2020 14:44:07 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:48328 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kijf3-0006rD-DL; Fri, 27 Nov 2020 14:44:07 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E7B704138B;
 Fri, 27 Nov 2020 19:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606506241;
 x=1608320642; bh=a0kytVifZuKW1rmCOhh6DVbi8awCMrVi9z+F7ip5lOc=; b=
 Pq7uOM0Rh7ndXETnNSfTG8waYg3M/PGK+hCc79lrbaq/mBGbbmjfCklVTDTOC+u2
 xrxU1j9yoDueFBlIXRfxtc+oQ3qgPNofVZ/O7yBunU5i8VI56mfbyild0yKPccs7
 aQ8M+b7pb15pnGsnTYmTKccWRBSe3yukRYtnd+Y4DIE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X7zPBvqqb9oo; Fri, 27 Nov 2020 22:44:01 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id DF2E541386;
 Fri, 27 Nov 2020 22:44:00 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 27
 Nov 2020 22:44:00 +0300
Date: Fri, 27 Nov 2020 22:44:06 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH 1/8] hvf: Add hypervisor entitlement to output binaries
Message-ID: <20201127194406.GB56950@SPB-NB-133.local>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-2-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201126215017.41156-2-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ew48oIFKCkWU

On Thu, Nov 26, 2020 at 10:50:10PM +0100, Alexander Graf wrote:
> In macOS 11, QEMU only gets access to Hypervisor.framework if it has the
> respective entitlement. Add an entitlement template and automatically self
> sign and apply the entitlement in the build.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/entitlements.plist |  8 ++++++++
>  meson.build                  | 30 ++++++++++++++++++++++++++----
>  scripts/entitlement.sh       | 11 +++++++++++
>  3 files changed, 45 insertions(+), 4 deletions(-)
>  create mode 100644 accel/hvf/entitlements.plist
>  create mode 100755 scripts/entitlement.sh

Hi,

I think the patch should go ahead of other changes (with Paolo's fix for
^C) and land into 5.2 because entitlements are needed for x86_64 hvf too
since Big Sur Beta 3. Ad-hoc signing is very convenient for development.

Also, It might be good to have configure/meson option to disable signing
at all. Primarily for homebrew:

https://discourse.brew.sh/t/code-signing-installed-executables/2131/10

There's no established process how to deal with it, e.g. GDB in homebrew
has caveats section for now:

  ==> Caveats
  gdb requires special privileges to access Mach ports.
  You will need to codesign the binary. For instructions, see:

    https://sourceware.org/gdb/wiki/BuildingOnDarwin

The discussion on discourse mentions some plans to do signing in
homebrew CI (with real Developer ID) but none of them are implemented
now.

For now it'd be helpful to provide a way to disable signing and install
the entitlements (if one wants to sign after installation). Similar
issue was raised to fish-shell a while ago:

https://github.com/fish-shell/fish-shell/issues/6952
https://github.com/fish-shell/fish-shell/issues/7467

> 
> diff --git a/accel/hvf/entitlements.plist b/accel/hvf/entitlements.plist
> new file mode 100644
> index 0000000000..154f3308ef
> --- /dev/null
> +++ b/accel/hvf/entitlements.plist
> @@ -0,0 +1,8 @@
> +<?xml version="1.0" encoding="UTF-8"?>
> +<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
> +<plist version="1.0">
> +<dict>
> +    <key>com.apple.security.hypervisor</key>
> +    <true/>
> +</dict>
> +</plist>
> diff --git a/meson.build b/meson.build
> index 5062407c70..2a7ff5560c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1844,9 +1844,14 @@ foreach target : target_dirs
>      }]
>    endif
>    foreach exe: execs
> -    emulators += {exe['name']:
> -         executable(exe['name'], exe['sources'],
> -               install: true,
> +    exe_name = exe['name']
> +    exe_sign = 'CONFIG_HVF' in config_target

I don't have Apple Silicon HW but it may require different kind of
entitlements for CONFIG_TCG:

https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon

Thanks,
Roman

> +    if exe_sign
> +      exe_name += '-unsigned'
> +    endif
> +
> +    emulator = executable(exe_name, exe['sources'],
> +               install: not exe_sign,
>                 c_args: c_args,
>                 dependencies: arch_deps + deps + exe['dependencies'],
>                 objects: lib.extract_all_objects(recursive: true),
> @@ -1854,7 +1859,24 @@ foreach target : target_dirs
>                 link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
>                 link_args: link_args,
>                 gui_app: exe['gui'])
> -    }
> +
> +    if exe_sign
> +      exe_full = meson.current_build_dir() / exe['name']
> +      emulators += {exe['name'] : custom_target(exe['name'],
> +                   install: true,
> +                   install_dir: get_option('bindir'),
> +                   depends: emulator,
> +                   output: exe['name'],
> +                   command: [
> +                     meson.current_source_dir() / 'scripts/entitlement.sh',
> +                     meson.current_build_dir() / exe['name'] + '-unsigned',
> +                     meson.current_build_dir() / exe['name'],
> +                     meson.current_source_dir() / 'accel/hvf/entitlements.plist'
> +                   ])
> +      }
> +    else
> +      emulators += {exe['name']: emulator}
> +    endif
>  
>      if 'CONFIG_TRACE_SYSTEMTAP' in config_host
>        foreach stp: [
> diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
> new file mode 100755
> index 0000000000..7ed9590bf9
> --- /dev/null
> +++ b/scripts/entitlement.sh
> @@ -0,0 +1,11 @@
> +#!/bin/sh -e
> +#
> +# Helper script for the build process to apply entitlements
> +
> +SRC="$1"
> +DST="$2"
> +ENTITLEMENT="$3"
> +
> +rm -f "$2"
> +cp -a "$SRC" "$DST"
> +codesign --entitlements "$ENTITLEMENT" --force -s - "$DST"
> -- 
> 2.24.3 (Apple Git-128)
> 
> 

