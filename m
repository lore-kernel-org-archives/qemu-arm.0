Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2823273njc;
        Tue, 5 Nov 2024 05:33:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUNvYp3sW+0xeNpGoHQXCIpxNp6w2qy+XVYHc3y8Qosm7DWKtbZpKZrSRWYjF5Gfn6yJj7eoYsDF2/IQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHPKhTCWvZ1qw3nBCAyqdtas1J2YiShT3vk0KLfd+pcX4IGSS49PTXrj6zmZ9TzK4TS5jCq
X-Received: by 2002:ac8:7d8a:0:b0:460:e63c:8f6d with SMTP id d75a77b69052e-461717901ebmr333051641cf.39.1730813584803;
        Tue, 05 Nov 2024 05:33:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730813584; cv=none;
        d=google.com; s=arc-20240605;
        b=ALGv4BWmbnsYaKUwXh2oldLpEvN2aaTi5ZK4uuGAvGX8zczVm12epcH6t0/rnifX3u
         VTiV/f1HmESkQmCbaS40StAeup2V3nrlV9TwR7RvCMhPdqMW36CRqbll7zRqgVYK+ECy
         DPWWNOetY6FOBVRVrjDX6MmBPU4rpM+KiK/mk0oezfzlQYqEcly0ETSxdXY1xfEU8oJZ
         cHbzKp/vW0RbGVIPbcm7JCe0kOBPEIk/vpo47HRtjYeB49bt3gvkolBANZb0JHP9xxjU
         ZA0NfQnafYpRL/Zoar6BHniK5IK/Ose3Oft2ISuj7plNylvUdbYaOO/5BjqU+okIV51g
         BbGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AJrClJZVW5JpUQ94DExDgaggJsOe5PVA4ZSfA6mYt4E=;
        fh=c9SgD6C6OPo2tXeVG/2Y+y281f3BtnytcuKzqIaawlE=;
        b=i1LUHez18tT9LjSYVPHNb1KFwW/eVhLPEu7tyDlK7iw+MkfDzXMDli6V2/ONZkFSQM
         37Spmuy+t0kOVAFBR0vyQBjBBxY55Uinnq2kjmnjo3ItZum1yAPKbpT9lFZykwd4iAMl
         XDTlBjH9Zuq90KaHV+1+MSIyKJP5o3YNh96iXuAiTX4gaUhQ+3FdOk7w0uhvJT4RY9FQ
         xizbMvbMKJ1wC0+XjPZNSMU8DfmLLkNlICiwweiCe+K4s0ij/BRfVRKICqJh8lU0WZsp
         b/JCAlHpAdVAsFu5cf1pYD5VKnwBNkv0My1/6UXmu+ZJcPtWax+nI/0aL+mH2bRRPgpS
         M+1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=isyJy0U7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1a1196si128255061cf.321.2024.11.05.05.33.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:33:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=isyJy0U7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8Jg6-000527-Uo; Tue, 05 Nov 2024 08:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8Jg5-0004zo-RT
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:33:01 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8Jg4-0007X3-D2
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:33:01 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso64875945e9.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730813579; x=1731418379; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AJrClJZVW5JpUQ94DExDgaggJsOe5PVA4ZSfA6mYt4E=;
 b=isyJy0U7bKd30lVgO/IZgO8jQ3hQ+sGj6OSa4BKuwSNnE+S+A4FQe9pwBytZcG3sVL
 qReYESLZGcYuCPNET+7LqJOrOImlTBzaBD3PTnaLGcV4bFZQW+Qhq91YC+wmEESLwsed
 bjoXIjGuiG2xBuAZRUcw17hcjbhBCKpPKFKOKvAIggylQiv86+D1pnIoZgHcFKSr0VZI
 ANM2c6pWZZ3YHv4j5QC529OeShxFBKry3vjGrx6Wv+VdpenYU1MSBy6e0V9r7JiXw8Dx
 f1igJlU+vQd1FiVpuYP6R3siEDw9G/OVBZeausQVunn38nr4gpkkxnMXvjVu+7EB2dUl
 JYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730813579; x=1731418379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AJrClJZVW5JpUQ94DExDgaggJsOe5PVA4ZSfA6mYt4E=;
 b=XHD92aZkfDygfVlfB7cwEn/Qxhpc6sNQ2X7Qdh525jYNvEAjCqDGUDmABxOTisrOfH
 cq6FLoiQq5zx46ip1J9h6R1yvDg9h9Hmce2OGlRw7KJTqhdLCsBzqmpUFkuG7UIs/a1j
 DpOJZBBEnvm8rlY0KJ3E54m0HlzdlRFO4A5OUQ+f6kRIPLndAXVq6dACZucvnq6+raZB
 79FQhHpF+qlDOyrjAc5YxwBofX0jCCEhIm+WOnk51yqHtGVpNr/4Gw7iIIdYtMA+bK+G
 gCcI8oQd6qaLp+6mdW1ijwBZdj6Ci3U9hhhQwkDpJCEI+OabWdmKk57s2WuNjy6bxJlN
 V9OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS5LtolfOqJ13SgP87e+kTTIEc1125fmAviQJqNt7DiXFpHjXew/xa9CbO9g7TFBJqwaocwh9kkQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx6NV328dhhQRtwIwpboAVDGylGrTtbudar7yNI0LdobvBgFqDh
 XvizG3BNWarUNOBOH7yJFl1PHl7YJYC8g/gdp4t4veGlAikDQVNalffg8Z2GUFA=
X-Received: by 2002:a05:6000:782:b0:37d:542a:7995 with SMTP id
 ffacd0b85a97d-381c7a6d37amr17165013f8f.34.1730813578634; 
 Tue, 05 Nov 2024 05:32:58 -0800 (PST)
Received: from [192.168.21.227] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116af7esm16231533f8f.103.2024.11.05.05.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 05:32:58 -0800 (PST)
Message-ID: <ffb56b46-cae2-4428-a3ac-89576046f32c@linaro.org>
Date: Tue, 5 Nov 2024 13:32:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/19] target/microblaze: Introduce mo_endian() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-16-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241105130431.22564-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Qc/Cd0YOBN/f

On 11/5/24 13:04, Philippe Mathieu-Daudé wrote:
> mo_endian() returns the target endianness, currently static.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/microblaze/translate.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
