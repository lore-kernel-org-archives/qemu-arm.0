Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp371918ejq;
        Fri, 5 May 2023 05:16:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4jIDrKxpgykJiXD3OFOFo+i9wsTJRdjriPF//3gqfpCRdGy0NMdR5anHgcLWYzSmKLg4hJ
X-Received: by 2002:ac8:5bd2:0:b0:3d7:960e:5387 with SMTP id b18-20020ac85bd2000000b003d7960e5387mr2174484qtb.35.1683289006948;
        Fri, 05 May 2023 05:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683289006; cv=none;
        d=google.com; s=arc-20160816;
        b=gaXIN6iA3m4L4WZJzl+rOeDHE/ZMExBLv7M984pzxohx19upssih3/G9hxhQ7XYCW9
         RxQC8sYgRAlilUqJbsqrhgga+COEgzpKRVOvMS8z2+MTSe5Ku1jbJqieW4xB+x/5nyiR
         b4MQdv1qVs1ta5SePStjQ//YY4ce00/Lcejp3OW/+dFg2ybDYTM8fH0AG8xTqEWPLBqe
         qpsTnj5dkTNuO59yDvTAcDTktt0euX+jVfnsoGweQTboFrjv9fSS8TLfo/eOvin8iWqZ
         HSM1Ce4Her4pmQX4YEqEUR2dISc/IxWUgSQUTs6CJpIHO1zZ1ehdoOK2aWp6SGtPmBRF
         ocfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=A5ZBvECdOvuPKA8ohfTv8Mvkg1bt9SeqkPAPAaEXcME=;
        b=auJSiQS7L2it6qByuhLWTdEqLxSXHr9ZHeFnVj5inp1+/hRIplRAzAWfwaGS7QYvg9
         M1j6Nt94cY+gb/0VrlkW+ouRGuLHGogc0+5C08HREyMaLEprGdMl8e26xZixutBGNX8Z
         qmJZO7osBbiKh6hPFM1JDFAncqJ+Duurax+7S5FX0iRGz28WWeM9jYCw8WB3eMoxfbgW
         3M2oNeU7L+dxcrdL5y5KpfjzoUq3H2me6hyHQgWg7HUSipfjbAhzOD2ROUIPbLWUM6A3
         LrLgYazDDHW569JBkI2D81amQnAxBwEQevIUhmp3W6kWv3AFSl4OyMuLeYP3/x3VhbRB
         VmKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hmNv/Izr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16-20020ac87f50000000b003f223248863si497314qtk.625.2023.05.05.05.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:16:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hmNv/Izr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuMT-0000y7-J9; Fri, 05 May 2023 08:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuMO-0000lC-A7
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:16:29 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuMM-00081k-Ll
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:16:28 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50b9ef67f35so3040211a12.2
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288984; x=1685880984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A5ZBvECdOvuPKA8ohfTv8Mvkg1bt9SeqkPAPAaEXcME=;
 b=hmNv/IzrYYP/rHMZUjXrJOgxuAb2U88kQBEU3euB1/XfavNAtCy2t16QiCiI6wjl4W
 5+y8aw4Q5/9TwggXyWhqXj3VZhiuqXdKT9JUhpMr2RZag2hR4gM1lCE+3Lpi5WIPornn
 pkE5qOEujYCI9fQDLpMOUbI+fttLqmezK69FB92nWSMYCzwjyG63CPCzvKMS8j2anahn
 uU9W5luUVL93L5SS8eG6FF7POrZpTORXLow2uelk9hdmTyUyFQaChSCfTj1wO30IfiAD
 8J5DArKTryXy3nGMZQFop/YM2isJLV+vzuo+atvmy3lOtjGmcO1JH1Wa9kYSGI2bN0Vl
 mYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288984; x=1685880984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A5ZBvECdOvuPKA8ohfTv8Mvkg1bt9SeqkPAPAaEXcME=;
 b=VA16Ot/dJqo8NzInFVOyIoiUH+kqZDfkge4F5VnWUGgGN8JwVFAUdvqODcOvW1Jz5c
 BY75KiJx8Giasz+GKmvAgW6Cbv9dy/IVBV0oEZtANFk1+3L5etsWx+XiVCp4hvNYQjFX
 MsbRIHED2ZAMqLHwaYH/M/X17IZUJBL0K0pyzf8i4ep68eaYRYMWVmotbTgru7lRMamf
 OQO/Qq1HEAsQhZIg30REzzhATmyY4DWvsrYoyfZwqLPDC0IT1J6zwio8WWFxkYjyO8yO
 JDzDW1ib2vcugWbeE+/Yw7KfiJOtKg7oQvr1Qbmd32ws8wIu8gZL6dbMkYDVPpFNH4hj
 7+fw==
X-Gm-Message-State: AC+VfDzmeIgdTNBXsgKwHBOtmNweWp7VFkO8qUvjdoLfjr89u868yIuz
 RLjxvPDxO+q+J6CRrQ4pVVzyeqdnAELuI4ODeLbsdA==
X-Received: by 2002:aa7:d7d4:0:b0:50b:dcf6:8e6d with SMTP id
 e20-20020aa7d7d4000000b0050bdcf68e6dmr1100687eds.18.1683288984118; Fri, 05
 May 2023 05:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-30-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:16:13 +0100
Message-ID: <CAFEAcA_OEWj7_SLDYqoeqhZCiJeBgWkWZXzOhPb6PLeiR9+1=g@mail.gmail.com>
Subject: Re: [PATCH v4 29/57] tcg/s390x: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
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
X-TUID: hKWQ8MfKImZO

On Wed, 3 May 2023 at 08:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
