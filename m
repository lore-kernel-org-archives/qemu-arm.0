Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5472CCAC5B0
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Sep 2025 10:38:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v10Pu-0000Va-CZ; Tue, 23 Sep 2025 06:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10Ps-0000U0-7g
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:38:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10Pn-0005BK-EJ
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:38:35 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45ed646b656so47293585e9.3
 for <qemu-arm@nongnu.org>; Tue, 23 Sep 2025 03:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758623907; x=1759228707; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mngKleCI9Gnidsd0PWPOZTV68Cz4FjFjTPVRRuaLC5M=;
 b=ao4xT2KamDx8GexShnO7JML0uTuhL2Lh2Ql8yyRsegYCJvZ2AT/zS16uXTQU3VwZEI
 YMI81Xies6wSEYgmJtrjqOy7guNy2SEu6JE8X+A1MM0Ow6X4d9/dVVM1TrIgz3SMDP/O
 yVxkYQ2/+CsqLiGgN5SslKtry1JkNkzqtmTivUqVzHwi/YILB7S7EtDq4EVMQSbH8IFD
 YZNtSuJghqWjtzZemDemHCEzrXbuCCrgDSKsQlCRjnt++kKwCpji/G+VZAn+Hsddct0R
 Pmnjw0cuy+dD+GTvAtJePnmu7peNV9R6xQB9N8gvOVXhfvLcLOFWGd+M2KFiO8Xtt4Be
 x/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758623907; x=1759228707;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mngKleCI9Gnidsd0PWPOZTV68Cz4FjFjTPVRRuaLC5M=;
 b=FybR7hp0YgQeQHKnU42FYp92e3oudvLVIsswGVKSN2jkSTCNSBbTgmT8iR6mU5OxrD
 8gQp987oYaGloRfxs1S/pqPFfG8uYmDDud1kDbABEYnk+0wlCqTFmQJcACvq1DWSeerk
 b3dIicIqfdSExnoU9VnVvv7C5rL5Mao9lXe+/5qowk5VBXZej/11AAYzr7oZ3jjNEWlI
 IibgR6id1wZ6eZL4NvAJqHnrmIPxKftRKZ8lb7dhVwkFVB4ganLBZS8WZziEOcyypKWG
 FRUQvAKC62znsobD91JCESbQbnf2vmrm7kXti3Gl01NRcX3lfRUVmaovF5/RywhsHHUz
 mZzA==
X-Gm-Message-State: AOJu0YyQw2vdxDCZv8O4ReFWIHxnS/RadSmisxVL564QS4ub+mYOij4X
 j9lvlf6uZaf/fchzEaxqMvDtvrDofrNjQ6dxGZVJnw6uCJ9h1x8iRTms/G9Q4P3r5xQ=
X-Gm-Gg: ASbGncv1aLXVSubDftJtuWtbAgf+nxGm7xu7jCGDX2QiNRJAgi0xL2aqsVtAMRxBK7j
 ql0K4lbj0YMXCPgY6XYJXuXIOPo1JQkAJO/z/yaA2vC8OBc96FjHkeIGksZAdepopR4BgzzsmHV
 0krx1vhv5fjxS0Sj1ZDihrtisX9wlcvGDlDtssrxdYq5JC59TigtMBkd2PZJHPW5yZBihzQnSzC
 9TDL//x5VrhnwEyPdOBiNe7NfTNZqB9xQ2XYiD3L5Kv9+FaJA2aOw/Uscfj9WzoehMi2ct+ULnN
 OfkeZ+zUP4DJAo9FFdKXKISPKKzaTanUr25SrhDYfJz3/mQNGW7tWIk/YueANBJqj1DorCwZG/c
 UbV3yvsFYwS9keONw/q+HssNbqPtj78tp9AU3iUT0sJIJcGZ0lauc9oxFMdgzIqXUtw==
X-Google-Smtp-Source: AGHT+IFY5JyIURDAUUkZjnk5JscR9jCDC7S1G1W1r92oaqZ+ZTr/fPQc4VKBXhdY3Yrh32cwZYBxZA==
X-Received: by 2002:a05:600c:1d0d:b0:45f:27a3:6e0e with SMTP id
 5b1f17b1804b1-46e1d98a381mr17443965e9.14.1758623906863; 
 Tue, 23 Sep 2025 03:38:26 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee073f3d73sm23151401f8f.8.2025.09.23.03.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 03:38:26 -0700 (PDT)
Message-ID: <29be1e35-e28f-4f5e-b95b-90f02e07521c@linaro.org>
Date: Tue, 23 Sep 2025 12:38:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/36] target/arm/hvf: Split out sysreg.c.inc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-4-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> Move the list of supported sysregs to a reuseable file.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/hvf/hvf.c        | 147 ++----------------------------------
>   target/arm/hvf/sysreg.c.inc | 146 +++++++++++++++++++++++++++++++++++
>   2 files changed, 152 insertions(+), 141 deletions(-)
>   create mode 100644 target/arm/hvf/sysreg.c.inc

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


