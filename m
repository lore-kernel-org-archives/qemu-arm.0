Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72A8ECD981
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 15:58:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vo1kY-0004q2-Ry; Thu, 05 Feb 2026 10:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vo1kR-0004mO-4h
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 10:58:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vo1kO-0008Nh-53
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 10:58:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770307103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3NuuDISJQulnfXtrUhxsWq3tnHI0conwcIV5J6HWz/w=;
 b=ESbZw4eB6gBi+ZA/Fr+NV3uerw/4F35t75+l1g9N0A51hGzdRFbwvmo5fXtTKKVDZ8lqCe
 1/AFgG0Bc8AlIZdI/38jdWYk3sBE7ISBlIEoX1p0/Tgyno9dbWRjI42Dx1X3lSLcS2d+7a
 DoJhhaViWovQHFXX4pG4BPxyJ0mE/m8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-w1TSw2WoMhSUKGebOCI1eg-1; Thu, 05 Feb 2026 10:58:18 -0500
X-MC-Unique: w1TSw2WoMhSUKGebOCI1eg-1
X-Mimecast-MFC-AGG-ID: w1TSw2WoMhSUKGebOCI1eg_1770307097
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47ee33324e8so9198185e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 07:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770307096; x=1770911896;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3NuuDISJQulnfXtrUhxsWq3tnHI0conwcIV5J6HWz/w=;
 b=Mw8IiayTdLR5E4RMgWrU0h2voCzJ+IfAjLWY+DmnX4yWpStpbwApa8FyV21HmFnn1z
 0htj2nzYr0akRlKUw3U79EQ7+BMYY0y7D+5dxM8zydFOEokRI6qBioFmQKnwI/IAS8qg
 /MfRZ6i8f2IdtdY6he9HxrbU2DTGy0tfefif6gmVhWQwwBmUIgj5WAhkO/ItYTZdTNMb
 SUSIhtkXRGoSAlntOliBvSNzbrdCcbVlkatZdD7WlXffI24dQh4WuQwptZeJtr7+1h6Z
 JCQfL/5xhj9IWc+ixzE/UNvJ5zQfBpauMQgH8ri18sFap56JB1dz7bzJk+EhlXsI69uo
 EQUQ==
X-Gm-Message-State: AOJu0YwFMBM0DvyIUUV47tlG2602cc5/BWz1iZMqrXwfcQgRa40whCPn
 IzHCboCUtFAxFejvVn7Cq4W8Z6okqUyW/hcYVO1vc5CULoO/3KzdOOfWgzX8SDD5W1U/kojR73W
 ycX8KVN5ZVf7B4JfA2G6C7vssLmHZQDGxhqoRf8gRRptPPtE+cQOCe4kF31Rq5A==
X-Gm-Gg: AZuq6aIivdzAYov93olvLdRJuVo2lVicPl6sxzbRuUc/sxFC1bEaf7mHwrFNNZ+LcIh
 Y3wdNG9QaEZJdSJF1BaUvVppAuXpiRGBfk4/1WAWyt5FOhTYzbK8toF7Tg65zNTknHtSb3BtJlI
 zDVIV6WxEAtCYQ10ngkDm3DBKPoG/o/ifkCOLtCCdEp+BpRiif5DPBFLG0AfpZr/x3IUFM8RW8g
 iYKNdYj2PQpL68A/eaIwR9RhdccNWe56PVWnTw57/zjevISWdBWEhS5c0xhbcSpskCv3hsIaxQE
 BfrjwKeIEufOvRHTeHePSk/3vrPjZT7rQmnPgy3XCde5YMqGWIOnBTah+CmUQzNb4hQQRD7CaDQ
 WxCypNN41K5BTBIeNPBPNUyRKs8tzORysrnAWprj4tnMmAYIZ
X-Received: by 2002:a05:600c:3106:b0:477:58:7cf4 with SMTP id
 5b1f17b1804b1-4830e93e9b9mr90293195e9.4.1770307096085; 
 Thu, 05 Feb 2026 07:58:16 -0800 (PST)
X-Received: by 2002:a05:600c:3106:b0:477:58:7cf4 with SMTP id
 5b1f17b1804b1-4830e93e9b9mr90292885e9.4.1770307095635; 
 Thu, 05 Feb 2026 07:58:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d2c856sm66604715e9.4.2026.02.05.07.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 07:58:14 -0800 (PST)
Message-ID: <a1bb1980-2927-4061-be6b-ba7aeb1613a3@redhat.com>
Date: Thu, 5 Feb 2026 16:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/45] aspeed queue
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20260204103136.1795455-1-clg@redhat.com>
 <CAFEAcA_w02hxyiCtOzWc9mmFR=6pLixObnSnenhBdJ4zixjfrA@mail.gmail.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <CAFEAcA_w02hxyiCtOzWc9mmFR=6pLixObnSnenhBdJ4zixjfrA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N1XKu8ONr9t_8Kz-AoC45ge2kZOxkTGON5paHcvEisI_1770307097
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/5/26 14:49, Peter Maydell wrote:
> On Wed, 4 Feb 2026 at 10:31, Cédric Le Goater <clg@redhat.com> wrote:
>>
>> The following changes since commit 28a6ca268c2cd3718b5bf24c2d97e3d1e95fc604:
>>
>>    Merge tag 'single-binary-20260203' of https://github.com/philmd/qemu into staging (2026-02-04 01:57:26 +1000)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/legoater/qemu/ tags/pull-aspeed-20260204
>>
>> for you to fetch changes up to e56e45d5bdc808ed52f943d1a785e4d885b6f18f:
>>
>>    tests/functional/aarch64: Add I2C test for AST1700 IO expanders (2026-02-04 10:10:57 +0100)
> 
> I noticed this a bit late, but:
> 
>> ----------------------------------------------------------------
>> Cédric Le Goater (3):
>>        Merge tag 'pull-vbootrom-20260116-v3' into aspeed-next
> 
> could you not include merge commits in your pull requests, please?

Ok. I don't do that often. I will remember.

> We don't generally do that (the last one I think where we had it
> was back in 2023), and it will definitely cause you problems if
> I ever bounce a pullreq back to you with "please rebase"...

Sure ...

Thanks,

C.


