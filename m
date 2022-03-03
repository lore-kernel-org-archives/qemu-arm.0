Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1055655lfo;
        Thu, 3 Mar 2022 13:42:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIu5uthvC2UqvzqrmaE54KA4dqBtewkWvtS889F6pSyYwtc1tjzQAFo9Ir8E5891/wcFI4
X-Received: by 2002:a81:524c:0:b0:2dc:1a00:1124 with SMTP id g73-20020a81524c000000b002dc1a001124mr8878141ywb.196.1646343760821;
        Thu, 03 Mar 2022 13:42:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646343760; cv=none;
        d=google.com; s=arc-20160816;
        b=ZxdMx8Ed84TQVtqs8FZNhkVSRqWPLlyvWMR/4GOEFL2zoZv9/yF8TbC5TYueZnNaVz
         bDSI7LneXAUfWN8LvaP5KcrDbZ93FhcpouWogGzCADqo966/CmwnOwjMGDrzJgWUuzxW
         y+6NU4YFDgWk8f1Cq0DISATZAZftqZ5CZjfITT7VVmlA5nQDy7ACKYPN/SKyRomcHGO3
         cZMwYAFbLj66KJlrT8drgYRgr4JQSLhwp+hogp2zuCym+DEDaFKK6KLG9489XiDvl+kY
         6VX5rLe3t1NnX1rXcqvptH4o0GxBepfEeGzaBSpa3KK0ZcUsC3rpxutixYmZXYXIHkFN
         Gq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=TE7TSG9N6Q6UjVPyXL/SmFdubjpx3rQQwlWbc92XhA4=;
        b=U8nnkaKb3DWEOm4R8SKHdMV3c5wn8d6TiyPVAl8EjpnLc9GTYgk3ARfdVMynYkKO+v
         /zNnZf8iDsyfwFeYNKuFlAJSBCWLacJl9eKslvS3xl3lu4CVJKAASNQMB6thAPsPvEor
         M+nfzhlV1Mf/xq/5nhBXb5qUCCM2foNXAABoAEZGJP/ns3WJVg64U6/AdOwpIpOppS7A
         uCB0o9BepWUdRSkL0gtelDks/cBLzGySiKNdlNXXbLkkDL9kT4xi++hKU5vksNEcmUWV
         uarS1oDE0Mj/5s136ZCs2pV5jTPYftPjqPZkcJbzKE0WY6h1kI83LRhKwjUTX/rCCyoY
         5krg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mD3mmbC2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 77-20020a811150000000b002d77e847161si2580375ywr.320.2022.03.03.13.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 13:42:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mD3mmbC2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPtDc-0000rr-6S
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 16:42:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtD9-0000oe-Iy
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 16:42:11 -0500
Received: from [2607:f8b0:4864:20::636] (port=33350
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtD8-0004V8-3o
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 16:42:11 -0500
Received: by mail-pl1-x636.google.com with SMTP id c9so5996930pll.0
 for <qemu-arm@nongnu.org>; Thu, 03 Mar 2022 13:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=TE7TSG9N6Q6UjVPyXL/SmFdubjpx3rQQwlWbc92XhA4=;
 b=mD3mmbC2t7il8R7PJEQlG37TLQj01wUEYUN553ORX69Yfq1Ud1x7+kQOb0dn6D1AsL
 e21iSOUpWw2yXC4pFa9gMt6S8ox1YjQzG3P1NZBqBDLCVMxajUZiyKw9IZUfW/zuoj2Z
 Q8pxdmIXntxJGrW7URgDKDkOf+mE+1RvwwOIAHwv8BeDCg5gUeddHzXLLYiAU78EMxz7
 iZfjPhh0lGx2jXBLG8EvOgmAsiFYBwljnoCkjrWGGRPW74ELULMB0Np3ZXHnR9XcfHM+
 1uMJIa/Xrwxyxj/1t+WHzcuH9NrGVrUwS1Aa7girE7N0Qs+0shpCL9ihH2Fln9GUfQgC
 QDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TE7TSG9N6Q6UjVPyXL/SmFdubjpx3rQQwlWbc92XhA4=;
 b=N1MbWv/oDgY8OfWU7xqwbm5WC2iMnS7Uofn13QofjpNMTJ/JCm7wzVVJGypS9YNtsz
 sChp5L3jHmB177CNnqI8+oaOiYVJoqQXSQ9mb7umdrxz5YGFQmh76Y3MyQDdYyZU9fK3
 a7hxB3Pr5WCVnNJR4xdJi7lEk3fI1cqgjj/K6bgtwsitfTdj8pu72MEPM21ntICannrh
 277MYziHIDfs3iqjdW7Vwk7i7ExcXijgEsRx8k7y3tjEVc+nOLA0vKFUI7ZO9nuWUDWF
 BKBBtu1Lla3CWbTBf3oolsTbhIFUld+7oupCTF525ydfmAwOicm+Eh4BbOkj34X9bFS8
 UhMg==
X-Gm-Message-State: AOAM533J6af6XTAXnlXquK1f/i2maHn3ykntug2fQ+fPwD+otBsLC7fY
 qvYgPZreZB2Ctw81KM0c7XjoTg==
X-Received: by 2002:a17:902:8bc2:b0:149:1ce6:c28c with SMTP id
 r2-20020a1709028bc200b001491ce6c28cmr39034452plo.164.1646343728792; 
 Thu, 03 Mar 2022 13:42:08 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a00198b00b004dfc6b023b2sm3347315pfl.41.2022.03.03.13.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 13:42:08 -0800 (PST)
Message-ID: <773c0a33-b9e1-1539-6b0f-90ebe7c5144a@linaro.org>
Date: Thu, 3 Mar 2022 11:42:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] hw/intc/arm_gicv3: Specify valid and impl in
 MemoryRegionOps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
 <20220303202341.2232284-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303202341.2232284-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dC75yPpiLgLW

On 3/3/22 10:23, Peter Maydell wrote:
> The GICv3 has some registers that support byte accesses, and some
> that support 8-byte accesses.  Our TCG implementation implements all
> of this, switching on the 'size' argument and handling the registers
> that must support reads of that size while logging an error for
> attempted accesses to registers that do not support that size access.
> However we forgot to tell the core memory subsystem about this by
> specifying the .impl and .valid fields in the MemoryRegionOps struct,
> so the core was happily simulating 8 byte accesses by combining two 4
> byte accesses.  This doesn't have much guest-visible effect, since
> there aren't many 8 byte registers and they all support being written
> in two 4 byte parts.
> 
> Set the .impl and .valid fields to say that all sizes from 1 to 8
> bytes are both valid and implemented by the device.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
