Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp425007wrg;
        Fri, 7 Jun 2019 10:10:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQNL/a8yqSnmxmSdtNZpofd6j6seiLlwJI0GHKezusWkP85HwTa9iA2dIBcjp46zpfjndg
X-Received: by 2002:ac8:5315:: with SMTP id t21mr37254902qtn.229.1559927453109;
        Fri, 07 Jun 2019 10:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559927453; cv=none;
        d=google.com; s=arc-20160816;
        b=AS8HvQjGHS5usnCGgcZiYMNL1qJcGQ15RIMKQelqOWh1h+V/LH8JvjSWC1uePZuOmY
         G6DwwW9E9GiSOU5NLRvvZlhkyhlwLHsOLwaqYW19KsvoGFs+BXvQ+AzVmNK2thU3hmZU
         Y0WZgKO1DkwZp65a+UEDu51CScsmyUOG/8tWKRMekaI/XU74NR7XF6oq4eVYfzBEdgC3
         i3j1oYC5FR9Og5J/IIR9qvvfvG8PxP6qQEacYKjkSJqS3ASc2wFb0WHTuVoxzPFjyPqS
         s0o7gHLT94CFr9YWs+HRS8xx6XqDvtLFhJNY7c2enK6am3lypRbe6kXm/DW9puHZ2mMp
         6nhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=PLB/dPHN5zz40CHabrTCGE0l+3lkDgIK5X+oQGMfMNo=;
        b=DsTK5cqQLemCpl2IUjigK8NGiznNhHsmwXp80zbkOXxZYvbbLOBCESLr17uqM7IOjx
         SjXtXIs9XOEpggdq3VBc95RPh2zeu9qC321I++opKG/PK93htehYbxC6ioEgaya5JOOS
         JKLBl1pV3EhQ5BoCAq2bmqHr6LVmSZ+70ChH8qw6oimRgdroEnT7BUJ5twOmxhc0IhHV
         wPAUQ6VZYdJTevLlzsnBifKV/h6mfpFgBu/VFB32/l93bfNbKMLrH4gyT2Hvo3CugcSv
         9tU4Fbx/StJxGoLv9dJpttxgj+kkuqImzv65wW/S66V1tVQXUw1S4oM4AyjLTTLvrSCP
         Ofdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ylUNuBCp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n38si1544058qvg.219.2019.06.07.10.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 10:10:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ylUNuBCp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZIOC-0007Nr-Kr
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 13:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53762)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGzy-0003kJ-M8
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 11:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGwr-0001bg-6T
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 11:38:35 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43076)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZGwq-0001G0-Nz
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 11:38:33 -0400
Received: by mail-ot1-x344.google.com with SMTP id i8so2231416oth.10
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 08:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PLB/dPHN5zz40CHabrTCGE0l+3lkDgIK5X+oQGMfMNo=;
 b=ylUNuBCpR32XnuknDHtqHse1lu84dwzHBi3B0njY2QLFulXcox9GoLX/+T19RGG58X
 5MTp1Zq97cK204Wj3qmAlEzZouHYBcuXdH8fPMvNkLHDoNG111L3u9DYlvTeCxksa/8P
 wCa66uAa4yV8QNOrzU6BCnx3SwSURC2kQ4adm6iowpLZltJPPr6p54Y6ooqFMd8RVzQX
 DU1L6M6E61rPF2gYaX88P/SqIzlhOQ4u+aRnKmQwEW8Nyl9nTHp1VYkzpyqG+0a4aiBR
 f4Qn1gTeYEfmsJXtYfNVGwLLaJRQouCgcXEsKhBInlYWCms7XaXxYjM/OXTyAYEVpWYv
 Ib6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PLB/dPHN5zz40CHabrTCGE0l+3lkDgIK5X+oQGMfMNo=;
 b=uLJlTLSvr7BEPNEJ/ka695dO6QoFiP+bZHM4VaEBZsEsgpYLiI3GmzH3+lGlZDRHnv
 pi/dXzbbObDQznzpuBWD18iQz+RigcAXVvdHbR9cOagdYbeDSEgCVipFzwS6eDinipSL
 l1I2Cn3AhiqyKToSbuaAK83qSzFvUbbXOKA9FzzxH2M+YrTcBcgPsBbRvq/j1EnMl39E
 vklNbU8NCZTECqAN0BLrI1NzQr9YPtYW2KOG69tQ7JOAz47gclVhK3TToGUTPCDL9BBh
 Zf7tGBFSEvlUAMshRybUPItXtx7gqybcRQ764YvFPt//NohTaxWqN7AzqWdZSun1z1Ev
 9x9w==
X-Gm-Message-State: APjAAAXySz4EBDmmBoQgmlybRHcC1qBVbLJBVoLyX4DByfa5ZV70k8EY
 Oapg5+/SPfj1LqCK1j6qZ/cqHg==
X-Received: by 2002:a9d:151:: with SMTP id 75mr12836192otu.202.1559921898446; 
 Fri, 07 Jun 2019 08:38:18 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id 93sm853709ota.77.2019.06.07.08.38.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 08:38:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9cf15c60-3cdc-7cac-f9d5-a3fe49b415b6@linaro.org>
Date: Fri, 7 Jun 2019 10:38:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 09/42] target/arm: Convert
 VCVTA/VCVTN/VCVTP/VCVTM to decodetree
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cHBibHnpaoEc

On 6/6/19 12:45 PM, Peter Maydell wrote:
> @@ -3452,6 +3446,15 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
>          }
>      }
>  
> +    if (extract32(insn, 28, 4) == 0xf) {
> +        /*
> +         * Encodings with T=1 (Thumb) or unconditional (ARM): these
> +         * were all handled by the decodetree decoder, so any insn
> +         * patterns which get here must be UNDEF.
> +         */
> +        return 1;
> +    }

This could be merged into the previous IF.  Unless I'm jumping the gun and this
too goes away at the end after everything is converted?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
