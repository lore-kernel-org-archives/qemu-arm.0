Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp176394ejv;
        Thu, 11 Apr 2024 13:50:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUH3ovzIfdb3QAEdYgnFTD3YFelnNt3VZs0KXq8/yMScnPE/DpsuL+YcHj2g+9ZgzfoS2kd/3NU5y091IGdZArTGraneNoo
X-Google-Smtp-Source: AGHT+IGgVCnEB8DbmK63Bbwqd9cmzoA2l63EloAM4n/OZ6cElWD/jJPGmAY3ev2jrf1g3A2BLGdN
X-Received: by 2002:a05:620a:9de:b0:78d:632f:35fe with SMTP id y30-20020a05620a09de00b0078d632f35femr793622qky.47.1712868637839;
        Thu, 11 Apr 2024 13:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712868637; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7TUT/m+HzXQifNAFLv+n944yMFj+W5bk8N930E/kXWsujNO759cjvxINruzJMaYM7
         BaUPFnWB3K27FpYzKxr9PuMkl6wIBB1qZNEtt6sszyeKwo5zHj3ozV3WdC7iQZJnpGn5
         YMO94hweC6I4LKISwn8R9MJuNwlfU+DQOL4nrjj/Z8BYLA7FkMSIV3ZqZr/OIVg4hLqo
         fatS2ltIyxFKVqX3bksj5F4W9yTe7y6t0TzVFcPdXTjb2hSTPnlJpErcRuSZBIBFaocg
         QEo463olag6kQrp1+lB37bBIvHLwIk16cVjLh1Jr3+uIr3Yk4bG+p517fBOag49ZzP2v
         qi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wYl9hKGRD29tCif38dwA9tV+sTngp8c3HAIW4/e57aY=;
        fh=+J1+Lmi/D2isCdtIs/MX/evrhscZkNytjSlAvVmMUGo=;
        b=V32+Ym4TNQYJvA/2B9pxCyzX/hgqbq/mPWuh+8DfFsQZc3zD3/Y8tVOLPjiq9J+SSN
         bdUeamXWI46ZUbFbLFv0KX2m3GYjJH6Tl9C86elpVTEhQLO1jGz5Wb493PV2yxHPXmCb
         p02Kt7Hvws2grkUFFYvHId3nwwrnjD6qmBMIl15BZipupdnVTxxzgRm2g+UB8j2gJ4xI
         4wN/ChSH5aBX8QA8xbVLFnV14zYmBW7GLfk3OVwsSsnTkbWqvWdeXaqouRAvjc8ukzAa
         e3jgfc9z9DzX/N6siqxY2b5uPOMRxlg+ogAn/UcJTiWS1KeYnkW7O3j7eTCFKabKQR8C
         GBeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rC1ObVFB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16-20020a05620a137000b0078d6562dbe4si2319514qkl.97.2024.04.11.13.50.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 13:50:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rC1ObVFB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv1N9-00078S-C6; Thu, 11 Apr 2024 16:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1N6-00077Y-Ky
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 16:50:12 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1N2-0004wu-G4
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 16:50:12 -0400
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-36a205e0f16so1058885ab.1
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 13:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712868607; x=1713473407; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wYl9hKGRD29tCif38dwA9tV+sTngp8c3HAIW4/e57aY=;
 b=rC1ObVFBg2aIMf5W/Mb8RA4BVsHMs/dm1Mz1qNGkI8qHSXAwugFqpQhKmVy+t3vJnY
 nEaJ8JuTMn8QuNItHB0krLXEPPGBWD0VanR+jhym96f0uV9CXjjXEtc/exf/d/FY6/RU
 AmEVQjCo9uLbsZ/uzIRpiyIrHunDa0fgCakBsubD/Y8phYytAG6tsH9/hCNMp61sFi3C
 58QgZ5grODtcldYQghB4zJID6oqGZk0kRmlHVpg4o09AHDb2GFAkspejIKwrqJlXIR7W
 reE0lC8jpBNHtFs58lsgXlRHtC5lLeL560Vep7FjAepgjQv+4HiAk9K7R1f77cnn5vZZ
 ZmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712868607; x=1713473407;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wYl9hKGRD29tCif38dwA9tV+sTngp8c3HAIW4/e57aY=;
 b=xUZkhyTUh8rDtT9vM7FF9SubZeLdwPSL0OQXELQD8aCRlpyzwJK5yUTI9+FgyidnLO
 eskCRoKr2HO8jxWWUsHQVUEQqDNMmj8izWKW8L//9CuLVSgUJsQ5A5uchF0UOsVTceQf
 zAtazyuW9eL+XI5Bu/mOw1c0029BAsbABiYjXlyWzCsNoaYlCxVHgZr8F2FVQn09qceD
 XDnbdrSifA6MYwvNSxgIRf8O2kE20l9Ni6F7lzwG9t8TJT7ui7otcmIdyfHdK3+3Jp8j
 n1Ph5dEmFbdtolDSxJ3898pJFyVkUgUARTTCDFgthSfnb7jWNFNmWGXWoM7xrC5MV80k
 I/kg==
X-Gm-Message-State: AOJu0YxRKMbpZ/m5cRQr8YjJhkUd2bUgcgTgTtZdf0uPH9um209gL8zZ
 AvhquNaIJSmzI0ClHwj+1+ICB1M/nTDbkrB2WEqAN/GRgtx/mecjoGKy1rH5j5A=
X-Received: by 2002:a05:6e02:174a:b0:369:b97e:7e52 with SMTP id
 y10-20020a056e02174a00b00369b97e7e52mr870114ill.21.1712868606751; 
 Thu, 11 Apr 2024 13:50:06 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a634e63000000b005f072084432sm1493255pgl.38.2024.04.11.13.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 13:50:06 -0700 (PDT)
Message-ID: <0e0d59c5-d628-414e-9f16-2d5b75f68ec9@linaro.org>
Date: Thu, 11 Apr 2024 13:50:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] util/hexdump: Replace sprintf() by
 g_string_append_printf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org
References: <20240411101550.99392-1-philmd@linaro.org>
 <20240411101550.99392-10-philmd@linaro.org>
 <19938e9b-ddd0-4dfe-a75f-f4ad0f281a85@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <19938e9b-ddd0-4dfe-a75f-f4ad0f281a85@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ie97EZ+I5zdS

On 4/11/24 13:43, Philippe Mathieu-Daudé wrote:
> On 11/4/24 12:15, Philippe Mathieu-Daudé wrote:
>> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
>> resulting in painful developper experience.
>>
>> Replace sprintf() by GString API in order to avoid:
>>
>>    [426/1310] Compiling C object libqemuutil.a.p/util_hexdump.c.o
>>    util/hexdump.c:35:21: warning: 'sprintf' is deprecated:
>>      This function is provided for compatibility reasons only.
>>      Due to security concerns inherent in the design of sprintf(3),
>>      it is highly recommended that you use snprintf(3) instead.
>>      [-Wdeprecated-declarations]
>>              line += sprintf(line, " %02x", (unsigned char)buf[b + i]);
>>                      ^
>>    util/hexdump.c:37:21: warning: 'sprintf' is deprecated:
>>              line += sprintf(line, "   ");
>>                      ^
>>    2 warnings generated.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   util/hexdump.c | 17 ++++++++---------
>>   1 file changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/util/hexdump.c b/util/hexdump.c
>> index b6f70e93bb..2ec1171de3 100644
>> --- a/util/hexdump.c
>> +++ b/util/hexdump.c
>> @@ -19,7 +19,7 @@
>>   char *qemu_hexdump_line(const void *bufptr, unsigned offset,
>>                           unsigned int len, bool ascii)
>>   {
>> -    char linebuf[QEMU_HEXDUMP_LINE_BYTES], *line = linebuf;
>> +    g_autoptr(GString) gs = g_string_sized_new(QEMU_HEXDUMP_LINE_BYTES);
>>       const char *buf = bufptr;
>>       int i, c;
>> @@ -27,30 +27,29 @@ char *qemu_hexdump_line(const void *bufptr, unsigned offset,
>>           len = QEMU_HEXDUMP_LINE_BYTES;
>>       }
>> -    line += snprintf(line, 6, "%04x:", offset);
>> +    g_string_append_printf(gs, "%04x:", offset);
>>       for (i = 0; i < QEMU_HEXDUMP_LINE_BYTES; i++) {
>>           if ((i % 4) == 0) {
>> -            *line++ = ' ';
>> +            g_string_append_c(gs, ' ');
>>           }
>>           if (i < len) {
>> -            line += sprintf(line, " %02x", (unsigned char)buf[offset + i]);
>> +            g_string_append_printf(gs, " %02x", (unsigned char)buf[offset + i]);
> 
> I find using g_string_append_printf() simpler than checking snprintf()
> return value, and don't expect this function to be in hot path, but if
> preferred I can try to not use the GString API.

GString api is pretty good.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
