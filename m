Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp904664lfq;
        Thu, 1 Oct 2020 13:44:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFBFu0ERCLmqeTMcIuW75RSYszWWHnfdCkuYefjYSUshA7m+9Att8+uxiW+UtBPdQOLAuV
X-Received: by 2002:a25:cfc7:: with SMTP id f190mr14355903ybg.271.1601585045246;
        Thu, 01 Oct 2020 13:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601585045; cv=none;
        d=google.com; s=arc-20160816;
        b=sRH1il2U/AoDklA/VicIqvTRTs8iEiiEOxxGsRkQUP6bWBHFn2FbuYlIqzs3/1uHxF
         8hunD1Ip7Yu9mGI6g+KdNA6OUla+q3DGnyTSv8JEosALVJqE7sVBs9OI9keWhm3VILfO
         vnOixV8d7Gc7R9Ch6kenJZWxdeIa1McYeaBCsWlvMgOkX+ux7z04Q5fQfij8TqI3mwgw
         lcTBJ1Q2XarQVjALGpFr3KvBcNeVo1b/m/UMo9H2txiynj7wL8VOeS1mqbBeG254+cfp
         aDY2DfPVHGyk3a7oC0BHNWK/M1F/Bh5QHp56j0WhS+gtQK99VA7u45lhiqJOLLMI5cu3
         Fleg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/ZDqjKscR2h1brTW66ZxSqMk0uKUmy0MPLBI4j0VFAo=;
        b=jRyUEoABWIbklyJjNrFwv25Ff0NJm6oKZxnxveDdwY2ySSo0uiJqHMtPCKtfaqZAqi
         IfBNWOFWWxNfPzp8zMDklSr3OB0W5qqvgSNnOSQKNk7LFhean+0W/bZx/JPjeDbNS4ZZ
         9EgTI/CH0uZ0oRWYvfCx43IGe5l/HYlnj7WFh4ztOBwP04TYs0UlzvSuX0xv9jcF3laF
         J/LpE5VOt/vPpLyb0ZTrsgyLhZUdOy2zRjdrjwWhYw16z/BzNe+l8bjEWwaoyj3c0Gxj
         D8qKV9je+a/2ILCPyACkRlkzYYTYO3rg0mR6jxYsIGdBe0Dc9YFqW0Quv5Hv+ib9Lvnr
         XaBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FbJa7uWL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si5574996yba.417.2020.10.01.13.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 13:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FbJa7uWL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kO5Qq-0002i2-Er
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 16:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kO5QG-0002OD-T2
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 16:43:29 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:39464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kO5QF-0003YX-DM
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 16:43:28 -0400
Received: by mail-ed1-x542.google.com with SMTP id g3so2741263edu.6
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2020 13:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ZDqjKscR2h1brTW66ZxSqMk0uKUmy0MPLBI4j0VFAo=;
 b=FbJa7uWLVPKfL0uUo/HMQY9gevlHIYcD3fnOHEuVmJ5knFwz6ZyaKiz+0U/vVX5lvl
 JbEE0Yt6dXTB6xjUmr3mpV87qGQhjt/R77hNwmD8YyRyNbp8bfux5kJp/PUhOSQaRuAP
 xgRjyoUD5ZSi70AS7Ts9akMRfxAHpkFoTXB38xG69426INsBqQ+nvMtxKCMcrQZuWG4x
 mnikUzL12P/m6LAzjuz+sR75yRI7goeP036QwFQW0/zlDSEli2Dzee7+5zfeiLq1WfUs
 BJH6ZQ05T9VWk1HjO5hsjZwu+lO/lSztvQ7wG3TTJbldCbIyQrpRLGMCBzoljH/MSaer
 jECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ZDqjKscR2h1brTW66ZxSqMk0uKUmy0MPLBI4j0VFAo=;
 b=mVj/JkwjzfcOZrhrPUwxgID9L0CxngwO/IbQGJz8Rdv+SXFJmh4VSXo8T/Hzm0KYNH
 Mj1mdd91Nr0l2qwxXUqJw5NPcEOVR1w7xJY3px0zfUmHf8kZGaCltz5dXLrKjdsJML8j
 BaLNCjkycHug+6k1R6RTuBdkHNYAIJPcwKmk2BwqYT1zzurpzxTP1SpjV8Dni8Qw+ijU
 W6wBvg0WoQ5sBxDbQZ8mIiRJNLz/EFA+og62HRoVIjjZoZHvYy3rBGtRU5E+1zJcdBLA
 TgUu0i3WmJ4Rce7eVJc3c22Fjur1uDtjBCEdC9wodlLzI6T7825KNp0Trwu5uhNx4ePw
 6T1Q==
X-Gm-Message-State: AOAM533ML4DmyRebHcDM8IEeZew/V+at2qi5LWiUoupv5jTCz0HNsmmp
 ZfrSvih6SQVqYjqsjsbuYFuSpbLEvNkFQZczRgKVOQ==
X-Received: by 2002:a50:e68a:: with SMTP id z10mr10644272edm.100.1601585001469; 
 Thu, 01 Oct 2020 13:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201001182121.187122-1-thuth@redhat.com>
In-Reply-To: <20201001182121.187122-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Oct 2020 21:43:10 +0100
Message-ID: <CAFEAcA8nQgvgdHE7G8b9sWP4kFeRZvseyFzFvOBFAp8O_A5Xyg@mail.gmail.com>
Subject: Re: [PATCH] hw/rtc/twl92230: Silence warnings about missing
 fallthrough statements
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jx4GvuiGFpKc

On Thu, 1 Oct 2020 at 19:21, Thomas Huth <thuth@redhat.com> wrote:
>
> When compiling with -Werror=implicit-fallthrough, gcc complains about
> missing fallthrough annotations in this file. Looking at the code,
> the fallthrough is indeed wanted here, but instead of adding the
> annotations, it can be done more efficiently by simply calculating
> the offset with a subtraction instead of increasing a local variable
> one by one.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/rtc/twl92230.c | 50 +++++++++++++++++++++++------------------------
>  1 file changed, 24 insertions(+), 26 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
