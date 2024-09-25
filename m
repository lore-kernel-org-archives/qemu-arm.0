Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp361707njb;
        Wed, 25 Sep 2024 07:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvlufsE1LPrE55zBI1vQx/yp3w/1N5LTJnmAGdDAwxFW+NA0dMY32VPkdyGCuPzc+xO0vzvc4XA5N61g==@linaro.org
X-Google-Smtp-Source: AGHT+IFAR5aanpRL7IErYPHRohYVaoa5m+sY3m2Yxei2aZri82H7t4FJ0RDVMHQkuibakB+w0Qbi
X-Received: by 2002:a05:6214:5b8a:b0:6c5:ae6a:101a with SMTP id 6a1803df08f44-6cb1dd176c8mr58358956d6.7.1727274247135;
        Wed, 25 Sep 2024 07:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727274247; cv=none;
        d=google.com; s=arc-20240605;
        b=GM7G1VRxpxHSEqU/1r+7N29ZUV0sseJ0ssE9daBwg8Z5BbEaOwSNeVKxehW2fQzqp5
         t9Kj/siMegILrpRrfu2CKa6x3rIXTnfgQOXd4Y/KJTfo7mHm9lswGlER88feOfDGx44D
         v8wYpw6eMJE18PXr0kNcpkYtZZqqad06BBt4yuQlzf7CplVf3E5dXt2FMXn47HrxLXqk
         3RLYqbY8HeEFz0iJvhMdzQXjZEprtXZRHG1V6xuwD/l9knb59cU+36uw53Xr9ghIwU+U
         LhtSCo+JT9NSYmdysr9rIn2jVAPOPPSbY0Z9YWyBXaP5XF0gIBNbavkVqxSCTmfqf9LI
         KL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=o6eWiuRZa+4fuX+YquI8sJ3DkuDb+sm50mok8Kuh9bo=;
        fh=xorUoMC2IHZi14qbosopEp/1wCIif4VMRZ2S+Ueublk=;
        b=jJ0+9GeScQon13l8PS4rZBRJYc4JrXiVsO0CLI/gG5ygKhXHje2lRHrZOrK0ewmV4O
         WCOS23A6E2LKFr7z7EZdxqqHKTyq13sqtFYC0Jc1+VVOKaIyk17BnEpPHSEu39WaJnoi
         OGaHvMo9KQ8FZcHkfI6NH2nCbxGJpMmL9tKHAGnaqahQDKgnufrcmCpnBTVqRRo6uOGr
         F5w9osI4D8KSqet0g5AooIJqEba/eYinQ7sajtbEa42niokDrTnhs7M3DtmDhFBQTjb1
         TqfVJ3Df02q45rOouuMhpDZV4n6t18DYoVDU8mt4udN0BUPzR+8kWps/YIA3c+z0+ZsJ
         6uaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb0f4c1f2fsi40624126d6.106.2024.09.25.07.24.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2024 07:24:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stSvf-0006IH-9N; Wed, 25 Sep 2024 10:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSvc-0006AG-B1; Wed, 25 Sep 2024 10:23:41 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSva-0002aQ-Ai; Wed, 25 Sep 2024 10:23:40 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XDJqC0lDhz6G9Pm;
 Wed, 25 Sep 2024 22:23:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 1B45E140736;
 Wed, 25 Sep 2024 22:23:35 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 25 Sep
 2024 16:23:34 +0200
Date: Wed, 25 Sep 2024 15:23:33 +0100
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 <linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 08/15] acpi/ghes: Prepare to support multiple sources on
 ghes
Message-ID: <20240925152333.0000110d@Huawei.com>
In-Reply-To: <05fb5c6a7d26eeb730bf5fe1f67bb6581ec6d730.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
 <05fb5c6a7d26eeb730bf5fe1f67bb6581ec6d730.1727236561.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.828,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: vpPyj2gw0tQi

On Wed, 25 Sep 2024 06:04:13 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The current code is actually dependent on having just one
> error structure with a single source.
> 
> As the number of sources should be arch-dependent, as it
> will depend on what kind of synchronous/assynchronous
> notifications will exist, change the logic to dynamically
> build the table.
Not really arch dependent.  Depends on both arch and some
firmware implementation choices, but I guess that detail
doesn't matter here.

> 
> Yet, for a proper support, we need to get the number of
> sources by reading the number from the HEST table. However,
> bios currently doesn't store a pointer to it.
> 
> For now just change the logic at table build time, while
> enforcing that it will behave like before with a single
> source ID.
> 
> A future patch will add a HEST table bios pointer and
> change the logic at acpi_ghes_record_errors() to
> dynamically use the new size.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Trivial comment inline
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> @@ -335,9 +346,10 @@ static void build_ghes_v2(GArray *table_data,
>      build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
>                       4 /* QWord access */, 0);
>      bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> -        address_offset + GAS_ADDR_OFFSET,
> -        sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
> -        (ACPI_GHES_ERROR_SOURCE_COUNT + source_id) * sizeof(uint64_t));
> +                                   address_offset + GAS_ADDR_OFFSET,

I'd prefer if we avoided realigning unless absolutely necessary or
that it is split into a separate patch.
Makes things a tiny bit harder to review.

> +                                   sizeof(uint64_t),
> +                                   ACPI_GHES_ERRORS_FW_CFG_FILE,
> +                                   (num_sources + index) * sizeof(uint64_t));
>  

