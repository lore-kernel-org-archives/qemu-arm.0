Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp521441lfg;
        Thu, 13 May 2021 06:59:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB0Y6SkF2V9E91esbB779NJ3mxYe9rftAufAc3JlRWYvr3yLW2nzu4ex496e+WEaeq+7IW
X-Received: by 2002:a5e:9e4a:: with SMTP id j10mr31211544ioq.52.1620914376520;
        Thu, 13 May 2021 06:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620914376; cv=none;
        d=google.com; s=arc-20160816;
        b=BGduLfOYPFWT/JFwYWihrRnijmAW/YZJ0aDiziwWaOxZQBQcfk3+S5EM/IUimiRKg2
         cNoi6XxnQ2Zkw5OZ9VBPZaxbnu6M5oMzLD/xk3Be5OtLHF2sxmqMKNXC4xSw4HOnkxVR
         hhFwRxeR+Kln34KBLdwTW39WQiea1nagMbjuVxj9NY2fiWxA2ov0YDTHhOjuhhHOueJg
         TbSv1H3VZdyRG6gJpH9pLDX5WJIAVpIRXTIiX8xOVicO+yB09DjWYedZ47UQXlLWtgnH
         eWlGv+AXT1eWYe6vBH0eApfDKyOgLzjGz6KAxBAD5C9EOCbveXts136H06rEJIzoXBdA
         QTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/3kmRDsJ4Ld1DIFxHM8TIbe8hbI0FMQYQAid4j+WdQ=;
        b=0rONq8vuUp08yO+ARs1FCNhchbIl1JsdIJor6VBR/BUKPUyI1dclx9bcqRQoZeiRZs
         du3Jts/2eqSGro8oVrO6nYUsgzt2e3z6SgR/hVg0pvnlrz6jFnOZApmG+85/n3fhKO6y
         jIaB2/yhgIo1rIKsw/9s7mroFCzwFGVG1S7hmMoTrI/rT54qOn5BYfTIPfQpfuhfm4vm
         6p/bQxGGr8dWIKKnF5Aq4xc3jOEzUy1pJU+MViLIec5gk7gS46/jadPw2Cv5+QPaACa4
         GKsdNaszXzyRUO+hVKSSFDULfCWQo4NPylkdDk8Dn/xDxUUUxNzU+JzhJl6/fIWp6Ms5
         ET8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="VLfZ0/+t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21si4100143jat.63.2021.05.13.06.59.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 06:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="VLfZ0/+t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhBsF-0000MT-T2
	for alex.bennee@linaro.org; Thu, 13 May 2021 09:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBs1-0000MC-97
 for qemu-arm@nongnu.org; Thu, 13 May 2021 09:59:21 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBrw-0001KY-NS
 for qemu-arm@nongnu.org; Thu, 13 May 2021 09:59:21 -0400
Received: by mail-ej1-x62b.google.com with SMTP id t4so40073552ejo.0
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 06:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T/3kmRDsJ4Ld1DIFxHM8TIbe8hbI0FMQYQAid4j+WdQ=;
 b=VLfZ0/+teGofvd0XUyAK1Mbd1iL1uFtKVRZmb4jZ2U62wic4MLZXARK2T/cjcEEjOk
 8L679AL8yZnGuvEZMKBLOHEei+eIfFdjD7cxLxYI4mJGskcZmoPcEmueAvrKJEuIPSQC
 vUdi4lQglkoDx5IT6bmJj2/rm9+RVByg0DAhJxjj/9QyYUOz5R8Il6iMzHIb6sKzl0uN
 tXokH9zhAiuuvfk1dziqaOtmaAyP+P46kE+pJGcjKwf1P5X73b7PXWFTwtV5kZT4dq72
 amHMIiZntoIxzhSi7wg1uuwsDEjR0lxMDr4znT20vxGMXQ7b+PXm5F7AdWIT4DK+xxgd
 4YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/3kmRDsJ4Ld1DIFxHM8TIbe8hbI0FMQYQAid4j+WdQ=;
 b=OI5jeVS0HufaGW2IZoTbCxVw9cySYLEorxcQzPbG+PwEksdfh/0ymR8f6cnmMo0P0u
 lUTp8xMz4bzG1R5q3nA4519UbKzyx9T/8c8uJemtCai1l7bND4f07Ed2GdMlvyMHrX+M
 Xbl+ViblL515McNmoDnMWWFRrqsXQjtXmaBbAw1HpmKwiTyj66nKmtfVUrFI2OMtWF1W
 GxoeqWZOyN0PZUjlME0S0+fvgVPc4j/bGS8kCxVrMqQhJAi5sIdK8gOmqp3YrEKvOKPQ
 MfIkG4rKMCDaD0nW2d4WUb/iDiGiSkqFGddCXSYW4j4FOVJRjQnt6pc19oI2PlqUUTw5
 qXXw==
X-Gm-Message-State: AOAM532QYWrln7Y82DyXxptMPqp0HVPLx3NGxfk0DWePutqVGIe9+vWt
 1jysxmT4X6dAj2I3hybBkrJaBFPZa1+FGVv8UDql2w==
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr44912335ejb.250.1620914354765; 
 Thu, 13 May 2021 06:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-65-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-65-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 14:59:03 +0100
Message-ID: <CAFEAcA9PTpkrjahY-cj1wyU_LTzdKsd=KLy3+7aJT5qDK=i7uQ@mail.gmail.com>
Subject: Re: [PATCH v6 64/82] target/arm: Implement SVE2 TBL, TBX
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aKINvreNyrX7

On Fri, 30 Apr 2021 at 22:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200428144352.9275-1-steplong@quicinc.com>
> [rth: rearrange the macros a little and rebase]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 10 +++++
>  target/arm/sve.decode      |  5 +++
>  target/arm/sve_helper.c    | 90 ++++++++++++++++++++++++++++++--------
>  target/arm/translate-sve.c | 33 ++++++++++++++
>  4 files changed, 119 insertions(+), 19 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
