Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp413613ejq;
        Fri, 5 May 2023 06:21:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6V09W5lqdtCpWdOyFLfXqFT8MBecpQYEmp5pZwcxLRJvBPRjvDLHZTtn2hZct8Q57QfuAH
X-Received: by 2002:ac8:5c05:0:b0:3e8:62da:5d18 with SMTP id i5-20020ac85c05000000b003e862da5d18mr1884571qti.25.1683292865726;
        Fri, 05 May 2023 06:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683292865; cv=none;
        d=google.com; s=arc-20160816;
        b=OPxON4yKqYKcL82ciiM822ceKyQX+SWT6AC0NQTbOejGe8hpJe65LlLwzNAepOuAIw
         ut3DLWb9hQwq/LntdCmxYCuEjZqBdm1JFQETgVjKEHyzHOY5h2A9HafLh4uh0BI8Vj1Y
         0vGcYKuqZSewahq3Y2BQBbLq6BkuUzxNPuh5wHaQOsL2wWQTDhuEATXq/vBR4HrWBP1B
         E5+d++frYMU4e4NfVxUsgZ3Kn9DqoYeCtYbu7jw52xs9YrjEj02rCXk0kV4ryGw/ifuc
         h0OjPiawGOKfvb5X0yMd1i+gff8PVHFCK+/TvXMtwxxXQ7FI+AnqIyEHrZxOgbqYuop6
         4zZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wOfsIYmGehy/PrmqaBmIeEzKTK4/WjPNoIZKiJF5Ryo=;
        b=0XVE4Ox9cERCs0DioOqnWe3HnsangEyoLijFLpk6iLFdDk3F4QK7MS7jvkGUAeDtIZ
         Pbe2rNJh8Z2AkoiqPhRJsDVJ74BjjIznAFky83bRXGxuy0dg3Y0s0hAWll4d6LqcnXo/
         xIXvnj+zqrVZ9AMRRrtxIxzoAJJxJBBUbJ8C2u0asuAiJE2oxgtAtXlnbYVM/SlKRNBo
         Hc5s4k8qUTAQDCNKUk3RE6mvCg3CrbWUdLqGNeGYq6SgChL5W9i0/NDXieFh/gpKzuwZ
         lfwZEqcFaoU4kxMtKNtRgiuUl1RDoqtRQw0hS6cNE9LrtK2Twb1M7yFW/RqVmwfzrJgQ
         ELWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TLrLp/BC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020a05620a079300b007468eb20115si658525qka.190.2023.05.05.06.21.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:21:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TLrLp/BC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puvMm-0003dK-Cz; Fri, 05 May 2023 09:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvMg-0003YS-FG
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:20:51 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvMe-0006ya-Ol
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:20:50 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bc040c7b8so2712603a12.2
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292848; x=1685884848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wOfsIYmGehy/PrmqaBmIeEzKTK4/WjPNoIZKiJF5Ryo=;
 b=TLrLp/BC2oyO/HPI0ycmB0htMiW2MXTqxSzvSVlYHeI6toMTWO+xke02S/R7TunZ10
 PCuQ3R89MvogknYuM/NsGF4hMNlia2k8GQodnCvisgTzAsPAX6oUmPXVA6e8YOL4UKTr
 a7M5DEtNecbyG2jiY4WUwhExw3K5OYhjlxr/QHGNaXmhFOiO0xYZDrG22VYREy6V96p2
 gnFt0Hcq2U/NEZiayjoVSl1QBdfdWhyYSLM9EStd9ycVk/91WFYxyZhV0Ot/hU///k9r
 qNQf9fY2ckhES3wCJmomHpATCk8MsQo+lfD1TTqP8/KvM3N/U679i4qyqsuG+lSY8lSG
 BG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292848; x=1685884848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wOfsIYmGehy/PrmqaBmIeEzKTK4/WjPNoIZKiJF5Ryo=;
 b=Xeg17b6BUfpVxsEOxUpIUe/zRojBPvE8STwCso8cDwc4wNDYH7utduIVggCTkfLsG/
 0bPTFwgefaqr6vmhzsOs0U4wCOJdZpgzKqpBKYxkFtwCnHIOhtOngdLjUWLc3xmtYDq3
 OLfPY4MNV8xM/VB5fufanlM55va8s1Q0KaSRhW7vK9l9KV27JphSbApxPyIMf9p0w1sV
 VMa3KFARFmGauIfSnoe9pty+cOK60+l5DWjG0FeHKHK2w/alsbE6VuhTz+lv5PWARF5r
 wPafRQoUSDS1k3w8dW0EoLbdWwsuoSK28BGyZgSV+Wyp0VvdVbAKYnnorPNT5mRUxyBM
 wKqg==
X-Gm-Message-State: AC+VfDzTVafWPf6SW+ZAuZD2K4Avbys8eS2J9N65X+nbdTcQHSzeGE3M
 L8FfEPJ13tPEPBLK7cYVUnfyuPq9tSbF0EeK1hBbxg==
X-Received: by 2002:aa7:d71a:0:b0:506:6008:995f with SMTP id
 t26-20020aa7d71a000000b005066008995fmr1390243edq.39.1683292847994; Fri, 05
 May 2023 06:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-52-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-52-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:20:37 +0100
Message-ID: <CAFEAcA-HNQinkZvwCrqg9OQZcQvoL+LeBgfFhHqvWorjye0Xfg@mail.gmail.com>
Subject: Re: [PATCH v4 51/57] tcg/sparc64: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: buLQ6LwnnqhU

On Wed, 3 May 2023 at 08:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> index bb23038529..4f9ec02b1f 100644
> --- a/tcg/sparc64/tcg-target.c.inc
> +++ b/tcg/sparc64/tcg-target.c.inc
> @@ -1028,11 +1028,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>  {
>      TCGLabelQemuLdst *ldst = NULL;
>      MemOp opc = get_memop(oi);
> -    unsigned a_bits = get_alignment_bits(opc);
> -    unsigned s_bits = opc & MO_SIZE;
> +    MemOp s_bits = opc & MO_SIZE;
> +    MemOp a_bits, atom_a, atom_u;
>      unsigned a_mask;
>
>      /* We don't support unaligned accesses. */
> +    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
> +                                    MO_ATOM_IFALIGN, false);
>      a_bits = MAX(a_bits, s_bits);
>      a_mask = (1u << a_bits) - 1;
>
> --

No changes to HostAddress struct again?

-- PMM
