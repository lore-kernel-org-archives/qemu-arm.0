Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7C4FF5137
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:22:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wABv6-0004T9-U5; Tue, 07 Apr 2026 15:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wABv1-0004ET-Pn
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:17:00 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wABv0-0003i3-8y
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:16:59 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43cfa33a983so3316922f8f.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775589415; x=1776194215; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OreLeMDc9RksIFbyX7CRphU/Wu1GOua41TgIzXExXaI=;
 b=DBkSeOeN3GCqgbXnmjL5pyWx+iwL/y8nh7yMZ2SQd4c0PpaeptS11UkQgSlqG1iPNn
 EK0tcLMJMV5qBsBD2m1lB026TzxhIAJ45SZeNII6IeTenMPNKKOSZbuOC1FjkLloqwy7
 rMLhQEmVfwUlkVvcdApoNkCwJVGodSweNOSLNzCKji2jvJ5rtMmGZAYhCsOlLhCzfPks
 pY7YrKIqZ62ibqZV1Fk2BkJ0KWOsp6hC0vE55Zaz0M8sbjZeE+cJb/a+zLWDm3AVFYBQ
 zVmc07lL375+8pDUv4QgIVhMileS3tk7YNlqTULwgWaZG6yFEsOPfNqkpKhBdQBuQawi
 tdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775589415; x=1776194215;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OreLeMDc9RksIFbyX7CRphU/Wu1GOua41TgIzXExXaI=;
 b=CFhvauWJJQZFuTtZ45JK0lNtvgMkMw7WlFDPwwUcpMfkU/h2TzPDLLS6dUgG6Krmsz
 bT2avswp7s1cr5Eq/S7sFIwM8GwFz9MSzg3IBY3rOrp1aRb0T6qqih9+iKXt+TeO2G3p
 7zW8u/SzKbqSv7V8rT9OGlCmtmf3gpVJqNIun0ZPId2Mbc7qqkaSOsmQan5I6tU+J4Ck
 xFZR631503DrVW/42RDNQWK9YJsfvsIkU0/gScMN1PfmVQQWljrKbRDCxFi5WnwNnjIE
 hKc5JLXKpMCxk3b3Q5W0RIOoB9kb/nnuUwihVf6ktofbryvzdcu3t9EfOjKHI5rpR86l
 e88A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlsoI8JBMzcjQwKeLeGGgVk3B3z4SRCHVh54378Mi5F/dirmDFOe9BU7IyZGrbICoaNzyHaMM0xQ==@nongnu.org
X-Gm-Message-State: AOJu0YyvLXpYxL5OEt38X0QpoRFHJ4FT62cLOUGd27Y4AvwswAdg6ZZV
 3MmtCAtqV31VRTvTx9qHoDFDpwfOAVuE6N/Z1b2HgoeM8Q9PWbM03HzctXFMoaqrVQg=
X-Gm-Gg: AeBDietshjEQJAt9b+9ZMI5Iprd1p5Up8rla0blO/tvcEMJbbvT8+82893dilEc0jxO
 C3jxGCykgr3fpVlxjkRPLzl404xI18l31t8AUOzi0SAGu+fCmNu9EAXhHck73Bav7+paPRcsUi+
 SKHrjFeXcfXIkIUCYmDcI0SZ0VPWUG5yd/oMgN7F9iXMYTn/OPIuR/U8/eW+Guwdtm7jPEzUxmQ
 F7iMM81wlyKzQHCWiuBmXxiLRaLs8UMheiTLRGfKAcFJLCz2es81vIXSiJpgxDLUqorGWJUMr+J
 YhwaMmSKPloNKfMCqWjIWoURh9hmzbUn0v2llTgeKqrb9V3NNPZ2IOvPjt5IaDxjmjiP0I60Kf5
 pSw6ramEDQV7f3i5PcjA6Os03RaM3zs/YHHPLBqaMC1of1KPahKF+rSTyN5pnP2q1o/ohJ8gisU
 9kuvCYdfsDPqdPdmtTu4BY8smarqKWRDM84gJ8WVJn1fM+j4iuPZd41txBcX5b04iSuSq1HFg/F
 YS4
X-Received: by 2002:a05:6000:18a9:b0:43b:8f29:b08f with SMTP id
 ffacd0b85a97d-43d292e15damr25414259f8f.30.1775589414892; 
 Tue, 07 Apr 2026 12:16:54 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c5419sm61621572f8f.11.2026.04.07.12.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 12:16:54 -0700 (PDT)
Message-ID: <614088dd-edfa-4cef-aef1-b697c8b4aaa2@linaro.org>
Date: Tue, 7 Apr 2026 21:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 19/20] target/arm/tcg/translate.c: remove target_ulong
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
 <20260407022748.57629-20-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407022748.57629-20-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 7/4/26 04:27, Pierrick Bouvier wrote:
> We can replace it with uint32_t, because we know it's limited to 32-bit
> target.

That, or widen to vaddr for consistency and save a "why this uint32_t
type here?", anyway:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)


