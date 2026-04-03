Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC99E88D6A
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Apr 2026 22:01:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8mZZ-0001e8-1l; Fri, 03 Apr 2026 18:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w8mZI-0001ck-VS
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 18:00:48 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w8mZH-0007t8-75
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 18:00:44 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c74f0c3fc16so798019a12.2
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2026 15:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775253640; x=1775858440; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E5Tk5h0DBxV7WnAoGiV9hDcqtMbqZOUY9apv3ctT524=;
 b=XCX9GW7DnQ2Hmd3fXHp0/DDYJ0xctq6okM2cU+IKTwlu03ZJaisDJ+M2dgUVyp/lUX
 dKc/hSheroCeNGnOlXIrpjU5DtYvDdFt4tmMD84VU6i6ZGvaZWV5EIjK5nbdE4FxFJZJ
 8PZaz7dYlEqDJaFlso+xx9VVghasfa1TXnBqFcQl2EvjgDvqLShL40W3AJIm3hkvCvkw
 CVFOeVCGoe6bP2NwW2hZlynaOkFM4kmipFWqi8hCtHhZMRUoivey/5kW1y4P60qYHolO
 Xv8cn9xlbVUQDrTnEXGy8y7ctTikB2JDK4/r5Zc4k4sMO9CoInT3NXuFS4HSR+D5b37D
 qV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775253640; x=1775858440;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E5Tk5h0DBxV7WnAoGiV9hDcqtMbqZOUY9apv3ctT524=;
 b=Ef3rDsj/971Oejt4u8wyDIOCgTXTGVN5XespK4Eh72t5i7NAJJC6JczYJURpouBpbs
 dcmAMTVAWDUPRTN0g80X4Q/waFLRvi59t/UPWMIMyYxe4cZCUljQmiM6adbYNsqaC8ov
 T2p7gK+IiVSrkUPTJ7Gd8YXShQG+/dR6t4CtzYV4Gx4EZM5wkR5TrrSqqr40/nbECKN1
 D7qzkSEjLuXzlgLOgNKRMa6ezmDE09Lcc7k2PJZMKzJGUEs4H+y9JYzog317lu92T3MO
 A0NnHQExwODkoqFnQefwAUtV8wfoAyDKALN4w5Htmaos45wrEM7sbAJzvmiVW+v5PthJ
 IOOw==
X-Gm-Message-State: AOJu0YwMuhoTXR7O29/RFm9NUURswgztArD0Py4c69Syh72P+2KwPmWQ
 rG/4g1F0Kvdnha4QqqEpcjAOJpfiMBqZ/4YqLM3wZPgltb7HXLbltvLNZBCEwcN7SEw=
X-Gm-Gg: ATEYQzxeJQpOrWHEb0wtuzPTwap3Or/Ckg3LmdAj9cgTCGmTNXmzAuDuEeOPVpFq3v6
 M97tZpcZQxvCyCK1GUcgCWHmDH2vkrkjyUFFaqzn6+Nz/WbMfQodpuyrzyvD5CaWxGI6710vb4M
 7DZBV6BbJI82x/4QNgIY7nDDq/88SYDxn3wjNfUdNDH+Z46JH0mSTG5Xaf4t9qzlpkzUSxL3e6o
 l41FAEyLcIIRb6UOwcWxfX0VE7qdKOYG8YJOlnZvIzYCKOduG13VN5/kuttr+++KMxZG3rn+duL
 dkTiDl7Kep8a6oB1wMOhDVVsn5Pz3l0dRx6rscZARV9ptLFg8YXqa2b85LbxTLgiN4fHLk0C2SZ
 XI4N11TFqqV16crtL6ONWqvaaPHZw4IXCLGQUDM9lQF9qoVUKUSrdLDIrdwzy49ShrlKj7wB8E7
 cTRnk2sLjrD3cWrCW0WV2tPHryW1DfDfXS5P9Kez6irks5YYBPVj5l8y39lE38CMLH8Xw=
X-Received: by 2002:a05:6a21:338e:b0:398:6e6b:da1f with SMTP id
 adf61e73a8af0-39f2ef20a2bmr4206898637.25.1775253639071; 
 Fri, 03 Apr 2026 15:00:39 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6477bbcsm5896428a12.3.2026.04.03.15.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2026 15:00:38 -0700 (PDT)
Message-ID: <c52cda8d-4f38-4f2f-9b6e-8c8aa319c5bd@linaro.org>
Date: Sat, 4 Apr 2026 08:00:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Replace aarch64 TCG instruction formats with more
 meaningful names
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260402-aarch64-tcg-instruction-format-rename2-v1-0-0998a08a515c@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260402-aarch64-tcg-instruction-format-rename2-v1-0-0998a08a515c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

On 4/3/26 00:20, Jim MacArthur wrote:
> tcg/aarch64/tcg-target.c.inc contains a lot of numbered instruction formats
> called "I3XXX" in the enum AArch64Insn, named for the original section in the
> Arm documentation which described those formats.
> 
> This patch aims to give them more meaningful names, for example, I3314 becomes
> Ildstpair. Where possible, these names match those used in
> target/arm/tcg/a64.decode.
> 
> Changes since the RFC version:
> * bitfield_32, logic_imm_32, movw_32 have had the _32 suffix removed since they
>    also apply to 64 bit versions here.
> * The I3310 mask is now ldst_imm_to_reg; the previous 'to_sign_extend' name was
>    wrong.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I'll queue this to tcg-next for 11.1.

r~

