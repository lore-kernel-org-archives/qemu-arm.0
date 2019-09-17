Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5694274wrp;
        Tue, 17 Sep 2019 13:33:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+7w4Iegk5bVIyCjiDIpQbMCnfgJM1Ju16u770wFXJgxzBGd4NE/lEpPsFGwPCgGwz2GQs
X-Received: by 2002:ac8:1818:: with SMTP id q24mr756519qtj.135.1568752389240;
        Tue, 17 Sep 2019 13:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568752389; cv=none;
        d=google.com; s=arc-20160816;
        b=lSP2i2veohjIwqpKPRYG6ag6LlAcjTdVdhOmt10Px1IS0AgG+LFBfd8UXseMA9OFP9
         X/hzTwlKdBR3QqCJgX92yE82DoHFI2rERQtiVqfkHOimwCQA9uv71dawIqs6hVDs9XiF
         jtpBcr2eZFQXYxPzVTXfVuDDIOJjw/hWDrHKxSFU3inmBb37RdzFYX/3D/WHiHh5qf8I
         PpItxOXrSV5mUUIVhizdqBLjx0NJS7C8QXH/OkxRrC0jAV+XxXLj1+dKhXKNJeXL4CE/
         0GUUV4OHuwdJR1Tmmg+CG+P8q+TE279NFn49GAbmObR8Xp15WVYLsl6Walhrum+pGoFp
         zpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=PgcH1xIdzRwjhnVhoxnojhctD2lMsauDz8vl0j3Q3BU=;
        b=EcELt6NMH+XiqUU0HQn6+vqhH9D1ZnfvLbXdj3R2IHXurCsRfpbeGxwvY28lXOXw3k
         08o+kGXPzDZcARfOhvZMmiw8vfqYprYYvC64ZbiqO309ME79vnEJb4TI/NJZXveEK/Sa
         4pdojO4VkTw+lcSeY3lLOVl8do4a6//ZZ8rC0DxNwjBUKaHcQayUmCMkJBHeKOlTwIdH
         e70cw6rVeFDbyGlQglWd/Uzcui/DLhPgfooFL0pX8SaKmVUZSeTUWTy8pJb8M3FYzuIG
         6bhZQhMXPc0BSJ0k2CfVg9Z40LU/63enS2+4U6Pie1Mrb466Ou8KHdLIEITuZ9JSa8FF
         vi5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tiulpBot;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u188si2576326qkb.107.2019.09.17.13.33.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 13:33:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tiulpBot;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAK9s-0004Qq-Fs
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 16:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iAK9Q-0004PA-Jt
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 16:32:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iAK9P-0007Tn-Ga
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 16:32:40 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35854)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iAK9P-0007Sy-9I
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 16:32:39 -0400
Received: by mail-pf1-x441.google.com with SMTP id y22so2829364pfr.3
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 13:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PgcH1xIdzRwjhnVhoxnojhctD2lMsauDz8vl0j3Q3BU=;
 b=tiulpBotOAZa9Q0DEXY6U6BeKvXFhvb7pRxBYHxrJbxq0SNyZpB4zAyhV0IeP2DvQc
 mEwm6iP5Wrys/lzKq/rRu6IK/ncKjPvUmLsyJsdCF2R6gHifea5P5LNl25Im8XQpXtku
 EWzFGXsiUxvH92PZ5whkQR2NSOdk7Mj1FJjuwBiGPcOdg6IYQMfL0cvWLzh9DbdFP3vH
 n5cpY+6Eh+20NKlz4rpBtIWbWgU1LqJ8mycTH73AhRPHpJFfzmiDb8rYt8MNJD7J2ycx
 /yOjD+xvhW1XSofdivqf5KRUWdKVMFqnNGyvYosfT2UnF14RSfhOH/Dwx27iJnGQ5VUd
 M69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PgcH1xIdzRwjhnVhoxnojhctD2lMsauDz8vl0j3Q3BU=;
 b=KZTPCxbwRH60CNyUAOkC4ZrMQZ8R0D57RsVr0ft5fTZ53MZV7qU4Hi41LqJzA9GxnK
 0XXkaAJOCNaTiEElqqivE+gaxztYS1rKJTuYJHXC7UhBANjAZQScqGST+dGVZ/bFk6BA
 NRLmz/2rMDBkEwJf+xq73pvE8mP1wMwyEwyXDEtrnB97zWOfpN0sUgNaBIjYyzBgPFqU
 tVV31XGWcY2fVodvV8xj5w49gYFfEJzN0Z2bPKUQhaDN6M7+a9QMjdbmtorClu1fDUea
 TMcU2F40BaVDqD51qpqHB7YhAYm0d882BV0rTUqU2LeVaP2HQ1tPTOijtXI7ibnOg25h
 RLlA==
X-Gm-Message-State: APjAAAVX6G9f7AsOhuewBdSPQ8ljDrhw+tU2lZeK1dN/vhvNUahge22o
 /2BIQXy/RnwMac19uzzcKh3xdw==
X-Received: by 2002:a65:6901:: with SMTP id s1mr666714pgq.338.1568752357934;
 Tue, 17 Sep 2019 13:32:37 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id b26sm3487785pfd.61.2019.09.17.13.32.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 13:32:37 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190916154847.28936-1-philmd@redhat.com>
 <20190916154847.28936-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dd8bdcd6-9e43-3721-7b39-f53d906988b3@linaro.org>
Date: Tue, 17 Sep 2019 13:32:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916154847.28936-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/13] hw: Move MC146818 device
 from hw/timer/ to hw/rtc/ subdirectory
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A73uTpXoLx2i

On 9/16/19 11:48 AM, Philippe Mathieu-Daudé wrote:
>  include/hw/rtc/mc146818rtc.h                 | 38 ++++++++++++++++++++

Same rebase failure as for patch 4?


r~
