Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp149799ejf;
        Thu, 22 Feb 2024 11:25:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZAqctTizXalsbbyOjA6D0ZnK2HekWmGt1eCIXzj35CWxeSEVb1QUTLnkUR823/Muzv8DNdU9MgkFYykm0R8WJ5CVz/xfj
X-Google-Smtp-Source: AGHT+IGuBXAvjz2k/wbSgxMRD8kUkUJUzky7JNCSCfFt3Kz0C+sf2qZx92X9l5NSEvYZX14dkype
X-Received: by 2002:ac8:7d03:0:b0:42e:5cb0:e587 with SMTP id g3-20020ac87d03000000b0042e5cb0e587mr68885qtb.44.1708629953286;
        Thu, 22 Feb 2024 11:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708629953; cv=none;
        d=google.com; s=arc-20160816;
        b=BNPsRJGyVmbLk1B2w0tNWpV5IC8N/68B4+XNwy7tdoCopogljkdlMEH7ds62EoQjkn
         ccv+FIwGmVdxkrG8mejrlC9epN/K9iz6NfGxZvU95/9ENYL/dIcX6cuNF8MbmD4I281r
         sasyY9TLuPOJsfozbjMkFf4LuT6OKECZ4rZXOPn6X3CbP/2WPRE9IcWixOVb7nV1IipF
         58UcwIwMnJI6sn/CW/U3OLBy4kWXYkPrYuFI5pq+XHegNb4kh9KGAmLAPgvriUgokq6i
         1/LNf5DrQixoCBimpZYrUt//g6H6SaSp9IZivThDlefVWKt59TNU6ld0RlVLhgSrFsWN
         J1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=oF4lpGq2MDfl+zCgIfXJbR8cwX/+n0Z38trpUl0o/OU=;
        fh=AyCbu59SG5lEKqD2L0ttztI7yjzt+79o1qmLLLLwL70=;
        b=ypascxMGA17/kM7JGg+hI/226XwCCTD+OE6Sf0ahJayJs+4r0T/SjljNEjdMvqTBRe
         vOVW+yR11xSY72TgNuB1GgQS9/yeRUdC3Bdee2sNH/R4dNlq7ZDzg49iuaN4dztwgIPF
         b0VSSOrQ27sPpzoXIi29oIwM33CR29Eh5jbq+i5PsouGM0kTStiNsHTV/WzQCC+JIT2E
         MpalbPURnFU3yMF1oXB0kqyv496igMRkI48UvLkvg7eM/pj7dYsIxysRJrmbWsz4BOi+
         TdbRVJXFcUeZMk+t8dO01kzxAFnehFnBFudCVJ9ZP1YYrGUtqHsflBfjX3apm+j49wXv
         Ig6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HADGdSep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr11-20020a0562142a8b00b0068fc29395dfsi1417277qvb.409.2024.02.22.11.25.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 11:25:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HADGdSep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdEhN-0001it-1K; Thu, 22 Feb 2024 14:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdEhL-0001iP-Bb
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 14:25:35 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdEhI-0005Fd-Tb
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 14:25:34 -0500
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5dca1efad59so41350a12.2
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 11:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708629930; x=1709234730; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oF4lpGq2MDfl+zCgIfXJbR8cwX/+n0Z38trpUl0o/OU=;
 b=HADGdSepPPBWimeGbO23qMwTKauAjtMKwO/SgSiZ9zhILG8jK9WH0MAz6zSmgZB4mg
 UWzjJkMIYJtmieSddcQcJPW86KYNoo/uTA/HxmFakIfpaN0qxZmyerOOsOThrV6neAiM
 E0UyjiVI5K0smgZ579/e1FKopxtLU85DhX6M5cvfMb5FPUEHoa+ZMKRKyBFaJxxYChzk
 JSUc0jJE4mDBp/KdNd1N8sHvfPaMLNQOGj/O3t3DOa0XwI/9sRYjM6JdLQiViDuR4uof
 z2hWK0YKf9vXroJ0Cc0IbYErYc7TcuJn4QMNKnLEokj6ThR8XlBd++cAMhc7dJdwHDJL
 DtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708629930; x=1709234730;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oF4lpGq2MDfl+zCgIfXJbR8cwX/+n0Z38trpUl0o/OU=;
 b=Xs/gPNKTRnZ7HTsP4DXp/P40w1AgKcl0pOyhkR4rlexdxBdDJNpdruoiPtHinpia5H
 x5DdKkbgf4kZ2XjXj6vefTI2TVbr0WVoSDRNYpNd7TT3TPnUoWn9u9E7SKDZ1eSFhhCo
 5gVTS3ndwdxc61kw04XBhksAOBgLs33rlciuddNnzlXyiFfrNRXVdZVqgcRABg1XfrhM
 gekuNDcbJHUjuEMdEL1ISIN+zL6usWKrUGKG4/mhsTGFiT/QNWOfiEUJlYm5eYRXnnMr
 q3t2bHbjKiI5+n85DVdPlu8kEBvvx26kXxLakJvKoofGRnVgDPdkbw5GxBrx5v8QmEQi
 7oWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvyBc8auCZvjF8XjeepnkS5GNksNmNb55567FPbPh2Sbgkbe4pzX07O9dQDB+U3rFCvVA774t31otRdmKX+BMJrKtP
X-Gm-Message-State: AOJu0YyKxUS3lEQ3IZ7tfRiz++89PO2mKG1IzIRJ5XqimeAPY5kK6nMP
 O0q3dvLCz2MFQT/r/o8liC2xmRJSRp9/9GUKoAAFepNVNVzXMEMlTX4bSeSOdiT6EM89N8/aufR
 Y
X-Received: by 2002:a17:90a:bd86:b0:299:560e:79a0 with SMTP id
 z6-20020a17090abd8600b00299560e79a0mr12810306pjr.31.1708629930214; 
 Thu, 22 Feb 2024 11:25:30 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 ev5-20020a17090aeac500b0029a56afe382sm1603836pjb.39.2024.02.22.11.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 11:25:29 -0800 (PST)
Message-ID: <5f72beff-64a8-44fe-b87d-6e532e2b210d@linaro.org>
Date: Thu, 22 Feb 2024 09:25:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/22] target/arm: Add PSTATE.ALLINT
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-4-ruanjinjie@huawei.com>
 <5f25d9cf-3ca0-4adb-860e-71a8fac3b504@linaro.org>
 <7e42f863-0079-18bd-94b5-83f3f40191a5@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7e42f863-0079-18bd-94b5-83f3f40191a5@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: p8aQcjsup85g

On 2/21/24 15:48, Jinjie Ruan wrote:
>> Why is this split out from env->pstate?
>>
>> The allint bit matches the documentation for SPSR_EL1, which is how
>> env->pstate is documented.  The other exclusions have some performance
>> imperative which I don't see for allint.
> 
> It seems to me that allint is a bit like daif, so it is reasonable to
> maintain it separately in ENV as what daif do it.

daif is shared between aa64 pstate and aa32 cpsr; keeping those bits separate means we 
don't have to check the execution state in order to find them.

allint has no aa32 counterpart, so it can live in pstate always.


r~
