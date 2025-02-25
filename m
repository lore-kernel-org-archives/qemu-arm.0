Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp223701njg;
        Tue, 25 Feb 2025 05:50:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0csK6U04uOe5ZXPJJc03jdoyScNREHkisu54gJ6SNqxybkma2Aa6yZwshuhoaw3q54dMh+ICuJZbKIw==@linaro.org
X-Google-Smtp-Source: AGHT+IGbKzbn/q5S9kEKoSnAMAaLYNDyo4IparnhVg7nt1UxBcNeCEwmInJMN3BHNVo63oQn+UxM
X-Received: by 2002:ad4:5f8b:0:b0:6e6:64e8:28e7 with SMTP id 6a1803df08f44-6e6ae7f7d4cmr219877826d6.15.1740491420255;
        Tue, 25 Feb 2025 05:50:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740491420; cv=none;
        d=google.com; s=arc-20240605;
        b=FUGjiCz9/WnDVu3O8KwZQ0mXdrKLFKqb/BhDKHAEAqw9krrAk7YZ1A5B+BoMb/NXi1
         bsJ1tZtRLlDedjiXC/gv+MTnO33gg2GRkS5s+9c2lJlYqqBCa451OpNI/zFOn1yd6vBM
         YADQAtmbFWbNDbLHOIW5ouX1c+bLQ0RMkqft18uUJKQKX3qNEgoXkO+Jpne4B14daLfm
         HAUoO8d50wWXef/HEBC4u8SUbVSa7N3a+Sy6VEQM1RRMlV9ounhU1t/6wIvFykXc6m1s
         b4Zup8DALqWgCHoHnBCJNDNCUIO9y77VEaSihnEaA7H2zDqXvMjE512im9XEHKmxrdnn
         0SQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jNd7r7LIozbeBPZN2JJC/ZHmac4FW1Rw2VceOm+nyZY=;
        fh=pWNRCrO7QgUhVJ01Lpet3L5YxckoNzFcVfU87ZsjmfY=;
        b=cjmKPLkePQsO9xfByK0EA2b2y+F2IDmRV5594YwEN42f5YzwwimArvgHwMTwAAia8p
         K0AHbpeszzTyQlMCfWqrKqORrppGhbr/zEoVPfGms+/T4V/tFcDKBINScBBvfDwStywF
         sNoFr+0TYniVkZfRCaRpBKIhE0yRxGrxmWVkeEwqz4PJGSicrPc9qI0kqZrAQk15y0q6
         zLHVKGLDdHMFG9nSPW8zJC+XplmKHrECmO/UbOY96oEUUFpsJ1EFrWG4uERLRneNmyxv
         Y+arvpHqQ9n2sjMhty7VLsihCoR/U++PHQiFDZRPCn8hRuvwYQqfQY5WMVGcDoMff4ob
         SR0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIQYBWbs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b0442fdsi17571066d6.108.2025.02.25.05.50.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 05:50:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIQYBWbs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmvJx-0004SB-RJ; Tue, 25 Feb 2025 08:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmvJo-0004Qz-Sv
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 08:49:53 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmvJj-0003Ns-JO
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 08:49:50 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-6f679788fd1so41973667b3.2
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 05:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740491386; x=1741096186; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jNd7r7LIozbeBPZN2JJC/ZHmac4FW1Rw2VceOm+nyZY=;
 b=ZIQYBWbs2IZ/uPe55Gl4QP5ew5N8VH964XdRJEShqbuw9DOfTIZzvs+RYkofSZmJ+i
 tiKHUSsCcYHif+e8f/5q+unEMfdl3aGYu7VTQT38ZezUxSYXMEI++GSuEFC4VA4ps1cF
 KqJ9FhLRZvpj80DsebJfsiKQfNxRaPvy26Fj3vlnNTr3lmKN+Ik76ry85qEfimJrVdE5
 i9hruxVgZwYWHf1xrxNgnQ5e+JkqIhaPtrC2YwhHdiQAOrHAzIIS9Em1m/5g9gYgdwsV
 FWrLUw7DIMai54SzRD4p0esqX2DV4pUs2GBw9JC4YwQYL4fs1bV36lfw/AKUa/9nVKbd
 Ykjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740491386; x=1741096186;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jNd7r7LIozbeBPZN2JJC/ZHmac4FW1Rw2VceOm+nyZY=;
 b=xCssijTm4dDbL72kJ7LwLclpqPGZV7T/0kIQJ4N9TTNyjryMUSDS191q3VSIrkRXNH
 WP+W0X1Iltet8DjxHeyMiTPoiwQAS+z6GsOmI0mRB+IaQbRvQ9fusxgMMvC96AKpdw+i
 GvKIvwjgW6fO2/81rhJwKY7yStCoBzohaPmzALF6yXgB7d7qKhgv9mBAtvQ6caABgyDV
 vALiRHnbkIw0Vx8kU2n35tuH1dV1/rOr3b8bpJqRBlhXUYERYFsUs3jCFevicqOojOUL
 DTte/bP9T6uAlOt7rMzrtlQrKUcniZudcDknGHKMHth0LIYA4Bt/t5DRF34J9OmkN7EA
 Xbug==
X-Gm-Message-State: AOJu0YwHu7hJUn74mjALXLcpabVOgKmjYUpgMpime7cEwwpwXnJrx1jL
 beCzX36X6UfkG1aJNfAwcAX8yycvRzbGMaqJO92YTUV+Ck4KcDNw0vJaf3ByokL4YmrtmgGJvco
 0L9eRSxbfJr59elF/JFIX6IVrpLmy2ku9o8Mk4g==
X-Gm-Gg: ASbGnctQm0KO/ljw7J4QSH5+RsMJaFXYPPzo2tNaoarGBbiZfWpwanFs1w0eqnf8iR9
 YyqaJTp6f71wRjbErezrRafcNxyCIp1tdnbqb7qc/YNWsSG8uJnIszdoZsBqGQrxbF7Psj6Lonz
 wOX0vu06jc
X-Received: by 2002:a05:690c:6f8f:b0:6fb:949f:117 with SMTP id
 00721157ae682-6fbcc23a67cmr139014987b3.12.1740491386053; Tue, 25 Feb 2025
 05:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20250219184609.1839281-1-wuhaotsh@google.com>
 <20250219184609.1839281-7-wuhaotsh@google.com>
In-Reply-To: <20250219184609.1839281-7-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2025 13:49:34 +0000
X-Gm-Features: AWEUYZn4xpvywFMJ5yLFnI7bhWeRlqomFp54fvHSlV3BjBlArIhXCY8Qe0FK8j8
Message-ID: <CAFEAcA-KggoS6oUO9h0iGCy6ZDGTLecqBE_1ujsQ2cVcrEqUzQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/17] hw/misc: Add nr_regs and cold_reset_values to
 NPCM GCR
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 titusr@google.com, chli30@nuvoton.corp-partner.google.com, 
 pbonzini@redhat.com, jasowang@redhat.com, alistair@alistair23.me, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8XY8YfHsSo4q

On Wed, 19 Feb 2025 at 18:46, Hao Wu <wuhaotsh@google.com> wrote:
>
> These 2 values are different between NPCM7XX and NPCM8XX
> GCRs. So we add them to the class and assign different values
> to them.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>


> @@ -156,10 +157,12 @@ static const struct MemoryRegionOps npcm_gcr_ops = {
>  static void npcm7xx_gcr_enter_reset(Object *obj, ResetType type)
>  {
>      NPCMGCRState *s = NPCM_GCR(obj);
> +    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(obj);
>
> -    QEMU_BUILD_BUG_ON(sizeof(s->regs) != sizeof(cold_reset_values));
> -
> -    memcpy(s->regs, cold_reset_values, sizeof(s->regs));
> +    g_assert(sizeof(s->regs) >= sizeof(c->cold_reset_values));
> +    g_assert(sizeof(s->regs) >= c->nr_regs * sizeof(uint32_t));
> +    memcpy(s->regs, c->cold_reset_values, c->nr_regs * sizeof(uint32_t));

I looked again at this code after seeing the fix to the
similar code in npcm_clk that Pierrick just sent, and this
one looks broken in a different way:

c->cold_reset_values is a pointer, not an array, so
  g_assert(sizeof(s->regs) >= sizeof(c->cold_reset_values))
is asserting that the s->regs[] array is bigger than the size
of a pointer (8 bytes), which probably isn't what you meant.

Other than that, this is now the same as the fixed npcm_clk code,
except that we could do the same as that does and use a local
variable for sizeof_regs:

    size_t sizeof_regs = c->nr_regs * sizeof(uint32_t);
    g_assert(sizeof(s->regs) >= sizeof_regs);
    memcpy(s->regs, c->cold_reset_values, sizeof_regs);

But also, in this device (unlike npcm_clk) we have separate
reset method functions for npcm7xx and npcm8xx. So we don't
really need the s->cold_reset_values pointer at all, because
we could make npcm7xx_gcr_enter_reset() directly copy from
npcm7xx_cold_reset_values[] and similarly fro the npcm8xx function.

I think we should at least delete the assert() that isn't
doing what it looks like it's doing; I'll leave it to you
whether you want to also do one of the other two suggestions.

thanks
-- PMM
