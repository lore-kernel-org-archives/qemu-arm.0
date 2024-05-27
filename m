Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp2905298ejb;
        Sun, 26 May 2024 17:58:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGb044ap+8q6YG68nyuhP3ls+8dgU2mTxKHLPFT/LhKPN5dszn8U7uqQFMNBXWoojORwZaBnj/Tcib83rfduA2gCVCvFIV
X-Google-Smtp-Source: AGHT+IE5Qg8bgP6o6UppquIRFcFQbjY32rBrCKN4HUSqSP5K5tdGsiya5xZSxJzj7ilGUfOeUNnz
X-Received: by 2002:a05:600c:1d0a:b0:420:1585:7a99 with SMTP id 5b1f17b1804b1-42108a14fa5mr65694835e9.38.1716771482415;
        Sun, 26 May 2024 17:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716771482; cv=none;
        d=google.com; s=arc-20160816;
        b=erIqmGyO35UPeZKvY0WuTY11j2yQ3I/MntlCUjMeDCVjDe7tuACLswFAoAs1bE3SVx
         /nZR4AnyYgvwMrMpMo3ZlMaxG6IWljqCZXmDWi938g2ZOhSBb2gwxsAh+hz/z5eDT1w3
         2WlcJoKFcYpjNwi4ppnXwe4Z3gjRkCVd+HA0QYPXNKTWBYtCv3mlkK5f76cPTZ1kATve
         jLDkluZS4H7DeCrADDHPt8SyISg1vhXT1Zxd0bZ1+ur0EJMrn4gZQgyf+DxxbJJ0gm9m
         dXIwa4ejEJkFkELImQbv9A7864qHx+JwNMgmc5U+GqMNxP4vJerkBOE+2xrll0tNdMM8
         Sgbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Trk/VqSOq8JtCHrzWWeFdORzKwC0HSCtaGIauIbmxck=;
        fh=BZS8WSe+AY9bSLQlONhkMs3CWjGTm05SFJe+vH7/uQY=;
        b=RJ/P5oG+avB6dzcRZaqmvKNFTjsnESK1ZEDcPug2w4PMc/sW8arOu3s8Eo7OuoEYvK
         KQ1Hc0c/JuMrmJjmksTHPFSHGbaeJ4DAn8rG3QnpVPc15xp+f6I0SFOr3vvViqBKcPP8
         W1Rn2RX4wRW7b5H6QmXaUeGFNYEOhH+3MkW/QSIiTDikMuaniUa0iQJG3bQYAOj23FLI
         PRaFFtzmRfaWcFfrYMnNYbhG15ogwHIrkmRx8PjrvtgpxAC6bu8OdGQOW0ujxFRheKPn
         u42Gx2H4uktVQO8oQhYiG3pF09Ud4rTnznZsw5OfYS5TzikQ/Fu2fR7ZwEUsaXRFORpL
         gXgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ELW3eRqA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3557a1cc442si3476170f8f.597.2024.05.26.17.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 May 2024 17:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ELW3eRqA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sBOgI-0000bx-Cj; Sun, 26 May 2024 20:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sBOgF-0000am-Sz
 for qemu-devel@nongnu.org; Sun, 26 May 2024 20:57:39 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sBOgE-0004s6-6V
 for qemu-devel@nongnu.org; Sun, 26 May 2024 20:57:39 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1f48bd643a0so4169065ad.3
 for <qemu-devel@nongnu.org>; Sun, 26 May 2024 17:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716771457; x=1717376257; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Trk/VqSOq8JtCHrzWWeFdORzKwC0HSCtaGIauIbmxck=;
 b=ELW3eRqA08c+Llo7sRYiW7hAU20bXI6Ub55Ghz9gqalI0D0Ka9VxyyoUim1GR+sXDa
 cueaIRwtvvF0yY3Hl2oE+rglMTftrvRTJkK6qzNRdyyJFOIwAlBHuMil2cnfvlKxZU4n
 iITvQPfqdFmXk1ninG6jQKRA8kuhF35QkfPAEZbiqcyrmXET5SjA3nwX5v/agvZOe+zB
 wV4TPqGONniSG1aKmrO01VPPw0k37ix3aJVnW+AS7mpMkosEv+jjOFe9FN1OcMrx6NvG
 KyKUkcTtfsR7aMRaOoYIZyHxlHHfBIgU2j84DU99+937Ei4J2PNJf081XsjCcxXQNCou
 oTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716771457; x=1717376257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Trk/VqSOq8JtCHrzWWeFdORzKwC0HSCtaGIauIbmxck=;
 b=d+kidH6Qltz+Kf9ZyDW1NipA/KeT4yTbghZh/G10r8EG4iEAdD6vuXxHbss2IYv4Vi
 Rnv5JjdUPEaT9eR27UdVzb7nmJNT3MDkO42rXethJJo857IbJs1HI2/f5qr1MSNhJV7h
 gX4T4Wbtdlx3Vpd2ooFH4oI2cvgwB13ugdezSIioEsdHkOC5hlG5KxE3aVeZqUWjpsgE
 1aqFkyA+jg1DzibMXfRJJwJ6taOCwZbqzGnxpn3yHgNyMvLW5Ta0mLwhiWor6OI6PiHL
 sNxHhX8qbICgoP9tAFJtdpSjleBYSpe/zj0ItN3WT4+vZEn1gtmHrWw2AdTVjcp6X9Sc
 fMSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpK81r530rBAlVyytEJtjNJK2FPjm5RqeD1SV9p8lM09N1e1HTOm9ugn0rit/pEz9ih4FYBtgMTMlpRQI9VdohwuNrenY=
X-Gm-Message-State: AOJu0Yyj5tn1fPsqFsJXzGBf5M3RIFwyfheH3gkOnAzgc+4XMNs/DkgB
 vDGz5KEWJdUUm83w0IlkD/scqNvunoD4sVTJ/HSpiwqTnjaIatiizzeqP+YEt4Fg5y7T6+B9AHb
 5
X-Received: by 2002:a17:902:6845:b0:1ec:5104:c75a with SMTP id
 d9443c01a7336-1f448f2cd70mr76621585ad.41.1716771456566; 
 Sun, 26 May 2024 17:57:36 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c9957ddsm48621395ad.190.2024.05.26.17.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 May 2024 17:57:36 -0700 (PDT)
Message-ID: <e5f8d608-09be-453f-ac85-e56118e2b7e1@linaro.org>
Date: Sun, 26 May 2024 17:57:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Disable SVE extensions when SVE is disabled
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20240526204551.553282-1-richard.henderson@linaro.org>
 <63ff94b6-98df-4e5e-9c53-7a03c7309cd3@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <63ff94b6-98df-4e5e-9c53-7a03c7309cd3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Nj83jMGFAEFY

On 5/26/24 14:06, Marcin Juszkiewicz wrote:
> W dniu 26.05.2024 o 22:45, Richard Henderson pisze:
>> From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>>
>> Cc: qemu-stable@nongnu.org
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2304
>> Reported-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> 
>> ---
>>
>> Marcin added the correct patch to the issue 3 weeks ago, so I'm giving
>> him authorship here.  I only updated the comment a bit.
> 
> I am not fully sure is it everything needed to be honest.
> 
> Value 0x0000 in [3:0] means "The SVE instructions are implemented".
> 
> The way why it works is probably because QEMU keeps "there is no SVE" information 
> separately and do not emulate them.

ID_AA64PFR0_EL1.SVE is the primary indicator for SVE.


r~
