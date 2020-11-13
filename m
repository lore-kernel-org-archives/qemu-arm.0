Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1242508lfb;
        Fri, 13 Nov 2020 02:45:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHzay+cV2v9GTvESXVzev6I4LyNhyiYZ0sETweHV6DbeLvMSssZ0dqgMSA/YO1N2Wr+luV
X-Received: by 2002:a25:42c6:: with SMTP id p189mr1936944yba.255.1605264316754;
        Fri, 13 Nov 2020 02:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605264316; cv=none;
        d=google.com; s=arc-20160816;
        b=fyUZgmSOTCQvMq4LbNpb6ehGG8Xt4PmlEaLJ6plgPABfyN/Wu8DQNYjidi/3+IYrM5
         Gw+fwQD55X0fPY0FZIygMa9jEr2RiNlGs93bZL2QFZOYnvODI2+V4vIt9yIimnmMqmCu
         NOuaJeaEFGG5ei83qVxwvxbY14jCplqewLrUgxCCOWpIEZJUifSIN+sh/bDPBtDMU9Z2
         HXTBg0WJyWruOnlecMtZ+iV+1Xe37eG6XtdjsQorziDia5SDpizijzw7pQzocMljjNll
         DxzGuN4LgXu+qTLtKMx9A4t0CriwMFysrXQqpIBkUAjUoZiTcWfL0gSRVms6G7UkV0up
         TVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+UjMmZ1rq0duNjCIn1TJgyIq8diQ8uf5F0C7zaSJ3gc=;
        b=jsuWfLsF4PoeUzL2zn4TfNnbaBZ3JHiOiU+LqkncnFS4cluB/ECFoyOoW6L7RDJ3W0
         jq/vixnZTkj7pLCzOKxB2f7GpOdTTWvCzA/vKXeRsR71wYOErHkmafTS8x4Lgl1ARljQ
         8/72XPJP/nw3eSKmu716SycQI/NseOwaNhMGXadeH5ekw8V7Ncdnr9Bd3ZGlA2Rcbecb
         nBkmVpMhnx343uY7x2Gl7eTj1kauzq2JVUg9EiDNDsCZYz6sohviGU6n+PaqfNd0Dals
         ls7MK5CR1NWoo6xm2dDy9AxRDVgOi3Uk9Rull+DXQ2m9f1D1B7A1TKz9xqZg9eczp3jp
         A7xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WsTrS9EB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si8453851yba.16.2020.11.13.02.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 02:45:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WsTrS9EB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdWZw-0008Ga-5k
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 05:45:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdWZi-0008GF-Un
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 05:45:02 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:46224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdWZf-0005l4-0r
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 05:45:02 -0500
Received: by mail-ej1-x641.google.com with SMTP id w13so12653154eju.13
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2020 02:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+UjMmZ1rq0duNjCIn1TJgyIq8diQ8uf5F0C7zaSJ3gc=;
 b=WsTrS9EBMazIl3PuJAMk/k4cYNOX4Fci3NyW/vcg+Lb+t7A3jFUusle1LFcPssBM6/
 iCPePb5sk4Zy81dYarZN89aaVK3JoturgU31GqQiy+Gf7UKHjunZ39FksUsDyKevflVg
 E8fi07M/lk9Oz01Ln13XBRhjFdtrpPS9hrEUk89afHlk+PyW+eGuUnNw4Gds1uxZ1/RK
 CBPyu10OLJV1a2FN11b86fPwwOuTV+jG1nJAOIAAHd9Ac05f7t3llgY3zna8EnBorRtq
 aXCpdS8LHIOYqVBq4VummnEQqk+sDmtNb3wNLGpuA7sFvJNz8PXzr8AXAZh5FPQNtlqB
 ycmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+UjMmZ1rq0duNjCIn1TJgyIq8diQ8uf5F0C7zaSJ3gc=;
 b=taFGAuixb5S5MrntBRXJ8HMtRToZ8EGq1zwBUubKGnDJY88+9GMtAkeKE0+5ppRUK3
 GgwFWCVMLJZxUX8j4H32/dSPPweDh8WlvK1T0GfD984ENLctO1598ZLP43/RKjn6FCty
 62OEJFs28G7WEVF8lT7HQg33CyrxVT0sma74RUM6svrAKwBzG2K3B2S3oEb8e2C3++iE
 bMHbsRN1TV5RInkuHOVXhjFAv1xiNQEtUJEX8V0VwsbW+ClmFd8p5eGayy7Ec+VWBpYC
 RgnLelPY7E+8/iYxkSY+5JLDpsXNxwZh1PMvNsO8NUWlNMAX3yXkZ+vjOT1RqPDenlok
 1LjQ==
X-Gm-Message-State: AOAM533RF6PKrgyBFjX1KQ8h5Ptjcuw2LQkDzF8dXl737eaivSm0f/X6
 DrMQGrtVFnlcNB2KCdGNGc835IHxSZ6nNoXMADrQLQ==
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr1232037ejk.382.1605264297220; 
 Fri, 13 Nov 2020 02:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20201113101715.1438460-1-pbonzini@redhat.com>
 <CAFEAcA_rg8hZTH8pb6VJ8Wo7z52pqx0TOsXB-hOfmaHmHBLg0w@mail.gmail.com>
 <2e9c99af-7bf0-902c-f673-1ed233af9225@redhat.com>
In-Reply-To: <2e9c99af-7bf0-902c-f673-1ed233af9225@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 10:44:45 +0000
Message-ID: <CAFEAcA8StDxUgfCKNUR2FNjqOtBWB44G-UNNQQTTh5S+L=jdSw@mail.gmail.com>
Subject: Re: [PATCH v2] digic: remove bios_name
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: rH+exHfDemmd

On Fri, 13 Nov 2020 at 10:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 13/11/20 11:22, Peter Maydell wrote:
> >> Pull defaults to digic4_board_init so that a MachineState is available.
> >>
> >> Cc: Peter Maydell<peter.maydell@linaro.org>
> >> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> >> ---
> >>   hw/arm/digic_boards.c | 19 +++++++------------
> >>   1 file changed, 7 insertions(+), 12 deletions(-)
> > Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> >
> > Did you want me to take this via target-arm.next or are you
> > planning to include it in some other series/pull ?
>
> I have ~15 patches each for bios_name and ram_size and I was planning to
> send them all myself (most have already received acks/reviews from
> maintainers), but it's the same.

Yeah, I though you might. That's fine (less work for me!), just
making sure we were on the same page.

-- PMM
