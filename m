Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1213CAC5B8
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 07:31:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3UoV-0002qN-Fg; Tue, 30 Sep 2025 03:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3UoT-0002pq-5j
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 03:30:17 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3UoP-0000Qa-I2
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 03:30:16 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso35391535e9.2
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 00:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759217402; x=1759822202; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Liroi9WcUhGYQAmYmNDdi1IoVOl5PKEVAA6F6iTtODM=;
 b=y5S2n7Krjrc0A9XLbbNiQMG2dTHbTd/2DrOJkYtJhQnVNSVkiRSnSvBr85J04yl2Jw
 oUI130bdc6B3E4niBc9YqtIqe9E2Ebzcz0yfIzbVd+qUWyg5UhCzMJy/yxYgnftuVV/E
 FSzPpPrtf1xeDON05zZVYAvOP5j0814HrnNXRv1pWQh/L9jE4TlxpCM6S8OC7z8xbuOt
 JZmDhhD7galFmj7XcqXObwJXOfHFr3w43vwvzdP3u+iVrJa3aEqm72/478yCI3JbEpwM
 vHGRWaAvYDn0eavNsbiEVk7Rl5mWzPBseTE8YzYP1ofr7+xhO+Pn67UNJ2exp0Nkqd6n
 mr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759217402; x=1759822202;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Liroi9WcUhGYQAmYmNDdi1IoVOl5PKEVAA6F6iTtODM=;
 b=mI4MH7DoM9r7/g9utfIpSyG5VmL/Ntc8iJ+Qzq9mjoAxBVd1ie+BhNKHrMAYo1cDVo
 r07sFda2MOMOOk0XbvatCEr91I2ZyRSAoZleVDuv3ouPrh31TerEwq20+IRMLOxHPS98
 mtlX5WnKEM0UEKQ5YLKxb27KVmAGN0WVmFyehhVC6SoKdFD24vbtFnRsODViQBImyQmr
 1O1vTYDC1QGc9yhqpNd1xcYJoYICYyaGLlSv41WwIJ33cMNEOTltKYViQE6vD1+Kjz8s
 dj2R/3U6bvvSlN7MZKs05/nShrcx0a9rd2zBtEhOBLizUBj+x+lBFyo0BxQ6aOhxnSVl
 4Ahg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB8zrwUiWD7B9immNHnkTXMNKJsjQVU+UMf9s4VmiWpBrgFQc/WHD9KxX9YMJaT4LbD0gX4fg1+g==@nongnu.org
X-Gm-Message-State: AOJu0YybkIceXYbXLTXayIbKg6CpL/lRCROKN4/WUbe6rmqHQN48S/vU
 IZ+ErRKDiVzTFNA3KitAPdfePoSLU7zUtpLpL1yQqwDfIxYER4niiX8pBSHW4sN2gkk=
X-Gm-Gg: ASbGncu/+G2YTvayo1ttm5M4uNb1f8smD2NY/qgj8b61Tt2i+57v1AicJ5NS/62e/m+
 /4Es75AH/1mzK2n6EgqFxdhmG9IIOvlyWy/UVAsAluztMO8LLy10hMR2WXvPCVNb+FDGufqJHiX
 rNxAWSHanGkeGLh7xVYWCyZkeOgbN02wnAWh1MJ6wIf1aSc+faI1FRpcIhipGuXfbXutz2RpdAJ
 zbXkwGUWAwDAqulShwQf69tyVSBa0zlRzFOTDwpbWiqNJe0nnSnL0lHhtt0193LjNTCxQcwydym
 vV2BZ06yjrUNxGD3d2nVUHQFP7SiJmZ1iY+C2CPkHiSFaPbwj1wp+G0m5LbOO9mIu2Vxsv9Yokj
 s92JhZaA4hrXk/vF2pnRBxLmMmyFc5FFpxgluRbmeIk//fgsorWWshc8fDdxmhVBgGblPJkx0rD
 C/ULwAv8D1DMIFF6qArILZSfzG
X-Google-Smtp-Source: AGHT+IGtXfL0Jmx58YY2GQD+3/N7UII2j2tkr2qjbfMg8pgv1A6WoRS0WqglI5zD67fQhazgeaOExQ==
X-Received: by 2002:a5d:5d07:0:b0:3e5:190b:b04e with SMTP id
 ffacd0b85a97d-40e4ece6421mr14598458f8f.37.1759217401589; 
 Tue, 30 Sep 2025 00:30:01 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc82f2ff6sm21331401f8f.56.2025.09.30.00.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 00:30:01 -0700 (PDT)
Message-ID: <0f3b1559-1ce2-4201-bd29-3ac131f557cc@linaro.org>
Date: Tue, 30 Sep 2025 09:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 38/47] hw/arm/xlnx-versal: add the target field in IRQ
 descriptor
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250926070806.292065-1-luc.michel@amd.com>
 <20250926070806.292065-39-luc.michel@amd.com>
 <70156c9c-5559-496d-8753-99f1ba5f68d1@linaro.org>
 <aNt6vez--_Len36t@XFR-LUMICHEL-L2.amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <aNt6vez--_Len36t@XFR-LUMICHEL-L2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 30/9/25 08:37, Luc Michel wrote:
> Hi Phil,
> 
> On 12:34 Mon 29 Sep     , Philippe Mathieu-Daudé wrote:
>> On 26/9/25 09:07, Luc Michel wrote:
>>> Add the target field in the IRQ descriptor. This allows to target an IRQ
>>> to another IRQ controller than the GIC(s). Other supported targets are
>>> the PMC PPU1 CPU interrupt controller and the EAM (Error management)
>>> device. Those two devices are currently not implemented so IRQs
>>> targeting those will be left unconnected. This is in preparation for
>>> versal2.
>>>
>>> Signed-off-by: Luc Michel <luc.michel@amd.com>
>>> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
>>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>>> ---
>>>    hw/arm/xlnx-versal.c | 41 +++++++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 39 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
>>> index 3d960ed2636..64744401182 100644
>>> --- a/hw/arm/xlnx-versal.c
>>> +++ b/hw/arm/xlnx-versal.c
>>> @@ -50,18 +50,30 @@
>>>    #include "hw/cpu/cluster.h"
>>>    #include "hw/arm/bsa.h"
>>>
>>>    /*
>>>     * IRQ descriptor to catch the following cases:
>>> + *   - An IRQ can either connect to the GICs, to the PPU1 intc, or the the EAM
>>>     *   - Multiple devices can connect to the same IRQ. They are OR'ed together.
>>>     */
>>>    FIELD(VERSAL_IRQ, IRQ, 0, 16)
>>> +FIELD(VERSAL_IRQ, TARGET, 16, 2)
>>>    FIELD(VERSAL_IRQ, ORED, 18, 1)
>>>    FIELD(VERSAL_IRQ, OR_IDX, 19, 4) /* input index on the IRQ OR gate */
>>>
>>> +typedef enum VersalIrqTarget {
>>> +    IRQ_TARGET_GIC,
>>> +    IRQ_TARGET_PPU1,
>>> +    IRQ_TARGET_EAM,
>>
>> Maybe declare IRQ_TARGET_RSVD here,
> 
> I'm not convinced. In the future we may need more targets, even more
> than 4. In this case we will increase the TARGET field size, probably we
> will then have even more reserved fields. I feel the way it's done here
> is simple enough to catch all the buggy cases thanks to the default case
> in the switch below.

Fine then!


