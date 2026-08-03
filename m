Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7931C55182
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Aug 2026 14:33:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wqtio-0003yN-85; Mon, 03 Aug 2026 10:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wqtiR-0003v5-GU
 for qemu-arm@nongnu.org; Mon, 03 Aug 2026 10:32:34 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wqtiN-0005Y8-MV
 for qemu-arm@nongnu.org; Mon, 03 Aug 2026 10:32:31 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-455ca262ccbso2120346fac.1
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2026 07:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785767544; x=1786372344; darn=nongnu.org;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:content-type:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Wdw0egJj7I8+YCztoAsEwUJowbOM3dsxMPfUTD09360=;
 b=k5nmeI5nYSriXx7SgdLKHJpv5RmDAx6iMz1M7BGU/AATLAPfDunHGxyu4QCqiyt7Cw
 nBta/tARI2MhB2Ary+irskTh2XV63F+gI46OgC0bjP3SNf3gTGqTut6PaCaBt2KyeWHn
 rKG3WjBa2zib37+2e8t5n3bY6uNFoOjZGDtrcLz2sitVBkc3XA7bqQPwQY+3W67Sdk1v
 gOZLwUYkvWnE5YtIR0bcCDOLXlrrs4UZc8xHjXv9OlLx76l2dyN1hJ5fLoqfdYmPjLJm
 z+/60O9CFRgocmZeDsQjrKQGlQGyXBoNeNPpL3Wf4K01EeisnlFHhAmRHCelmlYnx/Fz
 aP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785767544; x=1786372344;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Wdw0egJj7I8+YCztoAsEwUJowbOM3dsxMPfUTD09360=;
 b=DnubOrOnBGnwSsQtMHUZF56XsaRHc0sMn3gkat/EWKXWHLNSP6qTddHQr0+c053yBQ
 XTvxXnhCQ8kRdDrZf4Lul912HcgFluX1wn1UDBZLjFmSa09XS3pq5c0ATPbOyr+wz8wQ
 8LKDv3GsBWTdDf9pHD9fgqrh1nnHdCorcjlStcXAjmQBpmuNYe4DhlB0aojxxMY02yPf
 2pH4na6n3Kx7xCsXTNDmsnEsGnIC11o3XvH8GcCsjv2Mk3LKJ3uxpFNGHpAICl519BQC
 4tt0kM5EwDx8JsPMc04qCLnaLR4PthQPZmAaarCJDysFZHSICZVappUCMPWHIHmOOS+D
 q5Sw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrL3etrG8PYksfkwPKR4n5mT8sah1s+/zuxAe8u3l5ka6UnLFZvBvlOgbnc4tqaSkrdSvidZGs8+Q==@nongnu.org
X-Gm-Message-State: AOJu0YyWULtgh6JIfclg0ZEUtURjqTisCKaro/93FXhQ9NDLtm6H5+nf
 sLWMTbokEggBXY5jZFGui38DsFtkU6ZJyhshx1ovBVH1PqLyx9wcRT9jxjSS7Qkz
X-Gm-Gg: AR+sD12uWQPn3p8Qi1YGPzQsRwEn4wWCH5pThhEt/oRUcEM45rERngRvqTVCpkRuOej
 GoEudezLTtLvjsTFeBlvtvr45pHGI4g9CaOt3w3TpkYEwzJJCx+jBqX4dsXibnKH3FdQYQxJc2A
 P7gx3chZaO493IPaVk8GW4oJtBhy4/o03SF1UIW5QEWPcj8mo4wjuaFDLWgH6+UNTu+ZQ5186QQ
 XrGtvN4Amg9t1wjTAiFJ5VU9qrXyjB/lszn2KLQ/BlQoqwDk5lSTunvIopwnf1frQNyiLXFefu3
 5NcuzPWQ7NE4LSJAiwsemE7UKzOVnBYN+fUsaolhDXJ6/cRV3nichanRW05vQAjyu8iuqlE2D13
 cXPzMhuNkuufNe/F9AZF0xSyuGD/M2fElRIjN2DBe9/kNTKlIzr6SP2yEGP0eCPIC2De+4UNu1T
 +x0hRrFQhT7piVkm8mgLVuFlZmwTNqKVWoPZFHmEtKLWeC65A/hjzb0U4DwGYqpKq22pbHLF/V7
 C9pww==
X-Received: by 2002:a05:6808:190d:b0:495:d7ec:b6be with SMTP id
 5614622812f47-4af5e3870f1mr16347885b6e.18.1785767543747; 
 Mon, 03 Aug 2026 07:32:23 -0700 (PDT)
Received: from smtpclient.apple ([16.9.2.1]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4af58f7238bsm6350835b6e.18.2026.08.03.07.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 07:32:23 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Simon Xu <simonxhy0404@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 4/4] hw/arm/mps2-tz.c: add new mps3-an555 board
Date: Mon, 3 Aug 2026 09:32:06 -0500
Message-Id: <11D7F3C6-3898-444D-BC3C-476C6F6A9ECD@gmail.com>
References: <CAFEAcA8_VTfU-7xvR=Nii8nC_SEPvv0VtZEVQD6zdg=bJFnHTA@mail.gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Robert Elliott <elliott@hpe.com>
In-Reply-To: <CAFEAcA8_VTfU-7xvR=Nii8nC_SEPvv0VtZEVQD6zdg=bJFnHTA@mail.gmail.com>
To: Maydell Peter <peter.maydell@linaro.org>
X-Mailer: iPhone Mail (23F84)
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

> Why did you need to update this? The AN555 appnote documents that
> interrupts go from 0 to 127; 0..31 are the ones in the SSE, and 32..127
> are the "external" ones. NUMIRQ for this code is the number of external
> interrupts, so 127 - 31 == 96. Like the AN547, the highest interrupt
> is 127, from UART5. So I think that 96 should be the right value for
> AN555 also.

I got the number 100 from the an555 TRM, page 17:
https://support.arm.com/documentation/107642/latest
The last configuration "CPU0EXPNUMIRQ" specified 100 so I thought
was what "MPS2TZ_NUMIRQ_MAX" referred to. But I do see in table 7-2
that the IRQs stop at 127 like you mentioned. I'll revert it back to 96.

Best regards,
Simon Xu

