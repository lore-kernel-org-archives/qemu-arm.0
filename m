Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36691njj;
        Mon, 28 Oct 2024 23:10:54 -0700 (PDT)
X-Received: by 2002:a05:600c:5246:b0:431:5c17:d575 with SMTP id 5b1f17b1804b1-4319aca3f6cmr78622115e9.11.1730182254428;
        Mon, 28 Oct 2024 23:10:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182254; cv=none;
        d=google.com; s=arc-20240605;
        b=d7orJqe7Ol59Q/usQqbuzxEJoG7tAcAwJ85vWypRvR62aDulIJRBaAqCw4RYoPYQhc
         DQtHoGr+KcGt6l0npPrhAvrUwJXFZ8RJlTTnhFuiwW0luwPF3WY420KV/D7DaWPGOo4+
         9D88veOwVJW1GLfIms69d85N1+rLWiImDWmAyAukJCjX0p1QtTgaabuxuVcUpPyIu/a7
         CVB3AcKRejmX4HrYWzZ4yCutSE42MElawFt8Kv81zbcLuZXSnze+/ooeFgPXDVWlLIOM
         Or+CebDQAARD9hFgJb7rkZFpjPAY1QxUMApDW3OHFbqsFmlHHnjOv/ToJBkbYCe9wjWy
         Wdqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vdprgcuz7bb7byZBLscoga4XNpSMzSOLnmRWmYyTOpo=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=M4uAe8tlWaRblrtdPktqWZWECN/0m6glM2DFTfbYUYAY3tCFaYDHqWdRvYvUXaZeIk
         tR9VvRHi9o7qPFxPfygV3NddK46cxv+cwrTu9nbufFbvlahnse2bMFDKGIba1aVe1Zfv
         oX3axUeIWJy+pVLNOIph4URFGC/wawZereAlbJ8Kq8zodzmGrROYNYmnPzLebyzBEU5l
         S19YrgNrqITAMPMjKNfSuxDD2exh4xxgjTjFis6J891ehMqtpQ7JB8IwwUpStgWswLZa
         ekW4oLQKfj6ffTbAVGCsan8xgRPleeeM6vgSwcuUa+jZZd7lKyR2AEWD0HLTCfWvmVI5
         OOWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ERlVfysJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43193920327sor35163355e9.7.2024.10.28.23.10.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:10:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ERlVfysJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182254; x=1730787054; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdprgcuz7bb7byZBLscoga4XNpSMzSOLnmRWmYyTOpo=;
        b=ERlVfysJubP+eaf79qX7bIs2x9qCPoBswn7/DeOQ4XPTUqTmXXmF5r5YxXkluoyajI
         YIZYwUCTyYMTapKL5AkE7go+Ruj0kqxk4jOqDscbVxzBovN++95xRbvTO47htt4h8Mll
         MeZWK1STHwicAQnE+q6MxwMcclEa5aVRN0Xi26rfrfGO/aKgglDyXdK/RyJUXXMKjrh0
         +FdaZSg1Onw6StdRhZ6ce7tVJ/e5DzU8AzOhJOHUI5QZZdoweqXifWfZsWERooBSd5nA
         HbMFVvBvwmqX5Gn7HlufyDpP1Iu+Sim2Hob+zbmIITAJTWnm9mkP0+2UrueNLGbPbhIL
         mSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182254; x=1730787054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdprgcuz7bb7byZBLscoga4XNpSMzSOLnmRWmYyTOpo=;
        b=eh1mZHF3bYgsTTeTfWujTSkPfJNRt3vvwWiEuVN+hl0Zk/nhUGxgNZVOQ856QT68Ss
         sawIRwYa2mkBNyF88oeOFs4dohEegR2Dx1Zg19CAvuSWAaPtZITMOzVEVCZFFzx0DSe1
         vGqtX/Vq90mqPvWIpoblHKLrcTdrvASsPoDbfXD56qNv7Qp8xB0tFMJUHl71QWcc+wTa
         Z4Obq36i4O5op4Ey5lA9yj0LHRHQT9R+auZfptttrOF31kVSyEW4fS3HzJON0+UyCMHU
         GF8shXdMLVd09HPbOyBG682YhGNZD9mIYEbxGLSMLuovhpZusb7a9QZcaQSPX2HlXQJ4
         ahxA==
X-Gm-Message-State: AOJu0Yyrx5paslGwBvfr0MF9BnrCU1zkpxEowZUbd3nkwjTRp6AZTXj+
	7G5qki1MCHKROcMTRTIfoPLkuDnNJs+8tCR/v12BbAJ0owNhs0CBNJNt7l48HEA/QA==
X-Google-Smtp-Source: AGHT+IEttoKAn4x9RZQWbeBvw17DYN/C8JqnY0VyjPOAUVm1zU6rk9Ah9WZu50EGFYDOw0wFxBGzpg==
X-Received: by 2002:a05:600c:35cd:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-4319ad0f10cmr90532585e9.24.1730182253825;
        Mon, 28 Oct 2024 23:10:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f5e1sm165298915e9.14.2024.10.28.23.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:10:53 -0700 (PDT)
Message-ID: <74a8c6b7-9a4c-4595-b3b0-c900dcb01560@linaro.org>
Date: Mon, 28 Oct 2024 12:20:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/21] target/sparc: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-13-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: osEcYKRtQBPX

On 10/25/24 15:12, Peter Maydell wrote:
> Set the NaN propagation rule explicitly in the float_status
> words we use.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/sparc/cpu.c             |  8 ++++++++
>   target/sparc/fop_helper.c      | 10 ++++++++--
>   fpu/softfloat-specialize.c.inc |  6 ++----
>   3 files changed, 18 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
