Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2613538ejb;
        Wed, 24 May 2023 08:00:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6X2Oa17Y7ZoQ1VmkyoKxrgNu7miije3/Si+QnEcPwxtiWdJjFlBp8zA2CRfsOtQgvOWNba
X-Received: by 2002:a05:6214:494:b0:625:af4b:4162 with SMTP id pt20-20020a056214049400b00625af4b4162mr1757305qvb.14.1684940420602;
        Wed, 24 May 2023 08:00:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684940420; cv=none;
        d=google.com; s=arc-20160816;
        b=eWp1nbpmkc45+kgnD476SaBNVUnUJKKXrWHqmn9O0l+mDCO1GozdGwixd+qvYJHuEd
         bOpiF2noEyYzjBKokHPZ74cUkOmrnISpb2Y731I0NTt/pXx3/jOiZ9XDe85II9I8h4fe
         5hPRR94Xv8y7yi/ysQiA+Pp6kIrJAnwrCVSk3+8p6qpO71cDqxuh6VAuIblJ59IP2ZAb
         nieirfNM/7zdNfNX0zhKqc0LsTCPg+TkC8m8LrXpxsPQCLIdVYBYTomFSS5G0X1QBAOj
         9Iqbhan0foe9+ZsJOF0Qwd5Y3EaZViuLWhKZ+zJZCvA6mT+RGWOiwFChyewuDp9gwkD6
         0oXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Ns25hFQv0m873dAstZ8K9TCtQcMZTz3TE3rahAkHoFI=;
        b=W7prP6fq6ZTdI3WQ2X5MkivuUwZ6MMghMkPKcr1ZsZFARrgKO6r5vve/4fIf6Jj50y
         Kb9znq/88bZgX+2WAY26fEfNYMVVgtoJOq5p9tqEqCA/g+bpIob+/f7ui05amTvkBp90
         azoOrm6S76oIOgdhy0NWemcaVGKU1IgjqSXYMZVEK0dEvgVD4NHG9ZPDCnweodIQmPIa
         gLzjvQMOboVrRt+lqjtvSFBeahThHZE96w2v+8UOOcH3TNuTE+JhJWQH3OAecPAMkhtH
         Sf5EI6eHqbAqBlRLFq3IBnVAlSLUWoLYdh9wawAg59rpsdkkWcID+J0HB6rrg4dfgcIj
         ldhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zuGGy9x5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if5-20020a0562141c4500b006238e19f724si6850061qvb.154.2023.05.24.08.00.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 08:00:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zuGGy9x5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1pxz-0006dy-H0; Wed, 24 May 2023 10:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1pxy-0006b8-Le
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:59:54 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1pxx-0006Ux-5B
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:59:54 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-64d2b42a8f9so805702b3a.3
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 07:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684940392; x=1687532392;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ns25hFQv0m873dAstZ8K9TCtQcMZTz3TE3rahAkHoFI=;
 b=zuGGy9x5feHbH4Tcnwi+w3xowMLN2GN7LZkR4iGf/8/EUK//kP4Kn7rq1zmd4E4X4X
 vgFRuKL13G6AhQ/hC3AaroO9+5hPQUjIRp5FVJDrYqk5gwUfvKRUR21Au86kOWoviwvW
 p9YmaxJERe0xXQ1atk4gLBb1jpWpQQmQ9jd34P7zmvywCTlmtxEameXE71P1Ad387C62
 3av1lf/EaHn7XOViJOka8iTrUnxydjAq11paxEcSutY8aEWQd7CfNn8GnFT1FV4NDbUe
 bC240l7cLdNZj01D8A+TR/yZHds+RqWYPDr3G2GybcF4w6MyfXkls4GN34AAMoEcwVrU
 dYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684940392; x=1687532392;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ns25hFQv0m873dAstZ8K9TCtQcMZTz3TE3rahAkHoFI=;
 b=UPAKMBgcpRdPjiTucXOcDE5MakQyM/xoWAD2dyw8sM0xH0nA8w4WfQPvwsicUlsaMP
 QLHsBctfgDn6BKDh14kTshjl5mWekOWqxdOnTl/RKb9FO/WLBzmcNHJsfpR7aVU5si7s
 MPjC0G28itt6mR8v1A188s/9jDxaMTsBdKQHbyPOch8hIcT6Gr/XcVvymQnLvQ60SaKI
 yQwvnGF5DdEBzkHWu8Mo1ZrD/bKqRwStV75qtXc/0i456bFYm3/RUuAkr4hHwCRz65nQ
 1T4ulHTBTB1JjE8BTUMqN08I1Z0tREy8Bt4eob5rgveRMHlon68QnaW8wGAWFrWhJWFQ
 hQvQ==
X-Gm-Message-State: AC+VfDyRygCSU/OGRgYzxSkTGr2/8HuUoi89Bc/PZYNvSyB3+La34Cfm
 1mYQ++v6/ucdw0iAmAev5wBdAA==
X-Received: by 2002:aa7:8896:0:b0:64c:ae1c:337f with SMTP id
 z22-20020aa78896000000b0064cae1c337fmr4199900pfe.12.1684940392352; 
 Wed, 24 May 2023 07:59:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 k25-20020aa790d9000000b0064d421f0497sm7515771pfk.109.2023.05.24.07.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 07:59:51 -0700 (PDT)
Message-ID: <32ec9373-d095-41d7-6242-90014db9e78c@linaro.org>
Date: Wed, 24 May 2023 07:59:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/5] hw/arm/sbsa-ref: honor "-vga none" argument
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
 <20230524102729.810892-4-marcin.juszkiewicz@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524102729.810892-4-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Xj1ZpS90Aikn

On 5/24/23 03:27, Marcin Juszkiewicz wrote:
> In case someone wants to run without graphics card.
> 
> Signed-off-by: Marcin Juszkiewicz<marcin.juszkiewicz@linaro.org>
> ---
>   hw/arm/sbsa-ref.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
