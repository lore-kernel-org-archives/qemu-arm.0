Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B43CCAC5AC
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 06:50:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v22Gw-0000O8-Mg; Fri, 26 Sep 2025 02:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v22Gu-0000Mx-IO
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 02:49:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v22Gm-0003Jn-3H
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 02:49:36 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e326e4e99so9761745e9.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 23:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758869358; x=1759474158; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KYIqTNYeo6LYi0M0wuMxfzsr71kZLdJRDJuHn7PbYJM=;
 b=v5LVUIO+57CaTKADsw3+dTgP2QSO4WvxntPzxVS3BpTHa2FGLw1NwewGlm8ylAFl/v
 k92TRtHk76/e8eYcKQ36nX2KKv4uI3KEwrnsXhr+W1Us2WT1eYQ/AfOTxFQrbSNY+TGN
 PHo+D6JDylSnGKxW48aFv7JpPK/ghO/lkKhUikOFPRVKEda7pUbGPC8i1J0k5LlWbMnP
 sj5T1IedxILdQ3wCY7NorEM741JiAHXGJ3t5Snqk14yWLkCEEWNBFLiCAkHV9EZdW4Hr
 rQe+qZDYL4rE8m2JQSPRWR3MXh9MzGiSCor5SrjDlstQyr6oJCdXZfDK8MW4wi4ZwxQF
 VJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758869358; x=1759474158;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KYIqTNYeo6LYi0M0wuMxfzsr71kZLdJRDJuHn7PbYJM=;
 b=Dh7jOziiJRS13Gf8gwkXCLvDfaozBP7afvHqV4kor1Jw22AOXptkjWnWJ4A1QO3LLK
 eFIFzNOlM7+C4V7gY1TNZ+f9/KgRzogfJRKf0oOQIdxl4rGZDrHOGbYxK+p/PlDvNoJv
 nmHJMGrqv8DGoiQs+59Ou9tBpGKoLj89BreiYPCGl5qbGJlZ+myeqz+l6sgOgtgoa5S9
 sSmAbiTq6FcmmW9iBxb/rNII8wkDPHZU0rfpOmlZDy6FgSO8WO0Y/D3zK8j+ka1v7E39
 nS43nqil801bfsi0IVUTfHb2+yG29wmdgAyLh3hb36DqJ5R37iWBbpM9GZhnYKRktice
 Jsog==
X-Gm-Message-State: AOJu0Yy0sA/4g6bWLj9OEXvHP0bsg3ltz/Z2H2MOhAQCnTtyAIJKTJ5i
 FZdQE/0MW/F92NrvQLi13rn/1N9IrZMxrhlf/hut2LiR+3N005wgvDlbRQ/5U7Y3/0c=
X-Gm-Gg: ASbGncs5JmLkH+2Ft9HX4z7fRGXUYghuFKs7Q/TuWFcldcwp8ENsC8VtX6XCV3S0bAf
 EGqT9ImzRZA924kbXefRYHlndYT5ZmrkMfPd7NnqYs8Gc5+fEvA509IkSnxdvKB7MWUIWly70Sj
 fLhcMt+8a0sAejmJaufC4wsBlzHjkDgDLeY2sqSFf/Oem8XwheHeCwjd2hFsrZXkhAoS73psKZi
 hDFt2UdiDuoFv4EXxYaj3kTOcxTsnmKPLTUc7Nb6piQATbFJdCQo7oroGh2cpXzzgjQBWaojV9P
 sKWJxd1RBE0V5rcXKEwpD4TYcAKDo4duCKbDJWOqEouM2rP94ymt395IwYNjvgOweeTYyTS5A69
 eDpcKRvkWxalZDHmQ9xHarmU/MiRHRnTnfH1A9x+j+lwnUaZ/D94ZcOPyAkSF4RGjjD3a5T8HIc
 Ol
X-Google-Smtp-Source: AGHT+IELmlnsm8sHfkKTU5f5UTYLZaYcG5Rvv6klj6he/YjKXtUPF6EPG6VC/ho7HsT23ICtepCiWw==
X-Received: by 2002:a05:600c:a4c:b0:46e:1a60:c995 with SMTP id
 5b1f17b1804b1-46e33c38334mr53897805e9.2.1758869357864; 
 Thu, 25 Sep 2025 23:49:17 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89fb2fcsm6200050f8f.22.2025.09.25.23.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 23:49:17 -0700 (PDT)
Message-ID: <f94da379-eee1-4375-95e6-7349c3c188ee@linaro.org>
Date: Fri, 26 Sep 2025 08:49:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] tests/functional: Adapt reverse_debugging to run
 w/o Avocado
Content-Language: en-US
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, thuth@redhat.com, berrange@redhat.com
Cc: qemu-arm@nongnu.org, manos.pitsidianakis@linaro.org,
 peter.maydell@linaro.org
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250926051542.104432-1-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Hi Gustavo,

On 26/9/25 07:15, Gustavo Romero wrote:
> tests/functional: Adapt reverse_debugging to run w/o Avocado
> 
> The goal of this series is to remove Avocado as a dependency for running
> the reverse_debugging functional test.


> Daniel P. Berrangé (2):
>    tests/functional: replace avocado process with subprocess
>    tests/functional: drop datadrainer class in reverse debugging
> 
> Gustavo Romero (7):
>    tests/functional: Re-activate the check-venv target
>    python: Install pygdbmi in meson's venv
>    tests/functional: Provide GDB to the functional tests
>    tests/functional: Add GDB class
>    tests/functional: Add decorator to skip test on missing env vars
>    tests/functional: Adapt reverse_debugging to run w/o Avocado
>    tests/functional: Adapt arches to reverse_debugging w/o Avocado

Out of curiosity, do you plan to post the final patch removing Avocado
use / dependency?

Regards,

Phil.

