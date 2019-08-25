Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3006438wrs;
        Sun, 25 Aug 2019 10:40:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzc0ZyW9PO+RxW3O+bixaLwGTMygVmsXbHLB1ddGA+0aCOQrTjvLXr2C4ky9b8FJajOYrV
X-Received: by 2002:ae9:e313:: with SMTP id v19mr13101276qkf.22.1566754836339;
        Sun, 25 Aug 2019 10:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566754836; cv=none;
        d=google.com; s=arc-20160816;
        b=osPCQc5BG3qppgOfWgWHKHWSYYaFyVjSf+dYbLIg5iWBRmIADyKIvZ0gRPjvezyU7F
         XX+2MmWs0rK7rnw7BTolAOe8jcXFZ81BJIkMLFXdRG/ptWZ4DCWAadAH9fO4f0Xar6O8
         5Q9l62qjNVyOI4zJA+/4Gr3ok2du31S+g9B4LrUlxDApinV6wyzZSdvZLYTd/v+m4KJY
         HbH3++oI7DJ4lTCJMzkCWQ0JC61yWeO3JJkUM06IkJ5jzrgrgxc+I/f1zPmd95kEqqk1
         hLsb/TJuw9Pdvo1nulCxfLMyiwrCWBny3bzTdYdRZx2Su9mRPIfI427wQSmGYC7mgFhs
         CWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature;
        bh=sAmuH0M5oHYHZHUYrS2Chduuiio5yOTZOGpIGOAhDtw=;
        b=qVYAHVN2Gt3pEZgfBlDoy3YhmFKj1iDHxMjquTzZekaa0tbS9vtBapwW4goM4rjeB0
         csikA2Ca356CUHEiBAgeRp7dDTLPh9PUlvvpoS5+RdOWS/Hy8Yy7yffdUowBvcjfvB/6
         f4AqJcLWEU8Reoe2N2SAB5H75W5+UZ+FGx13sdzo0IKmQ+knpV7/du4mDWD0OXEN3TnM
         w2rvJqHz31sTgH6nS+nY9RZMXjYC1NygWT3T6gkFsRWnTWxkZu97w8BRKhFedOznusoo
         CDVB2ApPu+PAGJqnp8lssxWmFdHe6KTb3CwKc4pgvtF3DNojuFpW6vR0K2fJDcN4nbIe
         f1Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tMFPxPCV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g34si6768075qvg.183.2019.08.25.10.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 10:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tMFPxPCV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44347 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1wVH-000510-PB
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 13:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1wV6-0004y9-W1
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 13:40:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1wV5-00041F-TZ
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 13:40:24 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:44924)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1wV5-00040m-Ls
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 13:40:23 -0400
Received: by mail-pl1-x642.google.com with SMTP id t14so8658743plr.11
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sAmuH0M5oHYHZHUYrS2Chduuiio5yOTZOGpIGOAhDtw=;
 b=tMFPxPCVq00sKYoVY30VHzUl3V6w2YXcvcPvYzN7b8YC6wMBCLijpJJPTgwYNeuI6b
 C1AzHjYEVeadaY3QtWKwdsBS4I7qPZEPam8QAHBcAsAmWLEGhV9go6NDRBSs5znApPka
 RqLFoHHQlI6OdR53iL2ucjYE3JbRnlbsdXlzPo1oi9o18VtHnyyc1aHQ2s43/AlGldWn
 ZcWiM68wvgR9t/2vvhoFM0Q2WPd7IGQXkvMNtUyYtwCzeQiLUHIClbIREI+Jin0dju6F
 GiAMHLuKy8NMfsgzKkOI3v/5hJlaJRnnzTE4cvAMsHcfLMX1Mstvz13Mqy3NsBHd/3zS
 ixTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sAmuH0M5oHYHZHUYrS2Chduuiio5yOTZOGpIGOAhDtw=;
 b=RG/NvfhA3duP66kN8gbPXTyfH8EmX2H7FuOfbqPUNph3C9HOc4CPoCAbMTNr9ZGilK
 Uyub4kCtu1Szx2ik+YUJlCxZeDxwYwNgj7NC74upu9ylUE6aLuf5KxCGBfTjmuRtCTpi
 6/brB3y0fwzaMeJLr4e36VVcOdNtL07YHDKPGq1HH16BDG2xoOKDEy841E5maJlOFftE
 9e8F8GbgjE8P4dZK4kTfUrGSNWr5FMIPy8a34OUrULqxJb97C491S/eGEmNKPzqYt1yp
 Q+/2+6n+KT/f0Afj1/x9E/fCEJHkfnZR5AIxTji9j5K/rstgEHCYY65Q6iDd6z/cBZqR
 8KTw==
X-Gm-Message-State: APjAAAX0sKJOwtlC/fyYMDkpAqLVdv+s8Z79uX1W7AO++a5UhSjRp0Xf
 rqOeQ0LzZTNLty9OiQPwN5Z8zA==
X-Received: by 2002:a17:902:650d:: with SMTP id
 b13mr14877928plk.90.1566754822279; 
 Sun, 25 Aug 2019 10:40:22 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id r23sm10222491pfg.10.2019.08.25.10.40.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 10:40:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-36-richard.henderson@linaro.org>
 <CAFEAcA8JGUdM5v0MCb98Jw+iJNC+ZMD5SDrPVR0dHGgtMOdk6A@mail.gmail.com>
 <162644ea-ae46-576f-7dea-6696db364c68@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <136ef143-bc7e-815e-c3bb-ade24eab7d13@linaro.org>
Date: Sun, 25 Aug 2019 10:40:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <162644ea-ae46-576f-7dea-6696db364c68@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 35/68] target/arm: Convert
 CPS (privileged)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F1xEuegYKs29

On 8/25/19 10:28 AM, Richard Henderson wrote:
>> CPS shouldn't exist at all for M-profile, but the legacy decoder
>> got this wrong too, so we should put that on the todo list for
>> fixing later (along, maybe, with UNDEFing on some of the
>> unpredictable combinations of M/imod/etc for A profile?).
> Fixing m-profile is just as easy as as commenting.
> I'll leave a TODO for the unpredictable combinations.

There's also a missing check for ARMv6 here.

That got added later, with the T16 decode.  I have just added the
following to the T16 commit message:

    target/arm: Convert T16, Change processor state

    Add a check for ARMv6 in trans_CPS.  We had this correct in
    the T16 path, but had previously forgotten the check on the
    A32 and T32 paths.


r~
