Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp310718njb;
        Tue, 4 Feb 2025 08:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWq1P0mg27AQAr9gvcJNR45CmSDqECEUleirFbPKBKHnBLComGl7DzEyV1ymqUk0a2R512IdHFExSXNKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEBfx4Tu3iky1RTg8enGdG5roF+mvrgr9/zWLVj7f0gBE5UNlQ3NiztJ45/d7vSHXD8TidY
X-Received: by 2002:a05:6122:65a2:b0:516:157d:c5fb with SMTP id 71dfb90a1353d-51e9e55bbbemr16942341e0c.10.1738685101712;
        Tue, 04 Feb 2025 08:05:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738685101; cv=none;
        d=google.com; s=arc-20240605;
        b=MbAerLliFJ1ueYqAXnAjN1MeKEDBNBYx/muxqMwd4E0KL3rmp0eq9egACUswrr2P6d
         HFn4pzF6ms9WGYSw653knTrJl3xW4Bl3rTYYHFlPeCGenvlkQUSeMBTgMmYpqFIw2qbQ
         Ai1/wND8NqXZy2c2szzWtQOK6GhsWBlJVrIYIgFr9HWMHJoYLRsif5vW2u4+gU8twATY
         N1LwalypabLOcl7YKgOzOe+uy7reJ5SMcPiSI4hCiNehWRPwoiNpfgyMSOHOg+y98p4z
         Ap7+VHZVSyOASEoK7E9TEzgEOfX2MB6dDEWEYhcGK2b3HuZsIIy+SLMLMi0GVffSACwm
         ha6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Okbtc3zy1ExQAS3dQnXD9WnVhEHm18zS9WJrarGNMh4=;
        fh=v8sq2hfXVUCGq+4C8Ng3qsm3w1vZp9y/0ZccxsLtJ/8=;
        b=jE81090MA/ywXtY1R0LOrmgLEexhZI4nGOAgFFOU32gfnnTlmDrkIT91ms7yAEIspt
         wuGsqj2M+UALlAvXI3ebspEIwHfrcl9D3ucN8kE+EfZ7ffGJTkMT6j2kBaKGpQuqb4Hy
         jnJpIVClsUoqmQH97eehtVYtheJA01Xii2ntAQxeeJgcoRjZK3uMxq4zngF5kpHJKXA7
         cyEKhQ2OV+uRLhWGQYAodEyzWZyLr/MwaCwlwcbrHFJ8hMHi9bN1JKa6uOvP4mHnCSrH
         gmVFK3ROhxGc6vpQAbk3E5YqT10Wh4k+iCvqp0xdosmCCAkVcI7uSc4uFBJxrGLa+T/f
         lRwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lb4cMpP4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51f08f5ca8fsi169189e0c.19.2025.02.04.08.05.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 08:05:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lb4cMpP4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfLPz-0006pM-Vc; Tue, 04 Feb 2025 11:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLPx-0006kq-JZ
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 11:04:54 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLPu-0004Jv-2f
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 11:04:52 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e46ebe19368so4944976276.0
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 08:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738685087; x=1739289887; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Okbtc3zy1ExQAS3dQnXD9WnVhEHm18zS9WJrarGNMh4=;
 b=Lb4cMpP4uBYd5b30pEAhwdHw9kuNI8DAU1uNqvvnum+fQNWIVDsEi7YXlyLlvNs9Wh
 XqiJqDbiG32xPbBeJiDfg4jBwUcpNEQ+eLJY40T6HpM4xr3R7LqHsChYw1JAyJc1jEyN
 6VUX7FWzrDmexUK8QRqwiMBX6n4yP2E4IOK5aEKOCWfkcFoA5e8Wi1WMXplZ9zdK5eIK
 ZAqIH0WDGUjJQ7eUKakCD3EgXNkW4hWbGxPuKQJpkVAYxUkY+lp/hDWG5or3xVdfCPny
 qLfeBZLBnoK1a8uPhv+fPWlu9ENlpcQGLwbYIa5K/vOyPWSJJmLkMYmquM08hD9/dNdZ
 yEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738685087; x=1739289887;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Okbtc3zy1ExQAS3dQnXD9WnVhEHm18zS9WJrarGNMh4=;
 b=s2ABp25wvw6lXi0ltpHKegaFhseoy74jOS9dE8gqBPYxlVOs/oAi1lhLGFfYAchYJn
 QRbAzgXr8A8rOgfrLxBm6HwUGcOvBxof4ITkCZPU/UeeopZ78tV8GmAiyA2mO+JP2AXw
 AfJ+fAnEBn0++ix0eGv/Pzr/Gt+o8iVq70d4RKd/YuP/FeL38T369RyOmaRqJ7+oJMPI
 WUTB86RkiuySS32rvk+ytz8e6P/8whE94YwCdScVYMQQa//o7IDmJWJYB5tVx/8Rrfoi
 cyRZmPUBq7wtgSp6OW55Hou7Ofbw6AqcUaMaPzF1wGG0UmMlOw6MPyMm7ACr+zuQ5Cel
 /Qvg==
X-Gm-Message-State: AOJu0YzQwOhKqj64xir9OZRbOZwu9r5RDilk+jPgp2PGeXoD9oxFX0sI
 BYJMKBx/BxLsLVprquPVScddx89Frb91F/Fz/KO1yH1GjCzhUNLVYSFXxHUtA7u2uZ+wyjYlvdp
 HnWkPuHa+JZp5KlVbkT0s/4keq9DVJLZFlb39xg==
X-Gm-Gg: ASbGncvrv+jUB16QxBW7mJis9vKpILHuZcOq/qnS9LWergxqPENZ9RPYcFFFyQcS80f
 EejoKLphykhDQ/IlzMVDMRmNcK9NNf6KLZL74ssVq85XlA5mDG+N3z1oZJv0DlrK2Smkpnqs2Ug
 ==
X-Received: by 2002:a05:6902:200b:b0:e5b:229a:f1a3 with SMTP id
 3f1490d57ef6-e5b229af773mr501424276.11.1738685087495; Tue, 04 Feb 2025
 08:04:47 -0800 (PST)
MIME-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
 <20241226082800.2887689-14-wuhaotsh@google.com>
In-Reply-To: <20241226082800.2887689-14-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 16:04:36 +0000
X-Gm-Features: AWEUYZlvze7u6l_dW4EIGh31GDYXxdpy3GDY_qLGjmmPxokUfJWMi5-FXDWg2L8
Message-ID: <CAFEAcA9hi0+PDh5RvcsCNe3zJGX1WmHVsu0S3_UeeyuJcWV9dg@mail.gmail.com>
Subject: Re: [PATCH v2 13/17] hw/misc: Add nr_regs and cold_reset_values to
 NPCM CLK
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
X-TUID: VrC89vDNlAfp

On Thu, 26 Dec 2024 at 08:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> These 2 values are different between NPCM7XX and NPCM8XX
> CLKs. So we add them to the class and assign different values
> to them.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/misc/npcm_clk.c         | 17 +++++++++++------
>  include/hw/misc/npcm_clk.h |  9 ++++++++-
>  2 files changed, 19 insertions(+), 7 deletions(-)
>



> @@ -870,10 +872,9 @@ static const struct MemoryRegionOps npcm_clk_ops = {
>  static void npcm_clk_enter_reset(Object *obj, ResetType type)
>  {
>      NPCMCLKState *s = NPCM_CLK(obj);
> +    NPCMCLKClass *c = NPCM_CLK_GET_CLASS(s);
>
> -    QEMU_BUILD_BUG_ON(sizeof(s->regs) != sizeof(cold_reset_values));
> -
> -    memcpy(s->regs, cold_reset_values, sizeof(cold_reset_values));
> +    memcpy(s->regs, c->cold_reset_values, sizeof(s->regs));

Same remark about an assert as in the other patch.
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
