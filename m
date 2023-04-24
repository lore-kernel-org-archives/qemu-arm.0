Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2563246ejm;
        Sun, 23 Apr 2023 21:36:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZkgXflveHy1n8KAVkYuz5BmrSutyRhxXhI7/ZhjwR45DctZetsklo4PgG6iG6sDpFZTTAN
X-Received: by 2002:a05:6214:2b0e:b0:5f1:89ba:c0b4 with SMTP id jx14-20020a0562142b0e00b005f189bac0b4mr23599614qvb.48.1682310991012;
        Sun, 23 Apr 2023 21:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682310990; cv=none;
        d=google.com; s=arc-20160816;
        b=dtXVG31mFgWvTGYEHV8S2H+Ap+peeyPiAJNRE273kikcZnvW55xDpCUqYjkkcqEgDz
         RWWx1OczD3CWIWRTRrC4O7JhioYTO+hQBkDrSyZG+dkOU7+uAElu22KvFn/D/r19aS+w
         PHfnkBMoLMlbRYqEb8b91qHLixaFH/Czj3HUWYtOwRpJEESu3zJ+hHlrE4qIiR6MMjOR
         uLgUeVWTnhewqzHDqJaTgvIxZnlOgFF6BiVHrxAOXLUoSNSH3k3Xx6yMqNWsFl4s6Aie
         DQbxF6ky31oVQR0kWCh31M6rv63/CiA+NJ/2l60QkRXOIlLxdFd0SO504kgZrpWbF/ON
         1M8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rGRC4M/xg5RvySFn6AUCpzfS3I3dPVkQtLaqMaINYlg=;
        b=gtPYcfBx28pcU0Uajm3SPEeR9XNOhr9cLD+9j40pFvkZ3yEGKrr3au6Rnwm4Jk+Ei7
         ec0hDu3It1BB5od64eWPsuATg9gVDL6zliZ2Ojy+2w4MpJeqeguh5gad7P0cxcCSMcKr
         PHn8VgCSqtEqf1moiWhBuaTUg29On9T1sDp4vk//kz0KJCIM3QGxfZEO+SlNuQVQN3lK
         I++fE0QqDLdj1T8eeKQwAuxV6RIX41iDr8gN8R5tutAh/cgoE74CPOMHbkQmwxnogQbY
         WIQuhT2+2lv04+TS44utpwft983HTH31DlBvzaiRFZjYohIvNWooE7rwC4o1SFFvjd4U
         vmug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BzdrVA1b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj28-20020a056214529c00b0056e97253b23si6559701qvb.28.2023.04.23.21.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 21:36:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BzdrVA1b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqnw1-0004UP-Nv; Mon, 24 Apr 2023 00:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqnvz-0004To-AU
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 00:36:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqnvx-0001Hh-EQ
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 00:36:15 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f58125b957so3556800f8f.3
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 21:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682310971; x=1684902971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rGRC4M/xg5RvySFn6AUCpzfS3I3dPVkQtLaqMaINYlg=;
 b=BzdrVA1b+yH7PDYRSew4u+SsxQdBVhn5a4orw/I7kkMuT6lH1MVFX0tQ2Pixfm5C53
 0CJC5y4Dsn8iYm6jmjhVLhawdrKgZSWeacul7biEURBD2oYcZWkJzulxxl2IfDVgmW/g
 wvjcYSrufXTGYA0E19fYn5eeG9Z0UV1YCqFjd20VJKFW68TKKDGNK99KgYH/eduJ4pMj
 DR004DlVovSOxiM/r+h0p5ytWQ20WNZqs0Qi7Qm2lbrSYRXEynbPkxnd6rCDVtnxxYxx
 foHB+/0eBrAiD0VZbp06IhfveT5EgLsde51Ij3Ffpg7uiBo6Jog6AIyzqJGyYmSSpyuw
 mjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682310971; x=1684902971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rGRC4M/xg5RvySFn6AUCpzfS3I3dPVkQtLaqMaINYlg=;
 b=d8SAZ1/ZcZx0EM4B6grN4f2MyoRdB+ILgLFFt2OssBdtfRO7zF4VMUxqbmZ2u5xACZ
 qUuAWUvYB9ps7ZjGA5r7UB0Q7UgU/WYbjnI4+obAxiGjevOM+xtWOZVQhJwEJ4YRUm+R
 i+X9G2I2QifbNBYcek/lifN/8okN8fMof8+S0PJWGKrOjKdY8ycR0cI1i8i/8na+6z9k
 O2XW8OCgvUF8nuvm2q2t3YqVswNG12Y8dlQSEsBh+khnTqtbjQLwlvO1ZIwI7sWZzSOs
 XL54cTLa9zFnfGyHCx5bKO7k+lMKBqI9A6iL6aSyA5tA4LOhZoat/UkiT6jSAXWArZDF
 RHPQ==
X-Gm-Message-State: AAQBX9feKtjSUh6UDf5cYYwyKWsQZt/w0eLjnU2OLfElZ9f5m+T7Nb7f
 4AmAJqUeo1dbTZDB2kO3QzOXNg==
X-Received: by 2002:adf:e948:0:b0:303:a2e4:e65b with SMTP id
 m8-20020adfe948000000b00303a2e4e65bmr6086539wrn.66.1682310970908; 
 Sun, 23 Apr 2023 21:36:10 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b003ed2c0a0f37sm11088995wmj.35.2023.04.23.21.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 21:36:10 -0700 (PDT)
Message-ID: <e522acac-cef1-e4ef-2cf4-7c99deeae1b7@linaro.org>
Date: Mon, 24 Apr 2023 05:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 33/54] tcg: Introduce arg_slot_stk_ofs
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-34-richard.henderson@linaro.org>
 <6f54a97a-306d-f375-1fc2-8faaf848ecd0@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6f54a97a-306d-f375-1fc2-8faaf848ecd0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fr/YFoewRH7D

On 4/23/23 19:55, Philippe Mathieu-Daudé wrote:
> On 11/4/23 03:04, Richard Henderson wrote:
>> Unify all computation of argument stack offset in one function.
>> This requires that we adjust ref_slot to be in the same units,
>> by adding max_reg_slots during init_call_layout.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tcg.c | 29 +++++++++++++++++------------
>>   1 file changed, 17 insertions(+), 12 deletions(-)
> 
> 
>> +static inline int arg_slot_stk_ofs(unsigned arg_slot)
>> +{
>> +    unsigned max = TCG_STATIC_CALL_ARGS_SIZE / sizeof(tcg_target_long);
> 
> static const?

No, compile-time constant folding and propagation.


r~
