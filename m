Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1230220lft;
        Fri, 1 Jul 2022 06:11:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQd2WQQui8g27+RK/cDeR8XVnjklHztTeApiLZ0sTQE4ZGqYABiZQ10qE5sXhvXWaedhf6
X-Received: by 2002:ac8:7d81:0:b0:31d:31a8:a922 with SMTP id c1-20020ac87d81000000b0031d31a8a922mr7034062qtd.392.1656681069345;
        Fri, 01 Jul 2022 06:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656681069; cv=none;
        d=google.com; s=arc-20160816;
        b=pzqii/gnH97rsC/DLMlmgEgKeRNPydpMHTETFDE1Y7faTFZ0EclekFbVmlqyqJRTDT
         u2nzlSYeEHBDV+HNdT5jGQmHw3mH43SjInrfURDo44Lz7XD3H2TOZu8Omkdkr9DqE13W
         v8v3RvrJtA9BbbMIvCo6I6+Ji1TW/S9jlGym3Yy8amfSzJNyo5yny9/GWL5khRwWO5Vk
         iQ10WOFZai0K9USVMpHOQQuXkHxxzL54xJg/UNF8m57IgfT9oA3cde58VhbeE5mNmqGW
         cIK+RWfi44nG9wRBqxbYlh/LSy270NbLRKLQtY0U+RTnGeVEknsCgtEWbdjFRdFYUjuC
         /OYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=t97n0lowSdRzsZn+ij8zuykceC8ztt3y1D1DUgYzz58=;
        b=R3HmBBFixm/6y91ergtGh7E36sG/skHkT0Nvei1RKglh4XiJg+6rjUxedpkGkJBJFv
         aCYCcneebsMKUQpI1g9O+IFyULSK4nDimxhkcVjaLqC7WOkOdvB7M2UoMEQ+vzhyztHZ
         8AAYGeNC2GgZ7jFzhKoIhDGUWC37XORZpNV59+QYpC0EcFjugS6tSPxcyJOpb3VUQ9MJ
         BszofXJwxMb8S2ZSf0dqOm1FkuNdjXTIWBkgY3CFyhsIotqLUyqwpgDfpXEvnG2wCxzX
         Ixz7Jd4q1N6BMVHmOIILIX6HVyazbbirT7btkM5vSDjpkT+TQXXD43gBt/aElrq/NOH7
         h/FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jWrzGJz7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020a67b64d000000b0035427c5f3a2si5586115vsm.695.2022.07.01.06.11.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 06:11:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jWrzGJz7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7GQO-0000KN-Li
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 09:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GLi-0002K4-CE
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:06:18 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:38804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GLg-0006V5-UD
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:06:18 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id d5so3967869yba.5
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t97n0lowSdRzsZn+ij8zuykceC8ztt3y1D1DUgYzz58=;
 b=jWrzGJz7fMIISqXyf2HmIfI5mT3uZRnYCMcReTRwlraWGKETzvWjtzp0XjGhDc2s2s
 5bOypCKsKC2jKsWtgj5INcKMkS2Hxg/Doe1O3HuInkJ3Je43V8xMGaPB8Vq9JD9Cmrlc
 u4OD0+NfxwLXph2V7imEnkgnaH+jOnYCEj7vikDjmvckA5j/erdwPUvIlbkgW4rTrIUD
 tFPREl6zLSTQH0yzun+oBFg1cfoWvegNj1hEf2/2KK32YWSToyHBromKxEYZa1WK+SVq
 Ot8I+vE6iTZfdw5cQyNIrNYfjJLwV9AwaGHKAsbg4RXXRHeYi8BehcRKHEGDYRY7aH72
 lFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t97n0lowSdRzsZn+ij8zuykceC8ztt3y1D1DUgYzz58=;
 b=X92VAj6XX5xbPgkx8OyqBlO8LsjXODY/C/NrUp4sfkSBPMerjfR0SIqwwAaMSQv4mb
 hPLKvzb8QyjR6zDg1wyjbtMct1hli+ZFZZWVudz4kQBdpDZ4rbk20BLQuqa1hYpLadL8
 llSI7p0j2HzPuwfp9BjDP7TlYQUSOTAawLAwz1gc+s+EOssKljSo/dnsszVoeUiMG/fT
 KssCJ4nAAwM4S3TV1V9wI14WyNuEQ3bQk+jLdAPRGhjVqqs5vPuMTXenqFRuC7KNN56N
 iKXtIqBWgbDgtoRRj6k1K1/lnekRModwTBGvZaGPUeYkHxGAJK9JCjMXtg283gi1VBJE
 p7Ng==
X-Gm-Message-State: AJIora+V/+i/aa3kPT3rJsQBFX6KeeoLkDgoa+ZWnG2g7cA8UG/z3rCJ
 oaeQFRgVP3/EvoTlcocOxzMkqlJV3lnkowVZCQdomnMGtv0=
X-Received: by 2002:a25:d655:0:b0:66c:84b7:df40 with SMTP id
 n82-20020a25d655000000b0066c84b7df40mr16846732ybg.193.1656680775580; Fri, 01
 Jul 2022 06:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-16-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 14:05:37 +0100
Message-ID: <CAFEAcA8d3hJVoiU9VS8_DtG5THpJxH4SQ=-DyjEqgvTnCTVHpQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/45] target/arm: Add SME enablement checks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
X-TUID: ByE2i6yjM0oI

On Tue, 28 Jun 2022 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions will be used to verify that the cpu
> is in the correct state for a given instruction.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
