Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96990606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cJdKf/84
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSr2-00031i-Ov; Thu, 29 Oct 2026 12:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMSqv-000303-6q
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:19:45 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMSqt-0001DG-JI
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:19:44 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-843cf077f10so2419328a34.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793290782; x=1793895582; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iyHT6CBjA4pdZ64fdU+8Wj9JA39EByJvBl8ugyjwMqU=;
 b=cJdKf/84SIAzWOqutYsm4vjFS/0ylK409wvcv6iKSdhe42JV2C8yhTzbQlqGY2Fq0T
 0xoBjb8SflLuJ8B6xRk/ujndB4Nulc1bdAEt5gV/srMWLMDu/nRD1ufUcBb84O8qcdJW
 eXzB/Ej8I+bTVt22z7qYWa/J7I9I7WkK0xgUoCzeqG1K69vtd/OfwrGTOdCqPlyAu0GT
 EJ+CJ86+brNJ9Rbek0W84YnWZeALmcED2wy74K00RyNH5MnzMnGEPL1J2fkOJLl4hqW3
 sTt3i9EyG914gEQc9mpsBKdN1pKt81IqYrVZZyz9stkwNElEXqFSi1WxjYdPpO8JIiTB
 n5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793290782; x=1793895582;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iyHT6CBjA4pdZ64fdU+8Wj9JA39EByJvBl8ugyjwMqU=;
 b=odcCwj15eTUg8kG5cOYJwLatnNeV/iV4EHqTfZjC0Fw4vgly0RzBmyZP97kPnMPXYU
 dPHI1fgLoELrhoGpisdiLzc1nfDR+LqyG6uc5R2porYyuweEbmbp/zooWPI0lyevWBgf
 TrOd6pblOKqhnYQSynIYwM9xqn7IUTsJWzPmGKuOrjYEO3YU2YkU1KxRfaQghcLFe3lD
 SI8e36XHgnNn7gzi3Ff9qQD3ALS4zBZX4mnEKmB+ih8MgE+0/6LZVPsC2ZkqX4v1o721
 17PphoixKAm3AwK237POK36bOWs/viwkFPYxM1Uq8NbcEZSmLBZnZosxYMpKwYDsvr9i
 KGyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxnW4qbEbt78uUDuF07/jYanPBybKvQEUeO/W4TLAsGi4KJEQ138ZCpi5kuAHBjpWdl0Hqwp7lyzA==@nongnu.org
X-Gm-Message-State: AFq9FYL6+xt2jE8THWhBoxKQ6IbEtYlxYd0YItKxf+Ue3xbh4IdvOpVQ
 JLZyIzG14nXu81e9hfwVn8AjMuhRFZFe7Qm4AfnlJhNIskFnS2Yg7osrDsxnYGoG2lI=
X-Gm-Gg: AYBFou2iQaUHjRkRvFZiWXaSYSmg9HEGAXg9rrSJk3p1giqAegu2p/KkGcx83mc7185
 AYa6IJmyNRM4dqI4TKFyCBE7xuQjTyReT2VuAvVNKhdB0qqv60KNp1iCGmcvQMU0gS9aG/sq+fL
 I/nQLabD+eGPaLFAbM/LwL45VJ8sTTf9cB9TRZdk+nuV1bVp7odAQ1O7cwyvyPiS14KULvNshnA
 Hs+sGC64fVq1HgYZmJWhr8W9EmzHsea00QDScWQhDuiMlxBPDEtvs4TVhKkbNVRSBEOB/kTkeS3
 sXYrnqTlptuFx0RsCURPoibY8rE7l2hJLhT11a8TRjCqFLuOTlY0NOFijkFbuW+jNLUWSnW/DWv
 6jpni0WHRg+wWdiAocrvyIAx0Ri7b6KPJ8i8UvHuvuYigludPs7hd2L0LIYkaKbyfDiAznOFUzi
 5bv5frBjkH5PWFem+Fp80PEayE6Id1+VrHlKiLZjexAUa1KZQr1m5UJygul9V1D7LAdfJh6ooiQ
 o+NEjlbbgIV1IA9CiV80spftje60C5fG90+Ff6TaDqAlx+9U+WkxWlvYKzpY6GkuJM7HxJ4EoPv
 KXA98p8QvyZ/xle2h7ZC8TComNYBuPm2uth3hffxlJXO
X-Received: by 2002:a05:6830:2b0c:b0:843:8982:9528 with SMTP id
 46e09a7af769-85ac070a97amr4730518a34.19.1793290781953; 
 Thu, 29 Oct 2026 09:19:41 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d33f598absm302689a34.4.2026.10.29.09.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 09:19:41 -0700 (PDT)
Message-ID: <84ce5521-c0a9-4bbf-9483-91b981f8cb02@linaro.org>
Date: Thu, 29 Oct 2026 11:19:37 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] target/arm: simplify wfxt_timer_cb to only trigger
 cpu_interrupt
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
 <20261029161310.2065290-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261029161310.2065290-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 11:13, Alex Bennée wrote:
> HALT_WFE will always be cleared when leaving halt via
> arm_cpu_leaving_halt so we don't need to worry about atomic games in
> the asynchronous timer callback. Furthermore, a WFET timeout or
> event-stream expiration is not an event that sets the event register;
> doing so causes a subsequent WFE to wake up immediately.
> 
> As we only need CPUState to call cpu_interrupt we can also simplify
> the user data and avoid needless casting to get to it.
> 
> Suggested-by: Paolo Bonzini<pbonzini@redhat.com>
> Fixes: 01b223f895a7 ("target/arm: enable WFE sleeping for A-profile")
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu.c | 20 +++-----------------
>   1 file changed, 3 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

