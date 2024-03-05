Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp77504ejb;
        Tue, 5 Mar 2024 11:40:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOVxuJ22JfGWBjqAroRgPY2tWfzwJaEdnZoM/sPCIzrzTX2eUCKXru1//Watmry4YhE9uzVat/2dc489N7J1xeLqvFjRv8
X-Google-Smtp-Source: AGHT+IER1qp9UzwcjUuNBdNBeNwN9Qv19z1a909RHJpxEiJCn2+ooOlyYgPcNSCNvCc+mztuk9C0
X-Received: by 2002:a05:6214:923:b0:690:8938:9686 with SMTP id dk3-20020a056214092300b0069089389686mr2465235qvb.3.1709667622310;
        Tue, 05 Mar 2024 11:40:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709667622; cv=none;
        d=google.com; s=arc-20160816;
        b=VVICuXdvdoLIcTA7zrPioiSFwRYu/qHogkSmgFap0rpK3Qbzi+1+MearhLrOzwMH1E
         1Js0WA3uVS1dYovuhJ1wBANNdbk1kQ6ay4xrA4/QjaLZU7iw84Ftkj/wkyePzH9fx6Ze
         8AMk8ulQC8gyOBHUBnTBqKseACOdMB/L41Hbr66s43zUU+dZ2iQko6m9g6PKWUYX5zgu
         hDxLLimhljhKnbXKevWCOj1gXbwA5TSTBfiBZy4CTSSi+In7YnAHvOvs29axbssKADLG
         z30CjnlhKv53s/F6D2fT97IuTKl4MtALb19RZvBZY5USpW8MU5IPg1DLvhiIP388G00R
         UYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=f3EGRz5debVJ45qYlVH6UREGSUwJlBvUrwsO1hGmosU=;
        fh=prcxYYbx+RM02aNBYXa1Zw568hdCKvxWihZ3BRWh01Q=;
        b=g28L09BMTVpZNV4ih+KG/lQfkLO8m4ZHFzCGLKbzybp9pOP9fjqMDboKAjE/aC5OpG
         6YR3cxDAKuh8YYG0RX8blAZb5wxBd9duVJFcKf8y1haPV/iixY6YMOXfvuMQ4BOF1mCq
         KylIPJwu1FKT8vvG4kenlGE6HOoeoZhF1VSk74HY/Bt3ZCgJ6GXIf9+O7wzZrK7iwySS
         soucc2LMI8S1qskjLelppRxwUqzpe1dkxIgKMwuL18Th/Hp3M8voNZanXCBTkxzHAAqK
         T0oNd+b2fg2Ej39Ojn8mZW6lEckPp9Y/J0uZ42Wsb4T3G1TEVhp0T2aPYLmOwzRpFmK5
         HKpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qSZNTw/P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020a05621420a100b0068f07ff2506si12495285qvd.223.2024.03.05.11.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 11:40:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qSZNTw/P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhadl-00026K-Km; Tue, 05 Mar 2024 14:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rhadk-00025c-4N
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 14:39:52 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rhadh-00079L-VG
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 14:39:51 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-412dda84216so24074725e9.3
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 11:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709667588; x=1710272388; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f3EGRz5debVJ45qYlVH6UREGSUwJlBvUrwsO1hGmosU=;
 b=qSZNTw/PBOgHQRMFHOnmtoqmhqsho6T+C68B9aEbYWOFA/UFon1usxxF95Rgr0ZdDB
 bk3jpKsoeGTDSNEamBbFeOh6Zs5Bj+HoULX8tiPVr2O+E2n158ReBhqgcg6a6+EkkSyK
 LafkTXv17cQZkrgGq4U6GaucwaOvx5NslYR/ZlddDYA3CSLSQ4qlsycXhjIHS/ja8i2p
 t9QjU8Z86Ap5PPl4WtaFybFm2CD5F9+J61piOW8AYGhEaVwqV6U859wisze/Bw1qD2UN
 N2MkfSdmZWbRsW/rea4GS1Vrg+uVr4lOs9ItFcDkH2IxPTOZ7nYEGhQ+LbfaTesXKo5e
 5btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709667588; x=1710272388;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f3EGRz5debVJ45qYlVH6UREGSUwJlBvUrwsO1hGmosU=;
 b=IPZJkIr6FwLXzkoR6eMcFi4sm6GYTyMYYiDFYaevr9Axhzrk48aSJ+Is4CtI90UlM4
 vvY0k1Mq6YCUviX3FBY+oPnF/C4OS/FhXQWuYgIYyrxvRHwY+agS0xZ71M1DnIWIw2X4
 scQjY9lA7gWkWuFKDkE6DigD6Anef5gXcAuLV7XJUf8kjkROqr9bVA2VDX2fy237AmBt
 8U1/95QYEOgHKoiojeoAAdCD7+I/TKuy2BEAFLtJpF5RhdY1h1AdF3U444By1rMYglgH
 mHEpV1mqGW3PEjTYXyyrzliXh0s/X0pMkYGdX3zEY3pwoIDFtI6flqqV5PHBPV/PNh9p
 afQQ==
X-Gm-Message-State: AOJu0Yz6TsUo5bT3FiOEKR6xQ2cEglfiohQGD8+AlFYz0dQoP0QuefWe
 ERvbaQpXS2cTgI99dPhoUbwntsaKhCLMTUrck+EaRy+v6jzV1sFzMobjvwT2L5U=
X-Received: by 2002:a05:600c:1d16:b0:412:a6b:d572 with SMTP id
 l22-20020a05600c1d1600b004120a6bd572mr9036688wms.34.1709667588058; 
 Tue, 05 Mar 2024 11:39:48 -0800 (PST)
Received: from [192.168.69.100] ([176.187.210.193])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c500600b00412ee8e2f2asm2340359wmr.9.2024.03.05.11.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 11:39:47 -0800 (PST)
Message-ID: <553732ea-e6d0-4669-a90b-e44831ab9d0f@linaro.org>
Date: Tue, 5 Mar 2024 20:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/arm: Fix 32-bit SMOPA
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20240305163931.242795-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240305163931.242795-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 5eKbtZiVajCa

On 5/3/24 17:39, Richard Henderson wrote:
> While the 8-bit input elements are sequential in the input vector,
> the 32-bit output elements are not sequential in the output matrix.
> Do not attempt to compute 2 32-bit outputs at the same time.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 23a5e3859f5 ("target/arm: Implement SME integer outer product")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2083
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> v2: Fixed endian issue; double-checked on s390x.
> 
> ---
>   target/arm/tcg/sme_helper.c       | 77 ++++++++++++++++++-------------
>   tests/tcg/aarch64/sme-smopa-1.c   | 47 +++++++++++++++++++
>   tests/tcg/aarch64/sme-smopa-2.c   | 54 ++++++++++++++++++++++
>   tests/tcg/aarch64/Makefile.target |  2 +-
>   4 files changed, 147 insertions(+), 33 deletions(-)
>   create mode 100644 tests/tcg/aarch64/sme-smopa-1.c
>   create mode 100644 tests/tcg/aarch64/sme-smopa-2.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

