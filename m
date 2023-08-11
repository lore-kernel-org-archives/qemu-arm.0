Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1262070ejc;
        Fri, 11 Aug 2023 03:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtpH1oUy/WOanN8QNPgj5+UlBGk4LlLeAcnwF1hKaiyH1gJC7nbN1tzTAdRHYQIBVXdhGu
X-Received: by 2002:a05:622a:512:b0:403:fcd9:963 with SMTP id l18-20020a05622a051200b00403fcd90963mr1572305qtx.67.1691749301390;
        Fri, 11 Aug 2023 03:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691749301; cv=none;
        d=google.com; s=arc-20160816;
        b=tFnjemR+399LWwe4mibgxNFgz/yNrPv82IFKaL/LxtSbAij/nJReyYPk3OYOsOpQZC
         nt2ahilvw+QHxWZxlpx+Kua7tpmkaMVCfNfdV5F3vPv6Wwi7ZLHTaPd83Jiz+niB6V9z
         WIBAbkuW40mbYq1pv9jb8c7/K84rXHAei1o+hmS7BwQyYPPi/6F3SPSxji3y+IqzSLW/
         mMLcAqKjM4qxh3EZWE4Ep1fV7QvnMtCznu2X27zwGgnuBT0yJ00HyDB46SjAp9FBkuYw
         lHB34pLitGendqrdoFtQnTQQhDEsw61l8DojO3WAx5ym9AhWQn1S281KOi6RZRse7WVc
         CKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kfa6Cp5pGiETfvgsnGoQNS/xb3PG/PDcyFVWv6254Yo=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=rpPOwsBRAz6TUP6+s5mBMcSSziq95NehiG9P27AT9rr+OWm4o44C/FMcCszcyEmUaC
         eNAfduwyoMGQaB/Xwewl0LgsBcdhnfW+dpCg4cn96qgkcSA+cMH3qByfQ1rlbxcxs+1n
         6J8avEqHBq1I9vnho6lcwHmjK+PaNiSfxhNPl8N1Z5FqE4IOzQYjlDX8abS/XTkbVsoT
         MI2jg0bhc5ucXXIhta3PsRuegsoIIYdgVPTBUOxaucAcISow21cuiFcdKCAgUq3oI9Vo
         IluE5JC1SQTu/5YbS4Ru8yAkkrtcIZU4CHIgUmUVw+V+nK4fi3HsGaVQ37+sp09/LYFe
         XvtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TIlKcz0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a05622a138a00b004055a9783c2si2074130qtk.495.2023.08.11.03.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 03:21:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TIlKcz0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUPGZ-0008AO-QM; Fri, 11 Aug 2023 06:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPGY-0008A6-N2
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 06:21:10 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPGV-0006Fy-Qu
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 06:21:10 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fe27849e6aso2869191e87.1
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691749266; x=1692354066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kfa6Cp5pGiETfvgsnGoQNS/xb3PG/PDcyFVWv6254Yo=;
 b=TIlKcz0ZByFCBfjBBWiB+7/VamA5NeN0wepDAujm2R/0uwPPti25g1aCa2qPuGNlD2
 vkoqa5vRUWDp58vvTd5DZ0t66xZXLppe3O+RCZOPHR1DdEU/YRHZetIWT7xvZVekGO9B
 JaUuBeVi8GZk/DKzH29TteAqo8bLbybXw9DTDmmedwcZLxd3im7eXyvhJNFCO7UBNvse
 qqv34s+oW/idlXHbhKNpymqGpyzzV5/HjaVdqB7BVMrgcDhsF1W0Iy/ns1oKn7IhRTa2
 tnCnIovRaaGvwH9UH2DF+wnAkV8L7OUaavqj0LO/E8RGcty2QRA2LwLJxyCj2EV4mbDg
 ghjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691749266; x=1692354066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kfa6Cp5pGiETfvgsnGoQNS/xb3PG/PDcyFVWv6254Yo=;
 b=UgxsvgW3omSoMaV5f9/gmyQH9f0yW6M88+8oOoMYEPL3QZkQ51O675o80u92i1SttW
 xPRYcn9kcrBSoIfCDMLjFA9mbeMwbrYJ5SRvJxddeKjrLXogSSERxvzBeAdha3xLm4KB
 GkTdw0e2FJOAIRb9XtlFs8whp4902JJ+e60wasLGJpqFjeEyjCBLyfzBAId/y/L5OyGi
 viXm927P7HVW8Z1buMykyTZZqISYyjbvOBrdcVENY9BaJPEZXHj9BmRM3yhRtbpL3mMq
 c4N2BqrSa6hDve1Lbm7YM4iMMuakAodRb9EASR9G10a/dRB+u/Y+YWMgsFBA1nWWhtNV
 qVWA==
X-Gm-Message-State: AOJu0YypINCr3mPEIMJNt74SBxyT/KugEsxnPHrNttICN2jYmqaq0qOf
 kPqscxDBNOaahCFB5R4b/uN8YWl2El2JehFuRvpGZQ==
X-Received: by 2002:a05:6512:3985:b0:4fd:f77d:5051 with SMTP id
 j5-20020a056512398500b004fdf77d5051mr1234827lfu.26.1691749265732; Fri, 11 Aug
 2023 03:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-18-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 11:20:54 +0100
Message-ID: <CAFEAcA-h6_YU9mZ1UOWPq9KnqKQ-_jkJMKhpk98MzHqsyq3cyA@mail.gmail.com>
Subject: Re: [PATCH 17/24] tcg/i386: Merge tcg_out_brcond{32,64}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: xqx0kkh1KR/v

On Tue, 8 Aug 2023 at 04:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass a rexw parameter instead of duplicating the functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.c.inc | 110 +++++++++++++++++---------------------
>  1 file changed, 49 insertions(+), 61 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
