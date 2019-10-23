Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp992940wrq;
        Wed, 23 Oct 2019 07:50:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmFEwiS9dRdwnbjAJj42CB3CbsOgTGPQ9g6S0mjkzc92A+NR3NQq25LtuuoQgLsl8AYjbZ
X-Received: by 2002:a05:6402:1511:: with SMTP id f17mr37885070edw.232.1571842204059;
        Wed, 23 Oct 2019 07:50:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571842204; cv=none;
        d=google.com; s=arc-20160816;
        b=nIc1ktEcSEPIJtolkp2NRo2ztNaqz+1Eayr3eioODjASinqgmwvKtLmnfZ4RClyGQV
         bmqzR8G5S5XTlH7tjMALZMQD3Ry3mOFIXP8w2ZBGOYY5PSTeM+VKZc3rS7Zgysmon/9c
         TAzhb1093YQ5vZeuuC5hf0D/qfTRPIAzJh/+0ekGN85nB0fDD2d389uIQYon9fbamLjH
         2/JcAxkK1h5DzK9qvVbO77HJ4lwW/S0rui/TbdyB8YfpWWJgZzcBeQr3LcQbvTAehVGM
         HY2QMmkA9uAZMuMJGKxD74V+qZUTaRgGjqhK6SA66vfXLdf+e3UMVrEFNQbzp2HI1v3L
         06mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=1vUml2yPaZYwill4zJoPkUXYGGGkcBcMmR85Vn9D5DU=;
        b=F8qX3MsRJMj9RoVHQ5NrhX2nsOdDxbH/MuLWpzHdgnr02rVJYpyxdx0Jis1Eci9SkY
         48l4injOGm/8YKrH8X2h/dYhgJF34KONUpf21m6bl2Ok3EaGq0qDwv09gXFMZ5BqFi9/
         U7mJoPljTW/JMuRPz/9HAdL+iOITpPXtSsrxdErITUMYYipeEzwFrsi4UidSd+evpuZ2
         cIvFD8S5BS64HN+XNUKzFHHdAvuGXPqtewYhXUyd7izWFFSaABeA73E9KaLNztVBE3ay
         Ou7zqwdZG+QutYTUSvwXmtKqMy4yXTQh4LqBWCQWL/BW9ZqZ7HgWF1WqdCEg4aFlGeMR
         NMPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o3BtT8f8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rk6si12914316ejb.129.2019.10.23.07.50.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 07:50:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o3BtT8f8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNHxb-0007RJ-3k
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 10:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60616)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNHxA-0007Qv-Nf
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 10:49:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNHx8-00021n-7t
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 10:49:35 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:44192)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNHx5-000216-1n
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 10:49:31 -0400
Received: by mail-qt1-x843.google.com with SMTP id z22so12153528qtq.11
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1vUml2yPaZYwill4zJoPkUXYGGGkcBcMmR85Vn9D5DU=;
 b=o3BtT8f84rveB49Y9EN1ZNQnHnst6kdVDEDk8hFc94avzAvrmi3FNmneknvcTXX2NB
 GCdcjWwnPZgjG1GVNas9aiztpB3I88qcBjgOBSVpJAbxp9FSPehXrkxEcKHfp24jX8UG
 kRSmzBAG4OnHy5vW03NvvKXc2iX//gyo9/ZtpTJjMBZ124aaBt2gVRxLyuiATUYsr9Qz
 vyCq0fF4s96Yx08wrby9xkbyeV4aIA/eYhhDYkCvUj2Llnl2RmtPXdqGruNnsA9ITW2t
 OZpuNuP7mh3DYCLUhz4RHegGqogU6eaXoZXfUfTu349hkq3E6gDovIXvcucCP9We8ULc
 0vsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1vUml2yPaZYwill4zJoPkUXYGGGkcBcMmR85Vn9D5DU=;
 b=b5L4/sKYGJrgqdDzdPXhVQXn3f7n7JzACCQ57Ryftv4r2YAq3C6mDqQC31S4W+mqyx
 WRXOj6C7UrHTALvvII1moxxIyVeUROYSJ5bb+WVg0dFfMr0zH6ad1OAYJUY55mmG1TpR
 AXEpcZG45ljWHdc5qJJi6TBx7ZLqkgR+wbPB8e0636+k8U3UE+fWuBeOIprJ2mJgIXjv
 kplo7f/znlTppYN7rk1DVZdsvuLI5W2+yoR7Rf6U6mhL7Q/lhaoVo8XQHA0xelRRAYMG
 LG6KbIxBJEtD4qjNA1iF+E5hD52nIeH+kmWmBtQLiEkheTHeLxBUlsEoxnNRY8D7oYwM
 +zNQ==
X-Gm-Message-State: APjAAAXSx5QCOB+qirryWiUNOeUJQpd3hus5GDLE3sCNpXlG1nB3AO++
 GvbQAjqbafixgRTIHiY2jY0xBjggla8=
X-Received: by 2002:ac8:1207:: with SMTP id x7mr9572821qti.255.1571842168131; 
 Wed, 23 Oct 2019 07:49:28 -0700 (PDT)
Received: from [172.20.87.163] (rrcs-172-254-253-50.nyc.biz.rr.com.
 [172.254.253.50])
 by smtp.gmail.com with ESMTPSA id h129sm3781267qke.49.2019.10.23.07.49.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Oct 2019 07:49:26 -0700 (PDT)
Subject: Re: [PATCH v8 00/22] target/arm: Reduce overhead of
 cpu_get_tb_cpu_state
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
 <CAFEAcA-MyKoA63UF6DYQ6J-dKihYn9iyG09eFCgWT8j4OqsQnw@mail.gmail.com>
 <CAFEAcA-Xj-6CdVzgfcVONipApD5b5PZ84nPnvbbOQjQkqQLnqA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6e06dede-2470-92e1-eba9-40646ed56af0@linaro.org>
Date: Wed, 23 Oct 2019 10:49:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Xj-6CdVzgfcVONipApD5b5PZ84nPnvbbOQjQkqQLnqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
X-TUID: n6yYc7csHlpt

On 10/22/19 11:38 AM, Peter Maydell wrote:
> Turns out this asserts in qemu-armeb :-(
> 
> /home/petmay01/linaro/qemu-for-merges/build/all-linux-static/armeb-linux-user/qemu-armeb
> -L ./gnemul/qemu-armeb armeb/ls -l dummyfile
> qemu-armeb: /home/petmay01/linaro/qemu-for-merges/target/arm/helper.c:11267:
> cpu_get_tb_cpu_state: Assertion `flags ==
> rebuild_hflags_internal(env)' failed.
> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> Segmentation fault (core dumped)
> 
> Dropping this series again for the moment.

Argh!  I had forgotten that we have no testing of armeb in check-tcg.

Yes, I see now that we need a recompute in linux-user/{aarch64,arm}/cpu_loop.c
specific to TARGET_WORDS_BIGENDIAN.


r~
