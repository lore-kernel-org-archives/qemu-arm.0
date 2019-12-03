Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1637192lfc;
        Tue, 3 Dec 2019 07:11:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNCGBHMUDuxkfaDm8fhYR4fy1t3i0IUjSr74OBL+piKtQVtZddZlqkvrR25FunK0XOqL4F
X-Received: by 2002:aa7:cf83:: with SMTP id z3mr3903318edx.166.1575385888721;
        Tue, 03 Dec 2019 07:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575385888; cv=none;
        d=google.com; s=arc-20160816;
        b=q2XWUl/TSVJEd4zVIyuVdVLf6ReizhI4/v5XrIAG0wXtJ4ouNN4cM/6/YSILIhYc1j
         3jVpDrpv7iL04D4EY+H8Uw4VyVoFcRA/3hkdxAx/LrM7H9EoRO4uNjXB4dEZgBJOv1II
         qA1kMzOkM9ziORgJld4HPlpaGzw+X5CoOwMOcziNOjeJzGVSC6dRl9xk0LvQdUqcRfBk
         1oh+doDBIBI4cT3tAK2BqCfi80g0mMqCG23A/t+6vYkldu9pLqDsIjYHgVqf29u8RvZU
         UbQugvYDNxwddHtBF3RT1CJkBkUN+gVELrbUbk17FK0e70wC/yBPP9oj10l7b5i+4aXq
         29Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dwqjuWSNcNr2c2ServoaUGYVWGdUe1z+kLXm78sBdfk=;
        b=PeEuEAbTztKd6WE+4RB86UEre+VBDCoXwK7SvaRW0WXhJFcBcMNkR11oPy7rbjTCms
         FWi+Q616OS3igsnEkc73htfYLlhwKtn3efBt4pN7PhqSnmH/cS6nBOgbMsjmJao7h/jV
         wG4NdPUztpClFb2aLLBIDzv6XvC+1RKLjllN4e/LRf2HYJZMLm6Ex0tS/saNkAIJTLs0
         dzvD3W8+aWw76wX9lva9mUY9SFzW82v0SejNZfsuk+rvNmjV06pIYFxiQMrCEkx+wzWF
         YcXr0jR2H30SSIpNIcDvibw0CCCN+xeDOEWFymm7HyUKwSk9FoFOWxPHJ0bkWV1ALmNl
         eufA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c5BgjaTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20si2401995edj.385.2019.12.03.07.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 07:11:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c5BgjaTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic9pi-0002Cb-PJ
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 10:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ic9oL-00028C-O7
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 10:09:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ic9oD-0007sw-El
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 10:09:50 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39180)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ic9oD-0007dp-7K
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 10:09:49 -0500
Received: by mail-pl1-x644.google.com with SMTP id o9so1810914plk.6
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2019 07:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dwqjuWSNcNr2c2ServoaUGYVWGdUe1z+kLXm78sBdfk=;
 b=c5BgjaTasi0oSrcjSWP7J9FOVQ0GIuVXSDMcnNXLXMCTXGBk7oqgN1fiZ+LKDvepsR
 xG42xzqD4fdhMxLS9tGabMJ8+t48+0hhao7GVhH22ocU1YiKDZJTmlrak+LiL2JplFmF
 hyAEsJMq5XvCzBn0OfmA3+e7cu2y7Llcu9Ojffb4ktxFedt5KlFVsAjbeZTLSZnNKXJv
 6unAuE/PYgSnaqm20q0hj1ap+PwpiCnw93laBN8Zr0gGQINs5/h0YnZioP+NvZdqSUoD
 YwznEaXQLGL7lDMkJH+m9OVIdDWavWkyx4AbHVFg1+9wYSu4ZMkKHqFIjVC8jqVfVBv8
 TV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dwqjuWSNcNr2c2ServoaUGYVWGdUe1z+kLXm78sBdfk=;
 b=nf1i/iiZkg8M8MgaJNQm5VVA7xy5AOt1eqOwOHiAMZksZNydicx89CAlMHSuFFFPhx
 GifP48SvYM+hMkQyyCXnv0DcFkyr5CBGaSxYHjHIOrqLA18HUEPlfFf9sfY5QQcGTYEG
 M7GrwIKT4IHNHNkAO8OBPbkUVS4sEFzoGwZ1wLIBN1R0xhRa6g/7KSjGVWRzVGtXvRrK
 oLV1s0gyb7iO0vAFPczSkg/YNaj30iikKhDSUWrPQRMoSgI88BODoG8uA05+HqoxvAqF
 nlwHoCSN6CncJ3EGdXfvuLT+k4p+wGwys11TbPVtUluMH3AnyH0IJ+fwNbJKkHzCEXE2
 PRDA==
X-Gm-Message-State: APjAAAU/mBel+iuBNDmThMMN4nrNM3JyreRzdGgcPXWBvlc/I3v7FiSs
 L4l512Wu2mPArDNwfQIVnjHReY6QjNU=
X-Received: by 2002:a17:90a:5d17:: with SMTP id
 s23mr5683766pji.55.1575385784330; 
 Tue, 03 Dec 2019 07:09:44 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id ce22sm3291383pjb.17.2019.12.03.07.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 07:09:43 -0800 (PST)
Subject: Re: [PATCH v5 02/22] target/arm: Add regime_has_2_ranges
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-3-richard.henderson@linaro.org>
 <CAFEAcA_Ob3_fGNo3n9hgB6oa-y9abSbtN7Y1u3jpY9uaXNwbSQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2687022d-9165-1059-233d-7b42f4f733ef@linaro.org>
Date: Tue, 3 Dec 2019 07:09:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Ob3_fGNo3n9hgB6oa-y9abSbtN7Y1u3jpY9uaXNwbSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-TUID: 2HsH/cz3rl1h

On 12/3/19 11:01 AM, Peter Maydell wrote:
>> +/* Return true if this address translation regime has two ranges.  */
>> +static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
>> +{
>> +    switch (mmu_idx) {
>> +    case ARMMMUIdx_S12NSE0:
>> +    case ARMMMUIdx_S12NSE1:
>> +    case ARMMMUIdx_S1NSE0:
>> +    case ARMMMUIdx_S1NSE1:
>> +        return true;
> 
> Don't S1SE0 and S1SE1 also need to be here?

Whoops, yes.  I'll need to fix that in the VHE patch set too.


r~
