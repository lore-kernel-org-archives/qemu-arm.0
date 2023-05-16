Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp404389ejq;
        Tue, 16 May 2023 06:17:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79QA9aqQz2Knv1j8lWqaU9RnyqVdZ1ghw3GxSS2zgoPzvWZpSxY0swYg+Y63GQgKpY2ZYH
X-Received: by 2002:a05:622a:1911:b0:3f3:9013:5839 with SMTP id w17-20020a05622a191100b003f390135839mr47793963qtc.23.1684243032098;
        Tue, 16 May 2023 06:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684243032; cv=none;
        d=google.com; s=arc-20160816;
        b=njGjgQcgTB9MlpvAdGpJxk6z8LTJykYHuJpQZX3rwympXpsbYMRFTfQDILRl5z/peQ
         k5V2J5busItzfLhTjWjbpap16Y//5nZBIhTH3ZHNqmOsJEqPT/oSr/psPqPXIBZFxrEM
         Z6A4fiBouDfSvFVBRlaRkO5ZtP2R+uoKXbv5Plpvh8t4WkHGWuE9vl/suGkwB3UMIsVU
         FZdDzghpGcQGU6DxfxMhoLRe2p0ZvIl5a8jF1L39nqDW3IAVAEuQ5+9pLsCdAy6jFC2S
         2yDUC9Ymrb9na++Oqw6dCKVRp8TxMnB3BRFUaA6iQPOAC6Xzw54BLkibmJtbbGW6xZXs
         yh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=R1KF9zOgSvdijfaI51rywVitgyY4barVTYLpxswT/5A=;
        b=LTDHCLadJvNTOZbfC1QbPGCKha0t1DilKRXcu4+WB8TVUZTJxw49FvygYc5on2MaWD
         ncZ2PwKNQtb0aVnEI/l3OJgkd3/mRvLYYcKFjCba04T2YY+V1/yFBajDS3TOGUnQBsyN
         HGy4EuE5gMZCvDBS3KO7CbdXlncW2qAgXYhW6jX65Wo1nHSuT0gQ45f7F5TexgElYYxQ
         J5uJ5g/xSNXCVXLfhLmSciqUxAPEieSHYm2v8npfJsLoT5Gp2SXMtLxwPn8RqCjxMQmH
         x+rUTvGFr4wt2iaoWECyFX5jNmzVIxTw1MqdSHK51MoNnX/HGZmeycjV7h62UmnK6S8R
         eTvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cJUQ6OYn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4-20020ac87f84000000b003e4ecc375c2si11190004qtj.519.2023.05.16.06.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 06:17:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cJUQ6OYn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyuY3-0006RJ-VK; Tue, 16 May 2023 09:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyuY2-0006QJ-8w
 for qemu-devel@nongnu.org; Tue, 16 May 2023 09:17:02 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyuXw-0005L2-NG
 for qemu-devel@nongnu.org; Tue, 16 May 2023 09:16:58 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bc075d6b2so25725647a12.0
 for <qemu-devel@nongnu.org>; Tue, 16 May 2023 06:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684243015; x=1686835015;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R1KF9zOgSvdijfaI51rywVitgyY4barVTYLpxswT/5A=;
 b=cJUQ6OYn+MZKKtewrrxioCokTU1K/nJZWZPKkmhjvB16hXHXuD7IP/fjKb2uuRXev9
 Axp1MHICLZQ7nWSZ9Rj3/uPtLX4hKEI2MvQyj0woNCCWSRTFplpqzQ0kNR4Y8YrTGldh
 1Q1IeS06HhPx8dIa1MHhouYA/EpEmxTiF+b5DrI+QZdRFamw+yEPEDJtEjq5gg9BV9lU
 35TlTAnG1XyWLUhO5jWbYmFiJxdETOWkt6oh8sUKZXuBpRo+SmXeuSJYiSIfyTZCbM/2
 2UZA599wfTKJL8wUU7MfW+lSdb7D22bTQy+IA5CzoXFAyUHz8nwxMIy+55k4vUqcSMiq
 E9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684243015; x=1686835015;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R1KF9zOgSvdijfaI51rywVitgyY4barVTYLpxswT/5A=;
 b=fq0gPGAFd30R2nUlDTt/PNYg/Sx98mFBUAn0v+J+xG3XLBO3MWqszOE62ztuDm6u8K
 GtA2soudf13G4ks9UbG1KYOqGEb4S1CyqQyWo9+frr9riIJY9gMxQgtE0mysikOXPU3O
 BCvobFjjw26a6kkXKEXYSlIVhTyCLpFvICRPopjtpCCc5Vy+hVNnXvIcMuV99RGJIjjm
 1QiGeM5Z6GFtdpXa8X+wMZ1jLnq03aA7RpMleyOfA3Rd82JM11T0CgpoVwP6fp6VgS7L
 NmPGpKrIlAm0YT4r0EJTt6ZqRMsijK1DtNZxyc5RHT60fgI5nOQnvaGV6h8v1p4zraUw
 3ydQ==
X-Gm-Message-State: AC+VfDyokEvB5zlP7w3/s0+V8jLWN7W/wlqpQJCjHtwGfsaI261nCztf
 TX1+eWh6lID1Idh/jORVhWT3V7tJpzfYp8uD8rl7oA==
X-Received: by 2002:aa7:c445:0:b0:506:8d35:40b7 with SMTP id
 n5-20020aa7c445000000b005068d3540b7mr30066326edr.8.1684243014923; Tue, 16 May
 2023 06:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-15-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 May 2023 14:16:44 +0100
Message-ID: <CAFEAcA96UFYH19Onn9zkwsfes9R6cvt=ygED1ULr1VEFjkOXAA@mail.gmail.com>
Subject: Re: [PATCH v5 14/54] accel/tcg: Add have_lse2 support in
 ldst_atomicity
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: /4O2a3SFhpiI

On Mon, 15 May 2023 at 15:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add fast paths for FEAT_LSE2, using the detection in tcg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/ldst_atomicity.c.inc | 37 ++++++++++++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
