Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp195158lfm;
        Thu, 30 Apr 2020 20:48:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypIqjUH4tnRfzGwJAsMe6fepwMBIGrroBA6TRQ7dgghtT/AYeadQXYAkASd3jZhsVLwhAYdx
X-Received: by 2002:ac8:758d:: with SMTP id s13mr1862204qtq.105.1588304884832;
        Thu, 30 Apr 2020 20:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588304884; cv=none;
        d=google.com; s=arc-20160816;
        b=zzEZjfMT20mu20CIafxOL/aDiQBorwsHNNOI2sWgvQOVE0BK2Zs1QJHoatsFYW4N3C
         ZoRo/YXOBOFz0vv7nqFNAP72+FrohB3SGNUseTsgIXFNvDrry7HO8O67TcWxF9QfgC1u
         9sk1zTCs1dLTJ5NmzgT1UWSRYc6VRAglrRQmJxl9T4Kaluw0WQzUFROSchEfklMtnhuv
         gShIHMBkd0MMgaHf9OijmgCYeZpMaygOJZLROVCTr8WYj3r/Dk0OJejphTEjOKJq2hTt
         uoGTS7tiZfBdqdo7kEKPALCxLl3UFRUsQStJBhmaM+kvJb80UuITKc6outrVqDWful9L
         g2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VzOxuQaOmRnCftDKnoD+DnBRUs116m0g0t5OD8NTZNU=;
        b=0gXs3my+hWzv9TqOadVb0PBIyPKdE8A4xt5e6J1GZ8hPEvHf8fIkZZT7I5pXYlQWy4
         +cFEKtL2Imo3iRIqeMIFVn741wQA059kqnsm90A3SGvvCn7CergpLXyVCdp3Fn6GDKb6
         sSQiMU1jAinoQ3BaLBRAn//PzISFJyVuK6xKBs6FnjRESJVXwjX11gLSB6lKPZGyIAJh
         mi0K0Uzu4nprYMbap9IpfhL/FDRHxhpFSHFgMA+c/7Mu8ESoPHEDkFwT29bbnwA/N6dl
         gzxTfPnKXyykTq2RwP4eueHpbX5h1sXjYi34TttlU4Dq+zyMqlhyucJ+LWkBNIZiSFGm
         Gtqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UfbJ7nkt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id k28si1046464qtf.185.2020.04.30.20.48.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 20:48:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UfbJ7nkt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUMei-00041q-AZ
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 23:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMdm-0002Mv-6Z
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMdl-0006aC-Di
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:47:05 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:40444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUMdk-0006Sn-NT
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:47:04 -0400
Received: by mail-pg1-x542.google.com with SMTP id n16so4031041pgb.7
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 20:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VzOxuQaOmRnCftDKnoD+DnBRUs116m0g0t5OD8NTZNU=;
 b=UfbJ7nktDt+2FcqV15SfrO2xFvEou12En65JSpklpxoFUwDl8SLHmWexpR0QyWFV5b
 6DrAQA9jezD9GnWBmvC0IeZLMlWYr0r8cCiBVTE//CkSuxswRrw/9OQGOELUjLABMyVe
 qOmkAxfaVbonML8SOMkwsoSoFjCxk+QkW9ALfookB5dXTCVkQ8CaGpLwg3U8eWLK+WjO
 nc2nMkGDPsu4LunC5KKRyK28Sh0xDaoAhSb7b1ogkNKv5olcuGsJ44HaOod1r/4JWFe+
 3ZrIfIEuXxKvrMukMvmdsFKLzuptQzGbLntC6yQDfO1ROjo99bRyn0HKUW34HyWPWTy6
 G48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VzOxuQaOmRnCftDKnoD+DnBRUs116m0g0t5OD8NTZNU=;
 b=S4I8N3wzXLYlT0LQdxmcFO3StBiUVxeySwacmmBfpb7D/YTcQGrMNrEKiyinwDa6Rn
 PGG9gZqN/EeBW8i29uOmEBPx4iUMxh46Z7PI42frlizuz+mPSnzZqpQRIzJ/M0doofEg
 oehS7fXR3bydLB9zIbifw8+ndHtBonQmJ26phW2TsPP0eFWnfpRpRPDZqz8k9Wzlzxpt
 8DOx9rWVc2DuKS+VOIiT+BsGUkGb1XOBmLEr0043cFolLZaOZ+3rGQS37TJ93+i2XG86
 SKUPub/fnV8N4Rmp6FnAWXh7aRsiQBDio30kvvc2aaJD5KZvkIVTCRpwhf+wQOWrHlOe
 l6Rw==
X-Gm-Message-State: AGi0PuYVxLMYiFUAF/K+8tBtnfTeWCzTlh8/75VjpUJLKy905PlYDrWe
 RdmcRhRWafqEFEpvM8uSltDgQQ==
X-Received: by 2002:a63:485e:: with SMTP id x30mr2344823pgk.416.1588304822815; 
 Thu, 30 Apr 2020 20:47:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id i10sm1002949pfa.166.2020.04.30.20.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 20:47:01 -0700 (PDT)
Subject: Re: [PATCH 30/36] target/arm: Convert Neon VQDMULH/VQRDMULH
 3-reg-same to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-31-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fbcdb1c7-60d6-eab2-cb58-d6e12a46f384@linaro.org>
Date: Thu, 30 Apr 2020 20:47:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-31-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::542
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
X-TUID: X4flbfIqGkBu

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon VQDMULH and VQRDMULH 3-reg-same insns to
> decodetree. These are the last integer operations in the
> 3-reg-same group.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 44 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 24 +-----------------
>  target/arm/neon-dp.decode       |  3 +++
>  3 files changed, 48 insertions(+), 23 deletions(-)

Modulo the other do_3same_32 comments,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
