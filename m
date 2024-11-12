Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7492592njc;
        Tue, 12 Nov 2024 09:11:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUuPm6yP20eaF7sl+Vt6Iwacr4O1T+vB+Gy49nJrWZCatgGxMQ0w1/REOR24KzFCEKFu8dHr9tDCOQbdg==@linaro.org
X-Google-Smtp-Source: AGHT+IGaq18UNn3wQl59lNnfZDr2iDyh48JfAZbKqH/0MVUEFOs/0XRiFwkeKkfzidFZ9Z/cQDq7
X-Received: by 2002:a05:6214:53c9:b0:6cb:600f:568b with SMTP id 6a1803df08f44-6d39e1554c4mr229229336d6.8.1731431486776;
        Tue, 12 Nov 2024 09:11:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731431486; cv=none;
        d=google.com; s=arc-20240605;
        b=O6mHTwMeFFq4BsNlfAHv7ypM6//gwSqgy5HeniNQFxxDfxd+Q3+dPfPUqKogCKedVH
         ykhk0gj0mKjDA3JtpLKj8Vars8EzOiuKdojNj593RZIsayNYLplbaDy3w5zU++l4TrkG
         dmwC2R0pZ7/17cAG3Ob5CTZK8DHBkPoZujgu9dyY9g42vNvPproa8Q7tB/+FHoHL3LrV
         hrQJIgL1ndQ0YSHC4j2DA8MYOvFqiegYLgWTqgfaS1qGVfuLosgKJOpRbgLF8smBoGPG
         Lj5MATty+hUyNCGW3As+SKisgz8zOm3FFuJqIbsVjKjN3myvYHXeQJtNeTzue6nxqkpM
         c9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=lTrFyt7xvaBjA0opqp0jNJBxCdnRTPvW3DdM/vMYjkQ=;
        fh=inPhTZ5BhXiQYETglXKei6knpShVjo/aVHEF9IQuZZU=;
        b=j0jzTq/b6dYUd9+s9L4+vuFPNWq3JLkHc0abdxLwtVZmjnjxW92cMywrt7NelpbPYO
         9tp/mHUOC/5Z8WofYamxziNLchUAQ0WcD3vbU1j1CDtbVeVDcDPMw6E997+7h2NtCJUS
         d5o7bcmbF5umtsP9mFXlhucaKElqz16FqUCzGNrRafujAbHNzQw8jhOL8P1Qwb4Kthom
         76X1Xl777gjqXE8AGeUghLuJHmZI0o9CLgXatpz62NT+MyujBCUIKVzIQi+hfEFmnEka
         qHLnBl1pTSkJDVNJ21R2uDMtaBxQB7fUGqZFfAZB3wDAcim5WcQmMLU2bnqgo243zmBp
         poSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nf+KfBhN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3962284desi147131436d6.133.2024.11.12.09.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 09:11:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nf+KfBhN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAuPx-0000m6-3m; Tue, 12 Nov 2024 12:11:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1tAuPu-0000l4-Um
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 12:11:03 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1tAuPt-0002hh-B5
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 12:11:02 -0500
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso78209871fa.2
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 09:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731431459; x=1732036259; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lTrFyt7xvaBjA0opqp0jNJBxCdnRTPvW3DdM/vMYjkQ=;
 b=Nf+KfBhNEVzAt6lKAzufg46h3/98FPz2nxEXDGsiQSC5I2sgv4U11uJDdZna+T3r2x
 3ogx2m8WbOmMC7lmELnCnNSBvelj73yySXuFyjxMEgO3u/YH1E/F7VpF2JSNMCL3og7D
 e8z+61dTa4De8IubQrOPBcQPWXrTQJpbjQ1flRY47D1K8xJh+B98i/OWgiPDXuyXkTwe
 i+68xecWKTOFLt4AQF5+l7afV2tDVTnkCg1uruWyztTWtZekIYvzvtcwm+U/mQghqMLL
 RaAV+mostNGK7Q2/DAuc8Lk1L4zr62JbTWFpV7VkyLTqcdtfwwqXRXH9TDmx7n8W0bGM
 VWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731431459; x=1732036259;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lTrFyt7xvaBjA0opqp0jNJBxCdnRTPvW3DdM/vMYjkQ=;
 b=v4/WwaSxdKn+KSnTUgpvdHmjO2CC458c1nZ62MMX+qC3yzQUoK/sDEsG+syAXyINFt
 bIdUhalbw+N3JKEst9hhxgavDxO7phzNwHleSWx/4S1SE1YVltm9tDS7rpZkaoEtOQqm
 nEcuVChVvpJAWD4OW7alyTXLl01WKirM+oPiuAeRQSC+9Pa+4IJImplULjO/w5kPQuKQ
 2fH6FJGP48ROlBwqIsrtf6majn+NbgKbTN1VJZ3X7kPTtHSpiumq+5FdNwdh6Ah8b2s/
 ftqII1dyFvqgBJ7sXewBhUuoo8czQ0rImhqKMjYZWbS7Flh3IkAY0AATXY20NKUid9k6
 OQhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKLCAsKyHRh0ByPZeuFrDRfiyF212eVsBQ85ZN5lumTLsbrXb4BRHKd8Vk1J1WBj+OdfCaTEDDgQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxbh2567o4Z5s0+tHqbngpCzC3I081UU7SLBDhq93FC9vEh1xY8
 99yjLzqZzRCSG1BcyAsOr+PhKjIyfFOwDgFl6v35QAnWtzSMzFGWFtYwXLhnGMg=
X-Received: by 2002:a05:651c:1551:b0:2fb:2a96:37fd with SMTP id
 38308e7fff4ca-2ff2028a91cmr133928431fa.29.1731431458917; 
 Tue, 12 Nov 2024 09:10:58 -0800 (PST)
Received: from [192.168.210.26] (83.11.2.232.ipv4.supernova.orange.pl.
 [83.11.2.232]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0def87bsm749844566b.143.2024.11.12.09.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 09:10:58 -0800 (PST)
Message-ID: <90513bfa-0888-44fe-8cd0-7b2e7518a41f@linaro.org>
Date: Tue, 12 Nov 2024 18:10:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [edk2-devel] [RFC PATCH v2 1/1] hw/arm/sbsa-ref: Support CXL Host
 Bridge & CFMW
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>
Cc: devel@edk2.groups.io, ardb+tianocore@kernel.org,
 quic_llindhol@quicinc.com, peter.maydell@linaro.org,
 chenbaozi@phytium.com.cn, linux-cxl@vger.kernel.org,
 asa-dev@op-lists.linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241105104346.417102-1-wangyuquan1236@phytium.com.cn>
 <20241105104346.417102-2-wangyuquan1236@phytium.com.cn>
 <20241107120457.00006024@Huawei.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <20241107120457.00006024@Huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x22a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IaiYu3m/UxTB

W dniu 7.11.2024 o 13:04, Jonathan Cameron pisze:
> On Tue,  5 Nov 2024 18:43:46 +0800
> "Yuquan Wang"<wangyuquan1236@phytium.com.cn> wrote:
> 
>> This creates a default pxb-cxl (bus_nr=0xc0) bridge with two
>> cxl root ports on sbsa-ref. And the memory layout places 64K
>> space for the cxl host bridge register regions(CHBCR) in the
>> sbsa-ref memmap.
>>
>> In addition, this support indepentent mmio32(32M) & mmio64(1M)
>> space for cxl components.

> Those are too small.  Might work today but not sustainable.
> 
> I'm a bit surprised it was this simple to move the MMIO Space away
> from what is normally done for PXBs.
> I think it might work because the GPEX memory windows are effectively
> unlimited in size but I'd like some more eyes on this from people
> familiar with how all that works and whether there might be some
> corner cases that you haven't seen yet.

I see the same problem as with multiple PCIe buses (for NUMA systems):

pci 0000:c0:00.0: bridge window [io  size 0x1000]: can't assign; no space
pci 0000:c0:00.0: bridge window [io  size 0x1000]: failed to assign
pci 0000:c0:01.0: bridge window [io  size 0x1000]: can't assign; no space
pci 0000:c0:01.0: bridge window [io  size 0x1000]: failed to assign

I do not know how it looks on real hardware (all my systems have one
PCIe bus) but shouldn't each host bridge have own separate resource
windows for config space, buses, mmio etc.?

Now we squeeze all pcie buses as pcie-pxb devices and this patch adds
cxl to the combo.
