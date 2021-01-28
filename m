Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp263899lfo;
        Thu, 28 Jan 2021 06:22:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzr7DQeRbff4xZ3N7JfD8+ROXqu+u6Krpe8SSfGhX7VoJubQ+5MUWEg30xCHWWHfMN80xps
X-Received: by 2002:a25:688c:: with SMTP id d134mr25162980ybc.477.1611843773863;
        Thu, 28 Jan 2021 06:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611843773; cv=none;
        d=google.com; s=arc-20160816;
        b=tdRIKN//v8KYgl8bPD0veUkwgkeKukKkyw/qzXMvm7saVNnuvnsmUx+uecGj3exiFI
         zWYfbToewxiAboow7PIea8KZvUtpPSH8duHh/uJFugopKqk86vLB7RW/sqpG09bfwf5m
         Ff50F6jClxmUF62gT2VjXs9YZXI5E1Kwj45G2/jiV/x9I+3fHGt6GOzSrY7oJqx7ml3g
         HQAtbXy6W2vv40Yk0YYmcbiB/YX84d4vkWJqjkduIcFDQ4whhN+j4rQJE8M8hjQ5p6om
         hpWE+8j9AWXwpRUMtmWDHDgkPF6pfZ3vwxsj/rIg5gN2gcp/DvN/RryvQGa75a7sHqNL
         p+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8Tcbr9SedKFrNWTq4e/LLHNQILimboW0eGVvS+bEniw=;
        b=NqHLJxbT0+gTuZOwM6fZwH5Ck8R4uelFagVF/BShNWK2GyTOzhcZwRv++AhNTr8MPI
         ZqB87mjjqzyfq2jbUa2LmdQxb7CQ5ILfDuy6Gl0WQqYWB8enxgLcI/iqtTfC7hR4Uin4
         LCW2rWJg396U9BhRZxJzl0u/x7WUXGIjqddfPod5Nm+VXc2BdseRr5IZd75F06ZiEW3V
         LzycX3ket+ZFcPKt58lishNBi1YiswiCgAaZtXm39s/M5MbZjH2JfgKOdZHKXY8BRBmm
         MzNRpOKCVOs+Uj05fm8DN4QK9+6K6F/i7GOCaYwA8bgcCa+/T9Ue4LG9oVi+4k/u+Ivn
         T+Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="qyY/HXQX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n71si5173028ybn.278.2021.01.28.06.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 06:22:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="qyY/HXQX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l58CD-0002vm-5p
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 09:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58C3-0002uB-K6
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 09:22:43 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58C0-0000S8-W9
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 09:22:43 -0500
Received: by mail-ed1-x52f.google.com with SMTP id c2so6778013edr.11
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 06:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Tcbr9SedKFrNWTq4e/LLHNQILimboW0eGVvS+bEniw=;
 b=qyY/HXQXptNOa5T8hs1kvW4IKbJPZ6FpYo9Xe9CXzR7s8bHNQD+qiV2K52d+0NrCh6
 wuU1Cz/1JUwjnpVQUanfnaq05fFCQRMaoqYl9B/UAbhXLh0r/BTT8mvGSWib/vjzvD7w
 zo0YgkdEraZhEOeK3Zr7ro4EVYDaBU4ScCUIPb15gvwujbc9fV0nJK6ODLgZUwcByF2V
 6b+g1UUGa8dMUHYvIne5szc27uNN3azg6XNONst8igOnVQNZ4uauSlOtRjAJeMKw6OoO
 YK7xZytfkuJn5CWTnT+WSNBAeqeCDzZoSvoMqzdbq2sKgYlHD/EYwjfuDqwrAYsH2lvJ
 FNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Tcbr9SedKFrNWTq4e/LLHNQILimboW0eGVvS+bEniw=;
 b=L2dp685qgXgjEbvCbhrfnouUkSvirtudws2tLz3Np4t/o0lnYPYQ6p58lCcyrbxpBU
 pu0qQTohpd4VhF6u0VeEnU5+XArONq6wFNQCJU/pG3D0JQQWyY21vXGFOB28nPBUpOoO
 Q3F4Nxsk2BY0u9cG0xj6uY0afgouX9adUfTkDQ1kcbSE6X7oNgNllHJrk/V3w3iHIvfv
 To+hxvNXI7B/GXFl+DWuPOlGpo0Nj92J34ydAnhyCWR2X7cTG2/GcwGaZiiFeIA7URSq
 piidUDx0gD+9AiVWfQeFPM59yezRmc9HhBn1u8iVxZTfMSlcfPkygnZIZK+MHbj+z1Sw
 mndQ==
X-Gm-Message-State: AOAM531bVMjyEKptfkZ3SrnTpKuyVZoE8UyFbhEhUy5i2NnzBkwAqJlM
 5n70n/reRaPQ4eNDOLlVPnuwihIYI90RXpO9COqiQA==
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr14328349eds.204.1611843759171; 
 Thu, 28 Jan 2021 06:22:39 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
 <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
 <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
 <34c45d74-adec-2734-830b-612b5e2f6083@amsat.org>
In-Reply-To: <34c45d74-adec-2734-830b-612b5e2f6083@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 14:22:27 +0000
Message-ID: <CAFEAcA8=t6pxsvSt3FrPbAPXKT6y4t4hqjU8CXfbsw=RbbXK_w@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yP9lHWWAJ+NY

On Thu, 28 Jan 2021 at 14:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 1/28/21 2:54 PM, Peter Maydell wrote:
> > On Thu, 28 Jan 2021 at 13:47, Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> On Thu, Jan 28, 2021 at 9:43 PM Peter Maydell <peter.maydell@linaro.or=
g> wrote:
> >>> This retains the CONREG register value for both:
> >>>  * 'soft' reset caused by write to device register to disable
> >>>    the block
> >>>    -- this is corrcet as per the datasheet quote
> >>>  * 'power on' reset via TYPE_DEVICE's reset method
> >>>    -- but in this case we should reset CONREG, because the Device
> >>>    reset method is like a complete device powercycle and should
> >>>    return the device state to what it was when QEMU was first
> >>>    started.
> >>
> >> The POR value of CONREG is zero, which should be the default value, no=
?
> >
> > But you're not setting it to zero here, you're leaving it with
> > whatever value it had before. (That's correct for soft reset,
> > but wrong for power-on.)
>
> zero value on power-on is what I tried to describe as
> "It is initialized to zero when the instance is created."

Yes, but QOM device reset does not happen just once at startup and
not thereafter. Consider:

 * user starts QEMU
 * QOM devices are created and realized
 * QOM device reset happens
     -- CONREG is zero here because QOM structs are zero-initialized
 * guest runs
 * guest modifies CONREG from its initial value
 * system reset is requested (perhaps by user, perhaps by
   guest writing some register or another)
 * QOM device reset happens
     -- CONREG is not zero here, so reset must clear it

thanks
-- PMM
