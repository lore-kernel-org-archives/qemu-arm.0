Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAF9E9A052
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 17:30:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt7qo-0006Ad-E4; Thu, 19 Feb 2026 12:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vt7qn-000695-1c
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:30:05 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vt7ql-0003Ga-Ez
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:30:04 -0500
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c6e72d7a4d7so760953a12.0
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 09:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771522201; x=1772127001; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xLxTI25giVz2XoNqRgxJdcifwwJA6d1sfCS0euMgWok=;
 b=mbFbk6uWEhGrLBBGLR8HFNFTnA5KV9WTt3ZoMpKllim/3xW2gW6t0AY7ULjD8/pAtm
 e0L4PNInbxpXWuX66bEXj6VEuau9IKP1Q5gHsM9RaRLehy4u6yS2xBlUB1BydEa93HM2
 V7/iI7z940LeUQErudBL2ej9l8Or5F+n1JkV7eAflJjAvCCgxHXnHcdIp/yISAjyVO0v
 53M4QTH9OrZtzTOnC69I5cgz3+5A0UScRK+AVr1yIzRhqe4vJnU+H/R3mBpHjLvNlSg9
 0mReoq5TKYdh3FuaEry9Yj0EGpST8+7KJoPpBxnz9A7z1jbs4XpO7KoSGbQkYQW6XFRS
 nESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771522201; x=1772127001;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xLxTI25giVz2XoNqRgxJdcifwwJA6d1sfCS0euMgWok=;
 b=AjPnblzbN5C8BQY0RI5SfHVS9Hvw6c8Qa0mbrmBiDPdcazSEENj0EWNhFjteaa4t0R
 zo66p1D/pUzuJC4su7uV+aGkCmVRbcT5tFeau5eYEuCxbfBzBS5V5dItP1FlDsnzfm75
 csvzCsFycTDiJAjrQ+Y2MIsNJ+D2vpO+jT/z+BWwrJ387jbmvwbLD5prD5WOeIvOzHUF
 zwGRZfQnjiV8j23EJGgj2pZl3FblkshHsHfU79kIpdvhGFEYlSiSdEogcQPjSS+l0zZx
 lgmaf/6JsZqp/M7FFiqzqnORaJ6XFcAmfD+zST2pSRahoITAIXA01NqzFDHtu/CIMJ0y
 O8ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYdA63/IuPcpvq3845v+L1J9N0xwXGbSGkW2oUcn4jts6tLh2rmt175xhLJ51TTmkoAlbcnju9PQ==@nongnu.org
X-Gm-Message-State: AOJu0YwVuXLdXLNl7t+9k2t90+6AYsj2XV7BkSwrGR25RCQODx8RuFJ3
 D9f3lrT16CYBP0sQHQfj6vSnOQGiqVBOuBDshJO6RhroCeha8PELxtyr1scchCJnhg4=
X-Gm-Gg: AZuq6aJwm15bXgI5Os7T9QvGHF+GEW88+nh6vY3+Nt+E0PbriW2GAxjE0+H8h4VnO/C
 DPxj8rF6GgpYhjxb4bGvzqssXFkZdw+8RBnhV5UMYg1T0YEc1IjmJEgE89h+oT87ktA0B2CMNuP
 BxkXGQ03wYJoan852pwViSYuxMsW2bG1/pyQHi49S5hU8PUvI8PxSYtqlO+TXyweDTopEyrWgHh
 lkLiovDejnHF8j5qbnXJnzu1skrGerarAqnVd+CLRlFrB8fQhve7h5jX/LoVEeF4DggxvrVAFbw
 52LZLeEY9w+eh++zSW3RXAv09a+m2b2hA9BYY0KL2V8Z+/WaS7lUW9ZaaBEBt1mAqdPaMr12dvv
 lBgpuWq976NEWUoavsaqhuxFsJzAd1auGFeb24seOtwrJi74jH6uvCUNeSSc4WjP0Wbn8F26JJG
 zLmAmTJMTvXOgw/Z62KalH3o9ZQLEWVvomQAN5ygavWXSb242/1U7jq7S0VPD3uW6Td/XF
X-Received: by 2002:a17:903:2441:b0:2aa:e817:1bcf with SMTP id
 d9443c01a7336-2ab4d087a8dmr176636095ad.51.1771522201286; 
 Thu, 19 Feb 2026 09:30:01 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a9d5c3esm182133085ad.47.2026.02.19.09.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 09:30:00 -0800 (PST)
Message-ID: <262ffc90-7934-43a8-8398-34160d7adbd9@linaro.org>
Date: Thu, 19 Feb 2026 09:29:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/14] hw/m68k: update nextcube to 3-phase reset
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20260219171810.602667-1-alex.bennee@linaro.org>
 <20260219171810.602667-5-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260219171810.602667-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52f.google.com
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

On 2/19/26 9:18 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - re-written, tags dropped.
>    - favour cpu_reset over resettable_reset(cs)
> ---
>   hw/m68k/next-cube.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

