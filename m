Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp697523njb;
        Fri, 6 Dec 2024 00:37:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsF5rUgqIgoLDhWi5nfUANwRvvODneld2jUFfm9pP2T4913Dim1x69KZcKzOX9D3Zd7gB9mJzE5Gm3rA==@linaro.org
X-Google-Smtp-Source: AGHT+IEp9FkGoFpkPNE793Ue/uLa3rZP/KyLNU34dVAGhzRIwsXaLnqQubAeRuoYSj/nmGB6RBKX
X-Received: by 2002:a05:620a:45a1:b0:7b1:21c4:ecf8 with SMTP id af79cd13be357-7b6b4200ad6mr1049592185a.28.1733474249626;
        Fri, 06 Dec 2024 00:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733474249; cv=none;
        d=google.com; s=arc-20240605;
        b=apSpD7rGHHGocBUrvV2f42mltZx8v5TkfXS7af4By69QBleAGQ/m94GIsek6CJyEKr
         rvPHSN8Kv7laD1zAASB9B2/xfaxeOMsDXx53fFQ93jFl2ajiFozF0CNV/NGpmMy1xuHb
         qW63zR7qlSakuUCx2EKMziffPdi+bvkdBCqI8AAgR3hZ5t29nbeuJNFNGU02CVUxoeFt
         fEhUXaXvFfgjv4L4liNfSImrSA8d1rqc2R474DW9D9ad8RfdhlUu9q09nYTYGFD61x5P
         ZVhyfaBn60cVcfH1rlZBAF0lQxorqQ/tgsM+ltpnByjOQw+3Zd/NeOTS/9YfzUIV2sUk
         PNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7nhidEb1IbCnfI1VRfOcGhrs6Oze2WCXwJfisKinazk=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=MRUyMQsLAjdKl4NtdGrn4glWts64s39eM1Ke+kHjtiqFaaTQx6T/0Ks/NISRUfrSQt
         qBWknahqwnjq7mx9YPNR3k4OUvmuUKhqkbWXtTNW6HzqHaWsfJMXA5AUTiM6QKqg/v5v
         bYGj/I8TRecxLyL9fpYAw29FLE4Q8LCom6JCVpkYa+zBc+tmLIpHvafTH3rTANjYGgC6
         ffUD2rMv9dtG2q28cVcRnm4O/fSdfZJi8OI5Pu6CtPsO0UomCZ46Jcfdo0akX9eMOpPF
         spx7/gMYWieHuVmUnCYsHQ8CKRpYmeLm518q/pTLJh98jwYPnS/n9O7mBWZScS64Xhp6
         VnYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l8dF8J4i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467297b99d9si34990491cf.232.2024.12.06.00.37.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 00:37:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l8dF8J4i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJTpw-0003Cl-VB; Fri, 06 Dec 2024 03:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTpu-00033I-F6
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:37:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTps-0000d0-Um
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:37:18 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-434a10588f3so11878005e9.1
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 00:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733474235; x=1734079035; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7nhidEb1IbCnfI1VRfOcGhrs6Oze2WCXwJfisKinazk=;
 b=l8dF8J4iVOTJop1lHcS9FjRaZY5TPkoF0+PX4fF2nEB0QG/5VNc24Ava5YrhXaPJM3
 FvlWDnhU8DHxPqx+CIOy6TymyHCBuRwoQw2eco+8eJTQnLLBnVhpVer/NXTY+Dez2OfE
 Jcbos11PWaBJwaJbgr/ib0jiMxiBL4S1G6o0spjeHfzWMtH9NnXtvP8BXSdhPRWaStIE
 ANbnJ15IZli6CmmCycw2e9vBjNJTSB3XaUeC2BsUBPA/mw4LS1ppj5YsbYjiZQ63pjPP
 XM+d0EanwMuOBLyJb0xjxNlzxwQv1FoqUFDbIGp9/W2BVScnVQ6mFOR8ndc22vUI6tyI
 ngIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733474235; x=1734079035;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7nhidEb1IbCnfI1VRfOcGhrs6Oze2WCXwJfisKinazk=;
 b=i3HkIzDLHzydrVlO7nrRIVqQqN3pZs7pNXZLGN/qIf9PnIkXxzeYh3sikAuS8+CEeQ
 1vyXGpQ8kSeZ7JFSuyyDQguYU9AnIcEo+/Hj23be9torTNlEPLGFLsocLR9Cy6fdpn9J
 UlEaTg6NFdhvQv9ItXVNefd+XReE+bLdzYzzWjioa1yPvduwI36txxOs6j00jwCYoZ1X
 1iq9uv1/vZ0tzYBei1SvRpsmqdTevImAK0jXiB5BACaHckOwor2qQVRtBcwNWYuOEFb2
 y91NqbEOeIcfPPL2gpe/OkW81Xin+eoRKzSXPm4UcB+ARUtzecujUEYGCVHt7R0T2Bki
 yUBg==
X-Gm-Message-State: AOJu0YxlSWFo9cLE6oqyxhJte1+8gkdZZZbyIODggIuudo/jZko0ODHG
 CyUItN9EVQfpIFzIRy+rIyyrYQ1NyLZIaJx1lpPZFlnB+TlPy2dB0R7b8PfAeus=
X-Gm-Gg: ASbGncsAB1GD9+VNydx8FVwzwS9gbLuFUhEziZ1iiVTJh1qt8S3Sb/uN+dq0lypB7jH
 JaK+oEphp7a4UYks2EINDCc7Tm6jcwkd+qSk7uGtVf/VdGlnXsnld/6I4tQCcgExWWub1YogiHo
 S+zNDiIyK7CUQo6YGdCKOnIs2hgcPfevtR5nTu5/10QQYY3oDGQ7b8CV6RGr3hQ/Dttv6elruoG
 18SfUkC2KsyxPnjnymxb3DYc+BNhWiAXUWs7OXHhlsMIo9x9InmsWo30mtBndbImeLzKJ87NgAF
 fmqzOZlv/Fqxe09ylA==
X-Received: by 2002:a05:600c:a46:b0:42c:b16e:7a22 with SMTP id
 5b1f17b1804b1-434ddeb5573mr16890775e9.12.1733474235259; 
 Fri, 06 Dec 2024 00:37:15 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862e52a96csm576484f8f.33.2024.12.06.00.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 00:37:14 -0800 (PST)
Message-ID: <62a7bc66-b987-408b-a296-33b71e286239@linaro.org>
Date: Fri, 6 Dec 2024 09:37:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] target/arm: Convert neon_helper.c to fpst alias
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241206031224.78525-1-richard.henderson@linaro.org>
 <20241206031224.78525-6-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241206031224.78525-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: 0PdlW7qY3Cay

On 6/12/24 04:12, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.h          | 14 +++++++-------
>   target/arm/tcg/neon_helper.c | 21 +++++++--------------
>   2 files changed, 14 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

