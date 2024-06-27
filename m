Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp233917njb;
        Thu, 27 Jun 2024 06:28:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da9:b0:1b8:4287:d55d with SMTP id adf61e73a8af0-1bece653e88mr2683647637.10.1719494884188;
        Thu, 27 Jun 2024 06:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719494884; cv=none;
        d=google.com; s=arc-20160816;
        b=R/rWqaJMUYpYLbabNMOrQ82lrg3G5Wika3AlU8/O5hu2g3tqO4D6it7bVcx/Bodw8i
         VGbMhCIpNgNHv5MCuwK+GMF6PnKtUX1B/WlBFxXXJ9tMh22Ij5qzcMNbUWDMnxnnln7v
         DE7w2JepsZjh1dbBNQ1ZPiIWe+AImYYiNk5VCvqxEdSUOJq142nfHsH8cWy+syCLIbrG
         dhvtMlRRklVD1JZ4nqD4oFNmB6b9dgZrwfpGw4vQRE0KnhAebTj0nVACuWPmBYId/ciS
         +VVBhVgYkO9Xw9RgeuS+4n2AQoY/qR2/1UYV6bPX227/4M1P1IlRvYFrvl5rLVzzJ7yg
         370g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=l0M/V+6MN1TB5i2xeWsRvtc78YlFuIst6Zh1syeTNyQ=;
        fh=8SOdx/KLKsk8yBbKCzxfgHZbeB1Urxpyl6MSzarSf88=;
        b=sft4qMpZCMgogDIwkD9REWh048zQlSojllqnZqakTOq6IZy0tgaWHB9ZfwE2+5ZVCw
         8oPLsNRjNT0ReapKF2kqEtKe+22PXKonWMyn4hlqkiTp+0mGu3loGTJerjjL7chdVRBo
         GfMmEQUa9qBlDWJPu7Gth76yhZLyVndxJWZTXWEGO0h9EZlcswhtaVb16ZzE/FshK1C0
         AvX8h6WsRsVmo4Aoy1OzjJVbOGEmkX2FojvKIVEeVcYkZcLCD9AuGYyQQ3s4N9gyWU1u
         XSzrJZPV2SgbanRPn9l+LhfjeyCK6TCw8kMAMsN3UJDgjRr957xoLIextcnMoZSMpAoD
         SnnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=QM97yzp0;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-706a78ba59esor2024095b3a.3.2024.06.27.06.28.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2024 06:28:04 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=QM97yzp0;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719494883; x=1720099683; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0M/V+6MN1TB5i2xeWsRvtc78YlFuIst6Zh1syeTNyQ=;
        b=QM97yzp0oM/6ewLwhB3sU+8tBtjCF7yD+JCdQo38lz09meLQS8/vIbDYmG8dPURF09
         /hePFcb1ZXssHk9zoW+0KtBIXSlR152p6vqVnNo9xwoxjrC17U/Pf4XfHake5O6YTPhM
         J7u6J9sX9EIiz8514FwQnv5A3ihqVFArWRZ95YbUwA6Z1hD/AcVUR9sUukwBgP/dDPJE
         9fyleobI+iXmqLTUMSihjgMCoJbcjSFzJZdVN7eoCT85kVIyPoMEASN7YV130KaRowOo
         7C1HFeigK+MS2RA4PzmGAv2n+i4rWKyxrcuz/2ekkQvS7iCh/Chn0IGFB2cM9JBI4sp/
         SB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719494883; x=1720099683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0M/V+6MN1TB5i2xeWsRvtc78YlFuIst6Zh1syeTNyQ=;
        b=SiwNMhnPthzwyKR+q5fRAZgmax8WLkxBV/FBp+ses/NtTSWGYvophgfPjXXjwtxAMJ
         uE9GV7G9Fbaq6fFzKgzbrZyo6SQFb9c5kJm6bw23XLeEwCNvRmLcWJ2jOMXuvQjIq6Nf
         xmtzfWCsUvcZy5HXWSVCqqAZ0pQkIyzvHAE7avyMgwgFLAf6YyURW74nf7l+KJ29mRzd
         mlCoYxvxkYYPgYte24+GvYt7M5t1BclnVDl18fDu1KX5eCtFTGkEFrQGWECVb+Ka7Ky3
         HoRDc4aZzgzroZuK+k8APv+J5llACaxnRPRX9AbC02M74JQ80nzVdK5kFHtXJMwcAMjK
         Z06Q==
X-Gm-Message-State: AOJu0YyB0iie6quy9WIVb29QdpT2tGtAyEiVPjQ+BUQ23ycupsizuyrq
	OLhRMq1fwTganrHqSOWzBgSXXAE7WEkj5fdTN2fjaQKtWZE/BGocNs158xh0wB6mlHgdxWgZR0f
	P5Gk=
X-Google-Smtp-Source: AGHT+IGkESvHeW0+wsDr+Oqk/vtZiUzjfNANomyo8gi46PVb7QEP0a+RYbqMK9Q6QrLe1PvTHXIbFQ==
X-Received: by 2002:a05:6a20:4f95:b0:1bd:a03f:21f6 with SMTP id adf61e73a8af0-1bda03f248cmr5248410637.20.1719494883549;
        Thu, 27 Jun 2024 06:28:03 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932? ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706b4a072e5sm1313246b3a.105.2024.06.27.06.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 06:28:03 -0700 (PDT)
Message-ID: <d30df7ac-62c7-44cd-ba88-a7f757f034d8@daynix.com>
Date: Thu, 27 Jun 2024 22:28:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] tests/tcg/aarch64: Fix inline assemblies for clang
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240626-tcg-v1-0-0bad656307d8@daynix.com>
 <878qyrpzgw.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <878qyrpzgw.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rHwqMYKqxV+t

On 2024/06/26 23:09, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> Unlike GCC, clang checks if the operands in assembly matches with the
>> type in C. It also does not support "x" constraint for AArch64 and
>> complains about them.
> 
> When are the test cases ever built with clang? Is this for Arm on Arm
> testing only?

I ran test QEMU built with clang on Asahi Linux.
