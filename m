Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1013969njb;
        Mon, 9 Sep 2024 10:58:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWS/z/nTZRxsnOf8U3+PlUtCVV33BP9NWol2asyPHGZUP7IdHeDwcVnYNmMpS251k+RxEeDxtzc8RP9g==@linaro.org
X-Google-Smtp-Source: AGHT+IEGuK9bL8xCZ3mJZmop8OAWKtb4Ht1Bs1fmEr5EuPZdfEj8IzgSFxCL1ay3kpnB4H8drpaG
X-Received: by 2002:a05:620a:2596:b0:79f:67b:4fdc with SMTP id af79cd13be357-7a99732852amr1550267885a.2.1725904719424;
        Mon, 09 Sep 2024 10:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725904719; cv=none;
        d=google.com; s=arc-20240605;
        b=TIVCDW8L2lhcz/brKGZHfowcjIBgXfDt4te51hzS9iNoka68w+c4nABH8CzuI3NsR2
         T2uDsZjNXmNySCTskdfH8Tma5yaeDw3Fn00tTquMjELld+8IQi58SDcG27l4UdJNBAwy
         a8DDQJswIDAb43G4yZgW9UD1oCeurA7utJUbqTEU0kOpCgzozRRh57jF93ipSQ6ITeVl
         IFPcXLQa39CYviMf71S7eWXOoaCB41JFiZlkG8l6G5IbbAlU+QTACglDTG/KD99wLwBc
         KNIPhaOyjx0o/NCwUBBK4c6NlbCQamdPFoBGYv5nbCyoNFBO5SvCE8408bAMahgrVe1n
         imxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=RGdyl/RLTjhQ5jQlVdPjCZvOYkDGKKpxchPklroK5W0=;
        fh=OxPkQnqvXuH2kPANwfXJqiNwtFot+H//qSCYju9zcBM=;
        b=gqp1DUSEqVKkYtKjZ7edwG8GuDvHspESIMTc6t1PnPHle9ILNIwgmuMGUX5yZNGIeH
         ock61ANG6s8urPuo5894+peKXyybTDm+vDAxInSMHRdPULBxnqBzw+Z45nq8rSXrvw0C
         P/OAwvoB6J5xsr9CQZRO9nwPuiNo1BhgfdWE/vCMSGMwHiM6WdkiGQIIeJ5c5L8hZIzG
         /Vzk9fLr3lO8Bl5ckhttAnKngskUUjxYJOzoxV1rZqjfWcKLPdWHklxNrEfTWcU7hSzD
         SdWZcLU/LmKCvZ8HmW0lurz3evvZnQhI3NUx7jdrlpY4W/sYxfgOFJ71qMyC+oQJJpiQ
         p6+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pcksQLQI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a350f2si613776785a.332.2024.09.09.10.58.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 10:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pcksQLQI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snies-0005TU-1a; Mon, 09 Sep 2024 13:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snieq-0005Lq-Pg
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:58:36 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sniep-0000oF-4h
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:58:36 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2f74e468aa8so49524761fa.1
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 10:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725904713; x=1726509513; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RGdyl/RLTjhQ5jQlVdPjCZvOYkDGKKpxchPklroK5W0=;
 b=pcksQLQI2C78FMTLOF2VpgC5E+lVLV+gUvLL44nMGeLixuPPSsYcL6m8esM5LW0rHj
 Xse9tlM3+dHeYhNI7q7CwSi0tYtz5yfQynU8kx5mf52oQ0tExc981h+SWsmvKzl4f/su
 oj/bS1GEVOAmjdfvTrXaewtX7wo05uJ0riBt6DfIj+uEqq4AMgYfwkiH73zpavySpAnD
 ZkYAwOJ6uLh7dkAAqfFTKWbuhAA9tVXdA1DyBLYefYbY1E0c+nqvqgMI3X8w0fni0Nzh
 C3kx7PsofLACkwBXE1O1K7GM5m2twYPmm16IaXXzqcxEC2Z0hUm1QAd8nG1BoipxQUXJ
 nC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725904713; x=1726509513;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RGdyl/RLTjhQ5jQlVdPjCZvOYkDGKKpxchPklroK5W0=;
 b=QvA78W6qjjHrPbE452td49draDVb/4wqJPgaZAURTge64NU2jj4o88FZoAzgDBZpIV
 1T2W8cKVMiUdE2fw5ICPN5Y9AQeqHnve1N+ktksJtk+bfB2L556P6BQV0ow+JoHI9wuo
 FCv2YyPHtXlZ9bFULkxMIqGMxFoybSAUGfE5l8pK2rcyMkng+9Am0rSA0gMgTwoL4k9n
 BtfJ3g3ZjL5MamrnD14o/7+t6pPGmyq6DtYd5eSaXoUVIkY7MI0hNNS/PdxT6j0jCJaq
 3JdPufRyhMiv3qm5f1/cirUm+K1+7MpZ+gBNPFr+0I0n1NvM63B6NOeznqYklWb0qxhT
 ZZeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTXjQYOJbOU4pOrFpDHOBMMdaXMUBBrefpFa88VuorW5Nosy2rkrGJJan6IQiAII/r0s988Q4y/g==@nongnu.org
X-Gm-Message-State: AOJu0YzBP1poelXmj0yQCMrr+Kl5WYr33us/QBScBAg20mOB0aH4/TXo
 EqFvvKoDF0kISGLImzDA0w6aatxC+BQw55UdN0LMU8AMN66XAtBh6qe4abS0C0MBGZs3yTGByjA
 m
X-Received: by 2002:a2e:bea6:0:b0:2f7:4c31:acae with SMTP id
 38308e7fff4ca-2f75220a042mr57623441fa.2.1725904713061; 
 Mon, 09 Sep 2024 10:58:33 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd467desm3231517a12.40.2024.09.09.10.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 10:58:32 -0700 (PDT)
Message-ID: <4b1da1e2-03d1-4c14-9a42-03493b84933a@linaro.org>
Date: Mon, 9 Sep 2024 19:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 53/53] hw: Remove omap2 specific defines and enums
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-54-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-54-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: P0ls7//FHC5U

On 3/9/24 18:07, Peter Maydell wrote:
> Remove some defines and enums that are OMAP2 specific and
> no longer used anywhere.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h | 207 ------------------------------------------
>   1 file changed, 207 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
