Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C242C87FCC
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 19:38:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhCci-0004cC-Gt; Wed, 30 Jul 2025 15:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhAoB-0002RR-P7
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 13:41:44 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhAo9-0007aL-Mq
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 13:41:42 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2405c0c431cso863415ad.1
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 10:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753897300; x=1754502100; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2XaCAPuFpwxlS0x4PnpRe/XfO6P6segGrufbdGIRSJE=;
 b=PHcTte79WbbFKHKCEIXdyVyYf2odhsCsRrQ3uDPUans9baNGSHRqYgW1sJJnrBDtJu
 5HVbOzNQbFZfNJbaAk5bgqz37SMCyRpkuH1paa/4Rf6EUdkw6oXWCsJHYmBIOUiYjuKl
 jwdpv5sJaXccnAnyk2is4KyULSP/TxKftk6n82Hkxc+S5SEUD72TaJNinZ+23jk/39e2
 ++QMt3LaoWgFALxWpcMhaDQeuh8GXimivQ2+SCec6KpfqofUybJrIFwdBYKvGaaMspWk
 ZIhcYSApsrSjo+P/f7Afg5MhZFDHEvo/rEnE4o+CfKiJUpCa68OE/NTkeNB4e1MGXqMb
 c76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753897300; x=1754502100;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2XaCAPuFpwxlS0x4PnpRe/XfO6P6segGrufbdGIRSJE=;
 b=tVjUJhHrPKdyu4Pfh8iUQPuAG71cscq1GjNdugCxd8dCIZsjkjrGGsfTBoIb6RJBA7
 G7UNGQbXROWxiM69SMK1Re1NhToUX9lVJQiRzzvW1W+jFUrJFW3FOwxHfLJFp6nyxfkB
 rlB5R3dxAkHOzY1BUaefTehI0Bdx2n1RIZ70ALY3vYPGDmUngC3o8jc1Jieaqgn8esNX
 sHJwoEGJe21o2uiQPnELgu+/jgsshJxs8WWfin8Xt4g11QqP9tQq+DMKwPW6mKst/5DM
 MqS7W40I/Qh6GDsS3WQRcDW54yuaVr1UuIV1Kgix7yzQYNkYhL/9RxGBTDdQXrenEYr2
 Fbiw==
X-Gm-Message-State: AOJu0Yx6vkYHVrCx5u5+yDQdr5CYVAFRtkvpfS+yZGY5MEREBh5Pqrfo
 a9OlzQB9/g81KzmA1ZE2cjnq2ImPNPyoDjGjlzqNubxoP3I9TDmf1Nz5U2rlVyyspO8=
X-Gm-Gg: ASbGncvJA7IvYVCB4C79BYs37XSjRntKZGgPNBPv4CGorad13rKGC4kefOJ98ti3iF2
 gLrS/HsW+FqpwDAmsjz6wXoXnqq2GuyMpkjD3zfWQrVw0kuJjcYa36bK8EtL9Ft0erSvL2UVIHm
 O/oXuSjDr6l8ldTS+djIyBx/q545fOr/D94zvFSFSnTXZPZbZ1QH9kpVCPWH1spqEQFbm3wpqav
 tRdROrJR5pPC9TUjB06s+jolCf5FXbfTh768AZ5VS4YNyaeC53H4r4wCI61wgD9cfxJ0t9OX7v2
 wsmdmnlthNL8nhn/0Qw7gp/M10Gl1xRkyS7H4Bjl08mFKngBcu6aquYNNvNTfC4poo8vXAKo9yx
 266/fgrIE/SFiJS6fGsdX7kFwhX2nL7cY7kp8yc6tmodkNA==
X-Google-Smtp-Source: AGHT+IG+mtCFCPrcV33xxgYSesCZm5mGfqV6Qcz4Nc5PIAzjxKrgrWcSAofAKNiJ6TtCOC2TrHShmQ==
X-Received: by 2002:a17:903:2f48:b0:240:1879:c2f5 with SMTP id
 d9443c01a7336-24096a4f774mr74341475ad.1.1753897299464; 
 Wed, 30 Jul 2025 10:41:39 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe32a2c6sm106633195ad.60.2025.07.30.10.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 10:41:39 -0700 (PDT)
Message-ID: <ec6d5295-77c0-4a47-a0ae-657925d9503f@linaro.org>
Date: Wed, 30 Jul 2025 10:41:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] linux-user/aarch64: Split out signal_for_exception
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250725230849.13026-1-richard.henderson@linaro.org>
 <20250725230849.13026-2-richard.henderson@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250725230849.13026-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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

On 7/25/25 4:08 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/aarch64/cpu_loop.c | 84 ++++++++++++++++++++---------------
>   1 file changed, 47 insertions(+), 37 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


