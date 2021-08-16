Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1562085lfg;
        Mon, 16 Aug 2021 10:28:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7e9ukRva4cTpSit8a2jJ/IhIzZNeSsG18/UGNBE5XbfL47Rzx0SRXtOpAmOvUPPiiTz29
X-Received: by 2002:a5d:8758:: with SMTP id k24mr11369iol.128.1629134891981;
        Mon, 16 Aug 2021 10:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629134891; cv=none;
        d=google.com; s=arc-20160816;
        b=af0ybevR3U7MW5me69IacRyIAP/8MqtmbaNULYCBlXMDYKqzqzdaf1VCa7aWOSv/z5
         mioin8ez4rKwRQz4jlJACsmYXT3DuOuuB5EPMbHsIZ88DK2jIIIJ1Jl35/zKFjOE7mnj
         j97nLwzzQMk8heP9F8VbcJJwzv2J1HqqbqAWBTlpx9kLOUR1xjN0XCbJhmgteTj949ql
         9vJsRMUbZ/aK3R7vUoE9Ls0Cg8ghnwf/mK05iyHlq1HoAXKZJy75N+FkxeH0L+J80wQj
         KiCn1Jb1/NEtOfOXxTiWLSyTmdesZXgrMkmNk9LspEYqHJ/lhhHTgqu0qR19edPaSPgx
         9oEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ontMa0tOCRsYA6EQA6gKHTb6flRqUYYajy+GePYCesU=;
        b=cVRHJK9NcYhDy+MqtCp5aWlZH3nO+vomkxR6dzNhw1+YLz4y5l8k7TAzAH8kGavCdM
         4uy+PLvs1ZYl+6pRXctiCJqMy6gK0lgpY6GBPg/yFnAJlo9agop764kfXVUKkVeAnlae
         lSCy83CuMxb3NctBXK28+nCjiFrDxK1pxYvutvW7437iCiziyjRAqcS8KWa2CRDTzrLU
         dQkLZHmJs5rHvtr+5yRfFNOiZmho0UOsDwMbNFUj70VGbl2T33ElD46NcNCTAHnB/I3D
         BiJtepVYD/DofM9GU4wTLBgnjhFdWntVv1ZxDMIbusQYv85fJhrcAOJDmxsTnLk4T2Xt
         upgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YdVsgpd7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q16si12301791ioj.19.2021.08.16.10.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 10:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YdVsgpd7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFgPD-0007Bd-Bu
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 13:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFgP1-0007BI-64
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 13:27:59 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFgOy-00052R-PY
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 13:27:58 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so15281645pjb.3
 for <qemu-arm@nongnu.org>; Mon, 16 Aug 2021 10:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ontMa0tOCRsYA6EQA6gKHTb6flRqUYYajy+GePYCesU=;
 b=YdVsgpd746/rNhhgwDHn9P6rlv8uuHrMUhyslIJ3+08bs+z7Qfu0P+UBpmIdadO1mC
 dbSKwRwRknJ0rR8/2UR9b1PKCL/GxUWOJDE1qEnzV3nygmvSlONnYHF3iCi+CFqY7joh
 2PR8f68AnRS9RWxAA3AN+LasJik3XpkxBWccMtGTiA/MZ6LRDx6IqBv5Ervr7jpirok4
 Nces/kAvlhNfTT22pNCxoMV/3mjOc2x/9b/3P9Q11bFOPSQ6Rht2PTK7A1jzSgk6svHs
 kZvlh8koMPeGstJB026weQo5Jf6EKQeP6olIp1mlwQKMQok3RWh+ked9l/spGAJuE25O
 cNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ontMa0tOCRsYA6EQA6gKHTb6flRqUYYajy+GePYCesU=;
 b=NZAE2X6G7jNErhALG8z1IjsBSfLma7LGcRBSBYRyQ3c2uK6qAq0UZt4pGnk7JhP6Id
 r5jL44si7zfZHxjbgiFlF9MWh2GuIhAXmSUu2yVXMgVaH/fNd5TwGu+Eym9aQV0T2U8O
 aFO0IH9LMDiU9Bc2kexSunLxCh3tibJv9BxzIGWaIdaZOPuuHOhe276qAvqGeokmOYv5
 041Ar5bJC3mAEBKh6t/yYZxvC40XLanqWyU9DGSMfaxiNHeejF7qeVn8SRWeFJL9sqSr
 h0U+PIAk3wqxOmeI9mA4ttb1iTms/5w5RmyAJHJq+MgsvINfQ8CnqXy8jKCoFM1od6QW
 zxqQ==
X-Gm-Message-State: AOAM530yrHjXu8SP+P7r3HWRX12gWKLvl9SKN+Y4mVRCql7ZT083VwVH
 HZPR9TCNHiBYuNuW4o7ESxzjUg==
X-Received: by 2002:a17:90a:c244:: with SMTP id d4mr250551pjx.38.1629134875025; 
 Mon, 16 Aug 2021 10:27:55 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j15sm11960995pfh.194.2021.08.16.10.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 10:27:54 -0700 (PDT)
Subject: Re: [PATCH for-6.2 5/7] linux-user: Provide new force_sig_fault()
 function
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-6-peter.maydell@linaro.org>
 <3e3ec979-4348-c3b7-1210-50dfa66c2b7b@linaro.org>
 <CAFEAcA_QCLKPKx41cknfGRrQ3r8tK1G7HauRM+XEzns8YxEe=A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <097cd1f3-8922-ae6c-fa65-c694d1ccda69@linaro.org>
Date: Mon, 16 Aug 2021 07:27:51 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_QCLKPKx41cknfGRrQ3r8tK1G7HauRM+XEzns8YxEe=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RPb82wXx+M6N

On 8/15/21 11:03 PM, Peter Maydell wrote:
> On Sun, 15 Aug 2021 at 21:10, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 8/13/21 3:18 AM, Peter Maydell wrote:
>>> +void force_sig_fault(int sig, int code, abi_ulong addr)
>>
>> Better as abi_ptr?
> 
> I followed the same type used for 'addr' in the target_siginfo_t
> struct definition.

Fair enough.

r~
