Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2191623lfm;
        Sat, 25 Apr 2020 12:29:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypKQaGb9i3ddJ/zhD4bAEJEcQuKcw3kwZ8hmesCf1IwhEYYSjnIF39O/Q9plA8UrUfjg4noL
X-Received: by 2002:a0c:a98f:: with SMTP id a15mr15381627qvb.105.1587842981480;
        Sat, 25 Apr 2020 12:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587842981; cv=none;
        d=google.com; s=arc-20160816;
        b=wbYFDlC0iprmhRIoLsvOROIMOz3+YrlJ0DGKXP2zRxWf5ldgMiPQ5eM+lTY1IdwzKw
         dwzLKw1QaTCR950B7ALP7Cgue+PBdqnmA2yeMyrzJBOlBLU9ToulEh/oVS4aY/Vh41P6
         ywS3Vuee48jA/QfUMKR9c0wrEazwFm8cFpD9QVDJUhLK4p6I8h7ZdFEZNO/jVfQk3OVv
         wyCpFDMHy54vRKWs7f6H2D1aOeSnk+5M4jintkU+t4zWBSXxsP3DSHnQFwODcJU5RAn+
         KNBuF9gwLUvm7CJ/2YkTcFWvwux7b02CX5OkJRu/YwkIEAOz1tOKoUKozZ5KG7PY08SD
         HriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NytczcyzsZZ4HfE7oOZESY0zhYYG/GFVA/f0IKIwRs8=;
        b=0SNmoGiQNnQIQrpImv7AfJiP9AEZ4RF4Vm3YaTwtQkxydNW+p5K9qRCfNIMIU+0Iky
         f/NIq2i9jXFK4H20G38DtxV3Ts8foevl4ieCXtCy3JtD2Qd2I3KjkQIfmK4aqDTwuBWE
         Idnsd3TDmXJ0Tspb6rAZrZmyNjFEf4yewkxloWO3YtpCrvOOOEsdCu3U1FcriBxxENYK
         OAW70Jvvdb736wUIxL2WAOL90Jl4Yr2D8j1xBnpun0jPyfk2U6NNSZ8zvuSIsdtZjNik
         kgtC7H7Fmcwfps60RdSRszyH+hl9xLY9oSvA2ikk7Ahir/4NJJHQipeQEzXBjLhpnTw4
         /URg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ELk/ndQ0";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a26si5748290qtp.186.2020.04.25.12.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Apr 2020 12:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ELk/ndQ0";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jSQUe-0004Mz-Tt
	for alex.bennee@linaro.org; Sat, 25 Apr 2020 15:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jSQTo-0003ls-5G
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 15:28:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jSQTn-0003MR-GB
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 15:28:47 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jSQTm-0003Fs-Vu
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 15:28:47 -0400
Received: by mail-pl1-x629.google.com with SMTP id s10so5131171plr.1
 for <qemu-devel@nongnu.org>; Sat, 25 Apr 2020 12:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NytczcyzsZZ4HfE7oOZESY0zhYYG/GFVA/f0IKIwRs8=;
 b=ELk/ndQ0mIR0cFYj9RZrfyLGXjhy5v3RDPAdi1S7/9gSK6vqznXS3LwW20Q+v90ZzZ
 Cjswqpbh7l3pyLPzsOCOp74ZAfMmpTQYDFLJn02JoCUERlJRhdbtIYyJWlBzdCRzIKKz
 b1chcIa3cBhYEg4JRyRKMUIKhw2gm03KldEh8FK3F5zMDx2gpBqMxEHTtSaQm7DorGtq
 AwnsiWsXPQEfmJ18RtgQXGQkOj0562xFG23sX0aOrA7xmaeSBfFvrFug6T3NGnua0UJ1
 ofkOKzuPvTNhMLvzmwuj/80T9DxINkYRtrokH8OY/iW3MTfLR1nacGEs2AvVKwVRdLIl
 jt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NytczcyzsZZ4HfE7oOZESY0zhYYG/GFVA/f0IKIwRs8=;
 b=iaMMp7EJ+OtJH/2HXywO0ktn/P1P0fmXBlZWcOKPvAnDPMqfoRcrOY4FqOP61zymS9
 8/hVmT00emOgYTnvREDWNsGu5j+24QxxUFoXtuvn8RRFdamhQ4+ay1IaR0VHYNXME509
 54zJECMvjCWInGgLU4xx6fzfYn44qG/U7+vMQ6qoRDfFybP26R28eD0+LKHohOMPh2tr
 HqeK+vJrq5x2ItGjzAxvjbLN8LEkEwduwRd35meel9TS9j8B7DyemgCZAQewRfS/diuI
 EDrlpTB5/so4IkRBeXRUoYDYvI7fDSqzChT9ZAyG8av0RJXNB64kfF/sv2oXgUSJ3K50
 bgFA==
X-Gm-Message-State: AGi0PuZWePKJQY7V+iKXrtMuC9kcZSK//Rc9imRfo3Ek6NseRCe7HCGr
 pOpuFG8qmZ6SEK2GyTmAO7sCX9ugi2I=
X-Received: by 2002:a17:90a:db0a:: with SMTP id
 g10mr14208898pjv.54.1587842925182; 
 Sat, 25 Apr 2020 12:28:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l137sm8726325pfd.107.2020.04.25.12.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Apr 2020 12:28:44 -0700 (PDT)
Subject: Re: ARM SVE issues with non "standard" vector lengths
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <CABoDooMSCvi4sxWS-a3cQksD3V5tnHCUbGPsxW69Ou4d1rpQZQ@mail.gmail.com>
 <5c5d4c91-c819-8bb5-2dc7-784cbdbfb789@linaro.org>
 <CABoDooPSYj5ujXj-jKTrBDVFDO3fp=k6ev+Sf=4EgtG7R_kX9Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1dc23e17-f348-f2e8-e292-641619968a6a@linaro.org>
Date: Sat, 25 Apr 2020 12:28:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CABoDooPSYj5ujXj-jKTrBDVFDO3fp=k6ev+Sf=4EgtG7R_kX9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::629
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LYGCrzBHYlhs

On 4/23/20 9:24 AM, Laurent Desnogues wrote:
> Looking at the code I think sve_punpk_p is affected too.

Got it.  Same issue as zip1.


r~

