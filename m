Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2276C9830C
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Jan 2026 23:27:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhcAS-0005FA-JQ; Sun, 18 Jan 2026 18:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vhcAQ-0005D5-EA
 for qemu-arm@nongnu.org; Sun, 18 Jan 2026 18:26:46 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vhcAO-0004Af-O7
 for qemu-arm@nongnu.org; Sun, 18 Jan 2026 18:26:46 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-81ef4b87291so1881890b3a.0
 for <qemu-arm@nongnu.org>; Sun, 18 Jan 2026 15:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768778803; x=1769383603; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6TLo2Cwi89Tia//cIIBXxHzV65Osx7kZtVYFIGd35Ek=;
 b=pY3e9a1CSrkUjl/YjnToJGSpw164cEA7RkYl+cLRbIJSaayRpIUO7K4QjG1BweD4dB
 Z1rLwKJSrCbIllX4Xwx3SbdYCPnrYrjP+rJ7n4TebiK0w8WyLLUjlProcbzUmf7pgHd2
 u+YDzDxkUb36kx7mggw6s4kE9KgBomvsp1aLWrYnSP4cSc1eTRfC9TJr3JqXAB4odeWJ
 4kpDB2Q8bEuxhRRyKS9/MTYlisE5cIN9bUtmyxJmlzion9wikyZndB+2bTk3AclTZyqU
 wwvCCSgm23d+EqaOLv4YFDydHDp59ld+Siw6u47YOXkYIfWKm8WNn77bgs9Vr+a4gYUy
 9XdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768778803; x=1769383603;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6TLo2Cwi89Tia//cIIBXxHzV65Osx7kZtVYFIGd35Ek=;
 b=W3M6rAkIwVfaqUkLEkxo5Bl7va+tirZODl8oHculGdMI8qpNBYKUy4Vt4lQWVfvwar
 83uJdb3M0WmtDsSnwepIYbkhtKLdUCEeB0R+ZF6v9MqV0HnTp14ixaN4tBd5Qr+5fM6I
 OVSwlANZrSSH7p+eNPF5/Ho8nydCan1QyhXX2ui6b6C1iyZIBk9DrE+E+KdRvrGAg50V
 1sUp64Ak9HtqCjLwGwHKAuHv2J8D2NzEsJlWdJQayUrk1cfWtie10ivHLXt3t2QdusSh
 0nTiL1cjzmTaZlfc3FhtXZLO8uCD8u/7N/kOkX1T6gBPEWLXWVRccmm3xKuRutKc06Be
 +aUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgRURViUlxR82ubbZvwsTQSb3OHveJdzNQm4XYCF6K3yzqBglG+7E/We442NG9gJcp6bw9ym9zjw==@nongnu.org
X-Gm-Message-State: AOJu0YyzQc3nO/4hLtV+fQUCwY/akVWQi3tvWaQSVTux0LL3oFsJJ4RL
 ud3Gp5YRk7mEsgvh0zqePGRaSU7Cb1piJvLPHDbpxvEzMDPuxpcsGD98K3GZF1ja2ic=
X-Gm-Gg: AY/fxX7A7IlESIGLCnvrgCJy4x2feNL1WFJcATK5KBYpfuIliuXkRRVtkL02MVfTrMT
 zQwFx/EQhx37EcDDRWFKduCHipkaHXDJMgl3DZJre8sJCqwsARjhJfW2Diq51Kd3rnEJB2KiON6
 cmUlPeO5EJLIK4jqwva4gWUJxebFVoN8Olt8n3WaziJexjI1vNBqgEkp+nRYPI/hIvt/NqkimkD
 oeDa637ztrabS9ogu03HDzTp5zEgzGgvSL9sPMxKmmFokd2he9iddOYxwgdG9CKOoaNf6A1ZTYo
 b9UDAmmA257oIH/cI2REOhx9zcJEPgOti9eWrGjwYBfuyiX247kSd8Zq4JKw2Yk2mOHKCMmREgi
 PMFjfVeyy9Ls7zsNOE2hCwsk8o5IsgLtADZ4slQHium9cJEGgqBXgo/Ode3FdlDCZs/dcMNxAdE
 SRsuaqGLNoo9M7rbYHqJg9Sv8hvWS2mw==
X-Received: by 2002:a05:6a00:180e:b0:81f:2b84:6eed with SMTP id
 d2e1a72fcca58-81fa03b2c84mr7929514b3a.68.1768778802691; 
 Sun, 18 Jan 2026 15:26:42 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa12916f6sm7224828b3a.49.2026.01.18.15.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 15:26:42 -0800 (PST)
Message-ID: <a3f82728-2293-40c7-a133-3a13893f09cc@linaro.org>
Date: Mon, 19 Jan 2026 10:26:31 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] accel/hvf: Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Mads Ynddal <mads@ynddal.dk>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
References: <20260118215945.46693-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260118215945.46693-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/19/26 08:59, Philippe Mathieu-Daudé wrote:
> Since v4:
> - Addressed Akihiko's comments
>   . Do not introduce hvf_arch_cpu_synchronize_[pre/post]exec() hooks
>   . Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0 in hvf_[put/get]_registers()
> 
> Philippe Mathieu-Daudé (2):
>    target/arm/hvf: Move hvf_sysreg_[read,write]_cp() functions around
>    target/arm/hvf: Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0
> 
>   target/arm/hvf/hvf.c | 167 +++++++++++++++++++++++++------------------
>   1 file changed, 96 insertions(+), 71 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

