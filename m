Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6647082ejq;
        Mon, 15 May 2023 09:56:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ586UK+47JuwO4RuXEQN8ciaSHoKebgDkmrWHSAtEYrVWu3OtQoW2RoJBFvvab273voJLgP
X-Received: by 2002:ac8:5c86:0:b0:3bf:cff2:2c2f with SMTP id r6-20020ac85c86000000b003bfcff22c2fmr51316836qta.44.1684169807020;
        Mon, 15 May 2023 09:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684169807; cv=none;
        d=google.com; s=arc-20160816;
        b=0zpAN63MopNTVcTjEQ/C3oLCMm9OgRC6ChlJIN3htheYZvvegOKI6qFEGoQISTQtFY
         e6cVuUOH9vObtFxlXXArjbveyFNzZAzNcnOK56uIuQfhU+9MMVcrS9L6v99DFXODsxxX
         cfOw7xYpjhtwVG7LIh16izW/dgHhEBGKXDepVgFAcZrIkTTVugWGJgyIgt0dhOGgDTMd
         NioX2exMvat5BGOkoi29PDStPt2Fs3/k5dkvkOjvs2fjT1qCEAfzNauwq2SOOyGKSXBF
         +D3rYjTj4/QVm0ZMvaH1Ipvp6AO1C15mgS9AEYHmJ3oXqzhXAZtO9Ha+UV/txNZtece5
         aq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7R/IowkwamJfXK51zrnVtpNCw7LfSxeuoXBFF4JQMNE=;
        b=CkMOGs65xYz68S4jVCuccPED+EAjOl+p0CU8DjR90J4RFmMZPvOSgfJW0YOFRxHt7S
         yVHWKsSvfvPwyEmQeHrBVBFebVO/79k4pIqrrhJq1/K2CZRxkvA+1B2eMpzkpv0O+xYE
         jb/x6l1vSF3emdeVaI5gkCqUt/8opbt67lXYWn6L9wsKEtIG9gW1BHanptfoPPAnoFmO
         /Yqiizh3V3wXhGep9rFLebiSXxY1tQjlpYPtC8oGNZ/tuDRDPNSEkaAmrtww3aQE6vUk
         9gUsfaPhN+LotO+WPG3Ra4bJwfYTNojRViTzGGHPOhE9emujP0wutvbQ9xTwJ9mj72iP
         nc5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VYM2edoj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x27-20020a05620a14bb00b0075780d51788si201166qkj.7.2023.05.15.09.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 09:56:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VYM2edoj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pybUt-00014w-Eh; Mon, 15 May 2023 12:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybUs-00014S-B0
 for qemu-devel@nongnu.org; Mon, 15 May 2023 12:56:30 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybUp-0004hI-WD
 for qemu-devel@nongnu.org; Mon, 15 May 2023 12:56:30 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50db7f0a1b4so11976964a12.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 09:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684169786; x=1686761786;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7R/IowkwamJfXK51zrnVtpNCw7LfSxeuoXBFF4JQMNE=;
 b=VYM2edoj0QFIAHjw0+0KOsvBMqVCPVjX3SJI0IzSmVIGpBbKE04BCccIZqpivux4sa
 gpBb51587qbCdhCcumu5Q0AxIuv0QOyNXXCJs5Kju2nPtg08WRZt7R7DJUw4mp0pJUOJ
 P1VT1Oqp1zD+xrHYcI+u7sQQiH8WSq2RdGVAiTI0ZwqK/+5X1YPdl1qdkW7+NohXXg4J
 94ZF0jr76soPEKfyZy1U2v3Cxi5StyE4DXGjih2YPeRiargK2eoNIhghPYspVuBt5JfN
 Oshilm5SLv6HtQBkrvOt45xRdWXLcgJQKZKdHOFBIyowD2AWm+0W3PPLA/eQxqd7ueB3
 zukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684169786; x=1686761786;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7R/IowkwamJfXK51zrnVtpNCw7LfSxeuoXBFF4JQMNE=;
 b=ZoEuQIxrAITjbWVZHOzgmaUDXl1kkJmkiUC+ZhoSJ4BqVvbxldck57Ilm0XZMiIleC
 soEiW3drBJWqSqroQkMqRw4I03ZfF6v1WATFstXmG8nUV4D2ZiwTl2v0346MLcWWbtNd
 TDEue22C6TwM7AbmYGkqCeBHspkpcVr5qN6dDU23VgoDgHomSKlAKRY6VqbnNoTdiyXc
 FcLJpwu0HSgcYYRG9GpwfVwFV3r7PPRLDdMf8Y4cxmk8qjJk35HJqbBCeOPAD2Hsn/3h
 Oc4VBlVxzxiwVUbF23j5JDGS7Bven2Y1urwhDpRHQRuILk3DpLaMfQUQq3amblp024Am
 cSJQ==
X-Gm-Message-State: AC+VfDz2IGN3q30uIKqf6orVSres0X5f7FL5CpsvINRZVx2hQWLA72yU
 cY06G0fEJO1ZiSz7ta1aepUDdnTNA6S3/3FXhUN6UA==
X-Received: by 2002:a17:907:8a02:b0:967:d161:61c6 with SMTP id
 sc2-20020a1709078a0200b00967d16161c6mr26702270ejc.3.1684169786402; Mon, 15
 May 2023 09:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-10-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 17:56:15 +0100
Message-ID: <CAFEAcA9NuSgNxKc8a0O6cO9UdvDBcL46iGTmu1d=MavHqPogbA@mail.gmail.com>
Subject: Re: [PATCH v5 09/54] tcg/i386: Add have_atomic16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VO7jL4CTtnCF

On Mon, 15 May 2023 at 15:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Notice when Intel or AMD have guaranteed that vmovdqa is atomic.
> The new variable will also be used in generated code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/cpuid.h      | 18 ++++++++++++++++++
>  tcg/i386/tcg-target.h     |  1 +
>  tcg/i386/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
