Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31640FF8873
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 14:38:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wISWS-0001ap-Af; Thu, 30 Apr 2026 10:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wISWQ-0001Ze-Sm
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 10:37:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wISWO-0002YH-9J
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 10:37:46 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so16905325e9.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 07:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777559862; x=1778164662; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MOeDdGzdQ1cisrSy20jBobJ9B/xbezK1MoABAAF+F1c=;
 b=VdGlmYLHZP1rrhPTK8Iug3uyKi1Kjb/OhAlq+3r1Kp4M5MVFGcH9uj9ywP8Qm8mRv5
 NxEuth/i3jivvU1s1RZcDbcLxw8VUVIt0lsCTxidOdimQdIg3mtR8PIkdGryuyCPL9Wu
 zrESNX8QLJg4NpTL67Ya4o8fVXmm0PbsAioFCujxDKCT8aq4pgWjocSKPFHMD/8CdsF2
 1MmL4jmBNdVCYFlNnjkTpzpihRskI/1m2nyYY/WuuxxMkRaBdWVQ5zPoFgHv4Hmuahne
 bQkPX+5gQpio8d+4r1k9S16Ns0DvWUXCJte52J+1EEALintBpF/Ed6CyQrNRTdfq466V
 aVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777559862; x=1778164662;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MOeDdGzdQ1cisrSy20jBobJ9B/xbezK1MoABAAF+F1c=;
 b=ABnwaPOspDfTrU4XZDVO7i/stsiJXCb9egBgDE0Ru/DyLKW4DumZ+3qeWPryrM0yFv
 36NseO9BQQVkI3arNfLHyOmmfrVpOkqXbDsTT3uKxLaxSw9P6b27/Pd6GFCRxbfHpcjY
 6lTF6u9/Gl/jcuGkdD7boKNtsz2fKdzmxVSoT2LZOmtESSyKKpzS6k9Rbg7LiDUjYXba
 pGX2HHR0YkyTcZTSwaK1pYViHaI+iOryyq4mmHOhtvTDK01divPY8u4pK6IL1UY2dCGl
 wFa9yb8XqoKx1fuELV0qDRYezitae5U4a+reVqrtLCbJaRcu4DEblruv5Ei0NUQo5/D8
 q00w==
X-Gm-Message-State: AOJu0YwvZ5A9GPud2CIWzBvLs1n8HLJGvv2f+PdTplBVA2pCy4iTiUsY
 pziajiK+R/4XpzJNZ4WK9SDWh2mq007BZY/urcVihi5/EJWXW/28NqPnwFXnWbnunL4=
X-Gm-Gg: AeBDievtwQwADK4D7+eR4V560LYaUJaHMAIchAaMBHqkFJW/tXlXvsGLRIMEm7/Iz6F
 /rjO3x1NNwJeK27og0AU4a8oQGtRuePT/IrqCBTPy3p9NSepJ/oaoadoB6XdPe8BhNl24fNcLSC
 TZQq2QXFB02F7su/beJuUb4qvcIbramf+TqNFJBfG9FcKPUfJtZJRzN1nyuSfnE6NgVlhGjjSHu
 4wIHKewStzDIqI7ylGYZNcrsc35s49w+b02f46ihkntdz245jv7GNhDCoaCvV4UIYip8QinBUaQ
 WxA/Se/SPJyt3WRBMGhrvyU/8rL0x3bD0jDPAFRkhK2xvSlKsDhUw96RnA68JBYn/1Rw/WB5NG6
 g6rSgHooHUe4BD8v3fwk3+1X66noRbBOkC5XZrmVdDab8bLD6soFKfYha4aIi12MauV+d86PQ6a
 G2G+ZOXa30FovYvKXLhlVaC6FSR9YLVqqHyI7OONsn447k7SMXm4/YoUfpzdNvI7PeYwYS6lzpC
 6oAv/vMxKum7/4=
X-Received: by 2002:a05:6000:1acf:b0:441:36b7:725e with SMTP id
 ffacd0b85a97d-4493cb42c9amr5733714f8f.7.1777559862038; 
 Thu, 30 Apr 2026 07:37:42 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b7ca5fe6sm13847340f8f.32.2026.04.30.07.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2026 07:37:41 -0700 (PDT)
Message-ID: <2c6ddc89-9352-41cb-adfb-8c523765420c@linaro.org>
Date: Thu, 30 Apr 2026 16:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/25] hw/xtensa: Use cpu_translate_for_debug()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
 <20260430093810.2762539-22-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260430093810.2762539-22-peter.maydell@linaro.org>
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

On 30/4/26 11:38, Peter Maydell wrote:
> We want to remove the cpu_get_phys_addr_debug() function; update the
> xtensa boards to use cpu_translate_for_debug() instead.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/xtensa/sim.c    | 6 +++++-
>   hw/xtensa/xtfpga.c | 6 +++++-
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
> index 32eb16442f..835cd04fe0 100644
> --- a/hw/xtensa/sim.c
> +++ b/hw/xtensa/sim.c
> @@ -40,8 +40,12 @@
>   static uint64_t translate_phys_addr(void *opaque, uint64_t addr)
>   {


> diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
> index 256497e162..33a2d9485c 100644
> --- a/hw/xtensa/xtfpga.c
> +++ b/hw/xtensa/xtfpga.c

>   static uint64_t translate_phys_addr(void *opaque, uint64_t addr)
>   {

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

As a future cleanup we could rename these 2 methods:
hwaddr loader_translate(void *opaque, vaddr addr);

(or unify as a single exported one).

