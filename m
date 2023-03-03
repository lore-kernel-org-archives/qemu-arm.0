Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1417800ejc;
        Fri, 3 Mar 2023 10:57:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+2zVyRl8qSAsbQtYG+9c56ghyE70k6vG3lbug1CjtR2lVn691zXRaBMrckbKYm6myJBrPR
X-Received: by 2002:a05:6214:29c7:b0:56a:cf18:599b with SMTP id gh7-20020a05621429c700b0056acf18599bmr4394545qvb.14.1677869860506;
        Fri, 03 Mar 2023 10:57:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869860; cv=none;
        d=google.com; s=arc-20160816;
        b=XEcshia2MM4ZQcQyYMZyNNk7j2GSJIX+6FSXbL1UbaRqim7MGR77uIN/Me/nsgYx8P
         iG2NiAA4ybzs/QjYSkJrWwU8deiHwboUqWeEiNBGbl9Cz4MdGUUPpvXqrJ3V+mX4j5UD
         NBD34itpbYnGB0y+APGvkeTYy6RxxSxUTSpI5Zs8dvncXH1y/laml3LLWHD2G1dh7+l5
         mfjDFuYjRYoWM3jxb0NBD+HiuSzFWrvklbqv3mIvCMUVBSn+hREAZ193q1v8iHOSnJMX
         lliYBgwwWpLOvhGU6IhDXGWdqrnhmSHg0NprZthDTEnceyEdMi2+oVFo+/8gD1E6jZtt
         Bl7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oZ76+ljc+vBjoytTnNZoQcgLmS0FLLWld62xw+br3AU=;
        b=ln7jF/vzz/EBbu4cB3ZiFi99tfMMmhrR2BlUOuH+BX0A94RBw/zKv1CQowVyDCkBAK
         aP8K5YExKwt/AUc3b8hwalNO1oTG4ruwC6hn/9gFciABikbbU60egnkbym8mVLZxCUgM
         IfdFjjZL83YcIZNlStCm6Dc4QFG/1VP5TUGd/n/7efZkOWrc1SV/VN71bDJJoWTZ8Pku
         tTL26D8eCkl7P0C5OfWoCAzsCC9ykrISL15zrCMoJbyy3qDbworYGgKZ6k7IWFP89ORI
         aNrpbGXBNs29fhfRM/7ou+aDWAqkgDy30ShuaTcpH9yK5h89+NNTUR8XmdhDuoqIRpNg
         Om6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S49icHih;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5-20020a05620a04e500b0070625107dd1si2223026qkh.384.2023.03.03.10.57.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:57:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S49icHih;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAal-0002Gx-Ej; Fri, 03 Mar 2023 13:57:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAai-0002Ac-MP
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:57:16 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAaf-0004mT-C4
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:57:15 -0500
Received: by mail-pl1-x62f.google.com with SMTP id z2so3689935plf.12
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869832;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oZ76+ljc+vBjoytTnNZoQcgLmS0FLLWld62xw+br3AU=;
 b=S49icHihSGSwmnjrYViahlrSAljre0y740yYd6UN4zwtdJCdfr9fRHMi9sdtxv2j0a
 ndJj1d+GDGGYljI7nSb5upk1h3lp30bdU9d//E45ildngxUdGOIgYFmXPZsWl7O/DguV
 5aF+AFa7jgO8UkDkXrb0nzdERNY5APzwzutV5WyQUU7oC09ej4T+HQIOyvkkvGBIkn2o
 89BlTUbdZPSTl9Sec+ye1sJDw+x2pqu1FSNtsc829daa4OT+mw4foe4wNniYeQ0c19MZ
 Hui+w4z8pndyKVhu3GA5xUGqzCn76iP73PyvwesiY4Zwdt2hZHKDjNVi8SNODJ7QlL+6
 BV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869832;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oZ76+ljc+vBjoytTnNZoQcgLmS0FLLWld62xw+br3AU=;
 b=M1rGxvH0M2OpPmSreO+piSoOPqYSLb2QQV4civZDbgX1yYbkpfeOIkaY+f2qk3oEIF
 xiTTSYZnOt1sePhjxt+z6JzFUPTvQpqbAuIWumVAcsuKeXQJlWGGUYRtHc8qD+aUPdPF
 QEMwWXaZdPwKZyMBHLICNlxQM9sUL4yqpek1duCn2sdi28VwJorm4XmuFzDzlfXrtYi2
 aztHbVUdc0ZP6Sbm/CGEt1qqCzd2/bt2BXdWUNEONXZ6EiQ+qppWLPD3eMNWma8gvkJg
 xF5UHAaN/6gRn589Hf0jZI/D+wrGBLf1KpugiKzs0HRXqhRokcpxjDhvA5CEl+Pba/of
 tY0g==
X-Gm-Message-State: AO0yUKUUVtfkkZsE4eLHR9T6XJ7vIi3FSlRt11gGmVuJooEK5vhJj2CB
 iFp5a9y5fmkI662OlaycZfkf+hqY+k5ivbc8Xf90QA==
X-Received: by 2002:a17:903:428b:b0:198:dd3d:59 with SMTP id
 ju11-20020a170903428b00b00198dd3d0059mr1083486plb.13.1677869832105; Fri, 03
 Mar 2023 10:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-34-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:57:00 +0000
Message-ID: <CAFEAcA-ktFQ9JesbmpTOnPOcuuZQbZyN4R86RTZyJsJnj2nK=A@mail.gmail.com>
Subject: Re: [PATCH v2 33/76] target/m68k: Drop mark_to_release
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: TxhTiXG9+Wph

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/translate.c | 55 ++++++++++-------------------------------
>  1 file changed, 13 insertions(+), 42 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
