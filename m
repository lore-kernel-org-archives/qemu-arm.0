Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp346250njb;
        Wed, 25 Sep 2024 07:03:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWymiu9Za9g3/KRN1VX1L0T6/BSLO0baDsWxBgnzUKQwwBZI2dDWtONsfwdBXJtHdT3Ke/qgud3YwM6Gg==@linaro.org
X-Google-Smtp-Source: AGHT+IEUkUgZDwsXvbT5d27o0nhoq9i8JegAkqFkSakjyqYydthAu/eFuetsWIirghWfRjln105f
X-Received: by 2002:a05:6214:4306:b0:6c7:c74f:7173 with SMTP id 6a1803df08f44-6cb1ddef29cmr40245556d6.39.1727273003491;
        Wed, 25 Sep 2024 07:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727273003; cv=none;
        d=google.com; s=arc-20240605;
        b=Nw0OY9PF0bWPnOeCRVEg3wdZH7TwnW458daxz54WT+AnZk/jLL4M9dZDYYv1ukRX0z
         ScLr0k1TTVxTTWPiJL3N3hhGTiMHACuTCJV0A+woOCliKzFOAh6hyq6w1iaHFMfAA+tv
         /TWtjd6rXUGBcp3J2Mi8yAZBqd9szE6LE5G9fqpVznN7h32AUwKDirPY6Ua5fetVic+P
         Rf/x6aig7Y7LpAJik9FUX6+M5j4F+DXtFnWdui/PBXm+Pb2ZEztpQMTqd4Qp52qmHWPx
         wqg+a9qucvIFFlir4YaK6FvGw7M/5nf/by0oqBYlo1Tu+EMXV4Joh/oTEhLHZ9ynAfoM
         c/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=V9mUbuHjx61iSbntfPqe/26Hwf4coG/abx9TjDpGPLk=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=kn2eRLfh6vr9cGYtmcioZr+5LaEeHIyxEka7kjGhys/O50obttNDCxRqK9mDxvRxZ7
         iTW6ILLANG5DGppwTI33zXOQnJiE1n0O4TJdXT3baJqi0HRo2x3AOvyydQc199CMdQIR
         zVADv4KwV6uo/wvPw7K8klA0KiUI3NrBBPt4xlQKimuZKfWxrfYCwq8qzuVdgKR86I7R
         3UVvt9mGJ6rTBgUNF+xuKLTnZl8FO40hDgoyF+eCRQtka9Z0TWXWV3VPiGBzqwWmLcE0
         RE5OMnwge2ahDhqVU7VNKRjBjQ1ggyFZpytzFW3XEr42E0KYZV4pYkeDyWXMK6y1qxVx
         NNCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb0f7b6b1fsi39732056d6.469.2024.09.25.07.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2024 07:03:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1stSbZ-0004nE-Eb; Wed, 25 Sep 2024 10:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSbU-0004kJ-QD; Wed, 25 Sep 2024 10:02:53 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSbS-0007gR-P3; Wed, 25 Sep 2024 10:02:52 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XDJH16KMVz6D8wR;
 Wed, 25 Sep 2024 21:58:37 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id CFAAE140498;
 Wed, 25 Sep 2024 22:02:35 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 25 Sep
 2024 16:02:35 +0200
Date: Wed, 25 Sep 2024 15:02:32 +0100
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 01/15] acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
Message-ID: <20240925150232.00005374@Huawei.com>
In-Reply-To: <0518c86d8724ba7f9986727676b64c531bd26b6f.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
 <0518c86d8724ba7f9986727676b64c531bd26b6f.1727236561.git.mchehab+huawei@kernel.org>
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
X-TUID: Z3GZR8EbV1f1

On Wed, 25 Sep 2024 06:04:06 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This is just duplicating ACPI_GHES_ERROR_SOURCE_COUNT, which
> has a better name. So, drop the duplication.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
