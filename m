Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp789358njb;
        Fri, 28 Feb 2025 01:29:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV4dwP0/hJ8FRIFNaY/f+H07bsnMF/nRkXQzT5wyVaw8EYUHwwpwv9CuXqfs7EJrihjO9Ffse9AsqIdEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFPHsfoLIcnfx1BAl+gZvkGlXiYcMh7ZVxu76CKTKXthAfwCW0YZto4gDd7orGrGpKHtuVZ
X-Received: by 2002:a05:620a:2590:b0:7c0:9fb1:683d with SMTP id af79cd13be357-7c39c4c70d8mr396300185a.34.1740734964192;
        Fri, 28 Feb 2025 01:29:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740734964; cv=none;
        d=google.com; s=arc-20240605;
        b=IFTa03eBYeMuhlG8x61C4D8eXmnmgxqQlpAE2OX2qBwk7pT8WtbnPzKcaESrbCiez4
         epS/88GUTOeJg83jOiKPUCD++ipYV+HKT7xV9R5XuN4WxrkpAQUtt0Rt8z0dPiRnujik
         d21xNLqmzEs3o57l19GCL3JYMuDHeOsf657jhuQURMOHv6I+Baj8VboiYMC3igj9VrMy
         CK8df4uA260vEnqVkRrUEdTFdvSj0S1m4iWRBsiC7WjN9n9ncP3ykHCoG9tTIR5AWKxU
         ZxvpegTRvnzDW8TPz9M1KDvI2n0lcZTb/NUi8PoFJFqHri7MmaBuwDfzO177+xZRIsEZ
         vb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=Iy7KSzrGtwEidf5CNQgAnsucNcY72K/xMxNj0y2rJC0=;
        fh=t/xybFWV2B884dK2bO1HGz5LnOWlFKzKgenI2zgFzYc=;
        b=HxFS6d3iz72NJfV9uzR6C65wImy8JQkFD9xR/Sw9OU1eBXeth9iUakzLSDFL6nxcsc
         rF2uA70cD1P+/+KNLXVIAXrjufWkT6pHincN7uNGD4dTAR25N8CfWE3IogKfrfHXHeov
         t2ztS7GpLrQ9IIfda9b3S4mnyi/eQGY/ceH/bbi/LELV9uktIlXtLtT1cKV7SD0TLtQo
         9BeXXgXho0kWfIEguqj4UNi0v00rK0WLhDilVsXQfOmhnT3UuUhEXI6InnkP3gbrHW6r
         0VQJWL+Xy0tZt8hG7UrOaebszEGXgKjxYXISbk2bvNKE8vVBUJL/gvHKIHlQ12MqoVWM
         rBww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c378da4dabsi278650885a.471.2025.02.28.01.29.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 01:29:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnwgD-00061U-Fv; Fri, 28 Feb 2025 04:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwgB-0005sE-3N; Fri, 28 Feb 2025 04:29:11 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwg9-0001Yq-Gn; Fri, 28 Feb 2025 04:29:10 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z42sj2ZQ4z6K9Tg;
 Fri, 28 Feb 2025 17:27:05 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 44AEE1400D4;
 Fri, 28 Feb 2025 17:29:06 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 28 Feb
 2025 10:29:03 +0100
Date: Fri, 28 Feb 2025 17:28:58 +0800
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 13/19] tests/acpi: virt: allow acpi table changes at
 DSDT and HEST tables
Message-ID: <20250228172858.00003e65@huawei.com>
In-Reply-To: <9b15b83ec3726b6f29583d419e0c6c6aa01a9447.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
 <9b15b83ec3726b6f29583d419e0c6c6aa01a9447.1740671863.git.mchehab+huawei@kernel.org>
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
X-TUID: 6/vlSgZ/VjCR

On Thu, 27 Feb 2025 17:00:51 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> We'll be adding a new GED device for HEST GPIO notification and
> increasing the number of entries at the HEST table.
> 
> Blocklist testing HEST and DSDT tables until such changes
> are completed.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Acked-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8bf4..0a1a26543ba2 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,7 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/HEST",
> +"tests/data/acpi/aarch64/virt/DSDT",
> +"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
> +"tests/data/acpi/aarch64/virt/DSDT.memhp",
> +"tests/data/acpi/aarch64/virt/DSDT.pxb",
> +"tests/data/acpi/aarch64/virt/DSDT.topology",

