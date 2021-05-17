Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1622689lfm;
        Mon, 17 May 2021 13:48:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ+ay+opdiRgkeOG4K2yjVeX/83M29XvdeDBfxOsq9MNurrEy0/n21+G7qQMJnuDImoyec
X-Received: by 2002:a6b:e00a:: with SMTP id z10mr1502021iog.109.1621284508024;
        Mon, 17 May 2021 13:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621284508; cv=none;
        d=google.com; s=arc-20160816;
        b=qJlV7B3Y1xeXxcyAZKZuzlCT7pIfYbUx5qma9eecXnFodQuvTLDmigEAiXcFUEsqlz
         zHQxba3cuExcErQqLD0yACy15radKOtAifEK/xo/l093rGYXj5eTC61JuIGeUQhjawYe
         HXxfoWaqUyZ6pjRlK56/8youT/M0dyhViGCaGj6wUqLMBWk9eaf25UX5tAJY63kpODDo
         ED5BA0kXeKtWRMf/fnTnPDrjdsg2LFYURWaiADJDgf4r4GJ1xkNZwWs/vlPmbK+kBUvL
         lO8PRkwI9/SRbHi+0RnJ1Y1o72bnL5+Of/NIZUAU4ZIHi5dCid63VZZXIDY/nfoyo5hC
         X5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=hG733ZeBilDaq8+y+JVQ73NNucOXxfWXj7DuztP4EFo=;
        b=m6uZj0kYfkZZzXmtZIx5kX66QbEdhi0iVuK5yaayY5SKNh04vWywyrYPQVZYwsQGKQ
         yPjqKTqUyIWyDOQzPuQrF2GbQb0LeyY1p86H/wQvHrom1ZdUn6rnywiMGQwGzYa++tYi
         A2ZXxBwL8LJQRqhgdcVNzAm1E3nE/RhLRnt0BK5GFADnSgS+NPlBratSeHgBBCvAne7O
         BfbSlHNvEFbTXMq83jctJmQHVyQGLa6gEcJiYFfiiKNw9HR5PDZ1Z/zX63uEcVutpn1u
         b1cp9Z3ISwHvpk2OI82dVPE4t0meUu86PipSCje94Brm+SpE9au1RTqBpQZ8Xj9u1spV
         1v3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si15966725jat.35.2021.05.17.13.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 13:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:37620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1likA7-0000KV-83
	for alex.bennee@linaro.org; Mon, 17 May 2021 16:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1lik9z-0000K8-Pe; Mon, 17 May 2021 16:48:19 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1lik9x-0007TV-Gx; Mon, 17 May 2021 16:48:19 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FkWMs5YDzzQp36;
 Tue, 18 May 2021 04:44:41 +0800 (CST)
Received: from dggema723-chm.china.huawei.com (10.3.20.87) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 04:48:10 +0800
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 dggema723-chm.china.huawei.com (10.3.20.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 18 May 2021 04:48:08 +0800
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.2176.012; 
 Mon, 17 May 2021 21:48:06 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: RE: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu members
Thread-Topic: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu
 members
Thread-Index: AQHXSj7Bs+01wvGUNEWbtmBiG2lmC6rn8VxQ
Date: Mon, 17 May 2021 20:48:06 +0000
Message-ID: <6c8f9c3502384f648f30c7381e87dda9@huawei.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-5-wangyanan55@huawei.com>
In-Reply-To: <20210516102900.28036-5-wangyanan55@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.79.135]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=salil.mehta@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Song Bao Hua \(Barry Song\)" <song.bao.hua@hisilicon.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>, yangyicong <yangyicong@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xLEcu4pZYIvx

> From: Qemu-arm [mailto:qemu-arm-bounces+salil.mehta=3Dhuawei.com@nongnu.o=
rg]
> On Behalf Of Yanan Wang
> Sent: Sunday, May 16, 2021 11:29 AM
> To: Peter Maydell <peter.maydell@linaro.org>; Andrew Jones
> <drjones@redhat.com>; Michael S . Tsirkin <mst@redhat.com>; Igor Mammedov
> <imammedo@redhat.com>; Shannon Zhao <shannon.zhaosl@gmail.com>; Alistair
> Francis <alistair.francis@wdc.com>; David Gibson
> <david@gibson.dropbear.id.au>; qemu-devel@nongnu.org; qemu-arm@nongnu.org
> Cc: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>; zhukeqian
> <zhukeqian1@huawei.com>; yangyicong <yangyicong@huawei.com>; Zengtao (B)
> <prime.zeng@hisilicon.com>; Wanghaibin (D) <wanghaibin.wang@huawei.com>;
> yuzenghui <yuzenghui@huawei.com>; Paolo Bonzini <pbonzini@redhat.com>;
> Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Subject: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu membe=
rs
>=20
> We create and initialize a cpuobj for each present cpu in
> machvirt_init(). Now we also initialize the cpu member of
> structure CPUArchId for each present cpu in the function.

[...]

>          qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> +
> +        /*
> +         * As ARM cpu hotplug is not supported yet, we initialize
> +         * the present cpu members here.
> +         */
> +        machine->possible_cpus->cpus[n].cpu =3D cpuobj;


when vcpu Hotplug is not supported yet, what necessitates this change now?


