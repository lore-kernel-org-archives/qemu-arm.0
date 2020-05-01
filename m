Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp843417lfm;
        Fri, 1 May 2020 09:17:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypKsDSIXkLoPhUidcyPMtHTUNXH+N8UqIJ7tgwZVurKVDQk6JJEWHBugj9t7l+sUOpXRnhwF
X-Received: by 2002:a37:a0c7:: with SMTP id j190mr4108209qke.461.1588349836456;
        Fri, 01 May 2020 09:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588349836; cv=none;
        d=google.com; s=arc-20160816;
        b=fUpyV6OSUpv6YWFiowvnvJcW1Qio3lDY87k6zGnFtCo4FJX6eC76ovrLv1AjTqgaup
         Slm8upna+kydaUwem86NUtqQ6fyWXvdAfaz6q7LmXGgFsMA3jrU7RSOUaPW0EjSNxP9Z
         ndtmsA2IB49Nvfs3aGOdVli0S9Pqh01WEOZmMfvn3Re5Y7oQXMFlneu/JmKzIOsxoNQ3
         20PzYFdfu2KHcq8fWt5gVJqVLYQXd3uncTMl+0BebsUKIugwZAtsJn0tKlpmlapCWOyI
         vS9vkGsyQdb5+hEzvqRjvVriIJrx/2FjDJjdcZJXxDF/3GX6RExZm1CSejJWawnnvH2r
         gJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JKXpnMhRsWCU37mbd0saCRVgrFFSwsREtPGyAIcikVA=;
        b=C5BAb9GjC2rgrLvM+R1hXAQW9JP9ngRfZt5CeoplH4lbTSo9Q/6QofVtnVETWrrLUt
         9XMW2kJXYV2noO/nHAfYxeH5OMg3wj/+Fo3fjoZ8Lx8jKBVe9x4DtvfNBXsYde92l16t
         kdZogISmaIobaSvIbAQZ7cDG9IDByG4GMZvl9B8I30kF42kDp6CQ20PK+L1mg/Job/VU
         NHHNtLO547a4rmStzKy0qxtCNrDuvxlXMkDH9wyGjpPFnKU6DGbZBFGBgjxUdO3FcZnx
         7m8uNTcq+JsClntti+SeOEmosyjj9i4sW3tKdFGqtj/VPEXozC2sRRo64W5wUAslwGEN
         V6/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xIieqKW+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id w50si2037837qtj.31.2020.05.01.09.17.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 May 2020 09:17:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xIieqKW+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUYLj-0006Gv-PA
	for alex.bennee@linaro.org; Fri, 01 May 2020 12:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUYIn-0005e8-RC
 for qemu-arm@nongnu.org; Fri, 01 May 2020 12:17:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUYIR-0002x8-4a
 for qemu-arm@nongnu.org; Fri, 01 May 2020 12:14:13 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUYIQ-0002wg-Ld
 for qemu-arm@nongnu.org; Fri, 01 May 2020 12:13:50 -0400
Received: by mail-pf1-x443.google.com with SMTP id p25so1750344pfn.11
 for <qemu-arm@nongnu.org>; Fri, 01 May 2020 09:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JKXpnMhRsWCU37mbd0saCRVgrFFSwsREtPGyAIcikVA=;
 b=xIieqKW+DvUSAvOuxraO/Wsl3NsKijGSSB0Mp6fGTq+4C1Ma56o78POfEn8m0v4jsk
 bl3NbMgRdYd80AIiobCNQQT+LgK83oS7LBzpZDNIjFMuatY//WUfzJS0/9c58TzTAuLf
 sRu9vTEfYn5/ac8/4bPBk+TYZJ+6NvWLym0iM8Kt+EwzbtbqaZe7kV3n5+SdN2OId1hN
 hBuJY8FNK3GzFTlNGFyGhay8S2bsFkRqD5MVWCVkE5V5o/x3+YRZERVKjbCp1JwKtWYH
 r0D8C4kOgb5EAiEwQS4p1ToXSi67tdrTB2Uotn235IpbFB+Gc2jxLuvmfhAcKFvRhyqd
 wbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JKXpnMhRsWCU37mbd0saCRVgrFFSwsREtPGyAIcikVA=;
 b=M1rUe2EqvWBrviEw3n/YT7hMJ/mcwpgCs1h2scZZzOp6IAN2n2U0tpoOKp9T6J5yz3
 y7oPnEFZj2lYHig6Ac3TZs0cAlrMhBLS/8nEdiMGSwB61XgNWjK+7W7KwX50Z7C3WYK6
 TryMmgYcyhgqjS5xDR2BGA09slkWqmY9WLdkX3RDSmm+KW1X/70jtIWUzfFs3b0+ADgM
 lDoJtoVNLgdUafL81Q966GCrvcM7SBvf1Ro2CU7mdWP7kN/rfLI1mEfaZ/gYPe+8ALPy
 gyNkkgsnj3niS0uw4ziiMbqdXmcYoOs6YL1OQmCw1BD+Eo8oPlWFxnR0emqK9G4ycTfB
 syGg==
X-Gm-Message-State: AGi0PuaIQbaZ9F2allSEAGwGqddFRLximgZqJNmQdCgBc/AZxl473y+r
 C7mlOSqEzN5ajgyuOzehcjWYvQ==
X-Received: by 2002:a63:1f57:: with SMTP id q23mr1924492pgm.324.1588349629241; 
 Fri, 01 May 2020 09:13:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id y2sm2645633pfq.16.2020.05.01.09.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 09:13:48 -0700 (PDT)
Subject: Re: [PATCH 23/36] target/arm: Convert Neon 64-bit element 3-reg-same
 insns
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-24-peter.maydell@linaro.org>
 <366a2e79-d963-bfdc-fcc6-2a63026fa1db@linaro.org>
 <CAFEAcA9kb2fpMcd-eLvdTD8dVjk=Ed9nKv2iHr_u_tpbBCa5HA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9b4cfbec-2fd3-3674-4622-1f0caccb43ed@linaro.org>
Date: Fri, 1 May 2020 09:13:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9kb2fpMcd-eLvdTD8dVjk=Ed9nKv2iHr_u_tpbBCa5HA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::443
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
X-TUID: 3gMRTqWfPQeE

On 5/1/20 8:54 AM, Peter Maydell wrote:
> On Thu, 30 Apr 2020 at 21:54, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 4/30/20 11:09 AM, Peter Maydell wrote:
>>> +
>>> +    rn = tcg_temp_new_i64();
>>> +    rm = tcg_temp_new_i64();
>>> +    rd = tcg_temp_new_i64();
>>> +
>>> +    for (pass = 0; pass < (a->q ? 2 : 1); pass++) {
>>> +        neon_load_reg64(rn, a->vn + pass);
>>> +        neon_load_reg64(rm, a->vm + pass);
>>> +        fn(rd, rm, rn);
>>> +        neon_store_reg64(rd, a->vd + pass);
>>> +    }
>>> +
>>> +    tcg_temp_free_i64(rn);
>>> +    tcg_temp_free_i64(rm);
>>> +    tcg_temp_free_i64(rd);
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +#define DO_3SAME_64(INSN, FUNC)                                         \
>>> +    static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
>>> +    {                                                                   \
>>> +        return do_3same_64(s, a, FUNC);                                 \
>>> +    }
>>
>> You can morph this into the gvec interface like so:
>>
>> #define DO_3SAME_64(INSN, FUNC) \
>>     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,
>>                                 uint32_t rn_ofs, uint32_t rm_ofs,
>>                                 uint32_t oprsz, uint32_t maxsz)
>>     {
>>         static const GVecGen3 op = { .fni8 = FUNC };
>>         tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs,
>>                        oprsz, maxsz, &op);
>>     }
>>     DO_3SAME(INSN, gen_##INSN##_3s)
>>
>> The .fni8 function tells gvec that we have a helper that processes the
>> operation in 8 byte chunks.  It will handle the pass loop for you.
> 
> This doesn't quite work, because these are shift ops and
> so the operands are passed to the helper in the order
> rd, rm, rn. Reshuffling the order of arguments to
> tcg_gen_gvec_3() fixes this, though.
> 
> I guess I should call the macro DO_3SAME_SHIFT64, I hadn't
> noticed it was shift specific because the only thing we do
> with it is shifts.

See my reply to patch 26.  I think we should swap these operands during decode.


r~

