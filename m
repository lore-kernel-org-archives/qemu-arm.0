Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2151340ejf;
        Mon, 26 Feb 2024 08:09:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVtggsIDLJD8LE4HjULufRlaiG6sujY9HGCzqGTwK6QvQnWpijCuOP/y28r3xTP0rPUxGoR4hGOVA+8WJXzxtOyvToqerM7
X-Google-Smtp-Source: AGHT+IGBbT4DEnlAFJy+Qk/nIZIB3KM14IjG68Tw6502SXMweOK4pvPy2V/MU1Os5cxuI6F0CWgA
X-Received: by 2002:a05:6214:33c3:b0:68f:eed7:f234 with SMTP id mw3-20020a05621433c300b0068feed7f234mr10320072qvb.4.1708963784683;
        Mon, 26 Feb 2024 08:09:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708963784; cv=none;
        d=google.com; s=arc-20160816;
        b=ncbbSJo3ltm1f63T7ECEWKGcu05SWD5feVracGLVJs9jWjCwq7IFFttRVMm9L+18qC
         LIUDc7Uu15YRHZvcjT0AVsjqPs/091EQR6D0asJ5Og/1UzXGugcdt0Szf8IpNdkSEr/+
         oMcFQngJ1lBikIoqhykljwu8VAXPynPionw0mwM/gmB5wFC4HPw2Wd0NaDDNm6l1oxht
         7HzsCszhNm3N7HZWwAOs9nNzclJJVy4Q+aQvnkYpuOZaCqIWnAEVRY6eniTqgU9iMTFh
         sk1Ymn/TDXLpquwEycm3v2D8IOoGyh8o/aQMb5UlaXjXNInWM/jezGDP8hP84Qr84vMH
         RnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=4D7BjEqLobON4Vj7ob1LEATj85dO/HPZWPaIfNrr+Lw=;
        fh=0rpLpaKs6ZjOVG7+8ukNE3SVcae7cRMmSy05SLkH3qA=;
        b=PrqLkYl/s98cJNOZPj2yUyKa5u85R5mKd68YEWwPtjH1GMzkapl9IrUHkNS71vV6+9
         i0YZo5a5dn+7V0OmbOs4C8vO+m3TCVRuRqTIv7K31woH/xyQM2iWd1H/WFF0mf/iWZn6
         FKL6jjzQ4k7wraIxpqWzuRvPmivlkrqhezMYn/oDt8o4g4wZ+DAuRX3528cFCh8n+Axk
         MKTH24etVUVoAyZZlzC1l7XP2j2l70bjYsm23+Uc1QW6hk+eWSHBsA6TkhiN2yDZDAVB
         MIlVllMtG+52sL+QHel1X444RPh4gSFDMbbJwKvkfdRHHPGikvaj17S880tJde8Erj3B
         qDNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020ad45747000000b0068eeeabaa8fsi5622609qvx.144.2024.02.26.08.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:09:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1redWA-0006YN-LM; Mon, 26 Feb 2024 11:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1redVo-0006Kh-L8; Mon, 26 Feb 2024 11:07:29 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1redVg-0005xM-OL; Mon, 26 Feb 2024 11:07:26 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Tk54l1vTTz67PjK;
 Tue, 27 Feb 2024 00:03:19 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 9CDB7140A35;
 Tue, 27 Feb 2024 00:07:02 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 26 Feb
 2024 16:07:02 +0000
Date: Mon, 26 Feb 2024 16:07:00 +0000
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
Subject: Re: [PATCH v2 1/7] hw/cxl/cxl-host: Fix missing ERRP_GUARD() in
 cxl_fixed_memory_window_config()
Message-ID: <20240226160700.00007286@Huawei.com>
In-Reply-To: <20240223085653.1255438-2-zhao1.liu@linux.intel.com>
References: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
 <20240223085653.1255438-2-zhao1.liu@linux.intel.com>
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
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z3RKoZs0uSAJ

On Fri, 23 Feb 2024 16:56:47 +0800
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
> But in cxl_fixed_memory_window_config(), @errp is dereferenced in 2
> places without ERRP_GUARD():
> 
> fw->enc_int_ways = cxl_interleave_ways_enc(fw->num_targets, errp);
> if (*errp) {
>     return;
> }
> 
> and
> 
> fw->enc_int_gran =
>     cxl_interleave_granularity_enc(object->interleave_granularity,
>                                    errp);
> if (*errp) {
>     return;
> }
> 
> For the above 2 places, we check "*errp", because neither function
> returns a suitable error code. And since machine_set_cfmw() - the caller
> of cxl_fixed_memory_window_config() - doesn't get the NULL @errp
> parameter as the "set" method of object property,
> cxl_fixed_memory_window_config() hasn't triggered the bug that
> dereferencing the NULL @errp.
> 
> To follow the requirement of @errp, add missing ERRP_GUARD() in
> cxl_fixed_memory_window_config().
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
>  hw/cxl/cxl-host.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
> index 2aa776c79c74..c5f5fcfd64d0 100644
> --- a/hw/cxl/cxl-host.c
> +++ b/hw/cxl/cxl-host.c
> @@ -26,6 +26,7 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
>                                             CXLFixedMemoryWindowOptions *object,
>                                             Error **errp)
>  {
> +    ERRP_GUARD();
>      g_autofree CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
>      strList *target;
>      int i;

