Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4707578wrh;
        Wed, 8 May 2019 04:21:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywX7KdLTy41rMTLvqw+uECak2JLt8u/ub/OJfGFP/luyAW1nX3DXFq0iY3A719Uqt0DQ2A
X-Received: by 2002:a05:600c:247:: with SMTP id 7mr2796501wmj.31.1557314518179;
        Wed, 08 May 2019 04:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557314518; cv=none;
        d=google.com; s=arc-20160816;
        b=xUmZCxs4Xd4+wQfHhw4kPBc+pNhp48SqzvEmhlsbN0mWvV8fuc2lK9keqZWnSF3AqW
         9yt/sbMrfPgFlGT0osRGGfBwIoE9IEkKn8QaqRVINZTEGYnITnkgE6NdxSS7nBsY22N3
         OMOxTrDaCtpq8mLEyzCifKOyPC525lx877zhUZX0VmQ8MMsOo1H1OJ7Az0BJ6D/WMmB5
         m0qUv5Xaj/730DF1PYmp7Oz/o6J2RUv5CB/WAHrKooqwVLE3Oz9OCHpY8hJx8Xp/WVpo
         5rIMCls0ml5gQgHH4lYUmlLLyb/XsCaZyxhfr2hgT5Vig1IO31cAfRCGZ4LtN5JLf0eU
         zGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=yO6TnPkSgEUNCXlGeLEiC8rT8lvNtt+ewRL54avYGws=;
        b=k91LYvpvxMPQ1B8eBSviwS89c0lRQsckryvjQaGwR+z9ImC2PeEWFA71eyJppxKWsJ
         PF2xOXTgD1YP9DGjPvMShGoVASHUwgqL6F0XGT3S8/cLx2/IctZ5rnWhMXAAcxQgr0Ty
         6HGYDxvR6u5ZrneMTTnAe/ZJoG1bFOb3ym+LnXKrZuipSDKcyINRmpDmxm/xAoaDdThg
         Ei3WSADEVRodk3Z7AhISP8gWu0z/hRu9wx3KG8PepadxxVngxBFqjSwETjiNupHXl4Sj
         rOeZHBIFDjsqX0Z+20VbExHAOLwF0+5R2ZJOSjB4LW86Mx1SdaRwV/UYxbNZvrnLsgg0
         Hqyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a194si1372938wmd.192.2019.05.08.04.21.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:21:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKe5-0001ja-7K
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:21:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKbQ-0007kY-AV
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:19:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKbP-00057L-9G
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:19:12 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38471)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOKbP-00056v-1U
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:19:11 -0400
Received: by mail-wm1-f66.google.com with SMTP id f2so2759754wmj.3
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yO6TnPkSgEUNCXlGeLEiC8rT8lvNtt+ewRL54avYGws=;
	b=NCTaMEUV2esuoPkg488sMaaXDSGFIZ7zZB8lZNV337qb0HdteP4fy5KFg9Ae/e5wXy
	yANXXkCKL1C+6DghGziQeFNTe/bbXd3kmXDASuEohkCwEw0uNJfDfwWpK+VvzKQBCkqr
	OXIgYS0D5JxqiNaHoOJNODYpNFIgvq2iKhgyNr4CFzo5/N57zuw0XpB75WOfQowlEETm
	fO6lglPAR3gOTMTMWvh0YliRSxQoUUmR+HgDQxbvGalgN5R/0zIwF4TGpkmvap64Zw6T
	YSHTC6uD6biXDqR4+WEqE9GB8OGdvTPPYVzvxcek3OKJs3gqzNAuY3W95Pd595FgCf15
	Mi+g==
X-Gm-Message-State: APjAAAWPZd/97gqJMVvNNdC/eDs8hZP+mNHdNXik5PJJgu8PaIzA0KzM
	f/SrXoggPvL/ayEbKsENidWZTg==
X-Received: by 2002:a7b:cb4e:: with SMTP id v14mr2564517wmj.52.1557314350096; 
	Wed, 08 May 2019 04:19:10 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id z10sm9391426wrs.8.2019.05.08.04.19.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 04:19:09 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-15-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <50c6c3b2-33a1-f051-2b55-e102878d8e7d@redhat.com>
Date: Wed, 8 May 2019 13:19:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507163416.24647-15-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 14/16] hw/microblaze/zynqmp:
 Use object_initialize_child for correct ref. counting
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
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4kFCWPxhnIo0

On 07/05/19 11:34, Philippe Mathieu-Daudé wrote:
> As explained in commit aff39be0ed97:
> 
>   Both functions, object_initialize() and object_property_add_child()
>   increase the reference counter of the new object, so one of the
>   references has to be dropped afterwards to get the reference
>   counting right. Otherwise the child object will not be properly
>   cleaned up when the parent gets destroyed.
>   Thus let's use now object_initialize_child() instead to get the
>   reference counting here right.
> 
> This patch was generated using the following Coccinelle script
> (with a bit of manual fix-up for overly long lines):
> 
>  @use_object_initialize_child@
>  expression parent_obj;
>  expression child_ptr;
>  expression child_name;
>  expression child_type;
>  expression child_size;
>  expression errp;
>  @@
>  (
>  -   object_initialize(child_ptr, child_size, child_type);
>  +   object_initialize_child(parent_obj, child_name,  child_ptr, child_size,
>  +                           child_type, &error_abort, NULL);
>      ... when != parent_obj
>  -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr), NULL);
>      ...
> ?-   object_unref(OBJECT(child_ptr));
>  |
>  -   object_initialize(child_ptr, child_size, child_type);
>  +   object_initialize_child(parent_obj, child_name,  child_ptr, child_size,
>  +                            child_type, errp, NULL);
>      ... when != parent_obj
>  -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr), errp);
>      ...
> ?-   object_unref(OBJECT(child_ptr));
>  )
> 
> While the object_initialize() function doesn't take an
> 'Error *errp' argument, the object_initialize_child() does.
> Since this code is used when a machine is created (and is not
> yet running), we deliberately choose to use the &error_abort
> argument instead of ignoring errors if an object creation failed.
> 
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Inspired-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/microblaze/xlnx-zynqmp-pmu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
> index 0948b1fd5f2..df6c0048aa6 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -176,9 +176,9 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
>                                  pmu_ram);
>  
>      /* Create the PMU device */
> -    object_initialize(pmu, sizeof(XlnxZynqMPPMUSoCState), TYPE_XLNX_ZYNQMP_PMU_SOC);
> -    object_property_add_child(OBJECT(machine), "pmu", OBJECT(pmu),
> -                              &error_abort);
> +    object_initialize_child(OBJECT(machine), "pmu", pmu,
> +                            sizeof(XlnxZynqMPPMUSoCState),
> +                            TYPE_XLNX_ZYNQMP_PMU_SOC, &error_abort, NULL);
>      object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
>  
>      /* Load the kernel */
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
