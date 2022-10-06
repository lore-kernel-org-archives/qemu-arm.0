Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp603680ocb;
        Thu, 6 Oct 2022 09:27:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49gJFo/pP/qT51LlboZK4cQd9buunw25Ki7ShuRRDCrbuQxj7hctYGGhUbz3vtPIkGLM1w
X-Received: by 2002:a05:620a:1727:b0:6ce:9bb6:404a with SMTP id az39-20020a05620a172700b006ce9bb6404amr774340qkb.184.1665073677283;
        Thu, 06 Oct 2022 09:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665073677; cv=none;
        d=google.com; s=arc-20160816;
        b=DyAvpdmq2yg7Tde1hmSbNTsRJS7gWQ7LViNzZp9CZhmBRzytgeOZs913aOuN9H+vHj
         rMO2WnsoGJ3/sKmj9iGfWKYaHPcfI3/v9X58uaMlnLFr9SHvMEzOd9kqZ5KZwA4DWKkz
         0CMOiPG1/RTgVDTgPQonjlO50MyxOcYVAv/6l0a6gMd+qPoM81Jsgki69/Dsrspn9H/5
         1OXbGJgLzkopljexGNbHoYy5W6Ap7TVqX/r2hsj+thUsDcaZZwPO7ToFyWUSsJ2we7d1
         ZEBpOUWRlNi1R/EpIfEp7JvzMHyukve4GaO23SSHDpVQUurItHP27j314ldIGTZ4cOpw
         yfgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pVoW6L5/2Mq3J0jYZnOA2YLWQiFhtZWXuPQ7oQhu+us=;
        b=oUYp5OUg9cFKu0ueLEYgHLjgajEE4tQJtIHuSbwLhxmHMtpBlch5HUmgiHt/8ivNUj
         ugo7NHpmJ92WxyxVzwnNKYUxbasQxvtNzPvCaKFSeq5IYmAPVOwAU6T1k7wEwfjiNh5r
         q7lGe/rvaP67GMtBp0U4TmWLlkn/DOiiANz/9CoecKf81qBqyHcUD5e/wyTDk5SgUZSZ
         1RpDVhjHj+li4k57xhuVmHEOuxEwZCzRBYDumOtZUQAHfAiO6ZagTO+LeQp1DJUeofph
         DCe/MWj1yea1x7eSfCILbKB+HIaVCyl7teCshD1vHFH/4v65znV4AP6w04FB8F8ktXnK
         H2wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bItGL6jr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17-20020ac85891000000b00391c9c05a3csi32824qta.87.2022.10.06.09.27.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 09:27:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bItGL6jr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogTj2-000261-RX
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 12:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSiA-0005jK-Se
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 11:22:58 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSi6-0006cm-On
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 11:22:58 -0400
Received: by mail-pl1-x62c.google.com with SMTP id u24so1976138plq.12
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 08:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pVoW6L5/2Mq3J0jYZnOA2YLWQiFhtZWXuPQ7oQhu+us=;
 b=bItGL6jrS5Hgyf77V7EPSLTp03+CK0A0fQwesfUX+GcPX6L22VWVXlTDGgvZMOgNb8
 V44lTmGF1bRO4FirC377o3EsYNDviSy8/I679NVP15+4oBp3j2D/Vpm5Pm4BuEgQ3fXX
 hj/ETMrBv/p7RnMlkuUGrTZjZltU9OVTQAnCA+F8i4SRQG+dgZivIY33pwFsSGH0bOUn
 fF4g5prvKnAeOokC4uS7TRda9uCJ5z6qrPaF7aogLdb0AARxnreEXbe8iFXqeN14C/RG
 MFx5UHIcLZh1S310oDtcFiiIRLbMAQxDkw2DCU5MhlWlAep/lj0UInElFSCGeNw9S0u7
 csgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pVoW6L5/2Mq3J0jYZnOA2YLWQiFhtZWXuPQ7oQhu+us=;
 b=4iBaD5Y2YPjuymKKjT7eoiBm2o1Q3dO0cu7mG0fjpQ4TxnomG95B9k6Iz541j6lGR9
 BLKXjjJ5iVyAptC0UnHRvLL+nXHNGRAIcj6le7dA/9eRP4NyOBuHJWGGIKfi1XqSoaCz
 oAxigFwQAikbYma2OfmYGDTQGX7yyf5Y82O1O24vzXFBEuZ5883dnWWLwehcOg4hFsgL
 FvdTCHIANc3DGWnw1fAbdLJwFRbgcfit7T7EoLSUSjW8B6aKLlTTqbLd2yAdd3LKQocE
 wdWwLbRohgQ4CAITNR02vvxYaB0dJ0v/d5QEysTjsmcMIoGoc7kLjgVQnRfXZ/XT6icZ
 PbPA==
X-Gm-Message-State: ACrzQf2Ly+o8REDF0wJyIq1w4+1unVM69FCD40VZxVrYg1nlrpBYZkhz
 GQXnum8/zHCJsQW2oFoJwST0ZyrVT2f40tDF+lqCGA==
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr239314pjb.19.1665069771210; Thu, 06
 Oct 2022 08:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-2-richard.henderson@linaro.org>
 <CAFEAcA_LSd9mPFiDHyofdHVq2kshiL6FjxNG2aSXXc8jkGb3vg@mail.gmail.com>
 <ed6e925a-ea37-5575-bc3c-aee2a887d5bc@linaro.org>
In-Reply-To: <ed6e925a-ea37-5575-bc3c-aee2a887d5bc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 16:22:39 +0100
Message-ID: <CAFEAcA_8Fc5033cRHp9rhgnX4spUsGNPxAdYRNtiE11Beg4w9A@mail.gmail.com>
Subject: Re: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure
 in get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 56hZtlaTBUAx

On Thu, 6 Oct 2022 at 16:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/6/22 07:27, Peter Maydell wrote:
> > On Sat, 1 Oct 2022 at 17:24, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> The starting security state comes with the translation regime,
> >> not the current state of arm_is_secure_below_el3().
> >>
> >> Create a new local variable, s2walk_secure, which does not need
> >> to be written back to result->attrs.secure -- we compute that
> >> value later, after the S2 walk is complete.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >> v3: Do not modify ipa_secure, per review.
> >> ---
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > I did find myself wondering if we should explicitly set
> >    result->attrs.secure = false;
> > in an else-branch of the last "if (is_secure)", though.
> > At the moment we rely on get_phys_addr_lpae() for the stage2
> > doing that for us, I think. Having the code here always set
> > result->attrs.secure before the 'return 0' avoids having to think
> > about that...
>
> Yes, we're currently (and predating this patch set) relying on the attrs structure being
> cleared to start.  But I can certainly add the assignment if you like.

Yeah, cleared-at-start is fine. But here we're also relying on
the stage 2 call to get_phys_addr_lpae() not setting it to 1,
because we pass that the same 'result' pointer, not a fresh one.

-- PMM
