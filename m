Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1688149wrg;
        Thu, 23 May 2019 05:56:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQqhnp8DNl/6Jqjn8H/SvffLo/3pPKEfik0j5UeOLn4Hav9Kga7v0m0m0JKfHxkMcwAbo4
X-Received: by 2002:a50:f9cc:: with SMTP id a12mr97271235edq.272.1558616199137;
        Thu, 23 May 2019 05:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558616199; cv=none;
        d=google.com; s=arc-20160816;
        b=eSor7vqvibtSUKSSCIzS1KO841bI+CrQaZJiRPTEcNyaT6XUyGUEgPGZpsoBOZoeJx
         MrwR9LwPl5cVmJwumqQsoFimXiz0RKdcMx/irSMmO1XEjgUYP46JC9NrjUzKqR0bX9Jg
         bQVozP6AyJq3nWyDVTxmqbcm7lloMXQll9EADf1DvzXBatpADwU7ue4LDKCO0z+uXUud
         6Cj6a6BEzoL1lmyIvDcdiaoKbBVRMMAzgBhy/07yqDa3y08E/KewSitUCb4S2fjbCiJo
         Lxo5BmKGU6hEiruRtWQJIYi4d5C1fCfc5DEK4zBMu8avsxWUBQDUYuUmfOG09eeK1AEX
         dK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AsBS4oVOeojYbjuWUdTap0VWJ4pMUj7Q0i0CJbRKnJU=;
        b=EgA25ysdLnZB9dsi9tuCyCli/jX+6ck8faoIYx3/y/F01tETB7An3uCpru6LM419hn
         QkdOJl853l9VmiZbU+cWEyvD3hh//SonzDCgubbyuPQqcEBDMdTZ1fLtbrfNPjViwqlx
         o2RoQy4G8CVTLDdkqI1sh9fGRNGXTt0MESPW9pTJqlP09Nnzm+5/QcT7b6mOBWh7A6ZF
         6/8MFRaB9ra0U8EbI410yngNHHUwrivXbHNkurUQL4DfdkndKHG0sS/19E3MUTUBnPa3
         zo6ZNrvDp9s+LflQ5ax/gD/gHMsT93M90ZY+CZ4g2YcnRfFTPWopqwBL/Mzyfa2dP9it
         J7WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JW6Cqw1A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si4195409eji.362.2019.05.23.05.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 05:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JW6Cqw1A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTnGw-0003nq-5h
	for alex.bennee@linaro.org; Thu, 23 May 2019 08:56:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTnGc-0003dW-Cu
	for qemu-arm@nongnu.org; Thu, 23 May 2019 08:56:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTn7R-0004XG-FQ
	for qemu-arm@nongnu.org; Thu, 23 May 2019 08:46:50 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43917)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTn7R-0004WF-AW
	for qemu-arm@nongnu.org; Thu, 23 May 2019 08:46:49 -0400
Received: by mail-oi1-x241.google.com with SMTP id t187so4222338oie.10
	for <qemu-arm@nongnu.org>; Thu, 23 May 2019 05:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AsBS4oVOeojYbjuWUdTap0VWJ4pMUj7Q0i0CJbRKnJU=;
	b=JW6Cqw1ANEYIuDxcIjTs9Lbk2D8qgaoanjCRdllbTEM34FP2X9NfW5QAMnC3oI1MDl
	ab8hki7tWZkvcQWRf1sy2ndpMhJx7MBtex+YH6hBemiFasWf06q93FGRPLJSouzrxyV4
	Vm9Rdo156Z4mjS9W0Ef3k9tvacBNZya7V8ZCS2TBKlp8dTz567rgba4uyf7Vl4mef6db
	2pULHjJH8V25Ex3nuMa8qaevrmKK5hZg0TNHGovUraNCedmRKobBOaWZq3nPloCNtajK
	vfp5XkWFK4rrr6PBoP9ETO5l/ZraS966SLkPTRwvA4Qcty8vIOUSuIW44nZFoSab1OvS
	Zhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AsBS4oVOeojYbjuWUdTap0VWJ4pMUj7Q0i0CJbRKnJU=;
	b=mS7wJx/zBcaUBeP3lNGOM3b71JX1Fe0hNJ7dqnw3BGkAawAKljOq84GngPyLczvSDs
	XQEai7n6+7LhsaIXWSQFaqA5pDRWDkGXoVlnS/AOGyVuPl1xfFOdmRz/LitNNM5gTr7P
	pZL573viTLUwo47aQ5uGW1ecynPeEZbD+o4PgPjINvQrA5voD+B5B1jZtbdT/a9+4Hao
	290dD3hfn0sMCcPKgr25pHGFmyDb+W+8d9AT7i8zNAJUEerv/082o+tacLl7NPa/yD1a
	c8hOYsUq9tqfmPbOd9yFGBOeDDBTGm2EPo7mFSSWC1SlMSFWfSFjVG2C2fR0wY9gUNbu
	2ZMw==
X-Gm-Message-State: APjAAAUvzLNjIsQGASnVYyw2cvizoadGewlHTtj/awDBUeqQhhNflNTe
	RMg6+DCiL1e6KedhaaOEGw9HOzb9pe29sEr5CeyNHA==
X-Received: by 2002:aca:4e42:: with SMTP id c63mr2668566oib.170.1558615607104; 
	Thu, 23 May 2019 05:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190518191934.21887-1-richard.henderson@linaro.org>
	<20190518191934.21887-3-richard.henderson@linaro.org>
In-Reply-To: <20190518191934.21887-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2019 13:46:36 +0100
Message-ID: <CAFEAcA88nA_2u1Yc-9ZPAy2w6LVk5f9Rrss0e53E11W4Xb4YpA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: Use tcg_gen_gvec_bitsel
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sfWAWrn3Dra8

On Sat, 18 May 2019 at 20:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This replaces 3 target-specific implementations for BIT, BIF, and BSL.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> @@ -10916,13 +10925,13 @@ static void disas_simd_3same_logic(DisasContext *s, uint32_t insn)
>          return;
>
>      case 5: /* BSL bitwise select */
> -        gen_gvec_op3(s, is_q, rd, rn, rm, &bsl_op);
> +        gen_gvec_fn4(s, is_q, rd, rd, rn, rm, tcg_gen_gvec_bitsel, 0);
>          return;
>      case 6: /* BIT, bitwise insert if true */
> -        gen_gvec_op3(s, is_q, rd, rn, rm, &bit_op);
> +        gen_gvec_fn4(s, is_q, rd, rm, rn, rd, tcg_gen_gvec_bitsel, 0);
>          return;
>      case 7: /* BIF, bitwise insert if false */
> -        gen_gvec_op3(s, is_q, rd, rn, rm, &bif_op);
> +        gen_gvec_fn4(s, is_q, rd, rm, rd, rn, tcg_gen_gvec_bitsel, 0);
>          return;

We were previously doing different operations for these three
different instructions. Now we seem to always be doing the same
thing but with randomly reshuffled register arguments. How
does this work ?


thanks
-- PMM
