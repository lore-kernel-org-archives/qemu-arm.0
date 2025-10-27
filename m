Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07340CCF9EC
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:20:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDLHG-0002NZ-7Q; Mon, 27 Oct 2025 07:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDLGy-0001x3-EZ
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:20:34 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDLGu-0001Jm-N5
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:20:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-475c9881821so28170505e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761564017; x=1762168817; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nO3lNScKiiWvqqEh/loTsdCNf697WClZjXeg3xz97Jo=;
 b=hKt9cxaF7FKuIdA0E1qDwd4IFdnoiqBrwHY3Q+UnB6AxT8o3/jfNuR846t5BHI1Mls
 rvaDfRvCFaMlMCdqWa+zp164jQDUUI6q5YoGCsTn3i+YM0UBcISBJcanPKrz/SzgrTx2
 CLkk4I5fdhPueL01xXVNE+pi3SCtA+orF9P7r6JKJqU9mKdLcmu534HmfltcP/VFKxBA
 Yf/fDdd7daK56PeOH3OsEevTkMR8fh6Z7CJugJb3yHXVwKKjy2yUI5FaUmQAIhXOnrOt
 6BSeklQrcknP1673VtBcReCH0eLvrOql/4xtLqCrruEB59MsWztFwaVpf8tsZFz/cQgI
 vtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761564017; x=1762168817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nO3lNScKiiWvqqEh/loTsdCNf697WClZjXeg3xz97Jo=;
 b=rq0j8ed07HMWoqM80ZbWIoREbswVerDg2ZG/AyzWifOHkVSBeNbfuf4ofCBYlrGvj6
 B2Ucc+NNPBQtCvu0++ALXDZtNiN2FlUMciPThrAGvu3BXzC3tGTzUL8HxQPMzpJDucLU
 lwTSu6d1N3Ufag3pzCwV0fEyB/MWnDvHjpuM5IFuxIziKXL1PMBPvHGO6aVkyBccSKNg
 aoYWT1j+XrFNNuTKB4QxfPi/opnNVD6fFV8lmAaywlAcWBIbAge8WIZASgjPiHrsFcwW
 8tpI0X0+oRpoUjrqbUQi6wBT55V58BZJbkEjgWVTVxS0oq0u65pWhQq8gG0h9p3dHuDq
 TStA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmZTGjFlQZpgOKavcjrEMmgSeouXiLIprbylBXuIWREX1NTENP8D/pgDmDVxFu3RLWYPodvIJW7Q==@nongnu.org
X-Gm-Message-State: AOJu0Yy0ibj2rntisKE0UuJiRcCC01ALWphA+sPoXUGIUIv5LQqx848e
 4K9Ss1PwN6WnbV8ir7wnD167IdqcnqXZr4OebzMWDBE4MMAUG29WXsLwouBHK8H+HJ4=
X-Gm-Gg: ASbGncuWRFxwAYVy/YgaHfDNoB4mE8/mYOF672qgWO9jkxTmuGzxCq1Jg8sKK3Fkc0e
 USN+UdN7diIVntnnTQViuE16cAqTofwxEcatR9O36evYlDRH8GfDFXn/r68Z+KOrzwgII4XW+7w
 cuUA52mLiB5+NBgknP+KZRIPh96gZ5I9f0E0NB77s9kbQNw9kWNkzTYhEQEoVCkOF05iOnRvRoA
 Lj6bCTP8MWC2C+gXbHjjbESSFdXviAN+VZedqZpHgzXselLa8RFKf3ZAOlcXQgidUBkQpq792Vv
 Kz9+WU+y9bxp7WTd0uc5xnzfUT8sB+ZnFhr0XP0qdt8XzXeppb1twv5y5zruLJpcEKBQfb4+EJ1
 2oOkGog9Fk6x8JK6etAtrRPbU7eLW9v6p05upyiAhDohJ+psKdb82WurhlUSiIWk6gcwKKY2Jd8
 BHlEcnoRe5HVpXV4jfzC69P7YPXbp3GbJ70jpxT9XVDN3SaLlUzC1NMlo8tco=
X-Google-Smtp-Source: AGHT+IHEUnV1AykrggKoia9CZDo9Z7W6W1PE4O2InlfS6IlS1+bf7cSFHkw2t1kCvzUiRP7UaublFA==
X-Received: by 2002:a05:600d:42e2:b0:45d:e775:d8b8 with SMTP id
 5b1f17b1804b1-475d24088a3mr67734275e9.1.1761564016749; 
 Mon, 27 Oct 2025 04:20:16 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dcbacdc6sm65522715e9.0.2025.10.27.04.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 04:20:16 -0700 (PDT)
Message-ID: <2e6c67ff-e8d3-40b0-a648-f0ad755fa433@linaro.org>
Date: Mon, 27 Oct 2025 12:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/35] ci: clean-up remaining bits of armhf builds.
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>, Stafford Horne <shorne@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost
 <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
 <20251027110344.2289945-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027110344.2289945-2-alex.bennee@linaro.org>
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

On 27/10/25 12:03, Alex Bennée wrote:
> We no longer need to support 32 bit builds and we missed this while
> cleaning up.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/testing/ci-jobs.rst.inc            | 7 -------
>   scripts/ci/setup/ubuntu/build-environment.yml | 6 ------
>   2 files changed, 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


