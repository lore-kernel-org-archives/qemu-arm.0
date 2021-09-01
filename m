Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp264277lfb;
        Wed, 1 Sep 2021 01:24:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFaGDxmnsPAL8cFNHYmZ0EbxSh1hFcDMKCP7kqH3l3LYNRgltpke9EPrZwA3SNPwHeEeNW
X-Received: by 2002:a5d:8715:: with SMTP id u21mr19321050iom.1.1630484644662;
        Wed, 01 Sep 2021 01:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630484644; cv=none;
        d=google.com; s=arc-20160816;
        b=QJdLb/yWFRAr1Hn8+nOi5sCgLTJBfJGaC4kK0ERnM3b7a8aR98JlMVVozVJ8dgKeOa
         +dnqswHRARo7nYotfkmDSTwLUxhKFqIg30yNKpZXlGBAqKCaWdDovysHp4XTrZliiCA6
         28+aVPrpl8+R+9DHQmS7U8fEBwGtKE8Pp99++iXumdN1bJcj+4vwnFG9gS9QCMfo1I3r
         BgfsQwfM/K5xAF7sfbRGxhf4lyKyw3jlNQosRv7VwDj6I8gY12PKFJa/tIWdIL1wydk9
         YBW8neeZtw+ZZVnOioRHjlLaHygdB9wg/6fdjVZyUgaimItz83rrKEuLp2K1dMNEX0cr
         1gPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=92BObO8RTM+Mo2JEAic2IS0WryqOsOn7gZKcj2QnUw4=;
        b=Rqw9VZFzGmOOiVCBT9siaxYQlq/G6SkWnBfh1nCh+X4RlWxncNWsetT48siokUPQ6p
         mH33Ql4NhsdIqQa1yfDrymDk4rwFpev8jWIZ+ODFpJyL/DYm/ZScwPFrfIcsIDmlkuDI
         jYXBBwWuZ3DprUZ4jt0JaZlHbkavS4RnZ+i1ceFJt6CBqk1BiNZkxkJf28PEpVKAHuic
         HhgVvNOMZ0ZUlj8zFXsXX8CBF2BxcyAnSapxzLoIXIBbJaZ+kLnDEVOIa3qDdph9dolR
         Z5s0T5bNeeMM3F1VfydJgl5AQVr+2/FF1dNwWzopVqim/LGl6SVi3Qy1tZXJdr7bFAr/
         1UKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=meciSSH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19si24064972jat.113.2021.09.01.01.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 01:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=meciSSH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLLXO-0007qv-Vc
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 04:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLLXF-0007pq-Ay
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 04:23:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLLXC-0001AP-1n
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 04:23:53 -0400
Received: by mail-wr1-x431.google.com with SMTP id u9so3153721wrg.8
 for <qemu-arm@nongnu.org>; Wed, 01 Sep 2021 01:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=92BObO8RTM+Mo2JEAic2IS0WryqOsOn7gZKcj2QnUw4=;
 b=meciSSH3RLL8VxW/A91DJfmzd0thJycfEKXt/My6OdaF7712DWheojy+wxQH1LI3ib
 JjOhwmT8WY8jv+hpZdjXc+3wsduuvWCyZwKe9guNqY85Uk4r/qKmhsULHMmT57mt4M0E
 IomFZjr/DUX5fEPEsf8PKPtXyVamxFxuqgBENttJPbxDIllIOUKPIXTYG4oDonxVDlDQ
 qV5NXhmLvbuQroToq0O7w+4VEAIEyt9EIg6vyxytZIDzWrsYhSXczB6g6HW3PMBgSTui
 RHiJEzfQH0l4/kUlMQQ7v90Fkfc4xmdaDPUclFPN9S7z2i7TuOHNpCFMvAfH7VJc5s4Z
 KU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=92BObO8RTM+Mo2JEAic2IS0WryqOsOn7gZKcj2QnUw4=;
 b=LrjHPYWK0V08nMKE4MQFRDNs84HNSRH7DfWsNrgQTCsxEV3a/aJrPunwctAHBeQBmj
 QXQP58j393tu7Y5s7BDp78BMxlfo5mIj7KcD1U8GXNzGmfxjF5l1uwg3N3OSPLt2+NnW
 eteYU3NHfMKFgB0DN3dxS03uC5oxl6vYTCi9ab4oFdWth9fq7r0Xr8vUuJBOWaLITGvW
 KLlRpD2Ax7riLdKUT6diuACfiq1MFC06TZbvg3KdApbiDpdbWXmLCxXM32OivjJRfxEc
 WOA0Lplf65eOS7UYnV8NdGUEg/mfuEwEiqiuM/jXCKkNU2zwo4TO/hF0iigG22Z9jXJK
 YX/Q==
X-Gm-Message-State: AOAM5336rhbVsyU850ttRF30nsT/YFd2W2ZRsEIGxGiTEj4VOuG7Ppzo
 8vVRizaB9ys3zuWi2kz73a5FwcpBdtX6n4JYFeNSCA==
X-Received: by 2002:adf:ba0f:: with SMTP id o15mr35685531wrg.386.1630484628434; 
 Wed, 01 Sep 2021 01:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
In-Reply-To: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 09:23:00 +0100
Message-ID: <CAFEAcA-F-gBMJiW1MEJ3m89Y14fXwOXx33=MvxvyHTBqpLM4bg@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add support for Fujitsu A64FX processor
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MA1XgEj5ILvg

On Tue, 31 Aug 2021 at 09:29, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> This is the v6 patch series.
>
> v6:
> For patch 1[1/3], added the commit messages that the Identification registers
> value are defined based on FX700, and has been tested and confirmed.


Applied to target-arm.next. Thanks!

-- PMM
