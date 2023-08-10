Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp689663ejc;
        Thu, 10 Aug 2023 06:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj+8Qa7f4jHCdInWoNAvgRzzffik6iwuiCooTXUzRvYHxeqgl57WQOq7w73f+GzQb7hRil
X-Received: by 2002:a05:620a:235:b0:76c:b278:980c with SMTP id u21-20020a05620a023500b0076cb278980cmr2356505qkm.41.1691675791803;
        Thu, 10 Aug 2023 06:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691675791; cv=none;
        d=google.com; s=arc-20160816;
        b=DAeVKOu9+G8cuTPFpeOsPNhwJ1uFgLU1u0BZCtsGFt0EL8HniKYkxmVKdVp/5y+9e3
         ZvkWQkbL8myKg7NYH3ZuzlI+B/lC0IHsbWxmmBVhCf551+feverfseGLfT7LdXacHUTX
         0yvOyQszYpaJv4S0YL24PVVuUw+v72XJExwqdPohiaCo73p973vquKCWX+fSfohuKHE0
         irdpn8EXi9TCWadDjBEagcquboJgh4fOdRSqgfwwgOug4cJ5yGWr0Bp6Qc38mdpMbYM3
         SwA7Rb/1Js2wkdxLkJdjEwIflJmKcjO/TAPR7IMgfTqpLY8pZyTA4KVTogdtXLQDAFnF
         0AvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=l96fEFKupEZ1geDEE4a6JgxL3eoEhH/FSL8MaDAhZKQ=;
        fh=Jb84UiWp9DpEav/08maLmT6NHd4eBDwxnb4HbYuUoiY=;
        b=Ttqhp1SFi0kMZuY9SZU19a9kqLja4v5Q3IdlgAIEFSN/TX2/GtJW2Y0llwWPvuBLRF
         QHdtXFf6BgVs6yh2YHN/Pj2qqUpFm03e5fRhgswdHe7XKUzoTjshTzV95YqvhBLvkcHs
         M5yeTZzr5+K/fUTsc2qD5jA/lDnXkR8m6mh67WxrMHchN3jhLO2M5qPdbKI1rVeHfy2k
         nS2t6ZKiUVVDvaf2+1ru45YWfZ/G7QVNO6yoKf1RrinFHfuPRjsKsVgIeRcsSV+WuJpD
         RrzIxacVPmWTJ5gxxO2mDt+Nz4s7vTR5j040AKK3WvGhw5TWBn9eeQKTTIVIYOROOjFh
         FXpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn40-20020a05620a2ae800b00767e30fbe34si865722qkb.488.2023.08.10.06.56.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 06:56:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU699-0007bN-K6; Thu, 10 Aug 2023 09:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qU698-0007b8-IF
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 09:56:14 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qU695-0000AN-1z
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 09:56:14 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RM7dt39s1z6J6pM;
 Thu, 10 Aug 2023 21:52:18 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 14:56:02 +0100
Date: Thu, 10 Aug 2023 14:56:01 +0100
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
CC: qemu-arm <qemu-arm@nongnu.org>
Subject: Re: CXL Namespaces of ACPI disappearing in Qemu demo
Message-ID: <20230810145601.000041ea@Huawei.com>
In-Reply-To: <20230810110429.000041cb@Huawei.com>
References: <2023061615433049315231@phytium.com.cn>
 <2023081017304217150830@phytium.com.cn>
 <20230810110429.000041cb@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
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
X-TUID: 6K1xBk8i6Fy2

On Thu, 10 Aug 2023 11:04:29 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Thu, 10 Aug 2023 17:30:43 +0800
> Yuquan Wang <wangyuquan1236@phytium.com.cn> wrote:
>=20
> > Hi, Jonathan
> >=20
> > When I tested the CXL topology in qemu, I found the linux kernel could =
find=20
> > and match the ACPI0016&ACPI0017 in relevant drivers, however, I could n=
ot=20
> > find these information in dumped ACPI tables (like DSDT).=20
> >=20
> > Hence, I guess there is some problem in my method, maybe you have some=
=20
> > suggestions if you have some time to look at this email.
> >=20
> > My environment:
> > qemu: Jonathan_qemu/cxl-2023-08-07
> > Linux: v6.3.0
> > ACPI Disassembler: iasl/version 20230628
> >=20
> > My qemu script is the same as the first example innn qemu/docs/system/d=
evices/cxl.rst,=20
> > as below:
> >   qemu-system-x86_64 -M q35,cxl=3Don -m 4G,maxmem=3D8G,slots=3D8 -smp 4=
 \
> >   ...
> >   -object memory-backend-file,id=3Dcxl-mem1,share=3Don,mem-path=3D/tmp/=
cxltest.raw,size=3D256M \
> >   -object memory-backend-file,id=3Dcxl-lsa1,share=3Don,mem-path=3D/tmp/=
lsa.raw,size=3D256M \
> >   -device pxb-cxl,bus_nr=3D12,bus=3Dpcie.0,id=3Dcxl.1 \
> >   -device cxl-rp,port=3D0,bus=3Dcxl.1,id=3Droot_port13,chassis=3D0,slot=
=3D2 \
> >   -device cxl-type3,bus=3Droot_port13,persistent-memdev=3Dcxl-mem1,lsa=
=3Dcxl-lsa1,id=3Dcxl-pmem0 \
> >   -M cxl-fmw.0.targets.0=3Dcxl.1,cxl-fmw.0.size=3D4G =20
>=20
> Hi Yuquan,
>=20
> Ah. I may have messed up dropping a patch set that was factoring out all =
the PXB stuff to SSDT
> in my latest tree.
>=20
> I dropped it because it was nasty to rebase and didn=E2=80=99t seem likel=
y to go upstream particularly
> quickly as we pushed the decision on it back behind a load of other PCI c=
hanges.
>=20
> I tested the latest tree heavily on arm, but was lazy on the x86 front :(
> as I forgot that that change might have broken things (and all the new st=
uff was architecture
> agnostic).
>=20
> Right now for x86 tests with my tree I'm getting a freeze on booting so s=
ome debug needed.
> Even better, on upstream qemu with near vanilla kernel I get a segfault i=
nstead in pretty
> much the same place.
> This is going to be a 'fun' day I guess.=20

I haven't gotten very far with that other issue (beyond reporting where the=
 segfault was)
but in the meantime I can boot machines as long as they only have one core.

So took a look at your issue - be it on the cxl-2023-08-07 branch rebased o=
n qemu/master
from today (side effect of looking at the segfault that was stopping me get=
ting to this).

For me at least the branch does create an ACPI0017 DSDT entry and an ACPI00=
16 one
and all the CXL devices turn up in /sys/bus/cxl/devices as expected.

So I'm afraid I have no idea what is going wrong for you :(  Maybe you are =
running
a BIOS that is overwriting them? - I'm just using the default from the same=
 qemu build.

Jonathan


>=20
> Jonathan
>=20
>=20
>=20
> >=20
> >=20
> > Many thanks
> > Yuquan =20
>=20

