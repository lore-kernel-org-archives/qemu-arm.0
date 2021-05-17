Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp930878lfm;
        Sun, 16 May 2021 22:27:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzObG1KBMLff2Rn4yhY6nGkCRfZFVfT0uCRVQ/qK7KoJkUpZF7BqwWpffaAyDMZGiirK4qU
X-Received: by 2002:a05:6402:1a:: with SMTP id d26mr69981478edu.99.1621229259068;
        Sun, 16 May 2021 22:27:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621229259; cv=none;
        d=google.com; s=arc-20160816;
        b=XUuXK08Rf7ffq8phdcR2aP9pmjfqDeehfXioMGVcUhAXR9FGY2SPYnPlmBzOvYWwD/
         MoY6UY3msxkYQw+zP8jYx3cdDgQCL1N4sMoLG2oSl84B56Ugp7s+yF+zc7Ak2HL2msJU
         mV7jmk2PL6OY2e5ZMV1DTEWRVSQBPJz1RaXkCqmVBcUK5uKWtfp4UzarqR3DL/CsBEG5
         Oei9piB+F1XlUSkwlsWK1LxYDFOFQzK0i4dLx39AypN/w9BvofXLWlnyLTiYInnJFTWm
         5KgXuFy+tjF0G2FerUFWGAx+F+FAhZwU9rL/eEUYR6xRNG3oS9zsrfsRuyQZxf0WO45R
         CpiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3CtS9VRwM3InD0PGwlK54ZrR8rhtiT3SkoXXxD+MF90=;
        b=szoDtQdO+GK6JdBggCBuxNLmSpHPXbyxhJIV8FeBubLh2bZi9KNKuEeOcvkQ8ovmFv
         2JZjAn/Qxw79gy3EHK500PbDX2WIB/D9Xs4s/C5pvIDwF/JS0cYOfHEmqEvY0/Sd8eiR
         /trOUAhky7/tHaLc+Ar1Ad7wjAB0n326f/T2n/dxBvzAlUyken7ulf531FE89hoZZRf1
         gZMr31wKT8xggxUEUIvJ6LNLLyMrGO3WI/ZhdUhez/bXoY5hfmg85PHXr6NSTjqGah3B
         mMOsaaUXbID1yC4BxAtN59eoMX/NGMEvnwxnJqFDnQ45OYA0g8Y+jhz2lcWkPxmteghi
         urKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mzgnf3ig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rv28si12949424ejb.578.2021.05.16.22.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 22:27:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mzgnf3ig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liVn0-0005Nd-5M
	for alex.bennee@linaro.org; Mon, 17 May 2021 01:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liVmm-0005N5-G4; Mon, 17 May 2021 01:27:24 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liVmh-0002QQ-DT; Mon, 17 May 2021 01:27:24 -0400
Received: by mail-wm1-x333.google.com with SMTP id 62so1793489wmb.3;
 Sun, 16 May 2021 22:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3CtS9VRwM3InD0PGwlK54ZrR8rhtiT3SkoXXxD+MF90=;
 b=mzgnf3igaFPIl3j2nfhIGZ4Mr6b4wkCroJYvv7hO629iajbsLT6+n8YnmHgmKNhvcd
 cOC2qNvSx4dgEKsiRcdXPj9uXVvHWvJrQWoV24IaA5qgwGQK4wtuG0dN6qcF6Pa7SaSb
 oYGQUUrseWHMYx0TDI74rc6lZ8JcB6Lo9x+n2jM0AmilNSjy5xglfAlM0eWlD8WNEJkw
 qIaIraLf7KvBY3T6awQmZ/YoSur5KPWZx7R6yy8zXCwmv04YKL2iqqEwuywip7zUrSq1
 0l3yi2B3YzdAlFxKDrW8nQ6dDqOS3A80RzgZICMCDAAFair3vYnKF0chNTb12A6ZAW5W
 3fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3CtS9VRwM3InD0PGwlK54ZrR8rhtiT3SkoXXxD+MF90=;
 b=VNPd3tG79168w0SEocDmJBKysnsjYuhYgYLax9u3JrD7Rts4JfsJebejRCWJ3wnWB5
 2c+UFW8swlrf1VTkYBtJ522RXcwFi1UJ/7JeDl8oteDzPFcFAkIFah+Z+UJTWTXf8/G6
 TJfYBPp1PVNorNgGBqy9REaTovwgp0X8UJpFr+RLxefl3OP7JqHui5LU3nw78EUQy68v
 uyWa0lJXt2+EclTWR/311p/C5CAMf88mIzQIl48liCIvr+Vy2cfUlbi/BH2XhV41SmWy
 9khDNvofDEsxfHurl9nTm6Jz2F993Fwco9rk7NoZP8vcI0gLGjWj5zW4hcTQVMVIs/ix
 z6QQ==
X-Gm-Message-State: AOAM531ikk0g9KEGmmq+NUWOvuf9x+lr4sI41BK36xSk3FezxSGYSE+5
 Do6dIeyPm2vbV8qSE7uyCIk=
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr20362081wmg.81.1621229236440; 
 Sun, 16 May 2021 22:27:16 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f20sm15036686wmh.41.2021.05.16.22.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 22:27:15 -0700 (PDT)
Subject: Re: [PATCH v6 08/18] cpu/{avr, lm32, moxie}: Set DeviceClass vmsd
 field (not CPUClass one)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210422193902.2644064-1-f4bug@amsat.org>
 <20210422193902.2644064-9-f4bug@amsat.org>
 <eeaa99ae-da4f-d76d-127e-18a8857de8df@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4ee022bf-5873-e689-8549-a8ca0bfda64a@amsat.org>
Date: Mon, 17 May 2021 07:27:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <eeaa99ae-da4f-d76d-127e-18a8857de8df@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-s390x@nongnu.org, Anthony Green <green@moxielogic.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vZky8EY3R//e

On 4/23/21 3:16 AM, Richard Henderson wrote:
> On 4/22/21 12:38 PM, Philippe Mathieu-Daudé wrote:
>> See rationale in previous commit. Targets should use the vmsd field
>> of DeviceClass, not CPUClass. As migration is not important on the
>> avr/lm32/moxie targets, break the migration compatibility and set
>> the DeviceClass vmsd field.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   target/avr/cpu.c   | 2 +-
>>   target/lm32/cpu.c  | 2 +-
>>   target/moxie/cpu.c | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> Do you not have to increment the vmstate versions?
> 
> Though I can't see how the version numbers would even get compared,
> since we're looking for them in different locations?

Yes, I am not sure how that will work. Anyway, better safe than sorry!
