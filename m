Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7052101wrv;
        Mon, 22 Jul 2019 08:59:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwn4T6K+8ox26DJqL3UZNTMXkjrCj4zWkSewEksHJubAJB04MMSVCMkzyRxv/Uzj8I/ZMGS
X-Received: by 2002:a67:3187:: with SMTP id x129mr19551447vsx.139.1563811198705;
        Mon, 22 Jul 2019 08:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563811198; cv=none;
        d=google.com; s=arc-20160816;
        b=C56yzEnwUQhGFGKoBy/TOmpT4r2cuDOiGItOdM0VHcAIFZ1ZMdsUHafCc6Nm/smKHk
         zKL2esTOfM1d4fumcwSpcLfq7XuT2oBNlixCGwCd4y1kxOv+k7R7DGRu1URdNQblk0S5
         +amQDkzCqVkA4unn4Jcp5YEejiybpeYpvsz3bjpVLUZa0z3vwb3RiPzH0LY8i2lSMtWK
         Mc+bC0bUwGDP2qjVPsF1iuBxHyr5bM+tepVbiSa5/c4hM+AHkopYKbBbW0/nxXBXagyM
         YZiWuTO7GtzT/7F+yFVBu1gacZX7bSbhY+jkMMFJGNKRNgxyAltZx//sWYGKsgZvXEtB
         jGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=53qxnmFCQleCgbRBd+QvrrBbXVy7x90TNzmGsFo5nJU=;
        b=bVWzF9rnIG8tP5h2txP09FbDTEQ5s2diFSXZ3/IJw/mabldVl5o6ePIei3lDRLlMbJ
         ROQfoC9+NP2Z6CfGCcMfKDcJOyNL5magqeYUwuQZR28VGZU13SRSDIcQaDkH43aaD00Q
         /pD6LYsHwUNciItatXWPzRd+f0WFNSK19k4Mpj7hNOF/TGo1hPysHRCV78IFhz/FV3b5
         2+SZ2TYIEddp5Gbdcmp+VzPV3B1ChHAs/vlqqxIXe4+PTo94FmEX+/RTZ/HpvUUY+488
         dBI88tHH00MiVfFfbMufOwiLB14ssHXfLa5QxvQZARoyqf4YVo0PFUqAtQzvg9/tvTCB
         xnDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iPbss/mK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q35si3102277uad.195.2019.07.22.08.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 08:59:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iPbss/mK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpajF-0003Hg-P8
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 11:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56714)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hpajA-0003EN-Tz
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 11:59:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hpaj9-0007li-Kz
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 11:59:52 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39470)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hpaj9-0007kU-Bn
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 11:59:51 -0400
Received: by mail-pl1-x62b.google.com with SMTP id b7so19414927pls.6
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2019 08:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=53qxnmFCQleCgbRBd+QvrrBbXVy7x90TNzmGsFo5nJU=;
 b=iPbss/mK0jszMYof/8qtEi33fitz9HC8eD/BndxwmPj/LtJj21fdl1api2UB53TVJ3
 LiO/y1lhicz2hfPj5jnw3buDx9l0NVfuG8XWs6sgxIxkgeh6ofJg+rI9vKUAUHFyi+c/
 ug5ndyKNnPX6tDf11y2fxK3chMQvVwuXqhlhlvN351ntAyuvxP95hpiQUZdskVFXNm8S
 /+JSbRug7VVg9zxK0h9re0oMGark5HNwNNigLHKEX2GcEoUZzHqsv1alZOVnM1IeNmYK
 eUvzBNFoIl8UsEOqM62/C1mB7Mq4baSo8laFlWCeZ4XMs17DBlLRSW91MabPlGM68JxT
 w6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=53qxnmFCQleCgbRBd+QvrrBbXVy7x90TNzmGsFo5nJU=;
 b=t68Htf996nCRC8aqLHrz/xmsyjhLSkp4tfUT2kcFCu0Hv3Drv/HoZjKQ1AkPoSR7/v
 s3ZPacRdm4lypJ6KtpnM+gdyeAq6DHgJltjYSr0pxJWQplL//EXr28F8QDNqMa9hetZJ
 6lU3rEXxkYmtlPeXQ/uoRrfmIjsPiu3CwRJ3+ChWh5RSN2SvklJ9grleFFmQwNQACoKT
 hD5blUL9sXg4djCCNxxQ4rjSP3mgCPLstsL19dqa6bDAeTYP6R5gWWvH77ynZwpVfxfH
 //27gZW9UfYrBFGhLIACj/JiMG8SLOx2XCRg5+jirJwpHCaDBpZoqtubOc6cgKulDmOx
 3j7w==
X-Gm-Message-State: APjAAAWrOlVslhKyUl6q8vjh7uAffrnzrw9S7LJSVbUZb1YL+xszAk4s
 DepL8AXNrxMuu3Yi9aQz9SbNOg==
X-Received: by 2002:a17:902:b582:: with SMTP id
 a2mr77224778pls.128.1563811190327; 
 Mon, 22 Jul 2019 08:59:50 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id y128sm58626865pgy.41.2019.07.22.08.59.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 08:59:49 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2b6eb033-4b6e-4d64-c57e-a3257088d0dd@linaro.org>
Date: Mon, 22 Jul 2019 08:59:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 00/20] Invert Endian bit in
 SPARCv9 MMU TTE
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, mst@redhat.com,
 palmer@sifive.com, mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 arikalo@wavecomp.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, sw@weilnetz.de, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 cohuck@redhat.com, claudio.fontana@huawei.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pxB9M3yXLaED

On 7/22/19 8:34 AM, tony.nguyen@bt.com wrote:
> Tony Nguyen (20):
>   tcg: Replace MO_8 with MO_UB alias
>   tcg: Replace MO_16 with MO_UW alias
>   tcg: Replace MO_32 with MO_UL alias
>   tcg: Replace MO_64 with MO_UQ alias
>   tcg: Move size+sign+endian from TCGMemOp to MemOp

I don't like any of these first 5 patches.
I don't understand your motivation here.  Why?


r~
