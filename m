Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp693798njb;
        Tue, 13 May 2025 10:58:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/H08EnTZqepBPvPz0VVh1HS0nEl0VEZ0x0He7MSWeyoYYPBFyf7fSHKLh++Q5BxvgCihAUrnpzn00dw==@linaro.org
X-Google-Smtp-Source: AGHT+IFeb79XYJ5kETpNtPK7FWpWpb/na4Xxd6Lu6RaUcZtVzSWSAC2hemYzxBZ1lcXiaT9Bfsfp
X-Received: by 2002:a05:622a:1e8f:b0:476:8cad:72d9 with SMTP id d75a77b69052e-49495cdb700mr6359511cf.33.1747159122272;
        Tue, 13 May 2025 10:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747159122; cv=none;
        d=google.com; s=arc-20240605;
        b=Liz8EMueoN8Qyjksc+SmBNBijoV07W3id1luaJ+12T/hk4k4OsUSaCIL7c2YeR8Ct3
         rIapy+zEu/HX/ihBgL/2i0D99vVa1BjrimwcpRZhX6aXrjWB6y98hm+BSXni/1vyIUna
         pip/e3YDIR5ewWnxV54Zntiajntkq3QgASqCnZX11dlUDp+o/5HvmgjquJaBeDXESfde
         9HWOWCwdUzO3r3hJ5pZxGTIPfgTPU9MY0dUVTo1Qo7lCJenmyXZKSUTrR7QeTn/fNGCf
         WUrN4PBxe5mDlJqBwzs8WUscQCKPuD5nGipI1luYqCcjJ4P5ok2am9JsF37vKjhDaJCi
         nXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ImQKxGp/9g4UCviyfMDatpt8s9LnPC896BgSX/2sPow=;
        fh=tjaBveSb0fHD8O7cSvG4XKVLd9tyQlJfnvQohfglMdI=;
        b=cohaKSwR9Kqbehxh2l2/bPHo9CH3gXYeiHaUNlSIHdg4JOsFydVdnjLTKZ9dJJNX/d
         Hruj55cNBPhOp0Z9g45yhQ+5LgWVUT4mqcsP0adSWpQlyfQ80dMH0naEshnmiu26HN7N
         AxlyvAvdFiSm4LlpKilUK8ZCgcerQR1ThLQoCsKfnY14fsdQrA3PeQ1FWGunIJeVNi/t
         60K2j/S/CLE+xeqmLAXpfp9oPis6WcUwznHow5rk3K7Kn8sJBuuPRmJs/XffaSn62RbR
         IzqwyxCmgAleiV4Gd9uGVQ8jQUj3L2h1fcks69rdrkB3RytBgzRE492HF83seMztJPfb
         mFIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XbH7CRtv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452459927si114776951cf.64.2025.05.13.10.58.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:58:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XbH7CRtv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEttg-0008OH-5f; Tue, 13 May 2025 13:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtfV-00032o-NW
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:43:56 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtfS-0003js-SW
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:43:52 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so60897205e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158229; x=1747763029; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ImQKxGp/9g4UCviyfMDatpt8s9LnPC896BgSX/2sPow=;
 b=XbH7CRtv56SOpalHSsxLWakSeQNV5vzN3VRkB1UY0RRiWwpAE/68YL+gqtNGhQEC5U
 pyfbE+JP6T0/KDjrXMY3N3V+bzembxT7l8NXI3XILn1XoMMt9QLRF/PotoG9NjR+3T8q
 7Sze5rB5h0y8GVYYvFRUbIqRoxaaYLPl5SLtiet8b7EilHevkwwjAq4cfDOJvgql50Ag
 vPtn0/roJloXn6VVxw68oLzgnGpdBr2NH4dJ5CnHoN8SuK1nm8SRrqWEi9TdODmjNJn3
 Ug2k5eWwvwgRJqvrW8XaTs0TS2GdWYznXxppAN3X64NJr5VjTA7D58iXNObtI/gQ8kyx
 eTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158229; x=1747763029;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ImQKxGp/9g4UCviyfMDatpt8s9LnPC896BgSX/2sPow=;
 b=IiXTvcvhCk9wpq4bVXLmJ2W1AmtFpL3dxvlVzzCWsUu+Bxb9o7Tu9KVCGn+l0sMEKz
 IcBMENokHE1n3TXWhadDrQUMKS5MyI1xGmJLHBTgm+SE0aAbiF5VXNAQzr/ccMdJmPvU
 qJIeZhp62dpKFCBRRA1n2isUNH6YY/hn6du9WtH1WMxgwWoAz1QewAk86Fo0sxsKB9li
 dKhTRiMCSUm3j2RvvVVQpl8IMZkY9zGsPbDOF7/HQKhIzXzMuJgw7mFXtM/3FWY1ibfi
 Rdz1VNSPCrqxcWsUg3fnCnxJNKXNvB3zMSS3i6RFrxDGs6aHS4H4N+u6mhWyo+wN8N8S
 L3dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNOQnEc5JN0Cf4pY4e4CX2w3BXKV24AIoGFJNlx9KX6v0bEqA0rYUZflbtFVO/mQl6n9Ggs+KsHQ==@nongnu.org
X-Gm-Message-State: AOJu0YwxA0vh4mqNZbvcdIcjByafg0eNuS1H1Ey9ziuGFH00R+fYgXU6
 t56PZmMChyAFyRQ14vi2riiIFuhpIR+u6SuuSdJkM6K0yvOgMm2jHQMTaQCbtyM=
X-Gm-Gg: ASbGnctVp99KIaP7Ti0W1MCcNy6N5BWMKOVwDm/mv+Isjw0xUciWnxx48yZqAH2WuGu
 fyAx/pQnsjY8cZUCFsR4JfjYQ1ajx/PQRdDAjlKqQ1qrZM0sYe6Ibx6YhUxECgKEpPWlOGi5ZYk
 td/NqoVAXCrQSjncekjvbsN4vBnGFyeviQH9WpxRqCDXy9Z7qvWpsa3tkXMp90C/rAitQFTTxpt
 FryYUa/yRu1BZTnMSuccZLMYrGbZjcK0LBcrGXidkv8JaIY+SDY17oi1gXM8kUl6P7DG03Jp3YJ
 Z/ki4uDVy6x6Vxn+DkBFmMkvGwZitePllRvccip+2MahAY4S+GOIqOr2YONDh0hyRdKSOY2X1J/
 McPzv0UTleHfwssfUoyctem3tyor1
X-Received: by 2002:a05:600c:34cf:b0:43c:eeee:b713 with SMTP id
 5b1f17b1804b1-442f21683cemr2090565e9.20.1747158229071; 
 Tue, 13 May 2025 10:43:49 -0700 (PDT)
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3aeb26sm222152085e9.29.2025.05.13.10.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 10:43:47 -0700 (PDT)
Message-ID: <25730481-491e-4c29-8230-1d5d93b0ee75@linaro.org>
Date: Tue, 13 May 2025 18:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] target/arm/tcg-stubs: compile file once (system)
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
 <20250513173928.77376-2-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250513173928.77376-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: SLkKwr9/8C6s

On 13/5/25 19:39, Philippe Mathieu-Daudé wrote:

The objective is to remove the arm_ss[] source set soon.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index b404fa54863..e568dfb706a 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -48,7 +48,7 @@ subdir('hvf')
>   if 'CONFIG_TCG' in config_all_accel
>      subdir('tcg')
>   else
> -    arm_ss.add(files('tcg-stubs.c'))
> +    arm_common_system_ss.add(files('tcg-stubs.c'))
>   endif
>   
>   target_arch += {'arm': arm_ss}

