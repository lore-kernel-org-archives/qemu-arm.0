Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp192563njc;
        Fri, 21 Feb 2025 02:44:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFLMfhXyJvHQVpWYvhfe0pWH2x86K6uIb8eIDdxEn+iImPxruLn4xbgNqQ5jt3aj+BuvJgoSuVF1TAXA==@linaro.org
X-Google-Smtp-Source: AGHT+IE5JT1GqY5skw4xHJP6pHII9HnBKsM8Suwn91Xr7tR8p1H8VMFG973FMHk5IN4j8PwEc5O6
X-Received: by 2002:a05:6214:2469:b0:6e4:4331:aae4 with SMTP id 6a1803df08f44-6e6ae7f391cmr35102966d6.1.1740134677400;
        Fri, 21 Feb 2025 02:44:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740134677; cv=none;
        d=google.com; s=arc-20240605;
        b=kr9l0HFjFfWl+YH+qB645M/3NgRARFIfRtOP0WPoMylq+OIglk1Jb9pOJjVH0MJMui
         UTI4I/owVgwjrNkb1gt9kmX2Ngr+ZOW5P/VccFTMLegE1SgGdlaXrnyoltcLmqqUbMKU
         fgTDgHkWmSfcsiRKEP1bnxzRquDYOfXRO5Z6kEuwKjhLbL8Ce6twaSoGDWmQuW8uyyjH
         MszPYUx/pRy1a24Iv9FrjHdS/6YoBmixwDn+lhpzyjPl2jbFwKnf5ykWHtYmgSrFXXHJ
         e1hOADeadXuoXzJuExWhZiryau1AWMDPVX/L3bf8tVhq2TK5TF7q52T5wAfdP8mVrduL
         wN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0hwfsBzZh98QBTrbGtKBh6llchcX7pniNmKm5d/EfCI=;
        fh=u+Zo0laQK1b3BWJPnMFk7T5uVmvKYrIkhnriJHYHpL4=;
        b=YqW1KVP94AofSBcidqFrVfcv9lh6mvL6hegp3iY+GIIpf/UJlx3I+1gW5bC9zQGuqd
         1aBfA0j46W6mwVtflBzxRJDOHfO/79tLM3GDfSUed66VUEUUN1bP8LIbQ+3m0//EVFCC
         ln6eK6KGYdNMw/GWCh6J5LbwXZSFYaNyD0iEBHzpDJzyPWFO3z3bnzxrmP5TnSUQsnHD
         HopNfiIlQ+zpmk5gPYV/ZB4qq5Y/tiSrLNtK/4HBXcQ1FweqOFZxoDv8REwZ4fCmAISz
         v+CJVOomOcsQCkeSfiHsoZE6dgMfHAYWIU4atoEKA+/yX7bEDYk0s6o8tQ6tvMGHYkKe
         Y2Sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OKa+CY8f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9a0f7bsi163083386d6.247.2025.02.21.02.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2025 02:44:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OKa+CY8f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tlQWB-0003WQ-Lw; Fri, 21 Feb 2025 05:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tlQW4-0003R3-Cl
 for qemu-devel@nongnu.org; Fri, 21 Feb 2025 05:44:21 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tlQW2-0001uC-UW
 for qemu-devel@nongnu.org; Fri, 21 Feb 2025 05:44:20 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso1093602f8f.3
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2025 02:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740134657; x=1740739457; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0hwfsBzZh98QBTrbGtKBh6llchcX7pniNmKm5d/EfCI=;
 b=OKa+CY8fUH2oQzO6rj8NBvZLTx0zysrx3D4d4pLolYW9bUxM4zZaS/8rq+8ZXESKZC
 K0qS2Cqpgz+CPX+6CAcl+dxTVPNRxq3sQIWTyrJgZEFPBIKudYhIHuyc83Anq/JKq8lE
 2skxqMXZfe0OJ+tq8zNGwXu2IExN1/8miF9FvyC4YwzdNPJbQ+Alb5Fnmh0Y36Hvm5/d
 zCmVD0fa11+FjpZ5Z+u/PRpiNYHvB4Nfio0AwmErRvJbhh3xFo67/CMqGckcvWHGEAt2
 4NNwV/o5JiI2gNrdfAC3XU500+OzqpbXOoMwnQlXVNWfmYxUH8k+k9vNUlFn6faffS7x
 hBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740134657; x=1740739457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0hwfsBzZh98QBTrbGtKBh6llchcX7pniNmKm5d/EfCI=;
 b=Udd6CfCKf26bt/slH7sDTFLgfpFfcAOcz5j4yTLgHJ5ZsyVfQr57fbcFTnYNs98wpm
 QNkn63OuAgL2IvP/5cV+xwUiYfZyfhAiBgOoxLqXgOGcZCkNFuKtCsJP6mj8+jdRAWYJ
 xXAkwSJDQpSp+ZH1VPLVOANw1V5ytp3+PT3c6xxLyFiZ996hAoE5uNQOnx/qZtTIEMYL
 eok3oDet4nGS1whW67EIMqOXCs6KtyUit3HHOfCgPcdCpU84CZ8f5jFmPDBaKQv5UqUf
 6H+2SKLi4ipEqnKCIjTrCeIbh+Bxl4yfaGYx/SI7iAq+RgrJ9ekmrR7cWjOq0Yp84Iql
 PlNQ==
X-Gm-Message-State: AOJu0Yw9fiftn8XR5NhMFaTw9qB4ux9Ja3dSaKpjcmHTqvOGHZoX4Kst
 R42mLHLupPAKGg+BpPn89KRyAEveoV/nAhRSNZn1R7nY3lz5TMmiO0U1zYFqotY=
X-Gm-Gg: ASbGncvo9A3rk79+KfAiUJYsPmBhCPhHhnY+mymE9TVJCzccRAtdsUiGt93DdPdS4bR
 sSJfu/pgZjVy7KE3bq2J6atS2hunuiPMtR5U2dN2EY2cHwytKi2pLX4UL0++k0ZlEk3QIqquQbs
 datL7mmufGeDqir6DdFpFVCW2qs0MSWGKDb29D2iS/dGEwQQOa/b9DGgkbys5zfxrFSjMkTHD9+
 FNAXOLoja+pvS5GDQVHuJcdbSuatJBtsbwAeIDgyDiEpcKVRErCZZLvaNQY/b7BRqefb0ZXAhXM
 fZPSUlPcZNs2+GmkC61bgdCp8WnP3okOf3Tc3MQQ/NyV1ePVy0+oaEZVTVnRUkQAOfygvQ==
X-Received: by 2002:a05:6000:154a:b0:38f:27d3:1b3b with SMTP id
 ffacd0b85a97d-38f6e756316mr2174134f8f.11.1740134657178; 
 Fri, 21 Feb 2025 02:44:17 -0800 (PST)
Received: from [192.168.69.157] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d58f3sm22964171f8f.73.2025.02.21.02.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 02:44:16 -0800 (PST)
Message-ID: <fc644b42-c6ad-47a5-9940-bb6842a06771@linaro.org>
Date: Fri, 21 Feb 2025 11:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] acpi/ghes: Make ghes_record_cper_errors() static
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20250214041635.608012-1-gshan@redhat.com>
 <20250214041635.608012-2-gshan@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250214041635.608012-2-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PPWoyjFe1RVI

On 14/2/25 05:16, Gavin Shan wrote:
> acpi_ghes_memory_errors() is the only caller, no need to expose
> the function. Besides, the last 'return' in this function isn't
> necessary and remove it.
> 
> No functional changes intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/acpi/ghes.c         | 6 ++----
>   include/hw/acpi/ghes.h | 2 --
>   2 files changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

