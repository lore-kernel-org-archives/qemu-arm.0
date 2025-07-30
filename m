Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BEBC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:08:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhE1q-0007be-8g; Wed, 30 Jul 2025 17:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDku-0005ct-Lx
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:50:32 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDks-0001lu-QS
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:50:32 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-313910f392dso266196a91.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753908629; x=1754513429; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hhBMgOxEupgUOfYMZVmI4S7+opyF7QRekpfmC633PTI=;
 b=Lr2/twu7RF174npuZ5pJHXONdUNTZRALqU4wTGWSCOezDaOTCR8jpO1+thXat3x3oX
 VGzK/oKJ3G45sCPp9ZnYaMFR+d+lLptQoSW//nZt35ntrbLxaX5ZPtPiwZyZ511bR3SJ
 PxFJnQ5QuizWhBps4dbpz7RzBud8Nr3FnrG1xAUj4qvUsxIA7S5ArSq7E4Y7TsQlDOGs
 yFbt594m4kCsuqi4J5NDs507hfzCmrE3VrDV5HwqBlYbY3lo0C4o+KuuMcMotUcGy2Ab
 UpKZdn09rYYMA+/DkAlWRv9IK03gieFZyBHppOrweEd13hejSwcgaQBfrR5kZQ7FLkLC
 MIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753908629; x=1754513429;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hhBMgOxEupgUOfYMZVmI4S7+opyF7QRekpfmC633PTI=;
 b=FMsAIoQ17MF5Ua40Sq42gwdvLk6OmgB/dTY0I/oiEy9ljo4jbTuUzTCu5L3Dgij6wJ
 F3Gic2zzm2nFqnkpx2sNQDDSk/9Iu/P3AWntaHR2ihp8JpmMCQatTzqBXMb66vvWL5vL
 AxMltY91FWiw/PZd+rC7IwMkfoJeLJK2ZYOuaez5lkUkF66NiH7S03C8nZGINwRCrHeh
 WFu1nkSQ57iq5WGl6Fq7Y5cwowZt5dU8j6W5b2w8R9YyLqy3y0LKvXMtZwBIoXL+KEod
 CkG5EYgbfyHrMF0eBvCcALet1M2aZ3CITJ6KmYd28i9kkn14LlAnqN9PKQO89OJPxbTF
 WyYw==
X-Gm-Message-State: AOJu0YwaeW0SbLbhNeLEHP99N2IXzDvWEztAAqqEwXwnkjJyuiX/ok6v
 Zk2i/wD7sPanwC2Q0am0TWf9QVQNuis/zUz15Aj5G9uqxqnWtDNHwvShwI99qXPn16Q=
X-Gm-Gg: ASbGnctKQ5uxhLRQusA4gPY2U7/6IvdpvXD8I2RadfFvXWG2vzl0NYFw5mRWUzS1jkY
 SUnv11fmIMwHDSVt6UlEuoICt24Eye9zGp+MrFX9s+QrAaBAoSwE+6QTY1E/JTYa02gipLjS368
 mIVcgc0RiAj6xZkGdFy69ItCXe+BXDjC8Mog5FYKgVUDe+0xNZTN2Fl7K/mLrx7+PrCXOrawx/s
 FaQBJkZ8ZUSypm6u+lmBrlK+902DX2IS98J+PNROP67jz1Kb7BgXrOLKae13N5EfLO5GiBDnU5X
 gBAaen8xjrGFOYBfBSrvnAnvo231jEFciXOVz/SYE0zp4cZijnO760UH+Wq9slkBmEd5tUrCLdo
 Eb8WlslSppI1fckFfOz72klkSQFn/YX5SzkQZaPh2bMS0eg==
X-Google-Smtp-Source: AGHT+IFF7NwzO3JspknBGEko1JBNY9AunotgfrqpFf3dZYokNJyyNH67GK59nmKL7QcN6NqT7QdD3g==
X-Received: by 2002:a17:90b:384e:b0:31f:2bd7:a4d2 with SMTP id
 98e67ed59e1d1-31f5de69998mr6332366a91.35.1753908629164; 
 Wed, 30 Jul 2025 13:50:29 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207ebc10b2sm66265a91.12.2025.07.30.13.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:50:28 -0700 (PDT)
Message-ID: <a5317219-364d-473a-948f-75ae4fe430a0@linaro.org>
Date: Wed, 30 Jul 2025 13:50:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/82] target/arm: Enable FEAT_S1PIE and FEAT_S2PIE on
 -cpu max
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-23-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1033.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/cpu64.c        | 2 ++
>   docs/system/arm/emulation.rst | 2 ++
>   2 files changed, 4 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


