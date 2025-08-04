Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22DAC87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 22:24:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj3bL-0002Pg-Iq; Mon, 04 Aug 2025 18:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uj3b4-0002GE-CK
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:24:00 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uj3b0-0007N2-3O
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:23:57 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-76bc5e68d96so3957693b3a.3
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 15:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754346232; x=1754951032; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C11V6iyXWKp5KCR02XvUBcQUNxjQspOybdquxZQLdYA=;
 b=HfLapiNjYRn8eFc7s7ozidJgaQcFkVml1g8+HISrSmhbch1uyq15tYL0cxWrUndyGb
 J7Ry4rjUKRGhJg+Wzks2iqkRnwVtefdjRFTlFdzqylvg3tXjW5E+WUnv3jGHQk74lBPe
 W9tBmL8YfkspXaJBI43J3LTYNaXIIoEscPuyOxeZ0albrkNGRqWD2RkMPWLVgiN8eAXL
 DgJlBueSZdrtkHS4+Ti0D+RsjFd8lmRJM0t6FVWrOpmA9ijCV1nMJP6GNOOkNVZCh5sU
 6wlP7TNpuiCVzqykKCvlXJtLGA4lSnjm4bShNj20U6UbGfDKYEhmRp+DqiyH148r08lB
 Zo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754346232; x=1754951032;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C11V6iyXWKp5KCR02XvUBcQUNxjQspOybdquxZQLdYA=;
 b=F9vA8enC8/NfLgbvRsWgG1FkJeOaiwlDYWB05PJFfKRhQcbuRdYGlv1wN14Vs1RW/s
 2LUoDtLyMFksF/uPhd0eHlc0123AqYSpM77aqE8VQPgD1bOyw3wsCsj/f3T7aBmKIrCu
 oKAmFJ7k742kxFXdLsqc+AhDDg83pbzurSi57gJc/R4Ve49aS84z3YURFHJH0sEhCmiv
 2nXri2VacKHl24RQIy+h7hEkEu1Dx03c9RB/5AQ7aXICAtNOa38Bm4xtnvmv51aHeIVM
 /oTW3ez1P8hLi0W776HZWgUQbe5XF+AlbqV8hBaPj7bcCf+IlhrWQKGp12ioLa2TTo4J
 sg3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO/N3SyK5JZfYnTI2wq6ylKfZ4h43F8cm4zJbfAQghQumtXEQC8fpvflae0QNAvZ+iM15kewjQZw==@nongnu.org
X-Gm-Message-State: AOJu0YzshvUNeFRW2UtJy+r0GIh5suVl3P7MMkN70NEix4/9RvtvTfL+
 rF8uFsCC0TtR8eZHcEYObobg8Ts5stYu2XHX4+50c1MGr9UHsAxpmQ6PkzTyIrbDbAQ=
X-Gm-Gg: ASbGnctXJhpp+zrgw63an/2PgqGCNbP/qtGf5xkWGewQdLeRn71Fd1FMeb+kIzdlJ9S
 6gZ9VZwVojvoJU9xrrTsHtCteK7I3qVxFv6EljNakR7oEONOzjLHH/UFUyO3qLf/JNI1f7T6UQO
 3UFsNtRbcUnjJLvt5yIjfldLDtaBT9qPX1IvaTA4RV/5MDTpxw6LaYknaXOzRxTgrTtpDoxJWI0
 L+QCob0KwZVwLCk0M/RCHzziFI/fcpPaiahLDp+UJojqIU+x3FZKRhYdR4tcy5UrtOwJhOfrdC1
 900xvhmca58ZfQ5grjNpMrBMi0Z8ZufXEejZTZpGd6O6s2bvYfTTBtd+XDYPWcTeoGdEptjosN+
 IqFth14IUxNDr+J4fHHaltYKU932D2OQ787cApbBo
X-Google-Smtp-Source: AGHT+IHgod2A648kSf6cGGQtq0c1tGp7Y9bCZNi6vSLTRMEpjS8YDsia+J70EJtHTNNv6O1BPed7CA==
X-Received: by 2002:a05:6a00:a85:b0:736:3ea8:4805 with SMTP id
 d2e1a72fcca58-76bec314c7dmr13291605b3a.7.1754346232129; 
 Mon, 04 Aug 2025 15:23:52 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76c14f98fefsm1539951b3a.122.2025.08.04.15.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:23:51 -0700 (PDT)
Message-ID: <88a8333f-0507-4342-8858-445e348c6807@linaro.org>
Date: Tue, 5 Aug 2025 08:23:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] semihosting/arm-compat-semi: change
 common_semi_sys_exit_extended
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, Weiwei Li
 <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
 <20250804183950.3147154-5-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250804183950.3147154-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 8/5/25 04:39, Pierrick Bouvier wrote:
> We now check only is sys_exit is extended.
> This allows to break dependency to TARGET_SYS_EXIT_EXTENDED which will
> not be available anymore from this code.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/common-semi-target.h   | 4 ++--
>   target/riscv/common-semi-target.h | 4 ++--
>   semihosting/arm-compat-semi.c     | 3 ++-
>   3 files changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

