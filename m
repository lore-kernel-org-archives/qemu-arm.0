Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3968448lfa;
        Mon, 19 Oct 2020 08:26:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9S4X64EW3MHtW/33PKenakOIT0J4qv2qI3qE/TJJdGUkmIASk953i06XLr+YTb5oDSkXn
X-Received: by 2002:a25:4f0b:: with SMTP id d11mr235187ybb.147.1603121198108;
        Mon, 19 Oct 2020 08:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603121198; cv=none;
        d=google.com; s=arc-20160816;
        b=PHvgqMVPS/4A9MVEEUmmCy9rqUOogSPmAH+qdbQOHySHmNWSCa0fhRKW/HYgWOtkpP
         m6qEGRwD/87nVPB3DfkFGf+IiLrMOMxOtksnsiORXLpKhKbip+3RFLO2NjYCdYEUB6fD
         JIQtft5t9nnDN6pDtl1A51PuzXO4uMdG55EwS3pSx0twqRfvBU009Au5ApzAEQelDZBl
         ZSOgIEP9dyGt8faajZis0Fd747rD5QJJnq1htEZeKAcl7OUNG8qORha7EdlDcPjTA9FV
         BasTXHwVOJlCRDu+NcloxdJYB2YQWrN9sZjshfLETqtTG/pKHW8aYQKJ+JKVJkVYrse8
         rYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aGYSXS2tqeFOGeLvtcXqnFJ2d/lZHIsVFndSch3OHDk=;
        b=nv20F92cEKUu11iztvR0hPf3g+xPMwIpatmYgdcVOehsMfe+Zj1yLN0+DSdX+96EDk
         CFSFe7tl6/OdPjIXWX45K1gdm+EOJrjIMQgY6wcIksP3uTyfOXgQtVD862I8p9Sq5RjM
         7dsWCSaDq8+KvEKXdcwvQYTIotmA2HMZGWteikcLF7jsG7Rtr/eQvHjNL08pwi0QdRA4
         D+LVm445Y2JBtEPlgBpmBSFhP1BdqkkP23xhezzDXnSv9NPuG0fQeHVTXocRQDp2ZP0I
         cONSQS3fVlf25Ze542QgWOkelFemVtPJMrCXk+dp0WDsJ4tM0RvJloE7Z+CIUWDULJQV
         /5VA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HWYnIXik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q186si262548ybq.351.2020.10.19.08.26.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HWYnIXik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUX3V-0006Nm-Fb
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUX3K-0006LL-6F
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:26:26 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:38070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUX3D-0004Wy-3S
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:26:25 -0400
Received: by mail-ed1-x542.google.com with SMTP id i5so10681307edr.5
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aGYSXS2tqeFOGeLvtcXqnFJ2d/lZHIsVFndSch3OHDk=;
 b=HWYnIXikuuDV0XeA2FbGWyKzO9q5V6AFyuSvvxZ/YgrOJeEH2el7ukC4eFQCaF85tP
 ztAw7QWTR+s0SNB9YZFZR8Em91ca12A86Uw4dgXETjOHhYrKlEiH10QS/JnLawgrhoB5
 oMCQtLAr5Jr1M/vMItFLt6ce75ZHJIXQFtwBZUpozeIcQK3qM48R3FGY8q70WUNgyz4K
 Hn6+mncQB1QuhmHmFgOI6yBS1IOWwE+2E3c19V7Kc4Fbqsx9SUs4W4gSZ0NRlf3iMCst
 Enccwd4xJenSI75hyyoDue1newf3JrEDVtdPSrJUp4zq9l8Vk544eq7md1X/szu5g0ff
 iwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aGYSXS2tqeFOGeLvtcXqnFJ2d/lZHIsVFndSch3OHDk=;
 b=CcA+j7Qevf+JxzN0Kq6YHm9U1CCSQS4sb4FaIN1poXdJ0qfP3dFhtKOeYV7+1Iq0R2
 1wLibQjHagrQqSGO2BD2cA47qLZo5Mj31CUX+D+9eHr3pMrdkZvjI++cK51ngHTZ1muP
 hFDWddHn38MnwUhTZkNZRy8loGSLvGiJ8Aj/60gLGkBnh1Dx5d8RjKzgmZLx26v8rDPI
 joQzIW7tdFVgKcqTzCZqTwNucJma/ilIvzuWwu4dslu4c6hjF8kk4WzMsc3XZsgPMCwJ
 3fkTFxZUKQUzYyLUukl7ZjF8ODGgda001tiu/WlLRLmWkV3jcexTEb6cd4ECZ9tCtSJq
 6SwA==
X-Gm-Message-State: AOAM530HbuPVaT3pvdT6i0SHmtHsoREjAFKc2eMinIS+dmxf3574A3eI
 KseSZgPGcKpR3paKrhWRm/1WCjTg36bnBiHniFfD4g==
X-Received: by 2002:aa7:c7d7:: with SMTP id o23mr366156eds.44.1603121177742;
 Mon, 19 Oct 2020 08:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201008161414.2672569-1-philmd@redhat.com>
In-Reply-To: <20201008161414.2672569-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2020 16:26:06 +0100
Message-ID: <CAFEAcA-O847-ATWLYKfFDoDWapeFfLy-CH1Fg0G0E8PVq0xYng@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm: Restrict APEI tables generation to the 'virt'
 machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Dongjiu Geng <gengdongjiu@huawei.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S0sMpYRHKzBu

On Thu, 8 Oct 2020 at 17:14, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> While APEI is a generic ACPI feature (usable by X86 and ARM64), only
> the 'virt' machine uses it, by enabling the RAS Virtualization. See
> commit 2afa8c8519: "hw/arm/virt: Introduce a RAS machine option").
>
> Restrict the APEI tables generation code to the single user: the virt
> machine. If another machine wants to use it, it simply has to 'select
> ACPI_APEI' in its Kconfig.
>
> Fixes: aa16508f1d ("ACPI: Build related register address fields via hardw=
are error fw_cfg blob")
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Acked-by: Laszlo Ersek <lersek@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
