Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp102951ejk;
        Tue, 28 May 2024 10:32:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUY5WhPR0Namabag0zmy6GgGWzOReAqDRHYxD/QyUMrKXHdiqAI6zZlBEO3LMmrn3mw5IxFRIEGGvEhSvua1h1bUhutK5qH
X-Google-Smtp-Source: AGHT+IGadQOart7o9I5Vj4L8O7Xfy7vH4CrbZJoB+A5qvgz+5pajxlqXiCcTNNW8gps/d29zfVk7
X-Received: by 2002:a05:622a:287:b0:43e:3c:5623 with SMTP id d75a77b69052e-43fa7455d80mr257402191cf.10.1716917520562;
        Tue, 28 May 2024 10:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716917520; cv=none;
        d=google.com; s=arc-20160816;
        b=bySuCnPiQtQsHmuHBLRcXk20VERQpRE2v3/Bojnn1kXvZE+X6wU4/MPXUtaz8CscgR
         2MMFyxZQyzMoozTBuMmxM3sWtrPiUE948CiyUlZhn0L9O13fgX4T2eoKiFm42gcZr/lJ
         NPZDJB6LutkcaSdcEbyK334lg1WW4PUXy2TvY7eBDhBx0NTPJPpnmp0Nc6ut2tj3CFta
         BFdKfS08ZCUJtR1Wg3MGNsggxG0lqeKajHb0DiACULYSiELeUGbLUcg/qDfjG1z/QWdH
         2fXzVsXKQQ0SFl/2bX7gMWzhpcB2aI14wz/a9TtPhB/1WsrFjOeOW7LLS1hSlz+1UcUW
         NjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9Sp4Uj6nZT4QoOVoftjDPfPlgroRzXW2lSa8BSiQ4+k=;
        fh=GcCMTunxgrTR+6GCUmL7/FsFFUE7NY5JjX2UsLGXvBw=;
        b=NyJ7ZR/0Xrf+YKNyhxrRJmTtN/3eREuOpycw8USjNsADj7q32HRLRqSr4ZSC5+NvJ9
         iagueMbbJkcceIi/s6S//XMc6KEg+DQuH0cmozhVYmDhwOyZl0lVoiDWS+n4I12Y1Kp1
         sk9DlocTIMM6gzEpGQPYGqQ8wXg5alhtS404GuVe3FvMu1pc5ywdupxcoChey9jvPK5G
         DsIbS7ANUzJXL6AMgPSQEW0xGCL+dl3goXB+6aFqW+oLJkjWcdWBT6GDgvXNZfIyS/c9
         pixY5p4xYEm85x/iMjfWrYxzkZ9WEGscNlJbHAHgkFTCffbDpyo0/yD6mPTlrrRo8IHF
         C2Mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTXlXDfd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18b1b86si119867241cf.393.2024.05.28.10.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 10:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTXlXDfd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC0ft-0005vy-NR; Tue, 28 May 2024 13:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC0fr-0005tu-1c
 for qemu-arm@nongnu.org; Tue, 28 May 2024 13:31:47 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC0fe-0003Zz-1O
 for qemu-arm@nongnu.org; Tue, 28 May 2024 13:31:46 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1f4a5344ec7so218655ad.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716917491; x=1717522291; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Sp4Uj6nZT4QoOVoftjDPfPlgroRzXW2lSa8BSiQ4+k=;
 b=CTXlXDfdwjq/PZiy9RweN5qi8QEhb5j9pd5f3EQZBl2O5fIfQWxWLEqV3u4fyWnLuj
 4jX0SCgNEAjxpSnVoDga2+RvB45hpOuZKbKVsEHuHgDQvfh8Q/TLYjNzBdEPl3BlCMAs
 e3Bp8gnYU2jmiTGFbEfvQJoiiHrkC8r1p6Upg5iuwCZOezE0mAbZA5MWpO2/fa4gLLia
 mKmSo422O8Oii/aYw8tVpzDIda2XILQ4yE0820XssWpCyLToX0Pe4+BdaNYdC5CBG0ae
 r7oKIy2SX1YA62nONisCl62VXuOhaGuA9oHbeBtl71sMO+rr4VljBfCOsQWyCoSouJH7
 jb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716917491; x=1717522291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Sp4Uj6nZT4QoOVoftjDPfPlgroRzXW2lSa8BSiQ4+k=;
 b=BbGkK9nC+UYpm+WJwhxfd6L4eGWhufEIaXpoN+AAYg3F5jXyHFEMdeVLnL7lsih35W
 UozFKp3RJZqG033ci2pJo1XP/5LdW13LoIUVg/8NbT35Az0CpdmSwtfN+4hrLud3fDxj
 MQJX9h0IuS4nbpSMWdatmtOLSH+780ON/86bpRXmBp3qKdu/cLJpCFynsgaVLemD2aTp
 lj6u6PGy2Zbco51OqMAwJane6WD6OtsCKta6m7OctpK99rajdTAC7nBq1JWutByR7myS
 8VuYfn4UrIwVJEOu7REb29J01wnPwg1ZbX2rYDUzywS3jI4tF0wHO4nY16eT3kV6/78+
 Bp6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyr7X2YYLwU3swfLMbxI+KwMD3AkbAcWzTUDLufwMtI2Uak7G0eyJs2ulsg20fpsOjHY9vaBO0R6BkmfgjOgMXFniQ
X-Gm-Message-State: AOJu0YxXDR4pEiJJ1z5gRS6MZAv+t4ue4y0g7qPVUzYfvouNFMCLdZSX
 89rxYwAZMto5JUA7lT8TiibI+OUXO6oXGQIF9jLg6cDbGHdu0XBzcrauSeHYkck=
X-Received: by 2002:a17:902:d2ce:b0:1f4:a552:7e83 with SMTP id
 d9443c01a7336-1f4a5528076mr70519945ad.31.1716917491485; 
 Tue, 28 May 2024 10:31:31 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f4b412a5fesm32292355ad.239.2024.05.28.10.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 10:31:31 -0700 (PDT)
Message-ID: <b81a2145-99c0-416f-93fb-ff737d487198@linaro.org>
Date: Tue, 28 May 2024 10:31:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 66/67] target/arm: Convert FMADD, FMSUB, FNMADD, FNMSUB
 to decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-67-richard.henderson@linaro.org>
 <CAFEAcA8tSj=5QNBKb72iZ0fmYRBGf7QjpK-0YtpbF5sdBMffxQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8tSj=5QNBKb72iZ0fmYRBGf7QjpK-0YtpbF5sdBMffxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vzWqpszXxoTx

On 5/28/24 09:15, Peter Maydell wrote:
> On Sat, 25 May 2024 at 00:27, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> These are the only instructions in the 3 source scalar class.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/a64.decode      |  10 ++
>>   target/arm/tcg/translate-a64.c | 233 ++++++++++++---------------------
>>   2 files changed, 93 insertions(+), 150 deletions(-)
>>
> 
>>   static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
>>   {
>> -    if (extract32(insn, 24, 1)) {
>> -        /* Floating point data-processing (3 source) */
>> -        disas_fp_3src(s, insn);
>> -    } else if (extract32(insn, 21, 1) == 0) {
>> +    if (extract32(insn, 21, 1) == 0) {
>>           /* Floating point to fixed point conversions */
>>           disas_fp_fixed_conv(s, insn);
>>       } else {
> 
> Doesn't this result in the unallocated-encodings in the
> fp-3src class now falling into the "else" clause and
> being mis-decoded as the wrong thing? I think this
> needs to be
> 
>      if (extract32(insn, 24, 1)) {
>          unallocated_encoding();
>      } else if (extract32(insn, 21, 1) == 0) {
>      [etc]

Agreed.


r~

