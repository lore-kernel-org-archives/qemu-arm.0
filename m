Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2987619lfm;
        Sun, 19 Apr 2020 11:28:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ5K90y2dNEDpJw2ql9tKO3TlI6CcGd6827UiPnvoTAdMUOjsLhFiXyTJ5U/HWVoyEIUTaT
X-Received: by 2002:a05:6214:9ce:: with SMTP id dp14mr3767906qvb.142.1587320905297;
        Sun, 19 Apr 2020 11:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587320905; cv=none;
        d=google.com; s=arc-20160816;
        b=KM/Ox4x6zos86g2V/l01DCpsOwUtvp+c+H1UfmmqCRd1K1UgO6cg1iNMupWXUPyMNE
         YeqMMquZ5b6DrZbN8B6AAhuRcVgQ3MMo1llwP0V1v9pZCElKc4DY3eDchMmz70117hlU
         Sr7v1isRRPQRUZ7HeVIqqeoAaFEhtYW8pwWoAVurz4uISAOpAESZ4Y68uKiFUjTZOMWa
         dHpIQnu5GRVzVU1rr988l32q0PiqsNPJK7KCEayUopwI20wymsb3sUa6rQnwVsk+NVQv
         jsV+YJ/IGIdtaBuL/AEv1hu/LFeaCvtCak4MMxM7ZD1WMfwoBhhUcZ0P3bWIargKtYbs
         zywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZX6QVxCj7wdv+7Ms3OrdD/hu6nmG0qusF62bCz9dF6Y=;
        b=n+77JEX39Qoz2NDdb3eSkDdrqTxwfPvky3yGIpr0/Koxo9nvjl56dTIqBgLICv/ijq
         WE6iKS9UALNfiRpoPQP6HhqP6b//EHz49cIJB7fsqm2u1hofGRtvK1a5mwJ4vVKSA7Ny
         +rgS8Akb/xyWF2AGP8R6o8VAG3tVazYi2iIk1AWqfSNtXbUPNvChpq+0jPitHgAmIYxB
         J/Ark5uAXsVJZfjG5X6C5yW5ppM6OcVDNNSH0Ub+GDfRQUAwn0hjIdzhMpSlRwTOnddn
         crV/jKWh1c6jfxXxHCD4GHwONcNvolKB6Hn2kMm1EwbfD+sGXPJ0NEzmq6ml6uw++TyI
         Uryw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qZIJlAPn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22si18257198qtn.144.2020.04.19.11.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Apr 2020 11:28:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qZIJlAPn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQEg4-0001Li-OZ
	for alex.bennee@linaro.org; Sun, 19 Apr 2020 14:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37072 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jQEfv-0001In-2J
 for qemu-arm@nongnu.org; Sun, 19 Apr 2020 14:28:15 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jQEft-0006aM-9G
 for qemu-arm@nongnu.org; Sun, 19 Apr 2020 14:28:14 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42202)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jQEfs-0006Xx-PU
 for qemu-arm@nongnu.org; Sun, 19 Apr 2020 14:28:12 -0400
Received: by mail-pf1-x436.google.com with SMTP id r20so3822403pfh.9
 for <qemu-arm@nongnu.org>; Sun, 19 Apr 2020 11:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZX6QVxCj7wdv+7Ms3OrdD/hu6nmG0qusF62bCz9dF6Y=;
 b=qZIJlAPn1TpSBlpyiCKvSebM0LBlH8FAIEs9eWUjbThPUfCJwfKeTOrCES7yJpC+yF
 e5IODNE+o6s10UlFZdgCUxiOhcpDZ3EA6N3cVjgcCgOuhdztGMfYXwOhLr4Q9dy3wCLX
 FU8Kw9DZRwNC3TjiZyZvx6Bpo5TqsT5MsDDHN3g8S+y2l5mIRzVkHbWeyjPPO0g3TQ7c
 +b82fLmSltD6VQGOUtjGtrOyGHjuaYllc7X3KgkqF+0THY6o4dEKdMifgZ6BQkFh0eJM
 tQdU3pd1w4qTqoql1k0sLLsYr5FSn5B/1DX5TsEPllYJxdxdBdor27WRGnDsyFFWmabE
 AVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZX6QVxCj7wdv+7Ms3OrdD/hu6nmG0qusF62bCz9dF6Y=;
 b=InLWhKoRDIHvg6rWbfw9RcNaw9a8SrED92pQwOBMEWkGrpyi59XabfKtZmhOdk408Q
 Bz80iyVeesYCZv5oODc6sLtursJDqx2tikggYQJQ6+T9h2IUXzKFnJ8xtHPkhLyLZv5L
 w2LSvq2W0NKVHH8ZPTOVO/3Lutw3Prgqp6e8M7TP+E7h8K/I+X1dlYDSV3aKDpLXFUS3
 BaCkT3Co82s7kBHqhowGCSCXXrY9c0/CdVa3a5BArA/GRliVcZpZfkaO7LkLMBblUxbi
 d7m417pf11VKF2k2DV3Dhz1yF0xU82SUD8nVAns1UmcRDcmw/7KF5/OQWp+0noRBN54F
 Y2fQ==
X-Gm-Message-State: AGi0PuYjB7ecsAtrbFs8lpGbUWUAhy/NQRyVxnnRj8WBcNZiFJxiekvG
 wi1/1zIZjza6ol8PZHw0Va5HkA==
X-Received: by 2002:a62:fc02:: with SMTP id e2mr13209761pfh.195.1587320890832; 
 Sun, 19 Apr 2020 11:28:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id t188sm4591416pgc.3.2020.04.19.11.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Apr 2020 11:28:10 -0700 (PDT)
Subject: Re: [PATCH 0/4] target/arm: Implement last SVE2 narrowing section
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200417162231.10374-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <695f5339-9a21-ea78-f842-52169027e86f@linaro.org>
Date: Sun, 19 Apr 2020 11:28:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417162231.10374-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-detected-operating-system: by eggs1p.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::436
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oOwa3km6lOA5

On 4/17/20 9:22 AM, Stephen Long wrote:
> Submitting patches for the section 'SVE2 integer add/subtract narrow
> high part' for early review.
> 
> Stephen Long (4):
>   target/arm: Implement SVE2 ADDHNB, ADDHNT
>   target/arm: Implement SVE2 RADDHNB, RADDHNT
>   target/arm: Implement SVE2 SUBHNB, SUBHNT
>   target/arm: Implement SVE2 RSUBHNB, RSUBHNT

Thanks.  Applied to my SVE2 branch.


r~
