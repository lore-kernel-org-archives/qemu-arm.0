Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp120325ejb;
        Mon, 17 Jun 2024 02:36:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHDkehmYve+oTV9PavWOjR97dFszD1HsYXwo++J32kLGwcoOk1l9ZLIS2IeKt1HYrDgVUOfEr/+rs/M3bh3y+q2ir6nR7o
X-Google-Smtp-Source: AGHT+IGGcsDLuXhwyzZ1oBV9xKDo/RyCJ5Lqsk0nQNPK9egZn3TPueV3R23qyjiFIe2sH/XRA5Sc
X-Received: by 2002:a05:620a:4594:b0:795:571a:5bf1 with SMTP id af79cd13be357-798d26a2795mr1029391085a.63.1718617000742;
        Mon, 17 Jun 2024 02:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718617000; cv=none;
        d=google.com; s=arc-20160816;
        b=JAok2YQCe6sgixaW8/yi0OxQiUPqyOE6ie03EbzRc0Wy62yGHAlbVmjlKPTEA7hYwO
         TWFmIxI3OA4H2MPn6jQ279wr8mBQ7SQyC0OWvsFCBJy0sDkciMGzOvtlflCo2pjlgX/y
         I29KU4vOgLYrbK5VGrmCV7t965OaEPNCooXHpSaz+93YN/XibYGEn/u+VqQQe2TjOP57
         aYSm2V7QP9rm/Sg2WkFYxL1E8yvqia28HNTW4yvNTGcIyfi/v+3LrW+oyjRyCy6ctJr+
         9gp1rAciGAB80ZH5mfas2h/vONNsq0gYIFKOQ7COdiLtrwoBQKgZvos62HeBM1f7aFlj
         d+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Z/avWU+IzGZgbM/rGmF1u0JeDoOVOXAVch7IyWFSeyU=;
        fh=SMFAyl63CtL1iA29Rj//KCAXqq3ZvXpYMhhDUnUf4NE=;
        b=L2J+pKASnwCurCgrsYWkRQSD0Yc8/jfNfdAtshAZqYZDnGPaH+/vPTdytBN1mPF0Bp
         GXz1qkQmiErVFt/Lm3+KYPI9WWCzSys8qTseJ9yyTMzLhs/a+JwXrzcQ6TAgOP+oeFXu
         XW45HYGjRkCxHD+77zo+ONDiHkOBLJ1A8d1/s59rppJKAIZzVXmHPYvxMUcxZMyuYhn8
         V1qAf/wD4eyuuAmXJYlgpemdDP7d3YyN28Xf+fqj+IeTLTh7A+ADdGJJTSHP0B6y3q+U
         MpzOWpLBW/Bxo9JxNbdv3Omj+lzBr4JmTg+sakaK128bRLXQ42TptRIORm86maygs5HB
         MqcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWS8zvyy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798d8843c8csi780002185a.39.2024.06.17.02.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2024 02:36:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWS8zvyy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJ8mp-00055L-Jy; Mon, 17 Jun 2024 05:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJ8mk-00054E-AX
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 05:36:24 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJ8mh-0000nu-HS
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 05:36:22 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35f188e09a8so3257453f8f.2
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2024 02:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718616977; x=1719221777; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z/avWU+IzGZgbM/rGmF1u0JeDoOVOXAVch7IyWFSeyU=;
 b=gWS8zvyy9HCfsaKPXlAf9yNQ7dPslj9gwvO4omQ8KTAVDHS085JwgbjYJicvxMkz6l
 gDJoVf/6ls5jKXiLu29EEsfKYHE6I9vIEUXX8LNhF2r6K2/sS6EhrRXcLXXnhH02TQLX
 w8se9hxUX8Lt4SdwR1VVhqYGNT/3j6yu2F7ufgOc45umhGTQjF/dwXtXOd8VU9yEkemA
 EXr9NR6ivN38pc1LfNZENo6jgqlfnUE5sJgveL116brAPRelh+lCUmpLWXz3ykSxkTy2
 ABdW9aeHcwbdmyNtvRAx8UPTTC+NRlBaP+MwEd/Ehv53lpIhcVcQ2ZAIFU0RWhe6CvKQ
 mxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718616977; x=1719221777;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z/avWU+IzGZgbM/rGmF1u0JeDoOVOXAVch7IyWFSeyU=;
 b=YEXnLJw7kj+w54saXh23yUSYngIJPxuo3fa5blt/M9DtvRnxhMwC0VxTQcoJwZ3MOr
 SnZSrDLcvxOPY/0yggYGudOQiZNhLT4zk/aEMFdXfGQKc86uTz+AjKyuOu8lITpsoz+U
 Ld/RSIEfHZi+WuMGdmgL5nWRfx726Oe9vypGIMricf4dskRtkKABQ9C7Fn4gLZyXHuJT
 te6JSwz7OWtZm7SwZgB1D1apo1QmpZuv/8Ira+kP3kzMyunq0T8V6BP9lugdKQqxNO3r
 NGeDXozMVTVh+hRCHgfZQ8ftZBTZNeC7qUtSTJhssrqKMYVqdf1BcgWIU9/5Pv3mq3Sx
 221g==
X-Gm-Message-State: AOJu0YzsI/5XGJBPwoeo9c9Fb6Gn0y5bkUqh/3ArWxRX23nkxEoo9DFu
 S7QJcebnsCmVeKKp7D4B+0KUE7A2cXOmt3a5n1iRMueQk8t0a6Fk+YJpLvNXat8=
X-Received: by 2002:a5d:4a4c:0:b0:35f:1d29:db8d with SMTP id
 ffacd0b85a97d-3607a76374dmr5324132f8f.25.1718616977087; 
 Mon, 17 Jun 2024 02:36:17 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.169.90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3609d95bc02sm32232f8f.18.2024.06.17.02.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 02:36:16 -0700 (PDT)
Message-ID: <c77dc7ce-a205-4dcb-a63b-451cac00de5d@linaro.org>
Date: Mon, 17 Jun 2024 11:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/arm/virt: Avoid unexpected warning from Linux guest
 on host with Fujitsu CPUs
To: Zhenyu Zhang <zhenyzha@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Jonathan.Cameron@huawei.com,
 gshan@redhat.com, eauger@redhat.com, sebott@redhat.com, cohuck@redhat.com,
 ddutile@redhat.com, shahuang@redhat.com, qemu-riscv <qemu-riscv@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Song Gao <gaosong@loongson.cn>
References: <20240612020506.307793-1-zhenyzha@redhat.com>
 <69649622-e52c-4d24-809b-3d8a97786a69@linaro.org>
 <CAFEAcA9wEjONgLfTObNYwJbwn5Gs1BDJiDivc9PEwmfOeZW6ww@mail.gmail.com>
 <8d7e111b-4f74-4a67-b01b-2af5ce009a06@linaro.org>
 <ed3df37e-fddd-465c-8ae9-1c5791966995@arm.com>
 <CAJFLiBLt4ig0XpDScq0M1EAPo1PEvZNiumf9kKMOErSE_OJ_cQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJFLiBLt4ig0XpDScq0M1EAPo1PEvZNiumf9kKMOErSE_OJ_cQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h/prfgQI2BHg

On 17/6/24 07:26, Zhenyu Zhang wrote:
> On Thu, Jun 13, 2024 at 1:48 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2024-06-12 1:50 pm, Philippe Mathieu-Daudé wrote:
>>> On 12/6/24 14:48, Peter Maydell wrote:
>>>> On Wed, 12 Jun 2024 at 13:33, Philippe Mathieu-Daudé
>>>> <philmd@linaro.org> wrote:
>>>>>
>>>>> Hi Zhenyu,
>>>>>
> Hello Philippe,
> 
>>>>> On 12/6/24 04:05, Zhenyu Zhang wrote:
>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>> index 3c93c0c0a6..3cefac6d43 100644
>>>>>> --- a/hw/arm/virt.c
>>>>>> +++ b/hw/arm/virt.c
>>>>>> @@ -271,6 +271,17 @@ static void create_fdt(VirtMachineState *vms)
>>>>>>         qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>>>>>>         qemu_fdt_setprop_string(fdt, "/", "model", "linux,dummy-virt");
>>>>>>
>>>>>> +    /*
>>>>>> +     * For QEMU, all DMA is coherent. Advertising this in the root
>>>>>> node
>>>>>> +     * has two benefits:
>>>>>> +     *
>>>>>> +     * - It avoids potential bugs where we forget to mark a DMA
>>>>>> +     *   capable device as being dma-coherent
>>>>>> +     * - It avoids spurious warnings from the Linux kernel about
>>>>>> +     *   devices which can't do DMA at all
>>>>>> +     */
>>>>>> +    qemu_fdt_setprop(fdt, "/", "dma-coherent", NULL, 0);
>>>>>
>>>>> OK, but why restrict that to the Aarch64 virt machine?
>>>>> Shouldn't advertise this generically in create_device_tree()?
>>>>> Or otherwise at least in the other virt machines?
>>>>
>>>> create_device_tree() creates an empty device tree, not one
>>>> with stuff in it. It seems reasonable to me for this property
>>>> on the root to be set in the same place we set other properties
>>>> of the root node.
>>>
>>> OK. Still the question about other virt machines remains
>>> unanswered :)
>>
>>   From the DT consumer point of view, the interpretation and assumptions
>> around coherency *are* generally architecture- or platform-specific. For
>> instance on RISC-V, many platforms want to assume coherency by default
>> (and potentially use "dma-noncoherent" to mark individual devices that
>> aren't), while others may still want to do the opposite and use
>> "dma-coherent" in the same manner as Arm and AArch64. Neither property
>> existed back in ePAPR, so typical PowerPC systems wouldn't even be
>> looking and will just make their own assumptions by other means.

TIL :)

> As Robin's comment says, each platform wants to assume coherency
> by default may be different. Adding it to all virt machines may
> introduce new risks. Currently, the issue is only valid on Fujitsu CPUs
> where the cache line size is 256 bytes, meaning the combination of
> kvm+virt-platform is needed to trigger the warning. So I'd be inclined
> to add this "dma-coherent" property for the "virt" platform first
> and advertise the property to other platforms if we hit the issue
> on those platforms.

Thanks Robin & Zhenyu,

Phil.
