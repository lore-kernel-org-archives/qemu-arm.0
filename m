Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2336236lfm;
        Thu, 30 Apr 2020 13:30:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypKl1GRx4CynUlzODj/RZO3XLOiWpBF0/y8ciEMpLgF5qMLHcFQdMpq1kcRTEx+J9EN1lK7D
X-Received: by 2002:a0c:f34b:: with SMTP id e11mr777053qvm.76.1588278612193;
        Thu, 30 Apr 2020 13:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588278612; cv=none;
        d=google.com; s=arc-20160816;
        b=E0IETZmXMOfdIuktsbSa0drfM/F7vWG2h68wn+fSevv+qhVrW+jgZC8ToLzi8TqW8w
         QjNi+ZEgvD9nqXZ8DfdmUUW33+pGz2gBow6xNkduP9j8ijxLTlsmIjJdv7psFn4Ej8jj
         HCL3vdEd916lc9YJlj9tMoqdd3lUD1LnUt0PcLfvo51qRKhkota+w4cCbApSBCzVst5X
         5PbwUdPhslO0+gbmeLSYsvdWcvcIhpkVQc0OLi/vb0pd4BJ3zeoeUKFDlw0/Xf5jIIsB
         O+PdmURvRuGV6aSIIniq5h2dKgWLI4bOSnxR/va+WsQ0UVr2xfl8knxsHhdC+TGO7bpY
         5+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=A7+ZVS0TOmcdhqvub3gm3KVAHgp6kudxQV8JsTnJ9XI=;
        b=x33sKAAearqb0UkROAIVqAqIu5ukmdLmdTArAJltphWXPNClPVLsR02EwrmFL3mTPt
         sMVfXYM5UpVSA7fOc97GDUSO1At0oeXbeEuFqsZbZIGvT6HZHcxIuOc0yDuDp9CQtJjK
         chQ0R/KuS8lUEvQwioipYfq2tsB3pVnkUWJHrJSVF+48Ajx80BE4k95MD1Vo/9/EhNQg
         N3IDrgBqtM22x9FeCNZi6LVM2R9H4n5hVW0zZkW0d5Zy9LVzq08jBND5DvoxzsZTat3s
         bbNecOLdowOFJUQ8bNY0++uj+zD0ImIYI34ZSmrdj7KHUaRKFTlDbty15Byi8/Cdw2vF
         njBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wmfnq2wP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id k32si497056qtk.50.2020.04.30.13.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 13:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wmfnq2wP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUFox-0005n0-J4
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 16:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43604)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFoH-0005RG-Je
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:29:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFnI-0007Cn-5T
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:29:29 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:35273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUFnH-000780-Cv
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:28:27 -0400
Received: by mail-pl1-x643.google.com with SMTP id f8so2743760plt.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 13:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=A7+ZVS0TOmcdhqvub3gm3KVAHgp6kudxQV8JsTnJ9XI=;
 b=Wmfnq2wPdEbkQp/jzzBAk10/Z+jFw7VxtTpiBaKcb64g7chuXSmdPNXL+JL0TlAAdf
 pCtXLbflEintzNspNhspHxfBOUd5PHVv8N1M6OI4ACQpFjDRl2L5JzrBFEl8dxZ7T/V+
 eifG2434/cWGlkQgkXRT1VUnUT6t56O4FI5SMZ1FNHZBPjWG5BZFkfpdDCj7ZhVhKE8E
 KmufgMEzbWUW6B04ewL4hr+coFK3pK2G8o7v1vI04l/gCDmo/mIwD/hDCSLPAgzRIrS3
 nFUyzWTHs3yHcgzHKO6TMDk4BoRcKwzugJcvaUivcVpOjO7iaWJlcelxb86qDGsIXOSi
 b4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A7+ZVS0TOmcdhqvub3gm3KVAHgp6kudxQV8JsTnJ9XI=;
 b=C8g9RqdvrFVkIrIEiC1gunqPnb4zoe19x+vTACK5prWPrDsjiZb4cAYhtCWYiAdPpW
 O1/mSQ9gP0/0vJJs03CaG2am+a/QD2umE72ZTuD7BLUnh3orkDo96Rt5QWECYE+QFOLZ
 3xyVoVj207ERgWHQRouOp82KNWdgF7N8vxuDV2IZbvVufdhlMTxbiaDefxSY7y1+vxKC
 Yz3ckTWeTjfEYs2L4udjsMB59NuefnNOwnbuVRb4UIbscUsK+JViNx+2oLTPk5KtcHVi
 UoK93E2ww+Q3vf+XCH4Mn3FZTKmXRp9FR5LmyGjwQwX0qfRmJ48nkYpz5Ave7ccORZ2h
 +kMg==
X-Gm-Message-State: AGi0PuavYaB/zgVTrbKiz6JQXJygxF5B0XopdKeqj91E3ZUQ/0f8fpGu
 Nstf4xt2eAjXVhAvkJ0ZISPEEg==
X-Received: by 2002:a17:90a:24e6:: with SMTP id
 i93mr698545pje.13.1588278505094; 
 Thu, 30 Apr 2020 13:28:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l1sm507127pgn.66.2020.04.30.13.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 13:28:24 -0700 (PDT)
Subject: Re: [PATCH 20/36] target/arm: Convert Neon 3-reg-same
 VQRDMLAH/VQRDMLSH to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7c8d148d-8980-ad8b-da32-008a0e6f81be@linaro.org>
Date: Thu, 30 Apr 2020 13:28:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::643
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ScoZ2HNHpeYm

On 4/30/20 11:09 AM, Peter Maydell wrote:
> These don't use do_3same() because they want to
> operate on VFP double registers, whose offsets are different from the
> neon_reg_offset() calculations do_3same does.

Actually, no, it's an around the bush way of computing the same register offset.

vfp_reg_offset(true, reg)

->  vfp.zregs[reg >> 1].d[reg & 1];

neon_reg_offset(reg, 0)

->  vfp_reg_offset(false, 2 * reg + 0)
->  vfp.zregs[(2 * reg) >> 2].d[((2 * reg) >> 1) & 1]
    + ((2 * reg) & 1) * offsetof(lower/upper)
->  vfp.zregs[reg >> 1].d[reg & 1] + 0


r~
