Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3608514lft;
        Mon, 4 Jul 2022 19:05:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tA9H0cyLLUwAu2B/t24Sy3znYt+LAmZOqsMSG/OEc1f+oVs40fp65T9hfTVbiRkgPdUaoa
X-Received: by 2002:a25:d45:0:b0:66e:1ba5:b18 with SMTP id 66-20020a250d45000000b0066e1ba50b18mr16800192ybn.361.1656986758106;
        Mon, 04 Jul 2022 19:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656986758; cv=none;
        d=google.com; s=arc-20160816;
        b=kFef6+fnpvdZuKW8FMjyf5oH75U0zQq+TfjMhXF+posapfOPamPO9uRkY2ZNKJelpv
         cDkw1rDTUAP+86cv6jaUzagr87E1Ij/i26LFl6RNpUb98aZS/xozzcbfUQ6E+/Tvfd5O
         CNB2jQmifOIsyKJZmd+/Zl7pgk/1CUWFKIEdXWn6poaPicN2YyWWyvj0iq59O27YTypc
         0xA9A9G/1Sj16ZCRzuJMBuzOD6cbxhJhZSJ7UolP7kTGmgMb6HHVmP24x6RvQyAEYM6X
         qicDFNCcaD1hzNtquQ9blL1nlA/qro4irLrsAbjaMbK4VnlYcn0+zk7NTvkKWm1gA9T4
         DdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9gy1SFK4I8KTWAMbnyWixMrtdQtZx6KNpugELpsj4EU=;
        b=z4CKmA5k5TqYpgq+dSG8poORi002Bh0feH7uiI5/rd3xBmWm7z9JAGJsH1a5X/S1Hm
         yKysIni6/C4/Xpxfse+gKk+TOj9lTorc9jtH6uSG8hoq90z5Cv0X0kgfHxEu94lqYN3M
         ey1lhETJss5K9hEW49Cyb+2ILobf8Ca707/+WUOzZPPc8BWtbt3McJujO2Rl3mrlBN9B
         I3BDJUOwH+xAKEZxT1diB+G+/C9qZH05qd4OTJKPp3yalmYiHLW/VgqYZwXt6pYSRrpD
         eiZ8SkWhwlcHEpeXv8k8Ih4U3vcHD9sGAHHgyaUwq9iziKY7tUqHPijRxNQy01H82PyN
         C0bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o76694ck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j73-20020a25234c000000b0066e4ea2a60csi5264138ybj.261.2022.07.04.19.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 19:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o76694ck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Xwr-00087g-Fd
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 22:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8XwZ-00087Q-Ha
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 22:05:39 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8XwX-0000SU-Lb
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 22:05:39 -0400
Received: by mail-pg1-x535.google.com with SMTP id 145so10160336pga.12
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 19:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9gy1SFK4I8KTWAMbnyWixMrtdQtZx6KNpugELpsj4EU=;
 b=o76694ckWzWqJEgNnSc+uiYX3/Y3Awc99jijwQNQSxZNbS0acMn3R6l71p3i3xiCUt
 Kf3tgY3RaF4FWCWm969DJbwdGgCSdz1TvjTFNKu8Lril7exs2zOZ7VWqPF+m1dE6DXYu
 /FMHlEznIDrhjgjv8pZG/YZHjtlWJPTn2JybPxVxUDZvUATak0z2N+aCoQt/GXYCKR6G
 UyKwwBmzrMxebqgHdwfm8lDPRSsKOKlNUboFV/ytvlK2/Q1JP6QTICbc6rez1j/V9cYG
 ZxMVU/Lc9uFH1P/anHscZZA6IRibUt2I7VgI1FwXx6ij5wd28f/kwzDKMULLdiPGsky4
 /9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9gy1SFK4I8KTWAMbnyWixMrtdQtZx6KNpugELpsj4EU=;
 b=Bc++BnzQPi2XGJcDfIgLRwKWY5LnxW0nNGaOkSEEBtL9N0zlfsw1scfVcW9W4Oi7c/
 46UHTJNmM9bqZdx6KmpmOIvnu9xFNzDLJzYYDM+7c07JcY2B3MbOeRo0Ckl7rs8PpUX9
 CaryGNoKki0dc0ff3p4bSCSiw3j1ulvFEINVbiYONCMrd82MEpzNSiSE74HgLujSZgZD
 h1V9AkTZ5niOtu6oMKCEHsvbbMDXaQ7kiaTRc7KbfrbzF/nUFrrC4EUeJeMeUUZSH9LB
 SIQYaMMpDtWGZiOCQGhC69GemwlVe4uHbzH1Mk4dlH5aZgKVuOHyZDK0ug3CviIRhZsd
 BoBg==
X-Gm-Message-State: AJIora8IJQZ+0ZV6MewG/b+3Y+ipHPq4XF3CbrSZK/UI3hmyABrWZN7W
 aoeukdLT534rbMWGHeibhMdaSA==
X-Received: by 2002:a63:70c:0:b0:412:6e3a:f687 with SMTP id
 12-20020a63070c000000b004126e3af687mr1735034pgh.203.1656986733513; 
 Mon, 04 Jul 2022 19:05:33 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170903228b00b0016bebb0cb96sm1662378plh.266.2022.07.04.19.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 19:05:33 -0700 (PDT)
Message-ID: <d3682c9f-3fab-f13a-18be-f76d8cdd0ca9@linaro.org>
Date: Tue, 5 Jul 2022 07:35:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 23/45] target/arm: Implement SME ADDHA, ADDVA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-24-richard.henderson@linaro.org>
 <CAFEAcA8=bihNgdeAsNGS-cymu7zjCG9nA5cYTm4TokR3h2XptQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8=bihNgdeAsNGS-cymu7zjCG9nA5cYTm4TokR3h2XptQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: yKq0dUSiPSeS

On 7/4/22 16:20, Peter Maydell wrote:
>> +void HELPER(sme_addha_d)(void *vzda, void *vzn, void *vpn,
>> +                         void *vpm, uint32_t desc)
>> +{
>> +    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
>> +    uint8_t *pn = vpn, *pm = vpm;
>> +    uint64_t *zda = vzda, *zn = vzn;
>> +
>> +    for (row = 0; row < oprsz; ++row) {
>> +        if (pn[H1(row)] & 1) {
>> +            for (col = 0; col < oprsz; ++col) {
>> +                if (pm[H1(col)] & 1) {
>> +                    zda[row * sizeof(ARMVectorReg) + col] += zn[col];
>> +                }
>> +            }
>> +        }
>> +    }
>> +}
> 
> These array index calculations look wrong again?
> Should be 'row * (sizeof(ARMVectorReg) / 8) + col' or equivalent,
> I think.

The tile rows are N physical rows apart.


r~
