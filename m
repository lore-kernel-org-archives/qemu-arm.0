Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E33F3D337
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 17:04:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyC7w-00037J-5C; Thu, 05 Mar 2026 12:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyC7r-0002zT-TA
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:04:40 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyC7q-00047h-4r
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:04:39 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439c4bde55cso1773893f8f.1
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 09:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772730276; x=1773335076; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eOt65cxkcxIk7XLPeX43CZs39Ta2WhxQpw3VsVulev4=;
 b=VdYBeA86l5eqwbGT3rVv+0zms1WkKGAiHBnBpnD/4O9JX45aPNO5OUpa50O9y4j/2A
 sMn7XBvRkx6OkOakii+9dfU4c9tqyV/DJMIwgxw83UfC2HmL19KFGzgqPaBT8hQdcCSg
 taHEBU1wppVyQQFYWHuoyJyBZsL/DCa+TOlTLcAt7H2PpJAB6Ih3ZsMjqzmqLL73WNnq
 lRoi7PEZUZDwlXt+39hit23te/K0c7Yp0hzopmPGOuwC21lXAwnzQ3ODdbg63G5PUVw8
 ubPUSXRaZj6OqZhU4WH60IBoAdt6jzzBGOGqyJQVaGhe0W9JthI+uBRl9Y9zXj41CX5i
 QIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772730276; x=1773335076;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eOt65cxkcxIk7XLPeX43CZs39Ta2WhxQpw3VsVulev4=;
 b=h//AUrK4JDqQ3uyOOrr4QtL4T6bvI8s1v35VNEaTOKdXQy1mPgTemOz0UpmTeiQqC2
 iJxcxtRyKihR2Nbj+4ooCGR8HmtbdL/yK0bdlaCR1P08ILbTgGv3tkdnAm59e99viZiK
 Jyz1YWbKCBAkEwWUuEOiqJnWwfMg9Lbp475nmSGFzJoQGrqnU3i6/LBiuxqu4ewxuG3Q
 PNZBKWeG4meFYcqWGD//cgl7E3YcGlyoGZkXC06Yd9Oqdj/rZ0QhgXq1lgr8/yjIqc3l
 ttOpG7Om8W0DrSSLWih7JIabmEy30pDU1mmrB41y8S2wVpkXrJ6c2w0SkAkFGPVZN6bA
 EhlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV09pqUa867hU72jYBoVYUiXDon6vi/nMbHJCHdzY4DXOTTbBKa2yP00CbqM8IJA+t0CB2SaCwUQA==@nongnu.org
X-Gm-Message-State: AOJu0YyWnGpZa4jjOO5GQqM6pl8R7sZO1cMlJd7s3ja0aI9dW2b1ap9o
 uUeIaAjIEo34Pb6PocoOMm2ZgMp43DNYChtvLZHYcLW8o/mPVY8Sup5ufBxkkHWN1Zo=
X-Gm-Gg: ATEYQzz2PI68EMfQryoYQyTNwKHR2BR5BM3Kom+2DTpOuBpmxARNFMU3K8CqNbydrfN
 sMR1MuMGuZZaZAKDJqeeA2Dv4fxBom1B+xv4G4dgOohPaGQ6u22tRJlZAIBKsaGc2g2l/c5xp+l
 mov3U32P7DDZn75lbwoqUya3Bv6Y6m5B1+i3tdAGJ5ie8MVPb6mF3ASpjOv7jJpiR3otLOODLq4
 L+m3sdhKq5OatC5CMvfvNUrF2H46Y8SiZNePXgK8N6ATtXarAwLd16lNZpgVkpDbFDg+0omQB5h
 YNXF/pAcGojd8gY0mOVSPHfTdCYkVtCi3GpnbokaMpZDs3rqa3v3Vn+1Be8iNZl5Gl1bI9Mrmg4
 PEEgQ+U1fRTgExQNUy/HxHihN/BPRzy2awM2J792rk0hZla9fes0eCQ515BAKOnXPg3i/sH4O2q
 bXKMY3SnGtCLPeKzfUT3hfEtTiy/GihVpl09DjWAf6mpLVFGLV5zQULueFuW1yTm/xVg==
X-Received: by 2002:a05:6000:2011:b0:439:8eef:11f8 with SMTP id
 ffacd0b85a97d-439c7fd3e44mr10889157f8f.36.1772730276424; 
 Thu, 05 Mar 2026 09:04:36 -0800 (PST)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c2f8c0e7sm19850263f8f.29.2026.03.05.09.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 09:04:35 -0800 (PST)
Message-ID: <f90be20c-c224-4c4f-9d1e-3360bde17c29@linaro.org>
Date: Thu, 5 Mar 2026 18:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/12] hvf: arm: allow exposing minimal PMU when
 running with nested virt on
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>
References: <20260228220837.35275-1-mohamed@unpredictable.fr>
 <20260228220837.35275-9-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260228220837.35275-9-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 28/2/26 23:08, Mohamed Mediouni wrote:
> When running with nested virt on, a minimum PMU is exposed by Hypervisor.framework
> if a valid PMUVer register value is set. That PMU isn't exposed otherwise.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

