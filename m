Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B3CFD9E14
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 21:49:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvjEU-00087I-LV; Thu, 26 Feb 2026 16:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vvjET-00086T-1u
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 16:49:17 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vvjER-0006Ig-BI
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 16:49:16 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so18077435e9.1
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 13:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772142554; x=1772747354; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l7PkWdLOlPn7obFcKRiFNIy8gZI6yyioHnaAuurSmEM=;
 b=c7JLBc7cIYokFhQKGITccy3fmT5Aarfl8TOxsDALTKV4vcG3xM/K3k8WxFM7vBhCJ9
 TRO/oUZQBxd4BO/o6YNH+zW77wgB7YilPIwneH37Wv3LW+ODigOL5poEaqVKtPFal11U
 DzKalMDm/HruWZDGqaLy9TSoxBrpFa6JcjXaEpgbKa7nCHiuxxVIPwUW0rGkSu7moQiL
 f7i6xFMTp9yqjGPCiYQJHQSHWi6l/xHZp0x9AL0o1p2FVmQt2IhP4gpaBudMChceUpaA
 QN1X1dzkRjqSaqVfX5csXi8Ujov/ea3oarT5kG1HeMIZyk4ikiAD+noqg2q3Vzl1aE7T
 pSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772142554; x=1772747354;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l7PkWdLOlPn7obFcKRiFNIy8gZI6yyioHnaAuurSmEM=;
 b=PJCh4PYUSGcwExFiijfX603seh7EPeOCxs0qkmBM9LBOUWUIUgPN8wn7AtO0SqzcoQ
 90wjLkfuKwbrSjj54YinPznwKNtEtlXL9JWKOo97EGj2XrRk5XxEYNIw64xPJRyZdf6/
 xwhGtdkPXTbKm9GD5Tz3ae2wWh33BoRteTGbklJaX1V7XdfXZtV3+Vqum3wRWPh/rlPB
 M3YoVC142ufLHmbW6+5gJH/zzApT3y49BsgzE0s4WqaxiMv5h2CY8nKLCwz+QwtPlUBz
 VjEUxD+5U2aghHoOAxkGYCIkfQ0Oh4i98nwSuezbfFGFRLODAEIw7Wao19x/X92+noVS
 9PrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBb0s4ZwR3wJbdCatDqAQ/4+HD78mP9DCpEOburXSaZXrWE0Wvf0JNGVBI25KnjNHvgDV5wx8tqg==@nongnu.org
X-Gm-Message-State: AOJu0Yx1q/ozzJDbEbcnj9Vysa2HGQbxoukhSmLj0fT1Pb4eoBQYZlbE
 sy6my8jRNP+Isq3Rf/MU0H3/MYthMb28kjIvZClCns7yn4lg3C1A5F48NtGPpOerrAM=
X-Gm-Gg: ATEYQzwKKn3FGehxAQUQUoR2Nj8L2Spg8Ik80QCQdbTrI1MpAeTQ8Zw4fvMyNxAxMop
 Wja4CWragJxWgpNjoq1bk+Q9nFeOF2eEsqbdugcT2W6x9E76YjZ48iN5RCSisCWU2jb8p61qsSd
 tbNsUKdEANkNDgk52U9Of0290DAq1HBlJOotCB9rHeF6ab11lS7e0HHI6PZNrkciyb3OlvZ5N82
 p7706wKAH+LosIfIdvCuIt1BSB+UvGqVEQSSMRQGZP/Cxp1/E6WyhHs+0dh5FCRxl4cUeWl6hdj
 Uxc3Wn94JL2hv4UTrpJLC4/i/WckXvJDzf8Eo6WuHuRup2ZQf1juwmUDna9vdG97lz/g1rAhsRR
 DZkGFdp5vfW8gyJampbFH4UY0Gyhch5I/BHpbhUtHIooJQnzRXA26xbPVdGIpLZxmiA91xKJIA+
 kzvTr0KNrQo13BdjFUBtKTtF+wuOXokJDmfpQOPVe1T0NVoWa+kgYlFp5t7PS3WI+BhA==
X-Received: by 2002:a05:600c:8b5b:b0:481:a662:b3f3 with SMTP id
 5b1f17b1804b1-483c990c263mr11061735e9.7.1772142553794; 
 Thu, 26 Feb 2026 13:49:13 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfccff00sm46648725e9.25.2026.02.26.13.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 13:49:13 -0800 (PST)
Message-ID: <65e0593f-d5d6-4e22-a730-ebe65bc1a332@linaro.org>
Date: Thu, 26 Feb 2026 22:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/net/smc91c111: Don't allow negative-length packets
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Jason Wang <jasowang@redhat.com>
References: <20260226175549.1319476-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260226175549.1319476-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 26/2/26 18:55, Peter Maydell wrote:
> The smc91c111 data frame format in memory (figure 8-1 in the
> datasheet) includes a "byte count" field which is intended to be the
> total size of the data frame, including not just the packet data but
> also the leading and trailing information like the status word and
> the byte count field itself.  It is therefore possible for the guest
> to set this to a value so small that the leading and trailing fields
> won't fit and the packet has effectively a negative area.
> 
> We weren't checking for this, with the result that when we subtract 6
> from the length to get the length of the packet proper we end up with
> a negative length, which is then inconsistently handled in the
> qemu_send_packet() code such that we can try to transmit a very large
> amount of data and read off the end of the device's data array.
> 
> Treat excessively small length values the same way we do excessively
> large values.  As with the oversized case, the datasheet does not
> describe what happens for this software error case, and there is no
> relevant tx error condition for this, so we just log and drop the
> packet.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3304
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/smc91c111.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

