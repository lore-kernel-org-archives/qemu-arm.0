Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp2065004njc;
        Tue, 11 Mar 2025 11:57:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWirpZRo1741QA5XzZ3Gd0gEDxmyOnDu3iSROBEf+hP2glEYx8GMOQ8ZaZ+ZeFjs/RNnjlvJwGQCTSKyA==@linaro.org
X-Google-Smtp-Source: AGHT+IEDG+cVYS8DE128VmRTG/BAX9Tikv6eWmKOpMv7qXyW1H4ofBf8x5Gt0I/MFsHOf58MZc3m
X-Received: by 2002:ad4:5aae:0:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6e9006ad484mr310331426d6.34.1741719427162;
        Tue, 11 Mar 2025 11:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741719427; cv=none;
        d=google.com; s=arc-20240605;
        b=Q4NVRr/bPHcZLFtjzX9EhR0QJNdmMIPd4vu20dhdL8GJ+2uiXd4MatzA7Z2Ex3E4uR
         bgBC2yw0iKBhAHWFZ1MUrhcBefOi+Q8M466Qr8NGe5h7AyJWF+eQYwYgbNkotnDE/iqi
         4vp2TnQCHbbNhueGcgZFSjmEHl44dMNB2RRA6xOnDQg7F0HYyyTeCwE+CJZb1UCm3OJo
         E8/pBMlF6Ass8ub+y+iE4gL1apRkkgIJEqObixM+KIo/qNA9Bpg+M6xV9JgnjbQkU0Lz
         Jtb01dZAvlk7bxf7p3dxWrwLvUuJseqtfzlI/rlglYRt/cDFhpEd7PpedwKwnGkqe7QG
         kTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=2FGJR3OFZHYZRlflYXi3dDqCcp+55mpMUge8uADooeM=;
        fh=rA4Fp3+P8+yFG2YoX6rlhcLn9XYM4vxBPbi4uelC9WE=;
        b=SbCUp/5qKP52yiDF9NNQKBLl86GpQY+4JA2tBUbmD7SMTKEnGVH6o+PBVbbw8QO3YQ
         z2pDWbwXcryEW83F+2v3uHRRBMGHqyJFLlGq8eIuQOwGNuDvLb8uWLI/NU5ilEeSRO3X
         gUoeiyyYNAIV80omel6hhBcobpn+64ZveWEg5/XPBalQbDdzVBxvE7LmXU0T1K8Z4aRH
         ji3zuatvd9vbw6u2zNgNHfAnil7EGRaUzQaRL+EL/o4DY9Sgc6wGTrhRyDQUS0thHqR0
         onSPUldRvzwbsNfoilawZA0iIrXnUC0dxhcMBFdglmTeBkomZF6IFPM7NRe6WS3MIJld
         v78A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ERLpCIak;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f74672d2si114393686d6.450.2025.03.11.11.57.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 11:57:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ERLpCIak;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts4md-0003V0-BT; Tue, 11 Mar 2025 14:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts4mb-0003Us-L8
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 14:56:54 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts4mX-0007mY-2u
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 14:56:52 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2fee4d9c2efso9896435a91.3
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 11:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719406; x=1742324206; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2FGJR3OFZHYZRlflYXi3dDqCcp+55mpMUge8uADooeM=;
 b=ERLpCIakqaAEwcyfQz+f+Jf5PbdD3olsP05jfSi01/dSoATGybm+ASYIhruzhwapHP
 eOWG01OpebewJ8yLuwpI4+Ub+VEQTiUQC+k/Zwo3rgJJ1JMGA37eToXQddC0onDGsVe0
 xb6TOo8q49O8X6XClCxJsGD41sSnVgAsbAk7KDiMNE40Byspy+Xyuvv+MJyMZFMZ5X79
 6fwYFhOZx7YgLoVyNMZjzdoSo1HBOR2hGyHJDusv700VbgXOFiOLfQKw/dyV3OX+75zY
 eLMU8gNZv8mSdaFznUl4dcMMEL2g3nJAUA6lXDHgeryS37MDJLdxdy8cpQia3fJjTnSW
 bN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719406; x=1742324206;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2FGJR3OFZHYZRlflYXi3dDqCcp+55mpMUge8uADooeM=;
 b=LXJZ7bK53ThUIRaesO3XVtZm1DzcSOiIPqs7yxRRucLR+zl175Sa2xD3Ys8UriozpF
 9iksO9PaKUYPHX3TPGPZk/v2px8Ohmp3N+Y6bShAgFGS3OqJJYo5/JwU5RDp8YfQUMS/
 idlPL+H4KIpold4YZcIXmgGe126GF72+kLBwrbTCXHcGwYHAVj2C8U1okAraAcTnbHvZ
 7ozkdaatcvFPoUM634Wi3CQUkSElV6Q/RpnOL0D0zXH+gSpqCanZGkDhrgCdGSRn782A
 qvLfpP5Kj1Rkb7r+G52IYYD8SxSXndB62XWFDkGaC751nkbXXrMkTBt2z6JzazqaUAiL
 YSHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOPLgBLbTOkN//OsufmC9CACFvhkC1IOLxHg5Z+fwTG+f0bxcF5LPRZDH79hQWZRpGM3fYJm3EkA==@nongnu.org
X-Gm-Message-State: AOJu0Yw0/lBtYE+O4XKIaTzBr0FE8f3crTWvGgf4xfcYovmaVjauZnq6
 XcJQ7bolxgGMqVZQpX3H7U7DbIAwrIsRC1iEZnxqTwDcJk6u7FCstrl1hiEIDjkBVNTCaxLogor
 r
X-Gm-Gg: ASbGncv5lnDNb8pTQO1PUXUv/Os7k2IPr+h1/bY2wygK7A3zPLl8UUGOwYr2HBfLI6l
 guhhInfuRaMhpYEnVkb5xl2ZZWt5z8t2xVRuLoDmMGO2yDPR9xFBdIEhIVk8LO+ZZ6l2YFYDDUb
 cfwG5/VdcY0TGuHxeX89WE276P6Gd1WrJc7970gTjzwg4/4Q4PfjCDvel1oQsqGUCRCYv/lV6ha
 UMdJeXxm9/Ho+EWk41NoVQOu+BHM4otoqNPIwcANVjWYE6pOdoRlX5+yQQcMgqnp5qjo3lh7HYV
 N6k0b4cJ45cQDkiJrpE4+jolthbkOacmGGa9F6pKaSAcP+uaMbsONCRWVoNFYP0QFHzMftaoL/b
 VGeyAaOFq
X-Received: by 2002:a05:6a21:6b04:b0:1f5:5903:edd3 with SMTP id
 adf61e73a8af0-1f55903f155mr21643279637.11.1741719406462; 
 Tue, 11 Mar 2025 11:56:46 -0700 (PDT)
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af557999afasm26204a12.59.2025.03.11.11.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 11:56:46 -0700 (PDT)
Message-ID: <e454ab52-fb0e-4698-bbc4-06350db10a1b@linaro.org>
Date: Tue, 11 Mar 2025 11:56:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] arm/cpu: Store id_pfr0/1/2 into the idregs array
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-11-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250311162824.199721-11-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: nrEjg6IeuHqJ

On 3/11/25 09:28, Cornelia Huck wrote:
> From: Eric Auger<eric.auger@redhat.com>
> 
> Signed-off-by: Eric Auger<eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---
>   hw/intc/armv7m_nvic.c     |   5 +-
>   target/arm/cpu-features.h |  10 ++--
>   target/arm/cpu.c          |   8 +--
>   target/arm/cpu.h          |   3 -
>   target/arm/cpu64.c        |   8 +--
>   target/arm/helper.c       |   8 +--
>   target/arm/kvm.c          |   3 +-
>   target/arm/tcg/cpu-v7m.c  | 120 +++++++++++++++++++-------------------
>   target/arm/tcg/cpu32.c    |  52 ++++++++---------
>   target/arm/tcg/cpu64.c    |  44 +++++++-------
>   10 files changed, 128 insertions(+), 133 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
