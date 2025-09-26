Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4018CAC5AE
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 09:33:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v24pL-0002zb-1Z; Fri, 26 Sep 2025 05:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v24pG-0002yp-Hm
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 05:33:14 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v24p8-0008Ka-FF
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 05:33:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e1cc6299cso18552265e9.1
 for <qemu-arm@nongnu.org>; Fri, 26 Sep 2025 02:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758879180; x=1759483980; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XXJjlwJIO2SkGlw/DG6TsBIs0wt3U5ffGWZ/kSJUQdE=;
 b=M8BpylL8pe40yy5oEjFyPmHQGPkGqQEoIalSZWQUA/OXlZ5BSwKR2hu0UvTggAEW9z
 fsnOAu8Icxh1xaXOXda6onGC6dESXw5cPd8dwRLN8gFyV16MeKWBNk8Gk45EipMIlhbe
 z2c1z3jBBWCyg/uzG3OiBo5ugRbNOFdv5TkBPgcWyEkGJCgwz5/fFMxEwtz2+/mmirLQ
 gGaC/mVChDbWNA6MLEqi8WvPGOMwk2ZUCy4iFCT/kDHf7WUFqvQhJKbdWJc4VxsWLwC2
 xCnmSSPHLOYGvYDdcokoeDAMGOkRmZIeqaYkR9iVILMpgj15jc821soqZkyGDEoAHGz4
 cUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758879180; x=1759483980;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XXJjlwJIO2SkGlw/DG6TsBIs0wt3U5ffGWZ/kSJUQdE=;
 b=eNSkizfZEqVRS9NpvtgJR0yUPbrWY92Tq/hkQEY8t+2ivJWk3H/5L5UIwYJXkyhafA
 tDONI65A86Q/a97tuw05WpNaYvq8gPGkPlTnrOfdWDTmKuw/lKQMZNDu57YfdNi1a1JT
 pdD7i1blmSYnumRY3UX1WeVuf1B0K3y6dImimaAAsJ5mGu4hKAmrmtTej1SjJVwfSkqv
 KRhlNtGud6nvY6mNr0sH6Xf6+KKuTeUttGmtCx9vaKAeMd0zoCaGS3cu2RiRnfcPRM0J
 w76R7H0FaDRX9BWnwCUzXvM4WTiHsPBer06AqfrqGA2+j/ECggsYHqhFIecL4ITTXv37
 FD8Q==
X-Gm-Message-State: AOJu0Yw2gDUloq76ZcsBnjG0jTwUQxUdDtTq+yUps3Y/KutJMMCKXeDH
 IS75aAsRT1TmiNjiDT6GpeT2hUQRFZT55LtanwYlitXAqvNexEPGxZg67dT2c9mJLK0=
X-Gm-Gg: ASbGncuhUVsIC3P2JTY/b+5bmWZQ8v87Nqmf+71KCV8IlsfE/gjNXvHd3WrCmFssrFL
 10yQoUrv+taW8nHH5ebne4pj/UH5yFs4CCu0wpW9vDArN0gTrGX1HM0IbVEUSzQ21qk98sko5DA
 DYpDXOVYJ1yOtr/Dvb9YOXeomqEeZcEnGd0yY3q0+8h+EVcr5OgXsB1Qm9Ik4K1ABY2l/BeQgAl
 zjcfGHjo8avVxsgMHRoi5zdLCPsmLW85PwR4ysKOen5095FBUIf7atwjtQ9dFnnb5JfUd7Rujxg
 /1Wr8IDFqygmhIpJNonqR7x4r2Md+KRleOg2FksjB5KNM8VgMCv6U8Y0uuwhjAtPbI3WyJ2Cpkr
 9nVrCyh1Ex32ag9m59/ggymZBJo6KQgz6VPQMMy1LvEVjPjhweY9lSNM5gGAhWOZu7myHzjmyG7
 Wk
X-Google-Smtp-Source: AGHT+IFWwLTGAxMBG/54brmlYi/DJ22wC2K7ObAbatPmfcIpd5SoEQsbAZXaBG8j1RxV9Ga87xNlPA==
X-Received: by 2002:a05:600c:4f07:b0:45c:d817:2a6a with SMTP id
 5b1f17b1804b1-46e329aa91dmr68161205e9.9.1758879179774; 
 Fri, 26 Sep 2025 02:32:59 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33b6da3dsm34641535e9.0.2025.09.26.02.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 02:32:59 -0700 (PDT)
Message-ID: <269cec44-b851-4b2e-a1f0-ae3a24cd97cf@linaro.org>
Date: Fri, 26 Sep 2025 11:32:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] tests/functional: Adapt reverse_debugging to run
 w/o Avocado
To: Thomas Huth <thuth@redhat.com>, Gustavo Romero
 <gustavo.romero@linaro.org>, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org, manos.pitsidianakis@linaro.org,
 peter.maydell@linaro.org
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
 <f94da379-eee1-4375-95e6-7349c3c188ee@linaro.org>
 <1d096685-ada0-4c8a-b16a-ed8a5df7b90d@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <1d096685-ada0-4c8a-b16a-ed8a5df7b90d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 26/9/25 11:14, Thomas Huth wrote:
> On 26/09/2025 08.49, Philippe Mathieu-Daudé wrote:
>> Hi Gustavo,
>>
>> On 26/9/25 07:15, Gustavo Romero wrote:
>>> tests/functional: Adapt reverse_debugging to run w/o Avocado
>>>
>>> The goal of this series is to remove Avocado as a dependency for running
>>> the reverse_debugging functional test.
>>
>>
>>> Daniel P. Berrangé (2):
>>>    tests/functional: replace avocado process with subprocess
>>>    tests/functional: drop datadrainer class in reverse debugging
>>>
>>> Gustavo Romero (7):
>>>    tests/functional: Re-activate the check-venv target
>>>    python: Install pygdbmi in meson's venv
>>>    tests/functional: Provide GDB to the functional tests
>>>    tests/functional: Add GDB class
>>>    tests/functional: Add decorator to skip test on missing env vars
>>>    tests/functional: Adapt reverse_debugging to run w/o Avocado
>>>    tests/functional: Adapt arches to reverse_debugging w/o Avocado
>>
>> Out of curiosity, do you plan to post the final patch removing Avocado
>> use / dependency?
> 
> Which other uses of Avocado are you thinking about? AFAIK, this test 
> here is the last one that used Avocado.

Maybe I was not clear. After these tests conversion, I don't see any
more use of avocado, so we can remove its dependency on QEMU, right?
Basically, in a final patch I'd remove anything related to:

   python/setup.cfg:37:    avocado-framework >= 90.0
   python/tests/minreqs.txt:35:avocado-framework==90.0


