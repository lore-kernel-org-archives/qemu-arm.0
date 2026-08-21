Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBECC5DF81
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 01:39:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxEE1-0003P7-5Y; Thu, 20 Aug 2026 21:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeuk20.kim@gmail.com>)
 id 1wxEE0-0003OJ-FK
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 21:39:16 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jeuk20.kim@gmail.com>)
 id 1wxEDy-0002IB-V7
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 21:39:16 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-395cf2535acso22435a91.1
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 18:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787276353; x=1787881153; darn=nongnu.org;
 h=message-id:date:references:in-reply-to:cc:to:subject
 :content-transfer-encoding:content-type:mime-version:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=sS5teeV0L1N5cqks17enGc8q90XbDEHWweqKaW5VI1Q=;
 b=MpqJGFjU1vwuanlhIMfoOBULRPAIM3bD1G4/Gw+xoOoaQNLAeaJ20D6+DmK7jgisx0
 8ry5RQ9NeedpQkOxJH7icamGoLDhGuNyRS5HTBbIc1ZfpdrfIPEUNFamcEO+n3vN/b06
 RYZjrpGBUzj+VAMWkCP9aLFDaYPg6od6ee1gbOppEhz9IghCtGA5rnbJBuvAsXr8fRMv
 jht22HIyUhIJcIMWnhSd8I7SJxZ6OL0EOx5w8TU4LHWgIvEqIJ2okIo1O8oiF+Q4HHbU
 ZYG9+iDbFhYTAxco3JSrYyopl7Vqd+8Al2RFyxsrNlKhObl8HrGQ6VLf4XMe2gQlul6Z
 Go2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787276353; x=1787881153;
 h=message-id:date:references:in-reply-to:cc:to:subject
 :content-transfer-encoding:content-type:mime-version:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sS5teeV0L1N5cqks17enGc8q90XbDEHWweqKaW5VI1Q=;
 b=rvs8lPakQlRj+rZ94y269R10sJHxuaDx+tEJ+YBU3XtY8Fw8eWP4ftqNPT0p4ur8lO
 gNqEznDvTA7KtTy+6CbdMtf7W0UolZxDeB+u1ivrIwd3UK2UBewo7YI26rA1kvZr2QTk
 CNpfYz5E6NHtEY5qfLY3d6W4ug/uL8E9kFCUVUdrVZfcGpvwm1h2e/a5YwXP4TywsB4b
 jZK84PnTJWhz85/avlBAj+z+ECoUg13fP10qH3kYh0CL35SdAjhIa1SUcsdIkGV2IsxS
 w2glVCgc2mdfQ6aOYIAKUCiQMj+7I/jhEMSpmbfiv93DKa86kxmH/ldGy5ubSfo71zhK
 eNSQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpzVd8vW7wBXHPDEWBWKF0g0PXZwSghH6S4xZS2WNJ655xvsPRS+iKPekvkU85cvXDM2aY3rUANOQ==@nongnu.org
X-Gm-Message-State: AFuF++lxi9pCLtjTe0HLOukON9VQTAAiAGO+EhmiBKeNXRCXYwEZRxlG
 2QAkO1ubFD0OgktCdsQHTfPyl2r+vNB00HQN6HaMVL+HUGzVYuLMjnP4
X-Gm-Gg: AR+sD11Nu3zpWmor4FRzCv7bddAktOLXOSdbAujhhHoCNlAGwjpd0CaWkmrBD3O3bkb
 MMo4I/Zg8e46BKHdMRhI3+MSfaXdLXfBRvEUCvZvHV15QahfoBHXWroPAkrR5ZjZT1abbbi0fab
 ZUrnPCOFfR+1vAzXBKJykgndLioW4oG1pQyeYa13Yud6IhLT41Juoeekbj3I9d0HoKE+smCclcs
 N3ZgQbeRwzD+j0ZabgVB7oWoKiEQuEcbi85W0ZpUvO32Qy6m6cTLajLrLJMoOx4uK8B54lA2aaE
 eIg22LOTy5sh637A2VuK7fiiD1zkGrFg8Lg28PHJbzC9NdGkbBbp6IcH2pWrsto39fI/GNOD5TV
 35TeAQlyUyACcD1rMM7aDIjVKLceZcHllHIZiLUBn78RUhRkEObMxAcqWcWpzRfcZASpRvfrLns
 IVrWk4Val+HOOhyRRKhiVg8vUbMbY41yCzxwcnCvJEZnhh1bwUbN/HjWekpwf5EEaT
X-Received: by 2002:a17:90b:57c3:b0:395:8124:ac53 with SMTP id
 98e67ed59e1d1-395c4fa443fmr1938540a91.6.1787276353472; 
 Thu, 20 Aug 2026 18:39:13 -0700 (PDT)
Received: from [127.0.1.1] ([211.226.54.223]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4be666bsm981873a91.11.2026.08.20.18.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 18:39:12 -0700 (PDT)
From: Jeuk Kim <jeuk20.kim@gmail.com>
X-Google-Original-From: Jeuk Kim <jeuk20.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 6/7] ufs/aspeed: Add AST2700 UFS host controller
To: Mikail Sadic <mikail.sadic@ibm.com>
Cc: clg@kaod.org, peter.maydell@linaro.org, pbonzini@redhat.com, 
 ninad@linux.ibm.com, titusr@google.com, jeuk20.kim@samsung.com, 
 philmd@mailo.com, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, kane_chen@aspeedtech.com, 
 andrew@codeconstruct.com.au, joel@jms.id.au, calebs@linux.ibm.com, 
 milesg@linux.ibm.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 j-young.choi@samsung.com
In-Reply-To: <20260813193040.669533-7-mikail.sadic@ibm.com>
References: <20260813193040.669533-1-mikail.sadic@ibm.com>
 <20260813193040.669533-7-mikail.sadic@ibm.com>
Date: Fri, 21 Aug 2026 10:38:44 +0900
Message-Id: <178727632471.917875.628695860358940242.b4-review@b4>
X-Mailer: b4 0.15.2
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=jeuk20.kim@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 13 Aug 2026 14:30:38 -0500, Mikail Sadic <mikail.sadic@ibm.com> wrote:
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a9238e6217..c1052c74a8 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -187,6 +187,31 @@ static void aspeed_machine_init(MachineState *machine)
>      aspeed_connect_serial_hds_to_uarts(bmc);
>      qdev_realize(DEVICE(bmc->soc), NULL, &error_abort);
>  
> +    /*
> +     * If the SoC instantiated a UFS host controller (AST2700), attach the
> +     * first backend drive to it as logical unit 0.  The controller and its
> +     * UFS bus only exist once the SoC has been realized, so the ufs-lu is
> +     * created here rather than through a controller drive property.
> +     */
> +    if (object_resolve_path_component(OBJECT(bmc->soc), "ufs")) {

This appears to implicitly attach the first if=none backend to UFS LU
0. Why is this needed?

if=none backends are normally left unattached for explicit -device
use, so this may claim a drive intended for another device.

Wouldn't it be better to remove this and require users to attach
the LU explicitly, for example:
-drive if=none,id=ufs0,file=ufs.img,format=raw \
-device ufs-lu,bus=ufs-bus.0,drive=ufs0,lun=0

>
> diff --git a/hw/ufs/aspeed_ufs.c b/hw/ufs/aspeed_ufs.c
> new file mode 100644
> index 0000000000..bfe540b929
> --- /dev/null
> +++ b/hw/ufs/aspeed_ufs.c
> @@ -0,0 +1,67 @@
> [ ... skip 22 lines ... ]
> +struct AspeedUfsState {
> +    SysbusUfsState parent_obj;
> +};
> +
> +struct AspeedUfsClass {
> +    DeviceClass parent_class;

The parent class layout is SysBusDeviceClass, so this should be
`SysBusDeviceClass parent_class`

>
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index a00238ed74..dedc784926 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -62,6 +62,7 @@ struct AspeedMachineClass {
>      uint32_t uart_default;
>      bool sdhci_wp_inverted;
>      bool vbootrom;
> +    uint32_t ufs_block_size;

As noted on the previous patch, UFS does not permit 512-byte
logical blocks. Please drop this field and the corresponding 512-byte
configuration and documentation.

>
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index cd68c7f1ca..ae986dea12 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -118,6 +119,7 @@ struct AspeedSoCState {
>      AspeedAPB2OPBState fsi[2];
>      AspeedLTPIState ltpi_ctrl[ASPEED_IOEXP_NUM];
>      AspeedAST1700SoCState ioexp[ASPEED_IOEXP_NUM];
> +    SysbusUfsState ufs;

Since this child is initialized as TYPE_ASPEED_UFS, shouldn't this be
AspeedUfsState rather than SysbusUfsState?

-- 
Jeuk Kim <jeuk20.kim@samsung.com>

