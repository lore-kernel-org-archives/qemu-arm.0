Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2150743ejf;
        Mon, 26 Feb 2024 08:08:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV5ZKernbpx4FPLfRsHFe2W9Bjrsy4704d4cu52WoZNZtT4KiZwbL+1dteq0NehUAGlSSaJWfjuOz+duTW1slrTmVhHBkdQ
X-Google-Smtp-Source: AGHT+IFC+WBayIb+mYh80YywKt8QU/G9IjMYnGMZpHULkx06zejlNuYpe5F1qqDR7I4IHd5rSybi
X-Received: by 2002:ac8:45c6:0:b0:42e:6d8a:d1dc with SMTP id e6-20020ac845c6000000b0042e6d8ad1dcmr8328755qto.58.1708963730799;
        Mon, 26 Feb 2024 08:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708963730; cv=none;
        d=google.com; s=arc-20160816;
        b=eu9SzIuTV0kP7QTTqFnI0gf6+vwoHgw2aZWMO845YTO9d2XLeWwlNqKTbFjkjWHxmz
         j5TOL68ZgTIbY7P/O9FAMiTFkXE1dUZfEFwaKwoazA7UZFCb3C3WYZTS49VbETcd4UVD
         GSmUpGx6JikGAFiclfSZtZZ+bE5sEyqbzGZ55TVIhrIYkS+QHgD1rD1fIiM/z0HUB200
         4+qvGgiGlxPWGs4ojMy+Iry8hvub1l8BKV9UbdfuCFFwzipjj+KnZBACo9oz43CaRYhF
         C7Q3p8WX23JhSnVY/udV1oxeSA4FUSD396wlKSyu9Rv7OZQj8jHXM3JHuMvnh0GVlvgn
         1VWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=p7du2NPSR+voBdelGq5Sy77c7BweYF4yjbW+uoPA8TE=;
        fh=0rpLpaKs6ZjOVG7+8ukNE3SVcae7cRMmSy05SLkH3qA=;
        b=arknxOaakj+Is+HS6c1X8ADUY4Zts+BuFdNQY7CY4fk9wKWoRwX95ICtEzA3kCIiX0
         N9W/5DunPvMsqAq1hMIfPpcRx1/DCKm/7G6bzzcq6GfItGdoQr3vgYxD4nmNMqHu8cOP
         LH98fCz93TWpJ+JVRxZzq8DiKQpbP6AfK6aGi7maprQJb1EvmdMS8Dz7RbzCWeIBhrsn
         Vy3lCT3Bk1TSr+PprA2gyJHNClVKscqWmwUsoG72kmCYxi9eXJtLd5Cd2ZJNrRERSgPr
         zrMvpYXCMA6xKvJM3iFccL/t0LNSl1UUgyHwJ6bizFuKmjzoFfYeajaT1h4qczSRIEVa
         4J0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020ac87152000000b0042c23be6994si5147590qtp.488.2024.02.26.08.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:08:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redWN-0006ak-1u; Mon, 26 Feb 2024 11:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1redWK-0006a2-1t; Mon, 26 Feb 2024 11:08:00 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1redW5-00060O-NV; Mon, 26 Feb 2024 11:07:59 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Tk5495DZWz6JBV0;
 Tue, 27 Feb 2024 00:02:49 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 3B896140C98;
 Tue, 27 Feb 2024 00:07:23 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 26 Feb
 2024 16:07:22 +0000
Date: Mon, 26 Feb 2024 16:07:21 +0000
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: Fan Ni <fan.ni@samsung.com>, Laurent Vivier <laurent@vivier.eu>, Alistair
 Francis <alistair@alistair23.me>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Markus Armbruster
 <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev
 <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <qemu-trivial@nongnu.org>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v2 3/7] hw/mem/cxl_type3: Fix missing ERRP_GUARD() in
 ct3_realize()
Message-ID: <20240226160721.000056ea@Huawei.com>
In-Reply-To: <20240223085653.1255438-4-zhao1.liu@linux.intel.com>
References: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
 <20240223085653.1255438-4-zhao1.liu@linux.intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i/ETKbRWHfv9

On Fri, 23 Feb 2024 16:56:49 +0800
Zhao Liu <zhao1.liu@linux.intel.com> wrote:

> From: Zhao Liu <zhao1.liu@intel.com>
> 
> As the comment in qapi/error, dereferencing @errp requires
> ERRP_GUARD():
> 
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> * - It must not be dereferenced, because it may be null.
> ...
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> *
> * Using it when it's not needed is safe, but please avoid cluttering
> * the source with useless code.
> 
> But in ct3_realize(), @errp is dereferenced without ERRP_GUARD():
> 
> cxl_doe_cdat_init(cxl_cstate, errp);
> if (*errp) {
>     goto err_free_special_ops;
> }
> 
> Here we check *errp, because cxl_doe_cdat_init() returns void. And
> ct3_realize() - as a PCIDeviceClass.realize() method - doesn't get the
> NULL @errp parameter, it hasn't triggered the bug that dereferencing
> the NULL @errp.
> 
> To follow the requirement of @errp, add missing ERRP_GUARD() in
> ct3_realize().
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
> Suggested by credit:
>  Markus: Referred his explanation about ERRP_GUARD().
> ---
> v2:
>  * Add the @errp dereference code in commit message to make review
>    easier. (Markus)
> ---
>  hw/mem/cxl_type3.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index e8801805b90f..a3b0761f843b 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -645,6 +645,7 @@ static DOEProtocol doe_cdat_prot[] = {
>  
>  static void ct3_realize(PCIDevice *pci_dev, Error **errp)
>  {
> +    ERRP_GUARD();
>      CXLType3Dev *ct3d = CXL_TYPE3(pci_dev);
>      CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
>      ComponentRegisters *regs = &cxl_cstate->crb;

