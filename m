Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp772396nji;
        Fri, 12 Jul 2024 05:50:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOmK4gbv0jOIdJlxYCRuhuAq2tKGoXtS1luuDWejy1/7SnFO28D9/cSq5vR+aW2PmP9Xc/WuN/K0b065LgHg6oBhXgMwv7
X-Google-Smtp-Source: AGHT+IEK8yau9X+3UMlPnQQy/EKSAtpGHDsPcczxnd90OY7graZJ/YoUnrNSWRscs+PvYy5qR2LL
X-Received: by 2002:a05:6808:1b2c:b0:3d9:23ad:1ff1 with SMTP id 5614622812f47-3d93bee4eb0mr13626450b6e.3.1720788608398;
        Fri, 12 Jul 2024 05:50:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720788608; cv=none;
        d=google.com; s=arc-20160816;
        b=cUH/MP9pLiwYSCnTDnkd6MHraEMh/xJGsLEVinI01SWJX/5sr9fO9OWWtdCULKZ5V2
         Yu/s+ozr0SWoqyowGJ6C95lR5w3WkH/fJTIZWAo6A+ruvX7xMefU/O60kY8++U51EWGl
         HJxZ7+Ch/Av8qt/vf2KeVzqdsKJXGrjv/+UAU46kRWri9IUnuJFtxuo79iTyZ2B3q5k3
         xVvZZuidbVsmz2btpJ48r66jYFsWqrDLMcSBaWQq+c2wI2YIQxl/kNHa/0quE9TkyvnM
         wPZzpS9eBjOpouQdP/r64G7o5wREQvYKnnXWHCeONGF0HWVsaByxzSTG3uP7jU9yB8K9
         Josg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CCudL+2uFh9uJpKv9cJcXhgbDu85xfNNfQx4hvGfI60=;
        fh=S2jGWLQO04OPw32GEuaOfIRGVwgxWSS/w8bhiQaROZY=;
        b=SPX4BgLjw+tBp622BnNxwBYU/SLBXLH7jZu/oizaIOZuOtI5eVo/tabgUIKvRhXexk
         Zv9onrO/mXGGJcbcw8SI9EObFYUqHlkzgwLUo8h0MaOv8KJlOaykt7qnaQn1iC/PXWoc
         s+6aCJORI2VBYdhhCKw6HoFZUUnMKjU/BRrUbxRAbkgKD66/rsZBIVhKchX5HYjMsbue
         k37dyVe4yt6j/9X1mbPbzDLZMyBGwo7yIh07qWH/YbeNGrL+wy2k3QVRl230JxWqVAvw
         QXLuDcBDkjP7iFCJfIK5/16T+9LcKmZuYOm7w9xq2ICvJyPZVd3/LdlG7H8r5SSv17aT
         xYhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mUngZlpK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190dd2a9si953400585a.687.2024.07.12.05.50.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2024 05:50:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mUngZlpK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sSFil-0005e4-OM; Fri, 12 Jul 2024 08:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFia-0004r7-9P
 for qemu-arm@nongnu.org; Fri, 12 Jul 2024 08:49:45 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFiW-0001bT-79
 for qemu-arm@nongnu.org; Fri, 12 Jul 2024 08:49:43 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-59559ea9cfdso2467835a12.0
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2024 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720788576; x=1721393376; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CCudL+2uFh9uJpKv9cJcXhgbDu85xfNNfQx4hvGfI60=;
 b=mUngZlpKNAqtDM+kJ8IgQp2mGMx8v4TKOf+nHVmjdrNROn6W2jEIKaa5fyttML0OUH
 DdcuhbK+S92RmUWfy9Vm6MYQf99n7ByAico6NGG9PKbVytgEm7BsM4MDL3bPMiQ31U8u
 CfsbzpTo1tKZBEZ2Z67aidCcHESWmOXHUCqqYXS1V+pgU6ERYrM8mTKsOiJ33EcFirmz
 d2R1p1UcWQLJqwR4wJigN13tN79QD5QzbWdwV/4+zRc4Mk9ow4gwn1RYIfCzsaTFohy5
 v1sQ0C1KHdfYaiY0lKtBImRDjyshLYgcZaLP7ZTojWiKY6xLYkbt2qaJkQuPYwJDxhXp
 LTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720788576; x=1721393376;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CCudL+2uFh9uJpKv9cJcXhgbDu85xfNNfQx4hvGfI60=;
 b=DF8I7hYqE4EAli0VGYRm01G9wB57diuSW4heEFbg8gl51y8sL5FYVJMz+O0MeU7j+L
 ouz7DgftW8bemkLo6k8DFJJ5aSXk+v08fM+7qEvx/TLBATbl0h2OVLyItRFFtOLzvnr5
 xGfJRuNiPJ9wPsKz9pvlArwhr5HAkRJ34qjmMSQtyHVbuoMCQPKwPxCCniRnExFxmdct
 M45Yv8c56+Ibu6cBRUzFcn7Cye0t4a1QWqIcGLFk3/sfsOLtIZeXFTFdaX396Dr1Uhab
 LygOplUkBGNAEX+2YWeJVed3K9eXlOh2fsQJdhlyYhZLrcyCMN3OqVu7QNCvkEccwW0s
 9UlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWLO49Trwxktstac6HIwqeu6bXuvY5KzproIwnuE+jVvJXoK1ijQ45M7uwWfYRKsMMusCu87p2TxNKuIUitJ1zJkKx
X-Gm-Message-State: AOJu0Ywzl5WsMG5wJUVespWR9CNtGigSRRdsQGTKs30AYtfd3Wym7Ujp
 47eoZOSKRB1+ZA68vHqBt8Ik0hvNBLL19yQWzBY7/quHMi1dK7Xzu0Dw08wIMC75Q4Q6XqPFQRp
 3yqVYzg0r1O5BjoShFW2czu23KlJNled5jx3IHg==
X-Received: by 2002:a05:6402:26d3:b0:58e:2783:242f with SMTP id
 4fb4d7f45d1cf-594baf91224mr9068100a12.10.1720788576604; Fri, 12 Jul 2024
 05:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-3-richard.henderson@linaro.org>
In-Reply-To: <20240710032814.104643-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2024 13:49:25 +0100
Message-ID: <CAFEAcA-PKsW-PfGqOK3RgfyfJUsEHWYMeTyikgrEWSYvAmMEow@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] target/arm: Use cpu_env in cpu_untagged_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu, 
 max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: OSDAGDXHOK0v

On Wed, 10 Jul 2024 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In a completely artifical memset benchmark object_dynamic_cast_assert
> dominates the profile, even above guest address resolution and
> the underlying host memset.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index d8eb986a04..ccfb9349a3 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3309,8 +3309,8 @@ extern const uint64_t pred_esz_masks[5];
>   */
>  static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
>  {
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    if (cpu->env.tagged_addr_enable) {
> +    CPUARMState *env = cpu_env(cs);
> +    if (env->tagged_addr_enable) {
>          /*
>           * TBI is enabled for userspace but not kernelspace addresses.
>           * Only clear the tag if bit 55 is clear.

(This one's now upstream as commit efceb7d2bd5c.)

-- PMM
