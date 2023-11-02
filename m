Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp305564eja;
        Thu, 2 Nov 2023 04:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg7CB2GrYzvX6vPHb9p4nJU6BmDMNrxooO28AfZd6iAk0T4e2c4xxzGp6gXT0cqtK0h2/K
X-Received: by 2002:a05:622a:651:b0:40f:dfbc:2405 with SMTP id a17-20020a05622a065100b0040fdfbc2405mr13096347qtb.27.1698923648586;
        Thu, 02 Nov 2023 04:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698923648; cv=none;
        d=google.com; s=arc-20160816;
        b=BNagKI8eYktF48UkCMoKz+KmJ7nVfG3G/WJdw/ngswT33yPdTDDe15BuyRUrV+X7mu
         wvou1rcYSggMIMhCIMMivUn4n2xfHpBGeNA+LvRZlOfjYp6YjxtZEM4SrKkvjRFXjMwf
         iY2cj2wGTKnFE4u/v/wjQ1DrToh72i4GkkAdLz3slryiz6mhlBQFKekqKs6/NUS2KhuQ
         WqxrvmQ+f7LttyxU5EmcoxkL7D0ZrQAGgw+K5vKzrk9fL9NfhzUKJrkGllZPBTqhBp+f
         A5EKhyf0y14qMOVGGgqjIk+TWyKjzDIckylTtaZzzWtI5BnhTc6r1rsPXayeYcujReYi
         yS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5vyu9PHp0Aw8E3pP4mRtnr3DhTmhFgBDl474HunyP2g=;
        fh=GRGAhYIRyJLIexm/SQeD/ONQMnKo+TSDqNowgo15cfY=;
        b=s3mY6ab+7mdaG8nQuImZ3Q39DbEJBF+AzPq/27lhyHwLCM/jkzvgiSqpyKbV1xLCm1
         rM2Bcv4AixODIOWbcyH8Sp7585aYOSXS8eQ9WFUzbO1v3+1GyfvTTBv5GR7aNmrtyS/u
         zLtmeDYmcxhVcYoWs0M4WsJykXoEluGT+qq3vyc3W9OTpkYjSGCAwifCoEj7WnARNgsz
         cVMrNzywXtH0bUiqqXzozXaAEhm3ByXyl9uXuFYsrFaJlGOP4dvOR86hkXOp+7Dl6O8U
         3jVdc11ZJaJdAT3Sx7tZD4cufltlFhtRj+BEnqz4sUjzVSL0ILNkvpmD+MyVw18PKiX6
         EFnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SCKM+a5M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020ac87f14000000b0041e1e0c38f3si4423907qtk.741.2023.11.02.04.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SCKM+a5M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyVeA-0000ER-FZ; Thu, 02 Nov 2023 07:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyVe8-0000DU-F6
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:13:56 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyVe6-0007XV-QH
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:13:56 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-542d654d03cso1253334a12.1
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 04:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698923633; x=1699528433; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5vyu9PHp0Aw8E3pP4mRtnr3DhTmhFgBDl474HunyP2g=;
 b=SCKM+a5MxR9fsuiRYlz2Ux9Ni7JunQ8uy4K/KXsR4E7+NXXzHm9M9+Jlt4YTjECWcA
 GvVJmI++Uws9DYrXHI1WPC/vLWFKGiRzIhSbRHCp9VimslipJRskPcQDXw4E6gxa2yJz
 F05tqPdfMdZhYNqsn+PBW8XXbNYB0diEB3iWi5iquLguOTGWUW5kIbq9vSiiyESt2+zR
 3ZH6UXmxUawJT7GLDxzVI/SESGeyqRfhHawPyCmp/CoGtz8u/MsZ0dNBcWipCYc5Nm4i
 GP+3Tbtl/qkdcSilgNxyJqKpwQPyK76q1uYkcwYRkuUEmH2KyQedlWcEZOiFj4LBhI/+
 3IUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698923633; x=1699528433;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5vyu9PHp0Aw8E3pP4mRtnr3DhTmhFgBDl474HunyP2g=;
 b=eRp6IAYHOFqCfp96zQAihMTBA+4j7SM9ZItRpqnIU6OF9SkdRvxEDgzPXkJZSdnOAS
 XeX8AP0NaQnMxgRf88TFJjieo5gFTmKPW2m9r2C/A7RPeRpfog/i/6i2vyWlIlOmbqvL
 GfiDxKB1rzJtYhmvAlBsRAd9UggBi22YtsDVa21Zh8sIuEDTBBrQP5MGmZ3R7h6Gy068
 1+jtIz9hu9EI2YD2doRfzo6eM9Qr27hYbPSaNR9gBWdJPZkRm/Ad+vbrVWjQ4YnuOlhM
 v3DYXJCnGMziGc72HDJRiDaZDmyVEAhugRS9K4hSBqGfJVv/qHIQ9rftR9hDz+ea6zLu
 U1sg==
X-Gm-Message-State: AOJu0YwYB3oPwvbp3YbSDbhSwG9MkeggihmCwswyfqXM/gNO1ouknziK
 VQP/bbS1eGMhQ4sEspWEOVlSLmBQUhMHCM/1fo4ltA==
X-Received: by 2002:a50:ccd5:0:b0:543:caf5:46d4 with SMTP id
 b21-20020a50ccd5000000b00543caf546d4mr2923939edj.37.1698923633179; Thu, 02
 Nov 2023 04:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231031143215.29764-1-richard.henderson@linaro.org>
In-Reply-To: <20231031143215.29764-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2023 11:13:42 +0000
Message-ID: <CAFEAcA9=6=0PbGNKkYqAVwQ=CDAZG1RtiT8tgHGqSKXQ-dr1Zg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Fix SVE STR increment
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: 2dKvQEXWQozl

On Tue, 31 Oct 2023 at 14:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The previous change missed updating one of the increments and
> one of the MemOps.  Add a test case for all vector lengths.
>
> Cc: qemu-stable@nongnu.org
> Fixes: e6dd5e782be ("target/arm: Use tcg_gen_qemu_{ld, st}_i128 in gen_sve_{ld, st}r")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I'm told that with this fix we now pass the llvm-test-suite
when built for SVE2, with a variety of vector lengths.

Applied to target-arm.next, thanks.

-- PMM
