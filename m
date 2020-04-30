Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2234134lfm;
        Thu, 30 Apr 2020 11:50:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypIN1PGUwW90QVIzqReQTIgzJXxNF6SLq5QHndNwBO2jaZytB7Up9w8OYD+ScluUV0X6jVLW
X-Received: by 2002:ac8:7b81:: with SMTP id p1mr5323812qtu.134.1588272603122;
        Thu, 30 Apr 2020 11:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588272603; cv=none;
        d=google.com; s=arc-20160816;
        b=kmJ8sQiW24BX77p3CdXd1fgHW1QO6oGAdEZoRBTehkG6bjikZdbcdtwXmqGWAqgXPY
         o5NdTYhQtyWyfz345ynqpFv6eZB6g8pavg3LbGP15Kv0JKPu+IIh4EnnDyHlXA9HrAJT
         XAAdJFiszUY0fjtKT79sfPtHxVwo21hNJUTuegibE6yvsP7XrRKOdhup3H9mpMtPGfDG
         DaflNB+f5ny0+UAHplGyJrBScxJ3Hpvsb2WmqEZuQv8ik7jyMV7TwKORmzu/PkfZOpsB
         ddhZmAQ4zUlZCrfXegEGlmuFO172tPla/9Akd6OTQ3TaKdjeFsTJf8N50NzEvf13ahob
         wv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HwR4zFUPFxcQy/cikLbpB1FXbScJZkDFf6i8QlBWwGQ=;
        b=RqoEDIkiXjI4NA+g+zS7JqTpgWnpdaBTTA57VA+zIt9ItN7mq8H2plKmTctY/Fkc2n
         GGT3Ix+PmQ6ZlaaFCZnGEDyO8PbnjYBhB/6xq+c2HHnC/kRFVsscjkzw52Bn6U5zt+Ib
         ppjAjwxtKuotzxBm8qcTCFNGUZzqqs8/NtTvGEQxwYZpzYqrOujEVbfJ2+/3oqkqfNy1
         UURr2NSVZ9DnC8c8SpF+KgTeGV+rwr8UXd3ORAMqivfHtPwaLhuMkD4mrKhRKLBNzVDM
         dMwQAti48kKKnVnKvvvYVpcYoCPNGSG502hOWACFJiMm4rP3KLhDi7UfSd3XG5JWa3vr
         0FRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OJcXAR60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 93si320031qtg.220.2020.04.30.11.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:50:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OJcXAR60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUEG2-0006RM-CJ
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUE3U-0002Wr-3k
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUE3T-0006Cg-7F
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:37:03 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUE3S-0006CT-QJ
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:37:02 -0400
Received: by mail-pl1-x643.google.com with SMTP id t7so2599693plr.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HwR4zFUPFxcQy/cikLbpB1FXbScJZkDFf6i8QlBWwGQ=;
 b=OJcXAR60glMlU8ieSBlmaGQCru+CyC5oiI187WTDqV5BkGjMf5Yn1SEDGpLEuNlBbm
 BkhrvTVUjxe/Aa2k8Yw9xGlgRDvfanboFtwiSlByvNfZY4iPM1UC3QuVCC7qKtQ4Bd5B
 uPBvrgFqHU2/03SbwQT7g7sqgkN7mRjJ+8UjiNzK8WtN1Xm2Qk3KKZN4Dat9aXV/+nuT
 czt1VtwvkIIPXyGcKJkSbj5zQTTLSf4XLdikPSCRw3XR6lQ+UWz+IP99XWKfcmqxMmZ6
 rqifdb2ZVKZzci2SA8NFl0C9ldWvVtgAgFYFppv95bW44CdTD8AytaOyz9ou7ToHqHM3
 17kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HwR4zFUPFxcQy/cikLbpB1FXbScJZkDFf6i8QlBWwGQ=;
 b=F4d+n8kceKd3d9aIy/OTQLVzEXAemLXvm6CR/yVcxv6bMjAoII0OlLIyfjWqf2siGS
 9vquALC13bs9Lwm5IjZpx/edOBMchzBowd8uUNnuB3UVrXkPjA8OMZYCQLzoMk+Uy105
 8kVfVKIyzKTYgzoWtjKIBDLFml36nIR0zZEgK+xpGGDUtllNSSFXTUobXUlhzJLLSgkQ
 5uNF0SEbXyrMhzq1gRVceaUUBcrHkZQEDcGMPvncUxyyL24YxASzlie+l8/ceHM4oC/c
 P20fol5uZND4kjfkUVl7HV1BQiZuqCqTDbeLpexo27prtvz+yZFUinWrbeVu4JrkN3Fv
 SsBQ==
X-Gm-Message-State: AGi0PuYjSlPJJZ5jrlIDN1mRDxpEL8fG4td673lKRpH7gb1MF31n4zYf
 SU7zaHnY0jUue4PgocNlbDdi8w==
X-Received: by 2002:a17:902:403:: with SMTP id 3mr364269ple.102.1588271821232; 
 Thu, 30 Apr 2020 11:37:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id p64sm442082pjp.7.2020.04.30.11.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 11:37:00 -0700 (PDT)
Subject: Re: [PATCH 06/36] target/arm: Convert V[US]DOT (vector) to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <475c43c3-f1da-e203-0faf-d321743fc396@linaro.org>
Date: Thu, 30 Apr 2020 11:36:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::643
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
X-TUID: tWikaPWt51rR

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the V[US]DOT (vector) insns to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 32 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c          |  9 +--------
>  target/arm/neon-shared.decode   |  4 ++++
>  3 files changed, 37 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
