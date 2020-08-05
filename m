Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp718865lfy;
        Wed, 5 Aug 2020 08:26:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAANRXAKyHVitt4w1sIF8NXc+mBr5MKEQpvh4I//rfO1jxyKPogNEu3Q2WlyyKdjf7FYl5
X-Received: by 2002:a25:2fd0:: with SMTP id v199mr5302781ybv.169.1596641215438;
        Wed, 05 Aug 2020 08:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596641215; cv=none;
        d=google.com; s=arc-20160816;
        b=dMZBLl55ENuWYpknWmwkJ0dFkim9yS9iZH1LD8XGxYY65ZXhB1Jo7UlGOFsSfMXap9
         xJkJEZapDkIceJEqBk+sr7FC90olY12z5jYHvbB3jM339bs7iuYs6rJ4N068QV6iJDSb
         QR8wtRbdHCG4V5Ae2jlaw6IItBRiJExekwVC7sXILVghafwm9GVLcrPSZgB+N1tXuy05
         UVLOvdaUvIsAuhnMmwpbV0hJcjycDtzoAxs1P0BFhv2D8ALcuNvulxkkQOhnib24kKX0
         jv7hfqFcOLtxVFXsqCIfM4NyDtzmqA1gMnGNIzWyJEylEJEGx1TYYfnmkHGA/LcbNaAg
         9xFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FzwtIdvDao/Wvsd9e4q80GAM7pBf7kP6S9fuZyiSD+c=;
        b=JudW6NkTU5KkK0dD6aRsGGETeDZ54vOKVp4AQJD71V5/IUdUI81ZKGK4JVXL5UFQoK
         FDD2fQTitsgTkQuTWEZKCk4AakSo4RhEsgDh8upD57f7Rw5d7wTBDiVCbvIfKKGkXVDB
         PFsQDFDHBdvOliobc6QANvQjABWXWbhukvM8lABL8C0KNfs2vC9H3s6n9qp3BvW/m3bW
         QSVFWmIrxco0ULJm7oKIfNCJ0MqTrxn0hm0eCve9CJGEsRcpK/r1vXecThH4FtsRRupH
         kUu31TcBvjob7Z+zneZJH07Io8+KhSx6k6nQ5piW2sRRqk2KDK4O9zcZC8wRLNJMBrqV
         bpYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RA7jsveZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o187si2310534ybb.475.2020.08.05.08.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Aug 2020 08:26:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RA7jsveZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3LJe-0000P3-SZ
	for alex.bennee@linaro.org; Wed, 05 Aug 2020 11:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3LJN-0000OZ-Kq
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 11:26:39 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:32894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3LJI-0001qD-FK
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 11:26:37 -0400
Received: by mail-pg1-x544.google.com with SMTP id o13so24634138pgf.0
 for <qemu-arm@nongnu.org>; Wed, 05 Aug 2020 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FzwtIdvDao/Wvsd9e4q80GAM7pBf7kP6S9fuZyiSD+c=;
 b=RA7jsveZyKVivvn/CSv7ZEGTYu5DvJ+2Vr4wcD7UbQ9XJCu5vCJyCu+vf6KlCbxQms
 Ch3U5PHAC8dz5/+ZdzDj2hJryJ3qiScMrcFtm6N+ScxqpIMmlvcWUwFNvNUsjtjSlf/W
 M88R+dTGB4g2ZXHJelTUqygjMTdjW+ttpIn5D5E3QonMy+AW/brXB9eO7rnHFOyp1iNJ
 Bp42Qd4NWUEz5ZKFjNnWO50vbSTOIt3HeVFE+mZnVG048CHCt5mPjPVRWMRuH7aik4Pz
 4JBli1iI9AoL2n6cjZ3hj2Ko8PB2uA6zgdi7PU1q8QKcaVV54TpmpjvzzDuKDjYZwlhP
 A11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FzwtIdvDao/Wvsd9e4q80GAM7pBf7kP6S9fuZyiSD+c=;
 b=iwuWoDwsE/zDQGS0pGp/QL6PQYhFSQgmabGeQMU4eXM234VXOAC+ffmm3WOj9mh7GG
 vN/iIXWZ4QuIDMMJuFFi0lkf5ZloiaQjetJx6jZx+uN1KKN0kmt0x2jYLluMwPzu2PYn
 K+tNYmO3VvtT4MceN8jvUyTJO84Z62S/NV29KcJYbesil70agIIzfLkzc/iWOewKK9v2
 pAB9YHDKYUdieawBvbKEOXQhTc3p3o4hsDBQEdsv4XrJVVKVAfqFPkKh7DnWtNPSemc4
 3sujm8gW8WKgrdMf/ljtXJ1+POgjLx4N4GOP4iDgzxggZBH5KOVySIYN9bCI3A+wrLeN
 TGBw==
X-Gm-Message-State: AOAM531qktBTXMfw8MfrBpjAvYS/ep0PCnbN0IJ4JfjO5Vf2siolahvA
 LsRBLbJ072iz18L7H2akRBp3FQ==
X-Received: by 2002:a63:9246:: with SMTP id s6mr3350195pgn.22.1596641190676;
 Wed, 05 Aug 2020 08:26:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id mh14sm3396545pjb.23.2020.08.05.08.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 08:26:29 -0700 (PDT)
Subject: Re: [PATCH v2 for-5.1?] target/arm: Fix Rt/Rt2 in ESR_ELx for copro
 traps from AArch32 to 64
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200804193903.31240-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e710d6bb-564d-88bb-aa60-894ddc1280c8@linaro.org>
Date: Wed, 5 Aug 2020 08:26:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804193903.31240-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <maz@kernel.org>, Julien Freche <julien@bedrocksystems.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jf1Xt0HSjUUf

On 8/4/20 12:39 PM, Peter Maydell wrote:
> When a coprocessor instruction in an  AArch32 guest traps to AArch32
> Hyp mode, the syndrome register (HSR) includes Rt and Rt2 fields
> which are simply copies of the Rt and Rt2 fields from the trapped
> instruction.  However, if the instruction is trapped from AArch32 to
> an AArch64 higher exception level, the Rt and Rt2 fields in the
> syndrome register (ESR_ELx) must be the AArch64 view of the register.
> This makes a difference if the AArch32 guest was in a mode other than
> User or System and it was using r13 or r14, or if it was in FIQ mode
> and using r8-r14.
> 
> We don't know at translate time which AArch32 CPU mode we are in, so
> we leave the values we generate in our prototype syndrome register
> value at translate time as the raw Rt/Rt2 from the instruction, and
> instead correct them to the AArch64 view when we find we need to take
> an exception from AArch32 to AArch64 with one of these syndrome
> values.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1879587
> Reported-by: Julien Freche <julien@bedrocksystems.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
