Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4346901lfm;
        Mon, 27 Apr 2020 09:52:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypLcquvqH1EWujKCdFFEa8Rsm/AmH4+xTvjDojPknl+ji+bMvxVF8thqBR5oX4UfO+/IViRG
X-Received: by 2002:ac8:d83:: with SMTP id s3mr23606915qti.238.1588006339303;
        Mon, 27 Apr 2020 09:52:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588006339; cv=none;
        d=google.com; s=arc-20160816;
        b=KNFeu7ImQAGYjKSQJ4pE5SiP8czZLTYwrO5unaTj5bduzTf+4TrFlk23yAmpw2kWlX
         61ZaivNncPusv48is6jMVJrL/+HGnrxC9/TfXeloyAvB/wy0pkuKz+VPFfxHieDj9nik
         d7kkOx/B04+IzDTCukLjlk4wgIr/b3NQnECVUE2q5xao8ugmu0kDRyXbBvwxzH+R+H10
         /0U8SW14kzUy/klsKafHvEO/2/tQ11vV3JBXynhUD9n+9KxEvi4VZd1L7zY9UrIM0aFu
         ZfU2ifT9pKsMwig8s3Ck4ANWCeuFyO3/kUi6OTtWxNFAs78alwWAVkzYf54fjueLUf42
         JnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nY4WAPPvJj0E1d2OBpT0hEobW4iCmcMkCcfKzd/kz+4=;
        b=CLDYvGNaErvzYUo8PBU5NGo/rEqhzWz49kXOsEG81hwg9fjjCBuSmDl9Zvf7ffVRwO
         CNglvjJad7slO8dq58cs34vb7NF6dnTNi0Sx2uXY13t7IQ+vYuczIpQm12W219pTt3BF
         1T8PU3oTzxZpIrYtVs37GwjQxRoVdd8C60JCFjytug0wkc1mE3gDLrHNuF3iBsREH6Jp
         HqXqd3u6BErHnUey1XBXOH2H1HAHOT32kQnbjjRzhrHBXTLwT/SZis7QyypykPB9Kb50
         bVr1Fg7uwocCoNlNY7AkUpeiys2vNA3/dNO4K2zDKuz9aKOGm/u+Y89znB0/IPlapDy3
         bCGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=soVdPXk0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si8844003qvs.74.2020.04.27.09.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 09:52:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=soVdPXk0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT6zS-0007WK-Nz
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 12:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jT6t2-0003uj-MO
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 12:45:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jT6t1-0000C1-Fk
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 12:45:40 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jT6t1-00009S-29
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 12:45:39 -0400
Received: by mail-pg1-x544.google.com with SMTP id n11so814511pgl.9
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2020 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nY4WAPPvJj0E1d2OBpT0hEobW4iCmcMkCcfKzd/kz+4=;
 b=soVdPXk03IZ01AvyeNo+4syJLwjbZqBG5nsQZafH9yDKdiQxZcrUY8S1Vrh9OTRk90
 /O92eVgvHy1SdFPGdMtFeL4/h0MIV/N3MGnEup8sYvAznXv1oKuAnY16g3hdnRIKZBGy
 Gbbpof0KM2V7D7snx+xj5/j0e8S+IUgmow+TU/cBDOeqn22YdTZG90nHAPmPxjzP0hZr
 O3AmJiOVkYsaLIZSM+4I6K5h1QvYM1BgMaJ2cn6KYJYJ2bf5MHliEA1Ljg7YQkIJhhw+
 cDZ2yHHAZEt0UlRPK+55Li2LCEb1S40E6F+bhjgT+8D9EB7DCVR7vSKtxEx2WQSGFDg9
 t7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nY4WAPPvJj0E1d2OBpT0hEobW4iCmcMkCcfKzd/kz+4=;
 b=JKibED0YjHuuHh0WmAbkobWxorZBxtaZSY/EeJ/TQlisDcFPNBMC9P3zQpkvhPZniQ
 JRYx8rP8AmcejYuWCgmfaV+oM3BdNx8YKoVidtQYi+/CxAf+0oteO1wrv6MmvqxpCPBO
 PASftT3cz7VYa6Eobz8shD4C/DtBDVYGIBca2ohAfR5Dw5nHkr39sJgKDA/87hXq/JSp
 QGw/dOCqlCCX1p9MEVTvlWv5gs8Y8AlzVs4rgdXUplNP6jomT5Q//n6iI0z8qU7KMifp
 psKjQXTSy6fUtdleFw0Y5Ry8zJMRLVDv6HRDVe6mOjmb5qDPOHOKY75fyv2I1gdpoclX
 BJDw==
X-Gm-Message-State: AGi0PubxqLjyajka29F2MQDm+8vR/qEkTz2DsFhXqrMwLAbxeisdAiZb
 xU+FfzJZavYr848GdddDdywfde7aOns=
X-Received: by 2002:aa7:962c:: with SMTP id r12mr25644732pfg.232.1588005937049; 
 Mon, 27 Apr 2020 09:45:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id w9sm13177437pff.101.2020.04.27.09.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 09:45:36 -0700 (PDT)
Subject: Re: [PATCH v3 13/18] target/arm: Update contiguous first-fault and
 no-fault loads
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200422043309.18430-1-richard.henderson@linaro.org>
 <20200422043309.18430-14-richard.henderson@linaro.org>
 <CAFEAcA8oWP9XGzD+pb_VhDth8zx8j1Gz4vwiK+dArpw8x1BmqA@mail.gmail.com>
 <22c1fd55-7cd3-6320-1f90-40d1bd2cc883@linaro.org>
 <CAFEAcA-iqrEi_wQ+mBN1NtrEKq3uDYPoDunqW5e9KV6ivz3-SQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d148806b-c7f1-fefc-bfb4-fcefb81ab509@linaro.org>
Date: Mon, 27 Apr 2020 09:45:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-iqrEi_wQ+mBN1NtrEKq3uDYPoDunqW5e9KV6ivz3-SQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lTLjXVi1Wir1

On 4/27/20 9:32 AM, Peter Maydell wrote:
>>>> +     * From this point on, all memory operations are MemSingleNF.
>>>> +     *
>>>> +     * Per the MemSingleNF pseudocode, a no-fault load from Device memory
>>>> +     * must not actually hit the bus -- it returns (UNKNOWN, FAULT) instead.
>>>> +     * If you map non-RAM with Normal memory attributes and do a NF
>>>> +     * load then it should access the bus -- but doing so is illegal.
>>>> +     *
>>>> +     * While we do not have access to the memory attributes from the PTE
>>>> +     * to tell Device memory from Normal memory, we can validly assume that
>>>> +     * non-RAM has been mapped as Device memory.  Thus we indicate fault
>>>> +     * on all MMIO.
>>>
>>> I still don't understand why this is right. All non-RAM is MMIO
>>> but not all MMIO is non-RAM; so you might have something that's
>>> MMIO (at least for the moment) and has been mapped Normal. That
>>> shouldn't fault.
>>
>> Everything that must go through the slow path has TLB_MMIO set.
> 
> Yes. But not everything that goes through the slow path is Device memory.
> We can (should) fault on all accesses to Device memory, but we can't
> fault on all accesses that are slow-pathed, because some of them could
> be entirely valid Normal memory.

We *can* indicate fault from MemSingleNF for any reason whatsoever, or no
reason whatsoever.

> // Implementation may suppress NF load for any reason
> if ConstrainUnpredictableBool(Unpredictable_NONFAULT) then
>   return (bits(8*size) UNKNOWN, TRUE);

What I'm trying to talk about above, is the third statement in MemSingleNF,

> // Non-fault load from Device memory must not be performed externally
> if memaddrdesc.memattrs.memtype == MemType_Device then
>   return (bits(8*size) UNKNOWN, TRUE);

and the reason we can't actually test MemType_Device here.

If you have better wording for that, I'm all ears.  But I don't think there's
an actual bug here.


r~
