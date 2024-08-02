Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp1272756njb;
        Fri, 2 Aug 2024 02:50:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVVns5Rq8U82MYKLCbMujvCmx74GDXvoGHKZYddEbHqVpSwHy2K+CT8503f9TzqgHvpWdTMgmfVLUW+PegScNDEiy7zU7B
X-Google-Smtp-Source: AGHT+IGr6eVlMxdUsZc0PhACa2ve35nPU2BIQmCC9rewzMsDcA+PYhU5cPrXnjiJxmhW6lP3XFVE
X-Received: by 2002:a05:6214:4a02:b0:6b7:ae86:e33e with SMTP id 6a1803df08f44-6bb98476512mr39903766d6.37.1722592226096;
        Fri, 02 Aug 2024 02:50:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722592226; cv=none;
        d=google.com; s=arc-20160816;
        b=ljU+7crN5cv/NB/alYwykucTrGIcALf5cPQ4zGY5xyE71mBiadA6bvRo49BZ08z7sz
         PnPG+2h4aHVc3IOGuF/sSj1HnM6JdMwGVO9xb4SKxLMaQoWLGlRbE3cwNfREAd+OXEK4
         a3tbx0CBeSIn2QlFuuuVTV8tB4LZUnnRzq2s3iHfccizjwBSa21G0jKLANEes3FGW5xR
         5iY1YIAGkxJoxYgR5jb0W28/aCYqSLBmqjj+e4OiHFuq+sTa8UNpCnGbsGT1GpQU9enI
         kQkkyGMCDErFSUsG3tz+fJnGBP5nbixZj6dGDfVwKZpwekgQuezzTafZ9uunBlztWVcr
         IqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iL8zIXOgW+JeIC4273pCkQw1ENrYCzK7uuoMXuKFmLA=;
        fh=8F+cbAUx8oHET4dfM0pZmNUhFJZThzMxUFn1N1MNn+o=;
        b=o87SmkACVV0j+Lmw0YXm/r+yudpVntpswJhUcO+Gs/2QcDLMlWZkKrLPjcc5DONhSJ
         4NsvvZX00J4V/RH0+I68/zib/76sVvLizYAMbG4z+BGxLD/u0jq7zodcQq0RJENS1wn/
         FRetFA2VsQv3HxD5gsp/2UJxPMY1Zcn1tjei76IetaPyWaA/sLheVPwuup+PFMMD+L7G
         k4tKL1k+qdECBSSMJrTKMr0A7c75nQRD5b+8/lrQD1KUD3KKJTi7RCFyeBcKMMxfZOjl
         FIUzq9FOYRfc6F3UvE1bEA3GQjxIpciriooM/5dvl0ace3Dbm898xjqidGVzwxPx+X67
         kdqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DRkdSo+Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb9c8c84f2si14118006d6.475.2024.08.02.02.50.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Aug 2024 02:50:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DRkdSo+Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZovP-0007EK-RV; Fri, 02 Aug 2024 05:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sZovN-000752-Ip
 for qemu-arm@nongnu.org; Fri, 02 Aug 2024 05:50:14 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sZovM-0001WH-43
 for qemu-arm@nongnu.org; Fri, 02 Aug 2024 05:50:13 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-70eec5f2401so5172382b3a.3
 for <qemu-arm@nongnu.org>; Fri, 02 Aug 2024 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722592211; x=1723197011; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iL8zIXOgW+JeIC4273pCkQw1ENrYCzK7uuoMXuKFmLA=;
 b=DRkdSo+ZAveQ1o+ZLErpXNs/SDZD5zvB4VRFZdRaT/Rgn/qEPL2+6T+GsuvFyHzxvB
 z3aBXLHEWQ4Ibkzvk3L/6SDjzJKt76+2xDmdoaD2f67dFEyXQrTpVF5EXpYe2Lh4Qt1y
 5XB+2o2Qt4f+sD6qM6j0pIa1wwfWvned8WGeTG3qnKXAD5OHH2TGwPIIk5sdXx8cxKGT
 5/unQLKFY9v0MkjGMIGOfNHQ89KcxuLiHJpnaxTRnefFHfKCNwTCu+f7It0aNwpgBm15
 V9HYZeR/46QPnQI0ghR5e5W6kTuPcnpMEasyaGbl4NKs4e+2Sj+RwyJnCwwDAYwbcs2h
 AbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722592211; x=1723197011;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iL8zIXOgW+JeIC4273pCkQw1ENrYCzK7uuoMXuKFmLA=;
 b=enqztmueJWh0LDOI1UlfUz8SZeNfzsYIc5WlJ9GCGiuLIgeTXFtsbWUOwZi+1GbaeW
 3QfDEKHXp8w88izFGoZviJXBRImATCQRitjd6CD30a8S+3DDlI7DOONAaFD3ANEbRHkO
 ZjsWzwiPVciI4t1re8HJ36HLCYba+8V2MgLL1+FfpE1iHimozhu0+QmuARinhX3IBCkD
 9S1mO3LzxH3siX4DL6F6G99SBq+33inIqFObKCaDWlPsvpgo6hLHyWTtbebyCvrv+pG6
 JQQdj/nw5Tt+j5orAvPpQ3WtaqmyV0mbVMbgjElwNE+Iu3pYT+Fjgq2WPcqctRv8eK0j
 +uew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlhot1gRKflJgPa8lo91M0/mjJbFNgv0EceXQ02F7HZCl+4uILzH2CgzpND4j3gA3ws/Q7+dAmcIcNEybrE1/3JrYt
X-Gm-Message-State: AOJu0YxIuHSWQuPshbSsOMRa+pWWU8oSPzqF3Y9JYD01xnTEFKGjkNm+
 EIDzZSghoR6pZn3Y83+2UjHVC4VGXKQZBYgCxDgpHx6g3fjyhZE+tHTDbWcYhd8=
X-Received: by 2002:a05:6a21:789c:b0:1c4:a67d:3b24 with SMTP id
 adf61e73a8af0-1c6995cbc34mr4213753637.25.1722592210507; 
 Fri, 02 Aug 2024 02:50:10 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff5905c86esm13112625ad.168.2024.08.02.02.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 02:50:09 -0700 (PDT)
Message-ID: <403570be-bbea-4165-b0c4-b7c5dfdf1a80@linaro.org>
Date: Fri, 2 Aug 2024 19:50:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvf: arm: Fix hvf_sysreg_read_cp() call
To: Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240802-hvf-v1-1-e2c0292037e5@daynix.com>
 <CAFEAcA_-bfGnQRc6cjp8Ej3WKTJGkKfELzv5j3Zc-2vyNHm9ng@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_-bfGnQRc6cjp8Ej3WKTJGkKfELzv5j3Zc-2vyNHm9ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: ZazOWf48B29c

On 8/2/24 18:44, Peter Maydell wrote:
> On Fri, 2 Aug 2024 at 09:37, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> Commit 05b8d7249109 ("hvf: arm: Do not advance PC when raising an
>> exception") changed val from uint64_t to a pointer to uint64_t in
>> hvf_sysreg_read(), but didn't change its hvf_sysreg_read_cp() call.
>>
>> Fixes: 05b8d7249109 ("hvf: arm: Do not advance PC when raising an exception")
>> Reported-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> Richard: I'm not going to be back at work til next Thursday:
> feel free to grab this and apply directly to fix the cirrus
> build.

Will do, thanks for the heads up.


r~
