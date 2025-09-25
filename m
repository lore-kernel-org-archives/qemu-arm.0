Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957D2CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 11:10:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jrj-0005Ll-TD; Thu, 25 Sep 2025 07:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jrh-0005LH-Rh
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:10:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jrU-0004D0-OV
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:10:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46cb53c5900so9286195e9.3
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758798601; x=1759403401; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=liny2HRjDhzY3uSkfrMSt+/LAu0SDiqPN9EdKNvcux8=;
 b=pBytXiFxwtztGQFwifaaVuXY3G+5VbtR3ZfbiPib24vkJMLLgORE9KAlTAEF84VShU
 y5hWRy/EinCIUtTHa6aSsXptyX/rkWzuwZA/p9dZ/UqabcChUNQ65oFMerwHe4UEN8R0
 FCIqeQjRoyXb9r8pXSpDrCTuUBQ8vbzgFnhKdjEL6CmU2X/4GpNUEK0oUmbvD5fb+ZKZ
 lSvz3hvfX27A2GZi7/OMVzfDrXuvIxcSttE6FfR0OOOfMGrZOVPeJHhYspWUc39tkpyi
 hi1HIhKaagOZufqWB+/LOcsU0EnsaAgl8lFb6XLgqWA7XhrEgc/G6jRD2i7kB+RWBLei
 BpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758798601; x=1759403401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=liny2HRjDhzY3uSkfrMSt+/LAu0SDiqPN9EdKNvcux8=;
 b=Qt/lnno+wJZhf6hOWhvNlXPoxrBhGLFR8JNpN8qys/DYciGBtnyqvBkUOSTQfv/lPM
 a0Cn1385VSvcuTKpTinFAuW/7HbmRbw7Izsrqb2G+IgIm7vFD8RPBtJJNOdo759U0vgp
 kzQ7wVUV4ZBaNRp5Hu0+W0d6CwMizPuwvP/2gAuVQRbgtKxhrkGZT55QVGdw9jGq8fqx
 9LsaGlkCYeGl0zEtnIhf+zyDhAJMDxOZA70houLGsrRwp0wXqpa/s7pOeuKTyDgocDyQ
 ote4mxy3qyRApVxAD79DKcwrw9/wBysqYT2HDpL+CKybwTz3FeN4OjehfjGzFfAKSXeA
 gkIg==
X-Gm-Message-State: AOJu0YxhUoURvJ94n1X1H9eM6LmZgwsOtpY2viXzORkwHFPa76XsE/MM
 FM7NYFDBoHTGUX3G6vHIT0KroUnAgQ6+mXm6hk0h2Log0QovN7q5nXSW87AAExcCHhk=
X-Gm-Gg: ASbGncs3J6ZNwM+inWNpLkBfmcMWnE9o2Jqs0L4pxK4RwUuzG9wogJzcfH5gfb9fAh4
 cUXRuFNV53/y9mvwG0zsmhqmqJtpp6k/QVJlQXOwXMaQCH0zLZwZeBHsZv6SzlsEy2YektdCfs/
 au5hD7CnvdezElMajQn9MS8kZJNa1r6NA3qdo+cGkd7RAtwXwK4JqSL28LWrt8l92Zg4ZPc7Blv
 prH4Svp/tOURthAFAaw3XUjA0r90D0TQZvKdG0kCS3DNU08fPiPciT1HyArKizHPHbIUAXaP8ln
 1Hs9bXG0wDxQlNsCMAg/v9ALGoOAMSrsrgGyUF3oIO6+flQZaJtQAdUJ6CpyVl9UG84EAI/jvvn
 hMIhkHT3Kt7pyXu+8sit5QuT2oPLpX8XT24dZN95DzBjNLL+TSyAsnkFwzvZW25Seyg==
X-Google-Smtp-Source: AGHT+IGZiMO7p8NJ1xjOCpmMO3At0cVi38DKoubhA5df/G0RkgPytlRCwPG5XRrKv6FJZ6q7zC+9sw==
X-Received: by 2002:a05:600c:1394:b0:46e:1f92:49aa with SMTP id
 5b1f17b1804b1-46e329c6355mr30981965e9.15.1758798601079; 
 Thu, 25 Sep 2025 04:10:01 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33be363esm29684185e9.15.2025.09.25.04.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 04:10:00 -0700 (PDT)
Message-ID: <6139d104-5b63-496c-9d6a-0d919737074a@linaro.org>
Date: Thu, 25 Sep 2025 13:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/36] target/arm: Split out alloc_cpreg
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
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

On 16/9/25 16:22, Richard Henderson wrote:
> Include provision for a name suffix.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 29 +++++++++++++++++++++++------
>   1 file changed, 23 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


