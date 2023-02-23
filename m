Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp868265ejc;
        Thu, 23 Feb 2023 08:11:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8SnZKdDKy7+tLM5TlF9bJLdOiKwTK/kSVGdXj7r7aImGRumwxWy4oJol4dSuLSpAaBUFbh
X-Received: by 2002:a05:6000:1182:b0:2c5:4c92:1ace with SMTP id g2-20020a056000118200b002c54c921acemr12420690wrx.58.1677168696576;
        Thu, 23 Feb 2023 08:11:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677168696; cv=none;
        d=google.com; s=arc-20160816;
        b=zSMmlC0YEdqsad9q+sbEJTvz4mdXRH8onfVrHW7a0f5fJBhHwWCA7LrDwoV7vH+l5k
         yMZqBD2K8qYoy9HfaA9f/PKX5U3O39+7RvjCIoVu9RDZRz3HhGxS5DM9elojnA3lboJe
         djDxOj8CiSESiVzrX4SLqcvXmSWYbvI8hpdZgoTg3+7wyc3OEMD0RAYUafkMdIgN6MB4
         LIDFqJVPRe04RLrlYekZY4hBqJotqxh+gWNcTGcciMIv+al6VTDYgx0KUZbG0n2cFWIk
         l2Fu+/Uowzr8xQHykmbWhbDYcrWPtn7Q7WDdUm/6ls1IzO5WjW0k8rC2WnMf8ZoDb6D8
         MF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=azSLsfVfdpT+Jqtw1PJLsdYyVCFwMN5mJcqBgw1Wuho=;
        b=PTgYHNYCvH0sGqJ+TjMYLJul9l4HOHuw7VTcn8Su6MsfQW/CbQmluNFM6DbNL77xf8
         +S6jlfrwSmKwde2ka89yTiZKbbgjmDXkWAgoqhfvlcObAwii5Rdl11G16fcDTzrhpYPg
         H3gkCNDTYv7ydt2Ekr1XQgjG9ZdDuj1XqPnhs7pBdCxYOkrZC4rChjgCQWNipYJativT
         Swa12r1mHZN4mO65FL5KxZoqfZxweF5o1XafWwPxdEKjfUSrv4+jYhdRgt86H2S8/M7Y
         nzpfOz+uWvaKBnEK2o+uff5Q4xK+IIKtZ/DF8TopNk01+rJt7js0naB9+HUYp0fxzIXU
         D63g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dkyidW4o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14-20020adffa8e000000b002c115b89ed0si7098975wrr.316.2023.02.23.08.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:11:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dkyidW4o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVEBL-0002A6-Hb; Thu, 23 Feb 2023 11:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEBK-00029l-0N
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:10:54 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEBI-0007yQ-Em
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:10:53 -0500
Received: by mail-pf1-x432.google.com with SMTP id g12so6188640pfi.0
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=azSLsfVfdpT+Jqtw1PJLsdYyVCFwMN5mJcqBgw1Wuho=;
 b=dkyidW4oMnJINyh0UZKatu3lcDKsLqnBszbwB70q8hI9+v94n2cR7cGoA9BN5Hi1+2
 wdkTPbOLmiI1f97stN9domG3Hu9/JMvlE+/+c6PevcQVpnDU2j7iRsS9P8ygZYDwCDKl
 lDTJ5FHuluHcD/fddK9bdTiaXw1BIGEl1Mz1xkfOrfrsLtprucgPiXyhaRvnubBGseyq
 drQ8fGmXBYG5IRZX8F0Tge9uI9ZYS926gQd9D+9Gc+7y+nFmNESHv49z5FVVIyeQOhit
 FEbR9/UMHQPlDbaXRFqSun9Dj1zg+Bm9jJRi4W4aOWhKPi7amyJaVharEwVBW1fD4uBM
 VEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=azSLsfVfdpT+Jqtw1PJLsdYyVCFwMN5mJcqBgw1Wuho=;
 b=Z+fOl9UBOGvhuda0FvSE2RvNUFcnJl4MwzlsidCUi2ODO1Ef14s2INDPwcXupufyx3
 ZGlvZaY47bPkNP7EQuXBtPr2ScPl34Nvm0CPPT6h32syzJom683VL9aP67CjlytsDP9/
 2Cow1O5EQqcbOymZtNUjJUmHS6VJ1vP/akOCHkkZr6hK3yyUYV5ZzXPnljqGseXsWejA
 y2l6zKZWpDXu9OrLkjxSjmhYTsRUJlpZZWAWEWhqcC06v0jUF/FiQ+8T8P36ijAIJJ70
 4m4/rGtTI/EspV9QpoxLg9w4DKCUlZUn3qZ7OOfSN18Iaan7AYlPGnGbyOXmoE+s4bcR
 6G8w==
X-Gm-Message-State: AO0yUKULW3WNBc4KmxKUtJafCubdUoQO6gUpfNDrzKI7FrpXgGxyjrkm
 6I13dJlFKV5Z8NkUDMjJUqzns9ySDShB3IodolcG4A==
X-Received: by 2002:a63:7985:0:b0:502:f5c8:f5c8 with SMTP id
 u127-20020a637985000000b00502f5c8f5c8mr443763pgc.9.1677168650653; Thu, 23 Feb
 2023 08:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-14-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:10:39 +0000
Message-ID: <CAFEAcA_imbURUjmtHsKsRy5WarwLv4pBq_PSLgOdfFQ8E8dE2w@mail.gmail.com>
Subject: Re: [PATCH v1 13/19] target/arm: Pass single_memop to gen_mte_checkN
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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
X-TUID: QMujMkpiFcoC

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass the individual memop to gen_mte_checkN.
> For the moment, do nothing with it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.h |  2 +-
>  target/arm/translate-a64.c | 26 +++++++++++++++-----------
>  target/arm/translate-sve.c |  4 ++--
>  3 files changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
> index 3fc39763d0..b7518f9d34 100644
> --- a/target/arm/translate-a64.h
> +++ b/target/arm/translate-a64.h
> @@ -54,7 +54,7 @@ TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
>  TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
>                          bool tag_checked, MemOp memop);
>  TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
> -                        bool tag_checked, int size);
> +                        bool tag_checked, int size, MemOp memop);
>
>  /* We should have at some point before trying to access an FP register
>   * done the necessary access check, so assert that
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index e02bdd3e7c..1117a1cc41 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -288,7 +288,7 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
>   * For MTE, check multiple logical sequential accesses.
>   */
>  TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
> -                        bool tag_checked, int size)
> +                        bool tag_checked, int total_size, MemOp single_mop)

Argument name in function definition should match the one in the
prototype.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
