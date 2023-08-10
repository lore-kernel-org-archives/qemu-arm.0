Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp554932ejc;
        Thu, 10 Aug 2023 03:04:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGstXbCfNPTrmhJm7V+SeRVa+wHAZ4jDpeY4bEcBTEqQ+pAaO3y5ZzEvQzecGiXgltM3qsY
X-Received: by 2002:a1f:5f46:0:b0:487:2263:54f7 with SMTP id t67-20020a1f5f46000000b00487226354f7mr1767974vkb.9.1691661885787;
        Thu, 10 Aug 2023 03:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691661885; cv=none;
        d=google.com; s=arc-20160816;
        b=fsbNwG5acvOhVS587a2nLiLOifK/3RGz06bTyf9L4ytO1XBv6Gq5q++48zWYFdeYkw
         iEGoFnFbMuQkeelHsvHiXYV5FOF+GKTSGK/hkKiplUDzatmpgtaGIpvg6lt/Vew3mWBD
         /nubmANDnX4xgnmRs93Cjkdm7x+gAx+RF3ytLqEafJVT461JBscH2qpJboIJU8VINPbf
         DDdFENs1PuaZrla96MUJJjwZ4AFLCTrDwBYu8XNBZwYu8rpCNWmMNR92nH5jXMre0b/x
         Uvl+2D3nPOysgRX8C2VosMR8GVzSpTrFBCGpVcvubX3KWl0wexIdWo78ae+M8FAvysrA
         YAVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=75KuGIAgmf3HbiIYrdGCaehbEbmSJ/QI8gL7GShkFOI=;
        fh=Jb84UiWp9DpEav/08maLmT6NHd4eBDwxnb4HbYuUoiY=;
        b=fadeiABKP2xJsnwehG+W0SuGCmVd9OU/52bFo9ZiBASPGJjOxN19hzEWX5Ikf60kOm
         nuQfhclXeeCPrVH1tBUydqQSBd1BMnWdv+iIaZfBTg8IwUo0uW0ru10wm9eCyO6XU6oj
         2sg3ETJsVXT/ildVDnJL+2rX/0V3Z2EWbYKM40AzPFMMKOzIRykHfm1Qpy5A+SDQN3RH
         3UMpRG2XqUL9jGD3rie5NpGU4NIg5A5ph3/QDLi+PJMvIK+MhulBx654niv+CmtKfZ+1
         wyvVnIfK4x5atHNTFzYSM4tXJJI4cewWDxX9VoaKzi+R8bDyi60TuCzoHxm8p7GfmJmj
         3fNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11-20020a0ccd0b000000b0063d578ee027si587782qvm.355.2023.08.10.03.04.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 03:04:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU2X0-0000kE-NX; Thu, 10 Aug 2023 06:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qU2Wz-0000k3-Ck
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 06:04:37 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qU2Ww-0000fJ-B3
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 06:04:37 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RM2Zy0Plpz6HJY6;
 Thu, 10 Aug 2023 18:04:26 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 11:04:30 +0100
Date: Thu, 10 Aug 2023 11:04:29 +0100
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
CC: qemu-arm <qemu-arm@nongnu.org>
Subject: Re: CXL Namespaces of ACPI disappearing in Qemu demo
Message-ID: <20230810110429.000041cb@Huawei.com>
In-Reply-To: <2023081017304217150830@phytium.com.cn>
References: <2023061615433049315231@phytium.com.cn>
 <2023081017304217150830@phytium.com.cn>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7tzFCa4FhD8B

On Thu, 10 Aug 2023 17:30:43 +0800
Yuquan Wang <wangyuquan1236@phytium.com.cn> wrote:

> Hi, Jonathan
>=20
> When I tested the CXL topology in qemu, I found the linux kernel could fi=
nd=20
> and match the ACPI0016&ACPI0017 in relevant drivers, however, I could not=
=20
> find these information in dumped ACPI tables (like DSDT).=20
>=20
> Hence, I guess there is some problem in my method, maybe you have some=20
> suggestions if you have some time to look at this email.
>=20
> My environment:
> qemu: Jonathan_qemu/cxl-2023-08-07
> Linux: v6.3.0
> ACPI Disassembler: iasl/version 20230628
>=20
> My qemu script is the same as the first example in qemu/docs/system/devic=
es/cxl.rst,=20
> as below:
>   qemu-system-x86_64 -M q35,cxl=3Don -m 4G,maxmem=3D8G,slots=3D8 -smp 4 \
>   ...
>   -object memory-backend-file,id=3Dcxl-mem1,share=3Don,mem-path=3D/tmp/cx=
ltest.raw,size=3D256M \
>   -object memory-backend-file,id=3Dcxl-lsa1,share=3Don,mem-path=3D/tmp/ls=
a.raw,size=3D256M \
>   -device pxb-cxl,bus_nr=3D12,bus=3Dpcie.0,id=3Dcxl.1 \
>   -device cxl-rp,port=3D0,bus=3Dcxl.1,id=3Droot_port13,chassis=3D0,slot=
=3D2 \
>   -device cxl-type3,bus=3Droot_port13,persistent-memdev=3Dcxl-mem1,lsa=3D=
cxl-lsa1,id=3Dcxl-pmem0 \
>   -M cxl-fmw.0.targets.0=3Dcxl.1,cxl-fmw.0.size=3D4G

Hi Yuquan,

Ah. I may have messed up dropping a patch set that was factoring out all th=
e PXB stuff to SSDT
in my latest tree.

I dropped it because it was nasty to rebase and didn=E2=80=99t seem likely =
to go upstream particularly
quickly as we pushed the decision on it back behind a load of other PCI cha=
nges.

I tested the latest tree heavily on arm, but was lazy on the x86 front :(
as I forgot that that change might have broken things (and all the new stuf=
f was architecture
agnostic).

Right now for x86 tests with my tree I'm getting a freeze on booting so som=
e debug needed.
Even better, on upstream qemu with near vanilla kernel I get a segfault ins=
tead in pretty
much the same place.
This is going to be a 'fun' day I guess.=20

Jonathan



>=20
>=20
> Many thanks
> Yuquan

