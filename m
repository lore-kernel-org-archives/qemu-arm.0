Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77E2E69162
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Dec 2025 19:50:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vXlvD-0001VQ-FZ; Mon, 22 Dec 2025 14:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXlvB-0001Kt-Mp
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 14:50:21 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXlv9-0005Ba-WF
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 14:50:21 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2a0c09bb78cso31117715ad.0
 for <qemu-arm@nongnu.org>; Mon, 22 Dec 2025 11:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766433018; x=1767037818; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lVtj7846LWfHJvjhe/F50ghadIUiDzYIHRzOQgWOr9I=;
 b=j2GSMYOF3YRWZgHM3HSX+9ux5LlzHzzgjSLxACgK6ejPeycCOMgBI0XXPFAROY4g/Y
 w9G6sblp9tXg5N3HQljeETpN0C9b9grKdun7/6X2Ysrpqsxv/47q64JEw7F+nXEULg/d
 5nN0KlE8cNCzG/Rcslrr6j0dX19KMilU2hbVKjKFSLMCrpbUaKmzq0sFi5TLtMKQjELS
 vaKi+FrPVjTz5vqA2KnHc8SeMop58VXyR6jLR7vY6LyUc4pRzNjInTYPiKaUpvbkcRyj
 5loSE9BjlGvv1bdL3nlZECl1iH6I2OTmnAz7XVEooFSMAj2G1sjqFOtvuHK61TWKjAO8
 bZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766433018; x=1767037818;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lVtj7846LWfHJvjhe/F50ghadIUiDzYIHRzOQgWOr9I=;
 b=PLwal2CNWsT35+tMF9EYdRUlndAtVOdoW0QejMqDVKnUWA4NfWNCti4iUzX0tuHjYZ
 0aEUXdJyctHoNWXlPuZcoEtRkWc0hgxP9jo7BdBwmZ303txT/0NmB1L5Sj7LAg5ZiNOU
 rurkND3nGpW+09wfjwYiBqnAekGtwKx3gwfe/t/rpHYU0jnBEy+9vTZoZ8GhEwml1+46
 T8Tu30K6nuovNQXjFTmLwu8JoKRFiRbvROPnri4Eei9OLhsAiVJ5KbbqtQVJA1SVK+R3
 gjk4+8COOGrQ8yhOfWmQdI4b4fg1zdGf0u7SFtkTDq9bGaup9BryY7OKTE6IGxP7xuHw
 YBZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjKHKytdwjGj3P3k52rM5cPNYlRfO7cqQuKlG6KXwhsE7bzEmir7szzooKmE5DwBUzBnHn3eXbBQ==@nongnu.org
X-Gm-Message-State: AOJu0YxJB7B/62HqnKySiOWJjaF4gV2BiY45KWVm7ydXYKrjthL9FKQW
 MoTk6Rcspzt47RDhc/WNsmrdZ3OLXJ51prJjNVqdaZb8nOxzAb3B4XHtC2n8FlY1XBA=
X-Gm-Gg: AY/fxX6GdPvY8I9jQ4SoqEUUVC7e1GzczHO6NA+WDCT0HPzstcdN6K/DYb5Yn50X1xi
 IVCMHM2+B5393VmXNtU5/Y4CTd0GQ/a3Alie2D+UwH7el97/0entBxTCcdfDKRKsTzrvFa+JdH9
 vqXD7/N/Qu5QQEFDOr+A5l3QbzOc3Ak4M020tABjHxrTI55SEZ5Nksshzq8+ycFSslWTGuwK8rz
 fk1tmTyYVZHs3AZArm3jplwiYke2MBxvG0cI/e71XBJIcS1wA2Ma+wSEpWlD2NTpS+gpw+QNIGg
 FjEApk6tSyORJxRVgcV+BM1MZ2/w8YzxGSSBMJTqrS+L4XnvabXZzbvEkBUygTN7o2ByjIBVl2T
 wPDPycv89PJJc4CVpMy9JN/vXZj8xmE/KRXSb8rjTy9IYcwDd5fs9FzlWlHT+w15YUxCCYJl+fK
 VzWVcblmikJDulQ1IiJLJ1BDnHand3wbSlCQ7yjEtU/KFpC+8GaOGptww=
X-Google-Smtp-Source: AGHT+IE5/dJ64aTh9IUvA2M1WBf4TiOAuMmo3X0uR4UJAfBwftZw970P9VtqOYq0HE8eWyxVzNCP4g==
X-Received: by 2002:a17:902:f707:b0:2a0:a05d:d4a2 with SMTP id
 d9443c01a7336-2a2cab4fd97mr139238375ad.23.1766433008536; 
 Mon, 22 Dec 2025 11:50:08 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d4d36esm106106605ad.63.2025.12.22.11.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 11:50:08 -0800 (PST)
Message-ID: <b38eaff9-98a0-4ff2-8c18-2290a3c917e1@linaro.org>
Date: Mon, 22 Dec 2025 11:50:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/12] target/arm: allow gdb to read ARM_CP_NORAW regs
 (!upstream)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alwalid Salama <asalama@qti.qualcomm.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mark Burton
 <mburton@qti.qualcomm.com>, Laurent Vivier <laurent@vivier.eu>,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20251219190849.238323-1-alex.bennee@linaro.org>
 <20251219190849.238323-13-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251219190849.238323-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
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

On 12/19/25 11:08 AM, Alex Bennée wrote:
> Before this we suppress all ARM_CP_NORAW registers being listed under
> GDB. This includes useful registers like CurrentEL which gets tagged
> as ARM_CP_NO_RAW because it is one of the ARM_CP_SPECIAL_MASK
> registers. These are registers TCG can directly compute because we
> have the information at compile time but until now with no readfn.
> 
> Add a .readfn to return the CurrentEL and then loosen the restrictions
> in arm_register_sysreg_for_feature to allow ARM_CP_NORAW registers to
> be read if there is a readfn available.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-ID: <20250507165840.401623-1-alex.bennee@linaro.org>
> 
> ---
> vRFC
>    - this is a useful debugging aid but a bit haphazard for
>      up-streaming. See thread comments for details.
> ---
>   target/arm/gdbstub.c |  6 +++++-
>   target/arm/helper.c  | 15 ++++++++++++++-
>   2 files changed, 19 insertions(+), 2 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


