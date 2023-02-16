Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp402893ejb;
        Thu, 16 Feb 2023 03:38:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8lf1WNukSuzTfwNn4nhjy6sgt41adRxt6xwbsifXjeYVwmbiQ17WCxXjv1J+t4qkSlRCeY
X-Received: by 2002:a05:6214:21a8:b0:56e:ab08:6721 with SMTP id t8-20020a05621421a800b0056eab086721mr8962738qvc.5.1676547516531;
        Thu, 16 Feb 2023 03:38:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676547516; cv=none;
        d=google.com; s=arc-20160816;
        b=yTftiF3/OMXAlCs9TgrgYRpdOiWV8HLZwwgWF9zlEAkg3+RQCpxyD+6nWkX1498BJs
         Da8uObIq9Xx4U5ADGybCAqcRdPzQwwaxhVunTkSiPFwyEUBzGUzRevRAr0qgKA1cQz8g
         5IkWDYurBKel4z1TvSiSxvyGqK5en+hAmsRkeq3ON1wik1MZdM5f+yfT6B9m5VMbpj+o
         a+gCL7Qd/4IzgyhQZ8pHymDYtXEfUOGQQiVT1Sqd8GWZgDVgVH1t6vKlEDb4f1/2Qrtu
         5Z/F9mVJRRhXZIuPDAhYgL851MUG0C/QNwiRSroQCtd/RVO/dMuVy/oHDX5y8JBiVSDd
         CE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VomnUL+3XuvtEbMt0DdUNmtDVYJfH8CorCP0gI0KR9w=;
        b=akE0pPKQv9+7VrmOiuPhM35l9tLVUuMu6hzTgExrPh7zE4VmDHYw2g4NOy/tP1cwk2
         VMpMGD3b7z8uLnsE9uGLs4a4HyKGs7HT7x7f+KMDp1qyxuEL71FE+TiXwl7PsBW87KNd
         SlJwRQ3XjyLvuzQB0ght5dy/zg2qh2ER6b7jhiJLhWRpMYqceHChYSAYabmqelL3yrUx
         lZM2VknRm76C5IkKDuh3vW5Db8QkQeEiaTxv3tX9Mrbxz5lSuAZx4vB2d3ZF/KpPhvEY
         CzhGcEpKRYyRdrvnmu/0chMSZsoPYoImk0BijkaRK7paqudZITXO/z+PEIe2eoRBxqnb
         YtoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Shn4itiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g28-20020a0caadc000000b0056eddf64fc5si927107qvb.591.2023.02.16.03.38.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 03:38:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Shn4itiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pScaf-0006Xr-BF; Thu, 16 Feb 2023 06:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pScae-0006XY-AT
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 06:38:16 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pScac-0000Pc-NI
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 06:38:15 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 bt4-20020a17090af00400b002341621377cso5523248pjb.2
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 03:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VomnUL+3XuvtEbMt0DdUNmtDVYJfH8CorCP0gI0KR9w=;
 b=Shn4itiUDBalUjvxho935T53ZvPTELb+n105vHhLi8brf9Wn+b5w6x9IgkXpokryNI
 uGfiKcOeBEGzxaxN9JwpOgf9uEU/wO4ePHBoqX3TKx1fryK6gaE3+9UgoOvrtt/78cUq
 mdaTuV6xsMU+i5u6fxkeoiSVr+/L0LlDfKduNkaAlYfaqbesxDVWPkIEYaVS7Y0WkoYs
 yXuQI9uxmUb1QDMXYDg7YzuD7IFhUYjYtMOFwjHOF2MCaOuzhYH5ANhr5FtSQwsCTMRU
 wThNLnznFtM9DTXPHrT7eRsCYU+j4npa5LkFeX86jVCu8MFZRqxI/tJeJfA6L6kTL9HS
 6J+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VomnUL+3XuvtEbMt0DdUNmtDVYJfH8CorCP0gI0KR9w=;
 b=hvzM0RQiQXC10N9IpDls1spZoT09P4OCUJh686jn0pxF17koC8SqvwJ1xtyBlt4/Hg
 j9NskmarkcGHHXTLVRcf/nPW6zrqTTgZo/9/MmpiUOlX8TxyGiCQUzftxq6RWmNL87FM
 HwJOn+pxmKM9AhFRkEM7rt8o5ZzCjwjVenC4g09nZcJsMqvGJMt3yDeksa7cfJxJrDJn
 cqrKPw0bt5sRztHDvefUmSo1JX6O3ihROgO5ZZ8a0qHyYBmqX7P01Zqn3h0FsYdir3Ws
 2BbIYRiZMKhO2JqtuH6IuM+Cb2YIl6/e23Nn2+nJvCsJjA3gUCZi0ZnswCS0JHGHSu6N
 rzzA==
X-Gm-Message-State: AO0yUKVQG7F8QINEWyRll/dWgEU1xiqyxmFEoVvd7DkdIRmgDLfOIKrQ
 u+X/PvC9DrhS2b/0Xxpo4/LqiwqAu+73dJPmaUBG/w==
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr520948pjb.92.1676547492921; Thu, 16 Feb
 2023 03:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20230216092327.2203-1-philmd@linaro.org>
 <4175aa01-03fc-94b9-dd7d-3e0268a92b55@linaro.org>
In-Reply-To: <4175aa01-03fc-94b9-dd7d-3e0268a92b55@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 11:38:01 +0000
Message-ID: <CAFEAcA_sjZcKQc8V+TCZvrui2mby-vV-ZzxrPY_YL-cELxrdvw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Add missing ZynqMP ZCU102 -> USB_DWC3 Kconfig
 dependency
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@amd.com>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: PM5m0nLeGRrv

On Thu, 16 Feb 2023 at 09:27, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Oops I meant this as subject:
> "hw/arm: Add missing XLNX_ZYNQMP_ARM -> USB_DWC3 Kconfig dependency"
>
> On 16/2/23 10:23, Philippe Mathieu-Daud=C3=A9 wrote:
> > Since commit acc0b8b05a when running the ZynqMP ZCU102 board with
> > a QEMU configured using --without-default-devices, we get:
> >
> >    $ qemu-system-aarch64 -M xlnx-zcu102
> >    qemu-system-aarch64: missing object type 'usb_dwc3'
> >    Abort trap: 6
> >
> > Fix by adding the missing Kconfig dependency.
> >
> > Fixes: acc0b8b05a ("hw/arm/xlnx-zynqmp: Connect ZynqMP's USB controller=
s")
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>



Applied to target-arm.next with the subject line fixed, thanks.

-- PMM
