Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3664426ejc;
        Tue, 29 Aug 2023 06:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlXyWc+d0pqmTLkUTCaqk12P+A2pPTN7TpllQX3lorYI2sT9ZD3GYTT7+Xvl8zYASjeqMj
X-Received: by 2002:a05:622a:1706:b0:410:a018:c7ec with SMTP id h6-20020a05622a170600b00410a018c7ecmr28549868qtk.6.1693315757250;
        Tue, 29 Aug 2023 06:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693315757; cv=none;
        d=google.com; s=arc-20160816;
        b=pNNOYkqeJRALTF7MeAlUQQnnXBMMEgoK75nbxJWujpOf5mHCmk3YdgzZxGu6q32YJR
         U7oylK48DpbCl0NgsN7kOFcXhDev5skvv32YsDUCCbAG5wIDAShAUccKysfdsl6ilvw5
         DPd3oip1T/k/9P3zWKcbp60rC+nzw6YspqkkO+xkCEah9QITJUoXJZghkwJD+44xIYX8
         6dBCa2qrALVEuG8fX9AsvswwD7dk3JAodpcd+gPMAtDg/CI4xpA0Md80mAB1fI8RUR2R
         L7wI7g+cYksteLcXboNYVU++In/rYiUiarkQXf2p5+3X9s+kYeXG0QspySMjzEd2NeTN
         4tPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Sx/bM7QdDkhgmgSr5gZET7B5Nu9MmQxxvRD9Yyke+5w=;
        fh=KN15t2ypiO1BgVdQTfcSGbN7T6gS88c/uIatLiZkeQQ=;
        b=uBzje4buabByViK1OYZBQQoBJxiJgyFoZv+czCcsB9rOy5lmmYBUKDGa6WdHYm/EEZ
         khZx3YNQ6OzQWq7+6nwRV13Ns5bs2bwX0lCTNujlxy4X7oKok+T3VLgpi4vIkF18w5Mt
         1rGpS2qhrO0XBPkK94/NzJS/Zs0JLZC245kfU+sQLhVEWO1JMOl8Z3NyoPFiraCEyPja
         f2+rLBL3oKSd1iaFbjmTulW3buT7h4Fpa1Ptm802Ot9ICLvhmUeeN76i3vP+75LsKhNI
         ozjuYqIWvl+onid0Mk+FcF2DkSaOptph6VnZZIfNA0Lggd9LHqvyYi5o8uuGHfUOt89j
         LOkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yAIwLpfq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020ac87dcd000000b0040fe13367c8si6282755qte.243.2023.08.29.06.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 06:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yAIwLpfq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qaym6-00046L-BG; Tue, 29 Aug 2023 09:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qaym4-00041a-Sh
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 09:28:52 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qaym0-00064c-8z
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 09:28:52 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4e6so1197801a12.0
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 06:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693315727; x=1693920527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sx/bM7QdDkhgmgSr5gZET7B5Nu9MmQxxvRD9Yyke+5w=;
 b=yAIwLpfqN5VZ6cI6B80Cjbk6a4GfB0KHGKLb2HnL/FsDaJHxMzBLM8n+brZ+ixwzfP
 JJ/xY0DrpwNLkY3KtleFDkNhMVJnt7i4kTS6fAmMm2fFPFSVX1PXCxUgABoP14XABYOi
 PZUyJGMTKFsK43EMdu2h5BGdcWA8eQErIOG1vs9eb2jzl7oukE0HZqrNJOVPdeic2odX
 KsKYogL5a3okm1KfQLt4S0yo6ftfyTjotvtXLD6YK3su+wQPI2rvvV4CGMSX4FS0ysxh
 0MEitVPAZvAadKJKm0ubNW9z2Efr20gOe5qPv4HnlSn5haK17u57MATGl8Wf8mzkxKBZ
 7tDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693315727; x=1693920527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sx/bM7QdDkhgmgSr5gZET7B5Nu9MmQxxvRD9Yyke+5w=;
 b=CROJyehoOxcvzW2t4+DdbSdUddcOzT2QEBbYpFt3FJbAm0m0mXYXeVn+sHHsSN1oNn
 DcVNUClOEK0/fiLEgl8yreqOTs+h5ay8C8b+TtYXQf/K+6Lb/GXXP/C/IZ5Fd2Hd5dzP
 i9u5nqLLIm0ZqdvHIYrNRiAoNUQwrPjIuadV+UuSA1GGrzgqHFA0i0fJ47IS5rDvzBJx
 rqd6Rg4vtA0F9u2jYAwtaXB/8HB8ABJhqJYRxOl0HHRGo5lBbcBqHiGwJOjMl8Dj/A7b
 DbhMwUsLhkgfO6ajZ9ibE6N58ohhAmykEJtwCOncHc471q+s9MmheQefkiayQCK2wM4M
 jkhw==
X-Gm-Message-State: AOJu0YxVU8Y6OX9K6e8rgYnNqjbCPZg57laVf/Z3RPaCcU57L+lIiMk/
 VPZxxJgobFpFsbt+fMP06QDnnJqtRR2Rj5VKYK2Fbg==
X-Received: by 2002:a05:6402:31ee:b0:523:4acb:7f41 with SMTP id
 dy14-20020a05640231ee00b005234acb7f41mr20490615edb.14.1693315726997; Tue, 29
 Aug 2023 06:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692964891.git.jcd@tribudubois.net>
 <59e195d33e4d486a8d131392acd46633c8c10ed7.1692964892.git.jcd@tribudubois.net>
In-Reply-To: <59e195d33e4d486a8d131392acd46633c8c10ed7.1692964892.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 14:28:36 +0100
Message-ID: <CAFEAcA8LF3zzne9PuvV3H0j-w7BtfEG8B7pp8bkgEWi7aTZ_SQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] Refactor i.MX7 processor code
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: rQUHaeR0LEYf

On Fri, 25 Aug 2023 at 13:22, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
>
> * Add Addr and size definition for all i.MX7 devices in i.MX7 header file.
> * Use those newly defined named constants whenever possible.
> * Standardize the way we init a familly of unimplemented devices
>   - SAI
>   - PWM
>   - CAN
> * Add/rework few comments
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
