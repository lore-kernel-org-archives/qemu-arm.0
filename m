Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC5FCCD184
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Oct 2025 14:06:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6rHe-0002VO-PB; Thu, 09 Oct 2025 10:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6rHU-0002Ma-J5
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 10:06:09 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6rHI-0007qK-Ge
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 10:06:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso1152353f8f.1
 for <qemu-arm@nongnu.org>; Thu, 09 Oct 2025 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760018749; x=1760623549; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oar5S2MDsF+wyqIbZKpmyBL/RuhZegbYJ/qa2Q8oUfQ=;
 b=bUAhqN6N7+ZANxBndX74r3L4bt8Af0V4tgscCJNFqzvpjvqF/KkUGe/0SG7pDYc+o9
 FOA7Rgteow1sDHKMtGWJT3zS+4eVAvQq5NLQwYLlo6MPEls4gy7ZiZHnRr0FpPRNa79Q
 h/VXNw0+QfQZHPmoQGzZ/tnBdRzSn366FT9t3PCRBCLUiTjDyLfcWuLsYIxVYEvoRfPM
 ZGybOTCzfYC6mgYgLqL9MJSUyWhUtt9gw7FWiwjilav7Vb94TdD2WKmxkOe6DY6UnE0Q
 r16H0FDuPAe1JTFwmD28jLX7Tfz9Lm/zO9ou1IfYax1hmgj/4p1kXeAVfq22/TBJVsHd
 BRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760018749; x=1760623549;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oar5S2MDsF+wyqIbZKpmyBL/RuhZegbYJ/qa2Q8oUfQ=;
 b=DxIcO1/murPVzYxow+h7g3kgVSBHuQvt4Rydm+xnh9fHPwe7D5Flr3C0zHFdgIin+3
 owGmfQHgF5zk3PE4J8qrCI0s1mOXMbr0r0Ga2iwURsUFCbwt/nH6ovx5rDKBwyFABxPP
 zndzyWDbdpG5lCiMO6yneJxHcQd/S0bR5NAI6iXW32x2/HheP2sOyNR5GN/N6jXBfCzZ
 O9SmYTqNq3QL/gLAISi32JIyl3AfpX89TDkU+8IpaTrrwyXgjmsa6jP8GjUl8N6fPaPo
 S7ZqxL/X2OLlBsEMRrx2GtTBck4IpDRqhP3ZGt5+oPjFqPpTmnn0PuET81A3qBeVpPlP
 Yy+Q==
X-Gm-Message-State: AOJu0YwF/U1T/6r9yKkCPLAfeNIawf4RmTGOOWY1i78QZovQR+oZAUUs
 2SkaNo6rjwivnjwxzSTHmn+DvwNConAbLd7apIPe1s3jJUO0C4zOwcLq9HeSy+omGLc=
X-Gm-Gg: ASbGnctbhIW3w/ujmcSKeWTlbG7bdMOKnM51UWQ8jV7mTGLVxyW7SJGHWP5/NQiwRVg
 7mKjfOmRSyqfl8z/ysJbq1DXE0jm5Y97Y1OUpdt7tXZptK4n5Zr4YWLKLz1XqjSokTBmLquwc7G
 3dkmwg2Cd2pVaImzg+9nRJEKnKxE6Ne75FAzrJfXUOAv0BoJRYvRAnnQvfAakRAxAwuKOMR3/2f
 EOWQJFAYRScA/h9lQCu6M7Jt4812ZS+jQxyULuAbpc0NiG35bZDWrm84KCpvklFPRtspaYYA22g
 y9yvhZ/CcigoMPvFBsnxhZ2x5QTxAJQJt3qF3ZttT7cVDmy9vtNcNPM9b30QK1uEmg/mBb0QSgr
 LwT5EE8Y7fs/VgSliHUqTKKQNfWvsfyDGa5iXRUNScv6YD2WW1Sc/mbzPhq3yJGO+AsQpBBVnfm
 3FVTVmRnW9mVMUkxa42Q==
X-Google-Smtp-Source: AGHT+IE2D4M230aaTk9lJHp1g11jpnttWCLWU1EwW4auiKpw8Zh1hwUcGu/qUCGhBw9QFqHZ/ovQsg==
X-Received: by 2002:a05:6000:18a6:b0:3dc:1473:18bc with SMTP id
 ffacd0b85a97d-4265ef6e3fdmr4288228f8f.0.1760018748676; 
 Thu, 09 Oct 2025 07:05:48 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6c49sm35161004f8f.3.2025.10.09.07.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 07:05:47 -0700 (PDT)
Message-ID: <fca0cb2b-df1f-4853-a600-59f79851881c@linaro.org>
Date: Thu, 9 Oct 2025 16:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 42/73] target/arm: Split {full, core}_a64_user_mem_index
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
 <20251008215613.300150-43-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251008215613.300150-43-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 8/10/25 23:55, Richard Henderson wrote:
> Separate get_a64_user_mem_index into two separate functions, one which
> returns the full ARMMMUIdx and one which returns the core mmu_idx.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


