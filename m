Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp789691njb;
        Fri, 28 Feb 2025 01:30:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWaKLmou9GSzdSU3lzCYb0c50WK0Wn6T53R9EdfvBQUy+sex3ZIxZ9xRxsmlsLOx8kTMRdjqAfGB/d5Yw==@linaro.org
X-Google-Smtp-Source: AGHT+IGuib2ngQ2pTy9+RLYlNNODbZwwD7akCTdUo+GNeE7JpNeQv9x10tJ7vYmmap+ineQUXIeH
X-Received: by 2002:a05:6214:21cf:b0:6d8:9960:b063 with SMTP id 6a1803df08f44-6e8a0cbf934mr41340436d6.14.1740735012363;
        Fri, 28 Feb 2025 01:30:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740735012; cv=none;
        d=google.com; s=arc-20240605;
        b=DOcLLG7QFFxz8VjHkzemJAe4Q31tNQ0SGYTH3R4lTwxJOnVdJIH9LIxSKRkcdCZgdY
         GNrS/l/P12SjBP+TUwBRexUD+OtdSk7m1WXa2zs7+T7jG62EPPMxjQYdoj9dYg2cJH5Z
         nbhSUhVXr5yZXLAc9ONvO6ht8gQzoqqTNdrEvjQjRLC2F5f0QY/AqfLzC6lQyXP2A1KM
         pII7lxA90PHc3qqqJXSFuDdSvjAdlN9ddrEDLMhljo1MKPadP/ISkLg42wd1mR4zztXT
         VB36ECbtdBlrv+AqQswjtQwfGqleO8JN5YpEl3dnAiJsWpLZ5VTJhOxT55pVMJ/VUrHC
         HWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=4G1S586bzXhejyYRKnpt4itm2/wvAGCJggwTHc73nL8=;
        fh=t/xybFWV2B884dK2bO1HGz5LnOWlFKzKgenI2zgFzYc=;
        b=bZ9I/2peSfEdOIDgSnBJqq9r5tQeYcYR4nYN7fvCBzXUMTs+DFIBLFcoPkwpUv6Mub
         Xt7/5MG+/ajIitHFiigUSDkwoWTM4vQI0qea6iKtg7sqih3MsW3yfCQjjoFLHJsGa35H
         REOqQEef2gjVG+PmN7FIkqfJ7kKsXD2UqlqOSAoe0N8/iuMvI/peCQIuaki9uS8Enxw2
         4icQceidjOVqbIj6fXFaEpMRUbHUsZRU/2An0RYDN57PrNWxpi4dlKTlUemY2XyNdgLw
         fUNeoxDyTh2HUsdfKyBUPr4HDcMGfet5JcL9qiruskIsjNfebhzHgNahGPHUyZEHiUef
         hBlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4747243a302si29460551cf.590.2025.02.28.01.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 01:30:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnwh6-00088w-Gd; Fri, 28 Feb 2025 04:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwh4-00085l-OP; Fri, 28 Feb 2025 04:30:06 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwh3-0001vJ-0f; Fri, 28 Feb 2025 04:30:06 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z42tp0HRVz6K5rN;
 Fri, 28 Feb 2025 17:28:02 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id EAD9F1400D4;
 Fri, 28 Feb 2025 17:30:02 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 28 Feb
 2025 10:30:00 +0100
Date: Fri, 28 Feb 2025 17:29:55 +0800
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 16/19] acpi/generic_event_device.c: enable
 use_hest_addr for QEMU 10.x
Message-ID: <20250228172955.0000740e@huawei.com>
In-Reply-To: <797c0199ef713241db145baf3860d32e0eb1d03a.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
 <797c0199ef713241db145baf3860d32e0eb1d03a.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.96.237.92]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gaQwmaeGjGNO

On Thu, 27 Feb 2025 17:00:54 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Now that we have everything in place, enable using HEST GPA
> instead of etc/hardware_errors GPA.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Looks good.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/acpi/generic_event_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index f029753ab709..9fe70b74bd42 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -332,7 +332,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  static const Property acpi_ged_properties[] = {
>      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
>      DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState,
> -                     ghes_state.use_hest_addr, false),
> +                     ghes_state.use_hest_addr, true),
>  };
>  
>  static const VMStateDescription vmstate_memhp_state = {

