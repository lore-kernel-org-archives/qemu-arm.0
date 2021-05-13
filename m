Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp362325lfg;
        Thu, 13 May 2021 03:41:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsFjFJ0fKIhp/zwhn1EZGg1OXWM+NoGpAaDOcYkCqtzH3UkcEp3AdSY7Bgh++PF2jJbVO1
X-Received: by 2002:a05:6402:26ce:: with SMTP id x14mr48658284edd.216.1620902508893;
        Thu, 13 May 2021 03:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620902508; cv=none;
        d=google.com; s=arc-20160816;
        b=ZyeGWlZUytm8c+0H/Youa/Mnpqu561lrvaBDI/gohNs46LvF1OMv3jlRNVWkFS6JM7
         SmbYLjDVBWL3EghqstvrZXZ46rTfyLCeMyZdK8/eh+dxeoPoQN7vsQGaueBc08cekvA8
         YBMM6Zu+bz0G0bc5rgui6yT82Vvdf0b8JwAsGNs4ly3U+eYQ0yMGrYOFhGK3HhluDJ2F
         EP0Cm+NQbesPIC76NjuOG8vtt9kw8tX+46+eb6Huj3+zrtspbHTnPhCHV39gmsTocKl3
         9azcL8wtm8rPsu+jNRfXzjXX7Lc1J4DaebYpE4cqPryyn0WR7OekmtI7q65PYsh3wezq
         5DsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CNMyQGCf6aFt8q2U2Vqp9hHdb6Ji2+QfDcWNldclbYc=;
        b=HLCBCUxrWMADwYwSXtXJZJLmpY5wtmF5KP12B98SIz+c34rdwJs1egypx6wisSLvvW
         qpsLVb/mB1vX5c+4aOb+AyngvdFOYNZ0v6/xPUIthE1V4nqFRdzdb2546OAGBHOy0qRk
         Y6lXDI3/mgMswYMuYFbknZyBbs7NJ3269w1GTsuIH9A5I5I75cDlDCoDlQL/2FzUMT0Y
         UxIqZXIPfpM2hEXeACLvU7Jx649/S8P2uYZvKlWudNMukXyqDRzzIuyj2vb2jGNabAAo
         R/e7DpsClVpJBvlYW94dhk99U3RWJZ1bRSraVMuL/f+0eRju6bvxXXbsdz2BNlkq32SP
         mo7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oo6uDTqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ho35si2675445ejc.3.2021.05.13.03.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 03:41:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oo6uDTqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lh8mq-00010z-26
	for alex.bennee@linaro.org; Thu, 13 May 2021 06:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8jm-00054i-JE
 for qemu-arm@nongnu.org; Thu, 13 May 2021 06:38:38 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8ji-0005qF-V0
 for qemu-arm@nongnu.org; Thu, 13 May 2021 06:38:37 -0400
Received: by mail-ej1-x62d.google.com with SMTP id t4so39291586ejo.0
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CNMyQGCf6aFt8q2U2Vqp9hHdb6Ji2+QfDcWNldclbYc=;
 b=Oo6uDTqE4RtwCQ/SIM+j6dG1EVrUvdiheT3xb093iqMGtQZZx8BvbMeqnYxEEj38pk
 oozkn7F18iFY0moJOZQsTUwffWe9I+lTE+sXcHQ3oomb3gsuLhKomfPM/PCrQrhWxu3l
 g2f+DY6I7O+DbVACOPebQH/oLdNxFPb2dp82Uts9rKq6LV9XMIxACHXZlUJmcWiJgjL3
 llrFPxgAZiipFp7t4Dekaooc6fIpdcCulnvJRRQec2h91w3PUMCK8Y5ckR8iJdMp4afs
 O/OUdMjM339P06yyIyaFS9MzAYzJB/aht/KyO6A668lupBOSCCbyHiOcq6L5+B9+J80t
 Tn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNMyQGCf6aFt8q2U2Vqp9hHdb6Ji2+QfDcWNldclbYc=;
 b=XaM5vu1WqCbHDQ7ItMnHzc68CQrhnGeA5OSttYZBShnYCC6plCtaWWfbgla7h25WoL
 urHBAFpelsr/S+Xu7g8wnBHK9VScLwj4x8UhlcIUkvfiKwH40acNJnB1KAM+isQIee9V
 CV5U3XPlNMCObnX/c0xDiJ9J/d5qIYAyeJKeweDjV3yBarzl9g5JELf+xWZX4HUiScy+
 LEhsGQ9kTn3uMfXZDZwmjXdCvpgQ8FzAzTwt061k/7XgvWzze9QCXe7ehiC4nhwzZStS
 t0iNI+sYO9unSMzLitDSoSiWyPIDk8q7oZoK+5B+3aHBbDb5Bgvqw5o7wOW3X4KlvQlU
 bCvQ==
X-Gm-Message-State: AOAM533jURxnFuT5NgwewAwsnioFj8eKrRXlwpdgN4NwjP9VAZPDMf5H
 fV7hZT72G2ID97yNc+WSysItxwshDWJSgTsvTLqX0Q==
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr42461079ejb.382.1620902310599; 
 Thu, 13 May 2021 03:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-47-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:38:19 +0100
Message-ID: <CAFEAcA-N0nW+RxXZaaqatfdefbwP9z7Zb6gzVe66HbT70zjzNg@mail.gmail.com>
Subject: Re: [PATCH v6 46/82] target/arm: Implement SVE2 FMMLA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B41qMgTO89l6

On Fri, 30 Apr 2021 at 22:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200422165503.13511-1-steplong@quicinc.com>
> [rth: Fix indexing in helpers, expand macro to straight functions.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 10 ++++++
>  target/arm/helper-sve.h    |  3 ++
>  target/arm/sve.decode      |  4 +++
>  target/arm/sve_helper.c    | 74 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 34 ++++++++++++++++++
>  5 files changed, 125 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
