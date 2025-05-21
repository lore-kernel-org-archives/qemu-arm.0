Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1325810njc;
        Wed, 21 May 2025 10:00:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhXTdQjxGHuC5p6SjerNw0vJ/inpU6yexpDK7bEC0yJeDhd4sBysdk5JbACzDBwcfFJWmd4Av6nNelkw==@linaro.org
X-Google-Smtp-Source: AGHT+IGSq2i1NGSGQHMuM03JPi7+k5hPRVStIJneES0K+JGEkvlk7OkdBIE0gjL2QAWq/ND4efza
X-Received: by 2002:a05:6602:4804:b0:85c:96a5:dc2c with SMTP id ca18e2360f4ac-86a24cd5c72mr2677643539f.14.1747846814417;
        Wed, 21 May 2025 10:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747846814; cv=none;
        d=google.com; s=arc-20240605;
        b=G/A3f+y6lhQ8S5N4J1JNUJqXlNZ5+tf7qF8rSkbVk+pgtoJQV1C9ZhcSssrNUrfFlo
         G+Lnm6DbP00DHUxNvnPJrlVJ3ryPKog6vwPBk8mYxs8nLAgmCjyQlNgs1ujyWmBOI/Qa
         H54297OEdkhIj9/3AEMFRfl9lnaoQVxRRmO0ulz+t+rLAHTaUsR4vcMl3VI4h1LENfUy
         Lscg0SMMsPgQw/N3cUkP7xy4+KQaCsryGr69Iy3rqQGiCdYcCElFz4mExbQc+NLTjEYW
         Nbkx8PhC1JTClAhLgRwF7qg6Ukf9SZAEPWyM9NKxMpEpMBX22NXBzqzSgH8oQDDNnrqM
         VOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :dkim-signature;
        bh=Bd6ZIFTZZmBbT7NmrB6VUv3CJ3IJftMLK1vLzp+yZ8Q=;
        fh=XFYeSz2RLF8tAdGTNwhs88g/buTO8hJ+yh1IixUAM1E=;
        b=XhE7y3WssDGaRH7NqS/nw6dd7NBeDW3o6D3xYii9HBj/Je9mT/QvK2GToSgjNVyYA0
         QTA+b/Yi6LqIbHl1+o4T1sn8YkCOOJpqShKwQfit+uWLPqzNMwSOQU/mzLn2NQKQjGFk
         V937gJYfq+yXMFkj2QQl43xwxpJMdS/YGZgjrY+RTm+PR6gXYcY9hKVKQVgYj0Qb6BuQ
         qWDaub+ZYYZFe6C17mdVww8d5gelwUoRocGX9zjcOxhOrqMltPyLzdJgSVV0IVGJUG6U
         CPF7FlyD88PhfUJhUCXXzlmDRLSRUo0QTGcpaxUD6L0YtKwcixyNKtWw38xooJl27OC9
         R+Og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NCiVnX0f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca18e2360f4ac-86a235b95b8si1338034239f.18.2025.05.21.10.00.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 10:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NCiVnX0f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uHmn7-0007gG-H8; Wed, 21 May 2025 12:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nifan.cxl@gmail.com>)
 id 1uHmn6-0007g2-Ex; Wed, 21 May 2025 12:59:40 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nifan.cxl@gmail.com>)
 id 1uHmn4-0008Dg-HW; Wed, 21 May 2025 12:59:40 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-742c9563fd9so3473814b3a.3; 
 Wed, 21 May 2025 09:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747846774; x=1748451574; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bd6ZIFTZZmBbT7NmrB6VUv3CJ3IJftMLK1vLzp+yZ8Q=;
 b=NCiVnX0f6+ercfAYo67R7xq1sLwYYDPLrrxJ0TuTzE+uoriaM7R5aeApNbCumtRFS2
 rzeetM/mUZHyncpcCVtJBShxhV9dyusMTJj8GUgedGGFrl1hzhNZZrRaPLaEqeVbEhQ2
 hrqe86ytiZkCg0SPlORrywfkgWcuvohEXELgt51MI/uMbuaFoTZXEkKKDdHKzrsLbzjp
 Yyn5CCmdzlnGLkn0dqXc3mo/JIW4dlCt0n7hHAholXVDPjZXmulDFEpywYTNMPFnP1lF
 o/VawM7z0K45CToIS6vjlvSEzW8jaVDKvyVVZBhXnT9Rce1ZAnG3tIpXOAoZYq7Cgt75
 P4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747846774; x=1748451574;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bd6ZIFTZZmBbT7NmrB6VUv3CJ3IJftMLK1vLzp+yZ8Q=;
 b=HNrmCDg/RipNKCFam+ofTdoAXTeNOaY5MTWxYm7raQz7rgkK0h+KYBQSaZUVYrwb2H
 Z4BlS67RMv9884iDNKipwSmj+7APE7k+7HsL9hEjIvnF4YrbWitMDWw4oOr8YtPLJxcM
 HHPmen4DktET6O8QGBLSenbm0Ya57pG0RlE5Xsh4FxFm9/2lg0ZStgzt9U193tJDPMNJ
 2UJG3Fg0Vsx2w4c3RvDU4VOpvfklf/4U3y4PjMGwY9Jsj6rlRN3NWtv0WC768kaavxrG
 UEV+in1LMJRjHa5CkI26enZuedgr91VoWY2ts5xwPAzOadBRx34vyUOY/TVYGRK6JBmd
 Fnpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKoNPsuALsckZuKApYdN/CfJrBwFBv5ykCCMgvWUIwtCfNFNGMgWUNOC8HZNjxOW+hlM+yHzYs1Q==@nongnu.org
X-Gm-Message-State: AOJu0YwfBK162LDdnfMbPP1ddzLP1ts7yOGFNqHgD7Jv3gI/A4USqur/
 eak8K8vJaloKt5j6MRLZFmuXzeo/RFuM6e5bVI3Pr82DR8rc+F8gjXpZ
X-Gm-Gg: ASbGncu91p+rNJwEiWR1tJ9os4bQMd/QTeVdmJT8WKeqyj9Trlcu4FrhQlTPpp1Spef
 vLETKNL9OuVhIfTS4uh8JRG6g1cpMfJ1bmDEVXbLofTg0KWIpMnziFF/YgbjihJmcni7kxNHUAP
 lw/2VyanGYBusRsar/j1NV09xZePd6eu+4d/GgDC69XTsu6ofEaBHVh82Dy9d98fZyCU/yUKBZl
 NGTtt9zSVg9+2V6Kkq2gByWv8HVL/9U0/cLrjhd8ZBTPDWYkjyKaaXEEic4bqI8+LylI2OpYC6d
 /nSJn119xlNYv7mut0+l7fc34fspbg53522aDK/rFCBRZR3/LlT/oN0=
X-Received: by 2002:a05:6a20:1591:b0:204:695f:47e1 with SMTP id
 adf61e73a8af0-2170ccc0efdmr31537492637.23.1747846774329; 
 Wed, 21 May 2025 09:59:34 -0700 (PDT)
Received: from smc-140338-bm01 ([149.97.161.244])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9829bbesm9837482b3a.89.2025.05.21.09.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:59:33 -0700 (PDT)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Wed, 21 May 2025 16:59:31 +0000
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 mst@redhat.com, linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 qemu-arm@nongnu.org, Yuquan Wang <wangyuquan1236@phytium.com.cn>,
 Itaru Kitayama <itaru.kitayama@linux.dev>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v13 1/5] hw/cxl-host: Add an index field to
 CXLFixedMemoryWindow
Message-ID: <aC4Gc7TMHHwuNGwl@smc-140338-bm01>
References: <20250513111455.128266-1-Jonathan.Cameron@huawei.com>
 <20250513111455.128266-2-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513111455.128266-2-Jonathan.Cameron@huawei.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=nifan.cxl@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x62zXX8/gF6T

On Tue, May 13, 2025 at 12:14:51PM +0100, Jonathan Cameron wrote:
> To enable these to be found in a fixed order, that order needs
> to be known.  This will later be used to sort a list of these
> structures that address map and ACPI table entries are predictable.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---

Reviewed-by: Fan Ni <fan.ni@samsung.com>

>  include/hw/cxl/cxl.h | 1 +
>  hw/cxl/cxl-host.c    | 9 ++++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> index 75e47b6864..b2bcce7ed6 100644
> --- a/include/hw/cxl/cxl.h
> +++ b/include/hw/cxl/cxl.h
> @@ -27,6 +27,7 @@
>  typedef struct PXBCXLDev PXBCXLDev;
>  
>  typedef struct CXLFixedWindow {
> +    int index;
>      uint64_t size;
>      char **targets;
>      PXBCXLDev *target_hbs[16];
> diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
> index e010163174..b7aa429ddf 100644
> --- a/hw/cxl/cxl-host.c
> +++ b/hw/cxl/cxl-host.c
> @@ -24,13 +24,15 @@
>  
>  static void cxl_fixed_memory_window_config(CXLState *cxl_state,
>                                             CXLFixedMemoryWindowOptions *object,
> -                                           Error **errp)
> +                                           int index, Error **errp)
>  {
>      ERRP_GUARD();
>      g_autofree CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
>      strList *target;
>      int i;
>  
> +    fw->index = index;
> +
>      for (target = object->targets; target; target = target->next) {
>          fw->num_targets++;
>      }
> @@ -325,14 +327,15 @@ static void machine_set_cfmw(Object *obj, Visitor *v, const char *name,
>      CXLState *state = opaque;
>      CXLFixedMemoryWindowOptionsList *cfmw_list = NULL;
>      CXLFixedMemoryWindowOptionsList *it;
> +    int index;
>  
>      visit_type_CXLFixedMemoryWindowOptionsList(v, name, &cfmw_list, errp);
>      if (!cfmw_list) {
>          return;
>      }
>  
> -    for (it = cfmw_list; it; it = it->next) {
> -        cxl_fixed_memory_window_config(state, it->value, errp);
> +    for (it = cfmw_list, index = 0; it; it = it->next, index++) {
> +        cxl_fixed_memory_window_config(state, it->value, index, errp);
>      }
>      state->cfmw_list = cfmw_list;
>  }
> -- 
> 2.43.0
> 

-- 
Fan Ni (From gmail)
