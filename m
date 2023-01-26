Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp365937ejc;
        Thu, 26 Jan 2023 03:37:48 -0800 (PST)
X-Google-Smtp-Source: AK7set9bJBVpivnlh0yVaZSybmj1T6HaurCp10NawGztU/S2HJV6aS1Y79UuKLiq0AdL1RqmiUhH
X-Received: by 2002:a0c:ef08:0:b0:537:643d:1a37 with SMTP id t8-20020a0cef08000000b00537643d1a37mr14876374qvr.45.1674733068234;
        Thu, 26 Jan 2023 03:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674733068; cv=none;
        d=google.com; s=arc-20160816;
        b=0ysCcbXthf8UoWYmnGIAL/JH+RqTffZ8ubCY7SzRcHFcTHzFK56ImqzhfOOUhpDW8u
         0WT5SYBYMNVNjS5Qd0c2nDhFJVXCQOGHtrnjYT/kw4EgL4RMzXS6nexe+14lSQ+/gw4+
         Mhk9yT90NljrcUJO8eEuDozJSCiZGytpVgUTYxY/iHqheIclDCybgBesmpPrwn1kmmQx
         H7trBOxDII9ktofgvn81GiiZ5UqK4ugEHPceAfnutKXK9vUstZuEz1FneJ1k1ybKUdPm
         dw5GJHy4z+UHctnL6AsjSOAI/ZMpiEbEZUKkxtf5dNjwI+7Rwol5ti7SbPF2Ansc1cWu
         PvkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=u9JMXURG8LhNkmgT9hjzHlfKw5+MSxl0rsjwaamWqbo=;
        b=qmqmIdYjTBdZAYz1Xi1oDuOCUhtRP83960Spn0+5LHNtkroIEyTU0fiv7FgZRalrJ1
         ECO+TIpqU4sw6VGRI7b6mjJFlWMN3z4+DXJPSefqaOrHsK4FAS7osT2Hd11lopvJX+pw
         NcfVD/lG1bjgsSDzvpZdJLfafVFT0oGqWj8vp4EGn0zHs3R4e7oZydUy8KLa14N6wKJO
         7w593S366lgSP6dxjY0o/BpqhDC9SIhpPGuRKsQGjaxgd30WUtiAXoltHZxsuRXR61Sa
         IRI/zTtiGZT3yaHE2Ruwb4sKeTVkwf+PMGbJTTbwkPwMFdye858GysF+bQqkiwE5suFZ
         EbkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eb+MQwlZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5-20020ad450c5000000b004b4457d51e7si648342qvq.152.2023.01.26.03.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jan 2023 03:37:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eb+MQwlZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pL0ZW-0005mX-U7; Thu, 26 Jan 2023 06:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pL0ZV-0005mI-Sr
 for qemu-arm@nongnu.org; Thu, 26 Jan 2023 06:37:38 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pL0ZU-0000yA-Gq
 for qemu-arm@nongnu.org; Thu, 26 Jan 2023 06:37:37 -0500
Received: by mail-pl1-x62d.google.com with SMTP id k18so1577572pll.5
 for <qemu-arm@nongnu.org>; Thu, 26 Jan 2023 03:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u9JMXURG8LhNkmgT9hjzHlfKw5+MSxl0rsjwaamWqbo=;
 b=Eb+MQwlZglbNSae7dQuLj1Hr/AA2Kz0hrpUlv/409UFcsjKp1bUgSgt2ond60NDrwE
 kAsT2wxi8Z4/+6qsom3FsWlA/gVNSm+1MC/zPwxHHH/6e8drt7fu4Rne00ekahzdJd6o
 /5neUhteTkoSnaYAcPKpfnpOjdai102K/e631W5cDWj/HfC5ko/fyqZHxcghdmqRctA9
 UIE3AuVvMDol5ihfu4OE9EF6VOzp4DIYc4ZDDk5UMyRXniv4IKiqmuHGV5TLBDgP12Ni
 9e/HinaKT3+lBXmYsFg1U0s9Mk3mbCpkVwXv7aaw4s6k8pSO9HVGmQKNFrFYv6yzmasZ
 ULEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u9JMXURG8LhNkmgT9hjzHlfKw5+MSxl0rsjwaamWqbo=;
 b=mZLpVAKLVnp45eb3RQIBX4Gq29MsjpCjBD8t9eLHgsOKy/sGTse2kY1cJO/UC1QIm9
 Q1iwYDTdbu1b8zXwNAhgrQhNw5uUZydyhptAOkYRJK33c0hiVf73qpn/KS2wdIZsK8S2
 ewhhRcvemjWKZi/Gl/iW11FeelM1YV1kQCwNBxn41REQ50uc4CDRO1rwvOjNvBZITMhW
 8RlHZnzm7jMGB5I6l/MeqL42h0et87h2rbAC7p62ukiCR7QO/t/x3s/u33N9Ey6Oaqld
 a9cLvvpFtPZOp+vE+I8ZhzrBQWsRw+eJoVIhNG45M5+aPyEwrm9WKxjPw0XRQofH3/BD
 cREQ==
X-Gm-Message-State: AFqh2kpd8go9fCteIIh5DGF7A2GhghDfKUcyzUU3vl94Z8dH2kRGadrD
 EXcQlGxHHIGX/thdZOeVRBhrqS8CYwUrG8ycttAkuw==
X-Received: by 2002:a17:90a:d801:b0:22b:bc67:1dec with SMTP id
 a1-20020a17090ad80100b0022bbc671decmr2985379pjv.67.1674733054325; Thu, 26 Jan
 2023 03:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20230124200113.1768552-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230124200113.1768552-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jan 2023 11:37:22 +0000
Message-ID: <CAFEAcA-RW2Hve3vFTrz0h0jUV3VBh9HdX_W=zhJeROO_vBLhLg@mail.gmail.com>
Subject: Re: [PATCH] sbsa-ref: remove cortex-a76 from list of supported cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0u+XPFa2mYcW

On Tue, 24 Jan 2023 at 20:01, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Cortex-A76 supports 40bits of address space. sbsa-ref's memory
> starts above this limit.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 1 -
>  1 file changed, 1 deletion(-)

Hi -- would you mind re-sending the patch cc'ing qemu-devel@nongnu.org,
please? Our automated patch handling systems only read that list.

thanks
-- PMM
