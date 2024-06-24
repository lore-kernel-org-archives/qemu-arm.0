Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp372333njc;
        Mon, 24 Jun 2024 01:11:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFjk1/BijKPCvqA3cHzl6q1SMQr6z7SxEGKWW7zLz8U42dqckeLHDAytKV0QCjLKxYAvuxzpbPP20c7Q+iAtdHmRdZbD7x
X-Google-Smtp-Source: AGHT+IHblZ/dPd6udHUqZvXbjUzOSTsZMJ+brnkCEy/gKehXAw7L2xNPWH4VwVEhplk08ACCO1DC
X-Received: by 2002:a05:620a:450b:b0:795:758d:fbbc with SMTP id af79cd13be357-79be6e86bb8mr531229985a.14.1719216661896;
        Mon, 24 Jun 2024 01:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719216661; cv=none;
        d=google.com; s=arc-20160816;
        b=ppSdp53AdksPi0a+toOdSYURAYvPu4OL4R+rNLHRTdFIyGRmnDCWFG0vlare4bLga8
         rm585gTewiu0JEpsiipdrQ8uxrHNeAwWhyor4hYjMADiwHLgHl52mJZzDi/I6M2ClgqU
         WA15X5khzeYxlRmJwNr89l0Qj8O83QytLpmBYMUygWYbUHSDdNT8hTyKRyJy7si16tt/
         qYMiWf2CAxXKuH/Cgh0uM9bRHmtSWH2nnIZ4qo/Nb7LWJNlaOFTakELML6Ra74Lvkmg5
         y3nc3OcMP4v/OO4Nccy/H5MowhP15cILxt5ctJH1FPJ349RgyW1RzYFMeYdsN3n6GE7v
         vUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4RTAQwadnmzU+2BsFPLzaRXRc6gtw+sJYjl6MK8WhZU=;
        fh=d23DzD9q5KrJsTno3+nvj/pP1u9foNOYL/3X+QUq0Mw=;
        b=r/QH7PHPBYq8eqG4He3FhXKqWdAiciK4tbbpItylPNodEGGCOVax9wY6NwMzL7Nr9G
         htUUvdH3jvDonSJmh+VXCEV/hifeTiCLHL9F/JwY45oM3SQnyQezRUDfGeVXv04UPcOC
         thD/0ncCWJ7HkkIzuxKJGHdvVWnAK3ujv8UhQ6szrP9tywb0fr7ARExFMEukT91mNaBD
         /+HSs8gkWuK7jWvNmjTldGnhDVkFTcSC2EGUWmMB4oRV9yu/XczeClgyWBFGk6SaYgO7
         5gr1QzDFJrS/D2NPyp0TEurr5q1PoKl8aY8v7QQqfClM/IgzszJ11PSFx1Xikvd+G3kp
         73sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zawszadU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce941605si781800385a.590.2024.06.24.01.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 01:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zawszadU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLemc-0007HQ-Lg; Mon, 24 Jun 2024 04:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sLema-0007Gb-KD
 for qemu-arm@nongnu.org; Mon, 24 Jun 2024 04:10:36 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sLemZ-00009e-0H
 for qemu-arm@nongnu.org; Mon, 24 Jun 2024 04:10:36 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42179dafd6bso29282115e9.0
 for <qemu-arm@nongnu.org>; Mon, 24 Jun 2024 01:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719216633; x=1719821433; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4RTAQwadnmzU+2BsFPLzaRXRc6gtw+sJYjl6MK8WhZU=;
 b=zawszadUYbmpYjsZomjFz3OYZsDOx8WgpgXB+xyMbOGJU1EcqNdp4Z04aVNRpWcA+k
 QYWsX/OpO0gtJAgAEEpO5su0JKrVTUS7YHvORViB+75JtIslLhXElqdlVGm8qHLfUj3d
 z41b3d5pWdFcYPKKj3E401IeDZDDhZOUxiyW1KgEa6KjYKETalpE/IRUBrIkbKaZ291t
 tZc1lPIQmwW//n5SawXz2MrD02WGvJIeDaQhJKAUycAAUONya77GKrTRdd7K4AxwtF4/
 ARcUZAhtX52ZJ046UodQ761oWCxtoUlzDRJBTpqOE998X4Q3vnClso45WiCEnFAWQhrg
 f89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719216633; x=1719821433;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4RTAQwadnmzU+2BsFPLzaRXRc6gtw+sJYjl6MK8WhZU=;
 b=A/k7CVUFG7TzIET98bQPznMiQ9uTeULtnLs1sOHSg92WR5GYvhJFHa4Uic5thvRpmj
 0BN/y5rrkWWyk7YZh0/Ptcnq1AuROL90IBJ9lwRo214trETF/xRbVHR1i0Oi+MZUHXzJ
 STG76d0p7vyIw4qJ9EcYEBJfJp/ntaHV0wq4hZXMD5VEI4YNjfDDOlHLxGTTpu1SXmlR
 jqbqRh0a6DFSIaVJY8AFUrwlZYnGASt9M1Wdt3ucCrHo5+x7VG9wZ/sXWedmjRRzxSL0
 EmZK3vPga8l4cJZcu3Mw4O+XqgRfMkKhP5AWGwJ/RVBfq0LiSc+izh5kPbHyU8Idh3DC
 zIbQ==
X-Gm-Message-State: AOJu0Yyq0Rhy9CW4Ca2cC3eIOSQFbuvgurrUSXVCkB/sdtp/ubWkCp9p
 1Ma4X5t2Gd5N8UrStQh7SIKe7dfvJYJNeXB4ezF5VqWVKZ6rYH72la0LzSO3J/Y=
X-Received: by 2002:a05:600c:470e:b0:421:79b5:6d84 with SMTP id
 5b1f17b1804b1-42489540d0fmr42327055e9.17.1719216633255; 
 Mon, 24 Jun 2024 01:10:33 -0700 (PDT)
Received: from [192.168.69.100] (bd137-h02-176-184-46-22.dsl.sta.abo.bbox.fr.
 [176.184.46.22]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424817b6121sm125415505e9.27.2024.06.24.01.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 01:10:32 -0700 (PDT)
Message-ID: <ba81d71b-ddda-4b17-af3d-2e4d7b46e554@linaro.org>
Date: Mon, 24 Jun 2024 10:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] tests/avocado: make sbsa-ref working with >1 core
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>,
 Rebecca Cran <rebecca@bsdio.com>
References: <20240620-b4-new-firmware-v3-0-29a3a2f1be1e@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240620-b4-new-firmware-v3-0-29a3a2f1be1e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: 7oyRnxIk4Y3W

On 20/6/24 12:19, Marcin Juszkiewicz wrote:
> Recent changes made sbsa-ref crash when more than 1 cpu core was used.
> We handle it in firmware now so one patch updates it to the working
> snapshot (TF-A 2.11 + EDK2 snapshot + EDK2-platforms snapshot).
> 
> Other change drops "-smp 1" from CI to make sure we test default setup
> of sbsa-ref.
> 
> Previous firmware worked with 1 cpu by pure luck probably.


> Marcin Juszkiewicz (2):
>        tests/avocado: update firmware for sbsa-ref
>        tests/avocado: use default amount of cores on sbsa-ref

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

