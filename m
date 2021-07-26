Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2704209lfc;
        Mon, 26 Jul 2021 03:02:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylN4AK+Yu3BHySGaE6joTqLhRtyPbnJKGd5rAYS/ItT+uDdolnJ5AG2e6wQZPNk2xexlXb
X-Received: by 2002:a05:6102:10dd:: with SMTP id t29mr10746979vsr.24.1627293775699;
        Mon, 26 Jul 2021 03:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627293775; cv=none;
        d=google.com; s=arc-20160816;
        b=pZFc/ACcfjc/n3AiLtvBaRpAVDeqQDGpN9IgwdSS4/CURTpNbhgH0qvP423Jkl/vla
         4xVny/YM2nvzhbt/Vp4GBsqgRpBTQ/v6zyp8dU8vf7yzdjitqPPs9cypQVMXB1WavJ0y
         6IlL1+xBOYlb1muI9ti2Lapo9CyYfCcov1SP2G/8NmWrhe6mOs9VtHvQu4blE8M/7KHj
         V50RXvhQf+6P2vXMHiO2/BI8ItSt4LhyycpELTAU6jOtfpkn5o0SsAQxAe2lSLMleOyl
         BTcgW8JxKzE2Z5i8HNZa1GN9qEYuOLK3NZj3DuEKFXdncq5evPx8B20vz2PIrUrbbmmN
         nvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m4VkulIYQcMhIJJ2RLtcbuvBhPAP3tn/v0h72b4fJeM=;
        b=tyHvBjYgOvwjzUzmBG9d66f3NSKjgu/854X/CgFnCfU2iuuU8YxhlB9Lwe3ZVf2UD6
         Mn9n+B9DblK+XJ1M8rI7odxqqcC+keaoHqUpJkhj8j+6WlXJlYkp6EcSY2S3y0cEvo60
         DFDihdNIcHI53V/3iN5bCUQD0KkBGIBnEoRwuiI8JLO2w8M2xtCfmpMZ1za+ka78JMDT
         vNj9EMUBOJ+K77gQYx2rXEuubg4Q+QOFJbbFljU+IlYjOX2F4HQOdzQpXUDX0h8C4ehU
         Sybk7FPsIGJSropZKfobLvgcqF0iHgCvovfOALvGyNT3MRKXM2Y49Dr5d0qvTDosAguE
         kAkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QjD3cZWr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si29068893vse.70.2021.07.26.03.02.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 03:02:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QjD3cZWr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m7xRm-0001QY-SM
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 06:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7xRf-0001Pv-G9
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 06:02:47 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7xRd-00087V-RP
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 06:02:47 -0400
Received: by mail-ed1-x534.google.com with SMTP id x14so4984458edr.12
 for <qemu-arm@nongnu.org>; Mon, 26 Jul 2021 03:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m4VkulIYQcMhIJJ2RLtcbuvBhPAP3tn/v0h72b4fJeM=;
 b=QjD3cZWr9hBORB3y8gA+4zsv153/Mv5171AlZ3Fl0eexKu92DN3n/k1sa2+p+pdGll
 luCI71ynBZUsM9ylg//hT10cwaANwA3/0KiL0iXhlawLa4DviNq7d0Ki92mFK+OJ2uAZ
 sdfjH8zETjLdf5OZbiiiQi7LvquY8kTv9bKLYmyS3Nu6Q0mjx62dvQVPWi7JyysP8AR+
 k9ppihKYAy/iuTOF4lfeoq44vhh4147v9gbr0R8Vr769c4Z/UVzSAxDuNocAi6aeAtnv
 TtlReCqFJGWofNwjNE8ZWwC+RotrVT247HC1iDMUfkubuXX+hCWmb0mM2URY0VNSFBb4
 7o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m4VkulIYQcMhIJJ2RLtcbuvBhPAP3tn/v0h72b4fJeM=;
 b=uccnvGklBqcpYoRBvrDKpwOgPIR9nYhmHe0fqw6EgWWjZHdETWMA2JAA2nK3vYo0sG
 zq8hmvATHJ2sOJvld4VkDRfFNhzoDKkevDTjnh2MJ8+rd5K82n8anWKjYZRsbjYxu5eY
 nrkAIhdPPVmAvmoc8WsXLdo2r+oZVdqS/VjP1vodv8IWnkFykYTqtD5yA5PseS/kcOrM
 ZQawY+yY361e7Jowl3IH8kBKQSX/3szryufgnhDE778j0VeTg+UmBeYxggfrLQbTBTEF
 HQNuPWUNxjG9m6nKYtkkHOQAJeDVaDuEZInmy6KOrwOWYiZ5HIl+Xmm+McF7DpwxXllL
 e4qQ==
X-Gm-Message-State: AOAM530VmvfEjiqWrLdMcRGMpZLUoBqe8ofq0WdT6Rchrz/A0AG1XVjD
 j5WDnmlanKDXHb+qPpFasHsJISdbmqWB9qEWulz8Ug==
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr20400397edb.52.1627293764011; 
 Mon, 26 Jul 2021 03:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <1627287631-6595-1-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1627287631-6595-1-git-send-email-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 11:02:01 +0100
Message-ID: <CAFEAcA8dJ_=zroP1vuXA2Lndq=ahTjQ8N=jXSzUDvBmw-QQmUA@mail.gmail.com>
Subject: Re: [PATCH v2] This is a test mail
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: hYJIcCmrU4Gg

On Mon, 26 Jul 2021 at 09:21, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> This is a test mail to check the behavior of my mail
> because it is not listed in the ML of qemu-devel.
> I may send several test mails.
>
> I apologize and thank you for your patience.

These ones seem to have reached both qemu-devel and qemu-devel \o/

https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg06355.html
https://lists.gnu.org/archive/html/qemu-arm/2021-07/msg00391.html

-- PMM
