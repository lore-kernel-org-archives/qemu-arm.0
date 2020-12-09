Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4733189lfb;
        Wed, 9 Dec 2020 00:08:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyhv1NQhW+RrnfxmfxrgbeP0VXcOHCcryhliTctwb7R0wlZN5xF4qmQfjbXSAGdDgBMq9l
X-Received: by 2002:a25:6003:: with SMTP id u3mr2071737ybb.280.1607501334284;
        Wed, 09 Dec 2020 00:08:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607501334; cv=none;
        d=google.com; s=arc-20160816;
        b=GFjL9kbsBvoThQzCp5KRSlV2HlG4xo08w94mgI0M984xCuKNkd2GqWyzdlUqMyIMsE
         0QniLBLZu7OiTn3cUIpz8YXxYQqFcfJWsEMVKookgsXhfft06tFrFWiGWpgSPU8+/NGo
         IvdKV2rnRE7ioW9GyozV1e8Hm4zwSQfJDX/HQYsJ8sL84iwPP7KuNnCWCoE7XhLIuOuE
         H2oTRQFAEYc72ibZbr4bDe1XHwe44h8VVk+kVa5zpIfcgHKsPRl0oWQ3RrByX9lrroJ7
         yNfhabO6FlGttk66F+LxdVCDZsmZ9U0PTjmukthxafGjQU00SvL2VHGmgbQ1Wuz5sbuG
         HQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=EPPV1ciqdWCfaJYBtpPbEoxuJUC2HzpOUTVon6I9D+o=;
        b=xcgv4VIndW88eJl43eQxFm6GvNRmZ1w0sHf2BPYDsp8lS1Fo86ClXQn8Sd6aF2z5NR
         RBjSHk+AKoF4NJ2W144rVGkEccE7bS7TWuLUT246azONpnESLvT549M9wEl66IIFLrJo
         +LW6kSI6OCu4hxL4H7zDl2kxUdjUgOxvDkYZ/zkJdJS8qB5HOMEg6BDDq74lzuOJ0cn1
         H+bf/mvQ99+wzEsGC5TfgKGrFBdlnA6b6tjR9uiumHk8goN/k2EjdWAgY0gWblpmSOHf
         NNO1c2ieeNybVuj43mqoWedq5raAU7jCX/K9LrIJViaNFSP73WEhRSQGMtkYD5muhOqK
         2+eA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si1158602ybi.50.2020.12.09.00.08.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 00:08:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmuWr-0002UN-MF
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 03:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kmuWI-0002Tr-Uz; Wed, 09 Dec 2020 03:08:18 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kmuWF-00063v-J7; Wed, 09 Dec 2020 03:08:18 -0500
Received: from dggemi402-hub.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CrV5d6YmVzXlBB;
 Wed,  9 Dec 2020 16:07:33 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.228]) by
 dggemi402-hub.china.huawei.com ([10.3.17.135]) with mapi id 14.03.0487.000;
 Wed, 9 Dec 2020 16:07:52 +0800
From: ganqixin <ganqixin@huawei.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: RE: [PATCH 0/7] Fix some memleaks caused by ptimer_init
Thread-Topic: [PATCH 0/7] Fix some memleaks caused by ptimer_init
Thread-Index: AQHWxI2APvESNrJgAUaeyWDM19I3pqnuajHw
Date: Wed, 9 Dec 2020 08:07:52 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065E6084@DGGEMI525-MBS.china.huawei.com>
References: <20201127071803.2479462-1-ganqixin@huawei.com>
In-Reply-To: <20201127071803.2479462-1-ganqixin@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=ganqixin@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 "jan.kiszka@web.de" <jan.kiszka@web.de>,
 "antonynpavlov@gmail.com" <antonynpavlov@gmail.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XQPY2KS4EojD

Kindly ping!

Hi all,
  These patches are waiting for review. Could someone help me check them?

Thanks,
Gan Qixin

> -----Original Message-----
> From: ganqixin
> Sent: Friday, November 27, 2020 3:18 PM
> To: qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Cc: peter.maydell@linaro.org; Chenqun (kuhn)
> <kuhn.chenqun@huawei.com>; Zhanghailiang
> <zhang.zhanghailiang@huawei.com>; ganqixin <ganqixin@huawei.com>
> Subject: [PATCH 0/7] Fix some memleaks caused by ptimer_init
>=20
> Hi all,
>=20
> When running device-introspect-test, I found some memory leaks caused
> by ptimer_init in the init function, so I released it in the finalize fun=
ction.
>=20
>=20
> Gan Qixin (7):
>   allwinner-a10-pit: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   digic-timer: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   exynos4210_mct: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   exynos4210_pwm: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   exynos4210_rtc: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   mss-timer: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   musicpal: Use ptimer_free() in the finalize function to avoid memleaks
>=20
>  hw/arm/musicpal.c            | 22 +++++++++++++++++-----
>  hw/rtc/exynos4210_rtc.c      | 19 ++++++++++++++-----
>  hw/timer/allwinner-a10-pit.c | 21 ++++++++++++++++-----
>  hw/timer/digic-timer.c       | 18 +++++++++++++-----
>  hw/timer/exynos4210_mct.c    | 24 +++++++++++++++++++-----
>  hw/timer/exynos4210_pwm.c    | 21 ++++++++++++++++-----
>  hw/timer/mss-timer.c         | 23 ++++++++++++++++++-----
>  7 files changed, 113 insertions(+), 35 deletions(-)
>=20
> --
> 2.23.0

