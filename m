Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4235342njb;
        Wed, 11 Dec 2024 09:34:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW6wz3SC40ZNFh0G1LFtry2G5iGR1iI+WZU0do9wSD0uq18ndZtN5Unjq9Laj5gdfxl7SMmpl/+EN0wEw==@linaro.org
X-Google-Smtp-Source: AGHT+IEeBqEjLRxYuZklahEBBmU9g1l/1U0Z7oe/BzknjkDRFpxsbcmv+t4K331EzW7hTfJDHm+b
X-Received: by 2002:a05:620a:4889:b0:7b6:dc4f:887c with SMTP id af79cd13be357-7b6f25a330fmr15781985a.57.1733938477715;
        Wed, 11 Dec 2024 09:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733938477; cv=none;
        d=google.com; s=arc-20240605;
        b=C09kHaJQ5K+wDc1ji6yAIUvuQ1/8oIVCfESh5tqaYgP6Y/IjmvL3jnMuAcoOgHJ3OM
         7j5VCMa6S8Fpo/kqDVNxM+b2rcl4pA1dG+YP+N+J6KzPaRyqMsMw3CN6KhMtkzD+e1D4
         fcbQPRgoMPad3wSBYWbBbSUkMSUsNaQU0IKcpxhnWNIpVx64CGVskYIr69CPLKLFjVqx
         QFT5Ky1j/DQLMVqbYgiPVKLXp7Nk7ofka3kqTm7Y1diI3MellVVZ28FM5hUb53Jb3bx3
         pwxnAkhFz65TNfnwoOWnkDO+oUXIcmi5RyzmUA05K311B5pUG4/sHjLSboC6waaHRV69
         esQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LnLTVgw145mbt5EGwmR5QWovOiZGC3LgHjn40Qa46rQ=;
        fh=jEV+vcfQCOHNzEfwXxprxUPv5E+FMzV3hs99FQ5z/Iw=;
        b=GVif9SuMcDCQSYiQ4xzKOmKeerdDQMLnOC4KPQcxewIazFQ5hhbSg/9hlaj2lRCmuw
         SZPGryfkQ6QEi49M6366YCGBM3Z1kQY5HJXD8qt8UV+C9Z4yhLM0vt+PkdbTA6qT3GV0
         VDC6Yz0gfMcIfQXlYXJRDGWyf4DpwB4atmxqGGaZY0++/j3ZXrwCJ/I/nSWnJeVkeFP7
         VEsQl5TcvAPXsxELi0YyN9L7xVPR+LkxEzmat5yurNzy3q3wkCLIMwQ5+O2lIlKzK0o9
         XNNTpP3ulXOc3SSqzQF5GDBFHOWOAk1KpwBCxX3Cjsfbrq5xpwcULd3VuoQ6RM9HqjDy
         CdKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lUGlimZP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6d54d40d0si925160485a.577.2024.12.11.09.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 09:34:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lUGlimZP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLQZ9-0006qs-SK; Wed, 11 Dec 2024 12:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLQYy-0006DX-FD
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 12:31:52 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLQYb-0001jG-NG
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 12:31:32 -0500
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3eb40876bbfso1043799b6e.0
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 09:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733938287; x=1734543087; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LnLTVgw145mbt5EGwmR5QWovOiZGC3LgHjn40Qa46rQ=;
 b=lUGlimZPG5sf/Ja9kRvbiFbuL77KaWZZBjgSHM53LTMeUHlnZEp711IDEhCVr0gBab
 n929pYlI7bL4SAIEF0Qv41pQ0+RJnMqcszTMkElOcqQjRvM2mv0VjN5J+FkAB+4+riT6
 T71xSWe55ZjkMLVpdZgSrFjNpxhTipffLrc+NRiXvjzsoCDhtjGAe4LdkU/NGwJfWZHS
 acPkEKJiECLOEEkLktPZHxUS6CPD7B6piqDptUjblxQx6EINwpSI/oQziZrnk0RsaiYk
 DZVAgLBXH6I/E4m88aTAmbCSim7AUQ8wPqEdO+iLufFjzQjN3Uy0E6POaQpa018BvN4D
 7VuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733938287; x=1734543087;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LnLTVgw145mbt5EGwmR5QWovOiZGC3LgHjn40Qa46rQ=;
 b=XJhm9K8+gAVnB+BXk6lfBZPJjDKhvvYByhGgLgFSQHQ+q9x73axgknjnCvp+3ElvlR
 sPlbgtOZvICeM6hCUnkiHU1Y3cxPcBfECPq3wTM4o+A18Meb0XGXRv21XTkX1aLZrwuP
 YlnRjEOE6qdwDAQRgPmJW8UvYUPaS7YydmGPWMDn1wDfnkZFY+Oh6p++az8qOgiokI9X
 FFpNGbkNb2o3jKYhpJrzBhzoJi62IAoUOJRVURt+77RvAjpnopGUG6fuzNnu+Vu+IKcZ
 fri1lebn4dpC/UpqfubyD9ZhcH7mhJ5USwbFy7ipC0eXYmVgxL+rB0anrq4vs5ZGukF9
 1/Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsJ7475ba+4U5ksChdWCcFcaYIS8m3CPGNh85EtDX4MBEvB7J7nwpllYDsmTeq1C+CxtJ/k7ciVGs4@nongnu.org
X-Gm-Message-State: AOJu0Yw9hzxYgYVObe/dBqiE3zbMB3ejgAxOdRWPZowoAw3zdm1gkKot
 FBlTi2k93qxKZQzeDPBZsZaDct9azJBUWpFeU+/awyN/cxiS+jZTVapxMcqW+LQ=
X-Gm-Gg: ASbGncsmxe9mNAwOEfHeeVL3Y7vuEMnvm6Sf2kH56MxYHcCoajkW8YRKe9snKhcORvi
 KSZt8xdTX1Mt1BtACLcB/bI7irzB6XQIhr+5qK7ejVSdpcGlzMOd+4q9RBibRoG+tGp3LPPmQd6
 JgXgNRsfeH2RxCG+E3T9zFA2HzKVMD+RM4jQjJc0I/inhwLZYjl7xcRc874lMJdeA/2nbREbarv
 6Ni9RSaSd9xLBzNnv+IaXhA/D20hG7xAc53fdGB6OdyUqudW/M7lZdyRRfzjftFT8v+zr4=
X-Received: by 2002:a05:6808:3c4f:b0:3ea:6415:c44 with SMTP id
 5614622812f47-3eb85aef8b1mr2925815b6e.8.1733938286953; 
 Wed, 11 Dec 2024 09:31:26 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3eb63def321sm1211436b6e.53.2024.12.11.09.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 09:31:26 -0800 (PST)
Message-ID: <0ec58c58-2814-4b1f-8725-d8c57bb4b54b@linaro.org>
Date: Wed, 11 Dec 2024 11:31:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 42/69] target/arm: Introduce gen_gvec_rev{16,32,64}
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
 <20241211163036.2297116-43-richard.henderson@linaro.org>
 <934e7598-8927-4d35-9784-6d33d7892952@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <934e7598-8927-4d35-9784-6d33d7892952@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tKCSihuJ8bUK

On 12/11/24 11:19, Philippe Mathieu-Daudé wrote:
> On 11/12/24 17:30, Richard Henderson wrote:
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/translate.h      |  6 +++
>>   target/arm/tcg/gengvec.c        | 58 ++++++++++++++++++++++
>>   target/arm/tcg/translate-neon.c | 88 +++++++--------------------------
>>   3 files changed, 81 insertions(+), 71 deletions(-)
>>
>> diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
>> index cb8e1b2586..342ebedafc 100644
>> --- a/target/arm/tcg/translate.h
>> +++ b/target/arm/tcg/translate.h
>> @@ -586,6 +586,12 @@ void gen_gvec_cnt(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>>                     uint32_t opr_sz, uint32_t max_sz);
>>   void gen_gvec_rbit(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>>                      uint32_t opr_sz, uint32_t max_sz);
>> +void gen_gvec_rev16(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>> +                    uint32_t opr_sz, uint32_t max_sz);
>> +void gen_gvec_rev32(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>> +                    uint32_t opr_sz, uint32_t max_sz);
>> +void gen_gvec_rev64(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>> +                    uint32_t opr_sz, uint32_t max_sz);
> 
> Remembering https://lore.kernel.org/qemu-devel/20230822124042.54739-1-philmd@linaro.org/, 
> these gvec helpers might be useful for other targets.

These may be factored incorrectly for other usage.  Here, for rev<N>, N is the size of the 
container, and vece specifies the size of the element within each container.  It's reverse 
of the usual meaning of vece, but it maps well to the Arm instruction encoding.

The only other bswap I can recall with vector operands is s390x VLBR/VSTBR, and similar 
for Power VSX, which performs the reversal at the same time as a load/store.  So in this 
case the heavy lifting of the bswap gets pushed off to MO_BSWAP.


r~
