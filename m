Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1535578njf;
        Tue, 3 Sep 2024 10:51:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcpP0QrEFHWV0d20kiUWAiN5TsPk5KehxpN0K3joDOzVWGIqXOyrl906dM0y6KAwnk28WlFGDOQSWYvw==@linaro.org
X-Google-Smtp-Source: AGHT+IFsz+LtqBThdvcZbsaKYRS1UGKY3+0h+PlVKRK+INEP/s6XFFDWEtwSJZB/DVGIY1bmuJZN
X-Received: by 2002:a05:620a:4481:b0:79d:5b21:804a with SMTP id af79cd13be357-7a9787ea737mr480821685a.14.1725385918144;
        Tue, 03 Sep 2024 10:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725385918; cv=none;
        d=google.com; s=arc-20160816;
        b=x2e0IETse+dbk6qnQScc02p0qb3kpzefRPU3ZEE2uSPvHrL+b06I4uCRCG/Qqb6QcO
         /2GfxGHuNZZORE8MpEm26RIeWPcaFSVre++BF9ULlH/Up9bSOjThfN3F9vaHdkdqE05A
         SmYVtiSRM13fMvKh7UCuBNQXezha5y8k0qNkPj32m5GnUwzcSR+AHkwy2kKvYyLSi1Zr
         8Bv0LGqORN4TuJaizyIfMhAbXpJib9rSOLbHpZOKTkKNKnqdQgA9mxpU+T3GoYwiXkWh
         9kk/DkWB4DItCPl1gW23aFA6KYpa1h+65jfuFVjQ55Y9nLiJcCeUpH8WA/rHgYePIwVH
         d1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=f0HGyq17xz8aLPOVUlajFWTe41Bzv3/jWsw9rtP8U2k=;
        fh=wuFDZ7zYQIVBZX780yRb7GY2kgW/UI4CbXOQwzzbrkg=;
        b=0ItP1tP3ifcbIzEw3y3biAyjCSu5wtpIizNkIo2DsZiskb4DH0N58HsBPpkF+eM5CI
         R3AAVaMg007+mUfe3SfQ3yuFGaiX2qShyy58e/clWQGFhelE1UlqisD6eMIrVqVYMq5E
         9QYHdwbPDxtD/cBLkH4pe9yFAF+gWlwSK1DzbdyT32boDO69dPbuKG4ZcOLUzyI8t7lk
         /UePTUkrNANAxVEdfv+fAUuyKmXRq8mvT9vH+0Rb8wOaWpkP14vtI7aGMXRssMNg9E1D
         datcGVGE7mWl3bLtAl1p9xCuPbaeho51N16nzZK9pIEgXeNe5yJvrn9MXtb0hp01DnYD
         7qiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yLdPnD/V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806c46b65si1333458585a.221.2024.09.03.10.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 10:51:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yLdPnD/V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slXgg-00020H-A7; Tue, 03 Sep 2024 13:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slXgd-0001fG-E6
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 13:51:27 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slXga-0007S2-1j
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 13:51:27 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-374c6187b6eso1718772f8f.0
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725385882; x=1725990682; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f0HGyq17xz8aLPOVUlajFWTe41Bzv3/jWsw9rtP8U2k=;
 b=yLdPnD/VzK/mWs2vXlmeRdSnwI7Uehzd9LkwlUjmrZbDHqd39OWw7afK+EbFtPvOH2
 K3xivU5p5TzeKfX+/UCG6dC9YFWV8+N9emLKBm9P3xym+JrSrfTLIX+LNeKJuiC5c+2/
 Zj8SwDLdPe7R9q0CX77RwZtt0c+sBFjY9kFD774lTbd65xWXhwjVah6p2zHq91awojbS
 a02RaR9WyjYuRR5I+A4NVDf3RS0FG3YUFERQPLlWhVcfuzkT0JaMacnnRhfuy1Ws50nb
 MShEl0pWVjn3h7vQmnUJ/qykGyk8sEugAuJl52Oad7g2ud7/wq+NEuesyG/er/BoMtdq
 e7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725385882; x=1725990682;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f0HGyq17xz8aLPOVUlajFWTe41Bzv3/jWsw9rtP8U2k=;
 b=BBKdAJQZyLD5gq7jGAuTxq/I/IZumLlxqAPn/V27zPPtlE0BL3B3zAAnwLk4wGOUjt
 h8neh6sWQ6oatxArG9IuKj5WnVTJe2gmLZQGv4zK5L/zp+533TQmpKY7gEWal8ATz6FC
 D4sko3jIiqLwf1WAPrsI9H4E3Y7ZM+CYWe8SAGJyMPBVRefwuMgscQRfaMcduJ6W77jx
 dMGmnRmDPEqLFtPEqeuv6xhVyjEhEPT2OYFlNdWLj8t/U8Bv0TVmRzfyCqP2a24ot2AX
 Ei5W8uH0b8pC7gzzD2rRvv/B6XAkMBTTeybcaOd825H+VKJ8KYXWrYUx0w3UFxZGJ/JB
 7kQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwpC2+S+k2YdktmOs25HHGSFpxJkULTOmtLHHtcaVLRm7I+kODJyUCbkdY/vSZhDmPSPpxU2NbKA==@nongnu.org
X-Gm-Message-State: AOJu0YycxVeSLmZSMP1riD2z4i/gZ7tXP11ldyZp1tT2TyxB8uB2cPGM
 R1im/RZ4tSjHfINOviiD/6g3gxtbmmLJWpY8UpHXrPs2XYj/SfKNa609/3EUO+c=
X-Received: by 2002:a5d:4b45:0:b0:374:c15a:8556 with SMTP id
 ffacd0b85a97d-374c15a859bmr7602046f8f.50.1725385882035; 
 Tue, 03 Sep 2024 10:51:22 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374ba30d5b8sm11113258f8f.15.2024.09.03.10.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 10:51:21 -0700 (PDT)
Message-ID: <dc0370e6-1f31-431c-8510-a954b065cf8e@linaro.org>
Date: Tue, 3 Sep 2024 19:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Mario Marietto <marietto2008@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
 Eric Blake <eblake@redhat.com>
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
 <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
 <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
 <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
 <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
 <CA+1FSiiH9LP-7UupNLjDyZJGqJAHAjN2nSLFm9fCx=ZNphxGoQ@mail.gmail.com>
 <CA+1FSih6t-Ccnxh1GvOFMf9pMjcfV1V+yyJHV=ZH0c2RY0Kjng@mail.gmail.com>
 <268989a3-cd5c-41fc-ba0d-5eb71bc6e9dc@linaro.org>
 <CA+1FSijygoVZmTkYR8Xoob4yQQdf9o3CZ2-LmzDrBh2e0VaerQ@mail.gmail.com>
 <CA+1FSigOmKen0QPKSEQqt15Zzrx4UFSCpj+5DJMCJtGnFcE+Hw@mail.gmail.com>
 <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
 <70b240aa-98de-4998-8c1b-34349fc831ba@linaro.org>
 <CA+1FSiiyb2v7oy43exRuY7kQpLgUcEifAE2zrEtpYPkgAY+TRw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CA+1FSiiyb2v7oy43exRuY7kQpLgUcEifAE2zrEtpYPkgAY+TRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: qfghh6/pg5Fc

On 3/9/24 19:17, Mario Marietto wrote:
> @Pierrick Bouvier :
> 
> ---> I'm really glad to see it worked! Are you already running the 
> raspberry image, or vanilla AOSP ?
> 
> No and I don't think I will. I have a project that I'm working on that 
> aims to emulate Android for Arm on Linux x64 bit. I knew that it would 
> be slow,but I didn't think it would be so much. When I used AVD as an 
> emulator,Android went faster.
> 
> 
>       @Peter Maydell <mailto:peter.maydell@linaro.org> :
> 
> 
> I think that I've understood the reason why several years ago it worked. 
> Probably I'd used this special version of qemu :
> 
> 
> https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp 
> <https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp>
> 
> I'm sure that it contains the necessary patches to be able to boot 
> Android 10 on the Jetson Nano.

Hopefully you are right, but unlikely:
https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-aosp

Also, quoting Eric Blake:

   On technical lists, it's best to avoid top-posting, and to
   instead reply inline to make the conversation easier to follow;
   it's also okay to trim quoted parts irrelevant to your reply,
   as it can be assumed that anyone joining the conversation can
   find the public list archives to catch up on the full thread.

Regards,

Phil.
