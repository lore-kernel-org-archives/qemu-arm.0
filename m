Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4872083wrm;
        Mon, 21 Oct 2019 10:33:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw8qIVNHo0Xr5zD5od3p6v+tgpfHKZtIDUXlQwiE0neLD+Gv2+wcRL3L7WJXmcFW5r989R/
X-Received: by 2002:a37:4bc2:: with SMTP id y185mr15936533qka.10.1571679203580;
        Mon, 21 Oct 2019 10:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571679203; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtgkOEouY81Z/39OG6kQUbXhETBf0jIk5JiJJZcLJlTgTNTreg6JfCK0k1NnBkuoQy
         TZ/1msgI510jSHOPWKWKDozrs0vJFSewzZQuBMp5qjU0X5YmrSE58NcjFFQAOPCHWEkO
         cBVdkpDloQxKYoqoiI5j/nhRZtNmHVD5Us1eaiwcUtfVXg0c2AhPQQFY3oV3BwPEmavb
         d5gw7M1hdyWPAq8GMlRwTm1syDZxlLU2wDbxgGf6Gm0B3H48W46aY2b90Ce+TCUW5pPk
         6Zvq2xjMAD3P7GfyI+cQZ55GrJ45WduFi1WtYjTHmlfuQpqsmOXo331jNtR0PCB7Tl9/
         qh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=/qjmukRbIdBeULuc9m/f9EngualQxpIppRKf4jn8Q0w=;
        b=lccYkUDi/o5HpoiXsyv0Tdid3ikLJIR/0lu5dYBrQdcAJEvVB5J2B0Fo8WNTMkwBqK
         PHoXZAD/dkTL7bMIeaJ+b7ehJiyC4ulqKDtX7st2Q5EWlWaGXq25t/2Xxh47BsrAsLqN
         GaHOmt2UicFTxTSIGT0TMdeaTsYf/oubK+Cc53GJYnCJacxZc2klPXsW1i7wkV6jPz01
         9AoYIHfnF5gDDp4LQxJUV4pasd56yaucIu6E61WSa66n+drmZzS31oAgOBoQZJ2QnwBT
         sjqXxE+b/EEWife3mSM/owrK5bMIZ8wW70kM2WHN5lwjF3pEXr3L5Ytjv+dI1KUi5f6Y
         OwKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WicBxLA7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si13733646qtq.229.2019.10.21.10.33.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:33:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WicBxLA7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMbYY-0001Yr-Uv
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbV8-0007PB-DT
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:29:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbV7-0005z2-Cr
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:29:50 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41526)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMbV7-0005yi-6o
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:29:49 -0400
Received: by mail-pf1-x443.google.com with SMTP id q7so8838381pfh.8
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 10:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/qjmukRbIdBeULuc9m/f9EngualQxpIppRKf4jn8Q0w=;
 b=WicBxLA7ZnJcQFfkcJ6b3JMjFitDtkDLID5YtBHul5o7+CB0Un2KS1/vbLZ77GiZk5
 w5zsLmtqE56KOBA7BZoe9NC/IzBtCkEQbW9rVo7lkKhx4yLDtiTej5WAfQfEJgeqN+ND
 tHhAsM+FI+HXFZej5jaIhu7dajU+boqx0xYIq6Ra5gSMacrhCHb3cBzxqc237QCx682W
 TOde8nFp9qstdc9bqeRO/N1iP9qrHJ27VNJd8/eWQxmmF1PKHMJkdEjw7KYKNA0sbVAo
 60xC/FP6FKIKo+yd8K7Mmbn6AugDWgWX+arOJySw/KJLLgTXk2K2BhtpJ7wF8ixjWcJf
 fjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/qjmukRbIdBeULuc9m/f9EngualQxpIppRKf4jn8Q0w=;
 b=Ohh7oOWCimU80pT084kBuZIeT/CEQOt06+oz6FDyHkFD4WJTKoSzic/7xoVSNZ9ZkC
 hPoU+CP7Dp6uU5HK1qWika+FdahHh2U49nPHSLghQKWqi71Vq704U/saLG+5QComRSt6
 jiGktGgfpDQKUpvkelpT/sWwngJ2lSgzuYBq5FD+px69nwlXgBELTDFmZbBve4zUK3Yz
 azlc223CA/QkpLO5vRgen7mVCiGOcb0TzD4THHBCl8yte028JWR5LQVej4+n08TXzsTJ
 0Eb6tSIHWdAdIRO1osLBcyyrpzhm3dinTlyJxIZUXMIG34BX7/X1bmC738GtJjnOtv1P
 i0Lw==
X-Gm-Message-State: APjAAAVfZI+PltZpzvF/Qzr1S85prij8CA3et8pkxP2v7GM6sOTry2Qk
 3ckiCJ9EsSUd4YqVuzRLZZ5PQw==
X-Received: by 2002:a63:e853:: with SMTP id a19mr26830570pgk.192.1571678988209; 
 Mon, 21 Oct 2019 10:29:48 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id y7sm18461700pfn.142.2019.10.21.10.29.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:29:47 -0700 (PDT)
Subject: Re: [PATCH 15/21] hw/i386: Let the machine be the owner of the system
 memory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-16-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5b923131-64e2-2a20-512f-071eb95fb601@linaro.org>
Date: Mon, 21 Oct 2019 10:29:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-16-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6d5dQQgLBK5w

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/i386/pc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
