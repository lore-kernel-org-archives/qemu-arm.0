Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2879373njk;
        Mon, 2 Dec 2024 06:32:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVQ9k5nGwBVxQNnu8V8izR+BX6J6Opnfswb238B5xkWvI50tfLHLJai6lAi8YZSV984zyOmCKJFJ/XDPQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEfGPNGCjWB7t90LwUZWtvDFR0Y5laQSV40VEIaY56kSkB+NKdxnj79hhrNSpCBl+t6pFeZ
X-Received: by 2002:a05:6102:32c4:b0:4ac:fe47:1bcf with SMTP id ada2fe7eead31-4af44a66ef3mr28306175137.24.1733149972377;
        Mon, 02 Dec 2024 06:32:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733149972; cv=none;
        d=google.com; s=arc-20240605;
        b=NVeiZQQcm6kGuLMtCqmz/K4QaoyYdk9dzayeK0UpbYwKISfgWViUlBauXw46gIQkTy
         Wmxwb+rDUhjN5c31M2yh/If7uI4nVu92C/8fvu4EVtB9Hjo4drTYc77WcG1JEdGgFPYK
         7OhTseQFq6WJECh0qK8cFKS8ec98eC7x0muCrqCPmgJ2byrdR5JMulTLnIk9kRQeFYp7
         LC4wqVY/AdFbXOf/c8tyRcRqXs+czBJLBaE0z/9wAjfiU2eSYjTrFhacus9D8R1yWPGM
         Xpi8293HwBhVjtEtqPNXT9CzC6tMs+AfIc/4z8AU1pqegtV5KfW/4eZWn4qs2IwGq3rZ
         3WQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DJXfFbP9yKwUSasMny5GASk9Xvb86L3rQnSXjqCmMkE=;
        fh=Zaw5FcNJfDTaoBDqsxlSX1SK9Z93VEKldVw8zjymo3Q=;
        b=PcgZ/7tTCHO3K8uoy0jeMWfI6JI+3TijoNhQZboNOPV/POUmNP3kEFMpQy2+jMD7Vr
         Jo/CCV6v1rOAV9jjliQaxF4ctvoWfGs9hNNgkUg3iIWFZHLZwp3PftSuF+Upptt/isNY
         W9cs7Pyzp9/0z/2w0CgwKlqU7JGF4MbMHyCEKNrtVPmyJrKnvewReqBwRfQuKSPCxmJU
         TSIuRak2HG0NudXhMrDEBPtsSiR0gm+rENyZcMk2xgteJkbX7zLSR4QJi7d6f5WYlkAa
         ABKD4QtC7RKZcWUAgm/HDhBUuXZ53bYvX3ifUd8GiWeZ0e1fOCysf+RpFhHOxhFkmWlM
         0+1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lwnbwlB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af593a3953si4075593137.613.2024.12.02.06.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 06:32:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lwnbwlB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI7TQ-0002Ao-An; Mon, 02 Dec 2024 09:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tI7TD-00026e-K3
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:32:15 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tI7T8-0003q4-Ni
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:32:12 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d0d4a2da4dso2362383a12.1
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 06:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733149926; x=1733754726; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DJXfFbP9yKwUSasMny5GASk9Xvb86L3rQnSXjqCmMkE=;
 b=lwnbwlB+5rcqisxiCpsKngFDMJjb9sSVEYYoYdhjTvnw9wPECPqXiS+5pk0j9iSSB0
 0WNr87yN10XVikdp99QK8ZPQNrafUlOmr5OX/+MRPvQ3F8lO4ytL7L8UlK+pDRO9RbsI
 aKqhOiwxD/6JleoD9WJ49OpJaG16o594xRSv+3hG+ZFbZa7fZy+htEr9t0pb2jqjoHhT
 acinEwZvZsMD0nr9BED6mWp/rNhbdDFzpB4T8JYcBBm5QKVw4REVQ2lw83Zv63SR18rg
 LZrjvCqwid7Q0+GtK3aZlKOvrKqNKkL8WVEk90eskjvqFRzYiimDNax1ETqUChhGJtru
 j9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733149926; x=1733754726;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DJXfFbP9yKwUSasMny5GASk9Xvb86L3rQnSXjqCmMkE=;
 b=mWziGs6R7LlrD20YDNAD1vb+wuDu0JlVjC0uSYPdA4z03d03cOMqSEyVJfaZINZIpQ
 mJYN4RV4DZw57HqghLmwYBuumOg+bG5zftR3XNc+8L4F1bJ7mAIDXuX0Djnhx9IcXlCi
 TRQuXymSOQNCJRW2kdqZV2uyF+iWx+3F8klUjhY8tJe8C8/kFMIvCb1AYNMO4LtWE3XB
 U8uGxlYOTSLnFSxZE1nkQ5asH9BaV4XU6oh5Q70gcbYzpaAXhh5GsrzT4/CaBDZtgid1
 Aty6bN1PtWRk8Euw+cRHzecDYjZxeHTJqDDxWT86PVGJXAKK0D98k+NggcidkYtdts7G
 cnlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYC19J0VOExYACs+ZeFjs2xjDj4+bTNo5HrKl7YQEf88EhGClcLSsUwj70eK7+mcWIr5/Po96QrQ==@nongnu.org
X-Gm-Message-State: AOJu0YymURh+Zz0RcdcFLLUTCRrzhEAYxa1iYP0EEF/cZBLFK+bbmrL2
 V62ZMnR3EjWPBPGr6z5MAJVHx66meHP7S+ngQdtNNM7cJ5Mk0u08yQx7koffg/O6JEWOzuRGrgU
 RHQLfjs0JzsvkI5M5NVnVvKsFnDISMBcnxkpWJQ==
X-Gm-Gg: ASbGncuCL3baTTaSDSWeqqxVaV4V51o26O4LFOSYBet2SYKjttSfmttJzNGouyJa6gR
 lbK9f9lNxf7rep2JLhRfKeqltcgIsYAi8
X-Received: by 2002:a05:6402:4015:b0:5d0:9081:7929 with SMTP id
 4fb4d7f45d1cf-5d09081793dmr22024320a12.23.1733149926145; Mon, 02 Dec 2024
 06:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20241102125724.532843-1-shentey@gmail.com>
 <20241102125724.532843-4-shentey@gmail.com>
In-Reply-To: <20241102125724.532843-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2024 14:31:55 +0000
Message-ID: <CAFEAcA-mLhGeLmtnGjpgVFoMdSwZPRpOMsMtFuEoPkDD1H_q5g@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/net/lan9118_phy: Fix off-by-one error in
 MII_ANLPAR register
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 Guenter Roeck <linux@roeck-us.net>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: 8PzCS8BnISCA

On Sat, 2 Nov 2024 at 12:57, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Turns 0x70 into 0xe0 (== 0x70 << 1) which adds the missing MII_ANLPAR_TX and
> fixes the MSB of selector field to be zero, as specified in the datasheet.
>
> Fixes: 2a424990170b "LAN9118 emulation"
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/net/lan9118_phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/lan9118_phy.c b/hw/net/lan9118_phy.c
> index d2dcd732ac..d8fc9ddd3a 100644
> --- a/hw/net/lan9118_phy.c
> +++ b/hw/net/lan9118_phy.c
> @@ -54,7 +54,7 @@ uint16_t lan9118_phy_read(Lan9118PhyState *s, int reg)
>          val = s->advertise;
>          break;
>      case 5: /* Auto-neg Link Partner Ability */
> -        val = 0x0f71;
> +        val = 0x0fe1;
>          break;
>      case 6: /* Auto-neg Expansion */
>          val = 1;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
