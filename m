Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp190398ejv;
        Thu, 11 Apr 2024 14:23:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxgG87afGUZazwsDuIBW+UdybbHHuJM0E1WU+4OtyLMj4ynasPX2MSZdPSKl1RK0YawBqx6ANcdETnvC7zZanWhLm2wKGX
X-Google-Smtp-Source: AGHT+IFArCmkpjyIgZSTT1smAQcGtTgmmYcQnWeJzzABFRHAbn4u9WLgZpD4aVsjODQbgmN0sGGM
X-Received: by 2002:a05:620a:400b:b0:78d:37bf:74cf with SMTP id h11-20020a05620a400b00b0078d37bf74cfmr6473277qko.5.1712870592241;
        Thu, 11 Apr 2024 14:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712870592; cv=none;
        d=google.com; s=arc-20160816;
        b=fQBVjUHoAwjFFmQCK7iyzdfws7H1j515/0aqTKLJqWL66pWE5AXGlW2pVAdLV3rqlF
         zUJWanqniZ3R16KY/Kuce8A1nfjx9riQoxlG9nZ6P1f+GtbkJp392eLTdVaU94MXZ8q7
         hEz/EcmXyRsn9+c3ANZZV/+Z3IZ/UundDabyud54QqhvUISe+vPqTzcWWdJfcpjHhvfM
         OX4JAfV3VRanlcZKhlHqehOoRCVCdeEKrQdcbw3mrLNvb38jwhEUIxx9VXhBeAjXy5T+
         A9uAokRg6Jqz5HSgvieoZsxiVtsN4YRmmK6iAun1/yoSNBvjEsVReAvnLoasOcY4v+60
         zuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GhCiyIYKMi7y/uDOSTPpcNjv70nLXfZKkQZydMmIQek=;
        fh=w9LvBz0A2hnt3yhE3Xy5fu/f2rqUZ3CWwBaERCQ47G4=;
        b=F/1hQlOIloxjoMJydrKN6q/CkIRFr4yjXeeAoJlUqTNOFoNJhzGuDTwQzn5Z5dVAJ6
         IXR16iHVxCgOsxqRNZd6kD7sESW6FQbXEbuHbOxHOB61vUinBAxDItFASPORmP7/4r9C
         L1KVPQJy1GcjEdfyrPy553j/Kp4Im6TfISI5GM0i7pLhW9TlUrcWi9Q5TU+pLMB7D76A
         CWWkeeBvA9b0ySzdibV44t8cvdJnDT1TMfGHhZ0yZXF727iKe+giWkV2ikftKNd6Cyx3
         JN+OHrkGyOQL/7C+tZQ/9ZXDmTJgKerO5V+SDY0Lom6UlkB5D8TtEEFEnZrMfABPLENd
         t8WA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L/IsXwAu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qf9-20020a05620a660900b0078bc53d8ce2si2470800qkn.715.2024.04.11.14.23.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 14:23:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L/IsXwAu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv1sk-0007FC-Md; Thu, 11 Apr 2024 17:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rv1sj-0007Ew-Og
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 17:22:53 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rv1sh-000262-8R
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 17:22:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-344047ac7e4so805820f8f.0
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 14:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712870569; x=1713475369; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GhCiyIYKMi7y/uDOSTPpcNjv70nLXfZKkQZydMmIQek=;
 b=L/IsXwAu9ihTFVQnzotdXMutHsLDKq1NkNlAQ6T7zCDs4l401w3aF1aWGpn77i3iUb
 ujXWvMullPDpm24J9n9W96KcaKobUyjh6+OAoI+BobiTVlIJsycpLMR9U+MvGIPOJF1u
 8bqe/IJLR1l/vbVkPsEoCeX+4dN9Av9VTsE/glxe8KD7hMXfhRSxPfrm//5jVEXsivT0
 w0KSY1dQIPkDwxbgkgCB+j9p3x+KGfFrYvbQa2LnhMs+mrv9UItlSDAU8U61RzO8dHaC
 mBFbzsqyRI08ULbQQmWZS1I0t1xR+mPts/t65ZJIE9atvrQi0j3NMJjrqwugqyghHgDT
 3MUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712870569; x=1713475369;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GhCiyIYKMi7y/uDOSTPpcNjv70nLXfZKkQZydMmIQek=;
 b=nTZ+N5a9dEkOGDxCwVeotmhnyIv8Sg6YE+tgwRke6D8vp0mUfRMS4CoTbnxZt7RGpr
 M2TWeFlmEvLOHT+BejhccHU+w6qAF/tGKWJkCu96vJZu+Sa2LzTZfCuHfCUtqej/gvBn
 2TdLwpqi57CyeVb1AimG0FTufLu1zsbXzGHTb29gJjE9qS/y2a4hDxBZgfdRxEpXLu2a
 QeqeF6wK7bWWvITAQzOP1hUwar2uf6v92ZUW3zQknkLNXhZgWW2p04T/YmJ8oGE/XS0M
 S+axmzwgkXmzvoxvU8cbFybiYj8OPCic5JcaDO77qK16TmBlYRlbKj/Z6JL/p5UMQUM0
 /t3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAJa39lOWVhlVaxOjp/AUwfAbjCnsftJ5EOTxme2U9qNIXXadlo6fiYyHAlbLXJg5b9EfsLQOaorEW1N95lNXJNlQZ
X-Gm-Message-State: AOJu0YxpwV7b1truGzzI0TF1jHrpLgqrz2r9fCnnD9kL6biX/a1NCp47
 8PgrmpQ5GcUN2vZ+N/zJM8Ol33veTiTIuESg7c4y4mb6fBX3LrGKIQaROSEcZps=
X-Received: by 2002:a5d:45ca:0:b0:346:f830:db09 with SMTP id
 b10-20020a5d45ca000000b00346f830db09mr342568wrs.31.1712870569248; 
 Thu, 11 Apr 2024 14:22:49 -0700 (PDT)
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 w13-20020a5d680d000000b003433bf6651dsm2640582wru.75.2024.04.11.14.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 14:22:48 -0700 (PDT)
Message-ID: <6309ca6c-6a31-4861-9cff-bef3326c6126@linaro.org>
Date: Thu, 11 Apr 2024 23:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] hw/net/rocker: Replace sprintf() by snprintf()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowang@redhat.com>
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-7-philmd@linaro.org>
 <CAFEAcA9_pbMBjNsOJe2LkfC6z5wuRMSM1pL7X0aHVjdzysoLOw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9_pbMBjNsOJe2LkfC6z5wuRMSM1pL7X0aHVjdzysoLOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: cRRbdkNgdg2C

On 11/4/24 13:30, Peter Maydell wrote:
> On Thu, 11 Apr 2024 at 11:47, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
>> resulting in painful developper experience. Use snprintf() instead.
> 
> ("developer")
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/net/rocker/rocker.c | 24 ++++++++++++------------
>>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
>>           switch (offset) {
>>           case ROCKER_DMA_DESC_ADDR_OFFSET:
>> -            sprintf(buf, "Ring[%s] ADDR", ring_name);
>> +            snprintf(buf, sizeofbuf), "Ring[%s] ADDR", ring_name);
> 
> Something seems to have gone wrong here. Shouldn't this have
> failed to compile ?

This code is guarded by DEBUG_ROCKER, which is why I didn't noticed :)

Indeed when enabling:

../../hw/net/rocker/rocker.c:930:65: error: extraneous ')' before ';'
             snprintf(buf, sizeofbuf), "Ring[%s] ADDR", ring_name);
                                                                 ^
