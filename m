Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1880662ejb;
        Thu, 20 Jun 2024 03:43:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzY7K214p+CbyS4uLdq+Qhf/liS05RBLmEsiZVq0FYoWRohQozLs1YIAOCJvPnsoRvTlY7Qg9EvW9jwXGdGllO20KblgAL
X-Google-Smtp-Source: AGHT+IFy0zJemBpgmqGaNh8fAlhe+7/1GkdCuON62G9MHulycclv8oYn18EhUONZbDz6XByMmyp3
X-Received: by 2002:a05:620a:19aa:b0:795:58aa:1b57 with SMTP id af79cd13be357-79bb3ecd304mr570825585a.60.1718880230819;
        Thu, 20 Jun 2024 03:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718880230; cv=none;
        d=google.com; s=arc-20160816;
        b=E92dBAzFVqtR6jERIqRHHuhS2Xy5qwqRMpNySQUCRYBdm5sr1Q9R2MsFOfMb9xrt68
         N5meoQW25XVgb8EUMcI3VClPRQaM1ValPoDkQVJYfYozQHrHgPMfGaIN+9WSotdLxah2
         DNb3NWHu3caYRf9LfP9HlJVB9q7rJ1bjd0OWO84Afw609i/bWKwYCrnBQ7iwDqjIgiNC
         iewfozp7VXsRIxrqa8v3DeQ5QBA129QjvUeKLteDnEjUxBfDTrNz4q9IXVFE3Q+upcTY
         S79rkqC/qO8Ylfi0PzZ/xUhd/nE7fuL/TMSmAmFyy6OUvS2IgPd3VIFP+Ly4st8vN7sb
         BMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VCHaOBI/pzcWFl4PSGNo6VIcNzZ9wgQjXBKizEWy4ek=;
        fh=r2uVO2rIcZn1DYXTHF+/O1RtzPIDQNyPqE8LYJBZYR4=;
        b=NA6oBfJs0wumf0jmdwcYdQrblirTdyjed8bMSLuvgjukYc0xWzR93E1trDC2DrMVOn
         OL7hHHPQoUBIVaKXHf3dviUdh6UmTW3mAf7PimuHZIruTEUT3DGCM7qbly1M9n437XjD
         29hS6FIParDlSV60cGWY/JiTCPwjQpU3ZGKnO4bmxUMvSD1mj1iXa4fjjhoiC0Hbp9Oe
         gSlBjMwUP5Jsqin50lnbvAh9K+KIsIq3OwiTrPefN3ROngVQBNmRGzXhnV9FLHydLQq+
         2ZYv85niWv2Xyr+MFWNQoSpklH0oh5KT/qOlScpZkSHtiNo7VtF51AEjJAzq0mzJFOx6
         pW0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PodmgwQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798abe57d43si1780502485a.591.2024.06.20.03.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 03:43:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PodmgwQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKFGa-000501-TC; Thu, 20 Jun 2024 06:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKFGR-0004rv-5C
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 06:43:37 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKFGM-0005is-LG
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 06:43:33 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57d07673185so617746a12.1
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718880209; x=1719485009; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VCHaOBI/pzcWFl4PSGNo6VIcNzZ9wgQjXBKizEWy4ek=;
 b=PodmgwQ++L+Idn51/gD95KMVDkesV9O82RrJaDs0NIK2ciYOiWkgqHs2f8cD1L/qJz
 84cV9QeYnLlkxR2tt3fsoC6rifytvUxR/2Gj6uHyZD9dE/TNfFA34rgLXKadbyW5swkg
 s/vs64ied4zTt/x172/EwVhHLEf66cjFhjfaivUwv07zAcQ8bahqKLrwqJ/lxKZtKUVA
 sVv/3sQAQ14gQmOacOQcprer7CKjiFYOC5TrcVE1sIb8pFtXKc0Q+5caHRpvaq/+MDsk
 5Y5h4rIMN5yrMe0r7aLbH/pwQ7ck0QmH9rgpEqCyeAzejpg2zV7B3K7UvPAsrff9I+7n
 EFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718880209; x=1719485009;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VCHaOBI/pzcWFl4PSGNo6VIcNzZ9wgQjXBKizEWy4ek=;
 b=WmV9BxgzPTuai11REBq21qGtG+1pyOwplpuw4uOWg+dXkSvs/keELpP/1JhwQ67EeV
 rZrUipw4G/QxO9V7KrZHFGI7Se+AmLbJC03ccfV2gXkweoKQVaACc4XDnQoILlDiaMP1
 jUBt2IWCFvpHsk6qntthDdmpCFWzTk24X1DeZXao5Bt8npfytwwUGASxfuLEJGl6a7Dc
 39C8Ewm+JQUBLTzwNYYjqVdxkJ7qw4p9M4Ygb00xqtW1+ErcMOr8IxQQy9cfSSp/AMmg
 VlIC624t5fysFXEi2T9P7frDRdwf90jxd7bfBR7WBczhlclQG/wtL9G8ex5Z+2KiZALg
 IIJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+4s3B1Tb7/cS6z3DZWc7gCmasKh4CUD838il4wJD+ryk/d9b1CuCYI/tudpQpmmUtxKYNAKJBUcUZvM7xisbvfOiP
X-Gm-Message-State: AOJu0YylkwuNgmDi7jQ0GnUtFwoK+cMKgXGvxRx33g4u46MWxkmDDLZt
 icyb6tGY3LCb8Df4JrC4Jeu77Iua1SKja8FUsVzw4Ji60d4Ac3qNUY78w+96FHSPSOJB5TJSKnV
 VdRUvMJK7lYKn7Mf+thFV8bHkiBUT6P52LllkZX2lGJqrs3ou
X-Received: by 2002:a50:9b15:0:b0:57c:6861:d735 with SMTP id
 4fb4d7f45d1cf-57d07e6b560mr3081170a12.19.1718880208839; Thu, 20 Jun 2024
 03:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240615185423.49474-1-florian.lugou@provenrun.com>
In-Reply-To: <20240615185423.49474-1-florian.lugou@provenrun.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jun 2024 11:43:17 +0100
Message-ID: <CAFEAcA_+WrzM4fXQMUxMi3L5yiUWMrUGTSZH=NDdYDKUCP+8NQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm/helper: Fix timer interrupt masking when
 HCR_EL2.E2H == 0
To: Florian Lugou <florian.lugou@provenrun.com>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ncBlUEyAaAIK

On Sat, 15 Jun 2024 at 19:56, Florian Lugou <florian.lugou@provenrun.com> wrote:
>
> CNTHCTL_EL2 based masking of timer interrupts was introduced in
> f6fc36deef6abcee406211f3e2f11ff894b87fa4. This masking was however
> effective no matter whether EL2 was enabled in the current security
> state or not, contrary to arm specification.
>
> Signed-off-by: Florian Lugou <florian.lugou@provenrun.com>
> ---
>  target/arm/helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ce31957235..60e2344c68 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2684,7 +2684,8 @@ static void gt_update_irq(ARMCPU *cpu, int timeridx)
>       * If bit CNTHCTL_EL2.CNT[VP]MASK is set, it overrides IMASK.
>       * It is RES0 in Secure and NonSecure state.
>       */
> -    if ((ss == ARMSS_Root || ss == ARMSS_Realm) &&
> +    if ((arm_hcr_el2_eff(env) & HCR_E2H) &&
> +        (ss == ARMSS_Root || ss == ARMSS_Realm) &&

When the architecture says "is EL2 enabled in the current security state"
it doesn't mean "is HCR_EL2.E2H set?", it means "is this either NonSecure/Realm
or else is SCR_EL2.EEL2 set?". Compare the pseudocode EL2Enabled()
and QEMU's arm_is_el2_enabled() and arm_is_el2_enabled_secstate() functions.
This doesn't mean much in Root state, and for Realm state EL2 is always
enabled (assuming it is implemented).

For this timer check, we're doing I think the same thing as the
pseudocode AArch64.CheckTimerConditions(), which does:

  if (IsFeatureImplemented(FEAT_RME) && ss IN {SS_Root, SS_Realm} &&
      CNTHCTL_EL2.CNTPMASK == '1') then
     imask = '1';

so I'm inclined to say that our current implementation in QEMU is correct.

>          ((timeridx == GTIMER_VIRT && (cnthctl & R_CNTHCTL_CNTVMASK_MASK)) ||
>           (timeridx == GTIMER_PHYS && (cnthctl & R_CNTHCTL_CNTPMASK_MASK)))) {
>          irqstate = 0;
> --

thanks
-- PMM
