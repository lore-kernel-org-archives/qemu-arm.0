Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2514344lff;
        Thu, 5 Dec 2019 11:25:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpR0SlBFZ7ggil2iU7F5J2/XN20UZAHuIZfLQ+eQeiIHC43TbYOWAV4fMTFXZ0GUrk5mXB
X-Received: by 2002:aca:de88:: with SMTP id v130mr8925268oig.108.1575573927204;
        Thu, 05 Dec 2019 11:25:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575573927; cv=none;
        d=google.com; s=arc-20160816;
        b=K6KEravT4ePnIn4pQ+P/mCXJPYmiXq23+01my09sXSJ0CDHrBtl/kN/Eou/BsMrO8p
         OLH1lr01eE8nejrYaPVBb3nkRUVQ5cKBDHioJkAcPlZuN875/MPlQDIUoHoyNn30WjtI
         a/2vvy5wK6nkAZB/xJ8U7qdmiYBmoK3l4E3P2NdikO51pD+ypkHht1nDILNDeNVj1vm1
         OQ8PsG8ATy3CUZ3wPLl0NkYMfmI7KPzVHDIhCYlN464dxfYX7YUTuRpECpwRzPIuGEl6
         zTg+xQK9p8ieUbTpIhfJWeA0FKHJcBamr6UQH/VNvMrw38O3QPaH2lHpBnfSbgaZaHQh
         mhwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hGPCjxihMUhKShcKlyxjNO+KotcaAPS/t36MNL94j40=;
        b=TEcKkPROFiXMbdzjcWQHmuHst4xbG/xWtx+eNt4P6L1MbWg9BCqy/q3pntvrMDM2J3
         qXJtQ5UJeOfGcfECBFP0jZDm8ofdHRUlPqE1FmL93aWBm597en1MQ4VtcYDc5sqjBG3Q
         64tVrM4UJ5QxHS6ykHWJxTfRXgrgLkm+ZrGgtP0XdUHzzyXFXBcs24cF/S16TuRfMNHd
         gjhTZ1iu/SnncirNMWjhY8iodWtzJE7ZIKGt6fAEe6gMgxHoQmHpk8amQpec41ghgLfv
         j4MYYFs+c2Um1q5RYj917m1tvxzr8O2la+a0JFMFC7u+6H405sTs0gh8Slwhr5ytRvGg
         ggIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sCuRL7FN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f188si5762920oia.70.2019.12.05.11.25.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 11:25:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sCuRL7FN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icwkf-0003IF-Qq
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 14:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1icwkE-0003Hg-3X
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 14:24:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1icwkC-00050w-7s
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 14:24:57 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35161)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1icwkB-0004vr-I4
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 14:24:55 -0500
Received: by mail-pg1-x541.google.com with SMTP id l24so2054854pgk.2
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2019 11:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hGPCjxihMUhKShcKlyxjNO+KotcaAPS/t36MNL94j40=;
 b=sCuRL7FNZbTsQZUuct5ez9ifzZWjyGajs5TFVPs/77bFu1207pMfPoGnNZoMpv8Jux
 F03/9NTrZ3ZT5R46NN9y76rTJKRuMTnU0Qu3YAD5JF8c/c4WuN1etVYR76lz2fJmBoS0
 mqZnM4n8EJP2pY4Wh/Kyz42XxEj4T0SEFMfBNbS6rSZNuU07SIRa8E5PRdHLp5HcEGKw
 jBgyc4kjWxzVvqdlIqrQvI97pvee1aezsSgF/SvOcmnarzItthIvAPFrFZNq14SDs1nP
 HQHoQSZ+MFZ0ZA3isDdOgVQS8Vs9v737DAj6JIzA7C/34sXNGO/gf9Sq9pinmFtpcOx/
 ewgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hGPCjxihMUhKShcKlyxjNO+KotcaAPS/t36MNL94j40=;
 b=k9FbJSnzxnWG1Hp3mJiGRhUzOmrMLS5/To/QV7Xwl547bCCH68ZOgSFYcLPE4NqZyx
 YRP/3Cj+LBV6Glg/qZmGPdD9XVG4Lac/tuKsFGvjjt6cjSMEXQ3fYiQJlsfjbW6ZZPDM
 th93GKEfuDeD6oEbqPUqZcMMgwHPKOyb9D67GYuE2DhVkZH4LeXu8KCtjLoO3BtRznYS
 5vittkT8cYnIT87/CAW79UpKj0FUo4bG1+8+oo/QEU3xCsiCPYtBRehtoUd9QO1cw+Ki
 IoC+s+7EyzUJ1/bagyhjw0clhVXHchh6DKpFz6WROz+qvJAs6n6vatTJFI86tG8kEUcc
 F7Zg==
X-Gm-Message-State: APjAAAUS5w9GBIF9GlmwmdfrBRT4n/kKH76MsDxAKmW5e78fz3RcVkTU
 K6O+msnQTU6fTpGenGobDlK6Q9PcOgU=
X-Received: by 2002:a65:5307:: with SMTP id m7mr11219160pgq.113.1575573893805; 
 Thu, 05 Dec 2019 11:24:53 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k16sm14110816pfh.97.2019.12.05.11.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 11:24:52 -0800 (PST)
Subject: Re: [PATCH v5 20/22] target/arm: Create tagged ram when MTE is enabled
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-21-richard.henderson@linaro.org>
 <CAFEAcA93AX9nikuqq9M1jZOxv1a7QJZpiocHnn=n-gSbsGBS7w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bcc3ff61-e737-2af2-5c0d-a6062cbaf083@linaro.org>
Date: Thu, 5 Dec 2019 11:24:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA93AX9nikuqq9M1jZOxv1a7QJZpiocHnn=n-gSbsGBS7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-TUID: Ap3MUeV3PNBD

On 12/5/19 10:40 AM, Peter Maydell wrote:
>> +         * If it is, we must allocate the ram to back that up.
>> +         */
>> +        if (object_property_find(cpuobj, "tag-memory", NULL)) {
>> +            if (!tag_sysmem) {
>> +                tag_sysmem = g_new(MemoryRegion, 1);
>> +                memory_region_init(tag_sysmem, OBJECT(machine),
>> +                                   "tag-memory", UINT64_MAX / 32);
>> +
>> +                if (vms->secure) {
>> +                    secure_tag_sysmem = g_new(MemoryRegion, 1);
>> +                    memory_region_init(secure_tag_sysmem, OBJECT(machine),
>> +                                       "secure-tag-memory", UINT64_MAX / 32);
>> +
>> +                    /* As with ram, secure-tag takes precedence over tag.  */
>> +                    memory_region_add_subregion_overlap(secure_tag_sysmem, 0,
>> +                                                        tag_sysmem, -1);
>> +                }
>> +            }
> 
> Are there really separate S and NS tag RAMs?

Implementation defined, I believe.  As with everything about tag storage, it
would seem.  But since there are separate S and NS normal RAMS, I create
separate tag spaces to match.


r~
