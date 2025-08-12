Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDF8CA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:15:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uliIO-0007Iu-7h; Tue, 12 Aug 2025 02:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliHJ-0006R8-8N
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:14:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliHE-0004TR-J1
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:14:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so34689165e9.1
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754979265; x=1755584065; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ofOwlQPqR/GQZIGUpoNlh5d8HRU3whHHOF+gLkhl0Vk=;
 b=vKmfvDBzDQ8DIfd0DsaUC7Q45IoRSJYOflvZR3F4r1rztLfBJ19A0xUULlsZ8T+VlT
 vcd4MM16NQxfgT5vP/LwUlvLoEqwsb95lOz1HNa23qGhK/OKwgo0NDoPB8XBJnvz+JtM
 Q74anTmI0h9L6e51eGgdI0lqSizQR5h8jqaXyJkNNX8kyszuZS3d9CfrNC0/qHN4MLzP
 ytZ+BMJr+Z732TUtvmOtSf+NPpVHYipXC8iJfV7fA5B2Sz1zBnq7kJLLNNCvXv/VXXPd
 Y9ZU3qRypXN/u5/+t53ezBIQMBCX9DNlWLxo804RX8jKBbvSEzVyEnISUVTa34H7x6R4
 KSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754979265; x=1755584065;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ofOwlQPqR/GQZIGUpoNlh5d8HRU3whHHOF+gLkhl0Vk=;
 b=Ia075I3SqehmEWLQTj+Yy4d2cYjgNvdn5ul4zwomcEnF5BAxp2ce1LmmurjSc92I7I
 /JFhRB+gXPsdnGLHxo91hge+g1CsaRAh4MbtZKivLeE0GQAZAfVK7qA/cKT8keB16Gu9
 a6/iVuCd9dG0+BBBk3tPRAJC6rob9WUbn7mql9dLxeIB0XFvLn7nWVsr5MjrxqN4d5PQ
 NaLebNsDYJpDINsgwhSyoepdW7eYQZyjFbT8j8FIrM0M7aA1CUxo+5a1vK8Y2WLsu6Kl
 sbdRmULSgNRswm9zvrueFKOtRvQkh3jttXVJ3xjMM2cmaNZS//h+ZTyeU0SijHYMmPnI
 QQ8g==
X-Gm-Message-State: AOJu0YwFL/rozDtybAFXeI7zSZycN2scXMP265XugIqYF4jgGNL8JDFB
 zpvzOmTf7+lfF35GAcgny3ql0G6aigvtEoLqgZyDMIEue+CpTsnSbMUM8DI4IiThHAo=
X-Gm-Gg: ASbGncvwveFdT/gEe1G4ZQnTeq4RoA7i+LgYff6EhGESStqwLy3i25RSwsy8jyG62yX
 pjIuZkxYF1GsuexkaeBK5hgvHJ3GgkxwPIwulHegwiMtt7ydXbIAjEulYxOvcJVzYmR/ECAo58q
 TBSFoh/VERe7Nc3sK9NWsviduN5WLpUZ1350VmQMZSTcrosqesdttkK1jxF2lit2yhwdVKeAbmA
 AqGl8KaELT1RVoGJ8V5+nIAK+N43wWrt1qL0pon/6O9r3enIxZc4iQ327cyD+Z8RvN86M2y1/5p
 kfNIcf9WeoWzydujRtucsWlqTN71B1HMYOMuIfeJLda3YjQN2Zofnwvpt35QkZ/8dQl1nN8pgyZ
 5xzmv3Xlw5s2L094fKYfNPl0RHAV6vuwKE0XQJUi+hH5luXgkLuqWIc5QGwMjWhOr06mnJiHL0x
 +u
X-Google-Smtp-Source: AGHT+IG9IKrPORsZpSd0BqExCjYs1IKR45Pe3pBPIHVpaPBdehB/0w9iyM3U8iTHG4gWRd1gFANmjg==
X-Received: by 2002:a05:600c:1d28:b0:456:24aa:958e with SMTP id
 5b1f17b1804b1-45a1382a982mr2995865e9.0.1754979264834; 
 Mon, 11 Aug 2025 23:14:24 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b90d147485sm5299419f8f.19.2025.08.11.23.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:14:24 -0700 (PDT)
Message-ID: <015cca64-c9dd-4cdd-b07c-2663f7e36918@linaro.org>
Date: Tue, 12 Aug 2025 08:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 39/85] target/arm: Remove unused env argument from
 regime_is_user
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-40-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250802232953.413294-40-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 3/8/25 01:29, Richard Henderson wrote:
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h |  2 +-
>   target/arm/helper.c    |  2 +-
>   target/arm/ptw.c       | 16 ++++++++--------
>   3 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


