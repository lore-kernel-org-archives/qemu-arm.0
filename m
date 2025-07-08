Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5327FC8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:50:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFFJ-0002j7-5D; Tue, 08 Jul 2025 16:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZE77-000600-7n
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:36:33 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZE75-0004kY-QL
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:36:24 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-735ac221670so171148a34.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752003382; x=1752608182; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F2HpjSQfUcyL+dk5nvnLr+0m8+LQPNaBS3pAOPLTg4I=;
 b=razgcyIGqb4S2C0YiTPXa0qkS393kj3I1ze3aSHDtYSDtewt7nA/g+rOA8GIprYJ6d
 3+UJ800VUCU+d/2N9+4jMt4BO5PesQgKXONwjYB4HQq5ZJXBVEdSHzcz/HMC8byRwsCg
 IKZQWtZFSztWdd4dzT5kslVtbJ7MYwDUpR6EjavMeLE4ATho5UNjmjyUUAEBwxW0spG8
 /y/vHuqOvAh14qa3zw433uLHQVTiT8oEecQdhLIolFfTe5g2KZOufswPqpILfXnmtFQ1
 oBC7wveEuRtimuzXTJraNsl1aLYgMIEpAAXpri0amkKt8jleVbul211uAmkkik5D9EO9
 +mPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752003382; x=1752608182;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F2HpjSQfUcyL+dk5nvnLr+0m8+LQPNaBS3pAOPLTg4I=;
 b=C8p5C60yH+eojz8mdz2riaQxrwUvcB00Bw5kEXesz3qaOTdXrhC/F4airNs8NkZ45c
 q7mP+WO6g6AWPb1oGxmySpOWlpToAXyHq/zW1YXl95YfzZ8NARr3cyT1JI30IvnSikKw
 nnq3rnfJp0//SIeVg6amY3rS4925RYEe9zUh2E6Io2LooD8Dl+Q34GWBVppHqYf0v29I
 tKQLoaFJUoF3Pj2IUQdhz8lysJo5BSLyz7qba7iJhAedZOUqn6Zs0EAHTMi3N4dhmwxv
 bpJAvNWqz0Jj9cIq7rzWeiZaR0muq3PXLR0meKC11uTE+vwxRGkZ7+CURMgZ/OVP4Tib
 NXlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGA2v2y4GmsKt2oRLmVQonWwfUinwabbUGwOcq2d8ff7aLpP59HCllobeU+zw9tOpq9bT+ib8Jpg==@nongnu.org
X-Gm-Message-State: AOJu0YyXwdE3B7ULK4b8hygK7kmZhHfjpelDj+fqwE+9aprJXlW8mHhN
 Lp6Tnm2cdsNHgQel8byl44uSFQUfARk+Le+F9QT9LNIhTZpX9JxGZK8hjdJYV8osLD7Yxj3gij4
 +Ju3q
X-Gm-Gg: ASbGncupgY38hjO97QDSg4tYih9YDDBYXMAaYoT5aYDM9KT0w82UK7tNdG3HRwYypnv
 bI9X58v2XoUiepgZ0s9F0WKWQS3tm3J//CAcVMup2A4ZCOHhZC3ookB2bcciv3MFs2hc7ZD7D4Z
 WtfEmurx9vgZ7QK7WSeTazQQc2JvGxISNtUSpl9VADRQvk3fsv0H2icYG2O4oMMfY5yCT4go8oO
 LAJEG0BS/nr4Dg50S0o67mzECAB9jVOOLuqVhbR6t8rtWSolwhEmYqmmCtHSINl1ETZXhv7QxXZ
 MiBJNhrm7oebInv0RclwtlWiYlSu7fkj255eaFL6SyGcoFzhe8e4n8UqtHHWgf8VAgvssy8+gmM
 =
X-Google-Smtp-Source: AGHT+IHpQZ5mayqXOBtFoWMKmAuI9WiG8w0UvJ6VnSm11hYptZaOI4Kwceq/TASatqqqGmROppu9jg==
X-Received: by 2002:a17:902:f644:b0:237:e3bc:7691 with SMTP id
 d9443c01a7336-23dd1cf882cmr44518155ad.13.1751995993465; 
 Tue, 08 Jul 2025 10:33:13 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8f1241casm92720165ad.76.2025.07.08.10.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:33:12 -0700 (PDT)
Message-ID: <db881c13-afa7-47a8-b8b1-7a7aad551cd3@linaro.org>
Date: Tue, 8 Jul 2025 10:33:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 4/8] qemu/target-info: Add target_endian_mode()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-5-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-ot1-x333.google.com
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

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> target_endian_mode() returns the default endianness (QAPI type)
> of a target.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/target-info-impl.h | 2 ++
>   include/qemu/target-info-qapi.h | 8 ++++++++
>   target-info-stub.c              | 1 +
>   target-info.c                   | 5 +++++
>   4 files changed, 16 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


