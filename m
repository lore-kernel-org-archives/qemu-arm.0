Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2151531ejf;
        Mon, 26 Feb 2024 08:10:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVg1UFA55Bk1XiM/+LT+ahNSu86qmjk7+x1+uC7DuD8/s6mpsSE4TWzoM1Ir6sVHIfkR5sCfwDO8WkyJXjiXvbTjVirFM3l
X-Google-Smtp-Source: AGHT+IFmaSIyChZT6qQFD4c1ZptYn/lZy2E0SEoHJLSo89MlP410cLjzoIKvpXoDoDw35jMpXNu5
X-Received: by 2002:a0c:e3d0:0:b0:68f:706c:a7e3 with SMTP id e16-20020a0ce3d0000000b0068f706ca7e3mr7186805qvl.54.1708963800990;
        Mon, 26 Feb 2024 08:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708963800; cv=none;
        d=google.com; s=arc-20160816;
        b=agUN1IeeihWlEaDW8ZuT0vj528MTpJP75B2gpew0x/cg6dLv7LeYpZfDdtxmBB/omm
         PJ/j0zoHJrZiSbvp1Zywnvwav+C9PEpK5WyqqgkCWYP3GPToVpZKhZm2WLDVTLRwA0Pz
         vA+hO+kmJjfm1hTOxU42LrcAhVpnOAGbogD4eyeveOfqtzC6jbdN5kfGYlzKB/nTSaZq
         oKImpZobGEFaPJaHQJ1lGsjNpcbS7OHN32TMIZGJJkJKw683zogAPXSxiLf2ObjsmP55
         FL4aMlMBVH1kzpA/gOejlsp1v6JhfaOtRT5Dg0eO0P3hWS035iD53LEiGbrV30Ph0HKD
         RaGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=nqHODHYExr2hMXlNv8gEMkD1Fi7MCtc9A4vW1fihxTs=;
        fh=0rpLpaKs6ZjOVG7+8ukNE3SVcae7cRMmSy05SLkH3qA=;
        b=iwRbugfZ0FPE2g8J3or5Z/AGzNQPX2lRgi/y0lETBWS6jKDREGexAcM9CQ3mCAFVeT
         Jn0Z/kk8iF547gr96PHLW12OlQ4umgwnRgdIDKt2uKs1oDlIumQc1jqsGyGljvj+Dj4J
         eBhj0Bm5KVebRJcVJSusPC8o9Y95ONhHh18IGjXdIIpkEfxJU2Cf58BOG7OMZbcqOG9o
         Ta65Gl0oKBh7y/OTeNMysfuc26BC3YJi25INKhT4RxTUUUQKyUdZeT0tKBDfJpbL/Xcq
         jEZbiJ7/K43fUkS57lEFX2tjThnU2YRCtS0zJheHUp6zLBPe7u29TjM5B/ig7arYsS4M
         LUtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a05621419cc00b0068fff085436si3173320qvc.340.2024.02.26.08.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:10:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redWg-0006h1-Dw; Mon, 26 Feb 2024 11:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1redWd-0006fX-IX; Mon, 26 Feb 2024 11:08:19 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1redWJ-0006BC-Gs; Mon, 26 Feb 2024 11:08:17 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Tk54x2wtJz6K6MM;
 Tue, 27 Feb 2024 00:03:29 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 6002A140A35;
 Tue, 27 Feb 2024 00:07:48 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 26 Feb
 2024 16:07:47 +0000
Date: Mon, 26 Feb 2024 16:07:46 +0000
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
Subject: Re: [PATCH v2 5/7] hw/pci-bridge/cxl_upstream: Fix missing
 ERRP_GUARD() in cxl_usp_realize()
Message-ID: <20240226160746.00004dc3@Huawei.com>
In-Reply-To: <20240223085653.1255438-6-zhao1.liu@linux.intel.com>
References: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
 <20240223085653.1255438-6-zhao1.liu@linux.intel.com>
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
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: L2JUVPDHK3do

On Fri, 23 Feb 2024 16:56:51 +0800
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
> But in cxl_usp_realize(), @errp is dereferenced without ERRP_GUARD():
> 
> cxl_doe_cdat_init(cxl_cstate, errp);
> if (*errp) {
>     goto err_cap;
> }
> 
> Here we check *errp, because cxl_doe_cdat_init() returns void. And since
> cxl_usp_realize() - as a PCIDeviceClass.realize() method - doesn't get
> the NULL @errp parameter, it hasn't triggered the bug that dereferencing
> the NULL @errp.
> 
> To follow the requirement of @errp, add missing ERRP_GUARD() in
> cxl_usp_realize().
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
>  hw/pci-bridge/cxl_upstream.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/pci-bridge/cxl_upstream.c b/hw/pci-bridge/cxl_upstream.c
> index e87eb4017713..03d123cca0ef 100644
> --- a/hw/pci-bridge/cxl_upstream.c
> +++ b/hw/pci-bridge/cxl_upstream.c
> @@ -289,6 +289,7 @@ static void free_default_cdat_table(CDATSubHeader **cdat_table, int num,
>  
>  static void cxl_usp_realize(PCIDevice *d, Error **errp)
>  {
> +    ERRP_GUARD();
>      PCIEPort *p = PCIE_PORT(d);
>      CXLUpstreamPort *usp = CXL_USP(d);
>      CXLComponentState *cxl_cstate = &usp->cxl_cstate;

