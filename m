Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B4CD35688
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Jan 2026 08:15:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vl0hR-0001TI-F9; Wed, 28 Jan 2026 03:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vl0hP-0001QZ-Az
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 03:14:51 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vl0hN-0006Cc-SV
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 03:14:51 -0500
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso4992355e9.1
 for <qemu-arm@nongnu.org>; Wed, 28 Jan 2026 00:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769588088; x=1770192888; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GPeUzq/9e2N2phB2nCj6+Wytgc96ta9vm0qLfRmXkOI=;
 b=EO5oev0ClTE6MPoc1TwuAr09rR3pl6fUkN5bW6V7369L5LOyOlPkSmFRKNrPYf5HOf
 q/7U3nte02wPKsqw5cS7yS85DcBq+xsxKSEiJFapiwpghDHd2BLKukIE/x0HzSkcDdwU
 fbs6cRyFojH49H2CsG++25e4waja6r9EsNavf3F1i2anjCGAnmjFOCFFRa7ceoz7Qxv2
 IVDjoXVav1QVvps6v3LJ6jTUy9hIZzX3/EK73vz2wnTXLismZpaB0KIiIkyZTySVxk8K
 Ld1AXSWV9KblAk6rtDSecbp6QCwB8NTE2b3DzMNPIE83/Xx58/mjb9+U38PmW9B7VkJF
 AnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769588088; x=1770192888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GPeUzq/9e2N2phB2nCj6+Wytgc96ta9vm0qLfRmXkOI=;
 b=QgVp3rwzuc/froQOYwxKhkdFZI1vInjhlIR/PRcDUvRr6kbmoR+wW528Y1AB14nxnD
 4grFEwgc8DFDe1DHR//IClz00yixD8KRLcBybFDEaZoL7bgEq8Hc+qenyG+Zju788Z3O
 FGSxkXGER4XlZ0P77tq6PJjYxXUaAOUouXJH6iIpB3HPq3vKF/ANawJ19hI8V6FaBsW6
 hx1D28AY08UXOD98t/dZCWp2eIYuJMqh7fFlb6lXAXVH6Hqx1ovTqm19ICUzShGRGeRr
 zYKoCbZifWB4WSoq1PMUOP8yhvlUbg3nBFhg/F4fktz6dnd+NFtyD7h5I1WLg04JfJS7
 HqjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqltwnunB3BWc3tXNSPMVyyIYiA7ZkRwp39I/HykmV8TC7PSu9Ji/jtzqDAsjQOYQ/YuZj7u/NvA==@nongnu.org
X-Gm-Message-State: AOJu0Yz2wAeDjDg65vbzjjB851uIJ6eDVbr334EtoKEa1GrLpzFL3t3K
 pmmtN/8F7qRYfyLF4AMmjD3AZ3FhSA6ynTvzkxjfOw05BiOu/tkcu/1z1SYRvL4KkY4=
X-Gm-Gg: AZuq6aKEEL2n5I5hLj0YX/dpecrKHSzl8qxE5GEHcXdd7eYCP/XwUNi2iQC8BIdM4CI
 Am6ZtD3L1lHFG1WsJv6qhTwPBgnDpGddrFMBQ+M7+zlRKjK6+X4ReuW04D2SV2rra5OPptr/7QZ
 4GkTIBtPe2pRFnBIlxJ/rZ8jlc9OIomc0ZiiNIS3Nh451rVM76TETldLxhSHGm/vM+6qzU2KyVj
 EwzHARQzYVjU9w68G4vrEwJSuDzJLUZg1ZrqnGMCDS4Y/WDdj6XmXzgP+OIrEfaLJco99xDtANg
 GyuHZYMCGr7NqntvYIOEdf/i1MJJhe3UoBx8fRpOxYwJmCEXq6TFSYIa6sLgE5K5teX2Ny/kZ1C
 oDlnRFQeXGw9RfI1seb9dm8vl5Ks25zkljl/5xq1HAmkyB1Ov/CmdTfBzTlVNnKS2J4MlGDoTn6
 rol+rUgQMLgCEI9KBODS7AsrP6CQ9Ew15GA0nQq0Bv76pOBJ3mOb5d+A==
X-Received: by 2002:a05:600c:4e4f:b0:477:a71c:d200 with SMTP id
 5b1f17b1804b1-48069e70621mr53786185e9.11.1769588088044; 
 Wed, 28 Jan 2026 00:14:48 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cdd78d3sm47747105e9.1.2026.01.28.00.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 00:14:47 -0800 (PST)
Message-ID: <be9c2b82-1196-4e13-a822-5f43288f7cf0@linaro.org>
Date: Wed, 28 Jan 2026 09:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 01/22] target/arm/kvm: add constants for new PSCI
 versions
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov
 <imammedo@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Sebastian Ott <sebott@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260127182805.73212-1-mohamed@unpredictable.fr>
 <20260127182805.73212-2-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260127182805.73212-2-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x343.google.com
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

On 27/1/26 19:27, Mohamed Mediouni wrote:
> From: Sebastian Ott <sebott@redhat.com>
> 
> Add constants for PSCI version 1_2 and 1_3.
> 
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   target/arm/kvm-consts.h | 2 ++
>   1 file changed, 2 insertions(+)

As in v17 
(https://lore.kernel.org/qemu-devel/fe7038e9-5675-43da-b75c-d7c316b14ea7@linaro.org/):

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

