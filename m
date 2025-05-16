Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp2231406njb;
        Thu, 15 May 2025 17:36:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVO/TKi4OD8Jtaydk88SYWjQf/eeDyX7zdkRylIknpLHKgtpe8hFszPSC2s3DKWTcBZkb9ufy7wHsNAEg==@linaro.org
X-Google-Smtp-Source: AGHT+IG8z3KSpCOa8niKSxqNyAbrLR+2cbtNBUqy9wi66fp9g0u239lp0XUlj6bnfWB6BUsvSSff
X-Received: by 2002:a05:622a:1f88:b0:494:9dc2:27dc with SMTP id d75a77b69052e-494ae55fc9fmr22066051cf.19.1747355761745;
        Thu, 15 May 2025 17:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747355761; cv=none;
        d=google.com; s=arc-20240605;
        b=K9wqsTVg6l0+PYG+w4pUqQxQbL6Kq5BtyWLuGC2aeyNNk50qU9zaBspaQUNX6ryn0y
         WVJIN1rSYhYfQR2nYltB1s03PwoqhPPnTw0TEP0uLGa/DyiCVT711oPmN0vtW9ok84wW
         rdIhJIeABfrsjXGzjwJ209vNyH1m9lmNBciqdPPv12Ykiq2qoZcuBkHD97zLxgcbQVJR
         Liny7MQB/apHft0TerLSAfJy7t54TcEl70+JAYAUn4Q3TNSqDieTbn7h20IhnbTN3DCa
         cLcBEIePE3JXj5LzQ6GVMJ0ykvFLi/OQydc1ubEO1VHSCekume4BBmEQtCoRRNpO8EsP
         gdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fGTa+sH3laGk0Za0QUOvjq9LJudy3MFL+U4FIPDyb60=;
        fh=kAfIH0EUkSKtWduhefmNTS4+hrUeZY35hf0qu5OFri0=;
        b=ZMdBRoizSbROrqBOV3oDLS01g/PZ+z4eP3ujx2r61LoRKqXsjdBzBdhBUfnjQJSZ1+
         poIjdE4X+eKLGBhGL21jDE3gJ/sne4mua1CRd63GivXa4NsCw9jCrsV4fKbkLBTs9jMA
         pbf6/tmAPKOnOQl+5sukJ41Y1ATMDQzGJDHF46abeewsFfx5vCqJEHHhIS3R/8mHxTM3
         R4EuMon3EwJYvhqa/tYR9aPpbgMlmpecOkb3+xgGbakHR+9T9G4FbNixyCKToXR1NaN4
         zO8OAfYl7e/IWcgX9RDubiqmVTg2UKDyh1thCPofrMfDWQwPTggkdwgsMR4TvZCWxEkc
         eZFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p6DIIfUc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae40c47asi8541241cf.104.2025.05.15.17.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 17:36:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p6DIIfUc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFj36-0001Dq-Vx; Thu, 15 May 2025 20:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uFj33-0001B8-DD
 for qemu-arm@nongnu.org; Thu, 15 May 2025 20:35:38 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uFj31-0005SR-JQ
 for qemu-arm@nongnu.org; Thu, 15 May 2025 20:35:37 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22e09f57ed4so29360135ad.0
 for <qemu-arm@nongnu.org>; Thu, 15 May 2025 17:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747355733; x=1747960533; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fGTa+sH3laGk0Za0QUOvjq9LJudy3MFL+U4FIPDyb60=;
 b=p6DIIfUcE+bkErgsBGhlRWJNLlk5nNmeJJZVcDJ9xd9kYoRCD3AJrSN+tiacKKt8QJ
 dTnJQrS/u1jMFCPKhTFxHerxoutFRnutfgOn0z2nGg5e/hGbqArfpvkpgzyLNHrq7cHB
 8C3eaxRfqfhk2SbWGsSWCqjdzdxpCQVY8QoKzAYs1qt6ioZmtHmyzYJhN2yBWX+oG+T1
 N3RkxTc1zauTfcZq1PUw+mZSJIKQ5OBBVYrxppzVC10XUxbAPTL+KpFtT/mWek1vyMpk
 TaGEIohN287cLT22sX9ceSYgYZyD7rRJvUkfA/eBqMJdLykffu9xzrfKG2W/swRZcZwz
 we+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747355733; x=1747960533;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fGTa+sH3laGk0Za0QUOvjq9LJudy3MFL+U4FIPDyb60=;
 b=TbIlfKWBWhKuWC6ahNH+BoXm8AfuHiVZej/Qcx7bAoNdZTyQwkK++lLYr1cEjIFhM/
 4WM1c9ICYrnynSsW6KHc2SAI1PAqZ+7HVH5bTueL7C7eArE2Hr5QiwLT94ys68CCxbaS
 29S/DQeY7z1rMsK+H0JBm1W5XjyFK1w8+2xvgbw0cLi8nRIZz7gBoxCP9+VWSZoJ0/rH
 lTzGrSFFvtfCBEw57038vsSvsCQfYY6YXi5+er/VdvQbx3fvjvJ0SfDVkLA3IGgzB5N8
 JQHvt90FI4vjpJ9/xpc3f2ldpvqiNwVa+1FR9SVVNh5MlOGegKEJtZduXEy8hixY8U2y
 MMPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUUwyNNU2zt+ICHVzwmHx7d5Ue3K7NQOjtwHb22SPtEEZZYqBSMQ0AOP5k3PJYFZ0KqRY462gFxQ==@nongnu.org
X-Gm-Message-State: AOJu0YwtcY5SDzUTZ2apmzuR3qT3e5G/kYxx2OCZTYsYhG3OCRmMkEYU
 xRADn4e/sFyKzF/o6daOw7LH50LI9+qI1wLfoZRDBQL5j6Z8rNu0FWKgRYmlRVktZf4=
X-Gm-Gg: ASbGncvNM9+AiKXYvI9jTRNNMOL3b3KWD5ounPdri7NamnqWIuyFtJovUJqel9ZElIL
 g1p0iq42bY9OeilpTVl/UO7Ma5Fgj8BhjxntRAbGg59wfR662pRymZjHbod9uHHVzSqbCgSPwv2
 TBwMQwa87RggxxZ7Jqbwg2HGC4Ypc7beHtRjpsiQWeGuxX0ZkVbICfdADjhxHZG8eko1/xa2Bof
 1vse7uYpYt3D4HtnWlhG9TYDj7aWnx2BOorMkdPYLTmn9+0Pr3yuTVVe8jONHs8Pzyr0kLMWN2i
 hAkplsps4DmmqkB4gaw4gAf8/DzujZF99XFMBbgCCOOoRJJrGPwLTsibZX1X3lGC
X-Received: by 2002:a17:903:110f:b0:221:1497:7b08 with SMTP id
 d9443c01a7336-231b39d5c45mr77223205ad.23.1747355733093; 
 Thu, 15 May 2025 17:35:33 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ebb168sm3497405ad.204.2025.05.15.17.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 17:35:32 -0700 (PDT)
Message-ID: <1a89a793-1db7-4b3e-926f-fbd390d2f714@linaro.org>
Date: Thu, 15 May 2025 17:35:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] meson.build: Compile hw_common_arch_libs files with
 right header include paths
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Brad Smith <brad@comstyle.com>
References: <20250513115637.184940-1-thuth@redhat.com>
 <d1bf2e99-7320-4a20-a5cb-2e7ce70036b8@linaro.org>
Content-Language: en-US
In-Reply-To: <d1bf2e99-7320-4a20-a5cb-2e7ce70036b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: k/jmQ0TeD6uV

On 5/13/25 4:20 PM, Pierrick Bouvier wrote:
> Hi Thomas,
> 
> On 5/13/25 4:56 AM, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> Since commit 6f4e8a92bbd ("hw/arm: make most of the compilation units
>> common"), compilation of some arm machines (like musicpal) fails on
>> certain host systems like OpenBSD 7.6/7.7 since headers like <epoxy/gl.h>
>> don't reside in /usr/include and we currently don't add the right
>> CFLAGS for the common files to include the additional header search
>> paths. Add a loop similar to what we already did in commit 727bb5b477e6
>> to fix it.
>>
>> With this fix applied, we can now also drop the explicit dependency
>> on pixman for the arm musicpal machine.
>>
>> Fixes: 6f4e8a92bbd ("hw/arm: make most of the compilation units common")
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> [thuth: Add commit message + changes in hw/arm/meson.build]
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>    v2: Change the subject of the patch according to Paolo's suggestion
>>
>>    meson.build        | 27 ++++++++++++++++-----------
>>    hw/arm/meson.build |  2 +-
>>    2 files changed, 17 insertions(+), 12 deletions(-)
> 
> 
> Thanks for the patch.
> I didn't run into any issue when building for {linux, macos, windows,
> freebsd}, so I assumed it was safe to do things this way and specific
> dependencies could just be listed with associated sources.
> It seems like there are cracks in this approach, so adding all the
> dependencies per base arch is a good idea.
> 
> Any chance you could base it on this commit [1] (and add it for new
> libraries as well)?
> 
> This is going to be pulled very shortly (as part of a wider series), and
> the same fix will be needed.
 > [1] 20250512180502.2395029-4-pierrick.bouvier@linaro.org
>

[1] was merged.
I'm working on a series integrating your work, and doing further 
cleanups on meson side, so you can leave it for now.

Thanks,
Pierrick
