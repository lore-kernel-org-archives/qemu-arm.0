Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp9378lfc;
        Tue, 10 Mar 2020 15:55:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvbWtQqU4zQ0bXK09FULy8y/6Tv/IbJ2yJ+rjM2iRF/8wxY1iMCPKmPuwpbqYpFGkgLyCd9
X-Received: by 2002:a37:8087:: with SMTP id b129mr144501qkd.465.1583880904971;
        Tue, 10 Mar 2020 15:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583880904; cv=none;
        d=google.com; s=arc-20160816;
        b=TcMCDxD+lXvH2DS35g0y7I5B6Xpgy4Afb6MtOl2kyoGFKTiUzlXrCkuIr4SwvRi65g
         PH14smxHlrytPC442CzPWrjC3CFR4UCQoOucidh9RBnGaJPEg/+vCE5L0iNyNqxg8MPQ
         JqWTIRY3cEeLiNcpaiAZN/RfrOuM8nVDYLztczYZc5A2TIDLMEwZgabgMf6sfEyTme1c
         ZEJECYboGGxezmN8tLuxkhy26J6alLfP6YC1SWzcItpHNoOHXoo6rXxDSL9be7ILxv3G
         bsRF7M+RIqoCi3E39Rm2dgD0Iorr9X9JUKsoV/eF5Lq3ZIZD4BfaWqsZiteT3Ey/ucFb
         Z5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=EkzEAN9l34mBapktgHYqs/4Kbt4lUXuCRr0V2kLgHbY=;
        b=J36aoexyFIE4GMNKByb1R0szZnn7r6vj+RK5n/6kkushlCXWjLx++xuWg77g58T9SC
         SqD/zEN8/ir7McoGzP1rg9uGGMO8hk/6fggf0yGfZT+lZuZBDyo8ebbcKOlzMa3JNQR2
         Hz7dPJskV3yynZGOJx+Xwg/dyyqAwRcicsIcPtti+7JlUn3S7iKk2MS4JuzXTsz+u9h8
         0vFrlSriHP0dayqc5zt4jBjS2/oI4RZHMmjl3PkHB+Wr3wsLG4Wp5yRAk1CN6Ui5G9X3
         bmYWguxK7VfZfxnGLk9njdrpeKRUnwWDmTyZiQt5kQI7GtYhD2RsBFPZe4GkFlVVPEuL
         QhPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bEELslMb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12si4357361qkm.9.2020.03.10.15.55.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 15:55:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bEELslMb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBnmC-000350-C6
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 18:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jBnlu-0002wT-VR
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 18:54:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jBnlt-0004OM-SU
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 18:54:46 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42689)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jBnlt-0004O2-Mi; Tue, 10 Mar 2020 18:54:45 -0400
Received: by mail-pl1-x642.google.com with SMTP id t3so120252plz.9;
 Tue, 10 Mar 2020 15:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EkzEAN9l34mBapktgHYqs/4Kbt4lUXuCRr0V2kLgHbY=;
 b=bEELslMbu6zzWTnSbSR2DsvXZrYKZEUR4azXombYA2PGsnOSsFavcG/3ItUmKnqNIM
 CoCNL3eaELRepF0z7R6JYGbJtCxyhTWzP/MUtmtpszRrrEhM/TgdzZNdHyJSGCZeCsk0
 S2JMgBoHKWaBVFHyszlXy/BqHHoNkV/giVrK5L1eBsqFh5EUeNNQwqLeYgmpLrLHk/02
 6fER7fEb4H9+vVokGSKODEqUEdDpqenj86tGlrx7BH/7N95pksWhwmIYNYV3A0zBb5t/
 yK8jIv4GRqHEF9FeH6nW6Nw1sPe928v41fqyZkLnTQC/4aT/nVo+4gZKk9GJs07xr2ua
 exTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EkzEAN9l34mBapktgHYqs/4Kbt4lUXuCRr0V2kLgHbY=;
 b=Hmu/Mq/j+FBkGUYnSY8SSwebViYMRORHNaxTmUY08LqGwlWFl8bipQ1kvr2k/DRRbI
 pwAzwSz92SPslu0pVzTAldiSNng9vef7y+bTu4GUVcDLwSpOSEvibRZGvxpVJ2WRcrB8
 5t7CsQ49pFi311C+VsclYf7BRQzzJG08vcV6/LRLaK11/3NOasWwM3g0RmIDnxcAPJxq
 woX1+0RYsDSKht3VNK7TVSDGMYz5qFpcB6rt45+WimAY6Ph5YR37Q3oTGhsyXJEnzqqf
 jF47vJBe6br26rCesb9/VYMaUEmTgoGCS86FOci2UXjfq9b5W7seOxpxwBWYEMeeS9X3
 6R6w==
X-Gm-Message-State: ANhLgQ0ycwuW+AVvqNI6oTrAEO8RUnKLCl2sR9lYZTAK9TBM5eCM8rMC
 KwkPWp/kbam2bESCM0CxJMM=
X-Received: by 2002:a17:90b:4c47:: with SMTP id
 np7mr247017pjb.140.1583880884505; 
 Tue, 10 Mar 2020 15:54:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h24sm7567370pfn.49.2020.03.10.15.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 15:54:43 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] Wire up USB controllers in i.MX6 emulations
To: qemu-devel@nongnu.org
References: <158387822543.945.6014167629593674326@39012742ff91>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d07cc722-247b-4976-dd3b-00e3bdd5c808@roeck-us.net>
Date: Tue, 10 Mar 2020 15:54:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <158387822543.945.6014167629593674326@39012742ff91>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, kraxel@redhat.com,
 jcd@tribudubois.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iWc20AdB4i9t

On 3/10/20 3:10 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200310210434.31544-1-linux@roeck-us.net/
> 
> 
> 
> Hi,
> 
> This series failed the asan build test. Please find the testing commands and
> their output below. If you have Docker installed, you can probably reproduce it
> locally.
> 

I have no clue what this log tries to tell me. On the plus side (well, kind of),
it looks like other patch series experience the same problem, so my working
assumption is that this is either a test infrastructure problem, or that it is
caused by some other patch which already made it into qemu.

Guenter
