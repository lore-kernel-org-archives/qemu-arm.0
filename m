Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2496601dyb;
        Mon, 23 Jun 2025 05:00:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXj1f9cmDPF0n0Yws8UgSzVYV1HyOVe9V7oYSeBl6RadNY/RNKtkDbWlrx8ps9t4EpeHGdHSO7RK1qZZg==@linaro.org
X-Google-Smtp-Source: AGHT+IHlsXT7QG1b8mCMHblpzYHKqr3wsZXGJXbbwFotNZHuEMbCAPfFcT7y/09jHxhwT9AmQ7Bd
X-Received: by 2002:a05:620a:8804:b0:7cd:3ef0:d1ac with SMTP id af79cd13be357-7d3fc027409mr1942800285a.15.1750680029044;
        Mon, 23 Jun 2025 05:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750680029; cv=none;
        d=google.com; s=arc-20240605;
        b=N1szVwpNiQnY1g7rVnrwBtcUl6CpA/A4rDip7bfuB5qfzUNFS00TYKXkSkTkAS9Hdt
         ZXJp2PWcMlmHiU3Rko9P7YzNSLMO5C5yrte3ZynyRnC9G6dvqiCj+xdmgduKK5MxZNzp
         2uqawy3BIQNPD4JF3U0v/LhRqPDz9TOa5j+/MmIMQMhdsieCzsYYvd842M+n7zy0LJ/N
         +xMvTTQQ6GZR57ACZb+2U8wQJfwT5nS69aeUeN+2rVP9+tbfwQQbIYIOae/nbWLZ1C/S
         UM4LVeUTTmXA2tNMCdqYtS+nbtDy7QD+xoCPq5JtKAfRA8mZUuqURdPOVxhu7gu2UQrH
         l9mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=i2oBxo89CaK2v5/6po8ua8Kmr5wVvSUgmpTtYu1ljNw=;
        fh=nDSQDZidiGeJ2daiUwC1/Yd3QXQYWxkzypgrkUaKy1k=;
        b=g/N5f96KjaWUTEj2JYROL2BOF+vcuPvig8MtxVHKCN5BgtvzVL5JSZYtWnf8blP6UT
         59pJpP3kQddGtHq9bMZ34TifNYNXY1NnbTJum6yeg9Ji15ENdSWMQw6xwwrgLUQcq0WE
         8eThqwpQfSW7AxhKuwLiEd/p5nylRP4hy/KxB4zfvyyadOcuZjt5aGnV1ion9qlw9tZD
         XRrunfoB2J2lvls2McCI35QImSJ/5xwlgvTt3V4v6Oh9LqDBfcgCYcLlyH2bIBPSqMvM
         6YA/0raD7pvgi/q1lgyjR6fyOdk4/tmZ6pjrXqpn9WjmH/x5oM8z4lN9EL/2YbhTqrm+
         utdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f999f416si775857485a.77.2025.06.23.05.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 05:00:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uTfqV-0004fC-7c; Mon, 23 Jun 2025 08:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uTfqT-0004cF-1W; Mon, 23 Jun 2025 08:00:17 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uTfqR-00066b-0P; Mon, 23 Jun 2025 08:00:16 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bQmmT12txz6HK0P;
 Mon, 23 Jun 2025 19:57:45 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 1E09A1402EF;
 Mon, 23 Jun 2025 20:00:12 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Jun
 2025 14:00:11 +0200
Date: Mon, 23 Jun 2025 13:00:09 +0100
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <gustavo.romero@linaro.org>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v5 11/11] qtest/bios-tables-test: Update tables for
 smmuv3 tests
Message-ID: <20250623130009.0000238d@huawei.com>
In-Reply-To: <20250623094230.76084-12-shameerali.kolothum.thodi@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-12-shameerali.kolothum.thodi@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-TUID: dZaR9Q5Wcm3g

On Mon, 23 Jun 2025 10:42:30 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> For the legacy smmuv3 test case, IORT has a single SMMUV3 node and
> a Root Complex node with three ID mappings of which two points to
> the SMMUv3 node and the remaining one points to ITS.
I haven't checked the blobs line by line but looks correct to me.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
