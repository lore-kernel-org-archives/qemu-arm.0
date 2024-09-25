Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp353354njb;
        Wed, 25 Sep 2024 07:11:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVU6iTZC5bBO897q5ghaYY8W+H/Pq/0PmrnwHEd9fzKSjXUA8o/khvZWF4Az9+UTWduXqbQSrKRalfQyw==@linaro.org
X-Google-Smtp-Source: AGHT+IE0rGp9U32mZ/wmcyH6iPBEuUNtlqTt+oC4hoz/WDzBgII80fR7yK5YtaUIHP4B4IVjUBSX
X-Received: by 2002:a05:620a:1a28:b0:7a9:bf9f:5cd5 with SMTP id af79cd13be357-7ace7467477mr442904985a.55.1727273518470;
        Wed, 25 Sep 2024 07:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727273518; cv=none;
        d=google.com; s=arc-20240605;
        b=b0Gj6hEGJPzFLuLR0SO9AC9KWw2wYfSqnL+Q+imG+bZJzZ06IkWU1oiIcUzO1ffOTN
         Rko4hXiyCxch+fMuhHNZGQiazis338VDTdtLYvJh0oJ+Bb1aHos/Vmoj5642DolZN+m6
         iA0UXpyRsNaQ6yChVpiqDQZWIcv91vKmlN7szII8bI3HI1qQQLwK5U2YUD/t0ui5Yi3f
         qlFfzK+YgQqpzGAOfL8BsEjDZX2qCIYO5rBFb7Lp2kFszCx0o5pi1rWsfxm6LARcPsEc
         i6klVaDn+CiXkGuMXJ9hqshVocsT+zOwRR6gHBmyh3uaaD0mMxTC8y+an8JU8YIUA1XQ
         Nrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=z3c6rLbHL5DyDdemkQM9bNT0guk2I87QCbiK0+RD1KI=;
        fh=xorUoMC2IHZi14qbosopEp/1wCIif4VMRZ2S+Ueublk=;
        b=PQolz8hEKSU9L1D9dePGSymj8clbmFF7QHZ8e+4alrCqHRIx5CCSK8FtORqukU6jkI
         EvhVwKJAMQoLklFXLdgyqrDw/3UCubkVV1QflwvzE0+spXsNJBPIkiqtCjt/hYLlW+bz
         ynvJ1Jlnm/C0/8K+R5Np9LELt/4xLzhZwsgRt3WVH5iWWAL11l5tkh0pz12NsbDcyiXY
         CWZDEreZCIK2HZJcogcMYUHIP7zq+8lRHcRQ9WSIdqJRmjv0yoEpw0qR7fF8OZteQeNI
         dFqFODQ3e+Kna+JkuIjw4paEJUBnQcsMiymAdpNTDqiUNDt/2WMEev/+UJet9GcW6sL/
         6UwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acde529c71si402939685a.44.2024.09.25.07.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2024 07:11:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stSk1-0007RS-KM; Wed, 25 Sep 2024 10:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSjj-0006Je-TQ; Wed, 25 Sep 2024 10:11:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSjh-0000SX-KY; Wed, 25 Sep 2024 10:11:23 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XDJSJ4m5Xz6HJbb;
 Wed, 25 Sep 2024 22:06:40 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id C5C49140498;
 Wed, 25 Sep 2024 22:11:17 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 25 Sep
 2024 16:11:17 +0200
Date: Wed, 25 Sep 2024 15:11:15 +0100
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 <linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 03/15] acpi/ghes: simplify the per-arch caller to build
 HEST table
Message-ID: <20240925151115.00005b15@Huawei.com>
In-Reply-To: <6305bca3d0c4fc02853fe2794eeb39f46823c733.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
 <6305bca3d0c4fc02853fe2794eeb39f46823c733.1727236561.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
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
X-TUID: Y6B35FnSUpqg

On Wed, 25 Sep 2024 06:04:08 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The GHES driver requires not only a HEST table, but also a
> separate firmware file to store Error Structure records.
> It can't do one without the other.
> 
> Simplify the caller logic for it to require one function.
> 
> This prepares for further changes where the HEST table
> generation will become more generic.
> 
> No functional changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> ---
> 
> Changes from v10:
> - Removed the logic which associates notification and source
>   ID. This will be placed on a separate patch.
> 
> Changes from v8:
> - Non-rename/cleanup changes merged altogether;
> - source ID is now more generic, defined per guest target.
>   That should make easier to add support for 86.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Odd sign off here ;)
Otherwise seems reasonable to me.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

