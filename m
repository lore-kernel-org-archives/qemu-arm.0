Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp166906lfb;
        Thu, 9 Sep 2021 06:47:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx0FEOCWUB90bqueec6b5meCtpcCcvKS9pSPxBEgAbE5XtVsWBdl13iR0Sg0mcrQg9GPJP
X-Received: by 2002:a67:6787:: with SMTP id b129mr1603160vsc.46.1631195266946;
        Thu, 09 Sep 2021 06:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631195266; cv=none;
        d=google.com; s=arc-20160816;
        b=xpWz4rLyczIYp5Q9Cm7DIMn79Cq2+QVWu5jlhe+MNZjah3IZYsKo7zdzAs56S/5iLj
         L5LRmbHKdPEIdrSToJgGWzgXjgKoBEXEsWhQ5aLQJmqQb42Z5pkwqUosIXlc4Gldh8t5
         /36EpTGPcPzN21hLeG9ODyzMdBWD4zx+2BwLfAhmAyLsU1FKq8skgirueau0TYSm/p7Z
         ppxGs8LhKDqdjev/UgvYGNxVjzlkoYTuf0hPF9CvL7Dr5iDXLhdwzPqmpBe5pxOOAi/P
         QX3reC+uRc+2mDs6AmSvoT0uYxN0Vr9EclMNR15K1B2wcKmGIbfhFrrrFArD4gbqLWg+
         OCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8s0eFTRsUnLLbRXuZfQgMWA4BuSzg8LkOZ4/rwa3w50=;
        b=wyPv6ZwJR/6o0UmeDgh5nomgt8opVEXI442+bz1kxVQy1s0tRICI2hINIO/M2fQVM2
         /vtKFEW8TDaJwhyknwIId3e+5lSzSBm3gMXauxkMov1y+YUFG+4VEo5F7xabaetox5sh
         sRWzi8pKZIdN4H0lYL8knNkj4/YzENmbwScVwZx7VpkC4v683xjKt6BEoBxRlOL4Mz83
         XqkCjyySb+6CEXvaoO8Q0V0OIJIvPcQMa9VuijfObSe4FKynJx3BwKKUUBS/1Q5W0sNG
         +80N3NHGuk8gs5iplKC88VlNYZqHmsKSTlfQGi+T0Sihx4wjtR9ohD4mkqnvuxw7g/rm
         Rnog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X/hL3kdG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si493064vsh.155.2021.09.09.06.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Sep 2021 06:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X/hL3kdG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOKP4-0007uc-8l
	for alex.bennee@linaro.org; Thu, 09 Sep 2021 09:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOKOs-0007rF-NO
 for qemu-arm@nongnu.org; Thu, 09 Sep 2021 09:47:34 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOKOq-0005J8-4V
 for qemu-arm@nongnu.org; Thu, 09 Sep 2021 09:47:33 -0400
Received: by mail-wr1-x430.google.com with SMTP id u9so2661834wrg.8
 for <qemu-arm@nongnu.org>; Thu, 09 Sep 2021 06:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8s0eFTRsUnLLbRXuZfQgMWA4BuSzg8LkOZ4/rwa3w50=;
 b=X/hL3kdGcIYgGgbuyH7JMyTyJ+//cM3UG0UcyfEW5hRPuSFGdcxua2ooMQctd0teMc
 A5SaZIgqrOTafNfUTghMtaAttZ7dB1QNyeQWZQ+r30SbdvmfTIhEE2/ROmaxxXtBMqSY
 2c5WDfcJilM480BJljcMF5C9bFr7jerdDFSiPzz+cati8TtuFWs+Pj9lgtslN8LfyD4R
 L5AduXiHOSG2G7DLxgHEwTPpCa73brpTfDyJsepcMiqAtnXVO/vFbmaLYskUhRxDazQ8
 +u8UfL6J0MgPE9yP/og9QSKtIcabOwq4sP1FgYW1daGqA0Gxky/K8ZXv+CWuZx5i3TKG
 hyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8s0eFTRsUnLLbRXuZfQgMWA4BuSzg8LkOZ4/rwa3w50=;
 b=kCtgDAUPBSVfcinJIrTic1e2ELCKLTi/dMxqII3zu1PjAKh7NUAnyVLuk7Os6vIJTD
 AZdFA8ms2s30e9b/fbYzWkduEK0oT/nNOoWwlpXq8X6xl6QUyK+JJsv3PN7hxiMH8X8b
 FmLXe3gnQ9snw8ZwaX3PjMspwhY4LR/CiS2uRzFH96JOJYNVJM8IxLoikrMS3x+bIX3G
 W+3+Vkl1USYEilWQkueuI5FtRfGbnYNI/VIIIR5RrUGN8V2QvCCSa9mMZSprVr4Ny4Ty
 O0xixJNQptgA3H1V6XD+ejBg7bz0RmHrkFCC8eqcSirkbvhobsH7nhsCCEO+FfGmVwKR
 dJrQ==
X-Gm-Message-State: AOAM5334ldIQ/1vp/wtdWNp6jvycOQ7Dm7UcCnMs2tvfq1FVx/8qqlD1
 vxXYswYoTo3fkAn3ea1h0t3ZcyRPgkGiyL1Bd/In8g==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr3737536wrs.149.1631195250255; 
 Thu, 09 Sep 2021 06:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
In-Reply-To: <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 14:46:40 +0100
Message-ID: <CAFEAcA_xUSMEoT34fkwiGef8D5Rwfkvre8o03YqgEw-qD86o=Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: 6gWScmPkgIRd

On Fri, 3 Sept 2021 at 14:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I think you need to go ahead and end the TB and resync immediately.
> Just set dc->base.is_jmp = DISAS_UPDATE_NOCHAIN instead.

Is there a rule for when we should set is_jmp to DISAS_UPDATE_NOCHAIN,
when we should set it to DISAS_UPDATE_EXIT, and when we should call
gen_lookup_tb() ? We seem to use all three methods at various points
for "I changed some CPU state and want to end the TB"...

-- PMM
