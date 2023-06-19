Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2869569ejt;
        Mon, 19 Jun 2023 08:25:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5hcBWl7nDqYKEqEHxuiK1SVPKqnkcbRy4irZOlcq+lkpXwX1+HMpJ+eeZ6aKVrtP3I+lCg
X-Received: by 2002:a05:6214:1d22:b0:630:198c:3c60 with SMTP id f2-20020a0562141d2200b00630198c3c60mr1866007qvd.23.1687188312016;
        Mon, 19 Jun 2023 08:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687188312; cv=none;
        d=google.com; s=arc-20160816;
        b=CG8uPW8Gu/KwcdBws2Wwft5ga5ry2UFJMI1Q/qr5kyB25I6RtMh8x6ZO/t04pP91KQ
         UNoy0VdlE8YWdye9EMt0CWpfiUgIJl6hOnvE58S6mNuCyStkXY410tIyMBxZ6fEPPkEC
         Q2GfGBwX4vEJH1RBTL4esEle65GHBjJCaJOw5sW7AN70TbIsb4x6tI8ElNN1l56aq5PM
         IE6nwMMVeIQi8MQUVEfhqPrsCDyIhahXUOUBhR3jXk+vMez4595ZSoFbn2qwXnlh++cV
         eRs5lNs4Gf+/nP0W53pcw4oLbIpu71cLVdesnTHxEUGfKFR+VigSNJj6Fl/qqlwPKeJ7
         4wEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version;
        bh=Sd/NyHCeIzkJ+rYkmzlxN7LV2J3nXm5zMBg3GSkC1RQ=;
        b=T6luKH9qTtvOFgJ4JIIBZm9cM47Tg7bZ1Bd0gq4d+2j2Mn1I32DHoxNHMy7swhECA7
         260cY/batx/xjirrOdFqYB/oLhikhGwNyqUyBmZiGd+wsVTcxJbYrKIfbQUx6KxKYrwN
         RWH2rgqxcodugZTwaynoXUIdtGjp2DU7ADh58kTWg66TcyveSrzBLaizciic/q8ofo0a
         mn/G8WYXaOnqA0nKBaE5SlEeVrni0jO5OlOISw8u7gqvqSXQGf+YQKGSlGGdnkOzFcce
         edJ24NGMwzKnJbkuaS53YdeyukRIZuJPYOX9L2XTG4rGIxh5MBpM8zMpTgkX8ShuhXZ4
         IAow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020a056214124900b00631eaf54a92si43339qvv.407.2023.06.19.08.25.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBGkB-0005JK-1L; Mon, 19 Jun 2023 11:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenbaozi@phytium.com.cn>)
 id 1qBGk9-0005It-5m; Mon, 19 Jun 2023 11:24:37 -0400
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenbaozi@phytium.com.cn>)
 id 1qBGk6-0004KZ-Q2; Mon, 19 Jun 2023 11:24:36 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwDXX2G5cpBkKjNtAA--.4643S2;
 Mon, 19 Jun 2023 23:22:33 +0800 (CST)
Received: from smtpclient.apple (unknown [118.248.140.64])
 by mail (Coremail) with SMTP id AQAAfwA3mpYbc5Bk16QAAA--.1469S3;
 Mon, 19 Jun 2023 23:24:11 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v4 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
From: Chen Baozi <chenbaozi@phytium.com.cn>
In-Reply-To: <CAFEAcA-sv5R0RTp5z-i70dYj0GM88xVOOQ8ktp4k2adD-BRJQw@mail.gmail.com>
Date: Mon, 19 Jun 2023 23:24:00 +0800
Cc: Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com,
 pbonzini@redhat.com, marcin.juszkiewicz@linaro.org,
 quic_llindhol@quicinc.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C89FDFEE-F033-49FA-A5CC-DA2A7FC8EC0A@phytium.com.cn>
References: <20230607023314.192439-1-wangyuquan1236@phytium.com.cn>
 <20230607023314.192439-2-wangyuquan1236@phytium.com.cn>
 <A317ED6E-AD4B-475C-A889-0BD4E6A4D1B5@phytium.com.cn>
 <CAFEAcA-sv5R0RTp5z-i70dYj0GM88xVOOQ8ktp4k2adD-BRJQw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-CM-TRANSID: AQAAfwA3mpYbc5Bk16QAAA--.1469S3
X-CM-SenderInfo: hfkh0updr2xqxsk13x1xpou0fpof0/1tbiAQAPEWSPVyYEHwAAse
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=chenbaozi@
 phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoWruFW7Ww4fJrWrtw45tw4fXwb_yoWDJwb_ZF
 4xArnY9r1DKr1xGasrtF43Xr9YgrW3Wr45Wwn8Aa4fta4qvFy5JFs5try8Zr13tFWvgrWx
 uw1aqFW5trWavjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=129.150.39.64;
 envelope-from=chenbaozi@phytium.com.cn; helo=sgoci-sdnproxy-4.icoremail.net
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
X-TUID: RgoupdC2+lef



> On Jun 19, 2023, at 18:28, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Wed, 7 Jun 2023 at 08:25, Chen Baozi <chenbaozi@phytium.com.cn> =
wrote:
>>=20
>>=20
>>> On Jun 7, 2023, at 10:33, Yuquan Wang =
<wangyuquan1236@phytium.com.cn> wrote:
>>>=20
>>> The current sbsa-ref cannot use EHCI controller which is only
>>> able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
>>> Hence, this uses system bus XHCI to provide a usb controller with
>>> 64-bit DMA capablity instead of EHCI.
>>>=20
>>> Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
>>=20
>> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn =
<mailto:chenbaozi@phytium.com.cn>>
>=20
> Hi; why have you added yourself as a Signed-off-by: here?
> Did you do the work jointly with Yuquan? Or did you intend
> to provide some other tag (like a reviewed-by or a tested-by?)

Oh yes, we are. And I asked him to send this patch upstream after we =
have worked it
out internally first.

Cheers,

Baozi.=

