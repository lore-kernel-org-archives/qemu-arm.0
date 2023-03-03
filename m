Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1431108ejc;
        Fri, 3 Mar 2023 11:10:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+/R33WGu4PIS7irsM0SsiIcJYoZQ3f6NiXhmMGqIJri+Q5laK6DOqScML92AFxfNhQkAPq
X-Received: by 2002:a05:6214:cad:b0:56b:f47b:1cd2 with SMTP id s13-20020a0562140cad00b0056bf47b1cd2mr5137377qvs.41.1677870622580;
        Fri, 03 Mar 2023 11:10:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677870622; cv=none;
        d=google.com; s=arc-20160816;
        b=RrPy/n0z+JRmPU5OjaopM8ml+s4WN0memJdrzKoxeGpkIgLAbUhTnDw3IbUkX5qtZl
         Fb2KVQoSvNFgv1+dNBOqvHEXtwtfafLxy16qupJmq59v+f8aPY2e3zOAqKtAHwjx1f76
         o/up6oTbLVjeKzftMfSXZEw4Tzh55K74MH1HfukpewYp047b/wm7JAjHLEzfU4/kbWHh
         A0hsf5BfxKvhEADl47aCG6Ch6EtBzC9kpZ9g2jdF9m7JMIIShXniygHhBEi2APhNR0B0
         FMKPkHK+o/Q9yrbm0VLM/I0bvjFoxb7eEOWksaGcWNdEnf4W6FouB38zj2CBRx6OKmyy
         SdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0sQhjcqSH8pb/5Rz2U6mXpjIZSWWlhhczVIyOLu/xU8=;
        b=zYXA3JYYTWn/PFWDTA0HgH1+bp8ygBWaqGcBMKGaIQLGC3rgnlQTXE+QaJSWayrJ9w
         Lv6RpbKFf8nAVSnEVEsUBoLggZTk8HQ0zjKxdMmNJ+HlhHcKxvlZm0yacCJGJrluG5TJ
         CsOZbys+ix+9jMp+rgOIGsSiJOjXKVUOOYbfX0xTq698Mi49+xrDCt9XCh5bH2cRDcx+
         cuumrM3twauUuWuWbOE9qE5cRDKkvnTq+2Cj7hyspVGf54MS2Y51Z/zd0Cr91NUwR8C0
         ItC4jjwmwt1USeNVic1qMbQL2dPkh6URpCqIMi1wEiOtmu/uyuU/zqZM/sg/kZjDvZak
         tfYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KJDdj0cw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a23-20020a0ca997000000b0056eb58eedb6si2040384qvb.499.2023.03.03.11.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 11:10:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KJDdj0cw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAmo-0002j2-VE; Fri, 03 Mar 2023 14:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAmo-0002ie-3K
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:09:46 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAmk-0000En-TG
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:09:45 -0500
Received: by mail-pf1-x42d.google.com with SMTP id z11so2223246pfh.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 11:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870581;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0sQhjcqSH8pb/5Rz2U6mXpjIZSWWlhhczVIyOLu/xU8=;
 b=KJDdj0cwh/JLQ2rdLqiK0mL8Vvm9KK91rtRr5rf/vVNpD6FOzT7jS9MAmNo/XBliLN
 /TBtD7UkJ1CKg4iWDUxjdffPVyi8jX1FiARCbGDUeyfSgZFASEyMIr/oMTAF513hlynp
 E2m4mBDKyMIc3E1bzo5lQAdfHs/o0URyDU0wUFfuEa7Z73UC7Uo/byDnGS9bW6mIhXx6
 SbYwc+htXNk4njTtDn+X3xitG2SNrch7cN4yKJkF5iLK4zUMmNeaY1Pu7Pz7a1wbkVDb
 OkBMGQWmRM41n2gDDfrj7CRCa1+R04smm9btLEZdYsIxcP3QzNS5nEUWHjoGantOeQ68
 svNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870581;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0sQhjcqSH8pb/5Rz2U6mXpjIZSWWlhhczVIyOLu/xU8=;
 b=RABCKZAxv86zv7gkZ6HxhlizBCQVNlJ7D5FARWM6YYfqFJU8ohlxq1irK00qTagbJ2
 C7jplSl2APZBEwfv3SYWnJjxUMhRMpl+BUXlW5GrgsvB3AU7/Ya4gP1H+jzMKdhSeH6f
 cyBPBzFvlM4idWESFvpyT6B6Iof8Um055fnASq4EfMJFsjnq7u7U0WgLX9ViAVK1+6mt
 4/E5cerymH6icihqZ51uJ9ReuYjM/GyloGIpyNvXpB1DzVfXBUQEj1w8wHVp0PGCc0sv
 zN7VIb6SSsZjrVi41cfOt1jG5aPbzdsO2OiSZDeDuqcO8xOdSksZ4LaZJyOdszd2+5gt
 fNDQ==
X-Gm-Message-State: AO0yUKUOswt7J1TMETWcprP7SS3K3VQSipMpmoyroWpA3P+JfJp0gq27
 2VkOIRKWKSrNkAZf12pxrM1FOEaV1OTVDofFQmws/w==
X-Received: by 2002:a62:db45:0:b0:606:653c:f19b with SMTP id
 f66-20020a62db45000000b00606653cf19bmr1311414pfg.5.1677870581040; Fri, 03 Mar
 2023 11:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-67-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-67-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:09:29 +0000
Message-ID: <CAFEAcA9XfB2DX2Qw5mgVbJRumDuNb90VwpXGvR2XeKD8XgXB8g@mail.gmail.com>
Subject: Re: [PATCH v2 66/76] target/sparc: Drop get_temp_i32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: M7c37+w0Cg6K

On Mon, 27 Feb 2023 at 05:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new_i32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/translate.c | 25 ++++---------------------
>  1 file changed, 4 insertions(+), 21 deletions(-)

Left my review comment on the v1 version of this patch by mistake,
so just copying it here:

> @@ -5762,14 +5752,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>      gen_exception(dc, TT_NCP_INSN);
>      goto egress;
>  #endif
> - egress:
> -    if (dc->n_t32 != 0) {
> -        int i;
> -        for (i = dc->n_t32 - 1; i >= 0; --i) {
> -            tcg_temp_free_i32(dc->t32[i]);
> -        }
> -        dc->n_t32 = 0;
> -    }
> + egress:;
>  }

Stray semicolon after colon, or does C not let you put a label at
the end of a function ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
