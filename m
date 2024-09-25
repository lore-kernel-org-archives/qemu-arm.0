Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp356448njb;
        Wed, 25 Sep 2024 07:16:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXd/Nfy+crXI2dvJ2qXLFg3X4rV2zqaeofMmXJKlay3Ej/HY8R66+LZ1V3EezTcunp/uaFG1Hq+1eyjdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFzvHza27tYC5+M3Pmhcef3j+z5mH3zUs3Acdrc9KctdXo0nnQ3qTkee+6aW7LI6ypPkF5M
X-Received: by 2002:a05:6358:94a9:b0:1bc:9960:9f0e with SMTP id e5c5f4694b2df-1bea858cdf6mr115374555d.11.1727273783760;
        Wed, 25 Sep 2024 07:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727273783; cv=none;
        d=google.com; s=arc-20240605;
        b=NHBp4n/IiNvKXHJFbLJHOTnBeQ2khb+r+wo3EH5eBgNrMN0ymeVDQhB+L5YSE3z3mW
         ZZ5gwWIVplpxEXFtCecoCLfds4JAVuGzBR5Yam8k+erdzi475JpAMEnIFCX1ye4+oLQw
         ym3z3Wka6o5K5nU+WucTctTTIzA2180Rsp11/R+sYeQn8vgaCkA3AkHD6la6oMZu8mjd
         M7CSBsdInbO+AVX9Gc26nkJdZnsJCdi4J4pgovP+TImpCU6vJ6NomjyzlNJWcU85J3Db
         arYocll0UPIoY1JmSgOfTPL0U+EksH1lJX7KogFTZ5sxlKbZbqCIEms6dBVRMf9qHIWz
         6J5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=va3xxT3+0GFVRAMZ2CyaA1zs/9Of+ejvI4MSAK727c8=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=SwYrhC2Mwd20vN5Z89NkUm8YQf2NeXlJLDcO5G/5q3jGoIEJzT+ogjmNf8vjm/iHd3
         WT9LeCddq2b3BahiSDaMAzQUxhqLAc86P4j6bHXLQjqm6c5Y4M+FWDRoh3Dw84b1X/nV
         eOxBKOr4YluZDsTGc6HaoWby7oSny3zDw0WCkCeZYQOoLlYXy9h8TswjX3a5+93bH7xr
         3OYou26z9RsqhsyrBqIuveZvUDitBLMqxvhK0ZMqHkNAndmi75RLMsZ26v7k+8lYrNTD
         C7/O4aXO28qY8dFOPFpeqn6C3j7+H7gFbq/xUJihF3LWo6kNWkD4HMQN+RlImOg66BJn
         0oQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-84e8fcf00adsi215844241.113.2024.09.25.07.16.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2024 07:16:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1stSoD-0001Pq-IF; Wed, 25 Sep 2024 10:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSoB-0001LO-A2; Wed, 25 Sep 2024 10:15:59 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSo9-0001mT-Do; Wed, 25 Sep 2024 10:15:59 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XDJfL1wN0z6G9Gg;
 Wed, 25 Sep 2024 22:15:22 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 4AFBE140B67;
 Wed, 25 Sep 2024 22:15:54 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 25 Sep
 2024 16:15:53 +0200
Date: Wed, 25 Sep 2024 15:15:52 +0100
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 06/15] acpi/ghes: Remove a duplicated out of bounds check
Message-ID: <20240925151552.00004e62@Huawei.com>
In-Reply-To: <271a2d24854e1d63c0913e5d68ac565dc0b8dd42.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
 <271a2d24854e1d63c0913e5d68ac565dc0b8dd42.1727236561.git.mchehab+huawei@kernel.org>
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
X-TUID: JVvxSUDenh2V

On Wed, 25 Sep 2024 06:04:11 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> acpi_ghes_record_errors() has an assert() at the beginning
> to ensure that source_id will be lower than
> ACPI_GHES_ERROR_SOURCE_COUNT. Remove a duplicated check.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
