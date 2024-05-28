Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp50659ejk;
        Tue, 28 May 2024 09:05:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXshDHho/Apon3ttuTqecKwgyEjLx3fh30sOBN3eCq1uhYNh7zHCq/Qo2W+0UljQ3QxvbTpgEs9SdcB2MVDnhShYQ/V0ZeA
X-Google-Smtp-Source: AGHT+IHvDy0cEKC52FBo7syujSbR3AmHN3K5qPhv1SUGsAnu39pJPvQ5CzBZKMQUP6BNNM8Q0bgv
X-Received: by 2002:a05:620a:2455:b0:792:8e98:d03f with SMTP id af79cd13be357-794ab11f6d9mr1563855685a.52.1716912324820;
        Tue, 28 May 2024 09:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716912324; cv=none;
        d=google.com; s=arc-20160816;
        b=CRChcF4rk8WQjmr8XMXskTGuH6wS/dqWGRyF1CJ9LjVZur4+c5WidZZC25Tt5mr2Ud
         jd1iiKQq4lpmD4jYDJHEBmfnz++XWPBK4/V9/1rlxN1rQV74v9U5pz0AdwgJDXXoUP7W
         WBHT9E4//pRjQMmPaIl4vdEyT5DrWju6AzoTjckZELclCkU/glCr5m2fCrQokKrJQ/j3
         KzUaiDEFddEMb1fD0O6Zev1VuqRecpGD5sYM1p/k/1PD0n8U4FYznitjvtyMjs3Opwou
         ubpU+UNyO9b+MAMh0EaY6+7PbOj0nnUbfs9yS7CgVnmmbV9qUbnJDQhy7BSbPc7gfGTm
         YQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TbmHJuvd9skI6hjG//tiPz/xdB7vTwogbjGsB3+L8Go=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=DpdOrlaQ7vA308hrZq3vCqBSRp9OG8QsixiengrvLgdsVRYwkxA6emOzLxGElpfQ6N
         S1yJH+VLBizhk3W5R9XZ+XPBYqDwWtIDGwM9bspcd6Buz9LSTo7xuV5ZQDK6IcDWl6HM
         a8s4RXBi+EW0lu0sf60F894rPlabVvyLpjdhnKYAMfNggSO5vPT1NtTGz9s1zNc6ymWO
         LDpa4EXpiYHoTDaZYVyaszYunLCBHoZVQLCLxLBWOTJDji8UkIjMjSHdb/HJoHd8GMOT
         KcuguvT8yMG2IDTuZ5iIgcHrhkIOvKnF4SVtpYqjraJtna9xGIhjb/N+V87/0uiqxRiG
         cSRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AVoI0q7T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abcad9d2si1168905185a.56.2024.05.28.09.05.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:05:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AVoI0q7T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sBzK8-0002v3-9I; Tue, 28 May 2024 12:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzK5-0002kt-Gh
 for qemu-devel@nongnu.org; Tue, 28 May 2024 12:05:13 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzK3-0008Ao-ED
 for qemu-devel@nongnu.org; Tue, 28 May 2024 12:05:13 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5755fafa5a7so1325496a12.1
 for <qemu-devel@nongnu.org>; Tue, 28 May 2024 09:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716912310; x=1717517110; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TbmHJuvd9skI6hjG//tiPz/xdB7vTwogbjGsB3+L8Go=;
 b=AVoI0q7T4qOhv2oZZ3ArTFdqqc0ZAwGWgGbo8aiIQybwJtLjxbXSDK0b1Q9gjZmdii
 +4rj8dwVU789QvmaMLRfCM7fpBbsOYXbUJ5sQKpagPORmwSxeGaJD04ipnetaL2vDqSJ
 Z/91hFASdYuknNog0edRHVVZaPIO5QhR2kEqfbpzdL+0b7YXDytpZ4Vj9Dq4uLeGT+72
 s7p/7+Z+0ziz998UhpTIgdYqPEwtwlv+eRjNGdfpkNfeOAohhADvP8nsd4fcxJFrnXbC
 OlvlxRnBi7/D2vxoiFeGPH6IreLknDxYhQRbCHcSfRlWOczTCfqH4Zi0jlLFtqWVx1D+
 8UMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716912310; x=1717517110;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TbmHJuvd9skI6hjG//tiPz/xdB7vTwogbjGsB3+L8Go=;
 b=FUXNxpT2LWUq1s0i+kmYnOpRUZylFnWs5ypopX6AHDjRsNdSZdEcDt5WKTensAjSkH
 hR/OALON4w4hE2j7zrdEiAdVUZCrT3w5Ts7sL2SckqfSJi2XO2TCCOGHtgmLHAMrfbfU
 XET78zj0q4vWf+cwzjhMt0uTbaT1Uga1vF/YEKPF0SRDwb/mg6XsOnTObtVfgyYwi79a
 lDzV32XhjKdHr39wpqRS4H6vcnknb5Ft77GbWZPmDkkbD8HXp4tJ7gk9S9wnqyOwscRh
 jd76vIGDOJEqanjOqDV57lDd+KSZkGWNtoX6gWGGrpazS7Zz4NRmKn15nyLCQLRD5TUS
 ckYw==
X-Gm-Message-State: AOJu0YwH71YkT+FljOGSdrot9012i1/LIr0JngIRPJbqh3JcGfCiqSKE
 BuHofnPQRcL6wAbjHyRatvejnMeas7wBXjqskETqTP6jdQpQpZFVRUVTwUoE00q+Ki1DhuNpvpS
 ETeZatkaHNdn4f8g66yqSdpv7ay4ST8Pug3XRHA==
X-Received: by 2002:a50:d75c:0:b0:578:62e7:e5a4 with SMTP id
 4fb4d7f45d1cf-57862e7e682mr7012440a12.6.1716912309971; Tue, 28 May 2024
 09:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-61-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-61-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:04:58 +0100
Message-ID: <CAFEAcA_yDMmyHKzHRGd735O2=9n86p0Zm_wUBWgt15aKEOmmPw@mail.gmail.com>
Subject: Re: [PATCH v2 60/67] target/arm: Convert SMAX, SMIN, UMAX,
 UMIN to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rp9m/U504cFs

On Sat, 25 May 2024 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  4 ++++
>  target/arm/tcg/translate-a64.c | 22 ++++++----------------
>  2 files changed, 10 insertions(+), 16 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
