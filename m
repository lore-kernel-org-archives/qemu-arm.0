Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp791291njb;
        Fri, 28 Feb 2025 01:33:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVyViRk0rNuSSeWAgU2sOrHkORr2QIa4jOTBXYFGOmQQdVuUttTnJEbis0ldCOBc5akhnf4gLADa46XyA==@linaro.org
X-Google-Smtp-Source: AGHT+IEmHRzmpa1dbF19ePvKDp9zI8T4iVRn5dz2/7R0lVAmjige/AiWxZW9AuI5jyYIYPDVEar6
X-Received: by 2002:a05:620a:4094:b0:7c0:b844:b8fd with SMTP id af79cd13be357-7c39c64d73fmr348341885a.58.1740735232726;
        Fri, 28 Feb 2025 01:33:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740735232; cv=none;
        d=google.com; s=arc-20240605;
        b=UnrA54IkXraZH59dUgA4oCv1+k5lf//zEYrlVKGofcFZz4FEXOIx+6uLj/iKNxGxgN
         WKKmrsm5GrchekOrWwgfbwHXHBF+6/0O8y60X0cHS63aXYz9JmGLbCLE7webamOyTzPs
         QY2j1aGWODrPUPkzQwx3orGVl5uCHOGUR14CnE3u3CJWXVpWeQggb4/r42UcVa3Wd0RB
         f9Pusijj5VA9W9HbKe7AG9ymt8qVtYIlku6gmzbGUkF4/39tFcBS08lM03dIIdxfRISj
         /e8H6kYeCZ0yOlC9TmNWtQSxhG4l/YZq5i/QA6uiIDcjiHkCeRPQqaJTBET5m8LJbwif
         53DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=LZCf0zXUAdAljvOp6eXG0MPqRCJYqUArRrXietLLRIs=;
        fh=t/xybFWV2B884dK2bO1HGz5LnOWlFKzKgenI2zgFzYc=;
        b=cGQdF3khp7axsYa3L0SGhNgE2nDQ6FvlWneUQDNYzEFeM8gFWnK3TmA6fJXuIGlcqz
         Kl8TycbX8rokO02vc2RgxZyEtbdFDPAVa8ss6mNjfRQX9yi62+zFfsRBomIvrLuey9s2
         nKqNUN3maKZMOil9640h01JnzHKlswexaX6zWeVMuS5MsN4Qr6ksEg5RcC3cfjKtZqBa
         imy6/EY7Ig9XSZ/BWp57SEJ3F9F+uKkPY2p6aU71b/KA2thI1J6Y/DcKNG+N0+8fSpXr
         XvMjzro12uYrQ9OPPRg3L4NX/Mor6E7oiLtVOsscdj9Vuqh6oiJGJn9fz/I8IvgxUhaz
         CEAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c36fee8747si287948685a.19.2025.02.28.01.33.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 01:33:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnwkN-0003C5-En; Fri, 28 Feb 2025 04:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwkM-00039i-8F; Fri, 28 Feb 2025 04:33:30 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwkK-0003Bx-L3; Fri, 28 Feb 2025 04:33:29 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z42wZ6cRXz6L5Nw;
 Fri, 28 Feb 2025 17:29:34 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 6E659140B55;
 Fri, 28 Feb 2025 17:33:25 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 28 Feb
 2025 10:33:22 +0100
Date: Fri, 28 Feb 2025 17:33:18 +0800
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 17/19] tests/acpi: virt: update HEST and DSDT tables
Message-ID: <20250228173318.00000f9d@huawei.com>
In-Reply-To: <7a6a1a1ba78f7dac2be6b7335280c1d0b380a175.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
 <7a6a1a1ba78f7dac2be6b7335280c1d0b380a175.1740671863.git.mchehab+huawei@kernel.org>
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
X-TUID: xc//V9e3B/Z/

On Thu, 27 Feb 2025 17:00:55 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> - The HEST table now accept two sources;
> - The DSDT tables now have a GED error device.
> 
> @@ -1,39 +1,39 @@
>  /*
>   * Intel ACPI Component Architecture
>   * AML/ASL+ Disassembler version 20240322 (64-bit version)
>   * Copyright (c) 2000 - 2023 Intel Corporation
>   *
> - * Disassembly of tests/data/acpi/aarch64/virt/HEST
> + * Disassembly of /tmp/aml-DMPE22
This is an artifact of where you happened to get file
from so if we are being really fussy drop the change 
diff in the patch description for it.  I don't really care though.
>   *
