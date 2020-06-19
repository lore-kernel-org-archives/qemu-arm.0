Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp890650lfm;
        Fri, 19 Jun 2020 12:40:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJEvMYhgzTZchDWLEPYXNZoU19fkant/WRhxRkLLzLDe5mJfBWin+bEWiW8jwnKt7SzGCd
X-Received: by 2002:a25:a2c2:: with SMTP id c2mr8014070ybn.333.1592595630804;
        Fri, 19 Jun 2020 12:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592595630; cv=none;
        d=google.com; s=arc-20160816;
        b=JZuvcpyHOhJUS3LW/XXN2YpJ2QzIzGQfr6qn9OI//u6esHn0gzfpETISustI9+p79a
         xkTaZ5/OrrQOsJO2D82jmkh6wtwg2pkH7Bum9fYRy3DEVr1rg5Ilf8myanLkuWuBRPXW
         L7FY7lUcbZrRZgVi+f0/EmhIOHDgpUhI3qSVDa89TE80SR+vixy2eCGrHtS76l1eRP3t
         75y1PclPM/sSoinm9v+icNE4t3Gg6ekn2a1pX8M47/1rviPKrZ8kPsUSj0oFOlpCdtru
         jKv9OYXEhUspLR3EptI8S/0vaey5K+/3m1CtOigeVKBv2J3zZVH1ckyvgWfR+Y6K6V40
         6Emg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AwaDilnOJfQ9zPJlgT5+oqiT0zhl4P+ZEZjGiVPxoUQ=;
        b=ZrPbQICv7bliObUwa8CtLuzqWsXqwBuoiMsq20YM0ZAt+aCNJ/FotrFCTjg+fBZVFI
         zF58xW5VLxY60FW0sUU4ucpU7NBTlmFAtnSN787u28siCLwHo41Zh/Rntqq/f5J1Vodp
         4eaXkF5zRt5+I9heWXZJuqDv8hJFbEM6dL3ZEW6IOIm7SbHa3+idj78bWzgcnySx4jcD
         dhCYO1g7zAAl7JR34EXjNQlTEq9J/736YvoTWGpYa3/9EKohe/m8ryM7khMnojfKdsDZ
         wmQsJaaPHmlnzf7+bBx/gG2UfII2xUnLTB7jlq/pHKTOAmUJPBHycC99Lz4muzp2TuFt
         +u4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G0JBfI0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f76si6544330ybg.468.2020.06.19.12.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 12:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G0JBfI0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmMsI-0002Eo-5N
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 15:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmMsB-0002DD-Fr
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 15:40:23 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:40149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmMs9-00058K-TN
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 15:40:23 -0400
Received: by mail-pj1-x1043.google.com with SMTP id s88so4691267pjb.5
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AwaDilnOJfQ9zPJlgT5+oqiT0zhl4P+ZEZjGiVPxoUQ=;
 b=G0JBfI0U1KFDlR/ppoQl7700gBSeGeX0SVp/RIO6Ag+GqfFkwlkach5cnhL9EcNI67
 zFIGdikbCJT5sMZZq6b+hAHJKWUpHLlYsPN/WllrOTZe5hulTwPoH3B9/+DLjuwXFB5G
 afWcOw0d/0VtsnqGT6rQl3JJjSZjZfyPtjtpFrYsVfJgtlGAB4E116ACOTzOwOtHhuWq
 ib5vAginYI1zNMfciq3Y4ii+vdjvj3E6lJ5lRg19nPAQ1Cvb+7uy/XPLIlkjhc8CPg1U
 iNb3fI7odGQhy18LxAJqJDYT2+Hb1z4kc/kffhnIGDJ/zeEWF+ZGCqtMIkMihXBxHlvS
 A8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AwaDilnOJfQ9zPJlgT5+oqiT0zhl4P+ZEZjGiVPxoUQ=;
 b=rZU6r1+oeW5iVhd/tLu5X8ZnpRxsVXSlMm9xlk2U93d/njUHYWSlow+R1kPpiKpJ82
 8fZCcy2iB+vrVyZbykZ+K+pnk9Hcz5ANSG9bJl2LEGQ8tX+kwfciSuV+IPQLIoMUF/wT
 iE0sexXkgQckHfqbYNcP0PH2ro9zCdyd7I3nHNRm914HDCx7hF727IzkJx4kskq/dYlU
 w/LyXmU8KzgWOpjQbrS8hohjuv8ee77qIwqPyiZZxcE9apZMA03a9wVsZI51luqWqBF7
 qID1u8Q5Ta8rtv15mfT/XEY9Tw5xY29cWQbegUAaPE2Cz4/J8ErZ4ZuVPDOwlVrSD17Z
 e33A==
X-Gm-Message-State: AOAM532H/CLK30oJfajNw6adfrUh6wi1TZHTmAQhPqNMDccqm9MNCA3O
 QJm6cMFNvz6ycGR2W4KVBgtpjw==
X-Received: by 2002:a17:902:c40c:: with SMTP id
 k12mr9202501plk.11.1592595620349; 
 Fri, 19 Jun 2020 12:40:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id a17sm5763284pjh.31.2020.06.19.12.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 12:40:19 -0700 (PDT)
Subject: Re: [PATCH v7 30/42] target/arm: Use mte_check1 for sve LD1R
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-31-richard.henderson@linaro.org>
 <CAFEAcA8SgB6j3F6-HEZot_u13WAgu__W77vJq6FakGMGWzGLEw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e079b2e-15aa-cfed-4ab2-e0a1ec91b068@linaro.org>
Date: Fri, 19 Jun 2020 12:40:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8SgB6j3F6-HEZot_u13WAgu__W77vJq6FakGMGWzGLEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2mslHl/TTsgS

On 6/19/20 7:03 AM, Peter Maydell wrote:
>>  static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
>>  {
>> -    if (!sve_access_check(s)) {
>> -        return true;
>> -    }
>> -
>>      unsigned vsz = vec_full_reg_size(s);
>>      unsigned psz = pred_full_reg_size(s);
>>      unsigned esz = dtype_esz[a->dtype];
>>      unsigned msz = dtype_msz(a->dtype);
>>      TCGLabel *over = gen_new_label();
>> -    TCGv_i64 temp;
>> +    TCGv_i64 temp, clean_addr;
>> +
>> +    if (!sve_access_check(s)) {
>> +        return true;
>> +    }
> 
> This cleanup should really be its own patch.
> 
> We should probably not call gen_new_label() until after
> the sve_access_check() ?


Done.


r~
