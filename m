Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27615FF8864
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 07:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHziP-0002IV-G7; Wed, 29 Apr 2026 03:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHziK-0002HI-92
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 03:52:09 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHziH-0002PO-Ck
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 03:52:08 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4891f625344so5921735e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 00:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777449122; x=1778053922; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7pfTNdgZupOA/raaRL2jlLYSWQUwKZXZl7e3Fr45oAY=;
 b=xyrKaid/HyVEWIeGTTcoCwPs5JbHOggYUR7i5obh+EzwAkpcL7m1CYp43vVBdI9I13
 eBTXS4HL4A9WZncQDJzr8r4YL/oyRcL5Eyd3aw+WdKGlnytFwiyKyToeW5aaP9OAFAR3
 UOknTBZ7LS1yhmXvGfNPHTDSy7S4SXtvmkRB2o/0LwVRNKqvdrAjxBth9+Ogd3lmkY5V
 rTRPbnRSJXxjMDHzKxuys7UnWfrAInQYehbWLpgcBF9ltBKoYln6/T3XIvbThItgQWsw
 9A2RuxdE/ejmczMMlUV1VjU/EdYmooj+3ZlqXjr9TES+NCSyT/ORLrMLK1aOrWME2j6T
 USaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777449122; x=1778053922;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7pfTNdgZupOA/raaRL2jlLYSWQUwKZXZl7e3Fr45oAY=;
 b=gmHgx7RS3Lajgmd4TSUjN51jNZ5FBlrgvRJF+RLapJZWznZmO0p89IPMjsKG1D1aJY
 9SH1Ke2mJlLu/PaCghe4VZ0CBAQJNws1oSDNjEnLq9l0ApJ1d/0+st5JPVO/+maLdRfe
 a5KWvwZ9TV8QNeQnx0Je4to1/i6/mUxdEVJicA0NlastukTpt6Y9eFSnH5uT6qCob85b
 mi+VL+1qi34VGpWhYR0IuB/mrMsU8GcODWg3hVjoUBCWCvzJdUj3pBcain/eg2JlwXZI
 9d8VYvsabm6wRxXVrbQK3FV5Jj9neMjluSOkd18A4Vp495zgxbVbNI8lkBgBP9wX8C3A
 X+gQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/bergu4W4FOZmP7Ll6FF0GXSoCAIxWdv5ROstnlMpVRYHDfVjwJcCHbnpEZmxhtICtTHpslgrnEg==@nongnu.org
X-Gm-Message-State: AOJu0YxPSh1YvA48rlVgN5WrhAM48hcLSbWMfkIL1oKm9n5X6t46CYHp
 7Z8vP/Th3g/OjOefuE6hbTNyvjvdsnPvmzoVSvOrPdXKLKsjNJIzl5LDKvalFKJFc/Q=
X-Gm-Gg: AeBDietcjhX97fuar+qh/1+NIw+acSXXRkS+kxKzcNnFvRG7ONY7Qt7Eqi+Unt5195x
 7t38rpnlsCepsGnFAtM92m3XKl2XwP+opDVsiaTOI6XgBQ+gttwEU5gsqyuNIaRft1iateDfA0U
 Nq7qxNfCdmU5HEfbvwh+gSDJm6v9PF+JFoNlBSG47KvuW5TOvwYRBDss0E7yLfr4j9ttNZo28qg
 odQ4DVDlSZ0y5KhRIAluYSKrE89EXLoBDskuOZlFdOuwziTQMR64Fe6dfFMwvNZz6MUo4wIOsoR
 y89ZIKMpdvqUjBt/wZlU8RFEW24c6TWn3EjeCK7nwM0D/f9BCFYC4gwQCMCoNuxy5mFlSDEJqhG
 SkSSr1q+EDh+LArf9pIAIaMazKMNMRk7nrZogap5SrBVc2OyM5Jg8SzZmYx6eEI1vWv/u90w/8i
 tVdxtlo8rLb76fTIizXpN/Z0RL5tvK+rgR0dhWWRGo6ilIxrW2aezso51xgwzMvl2j0dD0sVO7A
 Wzq
X-Received: by 2002:a05:600c:a404:b0:48a:79d8:a8d6 with SMTP id
 5b1f17b1804b1-48a7bfa1982mr27388655e9.7.1777449122198; 
 Wed, 29 Apr 2026 00:52:02 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a7c57b641sm37952995e9.6.2026.04.29.00.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 00:52:01 -0700 (PDT)
Message-ID: <114b0825-3d98-4b36-ae5d-7ccd41e4ea8e@linaro.org>
Date: Wed, 29 Apr 2026 09:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] system/memory: assert on invalid MemoryRegionOps
 .unaligned combo
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20260428093339.2087081-1-peter.maydell@linaro.org>
 <20260428093339.2087081-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260428093339.2087081-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 28/4/26 11:33, Peter Maydell wrote:
> From: CJ Chen <cjchen@igel.co.jp>
> 
> When it comes to this pattern: .valid.unaligned = false and
> impl.unaligned = true, is effectlvely contradictory. The .valid
> structure indicates that unaligned access should be rejected at
> the access validation phase, yet .impl suggests the underlying
> device implementation can handle unaligned operations. As a result,
> the upper-layer code will never even reach the .impl logic.
> 
> Add an assertion that the MemoryRegionOps doesn't specify
> this invalid combination.
> 
> Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> Tested-by: CJ Chen <cjchen@igel.co.jp>
> Suggested-by: Peter Xu <peterx@redhat.com>
> Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> [PMM: tweaked commit message]
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   system/memory.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

