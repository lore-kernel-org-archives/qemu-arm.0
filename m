Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8272CFA466
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 12:46:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNVx7-00063C-PK; Mon, 24 Nov 2025 07:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNVtJ-0002dY-9m
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:42:04 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNVtF-00084Q-AT
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:41:59 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so23881725e9.3
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 04:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763988112; x=1764592912; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zf90rc5mivwSDjSLztZSrMw0UJxM/sRqkZXzQnucTwk=;
 b=sTXJbCbfL687bEAgEQT8Ls5of5c91VyVg7AUM+ewc0nkaMKw8bwyj2bH9xTOMcv83k
 HAE4YPA02G7zncfnP0X1m5txh7e17iBhT31nKRW4HivuN/VXEHXcW+YykgbvGOrE37Ng
 PpeLEmRtv+mujz4m/MLk5i7ffR25Sj6uIrOLBdz5nD/u6ax6jcjuEufixRl6kbBIrQwy
 mqgqBVi09xHM9ZMQrxJ537j9Ru19jgxsserMxI1FMyVusHIJWh7CV2M2/1N2s+fxNi0d
 OnrjYs82KyO/Qw5SA1jkVLqME7OcZUrxTNXgPNO/8UlpnNOh9jLjXBA42rSD8FYEPs1J
 d2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763988112; x=1764592912;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zf90rc5mivwSDjSLztZSrMw0UJxM/sRqkZXzQnucTwk=;
 b=hQzVwAOXYTW7Q8a3jieESoXIncYmNqpkkpOtI/0XG0Pc2zIMQ5SzF+BuAuqa3T5fO1
 U0mOYcqmUZC12tc8pHF7KJOrIUrrPTTW4mAu+IPUXyllehFjgoBpBIDUqOdcOFhVx6P5
 p7r4Y7G2zNHwMnSy89uLFjg9krhISeqb4SR3Xo/yM/yqELsxddJcAVg0kwLGk8V5PhVl
 BIVX+worNqyLcJY7qq6Vh++hId1Oqu4NApB/tlWMPYEcppQSfTUNMVwEqHPjd8dnjnjW
 WXw1yCtkzoHRU9TW9hZHOOCExi5f2g2oUIQYHbjxB4X7os7KR3xQYyE9+n9inhY/Tsf8
 jIJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBQauzezx7QEu+Xa0l5zGHkdnygoV2qjQDnA/CQoF89lzX59Dk1/3zYlTmmbslaWLghBzeppVV8g==@nongnu.org
X-Gm-Message-State: AOJu0YwWa51/2KixHg64zagweRHWITVoyokju+VfcB1W9pI650MbG/Fp
 Vf95rjuV4di0gKloc3fDBWNXBs+i3xf+H842MLoKSRns0eb/i1msSB0ba3tQb0/Rsu8=
X-Gm-Gg: ASbGncvwA0BwnVvXZnfMvV+P/bF3i/mRdbZ2gI76VMWsEHEyUPOv5thQp5qGFAwLiSS
 72H7BDrGrC0VMXr8lxC0UlUdV/mz2lZYQlUoU0AjTmsyiqRBluvNsndK/J5sq13joq/5WKjBOr0
 ZfYoCnpnOMpdC4TTlq9wWpUR7COzQ8CoJ0jSf9SfmegPz3ypD41NYXG8SsWJvmSaxmbx0LPpQji
 rvOCG8tXXb+K4muUxjablYqjf00l7CUlemMVVvALiZYscjv0g/uxbF0Ojw8oQqNa/5i2pa4y2Gn
 s46k3NUe9ktWJcIbNNKVR6aQ66KeE/myIApTBoS1N5kVlHi3CR2B4Kpe3l1L1enNI1wR46l7tnz
 1IOtiMTIth0pITn1rYs2O/ZmUmveaB/NbFHGWqJetTYGvZOZDJbn9wYdQ0U263d7UfwG/6a5sOm
 IsPX10c90UsUxzjATnBSC+gd4L1uUNA2gg+uDBk4e0gQq7AkvIkoCQdzrVyEs=
X-Google-Smtp-Source: AGHT+IEOO0hPWjLNp7SJAc7+eLaPEC5cQkBYp/A9KvWjjPEf5Qfu10Is/dVFBwMqsHbMgH7lr6TNwQ==
X-Received: by 2002:a05:600c:45cf:b0:471:1716:11c4 with SMTP id
 5b1f17b1804b1-477c01ebc94mr116800765e9.34.1763988112570; 
 Mon, 24 Nov 2025 04:41:52 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf198a67sm204393845e9.0.2025.11.24.04.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:41:51 -0800 (PST)
Message-ID: <0cd6c984-f90a-4cd7-adfc-add9bf0de619@linaro.org>
Date: Mon, 24 Nov 2025 13:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add support for zboot images compressed with zstd
Content-Language: en-US
To: Daan De Meyer <daan.j.demeyer@gmail.com>, qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Paul Burton
 <paulburton@kernel.org>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20251124123521.1058183-1-daan.j.demeyer@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251124123521.1058183-1-daan.j.demeyer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 24/11/25 13:35, Daan De Meyer wrote:
> Fedora arm64 has an EFI_ZBOOT kernel image compressed
> with zstd. Let's make sure we can use it for direct kernel
> boot with qemu.
> 
> Daan De Meyer (4):
>    Rename LOAD_IMAGE_MAX_GUNZIP_BYTES to
>      LOAD_IMAGE_MAX_DECOMPRESSED_BYTES
>    Rename UBOOT_MAX_GUNZIP_BYTES to UBOOT_MAX_DECOMPRESSED_BYTES
>    Use g_autofree in unpack_efi_zboot_image()
>    Add support for zboot images compressed with zstd

Thanks, queued for 11.0.

