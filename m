Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7800CCD185
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Oct 2025 14:38:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6rmm-0000MR-C9; Thu, 09 Oct 2025 10:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6rml-0000LO-GQ
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 10:38:27 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6rme-0003u0-Tn
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 10:38:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e4f2696bdso11586515e9.0
 for <qemu-arm@nongnu.org>; Thu, 09 Oct 2025 07:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760020697; x=1760625497; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N131MOr7NWc0jNY7I6e5tMt4UpjjgLVLMhM85UNdrCM=;
 b=XN0ePUZ0fKiMoKr+TcVyXQY73QHszXXwpi4vJvmowcAdCVNzavF6KEXgYj9mpXb7pY
 fTctvhJpUTTBuATqUNKnJUM3SuiG9sPXLnwzPHGLATW5LE/4JAx69BS1No6fdGnOjG5W
 g23xuPZMGBiF/O0x9FiYOUT7cJABNrwiuLxWLzZlDPo6xWWiXbkj7zWuG5m/xtF1ozE1
 ird1zTc2q+v+OwyUAaqYhwFf2oPLaot7SfKImnMrtoDTBRKsqRdk2XqB/Owp8phTvKnE
 EWVSkuReDEmG8KzfOQ6GMnqF9AgxYmGzhliDcgJ8Mzvn/G4EskpJIOE3J9ckxVVBEZqG
 C7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760020697; x=1760625497;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N131MOr7NWc0jNY7I6e5tMt4UpjjgLVLMhM85UNdrCM=;
 b=fK16ZxkUBAZ3UwiLDPOMvKVn4pPfkWn3dwDJ4fu7s9W0LLHnm+mfdRWWOLqXgw9QY3
 5EVFQfj9D3xL29oKzixTR3I8zmUTMKSfAwPe0TgqI8Wk53EW5fYUi6RWax3r+rPdqVQY
 eFklW+RdEhWMXIHVCkKcwN2IT9A1G3cDEFevNv3CqjjAdNRQQzvYZ8Yy6SJv5ETkutAi
 WeN5U8wTXyG+/0j+gz8FrZ/gNkKEXknlKzwPt+3XjL9x+SvKmbc3DZMOFnAq9DHg1ugd
 HqnxYWLayDHCmAlpuzxuSlFrKi5XV4z7icQi/6NcRNOVx4QSaUFaKlWt0aKqYKEOOqFm
 VJdQ==
X-Gm-Message-State: AOJu0Yy9Rw6BzajZwJ7VOZuFzbw3K+j8h/Qp6mByMKbwB7Q/LUoJuPcF
 CTLyPFxAxqZwV8NXS6YybdgA6ETkwLB3TTmY6bozoCDPAUXGDCLAdkS3n03T2DJpkzyHl5m97Ck
 0WvYjeCzh4Q==
X-Gm-Gg: ASbGncvc40MYbw890q2quNZJ7F1buK29UdC9yqv0ZgkFrtTTYK+tkQlK+sGyFv3BReQ
 g44cdKV8xwlLfo1clGekWHHWSo3OCARbSJhcErclokiTa1CO9d/pidBMcUNMh7Az5709K3S7tk9
 im+kDbpNQLTmJIgOpaiJYm2eaDqwWtYZwup7z6CrJzfzpJ9VEJi+anLsydRLicQrp20SuCOCIib
 QnNHLmHYmOmKMqJU+D+W/yyDF6LmGPTFTUphs2SDKR9M4F5AbINwnCJP/Ze7O1WPAcQajclD6Fm
 t1/WQGmOsLFa1+bEDdLvKh6Vtjgu4swoCmsahGp1z+/RsI2gCPP8LMcOR8gg8ufdikZffjcTtQ9
 FrquIA3u7Q+DpJdgmDAD+ebFyYKLeaJ2Y4wnFW48JVzOPb8BtxmUWiCq1jDbGFh6zA/mDpcwM4z
 r6mgFwVn+lYk02DBeGzQ==
X-Google-Smtp-Source: AGHT+IEZ5MBGVJ+e3E55+kDgbd9Ko5L87LHqB3gQeXKv02ACzq8/7QbzOuezihUdf2FEwgfJCyGEKQ==
X-Received: by 2002:a05:600d:8221:b0:46f:aa02:98b1 with SMTP id
 5b1f17b1804b1-46faa02ec6emr42930995e9.21.1760020697141; 
 Thu, 09 Oct 2025 07:38:17 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb48503e9sm433825e9.19.2025.10.09.07.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 07:38:16 -0700 (PDT)
Message-ID: <c971a473-fa19-4017-891d-cb14f3bf5c83@linaro.org>
Date: Thu, 9 Oct 2025 16:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 34/73] target/arm: Make helper_exception_return
 system-only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
 <20251008215613.300150-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251008215613.300150-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/helper-a64.h    | 5 ++++-
>   target/arm/tcg/helper-a64.c    | 2 ++
>   target/arm/tcg/translate-a64.c | 8 ++++++++
>   3 files changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


