Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2451970lfc;
        Fri, 5 Jun 2020 06:29:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjSFdyfRe57aIQAAiu/DcKIo83ct3NSyXoaa3GLDwObQf1n9Jd8NXJqg263O+to/mMYmfD
X-Received: by 2002:a25:6f03:: with SMTP id k3mr17206708ybc.293.1591363786668;
        Fri, 05 Jun 2020 06:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591363786; cv=none;
        d=google.com; s=arc-20160816;
        b=nV9QLQpd9nie2WFczhz643EwdYQU2xZhV8o3NQ3VX2Di/ItBkPo5iis9hUKOMRYg5l
         TeHV931AUAgGHaWQPuHyWLOVg/dd9TCv9qa41mZ+H6/Tn1fwLJJsFw0oISa/pVceXplm
         KZaBhT7UizbzusaVeDksGRDQLmdlTQKaxClwM/qpitCBjPxyJiiF24I+x33i/cuIjiBz
         FzBkPbyD2yvieBlHTntTj7Qrx6LMwH1p50b7+PFbld63bP+3UiaU8dd6RtUR1ymY92wk
         /CMAeju3ALC3n0ALuDZ3FLlahMONS6lE9fz7wwxUY1qoO1N8DRUs/ddPiqZHvO838rSf
         Oy+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MjBx5mbcnQFgKZnmd+gPc0Sz7vAMpyCVxxcFHrl1+vA=;
        b=q0qcC03GKwfJcrs1doOkbwcZDXcpQt1tS2Cf0szVlapgqZYUj3KJ8pyX7xvQ7vmqfj
         90d4o+CPdSboPNzMHSyjRpPtkV8fbWPbERG8amR95a2PkCsqrlxLf/ia+ZUonR1czl9m
         B5wTEmhylufhqWrQ17QbJREaDM0w2lpHa+rf1FNtVD0+w2iqJQEqhrI32qApJFo9farm
         PbSLSpCGvTqkHiTyOs/9VFPmt80qRfTGl9/EoNQrUpH2cVo1SP8FS/947FWC0iqGUwYK
         kK8N2HI1KEgIcghYyBSSBeAu1hRo+jzppkj5qkFfz6F3mwfKXaQOPpf8Wvbt8iRDjKEL
         d2RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=irCiZYGw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u67si6760527ybb.134.2020.06.05.06.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 06:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=irCiZYGw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhCPq-0001Fb-2b
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 09:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhCPi-0001DW-Vf
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 09:29:38 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhCPg-00057m-Mj
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 09:29:38 -0400
Received: by mail-ot1-x344.google.com with SMTP id 69so7596566otv.2
 for <qemu-arm@nongnu.org>; Fri, 05 Jun 2020 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MjBx5mbcnQFgKZnmd+gPc0Sz7vAMpyCVxxcFHrl1+vA=;
 b=irCiZYGwlllOeb6+VEa8m03LTwSiYd5ydYRors8B/kb0ReMA5drC8vBLvJJunGEYIU
 TM9gauJg/OIaEWaGLRukEb6jybUSrgIB9PgnzkrWkREUkE8TMPAyBaFUeHj0Z/SEcMEI
 LwP8CPMLdwnBJtQtc2nExy8vUrlfqfc13MTlvGxRDsTVyJBpwmgAS0z105GqxzlMnjBW
 piol1QUGWgibpz63eEhPU5rrFkB36k/W832DYi3M81tsFsEClMna0epGdmFeFVL87mLQ
 yS+cfAP7Jdxe5XRpOqMcf2L8Q8Doh1BhKThn04U8u6sbTrxwC/TEzbNX95tO7QMPZHyo
 1s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MjBx5mbcnQFgKZnmd+gPc0Sz7vAMpyCVxxcFHrl1+vA=;
 b=kiw8k4d6jaxQKSDR1pHjyIwx6zwcretMHreYUp/r3MRLUXPled3fSU5hUbASS5EAVw
 JehSq5qBT3Yfx5+fTfiigmOqVh38VcbjGOn6bElagCiwQ9sfx1HcB8NsQrAiGgbLvw82
 sWe1OVKTCVVCqkOrs/6pGZMY/1EN6Dr5drlvjsABajXVQ9vYg/XEHa1yx0rZpe/PuDIO
 LTno5ZXHYA4Vbh6m4dDTms5WSAW3Xwf2QqFZCZIW7oEbw6hN/3U/q+3g1DGcUW91OkQY
 Jk48yVgzlqwg/D5CLYXYAWYomdzFrQ8a6H8Ge3nw85W3LpVTKwvtGyCABXDl9IHGgXVB
 gCLg==
X-Gm-Message-State: AOAM532Kf4vAIgNlv8u5xTbNQpa5yUMaHWTXBtGhmb6q16AvPG2rF0GU
 GqUZaz5Ur6ZZ74wMfzm+stDluCZFw+PAn5NTxA8mKA==
X-Received: by 2002:a9d:b82:: with SMTP id 2mr7256440oth.221.1591363775642;
 Fri, 05 Jun 2020 06:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200603055915.17678-1-f4bug@amsat.org>
In-Reply-To: <20200603055915.17678-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jun 2020 14:29:24 +0100
Message-ID: <CAFEAcA_SZ=Byk8_-GURDEWP+WuaJXwYF9rz1b+4XwPi8GSf9wA@mail.gmail.com>
Subject: Re: [PATCH v3] hw/adc/stm32f2xx_adc: Correct memory region size and
 access size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Seth Kintigh <skintigh@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yM/bLRucbCWu

On Wed, 3 Jun 2020 at 06:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The ADC region size is 256B, split as:
>  - [0x00 - 0x4f] defined
>  - [0x50 - 0xff] reserved
>
> All registers are 32-bit (thus when the datasheet mentions the
> last defined register is 0x4c, it means its address range is
> 0x4c .. 0x4f.
>
> This model implementation is also 32-bit. Set MemoryRegionOps
> 'impl' fields.
>
> See:
>   'RM0033 Reference manual Rev 8', Table 10.13.18 "ADC register map".
>
> Reported-by: Seth Kintigh <skintigh@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>



Applied to target-arm.next, thanks.

-- PMM
