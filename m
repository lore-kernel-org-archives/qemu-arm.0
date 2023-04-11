Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp471195ejc;
        Tue, 11 Apr 2023 05:37:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y06pgzKvzqfPJWgzXQSWiwntayIvV0n9ioRcWYQ44xMMhgwjJ65kNyI7GuRGAHAJ96HNht
X-Received: by 2002:ac8:5745:0:b0:3e4:eb53:b02b with SMTP id 5-20020ac85745000000b003e4eb53b02bmr23496602qtx.9.1681216648129;
        Tue, 11 Apr 2023 05:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681216648; cv=none;
        d=google.com; s=arc-20160816;
        b=AdJfd9vveTfLye9++J/QVrg95OLl/a5bz+WNIZrgCifIHRULk6SYu/POhGLKCQ0+tc
         6zakflsEyvzvO2F8lNPlyRsA7ZX8LWRcHDYtHYtFt9UckP2L3uY1ayKwO7yKvnboYqNM
         QYEmjne/1LaVTGyX+ZZDDffOd6EYBNtwibhMTW2W8qHG5HV0fsLdusj5XfhXLgHyKMSG
         wGz8gSfUrqpSw8VXR+X5A62fRYQxq7VHw/1WD/ibTSiBste6DCvL/WJ5b7tOHUDU4qds
         PkawP0JRLYSt8gpYHvCpzLQ7RZHuJv3gbWZI/zLqw1VcxuZJmkj2K0vQhR0J5EWac7IH
         Yl7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ieRYjbjc0R7VAimsYZbALFqMAhB642YecdfGIwtUfRs=;
        b=TEYdmIv/S6TRPfGI83fgIo3UajrSsgV0TNM3dP3qoBKjOFYsHSAZY/S8TDRmSwvQYH
         JaPvPMFL7HHavVMgcQEgguuWxb48zX3WT8dlGQnJ71Jv/ACPXat7t8E9R8uXK+aSYkDj
         EhiPTuYAcpnApRZcICWxhd7nSn8WXg/pv/tenUGsdEj1thvPE2y7JDYsKqKBSddsDwuO
         56e08pQZnwsLLvivBN4IBE851lvhOVzTTqUdvhMkHePW1Kik5edLIMbQbbS+Cr07eQM9
         SHD9z4aO4/PMOBjMACdTn9baQJRjn6o1dPJpBQWgVaC+1aVb7HWSQbS2URmKQTqYK/UB
         r8uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LaPq74TX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020ac85a51000000b003db8d811b5bsi8987423qta.703.2023.04.11.05.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 05:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LaPq74TX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmDFS-00010M-33; Tue, 11 Apr 2023 08:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmDFL-0000zE-Ii
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:37:15 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmDFJ-0001NN-5o
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:37:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso852470wmo.0
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681216631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ieRYjbjc0R7VAimsYZbALFqMAhB642YecdfGIwtUfRs=;
 b=LaPq74TXIbr1ZSUjAAd4AON6evtmQyV1f8W93vlv7WS9S0upkI2iEtC6PwZTYzI4F/
 KPPz92oZJ8xu77I/Cj4IrawJmuYVjGTtSWcpePlToCthwt7yMIsdK551gbOzr83DxoVE
 sTeSBZ7aeErqWCI1ahzjRULw4qG4B1xNPwcXd8/NkFmCsL8wbfX0R6ahfpVWUMx2H20M
 2WwkQuTnGWft3pNCvZdRhy1zejOCc+RgtUcYXZgv2pdSkrr1p+bfkPZZTdVGrppnkGQo
 nGntoY6oARhKBYh63BuXGH8WyYT5q52LHUVBFlh1nDAPH3wfJTOBOf0TxgbbpKXfG7tv
 EJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681216631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ieRYjbjc0R7VAimsYZbALFqMAhB642YecdfGIwtUfRs=;
 b=oAEHFJuTWALGwdQDwJLUYJ7XDBoGLb7y58vJKDq+kOmoJU4Zb/rjKvQ8dnchd25qXS
 4mUtR9u3FRvX2GX+536Y8fM+yZdw+yuB5TxL3xUs3KG8mEEWXnBx2cT+U5dqLzOGcOxL
 S57Xhz1OSL1QCEi1HBPYk3/5d3lPQZvQ+67DdXLCvxDPh9iWPZYQxGfNHha+37HQihMs
 uvApdAV4JW7bsuwpLCnQ28O882DE+yP8BLvkaR43xpwmC3dl4wzg8k0MHfAkuZDY1Qs0
 JxfxSHJqThhD2dS+QHJ/2OV3zl6ctQTUBGrR+Ce8Ms2/sYnwmGlVTu+gepTpaD70CLgo
 hF/g==
X-Gm-Message-State: AAQBX9elbtWr3ozOyGBRzkpSJ8Zi5IqgnvDIZ5ogTFz/N5aYqvAdDjxs
 X4IpGZmoKRx2NIMVGHdKTPXddw==
X-Received: by 2002:a7b:cd0a:0:b0:3ed:5a12:5641 with SMTP id
 f10-20020a7bcd0a000000b003ed5a125641mr9683627wmj.36.1681216631113; 
 Tue, 11 Apr 2023 05:37:11 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003ee443bf0c7sm20698789wms.16.2023.04.11.05.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:37:10 -0700 (PDT)
Message-ID: <fe33efe2-71c5-32d6-55cf-5644fbd94355@linaro.org>
Date: Tue, 11 Apr 2023 14:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [for-8.0] hw/i2c/allwinner-i2c: Fix subclassing of
 TYPE_AW_I2C_SUN6I
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qianfan Zhao <qianfanguijin@163.com>, Thomas Huth <thuth@redhat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20230411103106.3992862-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411103106.3992862-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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
X-TUID: USCtXC5byuGS

On 11/4/23 12:31, Peter Maydell wrote:
> In commit 8461bfdca9c we added the TYPE_AW_I2C_SUN6I, which is a
> minor variant of the TYPE_AW_I2C device.  However, we didn't quite
> get the class hierarchy right.  We made the new TYPE_AW_I2C_SUN6I a
> subclass of TYPE_SYS_BUS_DEVICE, which means that you can't validly
> use a pointer to this object via the AW_I2C() cast macro, which
> insists on having something that is an instance of TYPE_AW_I2C or
> some subclass of that type.
> 
> This only causes a problem if QOM cast macro debugging is enabled;
> that is supposed to be on by default, but a mistake in the meson
> conversion in commit c55cf6ab03f4c meant that it ended up disabled by
> default, and we didn't catch this bug.
> 
> Fix the problem by arranging the classes in the same way we do for
> TYPE_PL011 and TYPE_PL011_LUMINARY in hw/char/pl011.c -- make the
> variant class be a subclass of the "normal" version of the device.
> 
> This was reported in
> https://gitlab.com/qemu-project/qemu/-/issues/1586 but this fix alone
> isn't sufficient, as there is a separate cast-related issue in the
> CXL code in pci_expander_bridge.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/i2c/allwinner-i2c.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

