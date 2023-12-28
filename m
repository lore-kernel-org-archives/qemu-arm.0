Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1248085ejc;
        Wed, 27 Dec 2023 16:51:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmV4Xt10RQL64lZE7mRvDByAglzPgytVnb3pR7w3LWXbI1rCpWsThbYX2IWbR4QrXAD+QY
X-Received: by 2002:ae9:e917:0:b0:781:2a7a:40cd with SMTP id x23-20020ae9e917000000b007812a7a40cdmr9457402qkf.127.1703724668132;
        Wed, 27 Dec 2023 16:51:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703724668; cv=none;
        d=google.com; s=arc-20160816;
        b=Q09py/3boZyPEQBeRiRyLteUXJiCMdsH1KGJfRrIWTbK3CjDily8LqWgdw8wFGhOmO
         6ox9iYIPYUknfQQcIjk3ZyQ/DvDNKlo56TbcgqSlwDJV+lzKi/B3akzuF6ezlEmeYOrF
         HktYaDAeQMaWLSwhqfNq74MK/ljS4oSQom5TbqdsNKHT3ToPNY05JTA9F0TwbXfZvccv
         EousLt9vUcI+5TMV01V8+pLGOuIWgIiGELTJd9eWgDiuLgpi8c/g7XhYbixIc+Ygb8lo
         ik1S4kUfFtEK2EdPhJtxdiXIdiRFkSibr5LB1TDakN8+jNilvG1sBlhVhI20psJQ28Fm
         2Rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Vp+Cm8HKjEyUq3bujwbmIxuUl7dQekI6ibEjoDWkgRc=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=OPLB8OX6LykqncFINPdOP+eCmaIYjRgi9ekHyWsIPuvJx8Ks1Ll1HTY9qClu4NsTZW
         r7L0zdFqYyqWxRi7nJ4fLHQxcsyf8qFENdgO3AwXrBfkYPgGT5CVCLe1VHDgm9nIDdas
         sDXvG4uIe0qIE7NvLgJuyf03Qnq1Kd7dJFiDNmDhEwgW46ELvVxhRzLyc+PcGCJ9OZWc
         Vp/0xJGdzpbuybBidiuJR9Tjm0y/UG01DsalD3ZuD0R1jlhBXDur5XjDMBWQ3+9/RN1r
         VuG6t2+z9kJ5UV0ygJjCLCH1aBQT4PsQHo+3BGFsNMcZVkE8v0+lTqrKKUy5J0q6ffAa
         vJeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xz88+UlS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e28-20020a0cb45c000000b0068062e4e54asi1968714qvf.38.2023.12.27.16.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 16:51:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xz88+UlS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIebj-0007gZ-MP; Wed, 27 Dec 2023 19:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIebi-0007fp-I4
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:50:42 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIebh-0000dk-0K
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:50:42 -0500
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3bbce1202ebso315521b6e.2
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 16:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703724639; x=1704329439; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vp+Cm8HKjEyUq3bujwbmIxuUl7dQekI6ibEjoDWkgRc=;
 b=xz88+UlSgMIV7uc28Q8dChMZfeetUt2Mz5TczyASdII0I2qVEtT8tLGT2fQ3Ashs+c
 R8P7HCUhXdXjn7edvrABIGTXMhfm8FOc+WPi6cpVmtlDubJjxtncSuVJLk60j4QRN0Ov
 fxpFS9yXgtUW0hhG7Ka2IVK2Fru36XpMYEZHkdtEHHpHwcAIFUbouorq8O7UwuwiyaUY
 V0tAVKpJXrDI/6Tx+vykvAHOfciWWW6g4S0IochxadZJ3nj5V69PPho1zkFzR6CTumFN
 co0/uZLV13ETyWd4bKEk6k7AxZ5XFU124zHWkuplnNqDKfrQGxopxkLOHiUf37GAYGxn
 2+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703724639; x=1704329439;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vp+Cm8HKjEyUq3bujwbmIxuUl7dQekI6ibEjoDWkgRc=;
 b=AzEPjWOrvba+0EdVj+qufhU5DIZfUdFCJ4URb1psMFa/kDWZUcHRFH4yO3K5Oek8zF
 sqCgsHedF3hp/at4pwBdMbDrQ0JVOnV4/LUQrGHl7Cgq0aUHPGJJVO4/+B+QSJEtKM6F
 NHT9q0N00Of35+gY76YQ3DtZY4dwI5TrgKp7qt9skPg146vYFladvV1ZJYSQr7xwaz9q
 xyHtB+0VrNPQX2gbSW2nDnw0mqD3asPDxdbVpCn/eT83+BCb35Yd5ecDy0oHj8UujFEi
 YPc03ShzGzQo0mqkmyZ92E1gJXfP4+/rYX0RcmVgNgo+Cths2ctgnArh+1WoAZy1gucf
 gZIA==
X-Gm-Message-State: AOJu0YxcePDECKnkqvHysm/JO9+4fQ/UE93T0MDdWsL/StpuFpWficlY
 lCMIw61uvGXgTPGDn1LvA9BB6f3nHxygsQ==
X-Received: by 2002:a05:6808:300e:b0:3bb:d118:155a with SMTP id
 ay14-20020a056808300e00b003bbd118155amr243874oib.1.1703724639647; 
 Wed, 27 Dec 2023 16:50:39 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 c13-20020aa781cd000000b006d9fd64fdcasm2057422pfn.37.2023.12.27.16.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 16:50:39 -0800 (PST)
Message-ID: <dd1c1304-1866-4b40-8948-483005cbe6d1@linaro.org>
Date: Thu, 28 Dec 2023 11:50:33 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/35] target/arm: Mark up VNCR offsets (offsets >= 0x200, 
 except GIC)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
X-TUID: a1LEIG2TV1s0

On 12/18/23 22:33, Peter Maydell wrote:
> Mark up the cpreginfo structs to indicate offsets for system
> registers from VNCR_EL2, as defined in table D8-66 in rule R_CSRPQ in
> the Arm ARM.  This covers all the remaining offsets at 0x200 and
> above, except for the GIC ICH_* registers.
> 
> (Note that because we don't implement FEAT_SPE, FEAT_TRF,
> FEAT_MPAM, FEAT_BRBE or FEAT_AMUv1p1 we don't implement any
> of the registers that use offsets at 0x800 and above.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
