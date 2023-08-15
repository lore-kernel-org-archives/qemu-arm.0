Received: by 2002:a17:907:1051:b0:98d:b2f5:1316 with SMTP id oy17csp322120ejb;
        Tue, 15 Aug 2023 06:17:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIPMcRvtcwS9aZXLMi+WQDqglCYZ/tnjdR6Gkhfc4TJjfDLjGHxNWpu5UZSkFZL06ov7/v
X-Received: by 2002:a05:622a:1a8c:b0:400:9896:b0fa with SMTP id s12-20020a05622a1a8c00b004009896b0famr17163995qtc.64.1692105453111;
        Tue, 15 Aug 2023 06:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692105453; cv=none;
        d=google.com; s=arc-20160816;
        b=TMy6zTY0F20jx6qMfee6ueqAUFn9o5wc3+ENPBBVg/dSEnmV6OC5ZrgGfTTO6Q9nuy
         Gl1cFAs8gWGhGHg8pWjydZNXep5lfCeDZRm7IUUgUsuExIYnUSs1mdn9QDOPDGtYT4Wz
         NoWXO5km85KJAhd0U3efh8ZqrSxKa53qXioTwH8SQXLF9wq/Qaoy9uUXX/c5frztbhlT
         wRT7gsjKlSwdAltV2CsDLlLLtQRdVRb6ZZ8U9SNu1MO03T99CmqCHxjmCNbxyJ3G3+pF
         cc2O4FSwUI138T3ya+CMOtV02ke+IDutTeTa9ZpRPusBcBUMBcDJ0gB2JHZZJ9ZziFAe
         9jGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:references:to:from
         :subject:cc:message-id:date:content-transfer-encoding:mime-version
         :dkim-signature;
        bh=qVSa4qXgqWVZIMisRAUommjP0uNr9HTxFMlIlnxO6L8=;
        fh=MopIaDvVmttervARPDcqYgrEisCn8EDYvYmD6MDcdVg=;
        b=Kyg55bkX2V2AMyDa1KZi7vePHr4xePNL16eYTlaPEijGnfV98NJPjtqKZRHeHEEiFv
         8+MCJdwazyvEOBKylKGPCJgv497mgfbZ6y++3pcdDDX8tBFJvum7aNdWo/iPSq4ymasY
         gFtxXzPnuIiq1EUVRST56VMCEgqx9ENGzsucBChOs2+QszfQYeqfh9c4z5v12yKtBYQ6
         a5cJeJbPOQNnXElHAS1DnrpnFQGCyh4XMlUNIglSEE/xmeoHh6uZa5K1BnPlAffN3gbe
         QN6uywzGALlWNo7XJ8+HM4gUvFTGHo4muxRHe0YvMXRPMEqORcHLM2x9o+/LTuvnr5WZ
         XpuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=dGXymLO4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05622a038b00b0040ffe0db808si7300318qtx.802.2023.08.15.06.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Aug 2023 06:17:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=dGXymLO4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qVtuv-0008Ep-LS; Tue, 15 Aug 2023 09:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1qVtui-0008AK-FF; Tue, 15 Aug 2023 09:16:48 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1qVtug-0003Ct-5m; Tue, 15 Aug 2023 09:16:48 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bdaeb0f29aso27315315ad.2; 
 Tue, 15 Aug 2023 06:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692105403; x=1692710203;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qVSa4qXgqWVZIMisRAUommjP0uNr9HTxFMlIlnxO6L8=;
 b=dGXymLO4yM4odbqQ0YiTZQQ5JmuD6WkQglZs7Yo/1ooICWGMm4q5xT1vjqL36eUwJO
 yFCGNrtONM1RS13NoNvCfolJHs1x9Ugj24okyFKLUYqkUkaqup8AYJMCUDcnENS7WL6m
 3btXT7Dk+XbPW6/k6ewJwM6KPPlA1gXPmhcWYc7pq4N/dBtKyXhZXsA06OJwMq+hRdpF
 GI9deZ71XhP7vGTdUn6LMSz3nlJ8TrDvFL1OmhdFj+0NmEjSt09smCQAutqXCHwQfofR
 VUn0bUOz0w0VZV49aGtog1LsirfkXW4ZKmJcDNuBu9gDlGmVNDrLRJZul2+oZk6UALIK
 MIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692105403; x=1692710203;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qVSa4qXgqWVZIMisRAUommjP0uNr9HTxFMlIlnxO6L8=;
 b=RNtPjoFTSpk9dM1+FXE6JQljsPbyH745PvsqebgQj72jGOvj2U/Z0IDhU/0U+9MdDi
 zigvQAxZ1usiijwbe4cBacBeG6WLI2/JorN4NJTDB3yrQ57a8AeuPJca3mR+vgDu4Xj7
 DCrYTk48nREuIvO+vbldYoe4gprBkPWsf5RHuDlSncASkxea0ZjKZIs0L0UmZyI9HhTT
 COAuXvh/Iv5EguXaA50RMT30dNXX08nrWRXXt8nE0FWnOcnnWkq6r7lD9uNOPBN9OBAR
 gAXVHLEC9F56SEf+g6L68DQkx5JROvbbcC2xQEqYRp/xHTmyJCcKKIo0OLqbMFtgyc93
 0Bzw==
X-Gm-Message-State: AOJu0Yx1ecjODR7gNeT+2t/ZjZZAtzN4ahbMm5z4GTLtVkWhollPpJ35
 FU57946lvSsN+W5G0rSjqCg=
X-Received: by 2002:a17:902:f54a:b0:1bc:9c49:f8ce with SMTP id
 h10-20020a170902f54a00b001bc9c49f8cemr12555258plf.4.1692105403251; 
 Tue, 15 Aug 2023 06:16:43 -0700 (PDT)
Received: from localhost ([61.68.161.249]) by smtp.gmail.com with ESMTPSA id
 c13-20020a170902c1cd00b001bde440e693sm3852092plc.44.2023.08.15.06.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Aug 2023 06:16:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Aug 2023 23:16:37 +1000
Message-Id: <CUT5AWDY5WRS.362R9H2YEA1CQ@wheely>
Cc: <qemu-arm@nongnu.org>, <qemu-ppc@nongnu.org>, <qemu-riscv@nongnu.org>,
 <qemu-s390x@nongnu.org>
Subject: Re: [PATCH 11/24] tcg/ppc: Use the Set Boolean Extension
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Richard Henderson" <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
X-Mailer: aerc 0.15.2
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-12-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-12-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: Nj+z99mq1kwx

On Tue Aug 8, 2023 at 1:11 PM AEST, Richard Henderson wrote:
> The SETBC family of instructions requires exactly two insns for
> all comparisions, saving 0-3 insns per (neg)setcond.
>

Nice patch. Tested on a POWER10.

Tested-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 10448aa0e6..090f11e71c 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -447,6 +447,11 @@ static bool tcg_target_const_match(int64_t val, TCGT=
ype type, int ct)
>  #define TW     XO31( 4)
>  #define TRAP   (TW | TO(31))
> =20
> +#define SETBC    XO31(384)  /* v3.10 */
> +#define SETBCR   XO31(416)  /* v3.10 */
> +#define SETNBC   XO31(448)  /* v3.10 */
> +#define SETNBCR  XO31(480)  /* v3.10 */
> +
>  #define NOP    ORI  /* ori 0,0,0 */
> =20
>  #define LVX        XO31(103)
> @@ -1624,6 +1629,23 @@ static void tcg_out_setcond(TCGContext *s, TCGType=
 type, TCGCond cond,
>          arg2 =3D (uint32_t)arg2;
>      }
> =20
> +    /* With SETBC/SETBCR, we can always implement with 2 insns. */
> +    if (have_isa_3_10) {
> +        tcg_insn_unit bi, opc;
> +
> +        tcg_out_cmp(s, cond, arg1, arg2, const_arg2, 7, type);
> +
> +        /* Re-use tcg_to_bc for BI and BO_COND_{TRUE,FALSE}. */
> +        bi =3D tcg_to_bc[cond] & (0x1f << 16);
> +        if (tcg_to_bc[cond] & BO(8)) {
> +            opc =3D neg ? SETNBC : SETBC;
> +        } else {
> +            opc =3D neg ? SETNBCR : SETBCR;
> +        }
> +        tcg_out32(s, opc | RT(arg0) | bi);
> +        return;
> +    }
> +
>      /* Handle common and trivial cases before handling anything else.  *=
/
>      if (arg2 =3D=3D 0) {
>          switch (cond) {

