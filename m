Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCF4D74969
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Dec 2025 09:03:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWWNt-000351-0I; Fri, 19 Dec 2025 04:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWWNl-00034N-6h
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 04:02:41 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWWNj-0001Ck-OZ
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 04:02:40 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-47a80d4a065so7439355e9.2
 for <qemu-arm@nongnu.org>; Fri, 19 Dec 2025 01:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766134958; x=1766739758; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=adpDyaQvxXxXu5Lo/MFb3/3B2CYGte2+JVXQOds1J6s=;
 b=g4REVI9/bmeVYC50cOARo4Qa8Q8M0/cLPXBp1JvKx5dpLX8pJrQQQzSOzQiB5pMkMo
 3ntocjN4Plmkwqw+UZZRXUWM5xxq2tVsrPQDZx3ZCdutRzXJAwyIJ2Hg+g5CGNrA+RoX
 57Aneerw070/t3nP7EtR5vCC5GT3Uesk/3yjAGkSkagt6hCFujNY8EO5OkZ8v6uBYTig
 gfr/qXsEMhEJrvbSja3MTBDMLyVfCwkckTPFGuBNBnJ6nP6X97LKD5d0kqpw7N9JidIw
 /h0sdMSebFJqdn4qLvZhE1XLR/LQEr31TTiVGUNCnkIjCulaIDfRKaCxyTJ7qtmkKdXh
 432g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766134958; x=1766739758;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=adpDyaQvxXxXu5Lo/MFb3/3B2CYGte2+JVXQOds1J6s=;
 b=ac4wLOVzz1zg348WddPiGFHJcAC3k7MyDP4Kgt2y1KiOWz9in4VCNQsqPLe3Hf6ppa
 xZyq9x7i/Smq02OM8PfUaIEUJ/bRS5BlmaVUbwQNuRID3yfH/TvTEBt+i4WbmMhQiQKR
 YQ2hz/8iJDrqyGSQo5nxeG4xAgnIFuLEEKIqYJTaTl9JY+yd6rX12Ovzt/UA5EsKzPxX
 LW87RtlCt5VfO2/tj/XwnOq0sNMEsyFqT3fZm62UAkoawF6/7+we8FG+QpMn7jhr8oOm
 cl0EOLBLeDeE9Ph8WSLJT53NoZAuAUW53PqVxa91QnhjM3sBmZLg6P07O+NI6kE6tgvh
 zmGQ==
X-Gm-Message-State: AOJu0Yz9yW3BZJriCcNG2akhSlXmSEvT9q4pcpMuZBKdc+Z7jbNdIBG/
 MqhHEgaoSdxJYFszcErPiL3dORcKihjCMtAIDllKE/A+8BsPE1YnpqHXV6qRcI/e+Xq0u0tjpE3
 Nm1Vi3hs=
X-Gm-Gg: AY/fxX5tsXvJ1EOzJaAW2aunIKPMhKgkN7fDGZbcbBjmrg2etWtsPrRS6Uj2Ff1JFLN
 ClCKpmEPiDoVi3QUN4/zE31kCS7r6aE2lNoUMusW7A6604HVHlC3QDIRCe0rpt+GJ+x/W83nHsG
 FaE4JKjO1umaOCNj8sk2ddokVcYrPqNEejS8WRrDufFM9qXKe9AReIErssDlvvo7KOWjPPbcMLe
 0znNoa3RVBopi2jmhjTCR6nqMSQczvCSmpsp5NO5fKQ/VRB5It49B1Wz2H4Y3hixyrIcpuqZTcM
 Uc3asxnbx2FQwLbqQ9DOgXhWmovQudGqD00lSsU3YWjwoNdMmLroRCZ+RAYFiTsOFHGRyJHtvzB
 XttxLhKfg2ZnhiXtqJtNJCZsWxXv8b+e9x7Z95gVxZwrgkyoc9HelLOrVnxQf3DPxafHOzXUZBX
 ZOLTPMLmXj4MgJw3VKD4arkB8dFMU3j2l7AxbjwgAIpYXnuPGWRSgBuw==
X-Google-Smtp-Source: AGHT+IFdSJF/v0mWL+Sx+p12JveJPevH0b93ZRvGCWuF0gGXigP2FtBdaoNUqK0iHaB8DQHvzQbtZQ==
X-Received: by 2002:a05:600c:1d1d:b0:477:632a:fd67 with SMTP id
 5b1f17b1804b1-47d19546487mr18032695e9.12.1766134958098; 
 Fri, 19 Dec 2025 01:02:38 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d19346dfcsm41828215e9.1.2025.12.19.01.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 01:02:37 -0800 (PST)
Message-ID: <a8a2eec0-f458-40e6-bfcc-d51be9333799@linaro.org>
Date: Fri, 19 Dec 2025 10:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: Re-enable the MAX78000FTHR machine in
 qemu-system-arm/aarch64
Content-Language: en-US
To: Jackson Donaldson <jcksn@duck.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20251218214306.63667-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251218214306.63667-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x342.google.com
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

On 18/12/25 22:43, Philippe Mathieu-Daudé wrote:
> Unfortunately while rebasing the series registering the
> ARM/Aarch64 machine interfaces and getting it merged as
> commit 38c5ab40031 ("hw/arm: Filter machine types for
> qemu-system-arm/aarch64 binaries") we missed the recent
> addition of the MAX78000FTHR machine in commit 51eb283dd0e.
> Correct that.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3248

We have a functional test for this machine
(tests/functional/arm/test_max78000fthr.py)
so I don't understand how we missed this.

> Fixes: 38c5ab40031 ("hw/arm: Filter machine types for single binary")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/max78000fthr.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)


