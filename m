Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3179197lft;
        Mon, 4 Jul 2022 05:14:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ultLWbnALGxomGgBEb9AsncpfLROYUZkgQeh3ZFvDWzHlLMmm2aSRPu3Hb995M4jL2xvtP
X-Received: by 2002:a81:4eca:0:b0:31c:7a6a:f6d3 with SMTP id c193-20020a814eca000000b0031c7a6af6d3mr14983942ywb.82.1656936885615;
        Mon, 04 Jul 2022 05:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656936885; cv=none;
        d=google.com; s=arc-20160816;
        b=kHKFihHH64gtF+aGjQzfLZnzJmQE41aVMV1CPH+3zOtChpcddw1keBhnV5Bky9eU1y
         Ex3/Wp2ux1JCFsKU8Je3xY61/eJ2/ej3mjnbz6vlNrLXgzFCyUUlXPjhs+a80jj4YEil
         SoaGeyggiKpyIq2OsQ6kyS7B3kseN/Ti7vAu7FphmRgJrD8tXxAQV5pLk1S0nuAphl1V
         C2ZawHeFvAV9hcsQsGREquRo9aqQIU/1+GJtmARQBXblr7nvMfZklMCbIE+4mwcUz/m+
         YVhcqHEqUqv4xevROOUiwQiAOtYVj+6wRWqwRdoswtLZRBlcRGmbuXaXDmOqW76eg+Bp
         04Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Rp/juf6Qk342zuIX3XCF8Pnd2LF6056IHoKs8WvbCU4=;
        b=XPGeiV8p4k1rQhspPX5dppMPgh3CIoRs71/ZPTb3fWS/JEa7VEc8S/hRs1XogjOLE5
         Z3LXWayT4Ma9iYenrQwj62zAC3peVckaXyKk8ezM5t70m3j5LH0djmpxniWNrs/1nENa
         vugKdBfDF7vcTWW6ZLlHGkb3ZG7Y/fUcnuezTHbmMElbUtYdxohZvwhoBVxyYsbq7pGQ
         hZVSOWP5/K+8kbWESsy7A1G3Qtb5E4AfeGVUWK+4UhxIiJ4hgryty7FKUnZKPab81Usm
         wc/GAXTFIkmelhFCWjjw3G8cQ/hTnEhx2DNHIdwKueo1PtvxJ1uc95lf/80u2HOO3IXM
         E0+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MabpslxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a81150e000000b0031c88f93946si6875494ywv.428.2022.07.04.05.14.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 05:14:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MabpslxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8KyS-0000dY-VX
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 08:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Kv6-0004Zm-Rl
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 08:11:20 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:38567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Kv4-0007Fb-AW
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 08:11:16 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id l144so4039614ybl.5
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 05:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rp/juf6Qk342zuIX3XCF8Pnd2LF6056IHoKs8WvbCU4=;
 b=MabpslxAQeuAD+wcOhiA9g5HuFQtrO6wFP0hwTyNn7nf4p5JIaLnc3UO4oKc5cUT0a
 uuuJ4ItV07LkYAiSEE0wMQSOSxgVuTor8h0pWBhgR1X40/IVxSjKikT5xQzRo8wnUUnR
 RhiDsB5dRp6bhEUqPQVMn9jwXyBe2vflOoTgDR8i7+b4HR81V8On5TVfwSWIbQOLW5ry
 L8uyRtZQoZxC9AyGoDYhFHIU96DqPS62vIYMtX6RDtG6D26yPF7tZR2rqsRxcjP+odi8
 yLERzTIVOFAxneMXskq85LOFxPyr/6G/nzg58QzaZay9HdUknpDN12ifSq+BRqspTJ7s
 S8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rp/juf6Qk342zuIX3XCF8Pnd2LF6056IHoKs8WvbCU4=;
 b=f1ek6zk2F23AxLyuWMm5g1mll9uceNi7oJoBcLg/566wWra6Ihg+U1OIOX1AQLNlk8
 0DOIhogl7E9QV0Vz3DsXZP/M6x58YIwDx39L0uLPCn6PrLZ/385vR5pZKmyO6mMVP8B8
 CH4foISs+dCiWg0ozJlttLQdKVWva4TpHpo45XJEDTrON5sHtJ0Cf5sszcPHII8IQtes
 zKOptIiME/KHw0mHRog43WNnFeFCXfOxnLQ04Nh8RF4fjpSFnQgpakTHlbI5UejBuCIs
 QyY+K8An8DEc2aucfkSnDMRm12eHTUwJCnV6U4ujDFwZZoBGRtFMEPxAZlDsk0bCKJpf
 s8AQ==
X-Gm-Message-State: AJIora+9eH8ISqvseAG0An9f+edmWgDk59uoP5+RoVlSxVwN1k4T3rm8
 Wc6m3VwyY8Fxm7zimKfZ03NMGsUabGxYdUTvNlZZ1w==
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr5790733ybu.479.1656936672820; Mon, 04
 Jul 2022 05:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-39-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:11:01 +0100
Message-ID: <CAFEAcA_HLkU+=CvahdYM99CVXMapckgUnm7VQgsOy4pEw-aRHA@mail.gmail.com>
Subject: Re: [PATCH v4 38/45] linux-user/aarch64: Verify extra record lock
 succeeded
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
X-TUID: nAvcgxlIi9ce

On Tue, 28 Jun 2022 at 06:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/signal.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index 8fbe98d72f..9ff79da4be 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -340,6 +340,9 @@ static int target_restore_sigframe(CPUARMState *env,
>              __get_user(extra_size,
>                         &((struct target_extra_context *)ctx)->size);
>              extra = lock_user(VERIFY_READ, extra_datap, extra_size, 0);
> +            if (!extra) {
> +                return 1;
> +            }
>              break;
>
>          default:
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
