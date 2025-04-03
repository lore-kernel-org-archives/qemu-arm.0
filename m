Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3909885njd;
        Wed, 2 Apr 2025 23:28:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNNDEfKOPGN8wD/xri20kKaF7P0nZiJ0/XBJgYCSXBmFCzrNEJcFSiFhi/Sky2UlgRy5q9PjpS6y0PMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHZ8houF8sSre0BwlFYYczdQKwNwj/ZfiqDYLj2qZDBj7NuG0TJ1rSQPcolSAX82zGhyy9W
X-Received: by 2002:a05:6214:1ccf:b0:6e8:96f4:733 with SMTP id 6a1803df08f44-6ef02baec51mr84901556d6.8.1743661683863;
        Wed, 02 Apr 2025 23:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743661683; cv=none;
        d=google.com; s=arc-20240605;
        b=LbOC7JKiGBrVrSBJVGeBuwNWiOXjb4K88SoX1BdZa3H4rxjM0mH5k3AsNLnz7HXeOR
         k64rryGEt6+fQEcl8QSACBdssLwAYN+xuVQVfg/RtWbBNB/dFFQam8lVdFIxfnXG9z2J
         YU/Y/8A5rN7H/S/i/BAuyyfA8RlZWk23v3xvl5+7/ufgkN75McRr06KjKzQqDkjeZef1
         dQNWndaEbevDHHqjNDbX4kYkGdC0EO+i4lWbH0YAFfAe/3FQ1ARVJPewcC94qrEXsXQW
         pzDgp+GdSJS2NQPd6/U0ZIp/Wpj6Ic+cfXrnDP5+Qo9C/rTL1Abnif06ghxzFjN8xgPN
         3UnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=t9XCw/hGZx53ePP4u3QzEuyWB3/JZzErX8wnWHAT89s=;
        fh=3PV2pzzqoSMG4Q7JiP26QAh5D/GmMkh7xdwhhwQWrnA=;
        b=ZPKAQEBrlPJEozTOStFhySZ/IUeBmfF8gt6G7tiQe4YZ9ill0+FdaD58H14K85wzfU
         MZ+35Mqe/iBIolrk0HRF6g2QtsUczl9FBWP74vAeoS4RA1rlv0ODASvpy0nmUr25iBQf
         /pspf2hlOK0ysqgZshNd4usK9WShBFfAzWHjO0rwWZZQ6dmwC6L0xn3b3n52ho/lgnG3
         Cq1RAn4Yv3/WNjlJ/ZrJo8gkqnyRb4lPeQ0R5oai9ZZeZAvYwTkq8e+x0H4dXkF4583X
         Z1ll2/f/B/lwafNbe4f5BzBeO1NTsoDpLcEaQ7kDQgO2ptUKaxZx4xoI27NtwcSKEQ8Q
         vFCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fZSXSPTA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ef0f12a492si6009516d6.335.2025.04.02.23.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 23:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fZSXSPTA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u0E3R-0003Kw-65; Thu, 03 Apr 2025 02:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1u0E3P-0003KY-T1
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 02:27:55 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1u0E3O-0007OP-83
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 02:27:55 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-226185948ffso5991505ad.0
 for <qemu-arm@nongnu.org>; Wed, 02 Apr 2025 23:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743661673; x=1744266473; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t9XCw/hGZx53ePP4u3QzEuyWB3/JZzErX8wnWHAT89s=;
 b=fZSXSPTAAhz3hH7jxGJb8w7G/xXoFkukPC9eIuXRvZViXDTVyHt2lXcVbS5dHHA63y
 TIe+zwPZXSoVucAiRJfwnFbD/LmwsYGLmp+OycCd5dtyHUcIKA8DuZmmJMydEyJCLrTH
 MVeVBJ8G24I9Sqs3yFUyoCxbTUd1iUDCFZfqMAthQxjaktPRy5Q64+GL3AEgBvz9il+W
 H3Sos7cL5n8V0kPVEn+xfGlilxO83wn59jWvqQtc3IXGykuRUNR5o9V9TIs+yvb5gDE7
 tlMmsIEMn7KufldDdif4nTX2o7XclvEqTNw1BQsfe0pEng8rS5+wM4YJO3ORr5L8WoYf
 /iZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743661673; x=1744266473;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t9XCw/hGZx53ePP4u3QzEuyWB3/JZzErX8wnWHAT89s=;
 b=BQc15+h6QaqRuwLbSQhJqyC0WtqpQOh1wW7pOj0TAhQQZvns+amBi3tk9bE7bgAlNs
 ZrQT5WPfvLbPRunBFl/yoYPfIzd1M5T1a7Wy/nBlv7ihfIKGvFr52OtUaKdpsJ/MSVGw
 LlCXCYiA9uUQq3IqFSet9gueo4VcaHnhkJlgmtHps97HJ49ija1gvGdg1bBxik/PATa0
 LiGNhnKXSbWJEN+MfqWsbzFHOd9FqoYGfR/1cp6NZoHhQCXco5vSh33JQ8ARZWTx7pdp
 vMlHSJELR1PHEMMDCvmDv1Un2y+v75XJUdA2JlzqS/79dTJyHls99dFNAnYr+OuukeGE
 pI0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh9Sr2dqxUctM8uyXRvl7JuG/Cy1x+mCP0YPY06BxuGkRRkVT0sFc7/UAG63MFMdaJLe6KE0tsTg==@nongnu.org
X-Gm-Message-State: AOJu0YwIHkuJ8wdvtQtcOzOHvI5+axQFgJcRjM4sX3ypeSTDeieYdawq
 xHvgIZFbUUum0hpAqva20+OS3Dzv9zxJsBjo8cbiqtxTwmX2m2wHj+qvbNFhvft+qW3M6VApmNN
 e
X-Gm-Gg: ASbGncugkZGSCCwrCGe4lTEfFcjc/1ebQx1DNzw0/7wsH7+N6brNcPLBEcQi1U3IGul
 yHeDsAmFGomax+oNJzv0DO4lDfX+9jvpRfCBS6AGXxlwf17BQ9vjN41hfHBi9RyxBM+OFfM2PfX
 DZfme7XfvTuWhQPWPSl96RuCSUeWDISx8M+Nqy0n4mSJ5bOATFz41QZG55RKcAiz0L+ACZ2pt4L
 15uJRP7kg2LruE6HHoJgdFLGA5R2S3MnFV0TcWf/odSo8mCJ+ZUHTjYvFLlAeXxD37kqZw3ZfCm
 HHfBN3McJOjyYXlAd5wkshsQyd430pWgx4g0tA0ajIFuLdGZZqOXul+i
X-Received: by 2002:a17:902:e746:b0:220:ff3f:6cc0 with SMTP id
 d9443c01a7336-2296c829906mr82948745ad.38.1743661672596; 
 Wed, 02 Apr 2025 23:27:52 -0700 (PDT)
Received: from [192.168.0.102] ([186.215.49.46])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229785bfffasm6716315ad.61.2025.04.02.23.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 23:27:52 -0700 (PDT)
Message-ID: <5eb3e23f-2d82-48b1-abd8-68dbfc1f5b6b@linaro.org>
Date: Thu, 3 Apr 2025 03:27:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 2/5] qtest/bios-tables-test: Whitelist
 aarch64/virt/APIC.its_off blob
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
 <20250331221239.87150-3-philmd@linaro.org>
 <957f0d3e-0c25-4d88-b935-ddfe7cc75776@linaro.org>
 <dffb0578-e449-4984-9a86-d675eff93485@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <dffb0578-e449-4984-9a86-d675eff93485@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: WpFmiDQXrSQ3

Hi Phil,

On 4/2/25 07:31, Philippe Mathieu-Daudé wrote:
> On 2/4/25 08:43, Gustavo Romero wrote:
>> Hi Phil,
>>
>> On 3/31/25 19:12, Philippe Mathieu-Daudé wrote:
>>> Prepare for ACPI table change in aarch64/virt/APIC.its_off.
>>
>> The comment could be smth like:
>>
>> Ignore APIC.its_off expected table (blob) for now until
>> we update it later, after fixing the code that generates
>> this table correctly.
>>
>> ?
>>
>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/ qtest/bios-tables-test-allowed-diff.h
>>> index dfb8523c8bf..bfc4d601243 100644
>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>>> @@ -1 +1,2 @@
>>>   /* List of comma-separated changed AML files to ignore */
>>> +"tests/data/acpi/aarch64/virt/APIC.its_off",
>>
>> I think this patch should be merged into 1/2, accordingly to my
>> comment in 1/5. FACP and IORT .its_off files should be added to the
>> list as well.
> 
> No, otherwise the test added in previous patch fails.

I can't see how adding the tests to the list in
tests/qtest/bios-tables-test-allowed-diff.h can cause any failure.
The list in this header file works as a "ignore list", so even if
the .its_off blobs in 1/5 were empty (for instance) the test would
pass if they are in this list.

That said, as per my comments in 1/5, this preparation is correct
to me: the fix will cause changes to APIC table so the current
expected blob (committed) needs to be ignored until it gets updated
later, in 5/5.

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo
