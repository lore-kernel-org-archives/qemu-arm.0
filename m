Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp166185lfo;
        Thu, 28 Jan 2021 04:12:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziraQViQUNsMMzWDi9iaoNpeRFIxDONUbigncL4QTV/xp5X+JSTdREu6O8fFgDguExfnkf
X-Received: by 2002:a25:8450:: with SMTP id r16mr23439961ybm.37.1611835929374;
        Thu, 28 Jan 2021 04:12:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611835929; cv=none;
        d=google.com; s=arc-20160816;
        b=D5lBjzeFkFRU8+1/lwl7OIajsxSHp1VuYD9jf93V65Bjf9W/yw+USIb3EYCVpjRTyQ
         UG+I/oMSQyDJStnXyHiTSlvFfR20dcXHqi4tYMa/01NqR0vkXFXj81V66H5viJ/urH2f
         nQPbiufX1p1GYWnYhAc+lNYBCNSrbOvfCzKcfErV+AbKhZquh0tTW6uMaUE168c+4OO2
         FATaQ9PAXX0vpytNT1lpGKBXZrq37ZdjvY9o558KDwh3Jj4S3XDZGHNRSU9Yd4+Z/nhj
         VzUMKaxCduAgQwieLN3WsWNxJ7tVsPu0UvExrhxlb4TaioN5Up/MF7E8hDUThrQU9ywr
         PF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0lWTQBcnDCad8XpdN62W1XLqjcZb1faD1VJFzo+wx5c=;
        b=y3frCh64gR0UrAWHq3qrIV8rzqFtAfAnOvzq5qkBcvfbxB3gff6w/tfC5Tf4rx9IfN
         AycUz8XgYwKBlgN4MsdH/ljFTjJQxwhf+0GcTFn/pLvgoIqkf0H7r9KRA64nD6kbgzom
         MXxlDUH+5UhOQ0U8qbUGLXQARiM6Q2hQrD2S+EYpWXlQqQX15SobeM2PtyyjbLjWXCE/
         7zNobJXIQoQzBG+7cYvGM6d0xFtXQ2JDdNtxThxSJn6jU7pfy4mSdOX5DgnbwDT2khCC
         4fxHEeW5jyqtCMIKt3zW6/UFfmkCRVfaejU06fjZH2ESe95yUup62VSugzH/30m83UGh
         Hgfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jOsWkj1V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s88si4996485ybi.186.2021.01.28.04.12.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 04:12:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jOsWkj1V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l569g-0001YN-Pb
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 07:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l569S-0001Vm-Dd
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 07:11:54 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l569P-0007H7-Mr
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 07:11:54 -0500
Received: by mail-ed1-x52d.google.com with SMTP id c2so6292589edr.11
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 04:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0lWTQBcnDCad8XpdN62W1XLqjcZb1faD1VJFzo+wx5c=;
 b=jOsWkj1VBqgvLEJNsfW/aIG2I2AEZM94wUeGAvUAKWuQVDW+d0o5T3z3Zc5bwYV+0/
 Iv1sCgbVG6hBoJqZJB82GLQv3DYx+b4aflbL1cQFgzY3za6Sky7eRkNODOqNQiqpR6PB
 VL3IuliHsG90QP7BHUGYb0GAkhAUJ6eG0YuKw3WXU9fBtZkApxF1iyzocSDx2kpgydkg
 lzHIFLnoHb3QZ330bgr9dPlTwb+b8EZ5mvHK3tcdWnvGuGKmqJlQgvL9kn1dI/bBFOKP
 R9iPc1Zg/CxOYrA/gUqACCryVq6iTlw1gz8SxaMyECSZ2CibaPmTJ0s5V5GK8oIHU+cb
 /fIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0lWTQBcnDCad8XpdN62W1XLqjcZb1faD1VJFzo+wx5c=;
 b=gZbRddb6Q1C8BpJoqA71E1gN+TrIhI67sH0a0+EfatW8FsF7JFqe0USZegyAESuCG3
 yqmxwLWMmr6lJmyymHCDlMliyLFvaYSSTXITGD/FJhm8hPYyyX3cKP0yyAQIGH0nPqDe
 bJ8OR0lUeswOVICKU3fmii/8MmiRrLu96funXEhpYK0tAC/mlB1dhLUHUiwydrgn8gJg
 wzkm5BFcKHP1jdO+t5pVLBT9HUypNP+D9PRoSAL7Vu6VBmKTrs7dosOdjH8r7OcV2TmW
 w+/62zq3T6apFJQxdGYHXLBK0toHOhSaGy1OpnQZYWvMeQ2/d21gB+tvnOv4gnzssSJb
 yDQQ==
X-Gm-Message-State: AOAM531aCJdsxNvrJYKj/uqpWNFRDZyLppdQohoRwOaekyNhH1MfGIwb
 b/6P5dhYPChh1Vk5NI2ZAxN0Ks+7RbBVX0/Kr4eMkQ==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr13543617edd.52.1611835910179; 
 Thu, 28 Jan 2021 04:11:50 -0800 (PST)
MIME-Version: 1.0
References: <20210127011142.2122790-1-wuhaotsh@google.com>
In-Reply-To: <20210127011142.2122790-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 12:11:38 +0000
Message-ID: <CAFEAcA_PHnwpdPBT-fYqogwaiVj3CU2tXg1C00F_eVHmc4L+ww@mail.gmail.com>
Subject: Re: [PATCH v2] hw/misc: Fix arith overflow in NPCM7XX PWM module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /GPMzA/826aQ

On Wed, 27 Jan 2021 at 01:11, Hao Wu <wuhaotsh@google.com> wrote:
>
> Fix potential overflow problem when calculating pwm_duty.
> 1. Ensure p->cmr and p->cnr to be from [0,65535], according to the
>    hardware specification.
> 2. Changed duty to uint32_t. However, since MAX_DUTY * (p->cmr+1)
>    can excceed UINT32_MAX, we convert them to uint64_t in computation
>    and converted them back to uint32_t.
>    (duty is guaranteed to be <= MAX_DUTY so it won't overflow.)
>
> Fixes: CID 1442342
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Doug Evans <dje@google.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
