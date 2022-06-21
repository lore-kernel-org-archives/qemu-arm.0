Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1354805lft;
        Tue, 21 Jun 2022 10:14:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tjMBgxqZAvQR+pi/r8t59E4M0fEBn3PN7ZKBYrCjOU+3Yt22kXFJLy5YVdRQMvUZPHxYCS
X-Received: by 2002:ad4:5c4a:0:b0:464:5920:7c1a with SMTP id a10-20020ad45c4a000000b0046459207c1amr23997972qva.58.1655831669136;
        Tue, 21 Jun 2022 10:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655831669; cv=none;
        d=google.com; s=arc-20160816;
        b=hqmTtYAu59d+YORlUFO23GZ3PEtuzAKfYC1+KhjkCFfRtlMebQHgDyDRz6ZBjcqJNa
         1HUxWkBrP42H5vD1mH+ysG2edzmxCioukWC67Hx1jgLtNeXqfQ4Gd92iWtVLnDzerqP9
         CN9/0Rx+u4jdr0zrG74y0Wd3EJZYnWafxrsPnJ0/2jdHUkExAE8DlRFqGOMU3QI6wg/q
         AmOvHr1ZCiYfHy3ix66ps1QwJPEZUJ3Ox1zzHi9mB/hIUUP60zTG7Aqy3J104vouPksm
         WpVprOvSn8ijMKJB1TxD3xZ9F5TGjoWyoJBWr9bARXqla3pF1XBXmZpxIs0X0IEpEL1+
         zfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0eAJQTro8w6Na4Y4vMWG8V2LDgTJZRQku50w+o3thI0=;
        b=GoEKcwGRzRvjAbH1wGLLieduThzK9cInq7x/aYrIPBeqSCtS4YiiYjkC6G2sbfb59u
         Vm9NNQiXDdFcujrgvDfkt37hGfEMMNTuPE2X8gqnzjIhhcDc6vKq+CdWUYNSmoy+Kta1
         Ujy+AIwy/24sXQx8wqoSp8O7d1pWYnZ5kqniD8e2pv7ok0myI1Qwxk4poIC8L4H2aPxK
         j9EGqXfGughwWW3nODk+3ogdndPl2ac3OeDrKailF3ego89nrPpXgzg0kV6dNji9CFnY
         DO2VZuabeJp+C3tFJsz07i7Kwq6uPAhFdDyKlV6P1w5YespQcj1v+m7BTQHKFaRyiq4A
         IJEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y3FJiHlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq15-20020a05620a468f00b006a760e6f5bfsi10398934qkb.627.2022.06.21.10.14.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jun 2022 10:14:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y3FJiHlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3hSO-0007JE-MI
	for alex.bennee@linaro.org; Tue, 21 Jun 2022 13:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3hRu-0007HR-18
 for qemu-arm@nongnu.org; Tue, 21 Jun 2022 13:13:58 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:40701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3hRs-0007dR-JK
 for qemu-arm@nongnu.org; Tue, 21 Jun 2022 13:13:57 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-317a66d62dfso77073347b3.7
 for <qemu-arm@nongnu.org>; Tue, 21 Jun 2022 10:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0eAJQTro8w6Na4Y4vMWG8V2LDgTJZRQku50w+o3thI0=;
 b=Y3FJiHlRH2ZflAXU0IL27YgAy0joFWhjBZ6NjabBI7vnjGyy+mylKTFj6PgsY8GVVd
 YWqxzl9/K//+4xgikQlklSD0RkWdHjl/U0PlbNGD9X6X89rhxXO37yA7QliAD2IThUK6
 pSxiQ7c0L0l/NtpUd/84in1gnnTJy/Q8cTlmX9kKaZAn9SJQ8lv0lMQXTdKkbRjkedIN
 Yl286DcZV27BTX5vaItBxEbBRcWe4Z2+ziAENV6OxNS2o11MJxJbm1KH3/yG+KMd93NY
 lTvMI09SOSAYUwj4Iq+Bzu+sKDF/yPfQx5Q2v9U5hO/ijpW71Q/kvUVXmQOcN8zXr+nq
 S42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0eAJQTro8w6Na4Y4vMWG8V2LDgTJZRQku50w+o3thI0=;
 b=pICVycJ4ADGItupM2bxU7EtFnF2vrMYZf6ZgPtcCRfFdZ3ine3yFhdcZLKB06kBNeQ
 WqvAvMm4HDpPRlrwn3/NOw+NB7CQWIAAJL2mlR92jij7DS4kxG2EoTIqxr6cC6/nv+SB
 PAbt1BcHjNW0lkjt0vifpndURgJlyWJIpby/Tk7gYNqJXtbSKCADsJA5lwR0FQ4AHNTT
 lcqSc5A/4cegqsbm7yXhPhm4ltlc5K19xuotTyVmiexQP0x1QuJPDuq4Dl/ssF6xWDWW
 84dHvmjH7Xf8i6rhFS54gl/d2EwmvpvTggGLnwBjykfebZIw/9+4wuHA3o0U9RHioyi3
 dNHA==
X-Gm-Message-State: AJIora8nnAzAOXLH9Y/OJzUtqE9HgQVKwjmCnNth5IEjYvlPYNCmwP+9
 K8bef9s/2S4IJ5CAPhawB1fhZuWQEV9EmRAmbFasbQ==
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr19440723ywb.10.1655831635393; Tue, 21
 Jun 2022 10:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-18-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 18:13:18 +0100
Message-ID: <CAFEAcA9_hxHaWBReL+0ySFUgBJaWb-00078qyuG6wHDP75KmpQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/51] target/arm: Add cpu properties for SME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LOdhhyVA/uH+

On Mon, 20 Jun 2022 at 19:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror the properties for SVE.  The main difference is
> that any arbitrary set of powers of 2 may be supported,
> and not the stricter constraints that apply to SVE.
>
> Include a property to control FEAT_SME_FA64, as failing
> to restrict the runtime to the proper subset of insns
> could be a major point for bugs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
