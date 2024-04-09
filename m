Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1949071ejh;
        Tue, 9 Apr 2024 07:34:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLN5HxAwPQgLreCLM3FK4Z5XgzIOU/yiCWdE796BSN19YvIjdHxvIx7isuHSmHbTbhY4mcWSCEiQm9XMmoPuBU2siQ2go6
X-Google-Smtp-Source: AGHT+IFggowvwI2iU3A0Pi99q1p5R7d0hVLvfgBvEm/a6xzN2p56Vm1A2ivAUcKkM3t7O+H/mv4W
X-Received: by 2002:a05:622a:14c7:b0:434:4011:3cdb with SMTP id u7-20020a05622a14c700b0043440113cdbmr13445162qtx.54.1712673297038;
        Tue, 09 Apr 2024 07:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712673297; cv=none;
        d=google.com; s=arc-20160816;
        b=lHzYRP81jEH/Dq6s5DjG7/MCE43Us7cDrb9skw8JOxIYe7zSN6DL8nfME9IuXxJVFU
         shGQqRfOtKrbIzgkB9/74wDzd45EUJ8bysfOi0Zg7mGM5uznJajD53Q2dNvUnPdBBavv
         InDfUAH+SCrrANq5n+Xq9Bmea8bfMUwcsXjkkwsCKLok3xr5KDl8tzXH4HqGXi6nCFk9
         6CpSLlacxCgLThTM4wz6jcL0CEhBCrzGpe+hPd4ekDlg5Jh5gfgJ8kZ+Et/0OToexr25
         5Z3xc2WfxxQEpgEc7PyiRQi87piyolo9RC1iI3AT1rcgQOP3Ep8pUlzqZE1ReatybrtT
         R/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yM+0/27o2IoHQcBevLZ/8vstUbrIPLtriNpel/hEE7g=;
        fh=ODVSXFH+Km3bqtpHPBc6cNsJMupdfjr/OHFbr+8RbUg=;
        b=hj9UqtZyTHShtzUV98CcyaGmhgS7UA5PrBE2KCcDW4f63Ij6RxqAj1jKPE9MG8pzGu
         jnLoCSo92a7kBR8KR0InXP2/VjYx1t8yJ/d2KONRmSxLhGGdfjsdBTiPjxE2j8thiZtA
         M626NR3u6aaQDL+xTwtGrUpHRDXWNyIjKV0JTYFUBN4vhv8WG4Ow6deCf8zVLLPjRhHn
         kGHNuvJF3beyW2PzZnrTkrB893PrTdrSo+AE+4efLxFPZoBual34ILO4otkT34uzRAcd
         W8/Y5MhhMYVX6pfCubD8P1XxDW7kxiyTySqeoZu3qBI4iPqwR6/fPryyAxvZ85Btroh/
         nMxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z18Fwk0c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020a05622a020600b00434a3524997si4374308qtx.0.2024.04.09.07.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 07:34:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z18Fwk0c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruCYR-0001Kr-GP; Tue, 09 Apr 2024 10:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruCYQ-0001Ke-K6
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 10:34:30 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruCYO-0002JY-VZ
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 10:34:30 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-416b7f3736dso2988225e9.3
 for <qemu-arm@nongnu.org>; Tue, 09 Apr 2024 07:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712673267; x=1713278067; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yM+0/27o2IoHQcBevLZ/8vstUbrIPLtriNpel/hEE7g=;
 b=Z18Fwk0cFOkESsbjk42seGi89sJ4glVMnFwLhDWPmpl53fqewbFloLkysUSGqZM/Tz
 RyYPVrO6O2rTNXqR2bBpP+x3Lvp15HOO0qsHFI/HgYQiXTruN6Kz1HJyplbjOSlS5mMU
 ufKTax6OyQagpdvatp3bJ9MdxhkLjrvWerBh81YwT3eUY2g+sjU+yp+gkDviKXg77CKF
 m27LVq0MlvfqaiwPvP0pv41c1xIyiLkXaUbt8wJfKbPYLu94st2sCNqjHP934JhDj+l5
 nZuurVgyRam0N950XbZRBf99wjNnZY7PG36LStQVPJHRxuA/eA8HlG9jgRZeKC8gRozP
 vDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712673267; x=1713278067;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yM+0/27o2IoHQcBevLZ/8vstUbrIPLtriNpel/hEE7g=;
 b=j9urudBEtGqjkZowx2A59V3U3VjGWAkNmW9MPYqVwzSeWfIBm7gtaMyMWN8yzXYGD8
 hzIlLOoA9RqlxwZ3CzuN5AcAUUNH6u387o1Mfk7AvRKirQQNVUP1KMb+FcFnMRce7fAY
 mfIn+Oj9RczAwRr2tKjpCGMbIKR/11bserdoefoFe8T8JATo+ZQeHcGeIkNrHAGodAIT
 TOoi1PWGjJil9Dh8qCznmPTw7K3BjidkbNRHqphBuFLZQ5zll4AF9PeqrFTSKJ9njiyV
 3ONIa67smdn1ooiyM4uo21ya/rjc/QlWWdKQ22ioyp4HF1n0lyz0RNUeGyZTcMVriVZk
 lCgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKbBkxRjigo5hQ941y4z7fAjAmVIdQEDPGAFr8Lo/GyU9nAqSPivm7piBwpB8xchkGqawn/eRpgwXqAcJd0aX0dB+6
X-Gm-Message-State: AOJu0Yw57vJg+WyBgm2KAW7BmzCsRQkQaEIsj0RWh8maMOzP0L9dDg+k
 +483wFfNlG5d3sjhmkinK7A1kRm+hwIvorwo5YyiC8lEBuF325M6JAifQJaaqdY=
X-Received: by 2002:a05:600c:3108:b0:416:4923:1f2d with SMTP id
 g8-20020a05600c310800b0041649231f2dmr7115454wmo.30.1712673267186; 
 Tue, 09 Apr 2024 07:34:27 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.160.134])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c459200b004161af729f4sm17537443wmo.31.2024.04.09.07.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 07:34:26 -0700 (PDT)
Message-ID: <9a37459f-6d09-4a82-b506-acd574de66cb@linaro.org>
Date: Tue, 9 Apr 2024 16:34:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 v2 00/11] hw/net/lan9118: Fix overflow in TX FIFO
To: qemu-devel@nongnu.org
Cc: Chuhong Yuan <hslester96@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org
References: <20240409133801.23503-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240409133801.23503-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: LXfiTJOFLqgm

On 9/4/24 15:37, Philippe Mathieu-Daudé wrote:
> Fix for https://gitlab.com/qemu-project/qemu/-/issues/2267
> 
> Since v1:
> - Renamed definition as MIL_TXFIFO_SIZE
> - Addressed Peter review comments in patches 1 & 2
>    (add comment, return TXE INT)
> - Trivial patches while digesting Peter's analysis [*]
> 
> More work expected during 9.1.
> 
> [*] https://lore.kernel.org/qemu-devel/CAFEAcA8vvURMn2FaDP9tXtP5eCMs6-XFOCR9ypo=WBH+6g5prw@mail.gmail.com/
> 
> Philippe Mathieu-Daudé (11):
>    hw/net/lan9118: Replace magic '2048' value by MIL_TXFIFO_SIZE
>      definition
>    hw/net/lan9118: Fix overflow in MIL TX FIFO
>    hw/net/lan9118: Remove duplicated assignment

Patches 1 & 2 queued.
