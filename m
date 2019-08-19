Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2962233wrs;
        Mon, 19 Aug 2019 10:47:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNSfSuOJ4dowKPp8EcsFXa477SK2Sc/lvAEuitCuChzVkrjJqIKxGYG1jHbv6PZXJWsYu2
X-Received: by 2002:a05:6402:3c8:: with SMTP id t8mr26696481edw.211.1566236838801;
        Mon, 19 Aug 2019 10:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566236838; cv=none;
        d=google.com; s=arc-20160816;
        b=e57penQhAub6mEXcoKz4RLlkT7pwxrmqfpz1OyeTUtSAvdZsKB7SzbegrkMKjB9vrw
         8oBzs6cFYWezc51aaUQKuVLcNDuMR8wnlDMLDvgL6Mlq1cdQcUvj7M95+BkmU3VfajYh
         vCXBn9T0E4YooqJgqgw29DkV0mg5gWAri35vCx8Wdc7dQYxdpqHofNO5yGKR1ZXWibUj
         q+29YEsbl4CHbbgDNNnX92zeXhrxFkMcIki63TykWto73YC5RFQKXLR3Z9zSyPSADiAp
         ushnZhOQUhk8FkKLPZDmO1YgpUsFRY2zVkjbzPffdlBk2wrImZpcQFg4Cf8F9bdyzDp7
         9Zgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=aW/7EqmxYl7V/aRqLkPYLm5gG+Dfznres2rcMuTGzh4=;
        b=RAMUxI87O6alc63nE0+dIwWZMGUrdgNID2RxOx/RMFoAJBq+wA1YM+O59vTSjxwsjV
         x6UPTS8eEHFQv3mVM/P+sp6rXZP3g9BAWlZeCK7TIGdaKxJueHaPJ4FtvsLRMKc6yXzm
         Md0hU1CQrvmOkmaGLCSU0JpTZPhKYTmHnD0Ezra5abIue4/8qPTQyazfacq3AH6IRaXv
         2JwEoXb0Of7eDDQmcXZ6YM0vvq9kKj3yF6wjU7TZijHHQsCcbFwTQPg7bwqo/jVjXxHZ
         34NFUm3NP9rN1GXXrgQ8WSnLf/TVV7kc/Ax/8S5TYw7t+3lbMDINHeUMGR3oFoyda9XL
         Qw8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l48si8458331edb.254.2019.08.19.10.47.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 10:47:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzlkT-0002qY-So
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 13:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51068)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1hzlkI-0002pp-Tf
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 13:47:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hzlkH-0003Sd-JA
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 13:47:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34066)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hzlkH-0003SE-Db
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 13:47:05 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 544864FCCE
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 17:47:04 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id c11so30876wml.6
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 10:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aW/7EqmxYl7V/aRqLkPYLm5gG+Dfznres2rcMuTGzh4=;
 b=E/HtFCA+jT6DaomrEmkFN+CZwcpGsoYq7ihoYfMyMMtd3KbabTkebWrFwmbtywhDyd
 MsIsjAt9ad3hVywVh2X/ExZ4KI0qzwacSQyqHQOkUg7EEiuQGjWogu318CNUNz8l07t/
 GdZiwpx9RlM0+h3YlY4W/e6xHCef3NOaaBFFX1G4X/VhL3s6FLEMxQKaDDvRD0tXQRZZ
 +yDaGpjv2hhT/bCp4LYs9TlUT7Eag2ab9pbojrZ2o9UshBY9If0R/039UXYXQJxCw9fi
 vrJ0KaRDXailwq6L4i+/+F+sQSmbs27H3QncAsn/a+3QPBIce87LdomRrTAcb60OtlMd
 /DRQ==
X-Gm-Message-State: APjAAAWy6xIsprUNYlCWo/+yQr/s3rOLy4u8zBRZZJM6trhitbSwA+cv
 QwQpG/xNfXIPKN6wV34HOFmTGJOkPT+f38S0IJ3DP4W04cJVYgEKTRGTLy/tI51AF0x4aWiY2A6
 tMFYTqE8InbAP
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr30591447wrn.87.1566236822959; 
 Mon, 19 Aug 2019 10:47:02 -0700 (PDT)
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr30591428wrn.87.1566236822694; 
 Mon, 19 Aug 2019 10:47:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:399c:411e:1ccb:f240?
 ([2001:b07:6468:f312:399c:411e:1ccb:f240])
 by smtp.gmail.com with ESMTPSA id w5sm15254093wmm.43.2019.08.19.10.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 10:47:02 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190817101931.28386-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <1cbbb720-2ee7-18b3-dd7b-e03c485db6de@redhat.com>
Date: Mon, 19 Aug 2019 19:47:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190817101931.28386-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 0/8] Kconfig switches
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
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Ujmn0Bpibbj

On 17/08/19 12:19, Thomas Huth wrote:
> Here are some more Kconfig patches that clean up the switches of
> existing devices and introduce proper config switches for some
> other devices that were always enabled before.

Thomas, you can go ahead and send a pull request as I will be on
vacation soon.

Paolo
