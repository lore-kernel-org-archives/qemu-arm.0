Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp143848ejb;
        Wed, 7 Jun 2023 23:47:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6m5LVmDhteHvfZmVNVdnSZ6wJUPQTDw+vAvsUPliG7y3hb4vtdemrBeYAbHICyuG0v9DYP
X-Received: by 2002:ac8:4e44:0:b0:3f8:6bff:bff0 with SMTP id e4-20020ac84e44000000b003f86bffbff0mr1169116qtw.29.1686206847789;
        Wed, 07 Jun 2023 23:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686206847; cv=none;
        d=google.com; s=arc-20160816;
        b=KD/mRkGEjwCHEHpAFciHRtvw89DxhgM1yE2ls9QMScfXGwzz4fbafgNTXfdbHKcEyq
         oUCd5Jo5EeP+e0Gjr9J1U49gEcZxPni8Y6LNEZqJVgQ3tdaDqqbiB0mLHfnPY7bjCeDD
         7eFJHxjVm82UR1E+8P0gyuJ2KL1wNYWAtKMi2mZh0vZ74N10QWRx3GJyT+E+ekqNzC+z
         fPQSwVH3sKZz01FthwaAnRfCjTZKRNmoR6HifadrA0Q8JqnpfKTKIQnZwsPSNcrtfu7W
         XvJMb3gbpGjXggHehCR7aXgfdTVuMvaNexgpUuktyDarKvFhDJb5sTYOHv701KV3gLFa
         950A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FnytSjdXEwD0xYUukrBZjKGarXw16mKWSy/mwd6jIVk=;
        b=AS3PpX9utU19u+LBGvBb1qjEPLVhAF5luR9kVef7hLbebuLFue+dojoMhSRfv8OJ4H
         z1pwcrVYgAJ9SBhNWdZUHiv9HBpnv75oNj8kPTfGZoYBsfk2KmI3+/7L4cRFXyqRJecX
         YJfEFyDjl2Qe2PJBluLQJA4K6EgE7qgFCe7B1OEZaNA2i4QC1X2NtbbEHDjx8aoS8Y4x
         t9+j4mqfbKjTTr9ZILi1K+aZGf/VsQEiULoN6Zt41kn0lWy86hFkpwtJNL8q+VFaxsXx
         l/Fn5STttu7RsYZHNJGEGNERxKWwBtjgiRnyO7WMZtNQ6V1QVuT+m2FJRAoLbdoIzMce
         MZtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rfAoNvJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020ac87f4d000000b003f4d3a79800si176896qtk.566.2023.06.07.23.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 23:47:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rfAoNvJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q79Pu-0003g2-HY; Thu, 08 Jun 2023 02:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q79Pr-0003ep-W7
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 02:46:40 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q79Pm-0000M1-GX
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 02:46:37 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f738f579ceso963125e9.3
 for <qemu-arm@nongnu.org>; Wed, 07 Jun 2023 23:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686206793; x=1688798793;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FnytSjdXEwD0xYUukrBZjKGarXw16mKWSy/mwd6jIVk=;
 b=rfAoNvJZPcN8GLNrKlFfjjv8DxcbxoY/7rhX0JnTKG/9NF2T2IlCLKxPe4VJqFpoxz
 B3YmkdmUvHYKZBm6leDquGuwDhCVceaDrEqN8Z03J7PcUxbLJR9+LDitc3w2If874NSy
 VpF3GKUFJ7f+liOIRGGXE+djs1KO1s/VbTXaW8y3XNdlHKVCJzac/Ge5gL6I2gBVWPvm
 zecBSlcq82Xjf/9C101HcgWJOljQEbotZoBDvrf0aly8Rh5L6et13oc0z8Iddkef+WuD
 h1xYbFXRGAOjOl3HnFxvhuKT4x3CNWjZUb5dv8dVU2I7M1fC0aq8SekJyxi6GiI5QNjV
 tb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686206793; x=1688798793;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FnytSjdXEwD0xYUukrBZjKGarXw16mKWSy/mwd6jIVk=;
 b=LyMxzVVd2ZtUrnNBB4bRsiADdAxEXenb5BTlkoRXTDAgjS2pgyf6PP46URUMkjjadL
 80IfYFDvHnJ0BPGOXsPZ7jw5Lt2ft+dfFzaXhZmlFq8316RVLYE2f5+G1MC0U4szdlYh
 J+SUl9ZAjbSIAGhiI1l5qUJvZ+/oX4zwIBPLQeliyrrP/qopV5BdB2GgDEYKF8ADDRbA
 vJKeD7wjnrZW/QMdo2YoAlNHBE1Af81fOaC+JWlagmoWBiVieuO84QX/4PqrcFpyFEkA
 OQ/xdl0r9o+v8LkYNHQKJWSmXitq5mJIvcpm/luRd0XWg7wBS1tOKufi0oWorLS/Xl7O
 Yk/w==
X-Gm-Message-State: AC+VfDxkXOQebt+mV+ghlv+8DEED4AP6QSC9VaiT2nTCEoqU8D12eK2/
 rqN19NKFW1AOYey2qT9IcoFC0Q==
X-Received: by 2002:a7b:ca48:0:b0:3f6:2ce:caa8 with SMTP id
 m8-20020a7bca48000000b003f602cecaa8mr475099wml.29.1686206792756; 
 Wed, 07 Jun 2023 23:46:32 -0700 (PDT)
Received: from [192.168.191.175] (81.171.88.92.rev.sfr.net. [92.88.171.81])
 by smtp.gmail.com with ESMTPSA id
 m9-20020adfe0c9000000b0030af15d7e41sm577371wri.4.2023.06.07.23.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 23:46:32 -0700 (PDT)
Message-ID: <10d141a3-5745-b458-69e0-a452a9e87b95@linaro.org>
Date: Thu, 8 Jun 2023 08:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 4/5] target: Rename per-target 'helper.h' -> 'helper.h.inc'
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-5-philmd@linaro.org>
 <cad000d7-f408-9337-9328-ccb262c5fcc7@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cad000d7-f408-9337-9328-ccb262c5fcc7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: hfpPcVyrVmsn

On 6/6/23 16:43, Richard Henderson wrote:
> On 6/6/23 07:12, Philippe Mathieu-Daudé wrote:
>> Since commit 139c1837db ("meson: rename included C source files
>> to .c.inc"), QEMU standard procedure for included C files is to
>> use *.c.inc.
>>
>> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
>> about includes") this is documented as the Coding Style:
>>
>>    If you do use template header files they should be named with
>>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>>    being included for expansion.
>>
>> Therefore rename the included 'helper.h' as 'helper.h.inc' for
>> all targets (updating the documentation).
>>
>> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
> 
> A bulk patch like this isn't ideal.
Unfortunately these headers (declaring HELPER_H path) are used
by all targets:

  include/exec/helper-gen.h
  include/exec/helper-proto.h

So this has to be bulk.

> Targets that have a tcg/ subdir 
> should have helper.h.inc moved into there.

OK.

> At the end, 
> include/exec/helper-gen.h and include/exec/helper-proto.h become unused 
> and go away.

Ah, you are suggesting to first inline these helpers in each target,
then move. Hmm OK I'll try.
