Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp309056lfc;
        Mon, 2 Dec 2019 10:09:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqxb0Zk/LPzGsrjpCAJMtBWJA2Mjz/vGCQpYQLuWcssxmSCqQ8D7jfBbpGRXnyHnAGhTYbde
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr226278wrn.214.1575310176730;
        Mon, 02 Dec 2019 10:09:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575310176; cv=none;
        d=google.com; s=arc-20160816;
        b=wsicW57N+dE8yPimZhXzOPoaSsrKD1plHJijOigxW2vQ5/vm2AZQtzF0knyfAy7Gez
         FDdqrZJDLavjY2cZKoV2m+DW1v4H3lTlrDxnSNOpWniR/Xb+5ytiVX6annDEuuPd+CZB
         3uxe7AzyH0+Kf2klTMBYhKR6UHowZZQWeIiN0gZQ87d2eHmHZgWKlgxi4sQS7YZpUMkB
         BbLTFAcelkHwKPNkTc8lB62VIAAEon+pZvBYF81rQLq8C6zm2uA3V4PCqZtjB6tE8vKC
         OE2Co1WrgfLOxxmWlbCFtVXmXMrzVUFerzYZkHuaXiXuJczkpI06+Ir37c7gtVVcOUfH
         QFng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3i0gqRIZR7MOB9y3SV/8qk3Dk62rM1kFev6OWDH78cM=;
        b=m8BMSsZtzvQZ/G0jb0qwovr46uj6EoQ1iVXBqPfMLMb2s3pxVEGeMi/roJsYYETw6Q
         lt9FLKCwou3luRlyUWRb2bgEroZc1crH9WyH4H79yJge4Z1ZUQ9pSCKgq7CSDZmyNrqZ
         s0PrxwFz3xfz+MbWR47xh4MG7mMWm2s0F1yD62zPpzGRJKGIzO3OKPyE0NGE2iaIr3l0
         qSufFHyliiFYVtuqHSjNK9w0+LH90OgfhkIb/nW0hp+fhBEMHesEeAy+u3GRrLHRcLUE
         +8wkVneJi85LIWRop5fnCG2bSNZM091B4UAR1HiCyc2OsQ5fKoas4uZoRpXzm8OM2o+L
         NtPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QkJA3Wi3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm19si148496edb.214.2019.12.02.10.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 10:09:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QkJA3Wi3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibq8d-0007Ht-P3
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 13:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ibq8I-0007Ff-PO
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 13:09:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ibq8H-0002J5-N2
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 13:09:14 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35586)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ibq8H-0002Ik-FZ
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 13:09:13 -0500
Received: by mail-pg1-x541.google.com with SMTP id l24so47980pgk.2
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2019 10:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3i0gqRIZR7MOB9y3SV/8qk3Dk62rM1kFev6OWDH78cM=;
 b=QkJA3Wi3kkcLfdbzcYxgjfXrzEFTN9ytWm/VKpj/4nKOPvT7yFXiWYn+PhQSMW+zvC
 ouUAAtOkF5+DlHQETtgagHTp/uTFdCZcxbbzZiwqoT8zB9vErcWz8lzc0PBGDCl1fMU7
 wIeh3jAcl7M972vWyDalsRso8qCMMZCvvksTGaKKRRg427I6Eg5h/pwkmdmso/xF9tbs
 JCRiYQyaqmv24HaLIpMgZAiVAaj5M5Ij7WX1j+hdPWPJj0cwQUTiyjPuSUwIJqucSWhG
 bcVijfTahx0x57HZkaTq1rB4Ykq7IC1io/dJBvpThUrkzHJWp2qW5CLiw1Z0TFFXGLfc
 CrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3i0gqRIZR7MOB9y3SV/8qk3Dk62rM1kFev6OWDH78cM=;
 b=g0Dwyf1g5+gZVHSms7kBl2thiFJNPMUbU29ThLaKA+WRQTB4IcVMjIR0YgdfTwV7sP
 csq73tYJ1z3tbMQL791sNsmR0eaQZ0MPIWG5r9AyVFr2WNY6goOOY2GDRQ7U/BMeXEF8
 GMlr13LhfejvCk7QU7zAsPUhp+Y7UF/KSgPAG6RuPezSLvrFYXdC1rmKQJkHg2UpMgkx
 tGXStqMVJ9rzuKw++B28kqaaH/MFDSgfZ8NjrOpVT8rBc81lE+RxNa3eOwoorfWtpsOS
 04mzuFpZVIgiT2UpHYyAFlhbC0rQClitCFEV8bXfnnBgqwLjv2rLN/KgWLX36et9fnpS
 PQJw==
X-Gm-Message-State: APjAAAUbp3Aa6S/XvvLsDdxYZol7bZCRMyZH8MR2+oNJFGUQDcTNnd6u
 9lAiHpyIBBSvDVh03AmLebMeng==
X-Received: by 2002:a63:4946:: with SMTP id y6mr278236pgk.377.1575310152321;
 Mon, 02 Dec 2019 10:09:12 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d85sm128126pfd.146.2019.12.02.10.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 10:09:11 -0800 (PST)
Subject: Re: [PATCH 0/4] Expose GT CNTFRQ as a CPU property to support AST2600
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20191128054527.25450-1-andrew@aj.id.au>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7aed21dd-a0f9-baf3-70e8-023dcd16ce6f@linaro.org>
Date: Mon, 2 Dec 2019 10:09:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128054527.25450-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: peter.maydell@linaro.org, joel@jms.id.au, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rHPHtAxB/74Z

On 11/27/19 5:45 AM, Andrew Jeffery wrote:
> Andrew Jeffery (4):
>   target/arm: Remove redundant scaling of nexttick
>   target/arm: Abstract the generic timer frequency
>   target/arm: Prepare generic timer for per-platform CNTFRQ
>   ast2600: Configure CNTFRQ at 1125MHz

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
