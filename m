Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B739CAC5B8
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 16:09:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4Ls3-0007P9-SX; Thu, 02 Oct 2025 12:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v4Ls1-0007O7-UC
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 12:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v4Lri-0007t3-H3
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 12:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759421337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Rmp+/YAewlii0+8H4ZLxwk9Wj1HP5z9mVqsqLTMwS2Y=;
 b=YQhF3+3+eyX8VUEnjB9RCgDR/oGQVohDPXQsuWF38GWFHAZQSZkVeahA9VMQa3Ars79rJX
 JHGolPhA3mQeIwKjWTwSe2eS/OYbbmQQ90DINXeQQ27dTLXrCswXwmavoimk9r3iBt/upK
 8JcGwIKOck409NpWod46kexShO4cP70=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-gz87-AizOpycmjJl6frVcw-1; Thu, 02 Oct 2025 12:08:53 -0400
X-MC-Unique: gz87-AizOpycmjJl6frVcw-1
X-Mimecast-MFC-AGG-ID: gz87-AizOpycmjJl6frVcw_1759421332
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-46e377d8c80so4091655e9.3
 for <qemu-arm@nongnu.org>; Thu, 02 Oct 2025 09:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759421332; x=1760026132;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rmp+/YAewlii0+8H4ZLxwk9Wj1HP5z9mVqsqLTMwS2Y=;
 b=d+mTjiktmitP1QMyau7cjuTplKd1wGNQWB7nbG+7QHFvls46HHcHbys4DUZcWFFiEb
 +7QOiDI+xcr56iUO3nabX8DvyZf+YExYszEPyZgpaK2W8EdZrZ2vsgsQjVosHeU9ctiX
 j0tRjuQa2fnf+T5q7zEAcMDi2bp049XsWN2sjJ347dl5vVXfodfwqqxcyp0Nm0PPNvm3
 Z7v9PTty1Yrr6S+lMJ7JJ9lpWRHNYk9fSRT6XpdF1cHSI55bybPsRLSR4bA5tlfyBgtq
 6r+X1mUR+EtimGfZ/jC8XPTQqgCCEUpHypKWOTQWf8MdGAlrrIV46tsBJqsbsH1lsf5X
 ZqGw==
X-Gm-Message-State: AOJu0YyTIf4kQ7BsGDE0hZaJaFrRRawN4DMEh/SNGETgMsRyJYQsSYy0
 YYaS73FuACUtnveKv5ARtkL3ThqB9vPm8VV6EWxPV7TJQQUePPcsmcyIOB7ENwzyaOs/rKa6vYB
 4+KSnHyShy7N0hHpp/lstwFFB/feWCqJ0bCPkaoAARp9IbfLKy5bdIw==
X-Gm-Gg: ASbGncvvMFaNGSErYlRfCxOBKHhuFD/jFLxbe+sDO7pt1uihajin8f0kkwDBp9+0An2
 phWVkIZ+6ZBlq4E1BHWY4gCGEkWCdyT/o8rDwHlIATlDJZeHPNWgy9YfTaSSGDWGamwuFgfRfCc
 yKROhq+x9YXurTnWugg1VipCljqQa/8/m86gqgtg/JIJPp9BEEouLW+psKRSh+8JOdaJMCIYKXW
 633wutods5HubDnxVgTSR490syKw/SJVU9yNZcsEiLT5lRX8Z1Bmplgr3zVaIM8JYF9U2Oopahd
 +51c3nBGPj8vIJJ3kTmgCwFkbAhLMtK4bbkKV1l9Bqxr1Pp+p2gLFI6B+e9HklO+5rMXFcV62MQ
 aU0jFbztrtA==
X-Received: by 2002:a05:600c:34cb:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-46e613dd3cemr68378845e9.36.1759421332297; 
 Thu, 02 Oct 2025 09:08:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2kjoJbem5Mn1OaoS9JzNz/9FIh6j5BjBjv3s+xSFzsD3atYG4uNdet52L4fTCVI1Jg7tG2g==
X-Received: by 2002:a05:600c:34cb:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-46e613dd3cemr68378635e9.36.1759421331933; 
 Thu, 02 Oct 2025 09:08:51 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-056.pools.arcor-ip.net.
 [47.64.114.56]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a16e13sm89942085e9.15.2025.10.02.09.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 09:08:51 -0700 (PDT)
Message-ID: <d7a894de-e0f0-4528-9d00-a86a5b6f6d25@redhat.com>
Date: Thu, 2 Oct 2025 18:08:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] tests/functional: Re-activate the check-venv target
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
 <20251002020432.54443-2-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251002020432.54443-2-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gGDYjOOQxS2z1DALuy0kWUOGefjoQltPtivBHdaRkdQ_1759421332
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.451,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 02/10/2025 04.04, Gustavo Romero wrote:
> Add check-venv target as a dependency for the functional tests. This
> causes Python modules listed in pythondeps.toml, under the testdeps
> group, to be installed when 'make check-functional{-<ARCH>}' is executed
> to prepare and run the functional tests.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   tests/Makefile.include | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 62a4fc8ed3..e47ef4d45c 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -105,11 +105,11 @@ check-venv: $(TESTS_VENV_TOKEN)
>   
>   FUNCTIONAL_TARGETS=$(patsubst %-softmmu,check-functional-%, $(filter %-softmmu,$(TARGETS)))
>   .PHONY: $(FUNCTIONAL_TARGETS)
> -$(FUNCTIONAL_TARGETS):
> +$(FUNCTIONAL_TARGETS): check-venv
>   	@$(MAKE) SPEED=thorough $(subst -functional,-func,$@)
>   
>   .PHONY: check-functional
> -check-functional:
> +check-functional: check-venv
>   	@$(NINJA) precache-functional
>   	@QEMU_TEST_NO_DOWNLOAD=1 $(MAKE) SPEED=thorough check-func check-func-quick
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


