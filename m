Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp1089610lfh;
        Thu, 19 May 2022 05:12:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxty1rRwDwIG7dFJZnd5PK2ijCj14XhokZnlQXZtcjeHL8BHTq3P1LkdyEd/gqRn1kbq3+P
X-Received: by 2002:a05:622a:191:b0:2f3:f489:1bb4 with SMTP id s17-20020a05622a019100b002f3f4891bb4mr3454882qtw.425.1652962353268;
        Thu, 19 May 2022 05:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652962353; cv=none;
        d=google.com; s=arc-20160816;
        b=isB/foqyWCME8QPaqHOhkq6klXDhN1KtdQxSmVzIhklB5Qj9ncY0YQD9S9hT70y8Bf
         ZvmrT4PPfYZXc8CAF8dsrUTmfrEjCCtLZMEe77gKXbZjciOanyozGQcC94meXJoNfdx7
         l5IrWItwp9W8DONvCtLwkkTEloTSijn20O321XS4W8CxHA4eCsSprkcUMyPRBLp84os6
         YR7lSdB+ttI4ykNujE/3reZSKxRbTRvmE4xvDRWgWEfVbib6BKBPbUzflQENuiG9sDTl
         HfxrlsoAqrxzfjiB0ElK8v43qDC60aoSZPKZ0bNI0/S6WCMgOkgaDcaKON+rcMr//qif
         NNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5BetFvIc0HVsaHteoQ6Rjz1VwkaGhJjTCasD6WIXwSM=;
        b=Tb1A8jcgxdzaoDkir3RTsXukWCKqgme0dBLRvdr9bPOfukUa7OVOc2vLFssWMvPGPI
         85Si3XfBcQ+BCDa5RwerZOUD1paHysm8vsYBkblExSKkLbCbz69FaU3ITNNvRW3V66zF
         ixdgso3CEhRrWgE+lQNzMaYGqmCfhmvrEXuJbGtGcdVnlh3WdhtYEpz+N1b4xzeO8JLY
         jvxT6x+c9vPFSadORXi66dFwVOrYsCTx9w7F1GAzPEI14gMtsbM4RMduquBnmoFB05yF
         /v1LDWKQnXfvSzlWN0Is1ZpFI0gRSuC2bO5Y9r7hXuS4Kw+qXddTDecn/Dd25M5qjzCc
         04Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NqJk8MGL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj12-20020a05620a190c00b00680aeaaceddsi895914qkb.587.2022.05.19.05.12.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 May 2022 05:12:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NqJk8MGL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nrf16-0005fB-Pt
	for alex.bennee@linaro.org; Thu, 19 May 2022 08:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrf0k-0005cZ-4O
 for qemu-arm@nongnu.org; Thu, 19 May 2022 08:12:10 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:35366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrf0h-0001DS-8Y
 for qemu-arm@nongnu.org; Thu, 19 May 2022 08:12:09 -0400
Received: by mail-yb1-xb32.google.com with SMTP id f16so8691350ybk.2
 for <qemu-arm@nongnu.org>; Thu, 19 May 2022 05:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5BetFvIc0HVsaHteoQ6Rjz1VwkaGhJjTCasD6WIXwSM=;
 b=NqJk8MGLheXUYWFaT1tl8PNvo4A6IL2fe6eq4Irk4y6AYJsMB1MyYnrCkIluHqlrR7
 +yHg96uaFZ1VdqYYm2fhNiY1ii9xLQWDczFM8l4r9KbFumtgALManvc9wi7zja0fLiKY
 cdd3zNzcIhJHV2sVBGaG6jtuFRnaRy0DbhYzzFmwtJLXVsxLxvYtoZDF6QIGMJ2LBaz6
 BhV8sZLsU0vHns4k5QE7Lp68ArU/gdP2oQ2Kn6YtKynsY5xor9v4LKCAEgrY+Pnv7cgm
 XhqNx397dFdJ+d+xGGQe23K0l28ues2T48Ah9MmknC8ObNa7E8buDd47Pzy0aGce6KJZ
 4PTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5BetFvIc0HVsaHteoQ6Rjz1VwkaGhJjTCasD6WIXwSM=;
 b=W6QLX93vcwDUUhl2pu3REtyNieYNE0fNAZlZ5RWZxTLRYId6fBHXJNfPmsljBCEkos
 huRqGFZ+8v3qkC3ec3UcmqWI5IDEt1NytYi9blWQMUJ2KTGhPwRHA9pbrrG+FdIbtOmW
 3lNNb3v1K7GKdlAg43aYsZEo7MZ63P9fq4La2ADxAtjKdWZLK31jTU27mRBmdDvUFHKO
 JVXj5iYpKqAC/bLzu052V/EN2VbR4g/edzBti+SddydF0bJA1irEnkIXS8ZsJPX/rw3k
 B+NLao6bEFUxAzpV7+yfKHmyb9kxNEYJsl6rBPSGEuMxzPwq2/tpumutwki8WP+nCWe7
 dF7Q==
X-Gm-Message-State: AOAM531ctiyb1OjFniLn2yoCkp4MOxTcohJZMx338wY0AaJItutPuBAL
 B7mRQpKWKqSS7xbo+klYaHlBeBKti5TzD1E0Bu7OwQ==
X-Received: by 2002:a25:257:0:b0:64e:b1fd:2d54 with SMTP id
 84-20020a250257000000b0064eb1fd2d54mr3924116ybc.193.1652962326415; Thu, 19
 May 2022 05:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220517054850.177016-1-richard.henderson@linaro.org>
In-Reply-To: <20220517054850.177016-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 13:11:55 +0100
Message-ID: <CAFEAcA-8NFhgZEYdbT7wFSOPdMhNhO4jSYYa+Ff-+1Jm-bLvWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] target/arm: SME prep patches
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: dHw7PF3Yb+Qq

On Tue, 17 May 2022 at 06:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v2:
>   * Fixed the errors PMM noticed in patch 2.
>   * Cleanups for SVE vector length selection.
>   * Cleanups for SVE exception el selection.
>   * Add el_is_in_host -- I'm not sure this one will really help,
>     but it's certainly appearing more and more in the pseudocode.
>
>

I've applied the first 2 patches to target-arm.next.

thanks
-- PMM
