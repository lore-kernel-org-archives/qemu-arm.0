Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp627593ejh;
        Wed, 3 Jan 2024 09:37:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu5n3X7KsbZAWBN3hJrGxHWgroEFM8jw61RN++JZvEKj1KCcTtLu/hMZQZhF5XxOJsc7LD
X-Received: by 2002:a05:6808:9a3:b0:3bb:ce1b:8769 with SMTP id e3-20020a05680809a300b003bbce1b8769mr5629889oig.12.1704303426179;
        Wed, 03 Jan 2024 09:37:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704303426; cv=none;
        d=google.com; s=arc-20160816;
        b=E500Waryf4pTfdZn/xmpdwYObLXHk+USg1iEzb9mKksgGWl4AA7pVzM9fHXIIFBxlm
         Gk6n0hZnN9tNLArSqeQsTumbLEFd/jSJIQAWBUe12to8dNqeJgvSPj7T0O17+/WC5+yI
         wwriHN5XLvgqhey3gw9wBw3BeuACB78FGHGRbJhzFhwNewG7lAkhVsTCbANMFxGAMwBA
         WGEhhJxboFjrSPrWfyhGCFHeCZ+7nMZAGwHGocsl73eHQIf6KSjkvbQ9J9kml94PWoEU
         MyQZNcXesQSV5BuRR+MaG/sPGs1wgsRfSQihj0fcgRDDwPkBTx6H7Vv0Hqz7Ms8/SKGU
         qwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KD8fHoYY9U39+j5t+ooqKoaHFyC3927TgphRWKKkdTI=;
        fh=Sys7Xfxqrjgv7iuWL2112nMl9E9T6iv9btgIPGyKZyk=;
        b=Ec2sxjq9iEh+FDVon/jIx/GMLq193sw19VivMXCgTZoOXz+vvezDpRnaJodgCu6mLy
         MCAo1YchoMW9C0qMPEwHLlxrLZ0dnafKmgTPBYKwkFHizf7toeMHew6oRMYMDfUdQS1I
         xfAgYfhujGNeSUxbWBIj53r2ts2f4yiVZ7ksjCug9Y2M3Ik4sCi1M4v47rnZ3jeXB5d2
         TJw+qfb0tZLlatFMO7xuX7+vL83EoETzBMaLF9ut0xzmNmN6pxkwkUfG3Wh3F6vVXbEB
         U4D/epUJkjBtRcSPx1RRKOLHSaCIRR020jHulHV8rQD3oyO+HxLKb4pqR66kEgt9Ttcp
         aQnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=inFojhz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1-20020a0cca81000000b0067f28a95983si30206214qvk.124.2024.01.03.09.37.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jan 2024 09:37:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=inFojhz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rL59N-0005df-O3; Wed, 03 Jan 2024 12:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rL59K-0005Uf-NY
 for qemu-arm@nongnu.org; Wed, 03 Jan 2024 12:35:26 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rL59E-0003DF-B4
 for qemu-arm@nongnu.org; Wed, 03 Jan 2024 12:35:26 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-336c5b5c163so441200f8f.1
 for <qemu-arm@nongnu.org>; Wed, 03 Jan 2024 09:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303319; x=1704908119; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KD8fHoYY9U39+j5t+ooqKoaHFyC3927TgphRWKKkdTI=;
 b=inFojhz3ZNH41mWAHV4CbUO3LZ9c5Z+UjWLfdi/39ty0uXFTk1A/t70oYYrXq35C3j
 0QlhME7KVvvXwefjo4OFZue6Sgjom4dSevoY5C19ijXDfbgXH1UXp79Quf8GhpUpxIpZ
 NRDu5cqIKHCc9PSXUU6WuT6O1vGt/H1xBX8nlPNlZHK7fNW7TOv+uL2oPJ8U3nIayZKA
 pB1TzD0rIofXpbK+pN2oh6OPG+U1jj/OBxsaPWd9xHbH7OXhNVxoBKJah8DST7G5mNui
 jKrQZZOUymYZyaVvoNkXTI5vxi2bmtV3HU1xO1SHirc7jGTQmJFp0zKz8Vtg465nMoQv
 +inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303319; x=1704908119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KD8fHoYY9U39+j5t+ooqKoaHFyC3927TgphRWKKkdTI=;
 b=i3Lc79WK1hRWiRulK+OPi4L0rnh3cEHr0lMWb0Fe8/HD4I12yUYcoBhOYhD93L/5l7
 9mqfLgL/FJvXtUSILpILy048vo61bRPgkDKTYjCv+MWwYEKZHkVhvYzFYOn7YQLNLGn/
 l4pA/DX4LabC+0vp6jjrU71+zJfLeRFRpHrxxQvd0dd4NADDu0c9RoQDXnJNDVua4vcF
 ZoPURwnnlk6DHADiFYwEsSmXoBITrsoxHa9XQU0GOsJ2XvQjyyBt/ms0TejL5hzMybfw
 VvplOBZPvmIOj2Rf2P8TnI/oqoSVU90XbyhNB4Jo7T2t32F4BXY4JOWJiuWWsOwn0FIZ
 VttQ==
X-Gm-Message-State: AOJu0YwvH8esfQf9Rg7JMKcIEJ7hHU3n8aHfO0KIJ8EsFP8nk4uBLJXz
 +HuIDvJNNnXGZ5SUXaI2SlKoePjjsj4Azw==
X-Received: by 2002:adf:ffc3:0:b0:336:8af0:1fd1 with SMTP id
 x3-20020adfffc3000000b003368af01fd1mr660063wrs.11.1704303318825; 
 Wed, 03 Jan 2024 09:35:18 -0800 (PST)
Received: from [192.168.69.100] (tre93-h02-176-184-7-144.dsl.sta.abo.bbox.fr.
 [176.184.7.144]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d6d0e000000b00336cbbf2e0fsm21642247wrq.27.2024.01.03.09.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jan 2024 09:35:18 -0800 (PST)
Message-ID: <b6d96fea-ab43-43cd-bd7c-1da59ab7f2d1@linaro.org>
Date: Wed, 3 Jan 2024 18:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: use "buses" rather than "busses"
Content-Language: en-US
To: Samuel Tardieu <sam@rfc1149.net>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240103172817.2197737-1-sam@rfc1149.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240103172817.2197737-1-sam@rfc1149.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: FN6beAzc/eQt

On 3/1/24 18:28, Samuel Tardieu wrote:
> If "busses" might be encountered as a plural of "bus" (5 instances),
> the correct spelling is "buses" (26 instances). Fixing those 5
> instances makes the doc more consistent.
> 
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> ---
>   docs/system/arm/palm.rst    | 2 +-
>   docs/system/arm/xscale.rst  | 2 +-
>   docs/system/devices/can.rst | 6 +++---
>   3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

