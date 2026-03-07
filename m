Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFFBFC9EFD
	for <qemu-arm@archiver.kernel.org>; Sat,  7 Mar 2026 11:42:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyq31-0001zG-Qw; Sat, 07 Mar 2026 06:42:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyq2y-0001x2-9L
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 06:42:16 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyq2w-0007yq-54
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 06:42:15 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439b7c2788dso4657888f8f.1
 for <qemu-arm@nongnu.org>; Sat, 07 Mar 2026 03:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772883732; x=1773488532; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s+S/lyeA5fEI/WZQtM3U3h4jFQSLFzZZsja62SNHSeU=;
 b=KVw6JBZ9Yd8nPYc3nkF3Wpr7Xlvmf8n0XG73trIPoEO534M3OsWAxhxiSYLIXZ4woO
 KcZBLdoU7qrQ+bA7qTEo9bqb/lxqzUhv19BXeqnZE2FDXuUuXJdSKVG7LqiO6eDIXCVS
 UxDTHr/CPqw2IM8BC1ftq3I94nPb1AXWiTSkKQhg4ktXZcpbwMijzV8JTS/bRpK6ka73
 oQ6q33CQHVoGr/ePyO7D1SMxC8iwAC8Xm9d3osO9EvvigyQp8mJsmf8N3j/Y9jQOVoF/
 Vwt6Hvw8HHcqZkzqX+MTMk6dsCyEU3RnWk3UdiJkVYV4A+B+qc00T2614OvZkoB8RcWx
 dc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772883732; x=1773488532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s+S/lyeA5fEI/WZQtM3U3h4jFQSLFzZZsja62SNHSeU=;
 b=PUrIzSsriZKCeMfIYypARJMqG9MmH0naVOKVkpn25qKarx1eQ5EhUUs+ZTvTOi8e3a
 4OuPi8FfBBoJs3EDimB3k5cu5ypFvVEseNFIVLhPMlA1s06wp6uzjTMC5d8vWfgZQBai
 aT7oeDdSxPhEd0tRdKA7Dju2rw0TxyguWzgk3SYpUclgx4AmvJcTIHF0pGZN84kWw33T
 x+Q9fwDHh3yVK+AoBKlar6HPjk84hc8EWtrRgFbJxNFbkL4pTm2q6RoRLT+LRRXk+ksj
 TjqBsVmB7TWEFAkTK/yZoDWJ0B5/7v8ux6YF+cI39fcQcRkZT1aQ/2qxjBjmo/pUh389
 H0HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYtu+Oy/Fir16Uh1x/aNmKS4r4ohDrhxVDpwLTkLf396Zxq9hFpB+M42atKgYKVMxq6rUbsU1/bw==@nongnu.org
X-Gm-Message-State: AOJu0YwIysI7VDzt12tPdOyUoLTe4QvbPo5PP5/cnS76ngvOH15aYkNi
 wbrsL95D5MTT8uynWrqK/D8WotrCyTOs+ouKoJVBfekYKTSDRLab9p4JewwJj0MUdN0=
X-Gm-Gg: ATEYQzw+nZU7ywUbXCWbdIPE6cS0LvKreHCCRgSD6IBjzCQClj3LV2LsU09K87eJNNa
 Qj+gqJICQTi+RvFtBISRv7SLtcdgx+VKfOX7rsbLuiq08nM57tMA3UHJqp5GaNVjiVQLTut2Noi
 uYFxO1iNQfhbTbkuZM9IFT16ncwb8An+Mn2YjBK9znP01jTzfK4CcPbf+qqd1ReUeE/RACxkqfE
 CjEMjgEmV1YdsxEqNp2NXY54cvsMauNlIvQd/tvBQe8I0a3cue1qxFeV2PGRtBDDTXNEoHjldnU
 gr/9+vs8WbSVSAvb3jkTVw/UGLb3plVzPIQfrp0lpCeK8Gv3j0wQ3FuyMwAJBMRm56dv8/dlSvB
 F5RaGqSAbxArPMk+9wSxEfoxcl6MeOUq7L2nR1zoQUHW5cAH8OvgbdF2HxlCpf3LWV9hgCS54Dk
 D8y/wgI3EQNBuo0VX4uqQRFPGOstBfr3btzOqyeuoFdvgun5JZhHNkU/rAF/bFlXV31w==
X-Received: by 2002:a05:6000:603:b0:439:b59e:5e69 with SMTP id
 ffacd0b85a97d-439da348049mr8695932f8f.8.1772883732372; 
 Sat, 07 Mar 2026 03:42:12 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad97be5sm11332691f8f.11.2026.03.07.03.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Mar 2026 03:42:11 -0800 (PST)
Message-ID: <815e35dc-fb2c-44a9-aff5-b778005815c6@linaro.org>
Date: Sat, 7 Mar 2026 12:42:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvf: arm: remove SME2 stub code
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>
References: <20260307105009.67242-1-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260307105009.67242-1-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 7/3/26 11:50, Mohamed Mediouni wrote:
> Releases n and n-1 of macOS are supported. As such, macOS 15.x and 26.x are currently the baseline.
> 
> The QEMU CI still uses a newer SDK, just with an older default target as it's running on a macOS 14 host.
> 
> Note that this on its own doesn't prevent running on macOS 14. It just means that you have to use a newer SDK in order to do so.
> 
> Why do this? Because the stub code broke the x86 build... and it doesn't make much sense to keep it.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c           |  31 ++++++
>   target/arm/hvf/hvf_sme_stubs.h | 172 ---------------------------------
>   target/arm/hvf_arm.h           |  45 ---------
>   3 files changed, 31 insertions(+), 217 deletions(-)
>   delete mode 100644 target/arm/hvf/hvf_sme_stubs.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

