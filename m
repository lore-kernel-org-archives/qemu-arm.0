Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D30FD88C7
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 22:34:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w05ed-0003ct-VJ; Tue, 10 Mar 2026 18:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w05eQ-0003D1-Dz
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 18:34:08 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w05eM-0007Rr-GY
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 18:34:05 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-660a58841d4so10041955a12.0
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 15:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773182040; x=1773786840; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4hX5NNmFeeurVlMxYxeBTfUoQ2gdRNsswUC6nvUAhOE=;
 b=fLjmPa4xEq6HANvTYTUKtPDWHKsDrkPi+Yx1zEkqlRV2/Y8afaRVrmcBU3Nlwdug93
 Xralkq4dv6+yJs9q7l5e5ffprPcXKlmhW/u9vPxa1NP4lXdG/CrsjouUQi5y5kWZHY/h
 Pd2sNBSD94Qj4WHgtSMKkvwXM7hiZqaVtcvNdQMBub514Fd+YsyhY2+9yt3SAqVzWKiw
 w+TwHN/uiVOHMs4HxuXUk9dvoUPjsh0AWCBmx9cGI+G263ef61g740pYjLa3ubYfbwgG
 cy2ebwgx7Dmm7x7UDIDJGgdCl6+++5mNONyhmE55g616MIrYpFnCbzMvH99VD10HhdcJ
 zfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773182040; x=1773786840;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4hX5NNmFeeurVlMxYxeBTfUoQ2gdRNsswUC6nvUAhOE=;
 b=rxW7DGOE9BpvxPbpeYpS/ddqlHgvOyXtCzDW+nxP+7IAXNXUNuawYrJ3Uw8UQpOL2I
 8kCI2XdQmlfSBwUibjcQDQ9GZQg6kCt4WEH3XEVbfZWNQ/Pb0s2XoxsKbdOCzRN7hsRc
 ikIn3HGqGNbXnYAAuLggUqFqfX14LlTvQWJwc19idH4ayxHrXFPHlFsseSTO1SB5u3jY
 APOPBfD8tFt3pu7V8B2np7Hd/FA4xwYOL0Z5yDwCUSn/IuIlXxjNEnDfZXCiInkqzYRb
 9F9gr8IvlJJlNt7p8l1BjM0eK8G3uuvNcLyZeytVJX5UHgYQbJLz2X3h43qgrayL05RI
 s/Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQdJEWemPfyG0Q7UDCGxiyzHoP3JnO2CVLjLqKtFPzqyfOI7F2aokhicfmJYfm+WqSHrFvo8n1xg==@nongnu.org
X-Gm-Message-State: AOJu0YysgcOsNpIAfDSqecEC8anRMUyAowfs2J0FgjEYGV46IL8iJDZI
 pXvBj6IhxYXZa6iqO6K2MgeZXQctbGxH9S+oj78Zkcm4PuZN2AOev/uz9HBMzsIL3K4=
X-Gm-Gg: ATEYQzwhbGLblFAxoZGoAlWbM57Osh/sUdNfqPpHxMIR+p7qJPAGRhtsIeucd0J91CI
 HSLEixvDqez81SH0uzVM54cYzPN9s/2ZvLFSFcmFAqs10dUOmy88ecSzGFR9PDC1OCS19QeXnjo
 VKrTer0lwdlOBetyc5L+nYCV9LV6LMTmxzX6/T+Dd7eOfCiSeVV1MlEIzS9ohfCgflu1JwZZJbt
 mWoIgfZwLVFyhwZ4sjyvFZWq7CWEzh9EPOfGIyixHjEOyK8Q5lS/5TjmS54u3MlCf4V+GQScNso
 /P+Vbv0laaahD9lPtO/iibwzxsblk8o0J2DuvkEFD8C5D5hiKUq2GmZcHGRwKG/jJcgaOrRgPgy
 UtkPjwx6Q967Yp0vWTHBcNedl8rYRapcor+exVxWqpKPTgOLzICzHvr0ljLJJlI9CGkfoj27iTR
 fznRsJxIEkRYGK6mgxZlGjIaHso8Gi4z/oMzHVOYxmT7fC+tGfKx3fk21Hy9bbKYqSTg==
X-Received: by 2002:a05:6402:4405:b0:65f:8271:3f7a with SMTP id
 4fb4d7f45d1cf-66319cc6cf4mr130701a12.16.1773182039867; 
 Tue, 10 Mar 2026 15:33:59 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6631457f349sm145109a12.13.2026.03.10.15.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 15:33:58 -0700 (PDT)
Message-ID: <78c8b024-6dd5-4f1b-a19c-c7a71c7acc9f@linaro.org>
Date: Tue, 10 Mar 2026 23:33:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tests/docker: add gdb-multiarch to all-test-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20260306161728.2657486-1-alex.bennee@linaro.org>
 <20260306161728.2657486-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260306161728.2657486-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/3/26 17:17, Alex Bennée wrote:
> This allows the gdb integration tests to be run as well.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/debian-all-test-cross.docker | 1 +
>   tests/lcitool/refresh                                 | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

