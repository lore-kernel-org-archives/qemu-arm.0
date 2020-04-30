Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2311505lfm;
        Thu, 30 Apr 2020 13:04:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypLhXDlrAXQ1fuJQh9CTVJ0AJRuuNfyzygp0j8YP4EFAGV2AiC6HqgnOB+uy1EtyKsBR/xDT
X-Received: by 2002:a37:68c5:: with SMTP id d188mr195613qkc.85.1588277072368;
        Thu, 30 Apr 2020 13:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588277072; cv=none;
        d=google.com; s=arc-20160816;
        b=MeUfLJ9qFEkaLRLAwfqTt20Uny20CK5TQTPk7oTeQ74cD/Jmq9xo+POVHWkyXzJfqb
         +Xo/A7MWYX9+AH8P6Y06L4DnR3teNl6XHIaWusXDpDlDwgQplcrjcXNV/TE/d5WGO56b
         QFAx0O/uXMB282kBAQG6yRxHEl8HQQ2SMS9Wfejk5dCZFl99sGCLvUh75RqbHmIkGTCV
         JuDQUuAvtZDc2wtBqbn7b9AhFc3NKW7YkI2snz9RFO3bwFDqkWy8ylfrn7bYt16mgW8a
         IfBhUaXNwBBvkrogNp2PJK8GTBuKes5OrlxOFcsw07ooRBl4d7/dnViYVa9cMZIpfo9S
         QNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=t6W0xpswfKO91t23QzCn98B2ph5OrwBwXLSGQ0Ysfqg=;
        b=brbqAyzPuRznwB9H+4b43oVChCwn6SFoz/dVhurQggnm0W4ZtWTU7XQ7VqyWdmV8TE
         HuwBLDw1dMJ7WXn2mt/Kgh7HKrBVFiweTE0IoKiy65drx409Xx+RJzFzSsceCT0egdpI
         QTqSlpAEugAn9/YMyDL8tGyBfc5JHwKGq806qfiPq9LSkpIm86fCx0ItJYA3KEd95HE/
         MHlkD82vHBSU228CcZrKyxMV+21Q2O4vJ+v0I+lfaNrxyKR4hHKTG+lgNOMj5WWQ2prJ
         UqiL8dLWfdqoHZxd2Pl7Xe8gAQuF1XmdAyloVKONVsi00U54sFdrVzc8qZGzWx7Mab09
         9q2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqNjicZw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id p1si347462qkk.261.2020.04.30.13.04.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 13:04:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqNjicZw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUFQ7-0007Li-PH
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 16:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFPS-0007BC-1u
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:04:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFP3-00035o-A4
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:03:49 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:32934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUFP2-00030R-Qk
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:03:24 -0400
Received: by mail-pg1-x544.google.com with SMTP id d17so3399013pgo.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 13:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=t6W0xpswfKO91t23QzCn98B2ph5OrwBwXLSGQ0Ysfqg=;
 b=xqNjicZw7kQKcAy55uglOviatHMigMcaRjiRzO3rOj9r0rV7wy6B6CdQ1kH5ddUcNG
 KER1kIpH9iHePq1GsaLCcq1QMANZz636wQdx3E0prxB+bb9Soa2tCXAxMm1ajvbf1KIc
 JWZHPxKGzZ5v1dw94/HHFmDEA4hjGFtN4QTg4Ux6LGocbCR0+JDRYhCUxFQuz8klLCr8
 SMcOPlloRkkGiLY8Wl1ul/ECPE6D/KQ/xLYgKdvPeKqISPqTP6tvoRtQlnlJyafeWUrX
 EkSk6ibOMUPDLtajDRODAxsWpcWaqHRgyznUIRKBYs0J+TyX+zcrQZy2yuyK5NwccrYF
 n3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t6W0xpswfKO91t23QzCn98B2ph5OrwBwXLSGQ0Ysfqg=;
 b=dYVd6iEf3QfKrmxRDvYhCOU98o6PfjVmRKXLjrHB/6W1PCaMOIo/Djx4gKsaeJBvHx
 aDeng/0WFHApBmGG78+H2bECHcBhq7D5GosPsdx6Iz2Gx1cPG94Wuzq8jiQopkPNbeyz
 IYJ9yq8r6nvOnx70+VIMgA5NLO7OIUSL7hiJQCpU+2SSKI/0SHC41Sl9d5X7K24tmcLu
 +3ei93/mYX1dg86rhdQqAZq1ssDleokuyHRawGUD7iTlwyPocRN80TLVTaX3DekGAo5v
 v9MkYfLlzDUTVGEMgnpm637RmDe7b/ZV97v/ARzohXaMa1gVenbJN6HQPN8+RguD2GA6
 PdoQ==
X-Gm-Message-State: AGi0Pua6TwzedsbCTmMjKkd9c9vmgoIXQ9B/A+v75A1cjdxoMIBGR/RV
 ex49f5K6VJbelX3CZPMW3IdeMUZUffU=
X-Received: by 2002:aa7:82c9:: with SMTP id f9mr444634pfn.258.1588277003238;
 Thu, 30 Apr 2020 13:03:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id a22sm494864pga.28.2020.04.30.13.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 13:03:22 -0700 (PDT)
Subject: Re: [PATCH 20/36] target/arm: Convert Neon 3-reg-same
 VQRDMLAH/VQRDMLSH to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b20ac6bb-d507-79d1-82dc-b009b20ca13b@linaro.org>
Date: Thu, 30 Apr 2020 13:03:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t1Lm0PmC7R74

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon VQRDMLAH and VQRDMLSH insns in the 3-reg-same group
> to decodetree.  These don't use do_3same() because they want to
> operate on VFP double registers, whose offsets are different from the
> neon_reg_offset() calculations do_3same does.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 57 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 36 ++-------------------
>  target/arm/neon-dp.decode       |  3 ++
>  3 files changed, 62 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
