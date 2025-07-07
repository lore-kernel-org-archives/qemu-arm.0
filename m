Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6ADC83030
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 20:30:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYsTb-0004Bn-An; Mon, 07 Jul 2025 16:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYs5i-0004TZ-B7
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:05:30 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYs5g-0002AF-My
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:05:30 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-6fae04a3795so41073876d6.3
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751918727; x=1752523527; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V1ULYTnO6DI+Jszyr+Qm0HLYEZk+Z43fqt8vngf2BLg=;
 b=ylKh9ocKjq875I32lUGr5gxB9rFAdJ2dGUOZjXYBnQqTayhsiJA8nMlUaJZCypVIiy
 tdFWSgDiN+mZUQOtT+H8/ZwqqpP4KOGfyrPWG5zK9g+4MwGISL76FymgSFKL3LTcD1uj
 XUWlHuuzR22rFJ890IvhP0YV8dcaY3JOOHT964+HGI9oybai4opEIsI/ZK5bIOQqvr/M
 Ie2/bSVWrd46jokP28SloisJNdkqzB00L2wx924h8vk0hkKdPGCO7FNbbFg/11QK6DYZ
 PCn6aXZRg33X7SWCK86k49Iy4xgoDul5j8wvfJKd8nZMpOIXM3NrJ10Fn/0PcHqgFCH5
 9Aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751918727; x=1752523527;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V1ULYTnO6DI+Jszyr+Qm0HLYEZk+Z43fqt8vngf2BLg=;
 b=oVg9idd4ox3F97OlezXH6sSNgDhAwFcuf371xUc+U2/mpM/BTwgSRf5Oce0nX3ndBK
 z1AC63f56guxE+judpUcvV9tCRjP9EsGLfyEpu7XHwsSPjbwgLnRLw7gR97vAMWkIAhZ
 fy8nRkgy12QKHSNWc/n1X+A32MYGTeWyWb1TDsLblvaFha8JzqIrs/gg7tcsLCDyz6Cg
 GVGyUkFEgPfjfNkjAtH6mK41nf6Je8LbttKn1bIKpWl2S9I7h+sOCJ4Rk0W/yy4/3bWp
 LvHQ4SFzuKF6+JyjO1Soxzm0Lg4LwhGIZrMM19KLr1c+tFcaTzh2MQzgxBwT7wTY4/Vs
 vBQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgrCR9eF2GG1MzLd1PBVZmxYYNsf++MigEhVLjQm7ZpqVKpZuU63Ze7e/of5X68I8ORDuy+M83bQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywq/CN1yLgM2uIxorlwx+r/Vq0RbbBG7T+azFilC2zyJrah1UoY
 pIZuMgfkkSzfrswTEQKwfsmLcpyXG5U2nWHeOReWlApfq8VEK5Rsgax0tQ21B59KgO8=
X-Gm-Gg: ASbGnctweW3Ll+s2HqHDi42xjsDXS48uUpvd27Ls/fiGU2jAKuadNmh47zx1D0wKBSX
 sg4gN1ayjRi4m2wEdFyaMyEag4eARXHyX08vhpUl3EOHd2oR3SwbUik2F+zi7jM2XvZBPVZGh9/
 nUfwzNGzfi0P/KS6I5DbNdmUJV0Kuq/ibmEwifqQgLmYpuLytq4XSnq/se3SuXeDPEOcjOGV0XY
 tr/xq1iurWYAJMEkLf7wqTcZnBuvr3WjVE7fVZKz6GC+3aZwWrdELeFgzcQmXFh99XWRusjHt5Q
 QZgDQ7yDi5LQWsukDL2ChmSXw6dZhe0uw1n1alukCaeiUnx0bqCFVSswPR3ct7i/32YTGGaAPMD
 /iQ4//pq+s+B0lCZbxhEQidKMdZ7OXUFtmFV0sw==
X-Google-Smtp-Source: AGHT+IG5iz8u4zSUWQL9dnJOcIP64xIi+67sKzgql5nFwziZCA4NnGRu8vF4PXG34N41Nrf7juy2GQ==
X-Received: by 2002:a05:6214:3107:b0:702:d915:2bf6 with SMTP id
 6a1803df08f44-7047d912155mr3959236d6.7.1751918727117; 
 Mon, 07 Jul 2025 13:05:27 -0700 (PDT)
Received: from [10.225.72.227] ([172.58.142.143])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-702c4d50f7esm64295886d6.59.2025.07.07.13.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 13:05:26 -0700 (PDT)
Message-ID: <e059afdc-0df1-4b51-bfe7-1bfe23e9ac8d@linaro.org>
Date: Mon, 7 Jul 2025 14:05:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v6 01/14] target/qmp: Use target_cpu_type()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>
References: <20250707172009.3884-1-philmd@linaro.org>
 <20250707172009.3884-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250707172009.3884-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
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

On 7/7/25 11:19, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/arm-qmp-cmds.c             | 3 ++-
>   target/loongarch/loongarch-qmp-cmds.c | 3 ++-
>   target/mips/system/mips-qmp-cmds.c    | 3 ++-
>   3 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

