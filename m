Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2490400dyb;
        Mon, 23 Jun 2025 04:46:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW91pcUcHENF5+gfPC8tERVjMqwBuzRwMQIqaVc8N2TNfoIHw9TCM1w5Lkjh+iIzHvLChiRL55BzKBPtg==@linaro.org
X-Google-Smtp-Source: AGHT+IHLzDbtnm522PBkE+QhFBHldxbMFjq/3P9w4K2eidcqDoRdb6Q50Q/rqm7IfJ8tao2wePwy
X-Received: by 2002:a05:622a:64c:b0:4a7:1417:37e8 with SMTP id d75a77b69052e-4a77a1b054dmr157144061cf.10.1750679204433;
        Mon, 23 Jun 2025 04:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750679204; cv=none;
        d=google.com; s=arc-20240605;
        b=g6k8PqQ48SBspJbPomdh7a8YYQaHpXGtfyut54t+ZHCwHHxwDqoalEHlqhz3IDIJ5Z
         jL8ZQTDuNjUQEm79kg7CNI3340Me6Az/KJJ65cDK0J2of+Kb7N7VGRWZN9Vb+HNtJGYY
         at2yCp+1kjW3WW8FWy9+UbVUbL6LNWlzl24yDxef1SBHuIKFGqa4LxzmYLRdmQO4cief
         d7J4yIROzxwQxUVpkTGBJm2Xp43WX8gl0YJ8nWFpT8Bv6Tk8JNL3Q2hmLKUFxsFmX1Gf
         xuzZl+J0XhY6+w83WIVq9IGWMjefOcWzQPysmWC4r06/Q5aDJ9MXr4hV4/5LyeYXH0E6
         8Nug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=R7Yz5rXDJIX0yYgdzjWdp5QNXmAlqiXROc3ruVxs5E4=;
        fh=nDSQDZidiGeJ2daiUwC1/Yd3QXQYWxkzypgrkUaKy1k=;
        b=IDeKpgKN0QAW46KjIDcxgqQhNDHp9PuzGNOq0XkFutudh/lzecbmTDy67pNSVJLkxD
         hWra0uU8cDL0tHSBXqYSuH8V93fwJtyIOQVEiPWtkwOZD1R/nU0OvvMQ4/YnG+tXdIuq
         oB6pPW4q9FeWt6xVSY8r/7BXnLVbQZDSm14KXsKOqDA+tZgSRAz6pJxfxSnjxfaqu8pk
         aNLnKoPUTX0JciFNXkf2S1Gs5L4yWky9qsMl+GuL32w2LRXWNdwlHRSIP2TQJbxZQ17u
         5HYcgCoFi2EAW9ixb+S52JFutiuA+NKPZyUFwFY7VTJiaiNySk1hkJJdQuoFiJSmAzwc
         zIIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a779d4912bsi81162421cf.30.2025.06.23.04.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 04:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uTfd6-0006Ak-JI; Mon, 23 Jun 2025 07:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uTfd4-0006AI-Ng; Mon, 23 Jun 2025 07:46:26 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uTfcz-0004Po-Me; Mon, 23 Jun 2025 07:46:25 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bQmPY2G4Rz6L5Tg;
 Mon, 23 Jun 2025 19:41:21 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 527BE140277;
 Mon, 23 Jun 2025 19:46:17 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Jun
 2025 13:46:16 +0200
Date: Mon, 23 Jun 2025 12:46:14 +0100
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <gustavo.romero@linaro.org>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v5 07/11] hw/arm/virt: Allow user-creatable SMMUv3 dev
 instantiation
Message-ID: <20250623124614.0000422e@huawei.com>
In-Reply-To: <20250623094230.76084-8-shameerali.kolothum.thodi@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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
X-TUID: QwPwHP3ZIfTv

On Mon, 23 Jun 2025 10:42:26 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Allow cold-plugging of an SMMUv3 device on the virt machine when no
> global (legacy) SMMUv3 is present or when a virtio-iommu is specified.
>=20
> This user-created SMMUv3 device is tied to a specific PCI bus provided
> by the user, so ensure the IOMMU ops are configured accordingly.
>=20
> Due to current limitations in QEMU=E2=80=99s device tree support, specifi=
cally
> its inability to properly present pxb-pcie based root complexes and
> their devices, the device tree support for the new SMMUv3 device is
> limited to cases where it is attached to the default pcie.0 root complex.
>=20
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

LGTM

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


