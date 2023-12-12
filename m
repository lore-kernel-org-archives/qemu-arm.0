Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1075236ejo;
        Tue, 12 Dec 2023 09:41:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTPnVK3PhMjx6mdi4VdU4h3305FucWQrihDccB+DAGmKDgxDz6D14aTlaCb+qx8ae6QyE3
X-Received: by 2002:a05:6358:6f9e:b0:170:4ac0:f9ef with SMTP id s30-20020a0563586f9e00b001704ac0f9efmr9069246rwn.15.1702402885626;
        Tue, 12 Dec 2023 09:41:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702402885; cv=none;
        d=google.com; s=arc-20160816;
        b=xsWVcM5bHPIn24NjLxpGvyRo8Ph4t5eOwUJSMGVkTXbs1YLBIXvQGSa71k0TB9eNXZ
         U4A+n8lfre93D96isoQfYrh6dS7mOCTQU1kp9QoN+ln04PxZCBnO77GtmJ9u1h9hJosr
         QFJl363ad8gevyTB2NL++UWWgRhDhg48863U5VqJ7PcLiWH9Xqfse9ICiLjjrDnSgii9
         O/+0dGt9L/pxHiCfaKPIcixNQj1FtvUcRyRJGwGtA+JB5+Ffp1TKSEPS/oRRnYVdjXoO
         oDtQovbdpMT89jJAL7Qr+uS0YvUzfO8DA1fNJfqZOna+70RmA1FqAmdx7gTwdMQHd2/+
         tPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vZpKiARdHIYDUgHMhUJ1oqAMwHYO3JtCcG6S2WzVEG0=;
        fh=OvxsSc1PGY5Z5ELrkbN1hqRsN7mMM/aB5TwiNUvax40=;
        b=XTX7O47hxQAAMSz05CfIclD7lQT3c037Qx2lj08sADgmeqJkYTs2J23PKXZ112OmPQ
         n/bhC9wcLmWDH5i7E8MDovof9Ybp7NFxKQYesL7RYYU9a8X96zXY/RtzrE2w2ZccJjqN
         /sp4jb7mhIaXcyWuMQ2P8tKl+EWsFutPeuSsj1pu+yeCpmT8TLXQP/+HkN5KKfAll8ar
         XIuevlLRirc0E6i+8+81BkK46mdjx3KGJDMLDPWrIU0TIh18sqV3PmaVKd+zG/sQmX2U
         mY6DF58ZMWW3DVYtDEhr0lyVok5tciPb4SFfgOSGoAyJzGRRK5eoMb+Xz7qo5ipJvqcA
         JJtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yirdfbOa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb12-20020ad44f0c000000b0067ad2ad4dcdsi10877692qvb.183.2023.12.12.09.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 09:41:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yirdfbOa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rD6kW-0005Ux-AJ; Tue, 12 Dec 2023 12:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD6kV-0005UN-IB
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 12:40:51 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD6kS-0004d6-QS
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 12:40:51 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-54f4f7d082cso6406833a12.0
 for <qemu-arm@nongnu.org>; Tue, 12 Dec 2023 09:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702402847; x=1703007647; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vZpKiARdHIYDUgHMhUJ1oqAMwHYO3JtCcG6S2WzVEG0=;
 b=yirdfbOapUhRHwbCTDxp9dnR/bQQlGqAt65IrrXH53F0McbbLuFBAEsTy6vzsB/f9B
 lu25OoOakrvmMIxGgOjg/CqEcUYaK6nDjkG5iDM5J3JzSP3ed+KSO18iSFVBPD1f7f95
 DRUaM2RVvY139WzDxLKUGke8NzLFZS1YZwy0+CUvYZvHQd53cJCxwh1oguibyx3yvkfb
 /YEbtlAR8r3jRWwmKKd7V9+vtfT4N8bNThDI8FNl4BgkLyMz2s7AO/esEcWsQjs37LiI
 Jg1WUUdoc3cmLXBmqrHpeLKyFUiHxSuyZDBMNDR2chkGr/3Ts6CaUy0tKu+QTcOEOvRb
 NBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702402847; x=1703007647;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZpKiARdHIYDUgHMhUJ1oqAMwHYO3JtCcG6S2WzVEG0=;
 b=QW3QFmz/avYx3R4cZlFHFRJtYC4Ei6eUA9Owjejmxp0ycYy8EUh1SWkIVZAN418iBD
 gBLNrVajmbpGXGZpfjVKonYll7vSpR613Z8O4dGff6fmxLJ5GCQOHlt/HzWtU2bkkxhd
 zi0GuGb1Vt6j3qBIf9U0MklDwwsvFGzw0bfrpTa9mLuKqvbjKX/4ofjAz1ORlE+dK7oD
 YFTDlJZY/79rsIHvZbal5HJFBO7E2OiSgxYJaG81cXYq7Y99puXFHCrzt0J72gUnN55U
 UxylLpy4isjds1lt0wpVnrmts2U/15+BbA9kSJIWZAsCDdIOrofU+c9UzThvSYf5F1we
 ZvkA==
X-Gm-Message-State: AOJu0YwRLdfeSsbBR7ugr5v5tpNMLTP0kxaOhBnXBG7gD1tKDe4Fiyfq
 Q8CcNpO4lcpCuW10JFb26AN3RMgXRwIjj+8i/QKccQ==
X-Received: by 2002:a50:9e6d:0:b0:54c:b175:87bf with SMTP id
 z100-20020a509e6d000000b0054cb17587bfmr3742460ede.2.1702402846936; Tue, 12
 Dec 2023 09:40:46 -0800 (PST)
MIME-Version: 1.0
References: <20231205095226.2688032-1-sai.pavan.boddu@amd.com>
 <20231205095226.2688032-3-sai.pavan.boddu@amd.com>
In-Reply-To: <20231205095226.2688032-3-sai.pavan.boddu@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2023 17:40:35 +0000
Message-ID: <CAFEAcA_wLi4A7b3WSbTsd+EgBuTWPL878zQRPqfdgnfKTPVGUg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: xlnx-versal-virt: Add machine property ospi-flash
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, Francisco Iglesias <frasse.iglesias@gmail.com>,
 saipavanboddu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: TJHqfXXLO0vI

On Tue, 5 Dec 2023 at 09:52, Sai Pavan Boddu <sai.pavan.boddu@amd.com> wrote:
>
> This property allows users to change flash model on command line as
> below.
>
>    ex: "-M xlnx-versal-virt,ospi-flash=mt35xu02gbba"
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
> ---
>  hw/arm/xlnx-versal-virt.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 537118224f..c57cff74d8 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -49,6 +49,7 @@ struct VersalVirt {
>      struct {
>          bool secure;
>      } cfg;
> +    char *ospi_model;
>  };
>
>  static void fdt_create(VersalVirt *s)
> @@ -637,6 +638,22 @@ static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
>                             &error_fatal);
>  }
>
> +static char *versal_get_ospi_model(Object *obj, Error **errp)
> +{
> +    VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(obj);
> +
> +    return g_strdup(s->ospi_model);
> +}
> +
> +static void versal_set_ospi_model(Object *obj, const char *value, Error **errp)
> +{
> +    VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(obj);
> +
> +    g_free(s->ospi_model);
> +    s->ospi_model = g_strdup(value);
> +}
> +
> +
>  static void versal_virt_init(MachineState *machine)
>  {
>      VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(machine);
> @@ -736,7 +753,7 @@ static void versal_virt_init(MachineState *machine)
>
>          spi_bus = qdev_get_child_bus(DEVICE(&s->soc.pmc.iou.ospi), "spi0");
>
> -        flash_dev = qdev_new("mt35xu01g");
> +        flash_dev = qdev_new(s->ospi_model ? s->ospi_model : "mt35xu01g");
>          if (dinfo) {
>              qdev_prop_set_drive_err(flash_dev, "drive",
>                                      blk_by_legacy_dinfo(dinfo), &error_fatal);

This doesn't do any checking of the string the user passes,
which means the user can make us hit an abort() with a not
terribly helpful error message:

$ ./build/arm-clang/qemu-system-aarch64 -M xlnx-versal-virt,ospi-flash=bang
qemu-system-aarch64: unknown type 'bang'
Aborted (core dumped)

or complain about trying to create an abstract type:
$ ./build/arm-clang/qemu-system-aarch64 -M
xlnx-versal-virt,ospi-flash=m25p80-generic
**
ERROR:../../qom/object.c:525:object_initialize_with_type: assertion
failed: (type->abstract == false)
Bail out! ERROR:../../qom/object.c:525:object_initialize_with_type:
assertion failed: (type->abstract == false)
Aborted (core dumped)

or do some weird stuff if you pass it something that isn't a
flash device type name:

$ ./build/arm-clang/qemu-system-aarch64 -M xlnx-versal-virt,ospi-flash=e1000
Unexpected error in object_property_find_err() at ../../qom/object.c:1330:
qemu-system-aarch64: Property 'e1000.cs' not found
Aborted (core dumped)

I think you need to check that the string corresponds
to a type that actually exists and is a subtype of TYPE_M25P80
and isn't an abstract type.

thanks
-- PMM
