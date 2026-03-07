Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC30FCB602
	for <qemu-arm@archiver.kernel.org>; Sat,  7 Mar 2026 15:50:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vytvG-0001qj-SW; Sat, 07 Mar 2026 10:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vytvF-0001qR-Fx
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 10:50:33 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vytvD-0003YO-Ta
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 10:50:33 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso90795645e9.0
 for <qemu-arm@nongnu.org>; Sat, 07 Mar 2026 07:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772898630; x=1773503430; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M+T1nZlYyyjA5JTlb5W6WiebfQMkgLa1ja5kxCgrePQ=;
 b=PziqKNcJuTQa4pJUKpsKZBHfaYFknuS9OWux89D+8R1g/7HZgi7+V0QF6zFUWZRKq7
 axKJ/WEvumBQUQNzHRrf4WHzCXRgJ0FnDnCfxeaVY2DghxWSBlh/taZZVuDBM5dvfS12
 N+hAQatCqDePWdBidbZlbCTVGQ7PUSFliUTp9aylMCaE9BYvyCHWI/ezZ+15o8+Lg53D
 Engu1L3GcDaxwFt5+oShiSFnKVo68Rdn/gX/lWn8vkBOa7GQFgfkBzXyeQEblAOTvxD3
 ie3nRiTb+sDcfWlKRGkKXUW2C8a8utb0fkCFnut8vLfskHSTU5pX3afiT9oex8Aqr9aY
 a/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772898630; x=1773503430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M+T1nZlYyyjA5JTlb5W6WiebfQMkgLa1ja5kxCgrePQ=;
 b=BEhqG9bi6Iy0nEf7Qy2UJRdGAL4QVJsZfLhZ8gfrqNaCu8o6ljzL4xPpI0c7gMm6ld
 HoqxHbBgXLZA/JfO3nQefKYIH5U3RUZQMbVpMn/vkqZ/bwon1Wv4JoaU20Wt3ysRcOZa
 IqANlj7h4AHYys3Y0yiGt2Rm3cps85NhZ9HGU9Rrfp2qnQsiJ1vo8l/TGuSLvoGFdJbi
 4bLe2RATZ36oHS6ICndZjCA61Dbf3Xts9+wKpPIaljHZICOuP2SLpW6/a7Uq7H0CxjP8
 TbN4rZXWHnP1dxcka+fjDVMX38q1l21CxqZNOSrLHvN2VGLANN7eE+XdoNEHu8F77I8A
 Hpcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPTAwjdWYRan5Q8mqhgCfCfA9J8CIrVtThrnZ8NzVdirbbbrUETfRKRIGTkoAQeAAjSbMvmaKOdA==@nongnu.org
X-Gm-Message-State: AOJu0YxCy4WiJfeywShUxsqyNLqcu7MEraJn3WK6YlWefYjBDJGXTZuU
 bNaFdnxiUqBchLnRQhTF2zzxgTohmILF3vU6nao1mtdI7iGtShGuVXzZOmXUSgwOX04=
X-Gm-Gg: ATEYQzxTntT4eDqy3wo2UZ6QIdeBY3TKFStQMv3FDfvt5TFfPRDfyl4/cchwTe/AXB1
 1EeIWeSVHQSSyfFd0iBVFueqxSEyIs8dG9mUSibZDQINPsF3raENi5fdX7O0604Ftt4YuOXYuuj
 Yt7ltOAvMJAoriITYChwX3nfHVHi2+0olFki1Vl+NDnja2Vwisq2xwBNJl4HHZ3RAOH3xpTn+AT
 s8n5LQ4v8ttbM9BIoZGm/wxMlAfB2gPvrhUkWXFT4VplrqPReQNtBk2K99vlb8j4qTEnhK65CcI
 cMvVBv7iC2lDt67BtkOWEr8gTH3m0hcVSRwLVRIRddvd0IAOHOhT+SaTldm//iAU+gWJG1vYxck
 kk8myH2HSRsi0MdkOwd79Ef8q2qR1YJGhoifMKi6sSeJRg/UqRVy9Ury+mMLI4KvriArdPMpvV6
 ewWlt6FPf4nK4gZeDlBIwQ+lEcNGxGdV3+csE1k9HW71YP0fbdv/cQePZ9VV9wZ3NUog==
X-Received: by 2002:a05:600c:1d1e:b0:483:709e:f239 with SMTP id
 5b1f17b1804b1-48526951ca9mr98912305e9.22.1772898630516; 
 Sat, 07 Mar 2026 07:50:30 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb277e3sm175407155e9.10.2026.03.07.07.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Mar 2026 07:50:29 -0800 (PST)
Message-ID: <bd0b0386-b8ff-44d5-87db-a34df5ad898a@linaro.org>
Date: Sat, 7 Mar 2026 16:50:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] hvf: arm: unbreak the x86 build
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Wei Liu <wei.liu@kernel.org>, Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20260307154104.84567-1-mohamed@unpredictable.fr>
 <20260307154104.84567-4-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260307154104.84567-4-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 7/3/26 16:40, Mohamed Mediouni wrote:
> We don't really have any great choices here, so use the __aarch64__ define to unbreak the x86 build.
> 
> Once the CI moves away from macOS 15.1 SDK to... 15.2 even we can get rid of these SME stubs horrible hacks.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr
> ---
>   target/arm/hvf_arm.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

