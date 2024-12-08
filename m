Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2118788njb;
        Sun, 8 Dec 2024 09:51:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvPHEb0Kns9PYKdiJSzueGuaEBcMdRBK51FmdjSWCrFvHPyqRQLKXnL+LHQJr95HjoimnwxUruTBswcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG/qNeF7plGBXM/c3QRWwVr0zJWdezBj15+E9Td2sPER+zqrYObEDXOOMne/8s8pQ8uu52y
X-Received: by 2002:a05:620a:4403:b0:7b6:773f:4bd3 with SMTP id af79cd13be357-7b6bcb740f1mr1592199185a.41.1733680301772;
        Sun, 08 Dec 2024 09:51:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733680301; cv=none;
        d=google.com; s=arc-20240605;
        b=Pmglip3V7L4270bhUhro9ay8mV9fyNz4FkhjsRw3Ic5CmpEpHDLgWjoetpohJX5Zgf
         1V1ufhwJ1uucrZRhZVkBK2mr+0kb94pi8BRcL720YfRikzuTXXdCuVDp2hRZiQTlE/lH
         IrrgebqkiVqRd5AvfzeyE/yJsqo3J13d83fZF/R5pSqcaRpjitdKK5mnY3UfmXRUM9en
         fnt5xX2W6S84+zHwrZsJ33ipaDLdxcv6sUzpdGBYZVdVba31+ERXmhgFji2j8S9s7H25
         NcTtzORGcDTXRb+H3DXWUljcvue+aEcwoe/A7TZBJeyZclatnvhHPk1Nuh69WmssA8T3
         RxqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=71d1mY10sg/LRTcH6FrFAgM2tie7gD68/ik9cYyA/8g=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=ZALPZa67tpjzDpYsswxdBmMpmgMgcGpO/AyNPWtMVUJdvYrR9/2pC64ilpu6tAqs7S
         aMnNTjMlpPfZlOA5H0IR0h5py8bHHuY2foGuPobBYxvVpJybjsoZoy5QjGMxtqBp+y/G
         Yu41cbQV7SSh579H15xRgiqh6cupXVxjDJakOmdHRTbdMUy/isUiQsEkUMQ8ORzlKR7/
         sv9HFt2fGqTWenlF74FGBasdok/xnwoxkPqhNbJnTjkxZbBLBa71d5pvVFm1Ek4U4hoG
         WGKNr6zWEF0qMpQ7JXVVYEwd1X6T3xXCsSj6KgcwoDfPdYYSc88gvU2cM0Ih5HS4jdeM
         Sxqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F4iIvBNd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6c93aec25si365200485a.192.2024.12.08.09.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Dec 2024 09:51:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F4iIvBNd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKLR8-0004S4-Vk; Sun, 08 Dec 2024 12:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tKLR6-0004RP-OW
 for qemu-arm@nongnu.org; Sun, 08 Dec 2024 12:51:16 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tKLR4-000137-JP
 for qemu-arm@nongnu.org; Sun, 08 Dec 2024 12:51:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-386329da1d9so828003f8f.1
 for <qemu-arm@nongnu.org>; Sun, 08 Dec 2024 09:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733680272; x=1734285072; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=71d1mY10sg/LRTcH6FrFAgM2tie7gD68/ik9cYyA/8g=;
 b=F4iIvBNd3GnHPiYYbaoN4jc/hJRdlb6cCN7i03VhWc9YWStcKBHtWCOsfx/miXmumT
 YYp1/pOakdLYO8XAziV5oPo4I/zAFQO9OB9wJTXcpFsE+1QhtasCIlsN9dckuLcGF37K
 ezdUAjkuInbm4z4FPUckBY1nMKkWuzvNSA46AAzBKsbMMwqyrn1c0AQyfGMnRIlV92yp
 OPt7NKkoaO3fIxZEzB0LcdEIbQ2UDtESWGJX8jsxo7azOIW4OA/0UNX+cVloBltA0rbl
 nlCCCUNhuir9k5vP9M+EByP5K5qKwXCnr3ptTiRgGn67P196KIf/xEvk5ixrb7/HsTf8
 3nYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733680272; x=1734285072;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=71d1mY10sg/LRTcH6FrFAgM2tie7gD68/ik9cYyA/8g=;
 b=NSV22PHz3kqBuEOWCQeA7dX+bmlURg4Oru9bvfbEeDT2zGeH6wwLiB51IT3bxwvu5K
 PTYsn7TDibqVeH9l6fTWHm09sx1T+aZWPZWgsIPGZWlPd6DJxhtWSn9AK9J+D6XJEVWr
 XjjkbpH8vyxR+i+xefXzacAcTgclaaLRkfexab5CCNuXXlYtwMBBb+yHSxBOnTjIqIxe
 n7uWNddvgIcVMlZwxPJkgLt3+jbwTb209xh1cHSB6xWw8r/gfMTKyZpmZzyma+hcfUQK
 UXj7um0lknUmR5ca+7hJ9zzOeJAJlq4sH2rLZA/rNi6puqjSeNwrHIEoim3y6np8OIpw
 PV2Q==
X-Gm-Message-State: AOJu0YzlPddnB9vteHEnQ3nlhtN2NgeuWd8XXp700/gWf25qYL0KqToU
 BWNG6t2vh93kcKCkb3vpPDqAGnbzLZ55djWlar8KpCpLA3xIFhbjcjepoeVWIik=
X-Gm-Gg: ASbGncsmTKokdA8o6sjEJwqFV7dMJCGCulkdxYU9ciGa76tvR5exsxF9EJmpQ3dmx1k
 UOnwpYclm80MIm2lt107fX8vGUP0AeIRimZozowSdSS0nudOHfMH99bGioRjA7vpeb1wD1KozDp
 QHzIVQLcJY05bpBQvLPK9r2OxEiWJZ8W8uj1zb1qnysP0vDVy9T/98COZpI5XpuRP5N1CqQJhfA
 wWUfXA1m2aNywM7vy7Ie8pHuv7QqgPAQ0QiMybin4odvssFVg59pWem0gshmog3weOXAF0NgXqQ
 btfJv1FkuEyWvD66N4BzWvfaSqUpqLXQ
X-Received: by 2002:a5d:64ec:0:b0:386:1ab1:ee34 with SMTP id
 ffacd0b85a97d-3862b3351b4mr7488642f8f.9.1733680272310; 
 Sun, 08 Dec 2024 09:51:12 -0800 (PST)
Received: from [192.168.1.17] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386219095d3sm10764636f8f.71.2024.12.08.09.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Dec 2024 09:51:11 -0800 (PST)
Message-ID: <9dfada41-b04b-40e5-9c9b-0e35b860e507@linaro.org>
Date: Sun, 8 Dec 2024 18:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] target/arm: Introduce fpst alias for helper.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241206031224.78525-1-richard.henderson@linaro.org>
 <20241206031224.78525-2-richard.henderson@linaro.org>
 <79b8fdc6-bbae-4068-ab29-08e32cfcc058@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <79b8fdc6-bbae-4068-ab29-08e32cfcc058@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: uJr42ZFRtSsu

On 7/12/24 22:56, Richard Henderson wrote:
> On 12/5/24 21:12, Richard Henderson wrote:
>> This allows us to declare that the helper requires
>> a float_status pointer and not a generic void pointer.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/arm/helper.h b/target/arm/helper.h
>> index 9919b1367b..cb722c491b 100644
>> --- a/target/arm/helper.h
>> +++ b/target/arm/helper.h
>> @@ -1,3 +1,7 @@
>> +#define dh_alias_fpst ptr
>> +#define dh_ctype_fpst float_status *
>> +#define dh_typecode_fpst dh_typecode_ptr
>> +
>>   DEF_HELPER_FLAGS_1(sxtb16, TCG_CALL_NO_RWG_SE, i32, i32)
>>   DEF_HELPER_FLAGS_1(uxtb16, TCG_CALL_NO_RWG_SE, i32, i32)
> 
> This should go into include/exec/helper-head.h for use by all targets.

Oh, indeed. R-b stands.
