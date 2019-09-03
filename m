Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp794031wrp;
        Tue, 3 Sep 2019 11:23:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwU/NPE07S7yZAZYMEudjiJ7ACu5UstZtd6AkkRi2AwjLcXbL0CAvS3xErz0LtfOkSHozuj
X-Received: by 2002:a17:906:4056:: with SMTP id y22mr8666792ejj.230.1567535010306;
        Tue, 03 Sep 2019 11:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567535010; cv=none;
        d=google.com; s=arc-20160816;
        b=Cn88jb6qQj7BzZ4iAcTUj8KBwK6VhtfLIQUOyJZt2/0C6scTm2NoR1oQOLCmy3J2VR
         b9Z9F4zEmdhoMquHR5ZlFJMT1AkyQLRblV3e0ASSFEuVdgANA8STfL1Ts0xOHoRcXktU
         Sn8NcnnGM8Lprw5hXm6DjMDTonN6syxpDsK4PNK0YO5SbGv2yQzptBUQnd+jjVFwpHXf
         a14o/BK0u0nWj/v64yZD0nYiCN3Kq3QgjIx8nqHDo1YXzZtTSH9BEBbUf08a5e7rNiDY
         TE1kTNpn1xNHbf96j3QsOgl8dSTTYyCYuiYcB986jislZDGbbV+tNPcyQnmEpKh9J8Jf
         qaww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=+VUwAlVM2cI1IKg+ezBoLvZ9Bv6e+ecmrYteWE86y0E=;
        b=zfB6swboErXNGYUT37cr2uRUrs60/kGNS3sDDbDjxxwDcRXjFT8aSyld5HX1MjKopU
         vSyVgECZe5fDJcQfoIx+ajZxCzArh3k6853vfv2Q0O44haovqEeFpTwEV5oLVeAj7sDS
         kFI1SVcw26Q7LKe/UxdCxWvRL0VltNz7Pt8a4T3Mv2ISkniGhSUGhgAND2/zo5ZoaiPN
         7hMVrdjyLGYr9maNmbq3iR5CcU6Yq74jqtcRCGFKacaMtfUkeqYG05OTWMC5SgFGEBuJ
         qdEkvuHeyJqXW+tpKNSCoRsrLxFlx7ecO7aCr2lUTQ2MlDjytIV/HC4haMSwGgRyz5Wg
         umCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=prC22F6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si7006484ejb.266.2019.09.03.11.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 11:23:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=prC22F6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5DSj-00022V-9m
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 14:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58305)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5DSU-00022G-0Q
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 14:23:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5DSS-0008PJ-Sc
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 14:23:13 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5DSS-0008Oq-KO
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 14:23:12 -0400
Received: by mail-pg1-x541.google.com with SMTP id n9so9605524pgc.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2019 11:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+VUwAlVM2cI1IKg+ezBoLvZ9Bv6e+ecmrYteWE86y0E=;
 b=prC22F6I/2VPj7J9DvqwUqgaJcT2Ax9D8TPD24Vn+3STBCVF9EGZYx1gqGDHCI9Vla
 5Zu17+DSTxjPRLUROez1BaLWd22cICcqTr/b2yrCsfxLByaVGQUFlTFbw+sVHlQAr8uG
 BV+8b/5pufA7gTVP/NhUB64Y/CKpuB22q1DAV4SVWcoLIpqwtafLEs7oZLsVj9j79s53
 VKdDtmKT7GfLz4dh014CCvafX7h1/TlJfoLqP4eKw6fzwqPj05W89eW3kMDm1jmqgAzH
 xB5fMMnkZCG9zZke622zbT1M1F8hE1geCpVbBG1gq+t+T15/7Fc8hhz88IAlcw9CoWFh
 VZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+VUwAlVM2cI1IKg+ezBoLvZ9Bv6e+ecmrYteWE86y0E=;
 b=VBDconbm+RP2LpyZs3Y8L795SDkpZVJY3IaBAdfC/qaJlgMmLrrnvsyevDcUWEFz5j
 I3w/EJ+YQLENsAPsgr6q6/3fyzguFlB1QjWkLfdLJzHjYA78mA7W4wRdpaTpMADEiUXB
 67VBaIrNifP1XcJUuMqInSHI9qZ1Lr8zm5mtEXzdkHn+cI7eIkL0278QopBkfoPHhkGS
 uYIZgSoiYvuDoUmZjidtZkT+jNuYVPgA4j8dzEV93ON2RA9Eh7DfSRRHJ6cmK3GQM77m
 5h6nrI4RDjlC+eoT5LllgObcCcCZ69rUicLSoW38wVivtuG8CFj52uP/8AVkq/a/iRjR
 800Q==
X-Gm-Message-State: APjAAAX2o97Dal3by9/84+wzVgd2ulMZZ5ZkfTLCY9gtx+bwzpl4Ppck
 y589VUKnlmmKHWRKubOmyINrBSt6vic=
X-Received: by 2002:a17:90a:bf01:: with SMTP id c1mr709756pjs.30.1567534991103; 
 Tue, 03 Sep 2019 11:23:11 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id z29sm26893145pff.23.2019.09.03.11.23.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2019 11:23:10 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190903154810.27365-1-thuth@redhat.com>
 <20190903154810.27365-4-thuth@redhat.com>
 <bb6eb994-532e-7afc-bb27-aa5d56080b50@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <42d43c33-e316-81de-4ec6-13c8a6d04660@linaro.org>
Date: Tue, 3 Sep 2019 11:23:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bb6eb994-532e-7afc-bb27-aa5d56080b50@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 3/3] target/arm: Make
 m_helper.c optional via CONFIG_ARM_V7M
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wjoowNy9hao5

On 9/3/19 9:19 AM, Philippe Mathieu-Daudé wrote:
> On 9/3/19 5:48 PM, Thomas Huth wrote:
>> We've already got the CONFIG_ARM_V7M switch, but it currently can
>> not be disabled yet. The m_helper.c code should not be compiled
>> into the binary if the switch is not enabled. We also have to
>> provide some stubs in a separate file to make sure that we still
>> can link the other code without CONFIG_ARM_V7M.
> 
> If there is no M support, the translate code shouldn't even generate M
> calls, so the stub shouldn't be necessary.

No, the symbols are still required for link.

> Anyhow I guess this code will be simplified by the ongoing decodetree
> conversion from Richard.

No, the decodetree conversion will not affect this at all.


r~
