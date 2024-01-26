Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp748495ejc;
        Fri, 26 Jan 2024 00:58:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW/gDzwfqzRXYP5S4wyN2isRSbVrVNu9KdBgTfn0RKyoNMYLHrraZtMSOuj+k5EkJFVRu0
X-Received: by 2002:a05:620a:8111:b0:783:c092:7af2 with SMTP id os17-20020a05620a811100b00783c0927af2mr1125234qkn.137.1706259495118;
        Fri, 26 Jan 2024 00:58:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706259495; cv=none;
        d=google.com; s=arc-20160816;
        b=bxBIBmP11hk8g4rch0HAd7gBzl/iT7C+CiDFwWzNzWkfl6sPTVSABpbHEvMaDNlafr
         dGSYgwls8XkP4F4fdCbBuXYr2BHQj9Mjp4kf0/tJqHD/ClMFwgf3jAg9OHK0IU+wctM2
         LLMTDabQwUHbYNChUUOX9q3uiB/UUjwixOk/3yOMqmpGGIzRqpLiDiKzw7tQ8pKZ1IAk
         /2oi7bqPG8wTMB0HSGDaGYnfBk8bMOIeRNk2MxShPNp0oKxP9Z7+5iNuKH3D5qD48bzN
         hxy9LkfL8TulGwJhbJo0XKH/Qs6Df4oq506X2VWjulyt83b3yzvz3z9XgkrgesbEn2Je
         0Ozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=eIBApcKrecwkAbLEHh9YorKTSunRRoBMlBCciidCqsE=;
        fh=JKTnjfgLebdI6Uppdd2zUuo3nA3KHnzgaaV6K84+8TY=;
        b=W8WRixXQuisB+mF5Qh17eUCBewYgKO1LOUyhI2qA0DjGDdeRVZB8DqWXfO643m5gSh
         jHW3BX8MdV7TWbuI8p+rES/N9tK3DOrX+O/+KHiq3PAnRiRG/8qpSoEP5VNKYXG34lPo
         g6+znbMN0EZJME0nujYeDv/WK7NdcGrjNZWJEAmB9/a9oMaTbHAbNUmDBhwe5z7lx076
         Zn06sldmlHoIAYqZI6d05lI6h9XBhaiodi60FxALXFhtdFulwV9YBe4WhT9OPmeYuMNb
         57HQ3o7dO+2GbWv4Z/dglrYwPa0TTzRcGkbmaLtJ1BBggUfOvh9yuX2JIMQ5w/x23Es5
         PPuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5-20020a05620a144500b00783ce87435bsi795502qkl.657.2024.01.26.00.58.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 00:58:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTI2M-00079d-2O; Fri, 26 Jan 2024 03:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTI2K-00078S-20; Fri, 26 Jan 2024 03:58:08 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTI2I-0008BE-D4; Fri, 26 Jan 2024 03:58:07 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLs6L3Ndsz4x5K;
 Fri, 26 Jan 2024 19:58:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLs6H09sYz4wcJ;
 Fri, 26 Jan 2024 19:57:58 +1100 (AEDT)
Message-ID: <4ec645e9-0fa7-46f5-ade0-847b3bdbb384@kaod.org>
Date: Fri, 26 Jan 2024 09:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 11/11] hw/fsi: Update MAINTAINER list
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20240126034026.31068-1-ninad@linux.ibm.com>
 <20240126034026.31068-12-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240126034026.31068-12-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: a35CZhbctUrA

On 1/26/24 04:40, Ninad Palsule wrote:
> Added maintainer for IBM FSI model
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> v11:
>   - Added Cedric as reviewer.


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   MAINTAINERS | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dfaca8323e..39deb8ee1f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3585,6 +3585,15 @@ F: tests/qtest/adm1272-test.c
>   F: tests/qtest/max34451-test.c
>   F: tests/qtest/isl_pmbus_vr-test.c
>   
> +FSI
> +M: Ninad Palsule <ninad@linux.ibm.com>
> +R: Cédric Le Goater <clg@kaod.org>
> +S: Maintained
> +F: hw/fsi/*
> +F: include/hw/fsi/*
> +F: docs/specs/fsi.rst
> +F: tests/qtest/fsi-test.c
> +
>   Firmware schema specifications
>   M: Philippe Mathieu-Daudé <philmd@linaro.org>
>   R: Daniel P. Berrange <berrange@redhat.com>

