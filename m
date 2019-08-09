Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9484939wrv;
        Fri, 9 Aug 2019 10:43:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyF/dZej9yOJIfmOC2A14LmVcO/JTYkv/pzR/NGhVERZUvGCZtvKKrNb/+v7RVfJpoadiZh
X-Received: by 2002:a37:67c3:: with SMTP id b186mr18001248qkc.320.1565372625147;
        Fri, 09 Aug 2019 10:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565372625; cv=none;
        d=google.com; s=arc-20160816;
        b=kl5auV44pkvjWWmBrXuvdmR2rJjjl7qVPniJoJIiSnt7yNDnicN7pBJUhW5vdfKpU3
         6UJkIGEcnerG56lyp+8mPE2azA0pAb8ebIYuVvGPEdQlG3V0IxX0GrvXgyAhwmaqj/LF
         EVXLPABAr1dutiRK4oDxfrXEkH9ASzJvG8qTdHr4+/61Tv7IrdNb6YGi9nbG1eW1A2zw
         xm5pqZJ2F8Z1Pm+nD/CfJYAObFrRM+j9RIUb5wP7MsTJO1KJtzAig2axzCmSrzbkS2aU
         JnWIVAQhUxDN4MbrzfAV2/h5JHTNsDjY+rSUNg7GkEFK+joIj5IePMg84Rai4GSqeS/R
         OoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:to:from
         :in-reply-to:date;
        bh=07JExv6ZKm/0/r6jVytCO72hcMEV9YwwdZoI/h2qYCI=;
        b=KUbOkOjveukJ9POrbBpckDZVXdaESXwbG88riOa1/uNztGoezC3z4BduIoUffrOBYR
         evspXIbO0noUBZsWyQVx1oPVlg2zaJVxa85JlzzbFbWwhW3QYz+b2hPzxznejMoJ6EE1
         SErums0JXl13WUMde1/l5gsh+uBNLMbwyZ93o9l++N/iMHfhAvetIrBZFTPJ9BFfRfwH
         LKfEjTWRZXD8ba1LXJnDZQXcGOEPJYH1qTvG8zyGHzYKS5M0XzyftAnNx2WjYnSkgn/9
         k/WOzNUoVinGGq4mqj5D7TDpuew5i/YYmHs5XwrXQS0b/BDvXPlSE/0cBn0YBE2vvEBY
         JlXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a30si3374720qvh.197.2019.08.09.10.43.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 10:43:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw8vY-0006vx-OP
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 13:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42591)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hw8v8-0006HL-BX
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 13:43:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hw8v7-0001ZF-Bq
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 13:43:18 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34200)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hw8v7-0001Yk-5e
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 13:43:17 -0400
Received: by mail-pf1-f196.google.com with SMTP id b13so46423866pfo.1
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 10:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=07JExv6ZKm/0/r6jVytCO72hcMEV9YwwdZoI/h2qYCI=;
 b=lA2dNAuG+17cwUt6JcJtg0jQ1rdX6iLOapj/hwv++hiVHhLm17jYJbUdStKzPg3ZFw
 QzSZEB+vcnOeel+BKgDuHk1RDvpBrpAsfUX/LaZKo3AIt9wXbyzRqMCjlEQQAxNA+Bnb
 KAbJPQzFgrRXTOwXCVg31rtIOPdGKqwaveyWaoJdSX02JcMkhtdaxz0k07WJ7GICDS+M
 Yk5L6u0zG4naTuhMmjB78KBo9h2wIKxju67XmU9oTFFtGsDJsIsvZVbVl6prjUW9Dde+
 dV7n5GtJbjJLoKfucYCleIEeHpcp8r3e2PH1ht1yfXAq7oHhHm9aE+C5mzBXXXZqsyrt
 2heQ==
X-Gm-Message-State: APjAAAX5BmZSQ2J1Ak9IdTRtBYziq/VTMOq1Djqn+iXs1+qlgfsWmtVS
 Zo0Ay2s7jBZgzo72D7jckeP+cbEzCow=
X-Received: by 2002:a63:188:: with SMTP id 130mr18316043pgb.231.1565372595244; 
 Fri, 09 Aug 2019 10:43:15 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id l1sm142793234pfl.9.2019.08.09.10.43.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 10:43:14 -0700 (PDT)
Date: Fri, 09 Aug 2019 10:43:14 -0700 (PDT)
X-Google-Original-Date: Fri, 09 Aug 2019 10:42:25 PDT (-0700)
In-Reply-To: <20190809154153.31763-4-richard.henderson@linaro.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-b7c59cf4-b345-4805-897a-bf6a1c2c7c99@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.196
Subject: Re: [Qemu-devel] [PATCH 3/3] target/riscv: Remove redundant
 declaration pragmas
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gIlmLyWJc6dX

On Fri, 09 Aug 2019 08:41:53 PDT (-0700), richard.henderson@linaro.org wrote:
> These are now generated by decodetree itself.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 8d6ab73258..adeddb85f6 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -708,26 +708,9 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
>  #include "insn_trans/trans_rvd.inc.c"
>  #include "insn_trans/trans_privileged.inc.c"
>
> -/*
> - * Auto-generated decoder.
> - * Note that the 16-bit decoder reuses some of the trans_* functions
> - * initially declared by the 32-bit decoder, which results in duplicate
> - * declaration warnings.  Suppress them.
> - */
> -#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> -# pragma GCC diagnostic push
> -# pragma GCC diagnostic ignored "-Wredundant-decls"
> -# ifdef __clang__
> -#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
> -# endif
> -#endif
> -
> +/* Include the auto-generated decoder for 16 bit insn */
>  #include "decode_insn16.inc.c"
>
> -#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> -# pragma GCC diagnostic pop
> -#endif
> -
>  static void decode_opc(DisasContext *ctx)
>  {
>      /* check for compressed insn */

Acked-by: Palmer Dabbelt <palmer@sifive.com>

I assume you're taking this along with the rest though your tree.
