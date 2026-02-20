Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB050C5518F
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Feb 2026 10:56:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vtOBN-0007dS-E5; Fri, 20 Feb 2026 05:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vtOBI-0007d3-4q
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 05:56:21 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vtOBD-0007UH-Vf
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 05:56:19 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso14519675e9.1
 for <qemu-arm@nongnu.org>; Fri, 20 Feb 2026 02:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771584973; x=1772189773; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8kThNdZkCmV84JKIt4VRgEncrMIGiUg7afUe0GHnYzs=;
 b=D8HBtIe5efuDypAfcHlyEDoWMZEBU+uU1d2p1tCKg8DbtP5qA3u5P+/9qbiWno4WeP
 UGAOk5yihZHF0l9k1cmY4WrqpZX2+JoI9WjTVYlHBmQdqP78ibEHM1x+hurJ6MIKyWHb
 uQ3Oo+Ax5SJIJQa1aStjk8l11eHi9IYXpgSuc6CVY+rdSKYGOMN7JSSvgB+MPAdH2UQo
 bO795xiShOSyjg5OSstwVW0tMYhhdiD2XUtlLAtiC8NKpKtEuOY/BU+bXyNNHZtoPBin
 9+V/8AxnUkU4X164Q5mURrPZ3bVNA1bP9FRqIKGdyTXY9IiLQFnEn1R8aKjK10cYdtdF
 Ietw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771584973; x=1772189773;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8kThNdZkCmV84JKIt4VRgEncrMIGiUg7afUe0GHnYzs=;
 b=NIgWr18b9Tzq+N+Offr36mgb74geQB3uAGLvYi+rs/+jZhsUTufmtDzfLB0HwwAGsn
 E0lJxGxSzfdY7Lsejiz2/39fNxQN58TYMeJsc0OeXz3b9hLjsFClVEAq1NDEyogOj9wf
 znkrGKJXY5HUdaIq+hfp3XAIYtQaGPWJev+nLL84J9+/W2F3ODsjW/Fmf4eR1WMqaVRq
 f8yRb7JUVAfkrblUaIBNfelu3cq1o729RLOkp+iRHQtoSXGKobUXbQdmN/Z8Dtcpy8a1
 w8BQcjR+Afjb/7GAocyxVMEUAZzRtke5Y2oKjKPr0E314vU/tjtJ6OP4BGXpco6lAatD
 +eOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU06Uj5fbYQzsIGStUh68F7j0KxflhqtenkUiH0TEftTFBvvPFYsFAApNThNkhMORDI6sF9BREVlA==@nongnu.org
X-Gm-Message-State: AOJu0YxA0adXGxRpgPbGd7UEEkl2YCkFC4xiV++dUnYWYMohxFoEZHBX
 vHilJcWrblOip93dJiuzl1VHWLOhE6Ly+p+H85no5x02q/jQmnMjas1ePlarmkL4vWg=
X-Gm-Gg: AZuq6aIK9XvcOvmoztYd8nt01hefUzOxJ4F5Biu9khORQHKibc639zXsdGHyv5GV4wz
 pb4il0UJSXPfRRZZU5aLhx8lyOVj9AV/CFvzoRBLZTA6av55wluOwkVatrwswkYHGcqgjfsGbZE
 Hy8RyidpnZw9H0LqglKx5g9SrqRc13cnk1mmFZQJb2yxGsRlUph3hMTotNPWZQ0LhOLByaY2yDo
 AZGvvinpodTbE5LRJ4tifH9/Roc0mAXWp2oNOoKuivJiBu8R+Ujhw0e7x4IxKXglLARJs4zA/Qx
 yI0YOAJYnReTZBZh1rUMFkXMCmEPuEBb5Q36tT5oLv2TShhTBqvCB6eWtd8FfGIWQq7bMIGez2U
 DJDae8jg2AAVoyz3TLZI9KTLGdHn9rmR7PGsD6z08feNbCmeOY859GYfn+Yp0i3pzJCq+D+97Ey
 nid7MwNWpU9Y9oeLQX1aiy4RtCsra//XgrzKTxb0VXCQi4A4PsTwsSQlFuLl7CCQY2Xw==
X-Received: by 2002:a05:600c:6215:b0:483:64b4:79da with SMTP id
 5b1f17b1804b1-48398ae4e47mr140993225e9.26.1771584973127; 
 Fri, 20 Feb 2026 02:56:13 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31ff4d7sm66446445e9.15.2026.02.20.02.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Feb 2026 02:56:12 -0800 (PST)
Message-ID: <6e90ab90-f726-4fe3-83ba-cf3aa799062c@linaro.org>
Date: Fri, 20 Feb 2026 11:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 09/14] target/tricore: move cpu_reset from
 tricore_cpu_realizefn
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20260219171810.602667-1-alex.bennee@linaro.org>
 <20260219171810.602667-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260219171810.602667-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 19/2/26 18:18, Alex Bennée wrote:
> Implement a proper cpu reset handler for tricore cpus.
> 
> Message-ID: <20260108143423.1378674-11-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/tricore/cpu.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)


>   static bool tricore_cpu_has_work(CPUState *cs)
>   {
>       return true;
> @@ -120,8 +127,8 @@ static void tricore_cpu_realizefn(DeviceState *dev, Error **errp)
>       if (tricore_has_feature(env, TRICORE_FEATURE_131)) {
>           set_feature(env, TRICORE_FEATURE_13);
>       }
> -    cpu_reset(cs);
>       qemu_init_vcpu(cs);
> +    qemu_register_reset(tricore_cpu_reset, cs);

Per commit 9f1c70a2543 ("hw/core: Add documentation and license comments
to reset.h"):

"In general this function should not be used in new code where possible"

Shouldn't we use qemu_register_resettable()?

