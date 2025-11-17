Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638A0CEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 17:05:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vL2fO-0007Lu-7a; Mon, 17 Nov 2025 12:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vL2f6-0007Gh-Df
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 12:05:13 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vL2f0-0004pc-PA
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 12:05:04 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47758595eecso25767445e9.0
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 09:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763399100; x=1764003900; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HE2fmlyORJFUjXBDWXDExn8hzuILt7lnHbNQZ4qzuks=;
 b=N/9UUhtLS/A7gXyTeFCTh9MRAybN8kmBSK64KI0sDOi9EB3/JKQTbALj84okcPH0C+
 5GJJx6IlOgMV0mi8XEoZ57D80s+M/Xa9Lc9J9sJUIevmoEu/6muz2rFXCvjEk6OUbkgO
 bup3m7VFhLUgV/3ECmK8NqQjTRCneSMswDurhcmLZxjLT4iic0DDhBYCtMDf02MGG3YW
 n/OeqjHCoOUIP95W0o6PxqMb9d96TZh98OTpB14J+EZTJ32dXM3vLrYX6lfPk+2yvhKU
 q4JR84NERqkFx+soV5xnayHlVmHv6tGHe0lcCpYe20uqHxQdcI+Hy9ptDHjhP9iOEzGY
 UHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763399100; x=1764003900;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HE2fmlyORJFUjXBDWXDExn8hzuILt7lnHbNQZ4qzuks=;
 b=M/y5+317NElBv4qvIKyI4nESV1S9WUxg/f09SgPv6VbaMiV+PevDha+HBAzF2NBIgb
 vz2OdGXeYtzdsaIziVe7yyxM5h1+aHXgRaAk8idZVzghkWzycILsztglxLQs0NrZNhQ4
 uxgy/3pQtdJOZdS7g66kk6jEEZ7W91LowF77zy7yojAsyuCkDpJ24POB84WZt4p6T5TL
 9x9/lHZy+54cimG8mCDmhQ0o9YVIlR/KmMIr4H7vS8qN9qVIF2i5eMYrVk833NUiEW2C
 avOlabT9hsTssDab381pHItqM2qVh7HgJX7hs+sSJp2ILIGEgn4MLWcJmBOzTegKtJen
 x5Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiiC2WLJTaYb+cmbpM/uh9xgs3hZ3/sDcvcVijmZIUemH0XUelkYedXN3/MncRskUlv6fQzbgjvg==@nongnu.org
X-Gm-Message-State: AOJu0YzUP51Sc5SiCDL3u8R6WHP+T33twTz8ezpmmKBfacvxPVB1qdhY
 cWhSIY6EviyoPMl7SP8zAZlaBIauL/k3Vrn161AEwkcxWUDi8N3fDwDo5/Qs731cl5Q=
X-Gm-Gg: ASbGncuJVrNNFkfgAsXYSveGUbQt9jVE7Lx5KDFBuGPrbbuAAzfoXHxwcSUommd30LP
 lYdQfhAClnEtocgjnE/BispV3EJDjolgiS91RwiMpX03VeTwQtOodp7Pd/HKvP3WRKhhtbXAXsu
 7IW6MUY4w4/3b2RAkdEhJUMdlUn3ZfibI0b8wN2Y9+iu1wXnF8bOmMXS140ZGpCajqgoEL7QA3+
 qYN4kaqoRf0AfkJ4KL1ZhKmjBj2CpYRF+obVoLWPQeQNPAr8iJVEC1BQ4dFJCQlYkjdjq9kzgkX
 Nq92sALJS6VggzKQoXHdpIpVZfpFT0Lha63D7gylYkmEl6oqLp2AZx8222t2L74+xnbjTF/uHYr
 hJnAQubwrH7mLNSKDs77E8sTkiM6AJQeqlBmzn981rVtarXt5le5zFrchaAOkGJrckV5iFOePdG
 RoYDJzwjTuzPW+DFQXPhHTb6SULl27iRfyPU0lSiUlL6BtT+rkQnmelg==
X-Google-Smtp-Source: AGHT+IH0EZ8HCV7GbhiyCN/x53Sxj3XUTx+ngK88SGVXYGsuOYnqgMguELmgrquf5p5afIpnniyxPg==
X-Received: by 2002:a05:600c:253:b0:477:94e3:8a96 with SMTP id
 5b1f17b1804b1-47794e38b9amr60505025e9.20.1763399099831; 
 Mon, 17 Nov 2025 09:04:59 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779f45776csm40738495e9.9.2025.11.17.09.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 09:04:59 -0800 (PST)
Message-ID: <5f9c6578-793c-4284-a7da-9181f06ba6a0@linaro.org>
Date: Mon, 17 Nov 2025 18:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.2 0/2] tcg: Remove support for 32-bit arm hosts
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20251117154154.79090-1-philmd@linaro.org>
 <CAFEAcA-e6fC6yaZP1WSV5qg6-LYYrSDFJik4yLPUPMUDjxQ39Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-e6fC6yaZP1WSV5qg6-LYYrSDFJik4yLPUPMUDjxQ39Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 17/11/25 16:59, Peter Maydell wrote:
> On Mon, 17 Nov 2025 at 15:42, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> 32-bit hosts are deprecated since QEMU v10.0.0; we already
>> removed support for MIPS and PPC hosts. Time for ARM removal.
>>
>> Based-on: <20251117140420.62193-1-philmd@linaro.org>
>>            "roms: Do not try to build EDK2 for 32-bit ARM on Fedora"
>> Based-on: <20251117153756.78830-1-philmd@linaro.org>
>>            "docs: Mention 32-bit PPC host as removed"
>>
>> Philippe Mathieu-Daudé (2):
>>    gitlab: Stop cross-testing for 32-bit ARM hosts
>>    buildsys: Remove support for 32-bit ARM hosts
> 
> I would prefer us not to drop a deprecated feature after
> feature-freeze, please. This seems like it can wait for 11.0.

Sure no problem on my side (per Daniel comment on IRC,
I thought this was a due task).

Regards,

Phil.

