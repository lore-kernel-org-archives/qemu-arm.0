Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1197383ejv;
        Thu, 28 Mar 2024 08:13:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0UTX9hVn2AbgY42cCIOTaqXWTo3DOuKIhCT1LUiSQsJmtQT0boDYiRnknvvQD7a26Ce52qJumhwLK7HDVCxuacjoJiOzY
X-Received: by 2002:a2e:808f:0:b0:2d6:f16a:857f with SMTP id i15-20020a2e808f000000b002d6f16a857fmr2266784ljg.0.1711638839501;
        Thu, 28 Mar 2024 08:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711638839; cv=none;
        d=google.com; s=arc-20160816;
        b=etWTTjV2hcE1hWN0WPZEykxL5/e2/IL4x/jcnlGiouxu7NCmYlBwIuQm80fuw+qGUH
         cEPK01uffgS0UKTTvFCx+0ww4JbRLKbZFie8j9CDXOKgyNqE2EudqjumhBUfRzQ+RIEA
         OnqNnAguWHCXJ1PLGbW/YQ3xKDPth7mReitRBqyzNAqNRZP3ndI0w5MLDLkBAyFPM8DE
         zQZEplkf/dOWZdJXg9aRqw+pLnh/uOItvJ4LGJxdjBgJ95Wo8AIxxhRSMpHsljIWd3Pn
         +1T+TmcLoyf1S1SP7hGQmncuK2IRbPlPM5S+AJ67TXwxoonWwrKxfK3zIWHqd51Lmevf
         rgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Vutwe9uQNhqbkQuib/VJsrR0Y5T7DY7pGtessWbxb5I=;
        fh=qO1HLve0wLKGsmfcaMLirAXYMOpB8t4EnEWzJ1TqHGk=;
        b=MxwhH8cfFdUu3aWG48mff1Lwb27ql9+O/R1vEAxWdlz6eP/aK8M4aYnr9vYYYlXvIu
         SoWHZ82qHFhaAXiQtM2+Yi5VItE/gFGXHj9qqG+NIYRotJeLiAU02BaCIuUKJiEQ2sy+
         IhtyPNAm6OVs5YVxQtN3QNppbLI7MNMOEuYZSSA93XIUeRvj+qUJOMkThiiFDRMr6Zcj
         IMDDS/NnlQ4Ilu3SOrklfMdKbUMOuSHuF4UVcf5XSSLibXyh8afaiBTiPEgccdMknIcf
         mjV1ZvWVneD2I+hjlbOoKi+qFOdLZjB0x5m7OFFB8jc7jdFE9FXfCyluQ5L75e2uwgNR
         ECkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=ha8lRBVN;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
Return-Path: <anthony.perard@cloud.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d34-20020a05600c4c2200b00414128eed8asor469395wmp.2.2024.03.28.08.13.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Mar 2024 08:13:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=ha8lRBVN;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711638839; x=1712243639; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vutwe9uQNhqbkQuib/VJsrR0Y5T7DY7pGtessWbxb5I=;
        b=ha8lRBVN78zr5g7kQd1xgr/c4BQW/kKL0Z227bkc4L9Wt0323pu4k7zM6Wc+Sbsm2L
         ydTIaEaGm+ndRb0CRM2JkH1XLaOSgH9ckyfCs3+30MVSrCXVIhE9L0s/Jhzzwl1UNpJA
         mF2a2mEqbu4ZiCuUfCQ6pnq2upKLd7M4hEPeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638839; x=1712243639;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vutwe9uQNhqbkQuib/VJsrR0Y5T7DY7pGtessWbxb5I=;
        b=WAmQ6Qv025zQaLl+8O7h2lG/CGk5pnO7PSdsL8U8Jmo288nX5LcWJxQYzMeygxZoq7
         3Xl8zbQxFWtUwaFt9bILF7pG1HgfnJT3ExNMA9YqprcATIAJBXncP6TUxQszbLUPGhM2
         hGJtCaLRlKLnx+iCOzx+VCnD8xno5rkXqk3OqodGPW5u3O7krqmG1uScIa0KcyUwXxzm
         /P6aOsicRPloMam35y62LDQulroHBRYepHW87k9UawOOmPc77f68EjLbPMpUSDQmw56g
         10ks6DlEqUuVe0j+/VvM8zZtURc/x3Gq1mb8HgUW5tOfmeuYzDdL/rB3ayGewyORhA9C
         Z/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEFsuTYde1NGSVdJw2SPfWWoBLDsT3umhAg554bhm1U0bs+2Ud1rgGJXbYJbDXoEbMtvbqeQreBEpxCkARvr6XS85pRe30
X-Gm-Message-State: AOJu0YxLapoL0fN7f1SJJt2kizpmjmxRGFtFCcku2Gv8KeUwfRWMkwIM
	1EZBObysUdg8xeJq4dgNQdexGY/EOYUtATtTwCaX+7qGQO2g1al/LWTETtmrBAA=
X-Google-Smtp-Source: AGHT+IGqAinQBfrXGU5/mTtpVN5DvsCj7MjTmxxo3BTpBz9VwcwzSMIjsSrbfaQrLhnH/z44soQEMQ==
X-Received: by 2002:adf:e9cf:0:b0:341:bf20:c840 with SMTP id l15-20020adfe9cf000000b00341bf20c840mr2502075wrn.11.1711638839070;
        Thu, 28 Mar 2024 08:13:59 -0700 (PDT)
Return-Path: <anthony.perard@cloud.com>
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id ea2-20020a0560000ec200b003432d79876esm1947746wrb.97.2024.03.28.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 08:13:52 -0700 (PDT)
Date: Thu, 28 Mar 2024 15:13:51 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH-for-9.0 v2 19/19] hw/xen: Have most of Xen files become
 target-agnostic
Message-ID: <83ff9fec-2ac1-418f-ac76-2256d03e676e@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-20-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-20-philmd@linaro.org>
X-TUID: dBV7rzJUs+3C

On Tue, Nov 14, 2023 at 03:38:15PM +0100, Philippe Mathieu-Daudé wrote:
> Previous commits re-organized the target-specific bits
> from Xen files. We can now build the common files once
> instead of per-target.
> 
> Only 4 files call libxen API (thus its CPPFLAGS):
> - xen-hvm-common.c,
> - xen_pt.c, xen_pt_graphics.c, xen_pt_msi.c
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Reworked since v1 so dropping David's R-b tag.
> ---
>  accel/xen/meson.build          |  2 +-
>  hw/block/dataplane/meson.build |  2 +-
>  hw/xen/meson.build             | 21 ++++++++++-----------
>  3 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/accel/xen/meson.build b/accel/xen/meson.build
> index 002bdb03c6..455ad5d6be 100644
> --- a/accel/xen/meson.build
> +++ b/accel/xen/meson.build
> @@ -1 +1 @@
> -specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
> +system_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
> diff --git a/hw/block/dataplane/meson.build b/hw/block/dataplane/meson.build
> index 025b3b061b..4d8bcb0bb9 100644
> --- a/hw/block/dataplane/meson.build
> +++ b/hw/block/dataplane/meson.build
> @@ -1,2 +1,2 @@
>  system_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
> -specific_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
> +system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index d887fa9ba4..403cab49cf 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -7,26 +7,25 @@ system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
>    'xen_pvdev.c',
>  ))
>  
> -system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
> +system_ss.add(when: ['CONFIG_XEN'], if_true: files(
>    'xen-operations.c',
> -))
> -
> -xen_specific_ss = ss.source_set()
> -xen_specific_ss.add(files(
>    'xen-mapcache.c',
> +))
> +system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
>    'xen-hvm-common.c',
>  ))
> +
>  if have_xen_pci_passthrough
> -  xen_specific_ss.add(files(
> +  system_ss.add(when: ['CONFIG_XEN'], if_true: files(
>      'xen-host-pci-device.c',
> -    'xen_pt.c',
>      'xen_pt_config_init.c',
> -    'xen_pt_graphics.c',
>      'xen_pt_load_rom.c',
> +  ))
> +  system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
> +    'xen_pt.c',
> +    'xen_pt_graphics.c',

How is it useful to separate those source files? In the commit
description, there's a talk about "CPPFLAGS", but having `when: [xen]`
doesn't change the flags used to build those objects, so the talk about
"CPPFLAGS" is confusing.
Second, if for some reason the dependency `xen` is false, but
`CONFIG_XEN` is true, then we wouldn't be able to build QEMU. Try
linking a binary with "xen_pt_config_init.o" but without "xen_pt.o",
that's not going to work. So even if that first source file doesn't
directly depend on the Xen libraries, it depends on "xen_pt.o" which
depends on the Xen libraries. So ultimately, I think all those source
files should have the same condition: ['CONFIG_XEN', xen].

I've only checked the xen_pt* source files, I don't know if the same
applies to "xen-operations.c" or "xen-mapcache.c".

Beside this, QEMU built with Xen support still seems to works fine, so
adding the objects to `system_ss` instead of `specific_ss` seems
alright.

Thanks,

-- 
Anthony PERARD
