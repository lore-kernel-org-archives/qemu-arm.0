Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF6DD6100C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 11:44:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlQS4-00026M-4H; Thu, 29 Jan 2026 06:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlQS3-00025l-1G
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:44:43 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlQRz-0001zd-JX
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:44:41 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso7185155e9.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 03:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769687078; x=1770291878; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=slA8qQWgTbCJmbnyBTQLLyxMas43L/3iJNnxd2vpl9c=;
 b=dbVfUUEgO5tzb/sPLl6AfhG6C9+Xo+ZnDkc68n+1I29QDv7KRu6sQmxa0sjv/1rjo0
 daTD6wvc+YspEwxpWVbjzvDaR5DXuyoalqk804Qy1pU4SEXMgfieXbKPUlYFxopzisSg
 wXo70PK76ND0dXMcEybug94A8MnW5FUlfp+3NERUQ8iJIgGH+fNiHdRx0FGag/nDQkEg
 WLkIn2rULppSOOiYewrb7cAXgT4GrE70eOhQFtCa2pad5LwuWbaqb5ClQ9GJmK/4EFiV
 e4RcgOniEB8EViXryYGNvrXKDv51at2k8yhxQ7+PKg4Eg4LDtfVN9KY2yiIsD+FvEo8v
 4Ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769687078; x=1770291878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=slA8qQWgTbCJmbnyBTQLLyxMas43L/3iJNnxd2vpl9c=;
 b=Etj3shK6WOR2IZJtr+Ik5TkvxM4WdgW/lrGcabYG9qK9E+PzG7dU5rZ1BkB44/Wz25
 4XtVehJ4gKqZfQRzWpW+sVYsaoSG2N44HDeMbGhogIX1L7whQWccnUIhjanyslUqGpJG
 umzJRz3WVngsTMSTw+fqp4wg0vSRXTw/R2mtQtXd6F+Dn0FIHDHdfk+vDUP/A856jvFH
 /vkDmnfoaVd6ZyKLa9U1fdJ5Nk5KsO7SO2kBEn20dW8L+Se0L4zpAg/uv5mIFfm1wu4Z
 KbR9z6BmjowgEOygjLVl+tmgIp98Re+wbMiGHmxRyiOvO5gNof72u/X9Whf0YMgjthmp
 r7Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgLJmkfCdZquV6YO0RvCpJc2QkmqKfidguli85eIhN1zHX8qwJlr9zCn6PW/Eh6m9c2wOJKwIuDQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy4xujB7uU4bIEEcL4dHQTZ8JLZTICir1OlO6ObNrRMgVV/ed3M
 SqKXHPTxgAv72cqN9y8Hg4g1+LfETLBP0GmrDfID/HPSLqYUsY4e23h80pvvILjXrNU=
X-Gm-Gg: AZuq6aJ+SmUvDYG4MOXJDrV2Owc6uPodGf40Vjq4H4FRRn1ueH1jt+JHuddQZa/r/Tn
 BslzqomvgM5jbNTQg5/+MnGJDYKvDPgaMOvXot0qlmoACLg3SQx65PHom4Spli4b4P+mQaIFU83
 i9UhDhjbs7HTRb+SSU2lEj3xTBHhRnDx8IHtSlw06IYdvhQ1l7lEsnH/PxzD1Rc/5zGXTnk4SAw
 zRIUEhwZ3tg8iLkfCnpjzTUGVwutmEge2ucRzuMNmCiUla+YD3UjqbTe6v2sN64DI/Mq2LEdMFO
 uboumR1nhljBKc/AhwayjHu55g7fqPKkCqT7xxPm4BP84a+SkFkbo+A5BAYwo+US99r+rUZgkHr
 p7jMmbdaHBnWX8YT6CuekuCI6SSwgO97z4Na/XAqxrfC1UzysAeTW73b6i7fsMl6Fa1/ZbZloUl
 e5+VcHTpyr6cPaNJeFUet62ZcGcuXTRv0mF05o7DdJQJPwZsboS3Ec0b6SFp8bYoLD
X-Received: by 2002:a05:600c:450b:b0:47d:25ac:3a94 with SMTP id
 5b1f17b1804b1-48069c788a3mr106342955e9.17.1769687077963; 
 Thu, 29 Jan 2026 03:44:37 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4762sm13600410f8f.6.2026.01.29.03.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 03:44:37 -0800 (PST)
Message-ID: <2236a948-023f-4de4-9a7f-8840dcb5b60e@linaro.org>
Date: Thu, 29 Jan 2026 12:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] target/arm: Report correct vector width in gdbstub
 when SME present
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260129113455.1283266-1-peter.maydell@linaro.org>
 <20260129113455.1283266-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260129113455.1283266-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 29/1/26 12:34, Peter Maydell wrote:
> Our gdbstub implementation of the org.gnu.gdb.aarch64.sve feature
> doesn't account for SME correctly.  We always report the Zn vector
> registers with a width based on the maximum SVE vector register size,
> even though SME's maximum size could be larger.
> 
> This is particularly bad in the case of a CPU with SME but not SVE,
> because there the SVE vector width will be zero.  If we report the Zn
> registers in the XML as having a zero width then gdb falls over with
> an internal error:
> 
>   (gdb) target remote :1234
>   Remote debugging using :1234
>   /build/gdb-1WjiBe/gdb-15.0.50.20240403/gdb/aarch64-tdep.c:3066: internal-error: aarch64_pseudo_register_type: bad register number 160
>   A problem internal to GDB has been detected,
>   further debugging may prove unreliable.
> 
> Report the Zn registers with their correct size.  This matches how we
> already handle the 'vg' pseudoregister in org.gnu.gdb.aarch64.sve: we
> call sve_vqm1_for_el(), which returns the vector size accounting for
> SME, not the pure SVE vector size.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We should make sure we have agreement on the gdb side about
> the interpretation of this bit of the protocol. See this
> gdb mailing list email:
> https://sourceware.org/pipermail/gdb/2026-January/052056.html
> ---
>   target/arm/gdbstub64.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

