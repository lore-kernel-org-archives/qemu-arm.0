Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88B7EF99C8
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 18:42:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqy7C-00052P-LL; Fri, 13 Feb 2026 13:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vqy7B-00051g-I9
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 13:42:05 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vqy7A-00038w-4E
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 13:42:05 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2a79ded11a2so8482075ad.3
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 10:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771008122; x=1771612922; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e4zr91gKAiqEpioA8CmVpzflDEZzXrizHVZVzLXa9uM=;
 b=lSFWkLA2VYN91h0ehZx6+VPf/f/Xi5u9OC0mLdH8goswcFer4ia2BCzeniXWp5ZX/3
 HfJeEnhkK1jCa2qPyBu5SZ3dp01X2vfUjf1pZxcxVCQd9Ebh65DGBbF97OWo9pB6F8w1
 rBNW6Yt/g//BWBp16sW5+w8E+qvPwqpR4UhFhJDNsMPRjmnuVh0aMMSDkIh+xkPcUZqd
 vlBPVJ3BySJ4zK+ZTIeZl8QMOTzYjupCLDI+RMyhAUBsGv3N50hpOy8CFoaCLRhrxTvQ
 rCBZfG0Nm5vTVo2F9kBD6/LGJiWm4ZH+nvcyvm/Blgw3REQ+qhXVSmSNjNmtjxifVoBb
 nAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771008122; x=1771612922;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e4zr91gKAiqEpioA8CmVpzflDEZzXrizHVZVzLXa9uM=;
 b=rlMwExHlSTBrkFBDTR9VuGvuCgp6Q3lxfdClBC6afhtLv+Lbjve26qb60Rp32qFPWR
 7kvE07vZIMFfCKSKT3zWgJu+qPoYDs6wwUJOvB0wj23HS7lMEF8BAtoRJld8or1waL4D
 zibsPOrnveRIulzL24wJxOWClIDjnquTSqwnpcA/gRo78TrXvYq1I6y7e3PQBt2pBXzE
 DY+Iay7OuWOiw1gLE4ty8+DXoXfcG6uXWv82UcbIu4Rp2uR2QC0sytOSKKZf39jeMdK/
 WDZP4QzsPJ9hhKJOirLovWPQAq7AokWlM7M8bY4bUQMNsA49c1Or2dooYhdUr8eiRpaC
 lCqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVcTgmEAUC6XnYfx+Pd1E3EMtWAOvto9GSRvgVx0fRY4N5jsEr8Qro2aT9iwS8MGnZk4OJAaC7bA==@nongnu.org
X-Gm-Message-State: AOJu0Yyu5fq7mxucsAVEgg4ay7mcYY+lvKjiem0Wmkw6uXvtkiXDaQDZ
 vmp3FdNBBwXZhconrFI9QOQgiIJJ4GtILOw9PY8HTlXYEj2OgnGsbBr8TMij4UoXJXg=
X-Gm-Gg: AZuq6aLGILj3Qam/fAI76hxD5rUD6BzIVbHTcDzKueGrRfY/ZQ9bo29uMFTOF85hldt
 NvmA2f5sY2AmiP/DwGVzD8XTVMTva/ePCf4lP2pKGthzn2tZ6HDJFcP0Z3m7TfywUo6SeyfDVZd
 it+YO6GfYXOrEtr22rEORO1fmkdwMpTGNN3CJa1g64Ef2nt/x2OmVpIHQUMMY9cHDGqBYhJMfHj
 HsngLoDIFRlEFVC2HWyWSwn227L4XtqR7zzo8d/tW/ukbS4PQsBIwA450KXuCDkdfKfx7knuL00
 byY2ZIfv7MiHggPnBZ5BfbQQB+Mz0ulm00ExmNYtqMt6G8eEC8LclA2vZQzxHOXLikc+OVazBCv
 AJxTwHS0mxWFICNfklrezBGSwWnb6z7BfQn/zkLk7zJmY4WeKAtIUguBVYxfc6FypGNRilyzeHM
 OXEudbAEWOOO30iYSQIWKMBccQ2zvSkpgYgT/M9JiFltrKoXzUKk3PvCMG3+2RcObTgDjC
X-Received: by 2002:a17:902:f788:b0:2a5:8c1c:744f with SMTP id
 d9443c01a7336-2ab505a3194mr33273005ad.40.1771008122164; 
 Fri, 13 Feb 2026 10:42:02 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab2984c07bsm90760035ad.7.2026.02.13.10.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 10:42:01 -0800 (PST)
Message-ID: <c5b23db4-dcb3-44b5-bd19-4718ee6a00a4@linaro.org>
Date: Fri, 13 Feb 2026 10:42:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] tests/vm: bump OpenBSD to the current 7.8 release
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260213154859.1551283-1-alex.bennee@linaro.org>
 <20260213154859.1551283-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260213154859.1551283-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
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

On 2/13/26 7:48 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/vm/openbsd | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

