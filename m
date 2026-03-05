Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE4DF3D334
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 17:04:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyC7U-00020D-D6; Thu, 05 Mar 2026 12:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyC7N-0001kF-SW
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:04:13 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyC7I-00043S-7p
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:04:07 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48372efa020so73822475e9.2
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 09:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772730240; x=1773335040; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nrsdx03GyB+ijndWxvF09p6QGl4gZ/3YyR/Fgpn9hFE=;
 b=dwsDH1q6WdHSxDd8lKhwWNX+4z09rAmkQG1vFbQjmEmaBUbzsx55n9BSvMLWS0zf+D
 Ku44gJliAhvCOX5VaN72/8lgkS/PU2aUe7xpM6K4AFscEwSM7geySg6qk18lMxSqjKII
 LXy3G+0l3eNYyKg10lXlwYdECaBME8RH8ufaX4sW9JyV0MH77ku0/8u/sXsMlXWMmBPW
 x08aabisNgnn2DaltNcB1yIoOgtccP8Sy9xr1yN8GCpq4T2SCQEKxJTiaut2M/mCR90r
 Yo9PNOVS3PxmMwiYgR43EWkYW+w87QC/G0uY9qrkqbzpCFlOk8Z3abBv+9v+OzGBWTPd
 djdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772730240; x=1773335040;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nrsdx03GyB+ijndWxvF09p6QGl4gZ/3YyR/Fgpn9hFE=;
 b=JdNzWg8NmNugvUi45VeNuZI+WaF96F5SabX9l6y3QAhmrN0cHN4bxz0zZ/42gNLSC5
 IKeOw6HKl3Pukmb2v1NFNJDX61aC8vVNxhPkMeSeDG00qGlVoxZgE6H3M/+zjCx0spQA
 OIjpBz0xaKVmZRROnicJJOoys4pn+pDuoR9qLCx7dOK5BGFFaSTdounaYjrj14Z26fK/
 F+N8dcDI07zyECZtih3iv42t7lEuP2uujHu9xbwrKfz5RB9mrBSzdTPvNjL2DMlPbxFv
 SSQyRj9wA4yF5M/S3SkfWOIodQ2+0CdhLopGjji4Fr1HjvqL22CFmWigJT69XCfEIB6q
 lccQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW44DMyXLrfXfqGbbNJnUd7OYC22E9z5coSJK7Q2c11AB032XarrtlJsPBIhA6TvOndLdAeYyiDHw==@nongnu.org
X-Gm-Message-State: AOJu0YwUk0Oq2ywN22y+Ot1575DPMr4bSBixiv7tLWF7aGQ4UxQAHh2m
 4t5zfEWdwOTz0HhgRW5j7eDYFL0FVF7cjfvIBSyh+hN6xhpSNPg9WYja5EmhZKojFA8=
X-Gm-Gg: ATEYQzwORHJ3i2HteiIG+mMnR8aIy5oSUzRcam9kg/ZWK9a9zu0dRt3CAnIzF/5q3EM
 47Zve2QJd3ulNcXeZarnqQKy0/kEtRZ6Nmx9o63IXLLLY6/Yul136jFK8aDXyFeLZIsOMNdhedW
 OgM+zIuJ8r8GWUKQd4HM+9BILih0UrIyTLviqZOW2lH31yILozWoOrYG5UIKDIcNEpqjuZN/N4s
 fWiaORqSpVlVYG0i2AU48a18KT7SSyxvYmogSPIRQbmJju6B8EzGQVFPBBF1Xq5PzyFHRSNkkEz
 4oKT+PKPrH6THCmPMy+TW9lmPL/MtZ2gny4oACNCBm0hgnVhm7DUlAZztflIOAXRi+TUYsLKNk7
 vUdVHNXpDDnokkVjrH8c05Ck4HH7ABQckI/0tDGScTbvQKEWXK5C9lfsjuixjKQOcSsX+EbDVv6
 t8tO0Bi9JfLaXKZVZqV6gJvhd8gExCjet6HkCklwvw1s3dcSs0K4PxSMnLE17iFJPOww==
X-Received: by 2002:a05:600c:8284:b0:477:7af8:c8ad with SMTP id
 5b1f17b1804b1-485198a3e3amr112599805e9.31.1772730240273; 
 Thu, 05 Mar 2026 09:04:00 -0800 (PST)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fae0202sm68183015e9.6.2026.03.05.09.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 09:03:59 -0800 (PST)
Message-ID: <2324c882-597f-4973-82a9-cf24d279aaaa@linaro.org>
Date: Thu, 5 Mar 2026 18:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 06/12] hvf: only call hvf_sync_vtimer() when running
 without the platform vGIC
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>
References: <20260228220837.35275-1-mohamed@unpredictable.fr>
 <20260228220837.35275-7-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260228220837.35275-7-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 28/2/26 23:08, Mohamed Mediouni wrote:
> When running with the Apple vGIC, the EL1 vtimer is handled by the platform.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Reviewed-by: Mads Ynddal <mads@ynddal.dk>
> ---
>   target/arm/hvf/hvf.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

