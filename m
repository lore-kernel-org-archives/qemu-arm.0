Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp53701ejk;
        Tue, 28 May 2024 09:09:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWL8v5vAdffJjZ5KXKaU0ozU0Rb60AmN0p3I4nbvJ3BB6SEvbCIRxNTy5IL12ZBJX8iFR1P0YxR6sauLK0mQKkOS11fIijp
X-Google-Smtp-Source: AGHT+IFQ7AwdyMyR/nj8uqgybCzZaLbFtkuE2TVQ3/BWhF7Be+NbUdBqqA5042tJV/2KVpdKJTwD
X-Received: by 2002:a67:e8d3:0:b0:485:c65c:26b0 with SMTP id ada2fe7eead31-48a3862478emr11150145137.14.1716912563646;
        Tue, 28 May 2024 09:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716912563; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbLeoatw6j9p4pqqugaQBvp3WxDH66ZRshcivUnHyOp1+7A6fhf9NdH5mRBmwRxrJe
         EONfj32JJuDi0ahiQgBIQ6ngnzfHGrRoGpy/W2OZHY9CIknLib/0pjhr+zZ3ISPFoVUX
         W6xHi/BBzukiMRrWbCQbdjZeSQhclQu0xXW5l0Vb6v+nv0tUQbksHCWOEYsEK726FmYV
         wBEHippM4RuLtdYmd9uf7MCFCQ25V+lVvnAB8V0AF71ctEOIfvvX5pR6/xrrHG3IvxiH
         Ma9CbrHM7lHIAzeRYpGR1Zxv4TLCHnUZUW4s4v7zkZNJN7NYemXxmJnBayapmU89r6k/
         LEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PdLgBF7+1xlgB7t3G/mTAbvLmebLWALfLrm0ZhBnGwY=;
        fh=xdXcJ3kaztaEdm8VWrNihVn9Fe0ibt66VzwWATTzrvg=;
        b=TDxL5Ncbv10XHnVz/Z72fFFVaUgUc/nHiV+qx4dlbh1u43nkxlDr59HMIkpYqf4WFT
         Tf6/pcLINWNP2yX1I0auIKJyKvc7965EP56Vi95Ylt2OuwU2AiPfdblZLpePyWV1dpXi
         yo35ez1scriYEkDrHrj0GBX+aFUiuldoy+IZITm1g3Vc6GwA/p7gSOUuQ3KGjCdV348J
         bAQ3SrMJyZ3sHgCNBclR/y7uHCypAzIhEZW3UgomH+/PPXFYMiR4+AKfZzzsSFOECwN2
         wkK8Qvl1DW+xg552uIxFI7E6Ju/OS1hccy7TYOQCkILIyYlriwiNKR8D2rsWun6UR78G
         pPmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yPkdYtNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48a3a39a0bbsi2289105137.564.2024.05.28.09.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yPkdYtNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzNu-0000Kt-Cl; Tue, 28 May 2024 12:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzNr-0000Jr-Oa
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:09:07 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzNp-0008WC-J8
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:09:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5785f861868so1386490a12.2
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 09:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716912544; x=1717517344; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PdLgBF7+1xlgB7t3G/mTAbvLmebLWALfLrm0ZhBnGwY=;
 b=yPkdYtNnaFKM1SashxHAn2Co0CHH2jY47zDqOV13pxx+yUm07JKHlDYcNXuRIHbaBx
 P+LcequLbCK1bdyw1bxSgyO7KprUpP5P9EprSAPj82PbIH/3wtoul/DW55DLm0YJq51c
 nv+1zWvez196lTUW2ZBbdC1ME8Ob9kbL7vOdR6mkUPfH4HFLQu9IKXSf5C7zfaaZ8pG8
 ANbG3ExV5SbiYN7pG/aZbg/XnPImkdSQLcX7TYuj1K2rnabWS8NR1N5b9eHcdpLMqOmj
 Fpn5/4xTGUskt1ZXhxwL1/vaJjgfEb5LtEq/cAQVDIYBeVTjJVsPEEFm1DgWDUIBn3Rt
 ZIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716912544; x=1717517344;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PdLgBF7+1xlgB7t3G/mTAbvLmebLWALfLrm0ZhBnGwY=;
 b=Ta4l4bagu05wL3LP8Nw0z3/IWMNEcQj+VXJVqn39Xcd0BxbipUifC8i/zEzxr1ZR/3
 /OqEUo3qybEyqgiu4mrVET2pblgb+LVX7FQQLBzxhTkywoTgMxFYBGa3t6FPf1b0cxU2
 fEIxfCphRl9Y/bOK/i10KZmJwfm20tGtCnt4me+eBS4khypz6SOD0PCAtr28Qmwd3A0A
 f1kln6BX3ffl6lBiQc2ssgjOeJTIFNf+aYtwvDpUdsHsZ5KsXrtJjIi02/vIXpi5rEfN
 bJTq9xW2CSqDj0D/KTmnwdYJrkrKTpWOEW7V25Y1Y8sp11b4gVpYngBVeaSfcdXnZ75n
 M5VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzxXk/Z3CLzt8mYKEHfLGVsxLsLz9/ydRwKni9Yr+SFdA+JQAzYwIS0jjzwrZl1JxPr1++Si1w1Zx+xuSv8EjGGiuB
X-Gm-Message-State: AOJu0Yw/UosFKHqF9/sB2FTKP3sCDeh4qTXkWXvOFq8KtcH2YuNLdJTO
 zcwkz628D1YjJQiWhreKTCyTk/crM5BIr9ParYRKmJc0xtmMsS3oPRudRDXk0VbmCY0P1MxGDDr
 0jO3L8WmTLNOg/xA13g8aoVBH5HxjO+xF7UEdaw==
X-Received: by 2002:a50:d6ce:0:b0:578:3413:3776 with SMTP id
 4fb4d7f45d1cf-578518ef497mr9209703a12.7.1716912543652; Tue, 28 May 2024
 09:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-65-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-65-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:08:52 +0100
Message-ID: <CAFEAcA-yw09ZHPE=VsS3Jkpt6=vF4G=9Eh6G6n=yhko2D6H4Eg@mail.gmail.com>
Subject: Re: [PATCH v2 64/67] target/arm: Tidy SQDMULH, SQRDMULH (vector)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Ypij2kYTo6ns

On Sat, 25 May 2024 at 00:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We already have a gvec helper for the operations, but we aren't
> using it on the aa32 neon side.  Create a unified expander for
> use by both aa32 and aa64 translators.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
