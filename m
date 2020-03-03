Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3096228lfg;
        Mon, 2 Mar 2020 17:26:38 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuh3/oTWC79bSXhLZ8bDEjzQCLHdYo1etadl96OdCDMGBsWGM9ZfH7kp3EqM8kV12QHGeUe
X-Received: by 2002:a05:6214:a08:: with SMTP id dw8mr2068410qvb.121.1583198798436;
        Mon, 02 Mar 2020 17:26:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583198798; cv=none;
        d=google.com; s=arc-20160816;
        b=rwQxGSKOxLnUhSl3BbfjpwICg4KoeXg3Yb6kbIu1aPtqJeaJwZVG9G3z+E+3JalUYl
         yedyxuLg0MXO3/SODPwynjG5CQU5fSZD4Aneh/+c1svx2u/VpXFOGsWnH0GmeaA5sHcE
         Wnqs3CME2aOriuElVCOp2TSwv5YUE+48sAEwSu6H1oJsTBmhbz+HDlz0oHAsdD76hY18
         i9tqIUF8DsPlkLtzotv3TWa5MsCVMneoQWE1T0SXOSTePjIGKSJkQxNH482RR6CR0hWP
         ED6JT5fh999z0yf9TRTCQ15hTTf009hMfDc3KqOXJBgvWIL+ihoEm0MeJMGTe9FbgpFC
         luwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=KU/qTw0VemD54S1uXUt5wOo2JnsQTkaUUz3IVeQu2ms=;
        b=YVrx8fWchIwYWPDoJ/l55AWHGoUVZ7/u6f3TtyQzDuYb3AhCZ0QaKY6Leb9nyCBkoz
         0Ccw9vi3GaKioG7pu6eFcScNkCvJFvJdCwHgpPUjxq/iXTgT7/WKD73FoBoVasmXVO2U
         r4HD03zxkZwNWc6lagY00ySSSVBHc9YxVOAF5Th1Lbb9ywgwwc5BaBU5b4Fg1nPY6GFz
         Dtga2h4ASw7y8Aclo9tXr7e3mb1MRvXC2q+Kx58k0IebBKslScVs4CQvv6+mk3ZnMmM8
         sPMvC3DojBEPahmX6Zreu1T7a/HNMtS9tgK3Dz5E2DeLAc6VHCL8yfXpD4XmCR7Pl8zb
         gu3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si6753385qtg.124.2020.03.02.17.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 17:26:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8wKT-0001kl-UN
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 20:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49790)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j8wKK-0001kP-8N
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 20:26:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j8wKJ-0004n6-3Z
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 20:26:28 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3180 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j8wKI-0004h0-Pf; Mon, 02 Mar 2020 20:26:27 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 80E4BCA58B47A1D97B61;
 Tue,  3 Mar 2020 09:26:21 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020
 09:26:13 +0800
Subject: Re: [PATCH v3 0/6] delay timer_new from init to realize to fix
 memleaks.
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200227025055.14341-1-pannengyuan@huawei.com>
 <CAFEAcA9stgfbRGdn0x2q38vVS9NDyysW656+XkjfyVui3OXXQw@mail.gmail.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <fe95df60-5a97-9c82-36a3-82847a38da59@huawei.com>
Date: Tue, 3 Mar 2020 09:26:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9stgfbRGdn0x2q38vVS9NDyysW656+XkjfyVui3OXXQw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Euler Robot <euler.robot@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rTWESDdLsnUE



On 3/2/2020 9:21 PM, Peter Maydell wrote:
> On Thu, 27 Feb 2020 at 02:35, Pan Nengyuan <pannengyuan@huawei.com> wro=
te:
>>
>> This series delay timer_new from init into realize to avoid memleaks w=
hen we call 'device_list_properties'.
>> And do timer_free only in s390x_cpu_finalize because it's hotplugable.=
 However, It's not valid in mos6522
>> if we move timer_new from init to realize, because it's never called a=
t all. So we also add calls to mos6522_realize()
>> in mac_via_realize to make this move to be valid.
>>
>> v1:
>>    - Delay timer_new() from init() to realize() to fix memleaks.
>> v2:
>>    - Similarly to other cleanups, move timer_new into realize in targe=
t/s390x/cpu.c (Suggested by Philippe Mathieu-Daud=C3=A9).
>>    - Send these two patches as a series instead of send each as a sing=
le patch but with wrong subject in v1.
>> v3:
>>    - It's not valid in mos6522 if we move timer_new from init to reali=
ze, because it's never called at all.
>>      Thus, we remove null check in reset, and add calls to mos6522_rea=
lize() in mac_via_realize to make this move to be valid.
>>    - split patch by device to make it more clear.
>=20
> Hi; I've applied patches 2, 3, 4 and 6 to target-arm.next,
> since I think those ones are OK and they're all arm related.
>=20
> You've already got review comment for patch 1 (s390)
> and 5 (m68k mac_via/mos6522).

Fine, thanks.

>=20
> thanks
> -- PMM
>=20
