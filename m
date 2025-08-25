Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F57FCA0EFA
	for <qemu-arm@archiver.kernel.org>; Mon, 25 Aug 2025 11:06:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqV20-0004rj-Oz; Mon, 25 Aug 2025 07:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uqV1z-0004rb-Es
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 07:06:31 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uqV1w-0002Fr-RU
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 07:06:31 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3c763484ccdso1046616f8f.0
 for <qemu-arm@nongnu.org>; Mon, 25 Aug 2025 04:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756119984; x=1756724784; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b7B1h6iBFdoyoaJoneA4WRk2fx4IAUGIgXcUS7w01a8=;
 b=HXPa4trq5luvpNj9CeIJqM+SuK0dtb2glJtvjajCLLh77+TF61LE5r8F20j8PGGxFJ
 en5nHjMqAGlHtTVCEk6fRcosoAjEZnHybLfRrjv0buIH6QVdaTf0k9Qku4S2fs79N+Jj
 IY+w7XOZHXZ8xnPSMij5MuxjMaaAq62vCBNEcnUOOaRz0aTLIxgLD/RxsaoahvPPCCZB
 NFLopykuyumCgVqPDiJnwDxVEpcKZdfc+Czkh4VN1F5r4FyChGD2T4vn3YAHFRxbs3o5
 Gk+pFFyofWP/t/7IBF+cb2GmZ6rwNxq2GZf5bvIkZ8JamnbCuAAuGKi2wFUA7po60g2G
 i5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756119984; x=1756724784;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b7B1h6iBFdoyoaJoneA4WRk2fx4IAUGIgXcUS7w01a8=;
 b=CHHb3A/UvS94YPLpXkVo7wQoGkiA3KvPJDEuWHk1kEyXnsvjnSUa38zH5iEpjfJGMq
 dOPD+npgahsGeQcQvLvZwU077Ejkm78Z3T4ENgmmwgoG8An9oCOADyxGkEgNT8t1O1+k
 8KFNnx9apoMeAsBv+yRxq3c4+c5ZEkrS/UaHAkWxlYDcEnSRlg3mQC22nUAKH09OIpuW
 kc4PzDHJUz/imbNgbbk9u5xpz3L8HbzHmrlTMUkvr24Wyrbn5N/mNJLiL5bMABLSnIZY
 SeBuZo+YEQdCQeSSGQPxQZw1Z2/NQSzmtghvwm1CJSt16ypUo2fikbi++Lx2B5euOlx9
 C7Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS5cGNsgTyk+swpGWRZoK+ux+w1sQIIgZcoGJ1WeA2DuoigkMT+SYoS6R0042epg8hIPML5TbTyA==@nongnu.org
X-Gm-Message-State: AOJu0Yy2YFvAGAhF/s1xhypZBM0gkEqopO6dkDXjEG6SkZLNVxG0qKSH
 7cmgrzcXVYRtGCXnbFAixVRq9cfUe92XnNiniHB9hy+8R8uRNxO/RKrjhEG6gCJZqrk=
X-Gm-Gg: ASbGncvWN7NRSfEhXmSAfjb6GsnGJCNAft2F1vAy/yGs2/j5tBgL/wtNnM53vTMF5sO
 NcSaG5nrmyny13I9iBfcUyBACOMPH6LXs5yFe3Q3+hWO2OoGw/H46zTZk/5Nd4unyV4oKkDqde8
 aVOCapU9uPUozh4GLxaBZMuD+JqBn2qdgzT+aVUwPSUOc6fMvVDX3HwmT98Nyl18O6zsXvhtd22
 Li0bWkNlCznHdIi5E3KvjR7RaCyDoVs6kb/X7v0vz2GeaTcx9fV1YwRsVVMLEf3fe+qb0PRgnQl
 azH9hB+9E1j1XhWZkitgv4hLhbydTmEcp3axy4cj2f4VqRS9o1ecsWLHS7RY7qx/fjfBNyuh0eg
 A1EqKXuEVV2czcldBOQUxc14Vo1csffDZpcJNF5tdLxV3GuL82eUWJ8AMo4vZltym3g==
X-Google-Smtp-Source: AGHT+IHVbiY7+DxA209a+SDNjN0O/t9xMOqd06ESsCjGRaKa3e26xGXMmjMrUSmrrcxdVZT5ShtZ5Q==
X-Received: by 2002:a05:6000:230a:b0:3c9:d1b0:809f with SMTP id
 ffacd0b85a97d-3c9d1b08468mr1534329f8f.29.1756119984369; 
 Mon, 25 Aug 2025 04:06:24 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70e4ba390sm11566406f8f.12.2025.08.25.04.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 04:06:23 -0700 (PDT)
Message-ID: <74f86350-a10a-45c0-a3f2-4d582989655b@linaro.org>
Date: Mon, 25 Aug 2025 13:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 7/9] system/memory: assert on invalid unaligned
 combo
To: CJ Chen <cjchen@igel.co.jp>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <20250822092410.25833-8-cjchen@igel.co.jp>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250822092410.25833-8-cjchen@igel.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 22/8/25 11:24, CJ Chen wrote:
> When it comes to this pattern: .valid.unaligned = false and
> impl.unaligned = true, is effectlvely contradictory. The .valid
> structure indicates that unaligned access should be rejected at
> the access validation phase, yet .impl suggests the underlying
> device implementation can handle unaligned operations. As a result,
> the upper-layer code will never even reach the .impl logic, leading
> to confusion.
> 
> Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> Tested-by: CJ Chen <cjchen@igel.co.jp>

It is normal for contributors to test their patches ;)

> Suggested-by: Peter Xu <peterx@redhat.com>
> Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> ---
>   system/memory.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


