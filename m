Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp963179lfb;
        Fri, 22 Jan 2021 07:48:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrinhd0uV0tkWuu82IJLFMMtCWudf360YD7e7PDhktedZzSswO8cypBJr0PZkNmh62crTu
X-Received: by 2002:a25:8704:: with SMTP id a4mr6882902ybl.377.1611330524968;
        Fri, 22 Jan 2021 07:48:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611330524; cv=none;
        d=google.com; s=arc-20160816;
        b=hBiL/0fWAGZX97dBvoKuou4zib8oQguT7CNIAX2gkd4fHzAQ8uLTFPExoJ4Bn3OKTJ
         rgokAtBL5pecvUsCI4oSDjtU7up4aWQSLE8+9EaIoSpjGy0eJGHUKA7hlU+uysSBX1wR
         IrfsdceP/TFV+jTeRfHCjK/OJDGSieCre7z6AODDPtZOqbKkfPRzLO1K7/shDzAV0Kqw
         n+/EQ4hucqAEnf/+SAZeYA1WEVCWgU4wmU7G0tDs0ofzLtXOZ9uUZsuI/ev5Q5z1GNdN
         dmSjNI5XgwSm5N0I9B5nWC0d/yaainnKAODo+StJT1k1HNYdh+Rp9AYuaGn2rzQmJShZ
         A7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+lz8JO+Ur8AgDwxtMFIGokAEwyuOa+bOuNenLzyYco=;
        b=mhf0ID+lP3LlR2r3rkN3dL19K9F/KyERy6iF8lcuzvDg4RGfk/LFIfVJI+gvACO/Mq
         MsKcTzwSqmlWi9xdjES0TNLkQP1Gk1jElGmr/wwIOBa41PpA8TbH0TCsv1SZZS+1BHqY
         Tme/xFAuGMk5teXDRHpllKWgAzSV0fne95j10xCaIYmAtYs0NirMElybLrkbxQxMXkzS
         4AhmMVKLoNfaHuu7JIwhceLtxa6SHumxsFfRiAjB7+kA87msPjgOd6dATd9hZV33O4ta
         ztpBpEooHSrBbdHimod2wYG8XArwRCfLb5T6ybnJUZObKokgDWfmnQQstGxu+95JtsX0
         0xLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Aep3mZRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18si8042787ybp.144.2021.01.22.07.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 07:48:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Aep3mZRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2yg0-0003dl-DP
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 10:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2yfb-0003bk-2x
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 10:48:19 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2yfY-0000Sq-0c
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 10:48:18 -0500
Received: by mail-ej1-x630.google.com with SMTP id a10so8291244ejg.10
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 07:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+lz8JO+Ur8AgDwxtMFIGokAEwyuOa+bOuNenLzyYco=;
 b=Aep3mZRsiMe9ttRwraKqqP72qmMxfNNGabRyJFuBlUzRxtFcOl3Jbxe59YzDV6oRgp
 +MeJmMPX4ju/tgkbV4/NT5NRNIr7kOXk/QiKHwnDIKZVl9p13zHwIDXEcjEfIHpyl7el
 9DhsFoaFL2bYxTulOZQhrOAQx5p0fQEBBw0sjD3Fti8gMG8klvLMfeK6xW8dJxoOwx/2
 2oUBrqy7Jfg5s3Jz2XKgg11shvSn/Wkm17WlzygORVorw0aJB1VrwijCRQxn/gWkpCq4
 uuigEwwZHfqH1rI/2hy1JjFdvzNZuiVpmSuMzpGBwvQwzTBH7KaC0XtOdUh7wszkb85J
 cKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+lz8JO+Ur8AgDwxtMFIGokAEwyuOa+bOuNenLzyYco=;
 b=gB38CTur8ovy+Slwiap65rXVpJ8VNVMoMjnYXiHTOZQ1vnZ4aeLVwxhwiFYTsOz58V
 ZToljOm5An/rbTAszCfkWVrN4c8YmkT5DvUw/EeKUBinlcA0uBLjU5koQ3GLO9pNPSq5
 B6BVjs1mlEIaFj5D+chmYg9pzrSThOhYhLTaB34VN/In608vmqk+BKqhN86IrteAFp3b
 uNUS5i3x87YhMbhucQWkk7dI2ALhi0Xs1XW3Nwy+FTBkulzT+MBf76Z8T5qv07h9NVKy
 k9T9YGI4qdj2/HrQIe3eB+S9KFluGmkx/WBA1TUB/FGncY0hfQ8qL+OGlQe4bodZKi5A
 ++aw==
X-Gm-Message-State: AOAM531tpxB3Zk7yAF8xhbuGmduvs8TJ29tDBfdsA9tRoYgfbJ2q8Ozs
 usiHChL8BVYvmW07o14itsTYg+iN8ZYDSLrRgnvpWw==
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3516829ejd.250.1611330494472; 
 Fri, 22 Jan 2021 07:48:14 -0800 (PST)
MIME-Version: 1.0
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
 <20210120092748.14789-2-maxim.uvarov@linaro.org>
In-Reply-To: <20210120092748.14789-2-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 15:48:03 +0000
Message-ID: <CAFEAcA9K3tfSw22bHgBR+sLgs+Hv=8WN7SnUPs2u0X0b2t2eRA@mail.gmail.com>
Subject: Re: [PATCHv8 1/3] hw: gpio: implement gpio-pwr driver for qemu
 reset/poweroff
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4e34BQHmVWXF

On Wed, 20 Jan 2021 at 09:27, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Implement gpio-pwr driver to allow reboot and poweroff machine.
> This is simple driver with just 2 gpios lines. Current use case
> is to reboot and poweroff virt machine in secure mode. Secure
> pl066 gpio chip is needed for that.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/gpio/Kconfig     |  3 ++
>  hw/gpio/gpio_pwr.c  | 70 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/gpio/meson.build |  1 +
>  3 files changed, 74 insertions(+)
>  create mode 100644 hw/gpio/gpio_pwr.c

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
