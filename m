Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2147725ejc;
        Mon, 9 Jan 2023 02:43:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvj/4OGfEc2/nuh4GOshaaljemBjoXhqU5hX9rpJSTSweVfGOI2l73FbP8mTkteP+IJXZf/
X-Received: by 2002:a05:622a:4c88:b0:3a8:21a5:d93 with SMTP id ez8-20020a05622a4c8800b003a821a50d93mr101827390qtb.39.1673261010257;
        Mon, 09 Jan 2023 02:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673261010; cv=none;
        d=google.com; s=arc-20160816;
        b=BfHY4hHwRhL+PGypRk2hgECnDktivyPC67/lvS9+cJQty9V0aoDwcJf1h4CiPDJYuM
         Wj8iktsUtP8kDORsmQ20scrijbFTIFF00UgdFi/MB4hPYdfaGWO4bjMD58R4VKVf9onB
         bKewcb1D1fT3RiSbNLl72u1xW+o4nxliDw2Pw0G8aVkmxSpc2Z6KkW1YbGPKzxqNe2/U
         0Clqi/HDHJeZcYTiJH6BFlEa2RYI3aD/oq2TWII78//AikAbXwCkK9uC86cE1FG8BwKj
         SgNJyfTdLbNCuAaFoqcdSytqsr7xIpg03hdWxCeKxwOynUZXops3y2Q7PBw0IFkbKcHE
         ZGYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xTy+zRGaEwMAcEbHvrvejMsiUb0iYAe4ynWYjVfKoxI=;
        b=uXziWiq6RIiwqhZ2XgNXxWeetfVB297fi1gq+E61hhmaS+0kvzwaRQWBV8hIXUELyD
         N4R+0k7pyfiPwilsNsnfINCvYEbluAW4B+IseU0NprypMGlZwKf4bDU0mRXNFewx5WOM
         ewg7iSuoqOnHq9tWisoMLWXdxlJ0GcV5x1jFrqGRdeT1EPc2vMw1v9k2WYBRj+QIPu+T
         aJ1hVbVAl39jeP5QVsBCuf6lN8kM93WXwojxj7dP1uyakvGb/p8YaXhk1K1juZhHL67a
         lbLP9L3umTj8hgVC7PMjzxKBnCR6wjC1MSRVGvHahRkVeIMj56gg7k1BXQoNN4ETL7AQ
         1LDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z1268/tM";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a05622a114800b003a80badb52fsi4524458qty.387.2023.01.09.02.43.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 02:43:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z1268/tM";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEpZQ-0000uN-Qr; Mon, 09 Jan 2023 05:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEpZP-0000rW-H6
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:39:59 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEpZM-0006F2-JC
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:39:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso3247097wmb.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 02:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xTy+zRGaEwMAcEbHvrvejMsiUb0iYAe4ynWYjVfKoxI=;
 b=Z1268/tM6Aj/IyFSOml1jlpxYo5Tmm9/LFWbpXJoBCxMsdpuCsa2S+rB60JDUJd8zN
 57RArsniLkLotHCCihCrjErybNDEHwnS/CjbP7xKWI7mj2XO2FWlH2EZiKR2VKfTzO2n
 wQ1w09lNMuwU/wuqr6PHCCdvWaEz+eJKSItvQ0tEYYuHzLZb4DZ77Dphp+DtV4QRM/iE
 2xGDTlcx5+Lno0BMonPSAz0rUC2gAzj3Clyuvf+JKrgDk5di/jX39cFZo6e0kvojbLVx
 JDO07FXFk28qWTeFvO0MC4GfuMuJXAz7JqzALlm7Uom2C9lNEWOAVr/kc5T8WuO9GxpZ
 Gpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xTy+zRGaEwMAcEbHvrvejMsiUb0iYAe4ynWYjVfKoxI=;
 b=brBM3P+KzJX7MYleUzKPvb5f6pnergq3O7KruyXsnNInFKEDZBNLXPcJ28MR+KSfJT
 XfgMBS6Gwdf02XxGrjwOvK2AmG3bItKgkOm6aW4UZRdocNFc+HzKWXAqAc5VnUkOlkCm
 kRc21X3mLCbGb4BaPI02/Ih1PRBEFeXA6BqlHrDZleLomn1VIcukRm2mXR1bP2ZqyF5E
 JKYLyzd7ecOPDkCWNzpe6IESAmEH77+HNGWigyUjP1lyRgpbIP2AFjGbIWE59bTIhUV3
 lv+fB1Zb7DAiwaKGudpYIcOg4tUb4R3TPolu0jHiVCsvT89xQXzBGDFu6bkiLZsIj66u
 kCUw==
X-Gm-Message-State: AFqh2koRwaBqhzDQdMJaMdEDoxlPxHwt+86fL6KWcEwTdf3ODr0c9/dh
 78znCSlchBDS+p97JlRp0iUHApe7wh/vSLTo
X-Received: by 2002:a05:600c:4fce:b0:3d9:ee01:60a4 with SMTP id
 o14-20020a05600c4fce00b003d9ee0160a4mr3050376wmq.1.1673260794779; 
 Mon, 09 Jan 2023 02:39:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003b4ff30e566sm24693383wms.3.2023.01.09.02.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 02:39:54 -0800 (PST)
Message-ID: <9ce88e6c-005a-68a3-0962-361981604536@linaro.org>
Date: Mon, 9 Jan 2023 11:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] hw: Remove implicit sysbus_mmio_map() from pflash
 APIs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
 <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
References: <20230104220449.41337-1-philmd@linaro.org>
 <CAFEAcA_sw=SdiKD4X3E1=AURS40NTv7zeLNfRTTP6zdLnr93rg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_sw=SdiKD4X3E1=AURS40NTv7zeLNfRTTP6zdLnr93rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h5cua57yq/TV

On 6/1/23 18:51, Peter Maydell wrote:
> On Wed, 4 Jan 2023 at 22:04, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Paving the road toward heterogeneous QEMU, the limitations of
>> having a single machine sysbus become more apparent.
>>
>> The sysbus_mmio_map() API forces the caller to map a sysbus
>> device to an address on the system bus (system bus here is
>> the root MemoryRegion returned by get_system_memory() ).
>>
>> This is not practical when each core has its own address
>> space and group of cores have access to a part of the
>> peripherals.
>>
>> Experimenting with the PFLASH devices. Here the fix is
>> quite easy, we split the pflash_cfi_register() -- which
>> does the implicit sysbus mapping -- into an explicit qdev
>> pflash_cfi_create() followed by the sysbus_mmio_map() call.
> 
> pflash_cfi_register() is a legacy convenience function. If
> you don't like the sysbus_mmio_map() it does then you can
> create, configure, realize and map the device directly.
> This is what hw/arm/virt.c does, for instance (it wants to
> map the flash devices into either secure or non secure RAM).

Good point, thanks!
