Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp72224njl;
        Tue, 8 Oct 2024 02:50:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVVKS7Wjp4jG+IU9Wwg4uiMEZzCO0fSEStxRsfuU4p2TYxfF12kGT3EzFK92ikDssErjpM/uE1PD2T5A==@linaro.org
X-Google-Smtp-Source: AGHT+IH/ILvXTVNfpPywdlNwVvjpIyTz9hhvgJi/caBDfor1s7HdLnAnptWiQA214g+3THijHncV
X-Received: by 2002:a05:600c:450f:b0:42b:afe3:e9f4 with SMTP id 5b1f17b1804b1-42f85aa3965mr110052665e9.3.1728381058238;
        Tue, 08 Oct 2024 02:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728381058; cv=none;
        d=google.com; s=arc-20240605;
        b=LNnkc29dKxyzJ0jLmiz+m/ZYJt/+v7Ftfqzh9YJ7g6yEvwn853eE9a/ZPn9GMBi+oN
         jVNb/dOsqLnO5a8Kf9udLDJeQ/5io7rJ+8VSk/ajo6/oqnd+UB4PYwyvc1ywialITT5k
         RsiXPJTDHIDUo0RId3Kmz50uRfjTg0BuDpj+PFWYuTO3p5fYvhP5KNbETJIubOz61d+/
         rXK74+qA7U5DROe/X+GtwvU34laMtar2LiiXq+dNDaZjHOLIzbVk1z0CnZS7FzaFYQ6E
         wSwg+pQ1vwmWGP9uFpULRLHNHwf0ICWZuWWHcVLGxAhuvM3GaXiT/UmiEYgdVo186TyR
         z1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=tTxNM9ap3k7loCj8VtXZA9v13Kui+77ajQREWxhXA1Q=;
        fh=i67y20WhMIajIU6LRj9RX8HIHHlxm8AArte7kFnVDDg=;
        b=ItkR/nbxo8fjK0pwB1AfB5cpzbzFpu6rBVnKN2hqSQjdxnCcoiQy2EOFlGrseuo3No
         mlTKV4n6x9WzXtpGEADm3XlbsReWI2hBhdqsswnBcsTGnjeECkufsLjp7qBVgFCZuxrg
         GaglXKzIOaV2+T+C8C2P2P/0SMS+r4oYhi6MtM1CZxTcHUAQbHXQijK+ZNoN22jT1XlI
         gBgpWPrr6DrRFuTowPbpNik4G0z5C8u1uK9qOxIrFux1TRk/UzFdZPwny/KGEt5VC55w
         su5tfI5puivYbowVnrC9t6jIzEFnVFbtBPdLOwoVtZNh1I/meJc6nxLGsyu/H6rcdN1s
         ekBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42f86b52362si45807575e9.232.2024.10.08.02.50.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 02:50:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNB7q1w2sz6G9Mf;
	Tue,  8 Oct 2024 17:49:43 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 56C811402C6;
	Tue,  8 Oct 2024 17:50:57 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 8 Oct
 2024 11:50:55 +0200
Date: Tue, 8 Oct 2024 10:50:53 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P . =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=
 =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang
	<wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Sergio Lopez <slp@redhat.com>, Jason Wang
	<jasowang@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "Anthony
 PERARD" <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E .
 Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
	<qemu-devel@nongnu.org>, <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>,
	"Zhenyu Wang" <zhenyu.z.wang@intel.com>, Dapeng Mi
	<dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [RFC v2 03/12] system/vl: Create CPU topology devices from CLI
 early
Message-ID: <20241008105053.000059ee@Huawei.com>
In-Reply-To: <20240919061128.769139-4-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
	<20240919061128.769139-4-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 3Dwk/EHvz9pU

On Thu, 19 Sep 2024 14:11:19 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Custom topology will allow user to build CPU topology from CLI totally,
> and this replaces machine's default CPU creation process (*_init_cpus()
> in MachineClass.init()).
> 
> For the machine's initialization, there may be CPU dependencies in the
> remaining initialization after the CPU creation.
> 
> To address such dependencies, create the CPU topology device (including
> CPU devices) from the CLI earlier, so that the latter part of machine
> initialization can be separated after qemu_add_cli_devices_early().
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Other than question of type of category from previous patch this looks
fine to me.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

However, needs review from others more familiar with this code!
> ---
>  system/vl.c | 55 +++++++++++++++++++++++++++++++++++------------------
>  1 file changed, 36 insertions(+), 19 deletions(-)
> 
> diff --git a/system/vl.c b/system/vl.c
> index c40364e2f091..8540454aa1c2 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -1211,8 +1211,9 @@ static int device_help_func(void *opaque, QemuOpts *opts, Error **errp)
>  static int device_init_func(void *opaque, QemuOpts *opts, Error **errp)
>  {
>      DeviceState *dev;
> +    long *category = opaque;
>  
> -    dev = qdev_device_add(opts, NULL, errp);
> +    dev = qdev_device_add(opts, category, errp);
>      if (!dev && *errp) {
>          error_report_err(*errp);
>          return -1;
> @@ -2623,6 +2624,36 @@ static void qemu_init_displays(void)
>      }
>  }
>  
> +static void qemu_add_devices(long *category)
> +{
> +    DeviceOption *opt;
> +
> +    qemu_opts_foreach(qemu_find_opts("device"),
> +                      device_init_func, category, &error_fatal);
> +    QTAILQ_FOREACH(opt, &device_opts, next) {
> +        DeviceState *dev;
> +        loc_push_restore(&opt->loc);
> +        /*
> +         * TODO Eventually we should call qmp_device_add() here to make sure it
> +         * behaves the same, but QMP still has to accept incorrectly typed
> +         * options until libvirt is fixed and we want to be strict on the CLI
> +         * from the start, so call qdev_device_add_from_qdict() directly for
> +         * now.
> +         */
> +        dev = qdev_device_add_from_qdict(opt->opts, category,
> +                                         true, &error_fatal);
> +        object_unref(OBJECT(dev));
> +        loc_pop(&opt->loc);
> +    }
> +}
> +
> +static void qemu_add_cli_devices_early(void)
> +{
> +    long category = DEVICE_CATEGORY_CPU_DEF;
> +
> +    qemu_add_devices(&category);
> +}
> +
>  static void qemu_init_board(void)
>  {
>      /* process plugin before CPUs are created, but once -smp has been parsed */
> @@ -2631,6 +2662,9 @@ static void qemu_init_board(void)
>      /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
>      machine_run_board_init(current_machine, mem_path, &error_fatal);
>  
> +    /* Create CPU topology device if any. */
> +    qemu_add_cli_devices_early();
> +
>      drive_check_orphaned();
>  
>      realtime_init();
> @@ -2638,8 +2672,6 @@ static void qemu_init_board(void)
>  
>  static void qemu_create_cli_devices(void)
>  {
> -    DeviceOption *opt;
> -
>      soundhw_init();
>  
>      qemu_opts_foreach(qemu_find_opts("fw_cfg"),
> @@ -2653,22 +2685,7 @@ static void qemu_create_cli_devices(void)
>  
>      /* init generic devices */
>      rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
> -    qemu_opts_foreach(qemu_find_opts("device"),
> -                      device_init_func, NULL, &error_fatal);
> -    QTAILQ_FOREACH(opt, &device_opts, next) {
> -        DeviceState *dev;
> -        loc_push_restore(&opt->loc);
> -        /*
> -         * TODO Eventually we should call qmp_device_add() here to make sure it
> -         * behaves the same, but QMP still has to accept incorrectly typed
> -         * options until libvirt is fixed and we want to be strict on the CLI
> -         * from the start, so call qdev_device_add_from_qdict() directly for
> -         * now.
> -         */
> -        dev = qdev_device_add_from_qdict(opt->opts, NULL, true, &error_fatal);
> -        object_unref(OBJECT(dev));
> -        loc_pop(&opt->loc);
> -    }
> +    qemu_add_devices(NULL);
>      rom_reset_order_override();
>  }
>  
