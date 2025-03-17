Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2332912njb;
        Mon, 17 Mar 2025 08:38:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVn1zIXZB3YIRLs5vsjASJV/odYHLg67vrfFRBN7LQHiPAVKWguJM1cbITL16hskCcBOvJeJA2VsYWjuA==@linaro.org
X-Google-Smtp-Source: AGHT+IEGO6AhNLBc0+LzIwWdxoW3xblUH8v50tnyKPb+c3piwMz25Yv3M11ziarV8eNnYnV7o4EQ
X-Received: by 2002:ad4:5dca:0:b0:6e6:646e:a0f0 with SMTP id 6a1803df08f44-6eb1b83f341mr168956d6.12.1742225889036;
        Mon, 17 Mar 2025 08:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742225889; cv=none;
        d=google.com; s=arc-20240605;
        b=gXeSRcFXDq5sk9fBt99MoBuPZLI/G0/X5f9zm6bYZt7xY3xOdMvgkFiY+QW9Csp4iw
         KCwJcKTuha4hf/5qBCfmDkXxZBAaDmWWE6VnmKzP8hmp5um6OpkbNYTFtlnikUsqyGrD
         l1PhIFOuzWJCbrO/AGa5epKVxSufWnLn3evOg1/OFoaZulR+zrOFP81RoovOUusqXuJh
         CaOyRUH3lB1DtfIFlDlYhqH7AF1UelZF5Glo3U60iOXADFSrTUQQOFg7nvdVllbNGHoK
         mgcEM5JM4DiRZFClnuyLwPsn9TGbhw644XJLhiIm3OXS5Hc2WV9tw9vhAmtrqoutyynU
         6yIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=LXemVvvfchk5QEIj7ECTgKr8v53oqc8w4tDIBZfOENc=;
        fh=N+cZyalMKyuBC//ox8QB5ARJC7S/pB/Zdy+Ur9rg5HI=;
        b=bM2f50wXgVOEjDjbNSYlbK6JdN2/3H2GZ1BBQsiV7wnB3eR3n6H0gObj9t91Q4Gi/u
         sUwEaEwiaP+WVY/DxEmxqJsC42XWGNp+EmtBdkf5TI++AWv/sEpoBVZwAF71b8KSVpxB
         /IEEciCZNEIKgnpEcSiI3iMnxobZY32DruQYqf9fihsvEIMPQRYD8CNZe/e6Q5qHbHaM
         TrZSZUTRmuasItfDAt6v0lqlqE2pcJOtxPM07VNf85dqzHoBTfDJUjxtfe1fh+9/lbiJ
         Em8iXcrhKRcB7j93PQKX27gOdeqNLbeGzNF4rgr8Mr3yFKean/mb5vaWw4zRoPLj9TPQ
         C7dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ViMR08e+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade3739f0si100159076d6.470.2025.03.17.08.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 08:38:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ViMR08e+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuCXM-0000cp-7X; Mon, 17 Mar 2025 11:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCXK-0000cU-63
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:37:54 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCXI-0005m3-BE
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:37:53 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-549963b5551so4536653e87.2
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 08:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742225870; x=1742830670; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LXemVvvfchk5QEIj7ECTgKr8v53oqc8w4tDIBZfOENc=;
 b=ViMR08e+5EBM5cy9aSyWQiYUmYD52p2WMvbQYIcBfzSSvFRTTsKBthXGMqMM80PX2/
 6ZiQka/zKlvuKLIa+Ia51hn50NQS7f3pu7Dq2MXi50K3Vn5jwB7hRzqQ1ZfFFbZGQWKv
 6g8cax7kVHwliCf9UC3YdIfAYHID7gKH3BJSfecPBB4YSnpEgcGZvWMgndNE9S2WTrQK
 jgEppq0wJv2LWUZOQbuQIlu/YOoQp01c+M5G1wihVnNpQPI15BUuF4nTGBuCOMhtaZMM
 n61IlpqtqRWPEmkDWvn4ElvpY+bzY5KBVzb2VzY3nleO/5e303BZYgvzycmxmNEHtA0T
 JSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742225870; x=1742830670;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LXemVvvfchk5QEIj7ECTgKr8v53oqc8w4tDIBZfOENc=;
 b=qq+J3268XjYa82p88NOcOLebv+SbOABl1QCJchqw4OAv9OVcep2rSHqJ/gMY9lNzG1
 s01svNJHpDBmWNeSNOvXWLgeghu0LfAiXu/O3dBlq4HT74M3KiK6gGkCDAY6o0Nhq6qh
 N3ZTnSrW2okldZRQrt+tvj8b+hLMpG27FnNTcitPEaPe2wJ/hfQA5KQiS/s7dzS+dPt7
 2MNDJVpH60P3OSziNs5JN4ZzFUg1F+svcqLnucFPwAJ4OReIoLVBY8n6NkUuAaNlcLvO
 pG5vOrJIt0PDE0Th6VUH6Fxq9sjL5zJD8h3GnAUOYCOXOlTXtsHKcelRyzehiAsUQxaw
 U70Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf0bXy2UBX0eN8pUS8Zv8WZFaTdiQwhcrJUWl3YcdMGv9AykLqPdjY/sZDPSMGEm+sw+a6kPejcQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzh8ESM8Xa/urZbK+Z8Tm1rqJfPmHocyjrkjmrlzM4RbjETwOPJ
 uBTS0ze9TmyjMPg0ZGxogXack3NmAGTxRG/uTqdehk3ajogw+WV2vCFYP1Lgv9Q=
X-Gm-Gg: ASbGncvOExvUIqGJ1oJLrpxbSnmfxK+RRV9sCukv51LDRlhlfJmN17Sf46svii93XjN
 VG9HsJoRdahYpIABctYbrFDEhgW5lbuQfT4lInaKVRNIN9BgL0VQNJhxb7aP2awQr2Onvyd9zwF
 kvqDfNBrg0Da6BBnadHIWyqSf5hk/1XQ0GacN4N33C6WECzr1Km1kxhR/FsnJxjRpVYvKSS6EoB
 GZ2ya0IO3kPPlVXNbV4z1A2z8/kdjaryzRVZ0AxixCuj8euNN/uyhe06bzyM0CjWNf5hMXvTtzU
 TlsDayYkt4vu3/+gUlZSXCjsMgiqRalXyLPXX8vfZNzaVztXF3POt37icS9oce1ebIqpjn67o1p
 vSSlHOEGTrg==
X-Received: by 2002:a05:6512:ba3:b0:549:59d2:9ac0 with SMTP id
 2adb3069b0e04-54a03d0293dmr265185e87.47.1742225870087; 
 Mon, 17 Mar 2025 08:37:50 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7c07b0sm1338592e87.79.2025.03.17.08.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:37:49 -0700 (PDT)
Message-ID: <329771e4-e9b7-46a6-b49e-497033857a31@linaro.org>
Date: Mon, 17 Mar 2025 16:37:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 7/9] target/arm: Move aarch64 CPU property code
 to TYPE_ARM_CPU
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250317142819.900029-1-peter.maydell@linaro.org>
 <20250317142819.900029-8-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250317142819.900029-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 73r1rfhcdTwd

On 17/3/25 15:28, Peter Maydell wrote:
> The only thing we have left in the TYPE_AARCH64_CPU class that makes
> it different to TYPE_ARM_CPU is that we register the handling of the
> "aarch64" property there.
> 
> Move the handling of this property to the base class, where we make
> it a property of the object rather than of the class, and add it
> to the CPU if it has the ARM_FEATURE_AARCH64 property present at
> init.  This is in line with how we handle other Arm CPU properties,
> and should not change which CPUs it's visible for.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c   | 36 ++++++++++++++++++++++++++++++++++++
>   target/arm/cpu64.c | 33 ---------------------------------
>   2 files changed, 36 insertions(+), 33 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

