Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A27CD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 13:40:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZU14-0007Uo-Vl; Tue, 16 Jun 2026 09:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZU14-0007Ue-7T
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:39:46 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZU12-0000qM-Mz
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:39:45 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-6606678420bso4785399d50.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 06:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781617183; cv=none;
 d=google.com; s=arc-20240605;
 b=K+5DReUnCEFqh4rbS4Bxg+arWzCcY34/NGonF5CPKcqdjAHXzrgIfbRPmyIk9WlqRW
 e8vLnnZElPZ5UbTco4pa4JUi4MpRww8sdVD3sqgoDlyFOY7h/FXfPphPUc5NbbiyX8Ki
 SCAChuXegjdm1I907nhBgfrWkxRfo53uz00nI2jMUCnrL5imibEITMOevVCuVLz+lU7Q
 wkZXpPfSgiIGDWlx6BxYG1QOsuNbi4RF3yQZIgyUGxYLVhuHD8bvscq7P6Da0ZbQhjSo
 TWeJ9E31cYmSYw4bB1SakzMq4vSiTnCSNbGZzrgofLNkPvt0bHjkCQporWBTlhtxyDFF
 rWBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=GiaeQrlhz4ymFke226tz2gQsOwBB2u4Ruin01X1keuM=;
 fh=bhMT2SwC7zKbepFPKJcw9B8lHVPsSNJVVdFEav28jA8=;
 b=ed0MHpyz4SFzPiE+sQzRoSju+tQeAFnjvy3izywGZudFtKlivMTKfn3XZav2uWqHdX
 Z534Ta3/RAeTTNDmPQTmwjSb0WKBsFAn+z6NLwE4GtUcJtxL0zK0Qdl/dfae57YoK5LI
 Rmt2qAoXqgOvnAzbio/XrGj5ayhnStF2zyKKzGHSCLqmdCgYanFPnnpFGZ2ZISyombPE
 WsoaYlA7J8ris6MH7pZWCgpEj5fyWPr6Dnpg3LBbGLu9vF7wlxwCYk9DbdSNS/YNsTPb
 k/PG/3xFFLGjTz00n7C6cbIUA/XXeCMdnWJvxfNIPqUtVKzOE20wOLFj8mi7DuWBeU0o
 ENPg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781617183; x=1782221983; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GiaeQrlhz4ymFke226tz2gQsOwBB2u4Ruin01X1keuM=;
 b=l2A6nt2pTHCM1MlYGEwZMWmGSjFcFMhFnk1ZYyY7Rqc5XL3z1aFKyQJOaAKrV1TO9H
 sat0YiaG87Y/yGdH4oyMlB9IuadY37deYbFithW5vfnmtLL5VsTcQlaH5WVh3/QTD22x
 2bXHiSLcz7c/Er97cnlr0HhWJHoxKbg5pFgy6+LlVT0j5SYb5ySEhaKsFJUYetFubXwg
 9zLHGP3bongeGCh1ykNtC38l9ENwyhQvW/0PKwuBY50YuQ9TXmBbIYTE8ZWDsNoZTrVN
 kRMh0E+WS+VeAc74Ghoj06MbC3Za5x94vzFfP57cNubfH8IbFW1iG5OmSvMYPD+TW+u8
 bs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781617183; x=1782221983;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GiaeQrlhz4ymFke226tz2gQsOwBB2u4Ruin01X1keuM=;
 b=Wh+VZ+Yt43zON4MBp2BTJPQUCk2BqWA94Ru7MAH/It0sK+B66//lQnmtfKhnEpOxnb
 SeiOX27dJn8U0Z1IacAZ7AifXdja5ZnMC09yBpAaZ6zepRzyyNCJNyRAI+J/6wMkL8VF
 kCfiIc0edd4h+1IQ9a1FQGFgAlte51Cp/nf5ABSUMJsRcJIgwDi6yzl5YwdOW78OzBp5
 CchWIss1+k6lp/cPv9Ji2Pbp8eClBCHv+Vd7mPp8hTLa48P21TT/bjQKOVEomEcgkMMv
 MCWAOmN2TSOUIN9Psp5ofqGaF4Dejk/ZLiFIMff9fBm9cXYm0V/uQFKqMoguXw3BLNkI
 8/fw==
X-Forwarded-Encrypted: i=1;
 AFNElJ87eJiQL9d20mamb53AxIbzwEmR9zRIa65qsltwCUEOo68ZaCsMNo46kSbnkhH1zx2UNUK/4q3Ltg==@nongnu.org
X-Gm-Message-State: AOJu0YxowAglpkpJ0uFx56vATb4Xu8JoMBVV5DPdbYbNl8A1fm7cYjxj
 3RqMaNtkpIyefyWjDmn/WV+1Zq3WXJqvsgRdElvcCWnl1O6rpQZaBAi8tUdfpJ5nSMZnXtpHVzR
 QGmBkelC+ujpz8K40GD27wIUoU/Tlralo7RCfKqYwsA==
X-Gm-Gg: AfdE7cmHHcoL90ASTSbqMBVawg/I+BElBlkqMWZJOQNxQDzioAwwQhZ+Q1cD4J3XgyD
 S6FOiTPi0Zi0uJV+77Dhc9YKWlxbKjVSRPr4uIzbP5ZOgN3XljYdcqOjlGC7EyXx27ey5T0aON/
 Q3CFiNgK2vSwUfPmrymAmMPyvMMr8gmyzqsOcEk8bVYgx9a/ZjSbonJeytbzGLBZtmB/SFJafSy
 zsRuVIabpA5TsxSBVer5L6FwLp+JklFQMo+T95xlAHCu5gQ5amAYJF4yMIEvoRfKSaHq8EgqKxk
 Taz33ry1j9IofZy+YUs2pdXdWSiXnrti2avF5oSH7ar3K0zlrE6OzaBMnfVuV3OUsFQ=
X-Received: by 2002:a05:690e:d8e:b0:662:c136:d250 with SMTP id
 956f58d0204a3-662c136e08amr1113154d50.45.1781617182637; Tue, 16 Jun 2026
 06:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-22-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 14:39:28 +0100
X-Gm-Features: AVVi8CeiBqjbG3vHASB6Uoa1B_DNTbkZe8ygZlTUrILkzoS0-4nwEEfHo7dvjbU
Message-ID: <CAFEAcA-UjZnG2KW3xUACgho=78vu2OGERrZ2zvsCySPQKRrq5w@mail.gmail.com>
Subject: Re: [PATCH 21/25] target/arm: Implement COMPACT for byte/halfword
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Fri, 5 Jun 2026 at 00:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve-defs.h |  2 ++
>  target/arm/tcg/sve_helper.c      |  2 ++
>  target/arm/tcg/translate-sve.c   | 22 +++++++++++++++++-----
>  target/arm/tcg/sve.decode        |  1 -
>  4 files changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/tcg/helper-sve-defs.h b/target/arm/tcg/helper-sve-defs.h
> index 75c0fc919d..11342e1e59 100644
> --- a/target/arm/tcg/helper-sve-defs.h
> +++ b/target/arm/tcg/helper-sve-defs.h
> @@ -733,6 +733,8 @@ DEF_HELPER_FLAGS_4(sve_trn_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_4(sve_trn_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_4(sve2_trn_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>
> +DEF_HELPER_FLAGS_4(sve2p2_compact_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(sve2p2_compact_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_4(sve_compact_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_4(sve_compact_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)

Maybe we don't need the 2p2 suffix in the helper function name?
There's no "not-sve2p2 byte/halfword compact" operation we need
it to contrast with.

Anyway,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

