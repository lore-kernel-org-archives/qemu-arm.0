Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1968681lfg;
        Tue, 25 Feb 2020 09:47:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQaQdUhHhINmedMJEykmqUPSDVtic7nZr3syfvfuXmDaGdUtNvnNH6M/44Q46KWJ3imgDo
X-Received: by 2002:a37:6393:: with SMTP id x141mr54946347qkb.134.1582652821633;
        Tue, 25 Feb 2020 09:47:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582652821; cv=none;
        d=google.com; s=arc-20160816;
        b=jzamtA18qbb4nJvdRc+IbqzENTmKV86t5ujVWtzBT47vupWUpIGqXO1852bkjFJjvR
         xfwkpQSg4kSejoz3gBarYfIJ91MJXh5N3e8cEA1lviWoCgQ1NhMMgn/Q+Zsdk/qk2X6R
         1Pc2qq2SJyM/LtbUEfwnuhcOIRHvfpUHGI3AbD0LW3NC2/RTrLiGj94q7vFm8yWyJ43F
         t0V2qJB0Vw0zArRlzXePPMljS45nb5VlMQtUU5o3y/IB3AEvUMF5nCR5EnAS2kQkyRjX
         uxNNWNHNFBXp6QXZjJv2RUxZtkIsP4uDSOBF8ef000z1lZ/SsDkqYdKZFa6H7mouXiSL
         +y/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qLq7w7LUHYIV/ZKsXVdH5n0pfzZKwwrxPIy/eIHNwWE=;
        b=nbiX1ItSaRsbV0cgchmvdnM409XikVnovUEnf3TYCNgb1EgmCfGmx73rM2n6Wrsk7n
         IdzcYYi1sequfKAH71GiaGHRxcFit9NX9ovEUc7i8tI384CXRZcecAWnThFTRGFUYjoK
         DuvyGdyRrWlvkpx8mhKyeHXLgHJIQEhuLLJaVc6GiT+wuDtJt4coMMRBDZ0ZzHWg2rDh
         /2Myd9SMeMeRlwM7ieE2pNmSaiqQENnxOd+KRmVOTe+b5j75LVzojZ2serj+cThwuW/p
         tNQv7NH15dfHI1FgYd2X0n2tqX/UBePaV1t57QwVCKwoS+C0kOqjhOy2nAM8l5J8qsgm
         QIsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YkZTIpTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si90153qkk.321.2020.02.25.09.47.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 09:47:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YkZTIpTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6eIP-0003DO-24
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 12:47:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46926)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6eIF-0003D5-01
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:46:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6eID-00039j-Ol
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:46:50 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42002)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6eID-00038i-Jw
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:46:49 -0500
Received: by mail-pg1-x544.google.com with SMTP id h8so600517pgs.9
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 09:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qLq7w7LUHYIV/ZKsXVdH5n0pfzZKwwrxPIy/eIHNwWE=;
 b=YkZTIpTWLl1DIgs2QWUHBcORoQhbUWdjYp3uXt0q2xKhMqnCUJXBAAfb78qz2RDiR0
 qTgJEdUEPNuBxumLeGUGJa2zvZTMhZa4rC91P95Dd7QeTfH1ZsyMoy8Byc87v4u6CMIK
 J/5Hxs1xAcGt2Muridma7PQflc2DaqXD7+FyHqn3WfAmNzIb+evQO5gkKnDyeIZwKt/D
 /1Vzv+Jdfd8OSXW21OZK+ORXNILp/F3rjQcVJ3PSYg4CXtUvi7FmZHQS2BcANlAhVHMv
 Oc4j2OEziCAjF1tcwug3WAMktwPcM0VrBHkXVvMQraXpgm+k2urnKyfEP1mzhmJ5gAbn
 XOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qLq7w7LUHYIV/ZKsXVdH5n0pfzZKwwrxPIy/eIHNwWE=;
 b=SxIndhzR4m63pAPRLKAJGChnJALbvd4TS7Ofq0mpksVAdu0L4kelx2oaRO9UIrN+nL
 pW3igLlIFMDZxTcLwdZGqwz76y9crNC9w/Hb7wWnjMU9aaP1FTzkvsdinWtvGYzAYBfg
 Qq2WyO7LzhYyugqHd2RTESrYa1DyUz6AlbpHSfhH6+nfFgNbhAZeQ7I8D71o6RGi51gF
 zQ4s/ke/O8jjgp9szjclhCU6t0xtvIyNEkmF9RR6RKNdx8HsrfFrc7kFmJiSLvkKFXWr
 Yz7iacN/FIcajOUp8qPZTqc9htgPUNpR8koPawD7TaZYFAnWqbgmdAuTn1tu7Ee9J/g6
 7xSA==
X-Gm-Message-State: APjAAAUsJDf0mkQ3mzmABzUCzjF34acMYpAByS9q0Is8+ORLJXDYt4gv
 Pg5TI+RZMc/Mog6NMU95cvJgvxMt134=
X-Received: by 2002:aa7:8582:: with SMTP id w2mr55656267pfn.89.1582652806668; 
 Tue, 25 Feb 2020 09:46:46 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d1sm17043130pgj.79.2020.02.25.09.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 09:46:45 -0800 (PST)
Subject: Re: [PATCH v3 7/7] target/arm: Honor the HCR_EL2.TTLB bit
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200218190958.745-1-richard.henderson@linaro.org>
 <20200218190958.745-8-richard.henderson@linaro.org>
 <CAFEAcA_QHoRcfv0oLgxNsuEOaRJOoM9sQHqXZEP-tDeJrziVYw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4dbed837-f3a4-2280-8655-6975dd235e4b@linaro.org>
Date: Tue, 25 Feb 2020 09:46:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_QHoRcfv0oLgxNsuEOaRJOoM9sQHqXZEP-tDeJrziVYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-TUID: 2b6DMg/EVkmN

On 2/25/20 4:01 AM, Peter Maydell wrote:
> The set of operations this traps differs when ARMv8.4-TLBI is
> implemented. It looks like you've applied this access fn to
> the wider with-v8.4-TLBI set? (eg TLBI_VMALLE1 is only trapped
> with ARMv8.4-TLBI, not without.)

Um, that's not true.

ARMv8.4-TLBI adds the *OS and R* insns, and extends this bit to apply there.
But all of the original v8.0 insns are unchanged.


r~
