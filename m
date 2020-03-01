Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1552704lfg;
        Sun, 1 Mar 2020 09:59:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZ3i6GYHxPG5ciY/F8oDT9Qbcq7Og4b/gCwkNQES9Yx8HZlc+4DBsseuixwH/6dFmiLwvW
X-Received: by 2002:a05:620a:535:: with SMTP id h21mr13642960qkh.326.1583085543078;
        Sun, 01 Mar 2020 09:59:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583085543; cv=none;
        d=google.com; s=arc-20160816;
        b=D64o51NgRNkWtGspsFrDufvkL6NJi/8iERhE3x+56+c97cnjb56CKawTblzXJAV/vT
         DrIkd2x5mc4ERL7Xc01bReDB93mN8Updy4m7lG+Aw6YSA7Si6Lw+LwMecN1kFGRHt8Bt
         CFRYlOdCkhmGN8+chJhGlAY3inG/9qHnKZgh9tr37nZ9UhsHRCvpMNcL8tdQsjYg65BX
         K9vap4zb5nFtWh1b8WYvjK6aa/N5rSZrwcdcBvCw2WiWxvgYZQ4xpf1OsXjYXrzfc7xr
         VShkkbICeO2tY7MgTvQ12k3zHzRfIgHtsdHG6w2qyT3eE7ObgoPPHtvBR/m+f5t8pUHF
         LQaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iAWv6LM87Bsw6cBMylrOKGFMgug9eK+rPqjr9mDSqiM=;
        b=X+E/5B1tUKHphRBUUFA4GxJaoMX1C9GPEDavWBLjuUucFUfpGEo/RynBffxnbLHiPL
         pgL6u57xLOTDT1bELXPZxz4/ETYR6/i6qpftIh5k4Z8pg8ybK2Zc23ahzGLE3ppSFLko
         0nxe4Xbemhg17BtqLmabXb0M4Sx9F/yFKGzpMOVbhk/k/61Nx35+V3HwFjrnGWObneXs
         OA8WCoMl2624oWC/80AgklbnNA3vjNzecdsaUQtm1K2Cly6QOE0tgCjRwBpqmmqiRVWA
         u4X+dacMRc6TnanyL6NFDinRw5gMXzqlcAa7kxW2de6s/Fy2f5k+KAPRVr6kXXX6sTWy
         JtjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HLampV6Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r26si4545426qkm.80.2020.03.01.09.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Mar 2020 09:59:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HLampV6Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8Srm-0000SU-Iu
	for alex.bennee@linaro.org; Sun, 01 Mar 2020 12:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34511)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8Srf-0000SC-My
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:58:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8Sre-0003Ed-JL
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:58:55 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:33106)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8Sre-0003EP-C5
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:58:54 -0500
Received: by mail-pg1-x542.google.com with SMTP id m5so381492pgg.0
 for <qemu-arm@nongnu.org>; Sun, 01 Mar 2020 09:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iAWv6LM87Bsw6cBMylrOKGFMgug9eK+rPqjr9mDSqiM=;
 b=HLampV6YM2YIZHGGCsbXPcY6UFSkNeIxNNXqJDMaPLw2SURLTzYEodRoAj+kvwZTS+
 A644r0wdr7eEI6e1TfzKzajZByRGXkgdXAJKuYAH0ane85UP9wT9dNbMO5StJF0ZxaAV
 mhMy6uAKeGmvOuHy2agB9HQSwZXS0P5S+0J/jg9N/dT/TLK1INTkVk3U3Fd7G8G04QTz
 k0bhWWOGx+Jej1JtQNfikXA0QwzHQOfaz91PFXt6i4+ntjm2bV+/nFlo2MzLw5Hk5RqV
 k6Q61hDdvfE5sSWVtnXoxCsNtEr7obrhnM4gcIno/UpABavzk2+euwAbZy5XhCko72SK
 ORWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iAWv6LM87Bsw6cBMylrOKGFMgug9eK+rPqjr9mDSqiM=;
 b=jcgljPnZU1AeeY7oAh5EbBNycfd6GLOXpXWUTU6R6buze1ciGJMsZgv2BmKF864C2D
 sbebDo3pqKadxJvUf6F3EsxcXd+FPjBT9R7bEDehKXloHpx+kDNNw+BFrZ6SepT1tTiG
 jx0RLdM4/U5SvkgBrMBKmdkRGy7cywRm04bUA2NIsgaIgUInbyqTakY4TcUCru/8Yp57
 xlVne/LOZBw2UhmM/g3KyOvFTz8qlld8MUKqVVd9IIcesSE8Ly0HulkXCVlSR7hJQaZR
 RqxqNi6co34R1RAsqNb+2Xc4y4wHqCjZhXyokkhk06JOkrbCvIbXo9KerU1QRwVtLYa0
 pI/Q==
X-Gm-Message-State: APjAAAVqY/U7Phh8rOV8QbqDjTgbvMnPPGkdet0i+CkUsOitvOrnC2Qu
 PYVVaaCQD0Wo5Dpq+21X2JcydA==
X-Received: by 2002:a63:7ce:: with SMTP id 197mr15655740pgh.429.1583085533136; 
 Sun, 01 Mar 2020 09:58:53 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 o66sm3654585pfb.93.2020.03.01.09.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 09:58:52 -0800 (PST)
Subject: Re: [PATCH v2 6/6] hw/arm/virt: kvm: allow gicv3 by default if v2
 cannot work
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200301104040.15186-1-eric.auger@redhat.com>
 <20200301104040.15186-7-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eae4a0f8-3821-a0cc-1dc2-b54b05d6611a@linaro.org>
Date: Sun, 1 Mar 2020 09:58:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200301104040.15186-7-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: el4rbQO3i4hN

On 3/1/20 2:40 AM, Eric Auger wrote:
> At the moment if the end-user does not specify the gic-version along
> with KVM acceleration, v2 is set by default. However most of the
> systems now have GICv3 and sometimes they do not support GICv2
> compatibility.
> 
> This patch keeps the default v2 selection in all cases except
> in the KVM accelerated mode when either
> - the host does not support GICv2 in-kernel emulation or
> - number of VCPUS exceeds 8.
> 
> Those cases did not work anyway so we do not break any compatibility.
> Now we get v3 selected in such a case.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/arm/virt.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

