Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1204741wrp;
        Thu, 14 Feb 2019 08:56:41 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY+gohdNxiD/lfFEzSHMKRpX3ya7H0So/R5ftkFmr7remREN+iu+fqAleszH+hMVDfVMSED
X-Received: by 2002:a81:1491:: with SMTP id 139mr4082669ywu.476.1550163401181;
        Thu, 14 Feb 2019 08:56:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550163401; cv=none;
        d=google.com; s=arc-20160816;
        b=vJgtZChHclhORTROe0KISZu68o2SgynGYq37/c3SHaeTD41HMWFd7c4rCsS1y593Ez
         8EBedrsGvXYdw6V+6DfD/SQymrqPYB4nj1YVV/ToR+1bzhdcP43Dj33cHEsVeczEYLCo
         gXZ4t4XWWW3jagFuB+c5dpxK7MJ3G/ktKFi4g1exp3+p329NBW4V7lVyaKEe/m6FOr1T
         Pd8YwtiSebIHNB/0ud1UOF5mVTQwoOnaeHKXUeWGGzeVBk3aJ0fCx0horCVd/L3K5vkz
         hnYPxTofrYpdlurPW2XVNPVW2w34wG8e/jgqs1AwbGBPXf/rRtDUEq+i/HVQcAps5TUl
         Tuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B9MrRcMlhBRGeV7xgAGUNsb0OQp/qYRg6FkaHq9wuc0=;
        b=sjPYTMm0rTAgf++aFRrC2dJ2hd9rXKb8x89H5eep7MaAN/AcLZ9402SPtMgh8iS6qk
         SSj7LpWx/pxdH8S1iGkNcGtimwnvo8hEfCfCJvQJVAPZQWXvuR8s9FxDIRhMJ82DJKz0
         iiQrpdq1ICLaIx8VjfCsmNqxcA6Ucn6oAsoR/raFMfuLPAINKjpckH9r2aw/eEE8DmOO
         Rvuavuukv/D1/Y72G0VFv0dq2icE1SckWNJt9QXSef7wNsUGe6s0DDrVeD6phY21/5oE
         64J+TSoDvYsm2jrHaRXXLZX7d7Y/+lvxvm9wvyNXKJvJwFY3TEe9m7ebjJu771q+5ufn
         xiRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VxXmgCpq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f38si1746831ybi.388.2019.02.14.08.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 08:56:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VxXmgCpq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51475 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guKJU-0007vX-LM
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 11:56:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKD6-0003SP-No
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 11:50:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKD2-0005RC-RL
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 11:50:02 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40421)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guKD1-0004sJ-RK
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 11:50:00 -0500
Received: by mail-ot1-x342.google.com with SMTP id s5so11596679oth.7
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B9MrRcMlhBRGeV7xgAGUNsb0OQp/qYRg6FkaHq9wuc0=;
	b=VxXmgCpqKi4ebkJPVYulQ9OmK/xwGEcYhSpA6oK+vlz+C5E/uUYw8nwCbGNAw0yUEp
	LKsDLWLQhJ4TvR11m86QOQyAwKKU42OAcWuVLMUwbxRVub8W+5HwwHGPSEd724oVIoY3
	/QSNrlGQGHBw26UZbtZj5IsmMlJIavC8+RSUV7hRt2mz4NNt/aDy6sSlZgd/kLycjmuZ
	ih+s9GBGhWLp/imD5gl3gWbHk4+LL6Y1oIy+UFMIkzD6W+tpO81eh/FZ6E+XhLC703Yd
	mdSenSil9GaQ3o4iaU3K6HQ8iVBkajjE2u+x2HjfsdN0Oz/H3zK1jXYOGC4XtOuwuC/u
	m4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B9MrRcMlhBRGeV7xgAGUNsb0OQp/qYRg6FkaHq9wuc0=;
	b=cjn0hRKKWLuKlK7Fg2CEssDPUcjsiWRsXZb8tXoTUPgfNQMrxmofgkz4VjF8G0P2fH
	jSfCA17z3XqQzsuwnnM/MI+lvzT12RToIuPDGkHDuv1pjouKfjC7z4IoMcEtDtvCE1J2
	YzMcc3V6/dqOmBCLO6wUUNNe2asJp38WRTweltOjcC0zhFtq+N1qTxjHa9oZvUoYHb4y
	jbLiP/Bq5FvelKvjb4oqIXaaRqx51fBBbx1NVlsRq4NVhXyXrjah6LF0tnLPcQsQNSDZ
	pwEX4CVy0/fbQ3OccHcevOMg4o7d5lqsmj3e7H0CJ++OiP721mOozENi2DRuKzoiziDa
	nrhg==
X-Gm-Message-State: AHQUAuZZgdMuZNrOfsZhLSa7314Fvov06k+0Y6GtwCmzvklOBc4X7RY2
	fmbe7W2hxXVljT8F2vnTko9wkIILKo4KGINPqVpLrg==
X-Received: by 2002:aca:ab11:: with SMTP id u17mr3031801oie.98.1550162962689; 
	Thu, 14 Feb 2019 08:49:22 -0800 (PST)
MIME-Version: 1.0
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-4-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 16:49:11 +0000
Message-ID: <CAFEAcA9JZG+SrzRfgSF9u+H6xPC9WT7=hO786bdn98EQGZfczw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v6 03/18] hw/arm/boot: introduce
 fdt_add_memory_node helper
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cIbxcwvNdtx7

On Tue, 5 Feb 2019 at 17:33, Eric Auger <eric.auger@redhat.com> wrote:
>
> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>
> We introduce an helper to create a memory node.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/boot.c | 54 ++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 34 insertions(+), 20 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 05762d0fc1..2ef367e15b 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -423,6 +423,36 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
>      }
>  }
>
> +static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
> +                               uint32_t scells, hwaddr mem_len,
> +                               int numa_node_id)
> +{
> +    char *nodename = NULL;

You set nodename immediately below, so no need for the NULL initialization here.

> +    int ret;
> +
> +    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> +    ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
> +                                       scells, mem_len);
> +    if (ret < 0) {
> +        fprintf(stderr, "couldn't set %s/reg\n", nodename);
> +        goto out;
> +    }

I think error handling (ie whether we print messages or not) ought to be
done by the calling function, rather than here.

> +    if (numa_node_id < 0) {

What is this for? My original theory was that this was an error
case that should probably be an assert(), but we seem to use it
in one of the callers below. A brief comment at the top of the
function documenting its API would assist here. If this is
"only set the NUMA ID if it is specified" then I think writing it as
  if (numa_node_id >= 0) {
     set the id;
  }

is clearer than making it look like an error-exit check.

> +        goto out;
> +    }
> +
> +    ret = qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", numa_node_id);
> +    if (ret < 0) {
> +        fprintf(stderr, "couldn't set %s/numa-node-id\n", nodename);
> +    }
> +
> +out:
> +    g_free(nodename);
> +    return ret;
> +}
> +
>  static void fdt_add_psci_node(void *fdt)
>  {
>      uint32_t cpu_suspend_fn;
> @@ -502,7 +532,6 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      void *fdt = NULL;
>      int size, rc, n = 0;
>      uint32_t acells, scells;
> -    char *nodename;
>      unsigned int i;
>      hwaddr mem_base, mem_len;
>      char **node_path;
> @@ -576,35 +605,20 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          mem_base = binfo->loader_start;
>          for (i = 0; i < nb_numa_nodes; i++) {
>              mem_len = numa_info[i].node_mem;
> -            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> -            qemu_fdt_add_subnode(fdt, nodename);
> -            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> -            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> -                                              acells, mem_base,
> -                                              scells, mem_len);
> +            rc = fdt_add_memory_node(fdt, acells, mem_base,
> +                                     scells, mem_len, i);
>              if (rc < 0) {
> -                fprintf(stderr, "couldn't set %s/reg for node %d\n", nodename,
> -                        i);
>                  goto fail;
>              }
>
> -            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
>              mem_base += mem_len;
> -            g_free(nodename);
>          }
>      } else {
> -        nodename = g_strdup_printf("/memory@%" PRIx64, binfo->loader_start);
> -        qemu_fdt_add_subnode(fdt, nodename);
> -        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> -
> -        rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> -                                          acells, binfo->loader_start,
> -                                          scells, binfo->ram_size);
> +        rc = fdt_add_memory_node(fdt, acells, binfo->loader_start,
> +                                 scells, binfo->ram_size, -1);
>          if (rc < 0) {
> -            fprintf(stderr, "couldn't set %s reg\n", nodename);
>              goto fail;
>          }
> -        g_free(nodename);
>      }
>
>      rc = fdt_path_offset(fdt, "/chosen");
> --
> 2.20.1
>

thanks
-- PMM
