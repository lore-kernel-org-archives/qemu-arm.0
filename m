Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp343000ejn;
        Fri, 14 Oct 2022 06:10:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6aS41bD+9pMwmAQ20e8eKfNM8m6WEjch/d3212+09YMEWut6eaD9MOckaQIlz1GXGUIodz
X-Received: by 2002:ad4:5945:0:b0:4b1:71fa:4723 with SMTP id eo5-20020ad45945000000b004b171fa4723mr4064727qvb.24.1665753039212;
        Fri, 14 Oct 2022 06:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665753039; cv=none;
        d=google.com; s=arc-20160816;
        b=yEpuor8i/rKNdLwC7jC/nZ9/bC9nKT4QHWIbSUhL9aXnoPCDivY9d3qzZN8ToFRYPU
         apbhkons7IWWi8Srjm+8S0VEl2c+4um9AAg8Xop3jwJgI8koOcVBXGAbBF3QZtiTRuDL
         mGuEEROpgYu9RoUnp0jJUZolojHwlrzVf8NxJbtT410tEVflVz9kkBnU49z4g6M+ymrA
         X08lwvlytnkdtYi2vRiJsZyvVZsdliXl5AvAy9Oi28lQ7kmu99Whwohsl0qDB1RBGJBL
         W+EvtnMlut0g17xe2X1mL0DOFC3xqcNpdYdXNObPxcIkTx3AA1JvjzlxPGhuSBmAEHn9
         6+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cnsxmvyVTraUOAGySbn2zoOCsy204c/jhk09lqH8bDE=;
        b=D0srwH7KoXAo5j1kPOXqrKVrbrj4ZGA/H7avm8WBvqPw3xFH/S45UAkO61MDS53ZN+
         1fRpmPefUNCblAaEO4rzRFCnCfixJhbBMvYcjvl9JbcFntRmiKOmOkyrvdVWueWRCJSG
         lNAgs/d7qwHqD1poQxmQA+uY8+eekDBT7Gg27vX2XrMF3e+iX7XWRYTonTf9b/VLcFWk
         qQinEmKfUfv9ShzeJCkb+wQ+cOkGCidrXxGVrnz95KWyyMvx4XeaBbf1hTJoUPPmCkT6
         AtYujjRbYBiGUVYHKI2cuRcFnx997sB+2vbQfWMSOLrg7bMtxQ11mrkd4rgjkJ6/i+XF
         n9Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lkpZ5kxm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14-20020a05622a188e00b00392ebc43fe2si1611461qtc.709.2022.10.14.06.10.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Oct 2022 06:10:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lkpZ5kxm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ojKSU-0005cp-O0
	for alex.bennee@linaro.org; Fri, 14 Oct 2022 09:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojKSH-0005Zc-9J
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 09:10:25 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojKS1-0003gx-JA
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 09:10:24 -0400
Received: by mail-pg1-x530.google.com with SMTP id u71so4289144pgd.2
 for <qemu-arm@nongnu.org>; Fri, 14 Oct 2022 06:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cnsxmvyVTraUOAGySbn2zoOCsy204c/jhk09lqH8bDE=;
 b=lkpZ5kxm7DzIu5Y9YMywB/PCLioE2v49rIa6Go5vvG3v2NeDqymTOj/h45ayPeFihA
 24b49YwpYF2m5XLjE6FiPZ3DZD8MCG7f9vJahXL42jLoZ1wJfol2VxoKgXKDrvJRzgzE
 UBeeRkSsZnoZy07He8h4GzyWEXw5MtYgUzIhWJMLu72AKZDevCu+RD+nBS5PKKXWZD9g
 52cogBxIYoWFPs1fIspU8oaYxUGGKtwy4ooInkSOHJa/m9mUSJLXzP19r7q7x8tkC6jA
 CPhR11/TLWq9NXmrGXw+ze4kVwzh68DDzow+CqShuBtA8S/EF3fpVqKAZ1uB+dDdQKfG
 BRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cnsxmvyVTraUOAGySbn2zoOCsy204c/jhk09lqH8bDE=;
 b=BC2D0XCgJHpRqTcv2//sPApo9KHzK5R/lZUApfPdpn3XPKfupBzEHP0sDQGajgLnPw
 bgWESLUUpwxZt7Vi9zyJlhc+k7MV75CRL0yukOtRwrFq+Fr4OnMRM4taetTYqyj+/vuU
 h6btJqT9JyMIugL5SztvbtKZfzfzqD1ljFV1F6BwcSj2iPdlQZKQo0CjxeR5irIOk8LM
 FRVk6/l9bhbWUVwtHNffWAMPoJyNPW+lfePqIAk798xasbeYWigm0PFzVgN06j9RSM3A
 Jq6kTF1fkzO2LXcLEJx6disreig3PwB0PpZiHrbEWgh8r+6M1X25Ju4uqgCU6Cvk9vC5
 JBXg==
X-Gm-Message-State: ACrzQf1+x2ABXQTW8Xow23fXfCarD1OU4BJHuTTiIJSXCnRYZQKXY9DG
 wRKxMKZp2VXwNUVemz0pmL+HOStST5wWmsqyGFD5Dg==
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr4529742pgi.192.1665753007900; Fri, 14
 Oct 2022 06:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <CACKEeRNFXrZ6Em1EyeZ6z=dniJd+-oOOQZO3mEtSvxikfp5Weg@mail.gmail.com>
In-Reply-To: <CACKEeRNFXrZ6Em1EyeZ6z=dniJd+-oOOQZO3mEtSvxikfp5Weg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 14:09:56 +0100
Message-ID: <CAFEAcA-5pSK55v7WtPNHK6oacucJpX55+esn-DQNJKo=GyGF1A@mail.gmail.com>
Subject: Re: No ARM_FEATURE_PMU for cortex-a9
To: Timofey Kutergin <tkutergin@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oh542wBIlq9V

On Fri, 14 Oct 2022 at 13:23, Timofey Kutergin <tkutergin@gmail.com> wrote:
>
> Good day dear Qemu ARM developers :)
>
> Could you please clarify if there any specific reason to not have ARM_FEATURE_PMU option set for cortex-a9 CPU ? According to cortex-a9 specification it does have PMU...

I don't know, but my guess is because the A9 doesn't implement the
PMUv2, but an older PMU version, and we didn't care enough to
implement whatever the differences between PMUv2 and the A9's
PMU are.

QEMU's PMU emulation is very rudimentary anyway, so it's not a big
deal that the A9 model doesn't have it.

thanks
-- PMM
