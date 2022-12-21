Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4772946ejb;
        Tue, 20 Dec 2022 17:03:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6hWALjWbCLSctiykWNnbHsQGKgo7hZ4xocUrANzIKNkpI7Y1fgILnkCEGE1pbbUNsmrUwU
X-Received: by 2002:ac8:5292:0:b0:3a7:f183:7f66 with SMTP id s18-20020ac85292000000b003a7f1837f66mr64628979qtn.22.1671584596277;
        Tue, 20 Dec 2022 17:03:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671584596; cv=none;
        d=google.com; s=arc-20160816;
        b=X8ATWIEof4XHBRnNx5VtzvmwZu0l1BOERkqeXyAZ4c7+tq6quLJQU36jT63LQ/hap7
         D/GiAAsy2P6Dwu+WLe0tm4UBM+3oR7n/r4xriVvhSb6/h90sVVe5nNB60F9jr8PspFYw
         OfSzqsS5EZ7BjI9YqPZEVv4b01piznlkHnTebuvebpA+9NunhLHzKkycNvoiQtzZCbf2
         CE1/HyF564Fad11UbDp3C18Pt1/PM1hBhPDbzVwf6Lhk0NFqNUgqd6hBkT+MBH8kATWi
         uVJHNYSfV8xMd6JMD7RYbWo1Z8xaHGWEXE1Q3hqBhMvd28E631oj5/VJ/5nwIHzn+SqE
         EhXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TYC4RlEZX85DcloEeHvm418WSLDMXrtH8IdhzDztsgw=;
        b=oHK+FrBMb/lMQtbOLcL+WBUf9n2Df7AD5IN+wx0yadQSEs0rZGQAkR242O9lXWzDA1
         ZY7YncHB64dJWlBzdJAoSVB0vFTi1Nw1EU4+RvPqDTe+c7zX9ScesNlovS/RtqPfQ3Iy
         R5utUyImFGOoEzmSjYOL1e6d+fGsycoYU7DhCbWzRL+/kmHtASPM105EAhQKDsHAAe+s
         Cl9YvjMOmXSBzLdPCmyShP9E/xuzQGvpFQz64cbhGThwTCtYOGB53UwjrFaVTVwjzpa7
         yCa7wo2XxOVRfbSX6YQrxAcWhrSQ0VJ0/4oQblWZJcJLOphk2Yy3WDTyCKWDPTyy+tbM
         RN2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qWmP1JdT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k25-20020ac84759000000b003a690945588si5702359qtp.684.2022.12.20.17.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 17:03:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qWmP1JdT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7nV0-0000kW-TF; Tue, 20 Dec 2022 20:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nUe-0000io-Lo
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 20:02:01 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nUd-0003Ml-3r
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 20:02:00 -0500
Received: by mail-pl1-x632.google.com with SMTP id d7so13988900pll.9
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 17:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TYC4RlEZX85DcloEeHvm418WSLDMXrtH8IdhzDztsgw=;
 b=qWmP1JdTZYm1xu5SBoAvBC1azB8iTw+pNm9I6sTKCOBvN0IrjnOnr4WKyfcUAk6CaH
 bNg2vBWbo4G/xjfAnHR6OiwEjLZ/2N4GXRUW6xmg6kVLn2o8CuR7sLc6BVJuBR35r+it
 FZwPAV5OJK2aCJ2eDSrkwayM3Rh9iBgN6hut1OApFdbmZKzMEPDlYD2XRVAQRgZTRIQV
 qyyBloQl0VoMgoKEv0DZGervtesC56sHffIjG/WHeStj3uFXx++egamNQRipzEw7tA0x
 EsSRMKU1GaCQM0Eli96a09wvNfR4OVLd7WW4i6Wtb2w1Rj2Mu6KuyOX1wRyJYSIiXTnh
 swlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TYC4RlEZX85DcloEeHvm418WSLDMXrtH8IdhzDztsgw=;
 b=4nLvZyVV5Cfj3LNkjEL0ypbpNUkLZplZovAVdNyEG8f6DAleAAMEtcm6xtAhP8Fzlb
 jOTD6XqDWTZlZAjlrkpkxPOBJcuz1Z/fl5BGUBZ4TsN1NGHUpZr/xU1UW7QenJY4RVU7
 UBq/Il1VHmeTZuy21CkuX44q37WF8XJWkiXYDO6zbVWJEiaW8brXGckMIqxKyM+79Jkn
 1+hRexNkr70Y4NDem44w6v/z3SzApnnKCWACE9EJjAtDEfm+F/KAQ4ff1R+hpFAQTd4E
 6tZL2C1m+GK2SUzXrwDkLuwZWcNrmb391GyyDzrlBUm5BELbgYkwAq9fcvhB8C6vv3lQ
 8BjQ==
X-Gm-Message-State: AFqh2koOYHmVBmmrmXSgGr0JEANOi9fTgmCxadeKlnTSKB88iXBHNc6B
 jE49yIi/9dGpc14eY0dLNReFaLHLxVHr4D+v
X-Received: by 2002:a17:90b:4d8c:b0:219:c2f2:f818 with SMTP id
 oj12-20020a17090b4d8c00b00219c2f2f818mr29848pjb.42.1671584517789; 
 Tue, 20 Dec 2022 17:01:57 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a17090a0e1700b00218a4795b0dsm142061pje.34.2022.12.20.17.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 17:01:57 -0800 (PST)
Message-ID: <eac96f81-8cd5-5951-6b0f-69da5985d47c@linaro.org>
Date: Tue, 20 Dec 2022 17:01:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] hw/arm/nseries: Silent -Wmissing-field-initializers
 warning
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20221220142520.24094-1-philmd@linaro.org>
 <20221220142520.24094-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220142520.24094-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jdRjJt2Pj2AD

On 12/20/22 06:25, Philippe Mathieu-Daudé wrote:
> Silent when compiling with -Wextra:
> 
>    ../hw/arm/nseries.c:1081:12: warning: missing field 'line' initializer [-Wmissing-field-initializers]
>        { NULL }
>               ^
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/nseries.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)

Not a fan of this specific warning.


r~
