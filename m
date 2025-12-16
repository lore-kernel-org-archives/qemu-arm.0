Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E3DD637DB
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Dec 2025 22:53:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVdut-0005Vc-2e; Tue, 16 Dec 2025 17:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVdus-0005VK-4Z
 for qemu-arm@nongnu.org; Tue, 16 Dec 2025 17:53:14 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVduq-0000fO-J4
 for qemu-arm@nongnu.org; Tue, 16 Dec 2025 17:53:13 -0500
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-bfb84c2fe5eso3951a12.1
 for <qemu-arm@nongnu.org>; Tue, 16 Dec 2025 14:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765925591; x=1766530391; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=97eb24TtJtzRV8hQQfX2roM76MdnXtCmhpyJRZkPRwg=;
 b=Mvr86p17am9WlJQ2ZmcaWLVAk2CUkZU4T8vGA/My3PHOmys5aqfGrYSLMIjTep0sw6
 xg0mEbXdy2faYATcnEaCFlbA3fgk+Gn6hdV453TjI7BnJFhtqLl/Il5DLjAL7XpdwsCA
 62rReWLEvPzY7lRjIqDmLEatyXDFqqJsYLnir/U6nGTum9GRw7OyuIU9hFmtUklgCMWp
 uVYsdtclKeWKv/HR6E1wHhs/F5wCDyuwqxNX+ySP25YgZnbHjXZaLSmd/uZ8p7WjEXLq
 UpWQqShEE9J3xYQJ55LbChIlQnJ6yIHlPN8WpMig3tAqCurpcCEZV1IJ/QT1BP14gTD4
 3Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765925591; x=1766530391;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=97eb24TtJtzRV8hQQfX2roM76MdnXtCmhpyJRZkPRwg=;
 b=a24xGsdQc4u4lhl9jxInayKAO1IrVyuG2mal81Q3Z+r4d1wn4Vs94qCXyGWXxizrcL
 KcSwT/uWTFDzxNfPnMyEqnpFEPsw1VxBWpXHkZ/qKHFzksGsRtZBe3AMRMevmeCJdR85
 +1dhIOFpRWA467dHf7at5UV5SzJqxJsDoMtv8x0hZfr21I487xzekRMBGAS4ugcojpn6
 tSnGw87D0ONRzWyrHpZBngHAwVi+gPIcR4gabANJD6sRXyoYNnJYB9lJqZf4yViUZjOu
 25j7gpvvXcuhZtsR71LpVsrsLWgttc/jCZaDTH7b1Ab4k0sunqJyFAjKmdTb9HbJd44z
 nHhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWibefNQYDFxDnXrJrZdDnPZ308EW2ZcyUnJDe8iUXk7iaRZFUn2zI1iQDIxzDTBsngX9vsJePxqw==@nongnu.org
X-Gm-Message-State: AOJu0Yy4UwRdIE7qlN36PCA7aKQIOZCLwNXy092geGD+Agc60hZ9T/D9
 17yKF/ZZF8rMPMfke2iOmtKrnvSlabp9m/+wVlYW6KrIsnIWBmvTzD+YSRKePAr+dCE=
X-Gm-Gg: AY/fxX44kWCJnCHrS3SKbwVBF5oi1XpiXHSfKclXUyEx+2IegLxH3QLVvqGA3J3vq9/
 1lwOapdtHYkvLfbIu8hunIt+h9JU4HlVVS0sJEwu72PafFtncMv471jz94wCgSh/qsWPxJS+i8D
 rN2vqRxxd87m+6RUs6hniz66U367qM/hxGTUvAi4r//genLajJ7Fe/USz+3MVOaQDhL0cxDUEdX
 WnXDwDaif9Dg1ZYFT3NMyq07AQDqf0BIzztS1DGUsIxfPrCj8O7nqZdNQ7AMNxfyrO1mbO+mOq2
 NTIYCBi43jlGtf4ajeLBoTaTtsZo4e/dgHUQyhoM/u2EEITdNGlsMDhnYH1uskX0/nxbNxygvx1
 DW+68flSyYejmtPNuq8ZxvdAD2KKA2EqbJg1CigJAixuurHMqVNfw4XHBSFFQMGwOjrdKmZxOv2
 L3h+uHkm1Q+RPiQEda43/p1xEKvu50c3SOJqbog/sxigoyqcCFEu/Eqno=
X-Google-Smtp-Source: AGHT+IEfYMNZIgogrzbvjAAtbewpeuKdsv9i0n9MTGYfb0NHhiR9o4yNvtiMsDPpAUdWrdHTjcvAnA==
X-Received: by 2002:a17:902:ef02:b0:2a0:835f:3d5b with SMTP id
 d9443c01a7336-2a0835f40dbmr148489965ad.6.1765925591099; 
 Tue, 16 Dec 2025 14:53:11 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a099e77889sm108331505ad.22.2025.12.16.14.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 14:53:10 -0800 (PST)
Message-ID: <a82b26be-9671-4a5e-80b3-81bc6cc40e15@linaro.org>
Date: Tue, 16 Dec 2025 14:53:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/arm/smmu: add memory regions as property for an
 SMMU instance
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: tangtao1634@phytium.com.cn, Peter Maydell <peter.maydell@linaro.org>,
 richard.henderson@linaro.org, Eric Auger <eric.auger@redhat.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20251216224845.1673051-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251216224845.1673051-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x535.google.com
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

On 12/16/25 2:48 PM, Pierrick Bouvier wrote:
> This will be used to access non-secure and secure memory. Secure support
> and Granule Protection Check (for RME) for SMMU need to access secure
> memory.
> 
> As well, it allows to remove usage of global address_space_memory,
> allowing different SMMU instances to have a specific view of memory.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/hw/arm/smmu-common.h |  4 ++++
>   hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>   hw/arm/smmu-common.c         | 27 +++++++++++++++++++++++++++
>   hw/arm/virt.c                | 16 +++++++++++-----
>   4 files changed, 54 insertions(+), 9 deletions(-)
v3
--

- solved issue with user creatable smmuv3 (found with 
qtest/bios-tables-test, subtest smmuv3-dev), which is not created by 
board file. In this case, smmu->memory is not set, so just use global 
get_system_memory() instead.

v2
--

- Fix rebase on top of master
- rename memory and secure-memory address space with
    "smmu-memory-view" and "smmu-secure-memory-view".
    If someone prefers any other name, I can change it.


