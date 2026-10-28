Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6BE606A321
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gOoiQKhv
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM1Vw-0008Ag-68; Wed, 28 Oct 2026 07:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xM1Vu-0008A9-Dh
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 07:08:14 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xM1Vs-0001NZ-VF
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 07:08:14 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-84e513874f8so549852a34.2
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 04:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793185690; x=1793790490; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nr6rulvhGl4ps6/EhCTQXwqVyiVQeet7NB/sIVEyne4=;
 b=gOoiQKhvvVhw3pGd7Niebh3KbhhNWDlztH/QwyZwDbkjoHqyru+bMoEvOAc3+C0qXE
 A/2jdsipjURl6/hXGatmp/1FoalfGE3RWNdb/HG4xuJa9CvJ1iijyWONQUEHu13ABP1C
 xErRmNmlkNjNCgLBYj53sdquET/Fc3Xv5Sf7nuKrNIQ2MM6VT0ZUrlyBB1pti0bVam3+
 g1pBsQDI6aCtC/sffX3NHaG0SnmInNbNGfFubcpFkjGzsPigJGNOBuavpSBsfbQwRcL/
 KPB4bXHAj1jW2K+DGZzrBcd1jUOvXLYWQ9sb9egaGpH+ZYQJTAKSAL+K/tugVgBDk3RX
 t1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793185690; x=1793790490;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nr6rulvhGl4ps6/EhCTQXwqVyiVQeet7NB/sIVEyne4=;
 b=OkMjxac1R0Md5GuuuCHyqYFv3f5yRnUM3AeBAfKTpajZb5XIzxLNTZP1qZaaSoM5Ry
 4wpD9XOTVOe3/a7NrhEhKUQVh85NPq9cQosSLwcW1ODrL2YjthtiB+T5GA9u/voXnkCG
 d1Iku1b+7oErdBv6dUcC0Vz3mB2iR4TDdnGRXNA0uB3NzgFHVAGmTGYGAUlYe5MXO/co
 /QUnTRRuvrt/haPy++K54TbiFO9yrnt2Dl/bd8mdjLGXfes8eKmL4Rb5W73ORxhz33wi
 pZaGHoPWFazmT0pU9aswwdyWiunhubTvb2tI4TaH0ZtGWdpjyAO3S1GmuuRSL0uHpGNJ
 GfjA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxMyZZfn9DmHuv4WN8tRUj+e6zG7yKCvcwX7YyNwnKt2J7KiKZupJzopriv2a4aQKP6MK1hMXQA+g==@nongnu.org
X-Gm-Message-State: AFq9FYIghyMgx0VuwswJugABSGdsUk0Py4h1G96r8WDgh9GWO++qFgW/
 GsTdQWwUR9OKcB54uJh3mz7acv3lQBlRVYaxG/9p35pJk4rll7Py0A9GwRR/HTmEQBQ=
X-Gm-Gg: AYBFou2pkPk9dLvXF4mv+Ya5JQQocRPIl+ldZV46xvCz45YRbhwV3x8bxolG6Y7REdK
 3AkO+hvQazD3ED3C47FoKXvDaKb7pmN0WEFweb22j0axwokSBDFB7ngie3+SWVWuhpB/j0mY75Z
 Z9kLK/v4JDQnnr6ICbKsFmrWkGS90kJKn4ttK8DgRmFA2TOVfWCY69a19yqwWOYXt3tWnSwaEtl
 +xwYalvo5GwjOfrpi+Ad6hdLlqdzhKykD67R6/zXQJz84dhEMYlUkW0sNhDrFMTPSeYbd6oIsia
 5Tns7oGdpBoD7qYvnRbhNQ4jNLPqzom/hDK1hEE612jb0f1PrxbZsh7Qg8jw5O/cjyiI+IQSe/l
 F+Htr/54NTSij5tMDBWrZqtv7QXZE/43mcKwPqdJxKFUz1hBHoD0o/JLRxusmZQqwORWpgW56cr
 4vHgWNeftjvcmhcltUXNNpIXLdW/udhJdw9meaf26SbBe/XjArW5oOnCOj6hUIabUxe5VdyhuEB
 0en3QNFAVa1L5BgEGlbw+9pnW1DUNWu0NMz1SAMiPb8w7myaiJ1Yzr58zE7QYY8DH3yUYEdnU45
 uBIOt4iayrvOwL7BreKujlWHfzu1rPxVvAuMvu+ABj/X
X-Received: by 2002:a05:6808:1b27:b0:53c:7298:3598 with SMTP id
 5614622812f47-56382b885d6mr1221824b6e.31.1793185690473; 
 Wed, 28 Oct 2026 04:08:10 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-563c5a4d8b7sm864007b6e.8.2026.10.28.04.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 04:08:10 -0700 (PDT)
Message-ID: <7f2fb4fe-887f-449b-9a08-c65375077551@linaro.org>
Date: Wed, 28 Oct 2026 06:08:08 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Initialize SMCR_EL1.EZT0 for linux-user
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Samyuktha K <samyu@qti.qualcomm.com>,
 Sritam Paltasingh <spaltasi@qti.qualcomm.com>
References: <20261026175220.85545-1-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261026175220.85545-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/26/26 12:52, Philippe Mathieu-Daudé wrote:
> On SME2 systems, Linux sets SMCR_EL1.EZT0 in cpu_enable_sme2()
> to allow user space to access ZT0.
> 
> linux-user already initializes SMCR_EL1.LEN and FA64 to match the
> kernel's setup, but leaves EZT0 clear (see commit 3aad4bc8beb9
> "target/arm: Add zt0_excp_el to DisasContext"). Set EZT0 when SME2
> is present to keep the emulated EL1 state consistent with Linux.
> 
> This has no functional effect because CONFIG_USER_ONLY omits the
> ZT0 trap checks.
> 
> Reported-by: Samyuktha K<samyu@qti.qualcomm.com>
> Suggested-by: Sritam Paltasingh<spaltasi@qti.qualcomm.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   target/arm/cpu.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

