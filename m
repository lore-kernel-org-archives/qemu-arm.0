Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08A2D14880
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 00:58:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdeLM-0002wv-JO; Wed, 07 Jan 2026 19:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdeLL-0002ow-1D
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 19:57:39 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdeLJ-0002Rs-Mb
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 19:57:38 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2a0a33d0585so19357155ad.1
 for <qemu-arm@nongnu.org>; Wed, 07 Jan 2026 16:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767833856; x=1768438656; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T7t6+wM+8OZKJoq57Ivh4In2mIxjkP+zkTI1/cumdnE=;
 b=j4WyUL1Nj3ATNtuk+JaZsmiMQCBzxWFC3YNex3M5VufYBU0ibqvpAxl4KwqIERiF4u
 qWSO42cN5DfhHmOSf52T44EmHmQtOPKG6lpTSlOchPOtY3jI102UDrrSjW2G1552BAxZ
 zXnUzH2ObZFTDkqq6YwI+Ukw2N1Eam6k8AqeAtRig6ih3lbWq15Vc9wri40PhjsJ7HnU
 wCx0+AC5eLGPlTjKTXyhaXDLlntDF9lt2o2e46LdpUCbdYDzSR0LV4LZP4ZE+7tP1+A7
 60dHjNCmUEyMhmZLyUevtIHxKbkbOwADwU4sCzUvXV6CIjK89nrVhLq8E+Pp+ZTVTsi9
 OR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767833856; x=1768438656;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T7t6+wM+8OZKJoq57Ivh4In2mIxjkP+zkTI1/cumdnE=;
 b=KSSu+/y5YCukVuf53r7bH0g+jdAzSrMhWIHB5egwpfG26xhPpHBw2B6SA1+CWGwB6Y
 XwqDAPVjuZZDXwlmKIuYFL3N8sHcNOzKtP2rSgL5UYpfJcQL0aylkjIzsDanjegKw5P4
 M49cvuahPixfDGcPBLkxmgG4NeWHvq6wWZiWMCI6uuPRIhSFEA2YlcnoTXm5EoWH98GI
 YRn7nJVuPRV/iJ27QRrHDryfiMNDNSOD7W+9W+9YsTq+Fq/sxrTnZNHGRsGQKnvEiRO+
 IiOa9TQ4xtiADVaiFuIoFdYPixHRZS4KKKvSPDJmDcyKv7s2vDwYCiTA3QJDEQQqZ8U1
 FBCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkC882Wxq0POtH56m8zuknuIx0b6/rRGIwYETL3zLxmN+cCHlAkp50S5QJw81KtBpLFADbWXNzgw==@nongnu.org
X-Gm-Message-State: AOJu0Yxv+GObxjHhJ6H91Bq7vh+VnzMkfDeecOw/V9s7ED102oR8VtC3
 PQHkWIXThDOgZ4teAHiAUzazW4M2lKmM5X5IYHECzGAPkbzL8e+W2cdpJCWL633QQWQ=
X-Gm-Gg: AY/fxX6IVpFalxqYtuKSMLYIAtYZ+Dn+V0poJIuRP6SeEZxVmZkUd4G5DWXwYs9epa1
 RAA4aYGh2uQcWyVjJtP0O6mNffUHD2j3lB6LFDkbEXV79HK5q3QqyrnsbTkSip2xTRvHEKhIiMS
 n6+RVkmJh2d9lcslL6dAjFg4XIVlOKEANw2roTXdbs5ZtrVLWN78Wlf60tqLUhCLIPOHzesQUQA
 KjennsWGXLRnHgI7LV+jiYXrxT8VbefSYIk93ajiEKS2XPRkqo+XWgpXK95o4Ik1U1kHSVumQFi
 VraymnLgSKjsLEmhGH9BNVjhPSyr7J/y9fj7Em0wuTxyVoi1fPGyBix+4rLHS4FHswsz4qS7cMV
 F2D5ZYHnmop2oJ/3+Gyf16yLKZTPKkfbAZ0b2eDD9CHB7Kcb665ErLochV6lVntQesInolK7y8J
 inVaTMgLqkQjfP3dmM1EgW9IhO1BXDhvQuVe3+LfsOPePmrmPv1tTyYpqZ
X-Google-Smtp-Source: AGHT+IEtjWhRfSxvbfI/MFZGTHK/jhiTFYOr5Aha2Y8sRMXoj0VlDMZHdNCxEmnWdcr+yIKm10oVvg==
X-Received: by 2002:a17:902:d4ca:b0:2a0:9040:637b with SMTP id
 d9443c01a7336-2a3ee443be3mr36420505ad.26.1767833856046; 
 Wed, 07 Jan 2026 16:57:36 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cd492esm61760945ad.98.2026.01.07.16.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 16:57:35 -0800 (PST)
Message-ID: <3640a20b-9578-402c-a16e-dff0c6464516@linaro.org>
Date: Wed, 7 Jan 2026 16:57:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] accel/tcg: Un-inline WatchPoint API user-emulation
 stubs
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Riku Voipio <riku.voipio@iki.fi>
References: <20260106231908.16756-1-philmd@linaro.org>
 <20260106231908.16756-5-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20260106231908.16756-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62f.google.com
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

On 1/6/26 3:19 PM, Philippe Mathieu-Daudé wrote:
> Currently we can not build files including "exec/watchpoint.h"
> as meson common objects because the CONFIG_USER_ONLY definition
> is poisoned. We can easily fix that by un-inlining the
> user-emulation stubs.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/accel/tcg/cpu-ops.h | 17 -----------------
>   include/exec/watchpoint.h   | 23 -----------------------
>   accel/tcg/user-exec-stub.c  | 33 +++++++++++++++++++++++++++++++++
>   3 files changed, 33 insertions(+), 40 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

