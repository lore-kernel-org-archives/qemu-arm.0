Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6872150wrv;
        Wed, 7 Aug 2019 11:26:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOWEp8dJwYZVTratlcUvbrKqJ7kFgb9GUSJo7m3LJPsQKEKNm8wOSU0xk9dlO2aWOpCxVt
X-Received: by 2002:a37:61c3:: with SMTP id v186mr9190268qkb.158.1565202381078;
        Wed, 07 Aug 2019 11:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565202381; cv=none;
        d=google.com; s=arc-20160816;
        b=rIkkF2s2I4KYteWfeMVmdb5Hcp98bu1nIyEH9WIb/7U0sV8eX8Ho2EpQSYRTwr6uvs
         ZSznhQEBAk/2Uo1UN0GmlArcYL5ncT0JEBBHizrbmU/HM/wcOxxcBa5e2/5lyTNNawC6
         b2bqJJQWpbmhlWXThcFWGl2nnJrZhz35BIKva7BGe5O51aHtfjJOI0TpRKr/jv8nxKB4
         8dm5HVctB0+AtgiNRn0JHSy2XBp4Wcko4KBlJTASObtNUjRqzhYN9SO9RuoV3EGwTOWD
         UXPYzl/ohCGbD69TnppJJJZKWWHsDzj5GK1k/moVqHQmsMPngaILg7YYpAtUK2QkoWR5
         qSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=O6ZVVVnFK8gMP42dZaFj7U87HAGu+ffS7XGWfusThcY=;
        b=kBFTyk426PETn3xcUcfwcdYiJ1jLA2OrfX5rZGzbYLkmTcqiUuuJERlZnD2yF38XGE
         cSJAciWK2aycycyWqqeHrtBzQws58g9vChQx+4AZ96kjEft3YbHP9xarqRhgf1zvTClQ
         smA8hkdIbQCcNdai9InRZpxFmUMtWjNXPugxCHOQyEbEl7h1Qit5jcmdXR4+C4x6K/wI
         Yb1if9CC8J8gl8EiXIhSR2xiE7Ei0x3GoJ1WUlxkRCndJOTVKK5+3s7k9V1dcP7RyxJL
         3ac5pf14xuch6gHijV4vrk2fxISjFyBQWzNCVcUfMR+GqwtEePhqizAVYbDZOnHhkr2z
         +wWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kqHzF1HB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22si55073247qtc.232.2019.08.07.11.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 11:26:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kqHzF1HB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvQdg-00005E-Lw
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 14:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38823)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvQdS-0008WT-4c
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:26:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvQdR-0000k3-6J
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:26:06 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38724)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvQdQ-0000d9-VS
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:26:05 -0400
Received: by mail-pl1-x643.google.com with SMTP id m12so3417888plt.5
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O6ZVVVnFK8gMP42dZaFj7U87HAGu+ffS7XGWfusThcY=;
 b=kqHzF1HB/XqXehEyAGwHuWapyLBzqxoUwslq9VHFHjepNTexylmqXBrOrsDI0j8R+q
 MhDVlTqbMcNZMwOdM9cThzY1WIDKKbNDN/nDAoM75sUjnIEMhJMjrUeZLcok/qE4qzDs
 5a746AGfupRavS08skbNZZxSwywYJnCg6MW3o1BO8RtSo8rxhYn1ozye3G1lLBErFdYo
 jPFxn0fMcK4r1Wl/RZQh/eH4a4nf7a0kJPkza1jNnLb1ZTqJt2S4ztABGqVnbfxIT8C1
 uEqHYGpvGg9fg7w+UVe4acEmbsGXyMBe/5z7WU4s/kPi44IOTtyrIvloef3RSr9K7JJg
 0xzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O6ZVVVnFK8gMP42dZaFj7U87HAGu+ffS7XGWfusThcY=;
 b=lGgeHfFR0m6MUw+Wg8iObcaJt+ipAVKpKDjGK+8w8GOh0aR6FWXvvnpLfic9S2G8gc
 R9FPLR6E1Eu3ByJs/lhznQUA8dqqEfzbxE18phe6kK5E9kmilTEoSt2bBD4hlFe7wi3a
 hGZ6z3x9kZkcH7vbO3tl6Opg6XdPaRthxfq9/m2/hdjtUCU2CrRi9fyTYBxhpouQtsL5
 yPgaq0qQBUHWmDeggq49IRKqu2Exr5k1ZqolcfgMaf+wY9ij6CsaqHX730UpNFqAxQf4
 qFajEI8m0w7Gfzrm/k5+dBg45LOzDmdbBLIPx9aT0bI5mQeJp6PzyyOI1UdTwA/srOV2
 z44A==
X-Gm-Message-State: APjAAAUnQyxZmuFUKT5syqUbSh1AjALPhrqjiy0kI88Yxdxzlz2XCBgW
 zdhGHjPEyV45Ykch1GuvSH1/CBtOPr0=
X-Received: by 2002:a63:4a04:: with SMTP id x4mr1628068pga.411.1565202361099; 
 Wed, 07 Aug 2019 11:26:01 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id b68sm113296790pfb.149.2019.08.07.11.26.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 11:26:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190807045335.1361-1-richard.henderson@linaro.org>
 <20190807045335.1361-4-richard.henderson@linaro.org>
 <CAFEAcA_MFg1_gpaT5+X71s8r5SYZFTizdXs2vQ_6mLooP7E+kg@mail.gmail.com>
 <061145be-4cd4-b8e6-ae5c-562a59e8088f@linaro.org>
 <CAFEAcA8fCL4VTJYdWGbDySzT9zkgmjcMGqBj0fo9gN4x4B-WcQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5bcd1a92-d8a7-0dac-bc25-a0db23bb2eaf@linaro.org>
Date: Wed, 7 Aug 2019 11:25:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8fCL4VTJYdWGbDySzT9zkgmjcMGqBj0fo9gN4x4B-WcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [PATCH 03/11] target/arm: Introduce read_pc
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
X-TUID: fMWtbz0eZvsO

On 8/7/19 11:16 AM, Peter Maydell wrote:
> How about we add this to the commit message?
> 
> This changes the behaviour for load_reg() and load_reg_var()
> when called with reg==15 from a 32-bit Thumb instruction:
> previously they would have returned the incorrect value
> of pc_curr + 6, and now they will return the architecturally
> correct value of PC, which is pc_curr + 4. This will not
> affect well-behaved guest software, because all of the places
> we call these functions from T32 code are instructions where
> using r15 is UNPREDICTABLE. Using the architectural PC value
> here is more consistent with the T16 and A32 behaviour.

Looks good to me.


r~
