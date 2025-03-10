Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1052025njc;
        Mon, 10 Mar 2025 03:34:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7UDdUDSXyzyvlWDu6sjLX/WKm0OmjS/yPBzSu2WgmscwJV5NipxX41n+9dYiPUZUnqvoQ18ZNOirMdw==@linaro.org
X-Google-Smtp-Source: AGHT+IHi2V9RoInxGQtKYT1bOzd7p5klydUKx6xIq4vgUA+swLJhArSnyy0FydaI2CiQhJeg0iPy
X-Received: by 2002:ac8:7f43:0:b0:471:b9e1:6717 with SMTP id d75a77b69052e-4766240aff1mr148484281cf.12.1741602868420;
        Mon, 10 Mar 2025 03:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741602868; cv=none;
        d=google.com; s=arc-20240605;
        b=R19T/1JPzz9j7Aj/PwDihS18Op3XpUOsjiuBCoReRlNowyrAKWeIhgsC/gQR9mwCsi
         jc+qAMksYbFPGvcbrMHDpIOw9MCvPnmU4emFPk8S/pABZxfgKG02ioGl77EVGutKb9ra
         mFzNkpcPpoo+0hJzscibi4X3QY1GMdKwMy8yBdqn/swQLeK90XEtmdGGZCXjA37IKqBA
         hqsQcA96qXrPXICUWYuEvu0jKLn2ohiJskkI843o04ouWCgW7waY0RnQ/TwToo/WKNiL
         pHkvVWPaynkO2rl4oV+edIZT8zfzFP/rCIM33m764E3CUFNOs5zdo8g2lDKZFqiGWiWK
         R4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:cc:from:references:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=S+X1w8qj+EQLOiCss80tgKQ/+FMcj7AAXy1RyHeLR7g=;
        fh=SE7RMHXrJVAXfEzEp4XpiRWOePa1E6/zy0Tqvyp7v/4=;
        b=Y2at8/MtbOJOIu6LuOFIP5bDW2fcUo1ZQ7cRVOO1tK9wdUi7tUvNyuyEXJN8rr3qp5
         HH9SUf7LDbN5Do9ldGvQSdyV58DWvjRdmly7D+NE4qkFcqdSuXNN90QqOd837cVvIL62
         jbRndH7diSXQ+n+OEyk0JSNdQqpG/pbIpaHUhA2s1dSSWc44l2obS1ZD8Gf9yYM4WnR3
         xxl9yClCw1TDt2KEr56xSL/lZ/5GhqovURunNIWqJ8AEXMN197GkSLnRxwavYcC4M6mP
         W/zG62fVXDm75uEdtxm7aA7nucF5LUVnwFBcJ4mdyr12PAYLFstb8EmD93gwObPhUKo7
         ZHnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EYd4DHii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db440c7si90107401cf.588.2025.03.10.03.34.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Mar 2025 03:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EYd4DHii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1traSi-0006CI-0w; Mon, 10 Mar 2025 06:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1traSf-0006Ao-TV
 for qemu-arm@nongnu.org; Mon, 10 Mar 2025 06:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1traSd-000286-6C
 for qemu-arm@nongnu.org; Mon, 10 Mar 2025 06:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741602853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=S+X1w8qj+EQLOiCss80tgKQ/+FMcj7AAXy1RyHeLR7g=;
 b=EYd4DHiiBATk5MtwDI5k50BxxIRbwk5LR1WLbnJdb3CnYOP84RvGWv906Anh6jr63N/FP/
 nljqa39DnlkdGpt5A6AN3PXiudqolhcXAQeC2q3A1kLUzWw5sVmdBpb7sJd3JaR6l3t49t
 2JhVOSXufHOEtKkjEy2ypZPaSLjkaP0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-_gTPPIv0OcG2pZ3rB3Spsg-1; Mon, 10 Mar 2025 06:34:12 -0400
X-MC-Unique: _gTPPIv0OcG2pZ3rB3Spsg-1
X-Mimecast-MFC-AGG-ID: _gTPPIv0OcG2pZ3rB3Spsg_1741602851
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d00017e9dso511865e9.0
 for <qemu-arm@nongnu.org>; Mon, 10 Mar 2025 03:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741602851; x=1742207651;
 h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S+X1w8qj+EQLOiCss80tgKQ/+FMcj7AAXy1RyHeLR7g=;
 b=vagTViXQql85qIN1XxnvZgDUFHdW6Ytwk9LCoIBGHkD8QWQTH71e2L4utvAun8EKZk
 5qdBeWG45q8vdjBxBG6RVOw7V0CcqMSUoAwr7b+/Lq0s05dlA3ojRYK7mVs0JdltClc4
 i46kK2ZDTEtfufuFPhUwZTuMcspOHhf4bw1JROH2tW5mziFjo3VwNkxnh+ezbvpay2Or
 eRwn8PW4jKNJoOQ2wyXDQYno21V5M+VCLWuvQTuXTuFExN0E1KWIcrh4tyYqnGXoLc2F
 xg+i2neGQML04aJXWovPO/pkvzEhXu4HedUJTxKq6UBZgZWrkM4tiPqCpghYmAb1xPLg
 ZtAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWScOtE5tdP01a33Vb+I4KsCyu64Bx3y8vRB8cOGPydk+2bbsY9oLDwWXvCQowLCHMHZqKkqZOn5Q==@nongnu.org
X-Gm-Message-State: AOJu0YxOMr20AUmeEkmcV00LpWhAzjXOo7GUgrLp70r+wvC5PGNT8mI7
 IbhXDrylIh3e7wS/BocMSLLhHqLvqeZzOICT3ZGn7yFJCD/2XqFRIyDoijJ1mz3fxLraYlKDJEc
 Zn4d9+P8DBzS8Ii/v981qvz0K04YWPc4/ZDMiFT6emyAU4LE0Gw==
X-Gm-Gg: ASbGncseL7Mem1IiR1S2UVNWBNeFxx8o7KpYZuWa8VE04+Iyqsm4umjs3e9R8Juzp6U
 7yNUIdu3TwwNDJwY/HnXH2RiCvUEacQJAxnBhRfEFR5Nv2qvQNQzuh4F/AF1rQuwQndJWrom2oe
 TO6j7caBQn/93HgN/RVEGAlXP7MQ2aq4xrmzoweeJUcy92iOueKUah2rx1MDr5Ry9cj21ygVw6T
 CqtmeKQoshxqGAUapryCp8dl1FMDEdVmBxa/8KUAhvFdsxYnCvlrEyFxhcUdHpGOwe5JQtKVD5g
 3HacSZNI4O2p+NjHtuafwnj/QdIkny9rf+OH9503rV/lV34=
X-Received: by 2002:a05:600c:3b1d:b0:43c:fe15:41d4 with SMTP id
 5b1f17b1804b1-43cfe15436emr6642745e9.18.1741602851269; 
 Mon, 10 Mar 2025 03:34:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3b1d:b0:43c:fe15:41d4 with SMTP id
 5b1f17b1804b1-43cfe15436emr6642595e9.18.1741602850926; 
 Mon, 10 Mar 2025 03:34:10 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de.
 [109.42.51.231]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e1476sm14452086f8f.70.2025.03.10.03.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 03:34:10 -0700 (PDT)
Message-ID: <55210662-b291-4cfc-a56a-82a1b4133694@redhat.com>
Date: Mon, 10 Mar 2025 11:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional: Bump up arm_replay timeout
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250310102830.3752440-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250310102830.3752440-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oG7F9JPKuPcgt49odsHrvaUYMLcU0CyqPTetwQB_Uqs_1741602851
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: VCOkCBZHspGX

On 10/03/2025 11.28, Peter Maydell wrote:
> On my machine the arm_replay test takes over 2 minutes to run
> in a config with Rust enabled and debug enabled:
> 
> $ time (cd build/rust ; PYTHONPATH=../../python:../../tests/functional
> QEMU_TEST_QEMU_BINARY=./qemu-system-arm ./pyvenv/bin/python3
> ../../tests/functional/test_arm_replay.py)
> TAP version 13
> ok 1 test_arm_replay.ArmReplay.test_cubieboard
> ok 2 test_arm_replay.ArmReplay.test_vexpressa9
> ok 3 test_arm_replay.ArmReplay.test_virt
> 1..3
> 
> real    2m16.564s
> user    2m13.461s
> sys     0m3.523s
> 
> Bump up the timeout to 4 minutes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/functional/meson.build | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 97c3f4ad4e9..608732bec63 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -31,6 +31,7 @@ test_timeouts = {
>     'arm_orangepi' : 540,
>     'arm_quanta_gsj' : 240,
>     'arm_raspi2' : 120,
> +  'arm_replay' : 240,
>     'arm_tuxrun' : 240,
>     'arm_sx1' : 360,
>     'intel_iommu': 300,

Reviewed-by: Thomas Huth <thuth@redhat.com>

