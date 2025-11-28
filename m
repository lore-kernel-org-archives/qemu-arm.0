Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DB1CFD376
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Nov 2025 09:32:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOupN-0000bm-8Z; Fri, 28 Nov 2025 04:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vOupL-0000aS-Io
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 04:31:43 -0500
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vOupJ-0006uV-S0
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 04:31:43 -0500
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-63fc8c337f2so1508137d50.0
 for <qemu-arm@nongnu.org>; Fri, 28 Nov 2025 01:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764322300; x=1764927100; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VS+fFN04bnuMi6NAtG5NzMdq7p6a0VRK05Ap413lUYk=;
 b=N5N1pcT7I9jSO7fke36MBC5RlpLa04yrpFipa8s5Ya2kV4n1QI5qiTwc3bPd4SwSXq
 39I/xlBKFP5hZZXCLPjVnznMbNgyLzp5e3ze3c7tWHWVlBd0/72k3DkHQxnd3gqNx8jy
 ESEXGl4anYs2Jqhaaoc3A/4Tb00kJYnZQOp662ujOMbqCnnk6r7fzBMUtMjSzVTCma7X
 ccsK03qwI1ff8HI1eI7wFc95Wm/1nlw7wgIlKZTFZvRmx5TXTVkHkxz/b7n77SXTkyRh
 SBdtQL7RZjpx7KdCnSkQbt8HNEaCItpE5afUkGKKxx0KxxNVtWf6v21vm48x4zz5IN9E
 sD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764322300; x=1764927100;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VS+fFN04bnuMi6NAtG5NzMdq7p6a0VRK05Ap413lUYk=;
 b=K4u75L3zDZje5ZgtomAQAJjc/FiOHSwKFcXuJP5Ip30FxKdYiYSfzvYugc+WCGpfHo
 pu7j2XC3564+9jen3F1g9NGUU8BJL49WwNalRxJ/xPedOnzMBRS1JLqqteWhbzL12+YV
 W8WZCCuA+Q3oC4cpm1sAQhr+xYML/PK+GFj90k7gTLmi+7Xhfo8ZdLzDGadYYJEjZdtP
 sEx56ZjWOin6Yls/AYVQmCD0NyqgOlYQH0RIAyN0OFUOvh9ij3jf8zfX9PwfeyR3labE
 dA7cOg842ahzNONnV3F/MdDLjW5HzMY9pBcg86393fUCyMC99Rk8+NpftRVz8yLKoQEH
 3q2g==
X-Gm-Message-State: AOJu0YxA6A5DWN6VzmAlbbuh++o2xH4CbpoVECf+hfGgji/lQ2AInWQm
 uEdHdiz4OXYo6HIegOXSSXOy7NEvoJaO9NWYkqgRlu4d18Dn6mzjS/UKZhwsDt9Lel9O5QNY3o8
 R8N4VRD3YrQrKDQNN8LrlZEXwOdYVXvZHdjjF499LvA==
X-Gm-Gg: ASbGncsuwCgHiZPp9jua3eXaz5UlewKkrD648ybGFf+YpfoRPmyInoVUv+UDY0xm/JN
 Qtfm38aFG3rjDAPM9WdaQmGqcy2p97p0naiC/QmC1xx+jjtr2DzgVUm4SCcsPQn9DwpwYhN0xg8
 Brw+mUiw3Y5nCcrsH7CZ3krMNi+amu9oPFq6rAfoX7U3Clkkc5n+NkgbRoe9XFNLgEyxEQ9yvID
 wgFIpFFoKN5cj0y2B91Oh0LVEuSV1kn4eQ5f0DLu9lSnFTpnim3XX11CcqHyFB9jxR90Pem
X-Google-Smtp-Source: AGHT+IHPv0+2uHHl9KK/iJgzTT3FCYtPlB2owDK800JQpL0UnCImrQETYZR5vz4E94Xh/o4yIic9ZXC+mQB/ACUDJck=
X-Received: by 2002:a05:690c:7484:b0:787:ca0f:2687 with SMTP id
 00721157ae682-78ab6efdda1mr218975937b3.34.1764322300309; Fri, 28 Nov 2025
 01:31:40 -0800 (PST)
MIME-Version: 1.0
References: <d2265ebb-84bc-41b7-a2d7-05dc9a5a2055@accesssoftek.com>
In-Reply-To: <d2265ebb-84bc-41b7-a2d7-05dc9a5a2055@accesssoftek.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Nov 2025 09:31:28 +0000
X-Gm-Features: AWmQ_bmndgwbsC0udVqpm2SRvQ52lFI4RE99hOhD-SXdMPDnkbqbc0PgeReRL8Q
Message-ID: <CAFEAcA8j6sAmm-uT9LdDt1VP2fWmui9ETXn90bDWbCh4aEMG4A@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Fix assert on BRA.
To: Harald van Dijk <hdijk@accesssoftek.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 28 Nov 2025 at 04:38, Harald van Dijk <hdijk@accesssoftek.com> wrote:
>
> trans_BRA does
>
>     gen_a64_set_pc(s, dst);
>     set_btype_for_br(s, a->rn);
>
> gen_a64_set_pc does
>
>     s->pc_save = -1;
>
> set_btype_for_br (if aa64_bti is enabled and the register is not x16 or
> x17) does
>
>     gen_pc_plus_diff(s, pc, 0);
>
> gen_pc_plus_diff does
>
>     assert(s->pc_save != -1);
>
> Hence, this assert is getting hit. We need to call set_btype_for_br
> before gen_a64_set_pc, and there is nothing in set_btype_for_br that
> depends on gen_a64_set_pc having already been called, so this commit
> simply swaps the calls.
>
> Signed-off-by: Harald van Dijk <hdijk@accesssoftek.com>
> ---
>  target/arm/tcg/translate-a64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 08b21d7dbf..cde22a5cca 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -1916,8 +1916,8 @@ static bool trans_BRA(DisasContext *s, arg_bra *a)
>          return false;
>      }
>      dst = auth_branch_target(s, cpu_reg(s,a->rn), cpu_reg_sp(s, a->rm), !a->m);
> -    gen_a64_set_pc(s, dst);
>      set_btype_for_br(s, a->rn);
> +    gen_a64_set_pc(s, dst);
>      s->base.is_jmp = DISAS_JUMP;
>      return true;
>  }

The commit message on commit 64678fc45d8f6 says
    The set_btype_for_br call must be moved after the gen_a64_set_pc
    call to ensure the current pc can still be computed.

but I think that is incorrect and it meant to say "moved before",
because the actual code changes it makes to trans_BR() and
trans_BRAZ() are

@@ -1521,8 +1528,8 @@ static void set_btype_for_blr(DisasContext *s)

 static bool trans_BR(DisasContext *s, arg_r *a)
 {
-    gen_a64_set_pc(s, cpu_reg(s, a->rn));
     set_btype_for_br(s, a->rn);
+    gen_a64_set_pc(s, cpu_reg(s, a->rn));
     s->base.is_jmp = DISAS_JUMP;
     return true;
 }
@@ -1581,8 +1588,8 @@ static bool trans_BRAZ(DisasContext *s, arg_braz *a)
     }

     dst = auth_branch_target(s, cpu_reg(s, a->rn), tcg_constant_i64(0), !a->m);
-    gen_a64_set_pc(s, dst);
     set_btype_for_br(s, a->rn);
+    gen_a64_set_pc(s, dst);
     s->base.is_jmp = DISAS_JUMP;
     return true;
 }

which move the set_btype_for_br() call to before gen_a64_set_pc().

So I think that we just forgot to also include trans_BRA() in
that change, and your patch here fixes that.

Richard,  does that sound right?

If so, this should be:
Cc: qemu-stable@nongnu.org
Fixes: 64678fc45d8f6 ("target/arm: Fix BTI versus CF_PCREL")

and you can have
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

