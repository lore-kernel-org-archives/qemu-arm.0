Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2244832lfc;
        Sun, 25 Jul 2021 11:15:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF7ch89cULI2snjge3MRCYHMOJK1HAOtNjWOyVFRt7hGuLQRZebb/AFYY9kWK4p0MgBH5I
X-Received: by 2002:a92:1908:: with SMTP id 8mr10503857ilz.149.1627236901186;
        Sun, 25 Jul 2021 11:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627236901; cv=none;
        d=google.com; s=arc-20160816;
        b=s07CB8v5MZb3HY0x1G+IIRQIlYRve707l7ZBJ2r1FPmjebLiPF3AaySBvxMX6iTrfj
         ZBwtOlhAngNAB3WVTGmdT/OMbRdqzepuJ2snj1uDYU/EEg6+gk100Z6K64fiCduVu+qK
         nYXey+rcNKP+Hbe/41/YbY/plyr6ivdfLmkIdvAagBuxpFmFfhOnLdx3merXumtj56eW
         Bd2aA78Gs/cQgioB6b/XxD4oMbkH9fDzvRj7Tc9DcGV/hh23Ud59u20WOduxW7d7aQES
         0GqaSgF1yvcyBYDu/AdtAig7C4ZiqBdOJgQw2J1CinD1ppbv17dIq2YmMSSZ9dr2UhZI
         hqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=pYBq0fkzpUJJtZwHSaA7momNQhe5XHofPt87G+4DNis=;
        b=X8TZtCgG3csI2XmD+nbs9vEJgYXxZgvYAfYCaXuTcibNvI4n0eRNJIKCMIV2dnG140
         pQpJ9hY1jAgsKMStIXMkEb8Uc6+34RKDgHzZFx8cPdP7yLDaU/OyIjXxOioiHweX9jwX
         G3pDtuSKXQxJMZ05R0uXhR88IqITO5m0jEi5TgaDHqJh+uaLIDT9gKRM6ro6Co/yN3Nw
         MEM/ANeivKoB/OLy36SdhuFUOGkfPG0BzshOLS9Y1Kz2ppSq2CrPXJ5m2dqRf06HDPJW
         FSCsGXCgXA4aOn/r+ojFUGBNlT+TDNckT4h+fQbzmoJDHTmhV5MLGtgOOJGTa40RpQEZ
         q25Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oufxN63s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t23si39789162iog.21.2021.07.25.11.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Jul 2021 11:15:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oufxN63s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m7ieS-0002HH-IM
	for alex.bennee@linaro.org; Sun, 25 Jul 2021 14:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ieK-0002H1-6D
 for qemu-arm@nongnu.org; Sun, 25 Jul 2021 14:14:52 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ieI-0001YZ-M6
 for qemu-arm@nongnu.org; Sun, 25 Jul 2021 14:14:51 -0400
Received: by mail-pl1-x62b.google.com with SMTP id n10so1285246plc.2
 for <qemu-arm@nongnu.org>; Sun, 25 Jul 2021 11:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pYBq0fkzpUJJtZwHSaA7momNQhe5XHofPt87G+4DNis=;
 b=oufxN63s1/SrTBUjkyq/VJ/diXtpoi6DlvSiLQxjrFyPof1YtakEQtxBYIHVwOd2Td
 NbqQY1r8GMqwCurVcCBD4AzqljDArc6FDL3M0scGp874WZyv8aHLMGcbD10oEOwpPirp
 YumCJw/aLaCQm74MVW871QREa46mE7rz8lPjvtn9hydodV41e5p9etMUC9lQtEE+aqrT
 KtWU7EsG9mp7V39XNPAyxamkWTbtHMmcYTgwJg1IRvRaFMe1ZLErNfYKm12s0NcSzhas
 hFUJfMKiAvtiFxLkLpBfHuw5Y6iYGlPeqlLTckwZzbyOMjl+DtdhPwa36/n6Kn38SUbl
 DuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pYBq0fkzpUJJtZwHSaA7momNQhe5XHofPt87G+4DNis=;
 b=OyPoNuGjuOtYQRdqIq1ur97cPhJ5dRkJhqoddMSD5Sfj9E8+LOqWfutSDxgEwqWMal
 CvvV+JVjHNM5gb5tEujHvorMC/YuRxFblingNAYLJQreGtpdRp4FKcTM8qBuu7YJzpnR
 3c5gEbJpenD9NH705hWsJK8MCi1BbR0gDxPSv5SQLnJeqgCw+6oO7YR1IqmOFhCnnSbv
 KGtT/zVzBsfi0K4ZRAnCIpqtsvsJn9+JomtvjiXds2APkajB0Ptjh6uQZnxo0y0FoZmI
 RTc2KlKQ4KPlumebTMnl+g9o+3Kx7xwAZ8FDueOPXD76t6AtEjTLq/nYggJLZKt6tYFq
 0oxA==
X-Gm-Message-State: AOAM530AWwNSfSyhBGXRyHnDZnMYWB1zWsh3stD/pt4OjYe54QiU4DRT
 7xIOF85Ig02SVpj4rQGpCTW15w==
X-Received: by 2002:a17:90b:1645:: with SMTP id
 il5mr13469349pjb.113.1627236889156; 
 Sun, 25 Jul 2021 11:14:49 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id t19sm16674870pfg.216.2021.07.25.11.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 11:14:48 -0700 (PDT)
Subject: Re: [PATCH for-6.1 1/6] target/arm: Enforce that M-profile SP low 2
 bits are always zero
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210723162146.5167-1-peter.maydell@linaro.org>
 <20210723162146.5167-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78c107f3-23ac-3279-99e1-84df8c5498b8@linaro.org>
Date: Sun, 25 Jul 2021 08:14:46 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723162146.5167-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0KiuMjadKkoh

On 7/23/21 6:21 AM, Peter Maydell wrote:
> For M-profile, unlike A-profile, the low 2 bits of SP are defined to be
> RES0H, which is to say that they must be hardwired to zero so that
> guest attempts to write non-zero values to them are ignored.
> 
> Implement this behaviour by masking out the low bits:
>   * for writes to r13 by the gdbstub
>   * for writes to any of the various flavours of SP via MSR
>   * for writes to r13 via store_reg() in generated code
> 
> Note that all the direct uses of cpu_R[] in translate.c are in places
> where the register is definitely not r13 (usually because that has
> been checked for as an UNDEFINED or UNPREDICTABLE case and handled as
> UNDEF).
> 
> All the other writes to regs[13] in C code are either:
>   * A-profile only code
>   * writes of values we can guarantee to be aligned, such as
>     - writes of previous-SP-value plus or minus a 4-aligned constant
>     - writes of the value in an SP limit register (which we already
>       enforce to be aligned)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
