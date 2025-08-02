Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E165DC87FD3
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:48:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLx7-0004X6-MB; Sat, 02 Aug 2025 19:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLot-0006vm-PN
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:39:19 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLor-0006Wh-3G
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:39:18 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-708d90aa8f9so35340067b3.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177956; x=1754782756; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w3HQj0uQugwNY/q3lKzRpUuD+MAh2mwqDvVFwmHi++A=;
 b=oKllchGLEwXGUenIOXkom60ZAmE4JMmIPjQjQz8Aa06Q2j5mshDNdlyQk+B5XP8289
 nIoRrOn6sPLWUQVMKCp7Gu69imOrquctJ5nZdX/qscsfPtqB9aCYvwQMpIjWOXm4mVFE
 QPRQKfNNi2M9mExo880y7RETEisxv2eb8k3V0u/K/1nTzgGKl/10cApobubRdpBv4276
 Cdn4SizMjk3bZKfrRYvboG7H1JHVrBcaj9v8MavGhsXvGXl6BiGMlXGS0MaeKTIUA8+q
 lOYNeM3B1ALLI9BB935bNwPo/UMAzPBWPHllAJQRVSUKQjlXV5vuHJTYqtfiTJI11p0e
 CyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177956; x=1754782756;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w3HQj0uQugwNY/q3lKzRpUuD+MAh2mwqDvVFwmHi++A=;
 b=qrzWxVfUENZNmieqznnK4P/lTzvAsi10woZRJKxnM9BI71TZVy8G8dpp9Etj8QVuTi
 q2hsBgwE2lRsasgRiVI/mrui64D6guQKAv4xSNeFvToCb4zsgpB99vIOFYXmVLkgcBzr
 Id3WlfXU9Rw9xlPXhZOO4XmB1WGRfBrdA+QZm0VxXWkAd49cfR++RQMqogz0JAp8uA4j
 w6SWYcEJ6fY51TBDgO9x0au128iq4Cjo4x+mmOJe+fd9LzumjUTEwnBg3qC77yQuvaAg
 0bdBnc1Vbtq6SNdM7kJyy7OQuYaQuPh4ddNG6IKUDVLwDvmFSEsiUrpKP2tqACEGS36i
 85PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpR/jWPxdRvPc7lP8IadGhXQR1aTpBpKpk1gOj4lMEM379GR7EZeClmeT+r2js3CFK0IWJDIIdPA==@nongnu.org
X-Gm-Message-State: AOJu0YywK+6E8/MKjNnF98m8co2zoZJV+O7SBQNe+mnUsVvh9XLXGwS0
 VZqc6yKRAw1+HwiSZFDdaRJRVAfVvj9l7zHMe5wk7Th6CYTkpSaltK40exyuFMlzFlI=
X-Gm-Gg: ASbGncu6ICLdh1CA2i70Xhr3dzwdX4Gn4EImuB8qapjmFS5VGAscerf/21AhFNCMXar
 xFqOG9ECS33dPEOEbj0r8VK8yN3klmgvvLwriWSQ+E70BQn5IQnkeZKvfYLvjRGi+Sj5+QAnBQT
 kGQ9izguLCvPSU/ryqHHhxYT8ZbGU63GVUERRnTofJpeDSRuAPXtrY4hvRl4IYIxo9atX+GfKi2
 4aw794VYzhTuGjJHADHeq20uaZyEJKJwhNBrn43fQD2S0ge0es3ETXjSLtIracrPGLMDDLcIypv
 XeHz3/p+TQjm032viUiQvnt2qrGQ7bHEnUprj/L9M8OfSdWmds5xkUI8EGLFVcgzuYOwLVrBQf4
 muJpfo375lk1o4MWMHajiP0zaiIi095ozfIdqB1kKFt22ftg6hZ0fIr+xe5UeMVQzLAsEOEOrQi
 4=
X-Google-Smtp-Source: AGHT+IFGznS+Hw8McaLjAA3gQO64P49RYXazhR+8mKLSQxLYWFjg8xh8UdDAfaWzpQalAw0we1iUKw==
X-Received: by 2002:a05:690c:660c:b0:710:e81b:f7cf with SMTP id
 00721157ae682-71b7ed716bbmr61813197b3.13.1754177955755; 
 Sat, 02 Aug 2025 16:39:15 -0700 (PDT)
Received: from [10.153.194.227] ([172.58.111.133])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a3a9b89sm18231637b3.15.2025.08.02.16.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Aug 2025 16:39:15 -0700 (PDT)
Message-ID: <2ab7fe7d-e2e1-41f1-b4c9-13de6306d75e@linaro.org>
Date: Sun, 3 Aug 2025 09:39:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] semihosting/arm-compat-semi: replace target_long
 with int64_t
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
 <20250801232609.2744557-10-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250801232609.2744557-10-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/2/25 09:26, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   semihosting/arm-compat-semi.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

