Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp66412ejb;
        Wed, 7 Jun 2023 00:26:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Z8vs5MnAj4qYd2kQGBrPIEHKVETlM3RhnyexUeB/9BaiSy30CVMTkrbgIop3BXkQ1MztF
X-Received: by 2002:ac8:5f83:0:b0:3e6:3851:b945 with SMTP id j3-20020ac85f83000000b003e63851b945mr2489022qta.67.1686122771892;
        Wed, 07 Jun 2023 00:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686122771; cv=none;
        d=google.com; s=arc-20160816;
        b=vfHDJEYQLF7nTCc7NZ3LP0sD0cefDneTVNc+oDuhiDE9RF+sUIEnl7y2flEoDG4AAy
         4KQu0au5T46p7cMplhDiYfZAExA0VcQV+Gm5dS02cv8jp3f2vv2Sd2kyQ2ZUWnwyu4qq
         UwnckmgRCuL0dZynbZ9f7SCJVWhgm6vyXmO8Wt12GohwE/Gc6P5MUnZMJ0XYlk1w3cp7
         nDhbYkKmfQDWeVEtb+XEcZf9FK0VNEBLF+6hprVmFce4VA2AMF7yLxG6JL1ukuJLFy1/
         MpO+Ix8mBq6lz/g5+zBmYOlaz/4A0I0mj3L6Qum/H3Yr8weDwBSJVjxzRLJXbzurXLx2
         mmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version;
        bh=F9cTmcRX+5KUZJ5a7Xz8n7jbZyHiDM2yNww289XXwH8=;
        b=rNuZcdY9W21iNjHsAZXDST4v3hJhQPdrM1b51O5Wi4LhpC+48EjyZm8oWy6oSmKTba
         +mEYD8WsfLxFJUHj27+jg49YhXtTRn3lJ/+yoKMUIOuUd9jRiXBZmOH/hJNgtY8zSWUx
         o7cbmxpmqU4iSssqrdbYsVP8QkyyQf+SXO2R99OecN5BZhxtwcA6yefHVeB6giXVvf44
         8RWYZWXmdLAa9fXa6yDyQcYhp80qY4JsQ68fs5R7W/8jgcKvszxG8Gnr9rVTILlBMUvA
         97D+tA9M2+WQCtyg4JG+YUFcL+tvr1NjvU8tqfBG6tstsHuTZi2ICoGHWKDltyhEUgAd
         WEhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020ad45dc3000000b005edeebe81b1si7358308qvh.550.2023.06.07.00.26.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 00:26:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6nYR-0006IO-N9; Wed, 07 Jun 2023 03:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenbaozi@phytium.com.cn>)
 id 1q6nYP-0006Ht-Jv; Wed, 07 Jun 2023 03:26:01 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenbaozi@phytium.com.cn>)
 id 1q6nYL-0007e2-AU; Wed, 07 Jun 2023 03:26:01 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwDXtI+TMIBkpQaMAg--.279S2;
 Wed, 07 Jun 2023 15:24:03 +0800 (CST)
Received: from smtpclient.apple (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwAHNEzuMIBkU2cAAA--.1400S3;
 Wed, 07 Jun 2023 15:25:34 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v4 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
From: Chen Baozi <chenbaozi@phytium.com.cn>
In-Reply-To: <20230607023314.192439-2-wangyuquan1236@phytium.com.cn>
Date: Wed, 7 Jun 2023 15:25:23 +0800
Cc: rad@semihalf.com, Peter Maydell <peter.maydell@linaro.org>,
 pbonzini@redhat.com, marcin.juszkiewicz@linaro.org,
 quic_llindhol@quicinc.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A317ED6E-AD4B-475C-A889-0BD4E6A4D1B5@phytium.com.cn>
References: <20230607023314.192439-1-wangyuquan1236@phytium.com.cn>
 <20230607023314.192439-2-wangyuquan1236@phytium.com.cn>
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
X-Mailer: Apple Mail (2.3731.600.7)
X-CM-TRANSID: AQAAfwAHNEzuMIBkU2cAAA--.1400S3
X-CM-SenderInfo: hfkh0updr2xqxsk13x1xpou0fpof0/1tbiAQADEWR-hSkCmgAAs8
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=chenbaozi@
 phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=chenbaozi@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OGTuLYLxGSL2


> On Jun 7, 2023, at 10:33, Yuquan Wang <wangyuquan1236@phytium.com.cn> =
wrote:
>=20
> The current sbsa-ref cannot use EHCI controller which is only
> able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
> Hence, this uses system bus XHCI to provide a usb controller with
> 64-bit DMA capablity instead of EHCI.
>=20
> Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn =
<mailto:chenbaozi@phytium.com.cn>>

