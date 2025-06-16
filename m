Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1770317njc;
        Mon, 16 Jun 2025 03:58:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUH9augoVf+4QmyNGp+KZuffwCGoalpiRgyLI/c9LySKkkNWRb6jUd0tkn4IcpoMNFMPJiLFDh49hs2fQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHOnvC/7MjTUke6JcppHK4mmAJF9sYJcV9vIM4uvv4DeqIfn/GfLlgyI8n2uJMAszUlovHm
X-Received: by 2002:a05:6214:27e9:b0:6fa:cc39:95 with SMTP id 6a1803df08f44-6fb4778c235mr138915636d6.11.1750071481472;
        Mon, 16 Jun 2025 03:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750071481; cv=none;
        d=google.com; s=arc-20240605;
        b=igfutdKgdTWIOQEpPhmpkAwqFar0FIkT4hqygpG1gVdTztMH67DxjpehrSYq+rG5c/
         neFxab1uy2aA/s57k1c7ieVkYDqRQjoEgtbchSKq6r/1gnBqIR8lbLZ6h/IYVPMri4Q3
         I8o5r5GSBlNr7q+f7QxPUr4G6taWJEa/59KHtM1rBRzDCbChK7SetCEHkxMaOVo24JWd
         JSaWDQc6zhNWD48tQvy6N206Nb5QRDvP2zvn3CAbHE17+6xFj1NnOaWa6PdkuMcA/9Ob
         0zbsIMwAQkVxNQmqXNMRs4a43STgupftx00cPKbfrbhDZwHi780Ay9lVznwgqynEOnmP
         MfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=bG1DSpSHdVQSy7p8phJ6AEZxqn4JugfLlMgfFBLVkEM=;
        fh=aA8gsM5QP8IJIk1ptJlCXNxyLIMaAhKHt/Cf0Wq9DRk=;
        b=H8TP8RrC2ty67XCM6q1ljP6KgTt1z4WmPWLw3vtlok7zSCTpiB4LrGoxQlXNvvffMt
         9gXD+qJQbPfqd3+MSuYCoiylwdKdobzEN73vYI/Nt8Vp/SfObFntjBPcsf1EXkIrLX0c
         kiQ6ZYPa4HE05RxQR6VxNIdRQtpZLu6Mg5/ENewcpH6on2qvp7u6eZC2t9iCiTUHeGYx
         C6Xy0cWdPZ/KirbI+ZMMImzjSTrQwVP2MvXyFwQHZ8d+wcTQmpYlz/k5+EBMCesj7VR1
         e25lte8XZZDF/o3aaRT2aUomwzch9aD4W6xptGEg1TXYKDZaZs3Owkw49+czkQ+f4gmY
         lEkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb5889dfb9si6368186d6.83.2025.06.16.03.58.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 03:58:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR7XG-0002qU-In; Mon, 16 Jun 2025 06:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uR7XF-0002q7-Ix; Mon, 16 Jun 2025 06:57:53 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uR7XE-0001mJ-1b; Mon, 16 Jun 2025 06:57:53 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bLRgD2SkMz6L5Wc;
 Mon, 16 Jun 2025 18:53:12 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id D33451402F5;
 Mon, 16 Jun 2025 18:57:45 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 16 Jun
 2025 12:57:45 +0200
Date: Mon, 16 Jun 2025 11:57:43 +0100
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v4 4/7] hw/arm/virt: Factor out common SMMUV3 dt
 bindings code
Message-ID: <20250616115728.00004e27@huawei.com>
In-Reply-To: <20250613144449.60156-5-shameerali.kolothum.thodi@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-5-shameerali.kolothum.thodi@huawei.com>
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
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: dx4KsPXT57SI

On Fri, 13 Jun 2025 15:44:46 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> No functional changes intended. This will be useful when we
> add support for user-creatable smmuv3 device.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Nathan Chen <nathanc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
