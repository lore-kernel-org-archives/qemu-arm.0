Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D821FF5135
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:18:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wABXV-0000FO-9e; Tue, 07 Apr 2026 14:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wABUB-0002em-J8
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 14:49:15 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wA0O7-0002A4-Gd
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 02:58:16 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-35c206f0481so4558754a91.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 23:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775545094; x=1776149894; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XnWq8SxFln/RH/y/L7cp49ARGEJu5PkiuW3cli+99YM=;
 b=Y5nR8lN7JORiLlPj0jsRzNW+EQtVXgtMMBO0HQ8iJETW+S+HFY8JVCvPH2kpmh/lqE
 4tKvZtfmWtsexrSScQ+KFl8lUAeB+ssxvK6jqO9aOAumvZzO/O/97QE7wwkC0r+jSzow
 x9nYfbxTW0B/9XijWBTkFDkVBi5GJsFq3863EYtXUfh7Ov2dMODlFipGgpbH+/A6xmc8
 589P3oRSLl+TtM1QJWs//HiTai2ZezaYKzzwqJfWp4OjQkiP+SOt433Uz2nM8UE1V4z3
 RbDSiVtRrAFXYBKqOFoQn1oT2mwsoWNtblCBsM8E12c/+pbEkMSHT5uP9ZtGMyLyjP0P
 sKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775545094; x=1776149894;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XnWq8SxFln/RH/y/L7cp49ARGEJu5PkiuW3cli+99YM=;
 b=cEPJmJ+S74SUGdZveIRSGEmAXKDLQYW2rFCIKN6Cy0ydiuqkhuaYYZ5ZxI9wRSCSIn
 UNW6nzTej6X3xy1EOjTQFqwbkMRN0uDY5y4KebpFRD4J8l4QrNO2nSYA28qq29AN/ino
 vHjx62ybZyCq4JyyfA89SvsY9aVbzTtg8/2oCfe21Son1CD5tQx6Qy9r/Nv4KwbqdVzF
 +3d2LPg0WMkFem8L5ueO0+jG/s5tb0DsBmZd/v8Md1bgkzGI9jlR50X2Xq62/MlD4cww
 BFyXxOsJbvEBp3kexy5nuBLqPN2IgmxIZmnDT4mZAy0ppKrnWpmPCc0TkYx8K1VWDHlF
 /Tjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ6bE5h+UhC5iJxKqF0zeOtrwXiPYIbpAyMXjr5AlmSVzkD5pV4jLXwz9Zpl8dGstuDPASI3fsbA==@nongnu.org
X-Gm-Message-State: AOJu0Yw+OlepgO9dbiPuo4yCl6SpO7SX466T6w9kKpPZ2H3noc9s2svp
 9pmqIZRFtH6eo6Fimax4SmjA5C1kMDUhHX/Wz/fZvs3U7qxOmomcvmyQGdEzMnDIJxo=
X-Gm-Gg: AeBDieuxjFOyBtMy4/loCcCuFgvu2G3zMl0VrPXKemu7gy5w8DI4yslXc0WGaVe7QS9
 ZqCSUCbKtc0CSAW9JMM47HuJc6NfX2Qs02mvfdkKDySY3WM8cjSZjv7ax2rI2tNZJf9I1QJbT9A
 QgMFfYbhhQXq/6/w4TGSPMbYONvEOIMUpvQK4pG9YklYW5vb3odSsBwru0C59HIXGMhCk7dumws
 ojKfGpeomwu3CAFpQY8fHWTJEWPx4bdFD8LE65jVK7BY0E/1M+7qBmHtboEx+qLOuYlCwQiVGl4
 uLitzYSPYvbDQESY4hs+LyX/cI/yeHtBMGHVfBXydEzS8Rce+cdWsPS5ZsTzGkYIp8YVeGlWEDk
 dMaCLx32wRvCX5RsWGnKjq00sPEQ3ErARlNHp5BAgUAxveW0dA1J3Y1BdK/auxSWfpPqXKQdSGV
 X+JU01i88kYY582+KhOJk3gnGSrjH2lhJRmp1QD8IsJhadNX0bJmDuLlxq6/h0X3iY5Zo=
X-Received: by 2002:a17:90b:52c3:b0:35d:a861:36de with SMTP id
 98e67ed59e1d1-35de691b394mr15494501a91.24.1775545094055; 
 Mon, 06 Apr 2026 23:58:14 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35de51fde8esm4541783a91.3.2026.04.06.23.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 23:58:13 -0700 (PDT)
Message-ID: <aa164e63-35cf-4a81-b299-dfa3cc4a5ef3@linaro.org>
Date: Tue, 7 Apr 2026 16:58:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/20] target/arm/tcg/translate.c: replace TCGv with
 TCGv_va
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
 <20260407022748.57629-16-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260407022748.57629-16-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 4/7/26 12:27, Pierrick Bouvier wrote:
> We know this file is for 32-bit runtime target, so we can set
> TCG_ADDRESS_BITS. TCG_TYPE_VA is derived accordingly and is already
> passed to translator_loop.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

