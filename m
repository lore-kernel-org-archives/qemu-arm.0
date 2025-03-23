Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1564154njc;
        Sun, 23 Mar 2025 12:51:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3OCyH6NIhjpn593lI88AXZ/BUpQnJWzr9+7Vt2etLKdYuPjHQ0Gl+iqRhRA9QZs7ONiJgQHB5CJBDsA==@linaro.org
X-Received: by 2002:a17:902:ce08:b0:224:2175:b0cd with SMTP id d9443c01a7336-22780db3884mr179635595ad.26.1742759511924;
        Sun, 23 Mar 2025 12:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742759511; cv=none;
        d=google.com; s=arc-20240605;
        b=NnFa1W4el8buu+RM/GNpuMQb8AhhevnYAAtf5Bv0JodU7RvnL/+ywFX/CpPSBG8puN
         to7CFYsse2x2qVtcmClneDZmvzYi8bdeCjsqwwtVzm3NlRcutt+fJZ8ltziJooRWprlv
         TipA3sqsMhjoYqKM23vCTyCsJbHTFPBaO+HrNzybzs9iDGhpblBpaq/Qo014lUuB90a+
         bS0bAEpsEbKJ3akTWfQLjfve+vgyqi3ieljn5iNK1ln7J4qr/XD+hHe0C+LSneqCQDvF
         PYBFecMkIJrVIvxWFtnzLOP6+nop9qDlBU3W8sC/wIdPS/OoBsB6AMDudrQosyLMlTFI
         nrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=i0LHmMxcfXYfBbwN2Vn1ZoEDENU5Th0R4oTKC+bgm1U=;
        fh=if8ldhE+SUzfWwykM46EyqEW4mQCRmTiB//V53z/dtg=;
        b=EkO49bkVbYUv7HClfPT5bqolvEHA6vojqw4ttTEuQxAo5ZF5XbMD1nKulJ2ARfZUui
         +4ryFsVSFzF45JyteH2lsE3EoPSy+f66Z+rI2NPlNVwydsdJcU7kiaClSWaeYjZ1XkeD
         o6DIPTb3pemhSH0ozwrkyjzUzWMm8TnO7prpCbaTmpsPvsSxGg12TLw0XhmFAc83Dnxe
         6MYO0axNhe+hyscytVIMLtExGzVbB14y80HHDMx967FCrTVGMmX3mpyr7ExtDeWpsxvy
         WWHHUPmugdc6zS1b2aYwesIPhpvv6te7214TwQfvWDA/p/jrdPke/zGZlOnTl8JOWEG9
         sFGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vbB7eTBV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f9820esor38199035ad.17.2025.03.23.12.51.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:51:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vbB7eTBV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742759511; x=1743364311; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i0LHmMxcfXYfBbwN2Vn1ZoEDENU5Th0R4oTKC+bgm1U=;
        b=vbB7eTBV3nmsKEwAtrRTYFBDzBP6AxTZTNk1WNZqlL9n9UX51O6QOUzQjrQJOCNllG
         r9XH9UkcgAor3gNTvkZuV7q0m5FG6Pef5uFmFo5xgipmX09gqo3Tm3z8fIRHH4xGPzCT
         zN9BOHFJ37ZKDdGmrY8V0H/d1o8bSEQFmWr210GjfNdIxcXHnfm9ZVTg2fNqK/62wOkw
         d59qcmLyZSwzzEtu+6XsLDo/9pbK8EwiGlPTYlxrmbdfjypDHqjC1N6HQYqdouhNTIXv
         OmCiGbKc4ANSXxL8/OlTo6GmLPd0agBrho2peSAJpA51QNq9ifPRbbFvbF18TsjC8jx3
         oukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742759511; x=1743364311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i0LHmMxcfXYfBbwN2Vn1ZoEDENU5Th0R4oTKC+bgm1U=;
        b=O0Cf0kK/D9BedLkpMry29lt9xeEgUmQrdoobN/DYzCyUWA2R2nbok63S0BMz0hAHYQ
         zBaUzeXhsZlRz+qrgHmAEHmciW+yfFP7Bo4bDBjgU4xSOVvpRQfsRBsNhzUVPKBkAlV6
         HkS6VCoEtXTqcUuNe/tWCaY5HwXWK98ruAy1nyS8XqV0gin2CQ8OuOZLhJGoykQfeCHa
         53lO7L/Acsh5O5hMRKyjkS13kJzpxQuDHg96xUA4xmHglWhxPez4laQuaW3AlSMTelaT
         TM9sL7ImTIwCq6gPIxMtjSwF9zqtVsl47VgAdq1MtvxpiY6DC3JSbr2183QWHQAgHct6
         UEOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt+FtL/W8QlzMkyxSJF2K1BA+f1byR+jTPF/q4Ix+xvRVAAOXvpLSLeW4W+lk0lbTMgnSsonXQTwGwGA==@linaro.org
X-Gm-Message-State: AOJu0Yzp61LjesgUIDJhuPPMuYKs/y4fO2tgYuC7fn7XnaNs3DeXQx8w
	lHaxv0AbNBuPt7sFFcsNfe3/nO/6XtewWcs5lDrzbz0WMHgW52RSEwDfmZJ9lLUkyg==
X-Gm-Gg: ASbGncuL3SuDJlyI76ehCTs9Ewcj97q2wk1Lr3Sav/0rFVJYaIyOc9mn15Dbse/5qU5
	cXr6Y1lzTMkn+dPUKwdz7RX/nx7l50DI52vFYBmiAuu46WRBbA5pp7tofRt3Nb5JLABCHh4YMx5
	BTwZx4pv9u8xcioaPZYLECQcOANppBH/MbpoJT7hZCodXe3YeOuU6iNEroUgS7CSnDdR5nhPoZJ
	FZNj/LR4r++KNsEY/zsy3nIxk9rvEIy5xUEAGsQtemmCPPuO+/64a3U7KHtyrQ8zI4OSPeu15l0
	F6RlC4B7ySfY1b2ZjIzBynYCww5gmaAKPEQa/U6M9l+t2XNbYIx2l7P9oCeuI1ulbgCi+hBpC1C
	DGr4NqLKG
X-Google-Smtp-Source: AGHT+IGo0frLMbZ3TBKUd7+4E2Js6IRd5u5loZ8jKeTUJjaEuSwwRFZnGgYkJGT64JaP8+5JDD++Lg==
X-Received: by 2002:a17:903:8cc:b0:224:2384:5b40 with SMTP id d9443c01a7336-22780db251amr198184305ad.24.1742759511499;
        Sun, 23 Mar 2025 12:51:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f397e6sm55330195ad.46.2025.03.23.12.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:51:51 -0700 (PDT)
Message-ID: <0edf7841-2e45-4e1c-b521-1f166a8eec81@linaro.org>
Date: Sun, 23 Mar 2025 12:51:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/30] hw/arm: make most of the compilation units
 common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-31-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-31-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 1q6vgIQLYcDl

On 3/20/25 15:30, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   hw/arm/meson.build | 112 ++++++++++++++++++++++-----------------------
>   1 file changed, 56 insertions(+), 56 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
