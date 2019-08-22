Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1031620wrs;
        Thu, 22 Aug 2019 10:03:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwhDFrxrZnt+um0MONYlgqitVNw591MyST9mdvc122eZGeCGaX93COZn/1u/TYEBwCF+0sx
X-Received: by 2002:a17:906:b7c9:: with SMTP id fy9mr218428ejb.237.1566493394904;
        Thu, 22 Aug 2019 10:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566493394; cv=none;
        d=google.com; s=arc-20160816;
        b=I1Ioe1w7KpfnstSUCwpyWVg9wlLoj7qNw7OwlsOJCbF3EBYLBrgBLjZ8TowFVrUSxx
         ABRH8bGl5yih6gGcBW5YVQnsCk7lLWrU5zRQLi9icZ9gr6bD0zlE53fSBEJ/N7hGLRFn
         XWo8jmkSV62EvzhMGB0cDDVV78O60pJ9SX0q42P2C97HUxQm2m0gVM3VhfLX1Ug+hW6R
         W/lNRNao6FDQUqG5mQ6eryJtKlDmE9nKom5aXWu8xs+Pk6u9jbgtk/oCmCu0HrX0WtBS
         63KP92CAmpZDIMmrSNPdgemrk3E1PX1E37Xj9RNxzQGTs+iMJBr4ANfmb/1pdB0i5VoI
         DEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=eZq2vsqsa0wP6reNOee0MyZDgeFMn6SHLG16kdwn5WQ=;
        b=L7v2FZiwIxpw1Fk+ctH5gQOUHIVtwBAX8CggnFnSE6AYRVO5kzovSWEJvI0iYZ4sqX
         kNj/o+K5KwOHGoilRvFP40svcKeUw+HflmGcQ8dYIBDiSpjacRy/vEpN0xGvRSWtl+8I
         U/ho+WNzXJt7aF/k3gAWi4ENILDbz7DJnqos+mul+4gZDVP1y7Ou/RaDeS8Nu6mv7z9X
         cDa8EVkuz+mfdVUwQcpxDEshAWkwB6bxWThQB2htxzofWicY8hjDbhLp5REuJybZtjeH
         XfK9NZ2Vpikf4eBuq0vVVF2X5ME8PfPXoI0H//J2aVrtXCoTn8WfHTU1rw53dF+wsxrs
         /83Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RFyvlE1+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d50si199736edb.7.2019.08.22.10.03.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 10:03:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RFyvlE1+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0qUT-0007qt-TO
	for alex.bennee@linaro.org; Thu, 22 Aug 2019 13:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57246)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0qUJ-0007qN-3s
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0qUH-0000E8-KP
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:03:02 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:34109)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0qUH-0000Cq-Da
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:03:01 -0400
Received: by mail-pf1-x444.google.com with SMTP id b24so4379702pfp.1
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2019 10:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eZq2vsqsa0wP6reNOee0MyZDgeFMn6SHLG16kdwn5WQ=;
 b=RFyvlE1+BKAp+GEuC48SUH1Qdc8zfIFhXlU7wJAvEClyIHmcSqJ8bus/DOExnD9XKV
 iY0dafEAx1M2M7SmcL5MuefUFVJltElBcd6c73/WIfUGX2Nt51CzsfyXvFp1CY9Q0Znx
 5JTLUQ9xiL10PwfSyetdoL0XHzWRbFkEM4HGOzBbno95tjKjNunUvrdYrMyOKPuobETd
 6I3hpehOjjdGX+ImT3zOxSphvaoEOp6mUzmtusFrqRsQXubayZtUjsk816WuXN1Wij3Q
 IUUO4gUfDWQBWjBM1LOpaPWmncgbVIspFd74wY1ID6G45Xcbp61qQaRP08t68vzP88Kg
 eUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eZq2vsqsa0wP6reNOee0MyZDgeFMn6SHLG16kdwn5WQ=;
 b=Dayzs/QPCvkaWnFeMIdd0AA4+50j08BTmVp36kwmvnpfnWea5haN5KlhXSdc8NMlWz
 G+7YJVf3hmaCkhpRYXUGOjAYYkFTzyRrmbKjfKFyjToJM58dri/qLYKEAaFz4YnOh1JT
 KE4fhJaMl+N1NEog2eZFeZ06m9qErn51/T6m8iI/ae197ENSvZUBtlF8UaIMyGUvaW46
 gkG33k3UKdNyxgT2d9VIZfKJ7YP1wI2S6W7Cfoc5i7wncXT6r3luJH7uM/5AgMaLYT3n
 iCJljN6vGv0iz898KjeGcj64PHBIelKwed000tMO8acfG7M3KJz6Q14RblGwrWPyitYY
 VEWQ==
X-Gm-Message-State: APjAAAWEyKEuNXOL9NlTzxCHjZ3SXao/E76bDL43fR8LXmdNtG5xhAls
 XRG47/Ltqf5+emf/4Bt5a4rLTg==
X-Received: by 2002:a17:90a:dac3:: with SMTP id g3mr684465pjx.45.1566493379131; 
 Thu, 22 Aug 2019 10:02:59 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id c5sm29425654pfo.175.2019.08.22.10.02.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 10:02:58 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190822131534.16602-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c944bd01-14e0-b9f0-28a8-2dee677ed6c4@linaro.org>
Date: Thu, 22 Aug 2019 10:02:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822131534.16602-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [PATCH] target/arm: Don't abort on M-profile
 exception return in linux-user mode
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yiiszW+R2C2E

On 8/22/19 6:15 AM, Peter Maydell wrote:
> The upshot of all this is that for linux-user mode we should never
> do any of the bx_excret magic, so the code change is simple.
> 
> This ought to be a weird corner case that only affects broken guest
> code (because Linux user processes should never be attempting to do
> exception returns or NS function returns), except that the code that
> assigns addresses in RAM for the process and stack in our linux-user
> code does not attempt to avoid this magic address range, so
> legitimate code attempting to return to a trampoline routine on the
> stack can fall into this case. This change fixes those programs,
> but we should also look at restricting the range of memory we
> use for M-profile linux-user guests to the area that would be
> real RAM in hardware.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1840922
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> I have no idea how we could achieve the "restrict addresses
> shown to guest for linux-user" mentioned in the last para:
> any suggestions?

I guess we'd want a new cpu hook, and change MAX_RESERVED_VA
from a macro into a function call.

Move the cpu_create() in linux-user/main.c up a few lines
before we default reserved_va for 64-bit hosts.

Move the check of the command-line setting of reserved_va
vs MAX_RESERVED_VA out from handle_arg_reserved_va to just
after the aforementioned default.

Seems plausible, anyway.


r~
