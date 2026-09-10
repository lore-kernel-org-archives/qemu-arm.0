Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AC2C79F9F
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Sep 2026 19:53:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4kox-0002DR-0Z; Thu, 10 Sep 2026 15:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4kjQ-0000hN-OA
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 15:46:57 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4kjL-0000DX-Sy
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 15:46:47 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-ca12086c06eso224600a12.0
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2026 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789069601; x=1789674401; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=C1qmsk8rFgxNFPSseWuaQRSOgOPgaPWHcfHj4DInsws=;
 b=lFl9hiLpJJ8TZiKeTo+4ee4lWlJUaR+MvMW30b3jDqmPnztyVrbNiU/pKDCbl3EkZq
 sF03rewaTLlQJR0TuNcKBYjt4Q/lOwUaDLVZARZW+jiniJghGfMWbqmUrO2DH4r/necp
 YVTfcK+ZOCPyIdbCYqic095BtVkB87Etz854YuRfKWLDPA2K9fUUTv8kVAHAikxeBhLc
 yt3FxCQNq/bdFLKW7ChO+EJvdTl/cXynkQCFUXVM/QS30FPgYP4Amf89E53n/2AerlGH
 P0DhnKXbnCyB9RRhxlGdakElUfZa02b28ao/o02OaYPD4kVJg/vI6HNQ2GJz1iu91zCJ
 YrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789069601; x=1789674401;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C1qmsk8rFgxNFPSseWuaQRSOgOPgaPWHcfHj4DInsws=;
 b=jz9nyakDuRtLcW5Jh/EpEyl6wxpFR8LDTli9B1+e5MdfM8+f4osBREi9iH/nMlCHTP
 bqSiK2exCj4tgXdPaKaF0ABSbRvGAfwb8yomgDDMP+WY8aCaRsjsPO5KBRGHTPbFs2IS
 eaSi1t8RIM984euYPj8OV5CGHJI2oJal1fFq9gptuosRnK33+hdhR5QgcQ5cyqofn7/9
 WELTQl0CMhuSuRgPwTDj74i/vfYe8IqWr75MG5V3HfsT6qlnmAIKiwhI3pMOn+qtyoA0
 OZIKpqQ38JHf6wmDO0z7+I6712QK/PhD8wyQjNzgO5KIllJlxn54l0szlzItU8OnO0pq
 ufmw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzjFGr4DgXGpBk7QkkFUKruF5vQEHsbfIyih7dbD6enjUSzvcQ2WkN9KA3e9xdqvZn9kU2d88LOKQ==@nongnu.org
X-Gm-Message-State: AFuF++kFDwMkKe1py/SyJ504LPVNIlgbjFfy51hnoJMzsjU7z82loo4Z
 UmO2lk20T6XkvtO5UG5fyzYMPkMbhbNvEdRGeEu0BOEfcdObAf2Az6YbF7eC+9rQpFQ=
X-Gm-Gg: AYBFou2L670INYVAyh+CfZNSh7rhGQ/8tdV19DcqMIv8l1qow0CUm8wy8+EeHVH4uBz
 UbwekyFFpjdavBojvOgiLq/VAPxtPKHDmRzpIIwUSu3a2ELhU9WIYyjUUIafT2NgxEAp5yEtfzf
 pVGYJzgn8wFNCWIgJidBi5miMeT/ZVF1fGzPU4AfjYUrU81tih+fn7vHuVFG6XTcxIGAUI+Oe3B
 2SMLCy4iMXX+ZYwnWuIsqjoa8IOBJmu//YwhLoLCmVkQyTma7+/9hSsPBmcuGU/syH75F5AGNq1
 XPU9rOy6EsFCZ/eQTjlzwNOPm1wBP991mjeB9oj2mGLj58QC5e7i2l324PWNptRRGa4mwZQPnsb
 wH38ykmElFV+B/Wv0n1wX0w/GCrG7fq9RQo/pNOhf9GPnkw8le8PYkK8e6iIWEkdxbjb2Ox/qO+
 5UWc0Qx3ZavMaCwk9KXPckyScV9MkUaY701QZFgJFrIWxmlOeIgIhdBbBvN5BZIEiHN8Rb5q7FB
 nDrk9UbusV2+6A=
X-Received: by 2002:a05:6a21:6f88:b0:3da:755f:a031 with SMTP id
 adf61e73a8af0-3daed20b238mr938429637.12.1789069600642; 
 Thu, 10 Sep 2026 12:46:40 -0700 (PDT)
Received: from [10.171.0.227] ([98.155.112.169])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33ba4f1e434sm354515eec.22.2026.09.10.12.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 12:46:40 -0700 (PDT)
Message-ID: <088c1867-a0c8-4548-b6db-0b3bb2f0e204@linaro.org>
Date: Thu, 10 Sep 2026 09:46:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/21] target/sparc: Constify CPUSPARCState for various
 cpu_*() getters
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
 <20260901095229.72018-18-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260901095229.72018-18-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 8/31/26 23:52, Philippe Mathieu-Daudé wrote:
> Add the const qualifier to CPUSPARCState when
> the argument is accessed without modification.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> Reviewed-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   target/sparc/cpu.h | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

