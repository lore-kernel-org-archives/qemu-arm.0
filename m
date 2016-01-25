Received: by 10.25.159.19 with SMTP id i19csp1270836lfe;
        Mon, 25 Jan 2016 06:13:38 -0800 (PST)
X-Received: by 10.31.108.217 with SMTP id j86mr10763614vki.142.1453731218636;
        Mon, 25 Jan 2016 06:13:38 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x231.google.com (mail-vk0-x231.google.com. [2607:f8b0:400c:c05::231])
        by mx.google.com with ESMTPS id n66si18255347vke.61.2016.01.25.06.13.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2016 06:13:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::231 as permitted sender) client-ip=2607:f8b0:400c:c05::231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x231.google.com with SMTP id e64so74879881vkg.0
        for <alex.bennee@linaro.org>; Mon, 25 Jan 2016 06:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=t9u9pjd3Zk8TWqHnOn5dI8Ku0Tlv47t9yoFbiFm8Iz0=;
        b=JZTJtBDmJhzkJZbdxCACV1DRJEZYUTCeTYTZONR8ulvD+8+SFnVVttKf81xwrkpfr7
         nNgx4QLSEnSdy+G345As4JuamI5o2sVZy9J7WdTqL0Uq3WRRkbIIKQ7Bf1lvwD8NDoTU
         rcSCh6VUdbGDCFTvziPAG3pfIOXgs+r+0wxRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=t9u9pjd3Zk8TWqHnOn5dI8Ku0Tlv47t9yoFbiFm8Iz0=;
        b=A8cXQUC/68nbQzhgQymea/1VGfg0I58tgvzJ2hB1Omo4IOuDdWJoFUOKE1LcaRvEdV
         CJZUrglJNEBPSYX6zaE1wK4LtL46/xjl4xUaoh/KszPI/mGfvb1sbV6+pgy04bduc/me
         Ro0c8PCqZIyo76Sd1qUf7dVdu2t4R/+42mHK3uhAHQBMud7Q4Tq+vq+U/zNiOwiobOF4
         YNVRe85f5U1rO+oqQvpkkGDif4a2c1EzE7o6ofwL7XX+SZE9CC+QL7fyuUbMW/kZRG1U
         Rs0JlkyBSqC/XmJBNSFkeny48q/LLJzdikXs7sNByarbvNWO5dfbMGuaM4SdspDHLxHI
         136Q==
X-Gm-Message-State: AG10YOT3YjWs4gT3AeeJTJ06idtU2SXTT1Jzipr6gWVT6hC/Gu/rH4x9kpAVG3axPYb+q4Cgqlm/66rpj9rFPwtOpNM=
X-Received: by 10.31.141.2 with SMTP id p2mr11028584vkd.37.1453731218178; Mon,
 25 Jan 2016 06:13:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 25 Jan 2016 06:13:18 -0800 (PST)
In-Reply-To: <1453130204-655-3-git-send-email-eric.auger@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org> <1453130204-655-3-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2016 14:13:18 +0000
Message-ID: <CAFEAcA-9+muP4TjQnLk2XPAZsf=wRzsLSQbGuQhqrTxZpsz2xQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] device_tree: introduce load_device_tree_from_sysfs
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>, 
	Alex Williamson <alex.williamson@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
	Patch Tracking <patches@linaro.org>, Christoffer Dall <christoffer.dall@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Baptiste Reynal <b.reynal@virtualopensystems.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, thomas.lendacky@amd.com
Content-Type: text/plain; charset=UTF-8
X-TUID: SR0vnybJVAn8

On 18 January 2016 at 15:16, Eric Auger <eric.auger@linaro.org> wrote:
> This function returns the host device tree blob from sysfs
> (/proc/device-tree). It uses a recursive function inspired
> from dtc read_fstree.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>
> ---
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
>  device_tree.c                | 100 +++++++++++++++++++++++++++++++++++++++++++
>  include/sysemu/device_tree.h |   3 ++
>  2 files changed, 103 insertions(+)
>
> diff --git a/device_tree.c b/device_tree.c
> index a9f5f8e..b262c2d 100644
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
> @@ -117,6 +120,103 @@ fail:
>      return NULL;
>  }
>
> +#ifdef CONFIG_LINUX
> +
> +#define SYSFS_DT_BASEDIR "/proc/device-tree"
> +
> +/**
> + * read_fstree: this function is inspired from dtc read_fstree
> + * @fdt: preallocated fdt blob buffer, to be populated
> + * @dirname: directory to scan under SYSFS_DT_BASEDIR
> + * the search is recursive and the tree is searched down to the
> + * leafs (property files).

"leaves"

> + *
> + * the function self-asserts in case of error

"asserts"

> + */
> +static void read_fstree(void *fdt, const char *dirname)
> +{
> +    DIR *d;
> +    struct dirent *de;
> +    struct stat st;
> +    const char *root_dir = SYSFS_DT_BASEDIR;
> +    char *parent_node;
> +
> +    if (strstr(dirname, root_dir) != dirname) {
> +        error_report("%s: %s must be searched within %s",
> +                     __func__, dirname, root_dir);
> +        exit(1);

Why does this one error_report and exit but other errors below use
error_setg?

> +    }
> +    parent_node = (char *)&dirname[strlen(SYSFS_DT_BASEDIR)];

What causes us to need this cast to char* ?

> +
> +    d = opendir(dirname);
> +    if (!d) {
> +        error_setg(&error_fatal, "%s cannot open %s", __func__, dirname);

You need to return here (and similarly to bail out properly
in the other error paths below).

> +    }
> +
> +    while ((de = readdir(d)) != NULL) {
> +        char *tmpnam;
> +
> +        if (!g_strcmp0(de->d_name, ".")
> +            || !g_strcmp0(de->d_name, "..")) {
> +            continue;
> +        }
> +
> +        tmpnam = g_strjoin("/", dirname, de->d_name, NULL);
> +
> +        if (lstat(tmpnam, &st) < 0) {
> +            error_setg(&error_fatal, "%s cannot lstat %s", __func__, tmpnam);
> +        }
> +
> +        if (S_ISREG(st.st_mode)) {
> +            gchar *val;
> +            gsize len;
> +
> +            if (!g_file_get_contents(tmpnam, &val, &len, NULL)) {
> +                error_setg(&error_fatal, "%s not able to extract info from %s",
> +                           __func__, tmpnam);
> +            }
> +
> +            if (strlen(parent_node) > 0) {
> +                qemu_fdt_setprop(fdt, parent_node,
> +                                 de->d_name, val, len);
> +            } else {
> +                qemu_fdt_setprop(fdt, "/", de->d_name, val, len);
> +            }
> +            g_free(val);
> +        } else if (S_ISDIR(st.st_mode)) {
> +            char *node_name;
> +
> +            node_name = g_strdup_printf("%s/%s",
> +                                        parent_node, de->d_name);

I don't mind whether we use g_strjoin("/",...) or g_strdup_printf("%s/%s", ...)
to glue together strings with a '/' between them, but can we not use
both methods in the same function, please?

> +            qemu_fdt_add_subnode(fdt, node_name);
> +            g_free(node_name);
> +            read_fstree(fdt, tmpnam);
> +        }
> +
> +        g_free(tmpnam);
> +    }
> +
> +    closedir(d);
> +}
> +
> +/* load_device_tree_from_sysfs: extract the dt blob from host sysfs */
> +void *load_device_tree_from_sysfs(void)
> +{
> +    void *host_fdt;
> +    int host_fdt_size;
> +
> +    host_fdt = create_device_tree(&host_fdt_size);
> +    read_fstree(host_fdt, SYSFS_DT_BASEDIR);
> +    if (fdt_check_header(host_fdt)) {
> +        error_setg(&error_fatal,
> +                   "%s host device tree extracted into memory is invalid",
> +                   __func__);

Should we free the created device tree and return NULL here?

> +    }
> +    return host_fdt;
> +}
> +
> +#endif /* CONFIG_LINUX */
> +
>  static int findnode_nofail(void *fdt, const char *node_path)
>  {
>      int offset;
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 359e143..fdf25a4 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -16,6 +16,9 @@
>
>  void *create_device_tree(int *sizep);
>  void *load_device_tree(const char *filename_path, int *sizep);
> +#ifdef CONFIG_LINUX
> +void *load_device_tree_from_sysfs(void);

Can we have a doc comment for a new global function, please?

> +#endif
>
>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>                       const char *property, const void *val, int size);
> --
> 1.9.1

thanks
-- PMM
