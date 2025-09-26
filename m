Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28ECCAC5AE
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 09:43:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v24yw-0007FE-As; Fri, 26 Sep 2025 05:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v24yt-0007DL-2m
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 05:43:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v24yl-0001bO-1e
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 05:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758879780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=11zODM8FSjucyFFR1ACLWhDvwTxj5msYcrLVaYBi+Qk=;
 b=Z6gkUnRKnXBGcPhlqpoxiSfcdn2uyLRgm/ojmsmM9rIScPGW1HRXwd6PTCRF6GKC6nBc2t
 KprZeZJ02MWy5QYLnwxgKaPN/qB1bdKWm2tRkgUL1yKZlpiDF3T3vAO+oriJNppuPj0/19
 P/sikLXhiRcYHAdJZ4X0VS0grl4Xj/4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-oUhKErnwMF2rf5QGuZD3hA-1; Fri, 26 Sep 2025 05:42:56 -0400
X-MC-Unique: oUhKErnwMF2rf5QGuZD3hA-1
X-Mimecast-MFC-AGG-ID: oUhKErnwMF2rf5QGuZD3hA_1758879774
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e2c11b94cso11624535e9.3
 for <qemu-arm@nongnu.org>; Fri, 26 Sep 2025 02:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758879774; x=1759484574;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=11zODM8FSjucyFFR1ACLWhDvwTxj5msYcrLVaYBi+Qk=;
 b=BoOBjcYRXNM+X30FxAVUI0ihtRqBdWn2Dd81YMAWkN378OkOERLceMxixGhO3+CQ6b
 aj05C0eDlz2YsUUSNlnFQgtLoMpiL4Lw0qAi3vBwp8lxmVmIp5YMpD/rIS43YlYmNFrA
 TqFsnU3kMWbCg//n5CqYPg+rSihYjZiCXbZir5qVKaht2eMEF0zKikkRimYtt3v8by3h
 9MvQaZCtszKljwSfM5pgWRN6f95okhJibvIAeq7Ha2JeRDRJ6JwzuNlpLW0zQBC/oEzg
 hbAfsSD8vHWuMc5sQMlsD4MGdXwO80NxuwetiqdCLZ7s9YQ62muEUuFuU2d4qTR9O8oG
 b6RQ==
X-Gm-Message-State: AOJu0YyZTK3wgEYAjcHSkpZk6OYl6oOFNsburkJ+ryM5n9T07L5bKiUh
 0n2IlV1z2WbMoYzr1AmYKsqXnYMTa4ry5sBqGXWh6JjJFmzcl5R6THHXAp7V2u38/JXVrjIH/lL
 SwUGMKzY0/fX1oOdLkxR7GPEkHjzpPh7SolvVIs7SiRE9z32I5N+IlE4t9Cxp+Ytn
X-Gm-Gg: ASbGncuFUuOvAYNk0QwKgkEVRZWlk2cHR5QbhrxeW8fBB9P58C7LP5uSIsZBD/V8iKA
 C5ljqGwCm3T+c14oDeMgYeYRK9dt0ayzU/DwMbCLLx1vD3mVnURKugm1TyxA5DlZpZjHO/uJjW1
 LbQML2puw41Afyz2jqtLhsUlG/d1CmtMhLpYlI9Htq/Fwev6eQYYXqFhOwisYt7kejRnz/YyWWX
 fIMnRMmEXW/rYxVBZpRLxquLbVc6ELi8yvsV+mDuHa9Q/C9rwnaqPtdFwixinKvaqOd+J75mqCK
 k/x9VwJcg526vF7xQDRiGtJEyUpzcIegD2+DGm1RD0PKLwzFk8V0iA3a9rNANiTUrm5kiwIpOcd
 lLtbx8A==
X-Received: by 2002:a05:600c:26d4:b0:45c:b601:660a with SMTP id
 5b1f17b1804b1-46e329faa9bmr43688465e9.23.1758879774471; 
 Fri, 26 Sep 2025 02:42:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQMO455ixVo9feOtFQFRCTzAEEwT4wtv2Dk7bS8QI9cE/lTCgCPNsQ2rPzCgDtoI3wgbpExw==
X-Received: by 2002:a05:600c:26d4:b0:45c:b601:660a with SMTP id
 5b1f17b1804b1-46e329faa9bmr43688335e9.23.1758879774055; 
 Fri, 26 Sep 2025 02:42:54 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-212.pools.arcor-ip.net.
 [47.64.114.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33e3b355sm70316325e9.12.2025.09.26.02.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 02:42:53 -0700 (PDT)
Message-ID: <fd75af5d-c981-4f60-a077-1c7f86ac6813@redhat.com>
Date: Fri, 26 Sep 2025 11:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] tests/functional: Adapt reverse_debugging to run
 w/o Avocado
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com, John Snow <jsnow@redhat.com>
Cc: qemu-arm@nongnu.org, manos.pitsidianakis@linaro.org,
 peter.maydell@linaro.org
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
 <f94da379-eee1-4375-95e6-7349c3c188ee@linaro.org>
 <1d096685-ada0-4c8a-b16a-ed8a5df7b90d@redhat.com>
 <269cec44-b851-4b2e-a1f0-ae3a24cd97cf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <269cec44-b851-4b2e-a1f0-ae3a24cd97cf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MKQ_4aEckZb-mPTJvnGZuE32YL_AlM4obgtMb-s24qs_1758879774
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 26/09/2025 11.32, Philippe Mathieu-Daudé wrote:
> On 26/9/25 11:14, Thomas Huth wrote:
>> On 26/09/2025 08.49, Philippe Mathieu-Daudé wrote:
>>> Hi Gustavo,
>>>
>>> On 26/9/25 07:15, Gustavo Romero wrote:
>>>> tests/functional: Adapt reverse_debugging to run w/o Avocado
>>>>
>>>> The goal of this series is to remove Avocado as a dependency for running
>>>> the reverse_debugging functional test.
>>>
>>>
>>>> Daniel P. Berrangé (2):
>>>>    tests/functional: replace avocado process with subprocess
>>>>    tests/functional: drop datadrainer class in reverse debugging
>>>>
>>>> Gustavo Romero (7):
>>>>    tests/functional: Re-activate the check-venv target
>>>>    python: Install pygdbmi in meson's venv
>>>>    tests/functional: Provide GDB to the functional tests
>>>>    tests/functional: Add GDB class
>>>>    tests/functional: Add decorator to skip test on missing env vars
>>>>    tests/functional: Adapt reverse_debugging to run w/o Avocado
>>>>    tests/functional: Adapt arches to reverse_debugging w/o Avocado
>>>
>>> Out of curiosity, do you plan to post the final patch removing Avocado
>>> use / dependency?
>>
>> Which other uses of Avocado are you thinking about? AFAIK, this test here 
>> is the last one that used Avocado.
> 
> Maybe I was not clear. After these tests conversion, I don't see any
> more use of avocado, so we can remove its dependency on QEMU, right?
> Basically, in a final patch I'd remove anything related to:
> 
>    python/setup.cfg:37:    avocado-framework >= 90.0
>    python/tests/minreqs.txt:35:avocado-framework==90.0

I think that's related to the qemu.qmp stuff coming from 
https://gitlab.com/qemu-project/python-qemu-qmp ... so maybe better sync 
with John Snow whether it's OK to remove that?

  Thomas


