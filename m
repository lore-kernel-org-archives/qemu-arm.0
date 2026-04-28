Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7859FF885A
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 06:11:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHbew-0002w1-4M; Tue, 28 Apr 2026 02:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbeQ-0002ZC-NQ
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:10:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbeP-0008F6-0S
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:10:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-483487335c2so106882595e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 23:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777356627; x=1777961427; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FgSipo2+qlmdUmx+mOMt+/6ZHVUHxr/oXkMKbL8Lekc=;
 b=zUmgQmnx0/kxyi9kzMmfayYWU22f1SGiuOMCv42D4V/7TMAXqgQW2UnTi4h+miJ96/
 6PsZdgF926G9uP25p3MlHbTNofs17guT+bc/PvaU2km8Lio5RiXFfaV0alfafWKVTjuL
 vvFmFL711Vm/NrqVIxqXxoSpgRLCp0TP3h0qX0XAw0fKsWnY0z0RZDQaQIUw4Hgbtg2F
 EX1TZH26JXw/BOUpkvrwi5Kwp6zcQq2pc4QOPwy06ZlS0E8+b/lUwrDDITNlFpaYP+O7
 B8RQxWkQBkxXV+UlowxNXtRxcEplIN+e+cHg+Yz+wSFW9FtFyTNoVfgv6EhyB3tBT038
 07dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777356627; x=1777961427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FgSipo2+qlmdUmx+mOMt+/6ZHVUHxr/oXkMKbL8Lekc=;
 b=OPisTAneeHR/mI9rIP9wsxJ2+fU/92aguREzn7YDhz9BTHXVew45mDx3v3ld9vtt3h
 CqJR4ZDAXVSlWCUchet/dlP+d1C2C53G0Tt3P2hb7uyf3m5lXoB7Nkn+VDMZ0pM9beQy
 wsDeTmir2YgtUTcuX6i2BZaa7SMXVaeKxTDoeYhvAb7Ox2QkMDn9fmy4t1z4G5ldF5fb
 NQJ8s4vD1WvfvnebgI8TzkmoUXF7CEBPXVYn66FXIj1CztQRT+8b9zrH6xqm4jjoTEb1
 qx8RZ5ydd3e2rY97//qG/0LIVWYiB+qmmVAZMkR5R734FbwkON3otn9MxdsFim8wZhBL
 wFJA==
X-Gm-Message-State: AOJu0Yw/x92wrbdnjhDOnlGheO7lfQsMJgA/sEWlWKR62ZuJPlglFv/d
 E8qmTlTF08IeLFccdI2a+67uSvLF5rfC/5B7NJPOLtVXSweVIAXDHfObzB9CoYUpw1cHeaGG8TP
 GgXYgGjw=
X-Gm-Gg: AeBDieupzwzl4BGEEtFoX3DKyCqrfbZXgfGu2+H7RpzxG9Dj27QrLCIxzrGngEDnwFD
 rqd6+dVcBy5eAiEx6mUILCix3Mh/LpNu5SECcL5lZ9NnNOlCPgOj16vtM06s7KCVxjtXlrTsiwf
 l/BSYtZQTPMUSeat0uJUmB053PbnSjMndGsMBkgKvveY+LLmtTqzuQzO0Z/V4+6QhZLVifYqy/Q
 2SNptHMzz9COSZw/BeA8Zz8nILEhTssNnDpRYDzDB4QdbjsAYPsBizNluwyDh85oWdYhpXVx4mJ
 l41ZYx/4uyCZG68bBeHm6PQVD5W0SWhrYieG+Kvn7W1DnuSUO7uWTNKIiX7e2BJMm/GHfBsEJCP
 8QqyFgh7VUjiNQslZW4D24mCPsSMjPE38Skc7325g9PxqQaP5HGVIVegss4rv0q1bH59muOK7kh
 C2NPdSteyMzEX8bVZ68zyYKJgXz5bSkUV8iYbgEAqlmlY8FNEd0qxBqPRoXSV2sJt50qvrQteQ8
 PCS
X-Received: by 2002:a05:600c:a405:b0:47e:e2eb:bc22 with SMTP id
 5b1f17b1804b1-48a77ae0456mr19890625e9.5.1777356627270; 
 Mon, 27 Apr 2026 23:10:27 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a77b24035sm26684215e9.9.2026.04.27.23.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 23:10:26 -0700 (PDT)
Message-ID: <2fccc9f7-c317-4913-aa6f-1d67c0cc04a4@linaro.org>
Date: Tue, 28 Apr 2026 08:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 57/84] fpu: Split FloatParts{64,128} to softfloat-parts.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-58-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-58-richard.henderson@linaro.org>
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

On 26/4/26 15:39, Richard Henderson wrote:
> Begin exposing the intermediate representation of softfloat.
> Start with just the representation structures.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/fpu/softfloat-parts.h | 88 +++++++++++++++++++++++++++++++++++
>   fpu/softfloat.c               | 69 +--------------------------
>   2 files changed, 90 insertions(+), 67 deletions(-)
>   create mode 100644 include/fpu/softfloat-parts.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

