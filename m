Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1109806lfm;
        Fri, 17 Apr 2020 16:58:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypK2/BMNugd0PfT5Zw1rYoWOSVI4hHRumjaoPZqYKTZmr9x2ByQq/oyft7MP5so1v2nMHPco
X-Received: by 2002:ac8:7758:: with SMTP id g24mr5435790qtu.85.1587167926409;
        Fri, 17 Apr 2020 16:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587167926; cv=none;
        d=google.com; s=arc-20160816;
        b=PMFBJhXd5JG79MtX7FXzaQ1Mg4i5GsH+ZRwsyXclFJ1FCZVHEnEUbPewA6kZ+RI7Se
         CiKmIZiZi9An2udbTEJlHYjPOuwGA2VEgbMGBswH4a4ilMzx/3f9HbSEXHf2Nm7B1e/g
         HMJHi3K0NIPQIF0ira81CIderAT5GCOlIzyL6B+24bM9g/+GknSjmCDtogwD9w3Nycb5
         Kgrxxdi4R3Y4iVvbxIbMrDZorfglu2Dr32bvc6T8FL00cY6raMOsayyXnpsU5owdNxvT
         7O257peCt8yfs3z6/4qbsfLkdJ00jTq1VcOikZNf6A8Ve4DeuF00i5MeA9VNeyLHWiln
         Ru1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=1+biJZoyR++xcwwn8CiTnOCnMfA6edDBOOVD4wdp7Zk=;
        b=rMo2jbL8/joDO9d4xL/F502qP8WEYF5xLmXN/z9iYTfWAcwKHEkopHLgDRWPode8HX
         mMwGImUx4oEYOp5Dv/JeX66/WMVFGqly2qjGxkwjB0hXYUQe4kU1XRYM+tm+XP5YUosz
         gE1x0q199McqozJY2W51y71EHCBea3xYHijn8IP0fb9r4ghNYR4RrZiYZiOu6QtV2Yiz
         r1Edy1NZ0SbmQTMSyGmIMlIhKCFjJijNB7R/k9tK447pveO28Sl2RPZCkI98GUzBDSTJ
         zDlcRnW+tldHLy5Fog4gsZjykyNJx/ulRFb0v+Dc7DPaozy3wR5C8wAyu3gOweBY8qqK
         KlGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KyXtWAMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si13794670qka.161.2020.04.17.16.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 16:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KyXtWAMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPasf-0001Bb-TP
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 19:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59581)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPasZ-0001Az-8D
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 19:58:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPasY-0008Ai-09
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 19:58:38 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:41368)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPasX-000895-PG
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 19:58:37 -0400
Received: by mail-pl1-x643.google.com with SMTP id d24so1538046pll.8
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 16:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1+biJZoyR++xcwwn8CiTnOCnMfA6edDBOOVD4wdp7Zk=;
 b=KyXtWAMzfb6S3M+N0BCt8ZcTa+yrzzHcuUzUMnQH8Xe2k45RsE2CZCr9vL5U3pRWL7
 5qyByvY0V524bR+PXdYXEPR3ICzeT/aXGR3p0WtJK86dj3Kvfm4ub+NrgwYauRDrSPXI
 WReqjMJJJ3JT/wiwk7/XHGTn5JUC2z3oYLNiXBsDcrdEIUu7bBt6+Z62h4AWLxm9FP8F
 INI/a7dcs94Zi3L7r4YLfeuiXI908vB7btBlt42p97GZxV1nUnLqlf64L9rnNQZ4WZI2
 BRE6sPeDAruy10GRna+kb6rCbJ8QWDVryT8A1Pwx9GONICAWsYtWQmH70erLos6XlGBk
 TS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1+biJZoyR++xcwwn8CiTnOCnMfA6edDBOOVD4wdp7Zk=;
 b=slxWNraLs+tISGwaFIM+Xj0Wp9BWMrwPjSciHSFPjUl59ECUtRkkbsuz242qnX9BCj
 me5/F2JdIoV1RqQkO5qOYkALa/FOTUnx4z5EjNbkx55FXR/BTALknHCABegGgM5NxkCu
 jcjG9TIHlAQ+4LYFLN4MDxzbkOmcWpwSj6F2DvPkL165cBFO2UaQe21NNmDmLsODBsq8
 /L8PB3RV59OXL6n88hNwNiOZKgI2dywLBb32VrOv0AiyBxZbWgKzQ6618oQ7OhmsJr0n
 o7B72EX63kk62JlAtHEFMI58iAfwQ1EV5mwxebKjehISqbdButI1f2uUOewsCnX7BKFB
 IM8Q==
X-Gm-Message-State: AGi0PuaSVnUEr95R6aRcgGpmYrUHTbG8myGXviYvb5XhksanaBil5uCz
 V4PSlD3kszOy2nQBJDCyh3SIrw==
X-Received: by 2002:a17:90a:3781:: with SMTP id
 v1mr4838285pjb.83.1587167916310; 
 Fri, 17 Apr 2020 16:58:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id p8sm6797085pjd.10.2020.04.17.16.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 16:58:35 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/arm: Implement SVE2 RADDHNB, RADDHNT
From: Richard Henderson <richard.henderson@linaro.org>
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200417162231.10374-1-steplong@quicinc.com>
 <20200417162231.10374-3-steplong@quicinc.com>
 <7593864c-828f-5c03-c3d5-8ba8eab8cd6a@linaro.org>
Message-ID: <d2c568ef-c87a-3300-17dc-cccf83c8f12f@linaro.org>
Date: Fri, 17 Apr 2020 16:58:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7593864c-828f-5c03-c3d5-8ba8eab8cd6a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-TUID: mnATM2tS1hIO

On 4/17/20 2:24 PM, Richard Henderson wrote:
> On 4/17/20 9:22 AM, Stephen Long wrote:
>> +#define DO_RADDHN(N, M, SH) ((N + M + (1 << (SH - 1))) >> SH)
> 
> This formula will overflow.  See DO_RSHR -- with some added parenthesis, we
> could actually reuse that macro.

My bad.  While it does overflow, all of these operations are truncating not
saturating, and moreover truncate to halfesize bits.  Therefore overflow
doesn't matter.


r~
