Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1350648lfb;
        Mon, 19 Apr 2021 10:09:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB1glyWho8WtteK6w+TPwFQmrNUqa0YwPZ0zFv4jRoLa9Tv1zelWpAo3X7rNmzQTiE/25q
X-Received: by 2002:a05:6e02:154d:: with SMTP id j13mr17607847ilu.46.1618852164514;
        Mon, 19 Apr 2021 10:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618852164; cv=none;
        d=google.com; s=arc-20160816;
        b=F5/HhBRSmYpWKW7Iu3rRvmuOn8F9qX+98E4Iob0qXBwOaqzdEqhncep/f2tyaU+uP9
         LVHVMtzq3FfISD4HVyfxF1S0cI2TvJYdfVpiD0Hs/+JMS8xDtevva32s43YomF6BDEWn
         jMAR6XSpw5RTqw3N+se5dji75aSww73lfLHlYw3qJMEx6n183hZEieHEAjlfl04eXeZ8
         fT5FSOfYAPkx/1AgoCN6ODOL60/KAoi0poY2bVTUJq+oHJr0+B+KkN2BoA47Q5FxALE5
         qpLACQkdw5MbV/QmpDH6qGrdpenO1HdFbOf/4bQVvub9GMSLZ5pw0SkPUf1FrRvW0byZ
         9o0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t5uPwcKsAdunKOwcaweoVJ0FF6sGOTcKPCOauwpHWTA=;
        b=Rg5ep5Vt9jx+Lm07BKY7u64Cy4ER8yz7j2e4wgJNq2HoGB7aP+MScTdb2EQLpiJP2V
         AUeTclDSnjeWHt/7dIQSyeX1r29uaufP3NDutQEs3wiymTNQYeRwpTw1rrJ5T+QP8mxD
         HBbtFfRXGPXfzRWR2foadtywQC67zV8QOTXI7EymzV88XA1864eJIYOFH0I+KlalidHX
         dgv4IGN7O1oMm4Cx7r37lovRk9UugGgOVlkrsjfI11aJhd340iVflsoNjSEP1XOv6nle
         bvF8IeqT2fzgCVB7tdU1+UDe7FY/3r3VEDPe9DYeidSBvfJZAS3gOFToKK9pEBB0iEPk
         egQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E2kXBa2u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si9191597ilk.9.2021.04.19.10.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 10:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E2kXBa2u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYXOl-00013l-Pi
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 13:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXNd-0007wO-FA
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:08:13 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXNb-0005lb-4j
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:08:13 -0400
Received: by mail-ej1-x630.google.com with SMTP id mh2so32520119ejb.8
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t5uPwcKsAdunKOwcaweoVJ0FF6sGOTcKPCOauwpHWTA=;
 b=E2kXBa2uOrSgWawkDUUpVO6/fJDbEhGG3eoDkid5m0XS+3h3xVfTLMcOwHTw+e86iE
 uPvgXLVzTMQ6ocqnO0e5ulUywF3Efq2YSRF3rQtOIPTvP0qvY/uvO/w/TcC+/QBsIK5A
 AvBfroOBqcJjUd7zPW5VveSFa0bWHSJuX6KmEf/5E6t1OI0HSFzfV4uga3dph8ZngLr2
 PMvhs+eH1669sgE6hosPn2ul3OFzlIUGdXYpnjwlOargqpl0ZvXtS3a5kB6SaHx16hU1
 dfI5qRbXrlNdgYbKofW/88t7F1Rp7qLKhnX80tNtbhx17DAylT6Tyl/soyD/xueJwi/x
 oF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t5uPwcKsAdunKOwcaweoVJ0FF6sGOTcKPCOauwpHWTA=;
 b=bLcJpfJraiE7SCWfLpY1qh4q0rZXGhsh4A0bl+DvEM9u/xyWgPADbLm2jMARI4FSTM
 cLjs9yMM8vqEp5uWW1V1uX/QWd07bnPa3upZQ2G6GWZm5XJt5s4quSWbPJQMW0zFfqwZ
 R88nEk7N6WzhLQo6EnxGEZZXoHKqPegKXzx379kKuwZklBplS4dtd0UnQh1WIKBPR20e
 ekL40AzOgqbnHSmrcmdzCBnuvQYIErKmfkCv1pUW192ZlVw52MeyaYJMwg81TH14e74x
 9CG2VIUI2GDljH+o07iZv8Es8Wv6PLS4l7bCw5ZIP8isvxRODEE3SACvsgUZ2Ckco89a
 Bb1Q==
X-Gm-Message-State: AOAM532dUjQiJ3UlOPN2xj/Clx+w2ZQ7KH33mHzZ1u8oF4da2isjwhHx
 jiazw7YkssfDsCHS8O3eksLGXRPqZeldOy6/Ty4G/6OJHs4=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr22942091ejc.407.1618852088017; 
 Mon, 19 Apr 2021 10:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-10-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:07:16 +0100
Message-ID: <CAFEAcA9S4LT1O12p7N4Ry5fWu9tFjoWxcMYRpkguWQO09GWa3w@mail.gmail.com>
Subject: Re: [PATCH v4 09/30] target/arm: Add ALIGN_MEM to TBFLAG_ANY
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: xOiSZtj3D5Rz

On Fri, 16 Apr 2021 at 20:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use this to signal when memory access alignment is required.
> This value comes from the CCR register for M-profile, and
> from the SCTLR register for A-profile.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
