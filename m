Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4045148ejn;
        Tue, 25 Oct 2022 05:07:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6DieTc9rr3Yjx2yLVv2MSaH57JULn1HnWin1CWGZzBdxp39xAKdXOiaHZLFenfjCHaZ8Ig
X-Received: by 2002:a05:622a:5c7:b0:39c:eb0a:2cb1 with SMTP id d7-20020a05622a05c700b0039ceb0a2cb1mr31877152qtb.155.1666699628669;
        Tue, 25 Oct 2022 05:07:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666699628; cv=none;
        d=google.com; s=arc-20160816;
        b=LWgbaUVdk5BSVFtIgE1cKA4oYmF7eDwXKCXoM0bHLVtOMb/cSFYJzNWv9Crncu0wyW
         B0cQP+ixMuhjtQ1wB5mqgLH/9i9aLDbWEbO0ecyFHT7Grh7loPBmq27qeQxdSOjjgk9R
         bYLkYbWRLjgK9gkux8nSgncsHCRbZdJfsDiQHIlq4hKVhNEMN9ABw8+7YYXgEoPgelza
         xS3DYJ05mibjCXIE/Xj9lLRW8nx0GgnRdWhyDVWgTzhizsqfYDqxQQu2yN1Twfs1fFnE
         ASgMINE5BJS9nOe44NLXGPPSSwXoEG96kIoqptJGo2zN6tHeHVKThrq3ulraHe70YJ/A
         oVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=59JaS4Wkj7dq0vEEMxDP2wfyvXcoHNuhHUP+ukzSxW0=;
        b=TxA7SOQtmdH1I0oUXWKs8DTUfcg4+Db2GuS1XuuSL8PrAb2UnkoMOixrvBYIOxI/lb
         VLfJVIG+WgqryyPNfmzTr2owmriRqzsD+hvwX2MeL7fGihRGyCvXslshNMRVBo5rFB7r
         jhlxnAF07FZWkcsc5y5WmCiY8s2998QQmRJTuJP6xifWYh2q0SKBNmP/9r6q5XdrHRRJ
         Dmk4P/ZyD8MIYsdMhQRlwMePXf9/69kd6buVU9SYSdoi4zte52UhYm+KUi0hBe21NYR5
         obDyiyDb2go/WBCdIjmIg4eAL0rhPcnsuXGjBrjh8roYWibNdmW+5pW39cGnmvsj2p8H
         zgdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fy64zbJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge15-20020a05622a5c8f00b0033c616d2192si1627998qtb.713.2022.10.25.05.07.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 05:07:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fy64zbJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onIg8-0001Cg-Fm; Tue, 25 Oct 2022 08:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onIfS-00008c-4W
 for qemu-arm@nongnu.org; Tue, 25 Oct 2022 08:04:30 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onIfP-0003Gk-Fm
 for qemu-arm@nongnu.org; Tue, 25 Oct 2022 08:04:25 -0400
Received: by mail-pf1-x42d.google.com with SMTP id f140so11622470pfa.1
 for <qemu-arm@nongnu.org>; Tue, 25 Oct 2022 05:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=59JaS4Wkj7dq0vEEMxDP2wfyvXcoHNuhHUP+ukzSxW0=;
 b=fy64zbJDJD40q1P2xiC75eD3E5BpAkm5cL2qWvavncEViUMXmnIH58U0CrnOjUeile
 jWBTefzAexpYdw3SpLATtACoD2AuA2AF/e98GrdZI0wlbHtqlhVLWc5POGYGevJnky0i
 n6ylwrS6bXo0SZ+vExNSirrktqmie7gxyizi705ZVc/fwMdQtf9HRpqHRPBHv+WD3juq
 mZ1QJzm12jGLb9pVaSqCtH0yKoboyPqeLva9xfYe3GFrVl88MOFJo6oYVTCKLMFOGaAR
 0oohFJ7mbb6jTwxN3mp7o1izAHV/1cpT4qWEUjZj45927m9sHOO384wE7uJQ2L0n7obu
 bHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=59JaS4Wkj7dq0vEEMxDP2wfyvXcoHNuhHUP+ukzSxW0=;
 b=o7k6xwmkTnLYjr+sbQntMjr0LrLeUbSZKkMFdkarmaesOdHmBdzxVSvuia93x/RKz4
 WMm3GnlZfSDTfVVy3HYJVg4nDTxIvu4b8tMXCJ7lCfaNkG21CkFGGDFhCNl1LRUSR2VK
 nMykRpyyrYeCyKSvx3FCNJ3Q7kr3tJy6s1iU3McimKbGr9FHZWT+WutenZTHv71RozTL
 e+UfPDyK/3G0jdPt1JyvtGB52SIR9qEJvnA7T03grUcONvAwAB4GZa1CeJEmU81+lZGr
 Q7CzaiutNBCvtMeHgm8oGc6REfx2ceF92RCaQuGhVcH5f0pOE4qxi6gPiOSI4raSMUbl
 RtCg==
X-Gm-Message-State: ACrzQf0D3RL/QCCSm+5Y/u9poAWT6g9Ss+Vi77pRxEgEQviEJxQWSQ+L
 vx2EaM4k9hjFut8bSHv/0MfffKgANMtnWwOsNVcGVw==
X-Received: by 2002:a05:6a00:b54:b0:566:917:e57e with SMTP id
 p20-20020a056a000b5400b005660917e57emr38310686pfo.26.1666699461573; Tue, 25
 Oct 2022 05:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <166663118138.13362.1229967229046092876-0@git.sr.ht>
In-Reply-To: <166663118138.13362.1229967229046092876-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 13:04:10 +0100
Message-ID: <CAFEAcA_W6QqBHeN0D+XR77MVyhk2Bj_kZC164SJtoMk8ByaVxw@mail.gmail.com>
Subject: Re: [PATCH qemu.git] target/imx: reload cmp timer outside of the
 reload ptimer transaction
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vb+ptwqkeBRv

On Mon, 24 Oct 2022 at 18:06, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> When running seL4 tests (https://docs.sel4.systems/projects/sel4test)
> on the sabrelight platform, the timer tests fail. The arm/imx6 EPIT
> timer interrupt does not fire properly, instead of a e.g. second in
> can take up to a minute to finally see the interrupt.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1263
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
> Fixed the comment style and the commit message.
>
> > Do we also need to change the other places that call
> > imx_epit_reload_compare_timer() in the handling of CR
> > register writes ? (Those are a little more tricky.)
>
> The current patch fixed the issue we are seeing. I'm not really
> an expert on the QEMU code here and still try to understand
> all details. Might also be that we never hit the other code paths
> in the end.

I suspect your guest happens to initialize the timer in
such a way that it doesn't matter if we don't get the
comparison stuff right on the write to the control
register: conceptually I think the CR write code has the
same bug where we call imx_epit_reload_compare_timer()
before we've finalized the value of the timer_reload value.

Anyway, this patch is definitely correct for the LR
register write, so I've applied it to target-arm.next.

thanks
-- PMM
