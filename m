Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4879455lfb;
        Tue, 17 Nov 2020 11:10:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXM7/SpcJNRvwod2TOl+FK2oZW4jtUXhXusU4qp3yM6HRupA9ojneYDaOGiRUZ1DQ1LlG2
X-Received: by 2002:a25:5007:: with SMTP id e7mr1817289ybb.124.1605640237268;
        Tue, 17 Nov 2020 11:10:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605640237; cv=none;
        d=google.com; s=arc-20160816;
        b=ZY+XCVDd4oS45X+L8uk6wMPRO4uVRovPmaISB/HCLmxpDR1mEBxfwuDOJouHxG24yy
         kyx0PZbv2dWv/H5kQQOR0d46JBGzbhMQSS6nt+L6flvwk4POhhtaPaj4CYlJ79qAYCLJ
         1/LNB6XXenbzmXsLC6+uZbY45ddtxzfo+suL3Rsrb5SwVvGpmxaLn4qAAhStFveIW+Cc
         6FbENDVzEC+lXimrPiQQGRt6ESbYUQNWdRTHvWYMGWNYjkuLl6vBMidJQ6FJhfYjc/sF
         zdVhm/aJ404FrUaNefExWr6BP8EiXWjGVqd9FuX+8pd8bt7ZwNntxOxJQo/Kv7w6Jyfn
         d2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JSW+R87KG3d6MD5/aj2X6jQckA3PI5mUzsKWCkllkOw=;
        b=qz8Nb04oy7Xe18lX4WW8ZO9rDS35ZpgWC7qfvJN8AWB19N/chHUsDXRk9rhOxbpMWu
         e3pipojJI8RAKh1NIANiT4vfLVyihRIbNf0UV/Wi62zKahdUQWogTGHK9cVKSl9PHF19
         eg13Vg1GlHez4chPL3/g3gFbbi6qY1DhrWNh/trrSApcmhg7W6Ie9kFnYrhZruBEkO7a
         RxhT5zauJ8Vnh9xm46TnZmfAEP8f48PCB8jgv/i4qi9hBVk2BYYFe7x36mCWTYg5XggD
         yFLNKI2qC11ZJHIol3Ix42lQFoLxYtz79JXRI0iVPto86+fSh2F1AI9c++HZ24QP7aim
         X7sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SpIAqrtV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4si22535302ybm.144.2020.11.17.11.10.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 11:10:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SpIAqrtV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kf6NA-0007AP-IY
	for alex.bennee@linaro.org; Tue, 17 Nov 2020 14:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6Mp-00079K-VR
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:10:16 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6Mj-0006Pt-Gx
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:10:15 -0500
Received: by mail-pf1-x444.google.com with SMTP id 131so7397319pfb.9
 for <qemu-arm@nongnu.org>; Tue, 17 Nov 2020 11:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JSW+R87KG3d6MD5/aj2X6jQckA3PI5mUzsKWCkllkOw=;
 b=SpIAqrtVc3fMpGNlbDwtLkOf0KSfveV9vyeIFyJCCr+Cphnaat+6u3u5rG3F7vo5+v
 V3uIcuCdvT0WYMPA7xxOm+PopY97/V+78Aq0DS1PcEi+kwl6ffdrFE06sEt695XMLa38
 pUPKVj1zBBuag1q5/wVz5VNLCGZuNDsUc2lkjWmGJ/07cqO/G5b7pbVUpblGVMbte8by
 DOPrw0KVHoTTCf/tXR5lPmUnS7WUB5uKE2YhISokJY4ZiSaYWcS6bb/UG/QyPRXTgswC
 avpwV4TbC7YlhwXZgczM/QL2A0lW/YO3fhzWZU9Mvl90iuTLs4Re97ece9/JHhoEi4nU
 TOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JSW+R87KG3d6MD5/aj2X6jQckA3PI5mUzsKWCkllkOw=;
 b=ABn8rRVjTboVraB0RMfO6a/FQsA86d7qxIX58L9MnjJBksl9rmIa9+XIp+QQbzdWP4
 wFlz3Agkhv9uTr3xdyerJHYCgL5GGnNmRMhabUWlRprvgM5x/EI8Ba2K5nqCBPujCL2V
 npkOLSdr8QNsMw1UP5GHN9iQQwk/6TutPSd6U8VCV9o3qU6AlXOTN2D9kI0nM2JHD36M
 6GsDyVCcuP4IoHfkMTR47+6qiZj+kxbQE1cWHsBhKZPg6OIRlB/K1bxNtuJolK46i9tf
 EmHILreki3uKu557GWTU2KvWTebnABqk+ir1epEHXnpXsxMmFkAKWFzBHwO5nRBk/g4F
 9mtw==
X-Gm-Message-State: AOAM530m+KiQoXPAP3oXRtpICO1bzoQCsNgK/J2C1VVvl2bCspxxxhGF
 Ztv7u8uSmy46bLQDMkWWfEIIkQ==
X-Received: by 2002:aa7:953c:0:b029:18b:bfb:9fa1 with SMTP id
 c28-20020aa7953c0000b029018b0bfb9fa1mr788641pfp.14.1605640207962; 
 Tue, 17 Nov 2020 11:10:07 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e8sm3932688pjr.30.2020.11.17.11.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:10:06 -0800 (PST)
Subject: Re: [PATCH 02/15] target/arm: Implement v8.1M PXN extension
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4d9213b-057a-8401-9d42-e47cf9db9f8a@linaro.org>
Date: Tue, 17 Nov 2020 11:10:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KCEsyAVg2DGM

On 11/16/20 8:08 AM, Peter Maydell wrote:
> In v8.1M the PXN architecture extension adds a new PXN bit to the
> MPU_RLAR registers, which forbids execution of code in the region
> from a privileged mode.
> 
> This is another feature which is just in the generic "in v8.1M" set
> and has no ID register field indicating its presence.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

