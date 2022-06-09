Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp570585lfb;
        Thu, 9 Jun 2022 09:57:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzr108oo9WhdHUPvqbnJRcn10skw0ouD3CpAZ9cHcxTs+R1hNEeZSIvULg3qQ2Vf+WuXd96
X-Received: by 2002:ac8:7f16:0:b0:300:c862:5c79 with SMTP id f22-20020ac87f16000000b00300c8625c79mr32265191qtk.523.1654793833740;
        Thu, 09 Jun 2022 09:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654793833; cv=none;
        d=google.com; s=arc-20160816;
        b=U0MFx0mCIL8ZqtDUX5acj9FT4ujlwUOY94cjRa7eV+y13CKxGLu2Rtsct760bLGX0/
         T5/wa/W1QpLWc9V5y2GkH/HVWlEmcEsT0UWZhWIkmT+TIcMdGv8voPV/YInh6bjyXzQb
         IjrF3lgJ87E8Qyj+q9Qkngvauz3+5tPdW9BSi9eewQQ3Mj+6rxgS+1YFUiAk/i0oVmmf
         mM2aG35+9bqUqpObY8N6IGoG6VxtRKI1m/pT4kIp3uR045q19OVYvd2WwN4arVwin4Ib
         iYXcrquiYjDN2ue3p/47I3g1QPRZ3baALYUIj5Rfwfy51Zu0yl/ifCKXqbBnDGB6aPGe
         dhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MRdONRNPBquLQoLccmkJ9L0j/gtfkT4nRWrdIHaWtC4=;
        b=fGYwyCd3/SNpsUhV12EJzcRkt5wlIJpPPXb1slsz9cB/jRxKYO7va/firokR4xNUAf
         a+MuTMriDqn+2zjFU1gHny7q5B2WZKET4BBAZ9wWV7CEjKqpfCj9oopmGjg4CQx5apU/
         mfzUf2UEx6/1MpOnBdF487fsR9zIcdSL2lmeB2yV0Uv2q6gMbvB8Hv8FxqORF1oJlZtS
         cZhov2rnn7raPZEzcEeL+ZjF29NTcyPUuklUDIIinxQR1YvtscCs9K5ht2D5bUmBkg/v
         a2rr9tD/obm1ZFcfjwBrCagY75/XvLEt2yXpZztktXAWJ/Jd9VoQeAkRrk/EbGiLPeWE
         0rpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t0P9cFlR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az12-20020a05620a170c00b006a6d3638148si5670490qkb.137.2022.06.09.09.57.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 09:57:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t0P9cFlR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzLT6-0000pZ-2d
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 12:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLBQ-0003VC-7h
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:38:56 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLBO-0004rx-R6
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:38:55 -0400
Received: by mail-yb1-xb35.google.com with SMTP id k2so3325563ybj.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MRdONRNPBquLQoLccmkJ9L0j/gtfkT4nRWrdIHaWtC4=;
 b=t0P9cFlRe5yBcp6smE8xpUqiE/jYlPeCBoyATdNyd7Vw6DSmTjIFxWAaSn3UXIYFyQ
 il/9AdKyhoSx4fnZ+AhgIeRroilVid2Gwhvbr1FQpi8RYVZV+Uk92EjNAm0EacRkeWZ8
 49G6Uqxg5mf+pAJxSXlei+fmFxovASV777szKKrQkjQI1hzuTAtQESKIRtZq79CNf4qO
 Ak7+V56dyyrhAe1IoNnk2rC60UAsKZBO789Wrqy1F1SypR8grthHC9dAI6Ms06Kd74XN
 taqf7cR0Luq0CBSz1J2SYIJT/GLmFdTl6Xohw3Vgz6d44PBxkpFvz90BBbg5ujw2xx/p
 nkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRdONRNPBquLQoLccmkJ9L0j/gtfkT4nRWrdIHaWtC4=;
 b=2OhbvJty/V5OApx/ZmEAWK8bW0ZNotSNaGGwYwVol6CFUmnQhQpXxmMWvbqkbjNf03
 RMOKMZAOoutsUNYC+09qFMXdaRAASk3YgouCvfg5x5LIjlW8g0y5krPZhxdquvcp3+yv
 toVAcGjyOERq15S3J4xiW8XxPKtX3pg1KsDHDEUcBXGq0KwqGAiLaR2n2qjClnc5hNq9
 aO0OszvIJcMYu3wu3mHMRzQzms9XaXYfjZiMzsiWQ+3/5a0uqWvIF+4WpMkHSVXVrFnc
 WfG7zAughnBcOAoQwc+87c1CrruW0z6FUqHq7SV+1mUhC9gj0PJ1NWj7Gg8b3lRNtaZz
 nOQA==
X-Gm-Message-State: AOAM533JHEUQB18ls+m3HMEOwRDRXVeRBk9d+mV6apOMYtnuKu4cLdWv
 oGUVYtP5Wxc5G3q7IhadILcj7b14SedSUf4E0XsMPw==
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr40683979yba.39.1654792731837; Thu, 09
 Jun 2022 09:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-20-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:38:41 +0100
Message-ID: <CAFEAcA8tzjdH-wOyYLbw-3wf4Bf=DuskD_Nc0ANO4VmjwvhfSA@mail.gmail.com>
Subject: Re: [PATCH v2 19/25] target/arm: Introduce gen_exception_el_v
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dUADzasZo41Z

On Tue, 7 Jun 2022 at 04:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out a common helper function for gen_exception_el
> and gen_exception_insn_el_v.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
