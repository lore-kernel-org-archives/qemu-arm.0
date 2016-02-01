Received: by 10.25.159.19 with SMTP id i19csp147803lfe;
        Mon, 1 Feb 2016 08:15:39 -0800 (PST)
X-Received: by 10.13.197.194 with SMTP id h185mr12211223ywd.12.1454343339498;
        Mon, 01 Feb 2016 08:15:39 -0800 (PST)
Return-Path: <robherring2@gmail.com>
Received: from mail-yk0-x22e.google.com (mail-yk0-x22e.google.com. [2607:f8b0:4002:c07::22e])
        by mx.google.com with ESMTPS id h128si11312637ywb.420.2016.02.01.08.15.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2016 08:15:39 -0800 (PST)
Received-SPF: pass (google.com: domain of robherring2@gmail.com designates 2607:f8b0:4002:c07::22e as permitted sender) client-ip=2607:f8b0:4002:c07::22e;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of robherring2@gmail.com designates 2607:f8b0:4002:c07::22e as permitted sender) smtp.mailfrom=robherring2@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yk0-x22e.google.com with SMTP id z13so53635965ykd.0;
        Mon, 01 Feb 2016 08:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=y9c4iX0xm6g6y9g32l+Q80wNf5WDDM0qkz0w1a1PzEo=;
        b=kHugK0VClg4JGcfqEzgi5svfkGdAbi2ukenzps4YcOWi1PhfgToZa37PeG7wTPWKjo
         aeWXCjwrO2ilf9oEAZaZ7A3g6k6SvpP4cYw4Gsmj/qPJYHte3H3eVTcwP3g3xC7Ffj57
         nxfA4EPxuANPKmMy+7yzqWnMI8JZmXxXXYRfTAuf2xoO65Zb5Ir8xfUH7k4ZrASmiF1n
         g3J6QUzj7inrGb4BdyoPezqJ4x8e9ZiKI2wj64j/0HyxsyzM8nI527bgc6Fq4x2PPSZM
         ugrwcM77Xo0znnoQi+od2ZXuowene5oZbR8MZbycKoOrC8uQQWk0gQSO2dkigBHfLAIW
         gK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=y9c4iX0xm6g6y9g32l+Q80wNf5WDDM0qkz0w1a1PzEo=;
        b=ZINtzRPOGHxgnp1Xf5fUyvoXHNtvMea/yFIPqmtXkVcgLSS7+mUBhBI1KQqZccJ1LH
         W6slZjyPaGtq9pFURty/kBRX57K4unvYZZ2h9A4MKtEuYK3bTuSdQjbreldvVLeCrgGF
         OpKKJ3kRgTS2k3ZBtIpJSP7n0mzBsHSENqX8kDiMwI1YwMxw4Ie+69DBX6K3YIN6waK0
         QAEGBiyCRb8u1/rr5Twn2+UOpMFzSC9HuN0Bk2LAce0MpxJjgvOO2v5izkiVZR67tUcp
         Jfg2XpuwsfwN5Q6X5ae92/QN67gyVy2fgBJKZ5kBT5EdUWxkEHrl3hcLLkitP+YTfWld
         qkdA==
X-Gm-Message-State: AG10YOQ4WDyjXUKq5TCqphyi8kF/2s///+wa7xH+7aayXkJU+0D+qoBb/9V50deKmjPyTLsLCb2J8D2AgLsVzQ==
X-Received: by 10.129.80.87 with SMTP id e84mr8501617ywb.198.1454343339007;
 Mon, 01 Feb 2016 08:15:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.153.19 with HTTP; Mon, 1 Feb 2016 08:15:19 -0800 (PST)
In-Reply-To: <1454334712-12360-3-git-send-email-eric.auger@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org> <1454334712-12360-3-git-send-email-eric.auger@linaro.org>
From: Rob Herring <robherring2@gmail.com>
Date: Mon, 1 Feb 2016 10:15:19 -0600
Message-ID: <CAL_JsqLdCLnOUcnZe+d9uXmWp6fneuwska28vAeaWi7VJ6sBiw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v6 2/8] device_tree: introduce load_device_tree_from_sysfs
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>, alex.williamson@redhat.com, 
	David Gibson <david@gibson.dropbear.id.au>, Thomas Lendacky <thomas.lendacky@amd.com>, thuth@redhat.com, 
	b.reynal@virtualopensystems.com, Linaro Patches <patches@linaro.org>, 
	Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
	Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Christoffer Dall <christoffer.dall@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: aVtzesmohWfs

On Mon, Feb 1, 2016 at 7:51 AM, Eric Auger <eric.auger@linaro.org> wrote:
> This function returns the host device tree blob from sysfs
> (/proc/device-tree). It uses a recursive function inspired
> from dtc read_fstree.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>
> ---
> v5 -> v6:
> - fix some spelling mistakes
> - error_report + exit replaced by error_setg
> - const char *parent_node;
> - use g_strdup_printf instead of g_strjoin
> - add a doc comment for load_device_tree_from_sysfs
> v1 -> v2:
> - do not implement/expose read_fstree and load_device_tree_from_sysfs
>   if CONFIG_LINUX is not defined (lstat is not implemeted in mingw)
> - correct indentation in read_fstree
> - use /proc/device-tree symlink instead of /sys/firmware/devicetree/base
>   path (kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw)
> - use g_file_get_contents in read_fstree
> - introduce SYSFS_DT_BASEDIR macro and use strlen
> - exit on error in load_device_tree_from_sysfs
> - user error_setg
>
> RFC -> v1:
> - remove runtime dependency on dtc binary and introduce read_fstree
> ---
>  device_tree.c                | 99 ++++++++++++++++++++++++++++++++++++++++++++
>  include/sysemu/device_tree.h |  8 ++++
>  2 files changed, 107 insertions(+)
>
> diff --git a/device_tree.c b/device_tree.c
> index a9f5f8e..3797182 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -17,6 +17,9 @@
>  #include <fcntl.h>
>  #include <unistd.h>
>  #include <stdlib.h>
> +#ifdef CONFIG_LINUX
> +#include <dirent.h>
> +#endif
>
>  #include "qemu-common.h"
>  #include "qemu/error-report.h"
> @@ -117,6 +120,102 @@ fail:
>      return NULL;
>  }
>
> +#ifdef CONFIG_LINUX
> +
> +#define SYSFS_DT_BASEDIR "/proc/device-tree"

Use the sysfs path (/sys/firmware/device-tree/ IIRC) as this is just a
symlink to sysfs and /proc is considered the legacy path.

Rob
