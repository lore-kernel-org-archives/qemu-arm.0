Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2360691lff;
        Tue, 3 Aug 2021 02:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzldTC6v6e6uGtET9p4KntHWttYo9s4LThW9qqLhwS6o1qNvU7rEDeuM+b/FG8AksT/5b2v
X-Received: by 2002:a5d:9599:: with SMTP id a25mr223240ioo.86.1627981520061;
        Tue, 03 Aug 2021 02:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627981520; cv=none;
        d=google.com; s=arc-20160816;
        b=l+lSFAk8ZZzblQ6tEFEXesGxZuH/Ol4csGWBRg8AtGoLXFzfaqCxBZQp9Ic+sJ6OwR
         Z+6e3sdhfvVm5cTh0Ov1id7y8nuhPbBetS7oM13BKt0CsBsirdEDD/Sqi/qz1If1NXXa
         +00wfKOF7NonYzKosaP9pRQTdvMoTOC3f4zj6FrwNic3rBzINMGzmKfoS5JqEp3b8zAQ
         pmDWg5NMbxdQJZxsOVBnEqawxUYaRiOxfqdUSXX8tyv7CnQWe3B80ZuquXITLH8/iRoY
         HDNwBvsGVl8BZ49WL+FfPOlMcbRqK1zXlIthLbAuGt6J6eRkTgbplVKTRnvbtLppq2no
         wtdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/nL1N8J/kAZD6OZneyvpICTLnNqpZHKan2Reg9Ci1y0=;
        b=eIpNlIPCsQ3U7p4lJ2JydLmmNNzNl4WGIRCKLDU6DIOnhxQgdxMbLFMRAEySXFOo/G
         ry73d78sFCmzPQtgj3PeCDGjeEJvsjPmvTLkzgncpYpTd+GVEYBXnIk0Pm4GfVBFMx85
         LR8U55NEAYu2XTfkw+rHBhNLrkZGBKpdDwUV++jmFvIrgiJl0X7wXkmhjPuYNy4V29hl
         r90H186IcOMq/X/z9WCwWGkLq/sXIBcDtG66oZIaYjI3Odp0e7zRjyqYJYdc/fMLY+Sk
         sGY+LFiK/2OxaagM5QbGlH4eloIzpMUjX2fDbCvVfCRrvrMDGlkZNj675ZS62sGfxRzf
         nPqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lyMs/Qb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24si14439168iob.3.2021.08.03.02.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Aug 2021 02:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lyMs/Qb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAqMR-0004Hz-Ec
	for alex.bennee@linaro.org; Tue, 03 Aug 2021 05:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAqLG-0001i1-G3
 for qemu-arm@nongnu.org; Tue, 03 Aug 2021 05:04:06 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAqLB-0003vz-EK
 for qemu-arm@nongnu.org; Tue, 03 Aug 2021 05:04:06 -0400
Received: by mail-ed1-x531.google.com with SMTP id y12so28094139edo.6
 for <qemu-arm@nongnu.org>; Tue, 03 Aug 2021 02:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/nL1N8J/kAZD6OZneyvpICTLnNqpZHKan2Reg9Ci1y0=;
 b=lyMs/Qb/I9nVQCDfNhyHylNrIsKkmeTik1pgjtFGUohKyzxQQKyU3g3fxAdq/98Awz
 CERZDDJu/nbmMAMoHWKdhNhfSc+F7cNUx/HwVgWaF1FW6JG4gpQU3Nnl9rswQDQ9VUW7
 xgplq1dTiFwVv5QDt5Y2UMRblyYciE7P7gCAYMPwkd6QXtns2WyG8c8pD0dCDgPJA4Mk
 QXpULLjQfsaV+vBUcvOjFfAfKLFvD/TwCThCVF9cMARCQ6UNmgIRoUWAv2LYdKLQnxZo
 ZhaLbyQ0cf/DAE3Hb+Wwm/dLcMc/ityTU7U5VifPYKPpRWTKgf8Nr0NDZ80l+6piHEvB
 UxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/nL1N8J/kAZD6OZneyvpICTLnNqpZHKan2Reg9Ci1y0=;
 b=KQQoriJ2t5Q+bkABHZqp32QzDxa6Bu+afFHGYLsAkDp6Zfg4a5fJDTH4vTkQ1xZAz9
 45wZakkByY+MXKzA23kDTgxzaKqI1KKY4HBSGMVpuMoREEBQbJnQyQVK38+Qyz6Rt7VA
 j70lt1S34BdRE+yvVKrHoh6/ILEgmb46NpUGQo53rRbaPSjT6E+BsXjFfGjqeeGWKbdm
 zA6aRcTumNMSUPT8HhTnrLwmybB63j3JgPYZlI/dTHjJq1jr64bU+Uto0av7Wfw0zKZl
 HuXunHPzdwMd52Fe7Dev8WunFfrvyqAO50KhwfEJOJHygZIjHRHNKOE5ZrDV8UudT+rv
 Cj1Q==
X-Gm-Message-State: AOAM5309c+ry508a9gVUt4MN2izzqoNLEFqlb4qgUFxr05jM1jcfvD8f
 F4s1/xLTs2P1E8eP+uJQwx4UQ2CsvFYOk9xEIHwGWA==
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr12956623ede.44.1627981440050; 
 Tue, 03 Aug 2021 02:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
 <CAFEAcA_=685EKqdsLh=rnXPXQNSRJ+PNuDYec5LTxr_rcAbeOQ@mail.gmail.com>
 <TYCPR01MB616096BA80EBBA7FFA10A119E9F09@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB616096BA80EBBA7FFA10A119E9F09@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 10:03:16 +0100
Message-ID: <CAFEAcA_VS9MfZM2NumtScxk_8mXtF=D_-YPsb+tt_acO3r3U7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add support for Fujitsu A64FX processor
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gy8g4zOdDoiU

On Tue, 3 Aug 2021 at 01:37, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
> > I'm afraid this isn't the way a v2 patchseries should be structured.
> > The idea is that a v2 series should be complete in itself, not based on whatever v1
> > was. So when you make the changes requested in review of v1, you update the
> > commits in your local git branch, and then you send out the patches as the v2. v2
> > should apply cleanly on to master, and all the patches in it should be logically
> > separated out changes (with no "patch 1 makes a change and then patch 2
> > changes the code that was added in patch 1" effects).
>
> Thank you for comments.
> We apologize for the inconvenience caused by our lack of understanding.
> I understood your point.
>
> Just to confirm,
> should I update to v3 and resubmit it as a patch series based on the points you mentioned?

Yes, please.

thanks
-- PMM
