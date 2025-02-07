Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp428646njb;
        Fri, 7 Feb 2025 11:04:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWX+OoKmDHfTbzsiqh+Ki+wcOlc4IE9XtQXIgn09TIL/gZFTpMIHk/AjoOUX61AHi6ZzRrkOQCR36s+fw==@linaro.org
X-Google-Smtp-Source: AGHT+IFzHEPEFbDyUjUv+3cQe4mf8iq/2ykmBZ1XwD3Ln4pMP/V2f2a4mCs/8yY0mxxLmaYkFmiD
X-Received: by 2002:a05:620a:29c6:b0:7b6:7030:511a with SMTP id af79cd13be357-7c047c7521emr712851285a.37.1738955042616;
        Fri, 07 Feb 2025 11:04:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738955042; cv=none;
        d=google.com; s=arc-20240605;
        b=OOc0e6lPa+sl3jKDj9gyXNNjHgpObv14hpb+5c/h4tOCNN92U1GzDsZa07f5RSFGx2
         1oLhm9GzP1pmAfr53PWtlF60Y8tSfS2eGYKqe1s9UMClxZ8FG0uDVcRi2mas2kQUbwM1
         jYF/aJZk+Fap+TQsCtKtWj1oASZu0v13SsyT5RSvW4hgXMc4uGU9CcYC+dh4K7uf3P0M
         xP68EmhuzrkQRdXgsMW3Z05J4BFNIvzKP8rzs/X1yb6GKR48SLFzOU5QNvx4GJXlE9Y3
         v1hD/yZVoRcUMpdRh5EYw1VUS36I3AJVO02GtS94EJDGTvaKACwK8eqDK+ucucES18ce
         mVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=x5iLhqQVo5p3cfm1ZHXkEjzjBbO03jMKvKOw7vCeE+w=;
        fh=+14RDqOiEl341Sw3NqTk2yeTqK5zeOdG/41RkpUPr1k=;
        b=ABjCs2Gh4g452k7mjdStUoU+1H8fuOAs5ogvP1uY6aizNvyNAiy0tn7VlnvugZLwXB
         3CQnw+5lfj6AUl3uTbnw66aMK/9mI8raOGn22PNFl7/muK7cR0kj3AYr9PI0u5MkNN1j
         mCy01zXHdTQO73C2FjDvqvfK903k12JKJA5hnIiGdl15nliHv0/JQ4lHugHL5cKVD3Hb
         mH2z4b/GP9Prb+Dn7jdaRzPYc3q348dQD5hixR8WPMCyZX/uA4/0heXxuPlp4h4N1L+Y
         gVHACkql6eSWvG3OY+Nh6tljxuM1qt1j+Ek2hA64X6Hua6bHpnHXaG9EvvIK6aOn1WO8
         bepQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4eTpicz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e957dbsi406704785a.229.2025.02.07.11.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 11:04:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4eTpicz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgTd6-0002T0-2I; Fri, 07 Feb 2025 14:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tgTd3-0002Rw-GI
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 14:03:05 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tgTd0-0005QJ-5N
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 14:03:05 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-21f40deb941so43277345ad.2
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 11:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738954980; x=1739559780; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x5iLhqQVo5p3cfm1ZHXkEjzjBbO03jMKvKOw7vCeE+w=;
 b=C4eTpiczapIPhgWIFBn5btO97h5HQLR/En4pq5mvv8bFJDw0XpnlwnB/QjkeBUil9F
 bc7qgN4QYSOhKIVGUSoCmDUjcH2fkJF/2QjZ0jFRcqCs2gxfvMHNPdIIw9RK2hQRUVv+
 9/iARV7uvkA1yw3J3we3Qv/tXuNiXOI6HdRlcaL94kFvM3ZN+SQbTTfDcxerMVYT0ger
 IeSCutLmAPd3V9p5LFcTYUKlcGhea3Rv8kaXL/VAyzgWeED/s2uxjeaOsWG9KGmOkBrW
 DmGccshjwVtAgd1l1MTVmP7IcnKFnal+QTI/G65QH8hmIaHXCvluNKVRJucppp6Q/fs0
 iX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738954980; x=1739559780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x5iLhqQVo5p3cfm1ZHXkEjzjBbO03jMKvKOw7vCeE+w=;
 b=O2gpMGmutgew9zwzaR6677tFUPFgkkgxkq1GoXmQyn7Dp1eg7YaMU/WlQBfZNX2eCU
 mOVIRYH8gP/EIdtrKPrNk5g2vfuAd36gnJuIJBrfRHt9EPENvaVCJMGlO6hrDjRF/anw
 VNJkLseZgB0n+qLPcYVHlFJOzpPgSGgOb7+BsZ3qf0miq6N9h7AqjW4KwEKeu6/+cqoy
 GN1FZb25HWI8fmYl8Rhb8wchifjlu6IwqF7MzA/M7AknpBm+zDlIcOBqJZNNmcgup5FE
 GozEwRsFToQ+3JKxj9ISrOZ4fQN/2RvB/Tpnpy0Uj7KfuwKx+4+RMT/r3Uw6K5D9q8nh
 vvpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpNVxYYwd94ya2+Xkbv4qxiY8zVt2PO1ePsYIL14clzB8xcecQjf/n11l6K2K1bEMPcN80GakRiA==@nongnu.org
X-Gm-Message-State: AOJu0YwVoHr1bqHv8u4EDHQKXU+XeCNKMwlYdNeEUib94PIT3ALoeRXX
 PzMxdykh1uMsI7j1/PYhLoweoHfrAgcMn1X9NTNjLoxjHN+PVQ0n0REL2f3LLs9eI3L8uHx+Sz+
 5
X-Gm-Gg: ASbGncsMOPlHibVAuU7dXH3rxvz1YlUjP7TeQ41Cn/w8DKjgm/14NUWO4r8ZQpB5B+d
 sAZZySMNIXXcq3Y/jMaYs+hNV4RhpYbCyFVxfxGQVYVfjylOPT01yw2yH/mPsqh6FzGN2OPR7nn
 A5706sW7hqCoGj3Mn4pFRsNW+Q/3gwV4F+WaWeIFF3mMtP82gc1h4yH7RsN5rNGO8lRKeHtb72d
 w/iALMNFaHt3vAVPYV0baLmz+9KOpegLYQHYIl1pYQZOgswAT97KZoBidNYgy3UHWH8RA8dSasp
 BeXrjEtcYGhJZYFVEGz1oNLr/leYlfjicSy/4OuaJCB/0N472fJ/YMk=
X-Received: by 2002:a17:903:1c4:b0:215:72aa:693f with SMTP id
 d9443c01a7336-21f4e6ce75emr60838215ad.9.1738954980335; 
 Fri, 07 Feb 2025 11:03:00 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3687c68asm34363405ad.172.2025.02.07.11.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 11:02:59 -0800 (PST)
Message-ID: <f5878231-79b8-4e29-bfb0-f9a57ac3f6a4@linaro.org>
Date: Fri, 7 Feb 2025 11:02:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] arm/cpu: Add generated files
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
References: <20250207110248.1580465-1-cohuck@redhat.com>
 <20250207110248.1580465-16-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250207110248.1580465-16-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: tn2iaR90RT9Z

On 2/7/25 03:02, Cornelia Huck wrote:
> And switch to using the generated definitions.
> 
> Generated against Linux 6.14-rc1.
> 
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---
>   target/arm/cpu-sysreg-properties.c | 716 ++++++++++++++++++++++++++++-
>   target/arm/cpu-sysregs.h           | 116 +----
>   target/arm/cpu-sysregs.h.inc       | 164 +++++++
>   3 files changed, 860 insertions(+), 136 deletions(-)
>   create mode 100644 target/arm/cpu-sysregs.h.inc

Why are we committing generated files and not generating them at build-time?


r~
