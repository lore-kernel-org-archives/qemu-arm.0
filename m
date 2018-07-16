Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1960289wru;
        Mon, 16 Jul 2018 14:54:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdPW8K8pCXQ8PkUyiD3PUDFal18l0vblYbMYijepH/iSGOFpWeCg+Lmx4gqau42oBY9PhEo
X-Received: by 2002:aed:3e13:: with SMTP id l19-v6mr17242938qtf.345.1531778078516;
        Mon, 16 Jul 2018 14:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531778078; cv=none;
        d=google.com; s=arc-20160816;
        b=YpkNwcX1BbW0exD8IFXpEr7lvRMG349zOXNTVHXuC2T7d1qCtVuYpOtneLIKBKF/HI
         /mQGkWF8RnaM9uWxON/eWvDzSAtYx4IEDE/sLtefpjNEC/qfv8pUvrm1A1Y1k2v4eIqE
         ppN0mBPc6ZcIJJ6XtVmYlr53TNDlUSoV8Xj4+08NW+evt30yrOxD4vBViXgJssf/Im57
         sSxvqsXlDGSC+3DFlndesH8ZigFPDC7dANNAWjWYQySz+fwDjEK5/jwua+vXA6fV5AIQ
         bD4ZFu8CUWWLoXH0QTrCzcItk0DaS4HaHmmbkOtjG0V9C1UueRrLSLARyGgRXbA8btyf
         QkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=y19u8h1MHL604kPGyv7qzSM4kK4dbpCJY2ZmqL7Oxy4=;
        b=CSdKoYiksE4LH4o/cLcH3uSf88v54UE7+8x9wgSZw12DEGQUAfm4yKaisSqzXrpwDz
         lar1eZ0BaJcsoIyj5IvCCmQrhJQz6m4L54gjdETco2WVoSu8XEfrd8wr73oZr3ccxNTP
         BVJmXBYbetHy3XrmP9P86RteviQTF0ICYcRR/WPtUDJ5B+9TDpPn/VdHP1mTvpVpaR29
         TJL12up2ROfAxxPhoXqe0zaLHLNgQ5knB57ayyTQGc9U0zw/f6Y2eKiic9+XUU2F7Bca
         LblKLhivGwHZWgtjEOUlX0MBe1uw2wecS1NPY5WA/H4cKhuXZxJLA04ccbbmWzpAbE/p
         K5gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rQSjOJSc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h14-v6si1606258qkh.182.2018.07.16.14.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 14:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rQSjOJSc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffBS2-0008QO-0b
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 17:54:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBRl-0008Mf-Ma
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 17:54:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBRk-0006h1-O0
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 17:54:21 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:37413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ffBRh-0006f3-37; Mon, 16 Jul 2018 17:54:17 -0400
Received: by mail-lf0-x241.google.com with SMTP id j8-v6so33342450lfb.4;
	Mon, 16 Jul 2018 14:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y19u8h1MHL604kPGyv7qzSM4kK4dbpCJY2ZmqL7Oxy4=;
	b=rQSjOJSc7H9VfbkfcA7Lx6l6lmeHtGHQhY7qv06rf+MTzkM+MkHm4L4Aa0FFkr8oDK
	7rJ9DAYT/kQfRlNq8T1uUz/Wg+mzE4cwASDlXGceGogBVvmw+gn28ciplTYxPm9+4pSU
	BXItITR7U1ZpKrAFOz7XyHaHR22TtTTDh7um7aaGSI5X74qAmuCiuwku8B0t/eL7TOB4
	0CQ2lCYL2lfwOcGTPA0k0qZbv1GXcImoxNxNozxv0Qok2M8da2uJBEIg07dKU5nBrRY7
	+6BmyBrKu41Za7CCmEiqmFcAX2tW5guiO6np7deshekNuwsndfZkWpYhGtlrW+5zDCZW
	BjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y19u8h1MHL604kPGyv7qzSM4kK4dbpCJY2ZmqL7Oxy4=;
	b=Dm81QODhRVHd5mOsA+h5vyzNMnIJ4I6kAsL6v5WMupWyyG+aFDana3IqDZWVn7p6lg
	e67c0f/4ZSxm54zHPeHmBr1WmWG9NFMd6EsJuQHBWZAt5ZC3+/zn8BqyR1iDEJbn4XuF
	9Vh+7FSR3nQsvrCMGF3eaUcp1Zy3SlaSmnIwE87BvwpNQ1yipY7kU4ko1zFLhB/TdzlY
	stvj7hngsfihw/ywJ7fI3zyXsx/UWSsPHg4coFKTGPBd0ujZRCC/MDWZbqiohxpEJKoD
	4dw6mtU5/PZjH660JLgNbV6pRTRx+ZeR80B48SSQSEhDP3rWHwnvbEbZyuQwkyf920n2
	Kaww==
X-Gm-Message-State: AOUpUlFnwwuuVTZ2oeCDXyLvOi/Ga/jCdEjubJrZ104bYvo8XZC7v+VF
	am4SHPA8Kgu+aeYGDJHXIwQAOMAd2UmD4AbB9Bc=
X-Received: by 2002:a19:1190:: with SMTP id
	16-v6mr13484590lfr.122.1531778055182; 
	Mon, 16 Jul 2018 14:54:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8749:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 14:53:44
	-0700 (PDT)
In-Reply-To: <1531745974-17187-3-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
	<1531745974-17187-3-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jul 2018 14:53:44 -0700
Message-ID: <CAKmqyKPz-PCmPcd2xtRe+1Oi-FHxSKEdMN8qnskMXd-JvV5+jw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 02/17] hw/core/sysbus: Add a
 function for creating and attaching an object
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pbOzfmkHVkbE

On Mon, Jul 16, 2018 at 5:59 AM, Thomas Huth <thuth@redhat.com> wrote:
> A lot of functions are initializing an object and attach it immediately
> afterwards to the system bus. Provide a common function for this, which
> also uses object_initialize_child() to make sure that the reference
> counter is correctly initialized to 1 afterwards.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/sysbus.c    |  8 ++++++++
>  include/hw/sysbus.h | 17 +++++++++++++++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index ecfb0cf..3c8e53b 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -376,6 +376,14 @@ BusState *sysbus_get_default(void)
>      return main_system_bus;
>  }
>
> +void sysbus_init_child_obj(Object *parent, const char *childname, void *child,
> +                           size_t childsize, const char *childtype)
> +{
> +    object_initialize_child(parent, childname, child, childsize, childtype,
> +                            &error_abort, NULL);
> +    qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
> +}
> +
>  static void sysbus_register_types(void)
>  {
>      type_register_static(&system_bus_info);
> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index e88bb6d..0b59a3b 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -96,6 +96,23 @@ void sysbus_add_io(SysBusDevice *dev, hwaddr addr,
>                     MemoryRegion *mem);
>  MemoryRegion *sysbus_address_space(SysBusDevice *dev);
>
> +/**
> + * sysbus_init_child_obj:
> + * @parent: The parent object
> + * @childname: Used as name of the "child<>" property in the parent
> + * @child: A pointer to the memory to be used for the object.
> + * @childsize: The maximum size available at @child for the object.
> + * @childtype: The name of the type of the object to instantiate.
> + *
> + * This function will initialize an object and attach it to the main system
> + * bus. The memory for the object should have already been allocated. The
> + * object will then be added as child to the given parent. The returned object
> + * has a reference count of 1 (for the "child<...>" property from the parent),
> + * so the object will be finalized automatically when the parent gets removed.
> + */
> +void sysbus_init_child_obj(Object *parent, const char *childname, void *child,
> +                           size_t childsize, const char *childtype);
> +
>  /* Call func for every dynamically created sysbus device in the system */
>  void foreach_dynamic_sysbus_device(FindSysbusDeviceFunc *func, void *opaque);
>
> --
> 1.8.3.1
>
>
