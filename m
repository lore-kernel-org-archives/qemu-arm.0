Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5503CCFA13
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 11:44:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGyPm-0003X8-Ab; Thu, 06 Nov 2025 06:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vGyPl-0003Ws-NH
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 06:44:29 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vGyPk-0005yj-3E
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 06:44:29 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b5a8184144dso125123666b.1
 for <qemu-arm@nongnu.org>; Thu, 06 Nov 2025 03:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762429465; x=1763034265; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DnZNOUQ+QBgwGc9sQ7AsOjK+UWvxNbshrOfkn2Y8d9g=;
 b=BPXgi7IiZzQPi60ll2aASpLYyLAmM/QRuiHYmkvx76p2lOZmuirsmHnv738bxg2z8b
 P3g9ThVhuHUyF1WrJsjCGu2ICYfpust7aAZhi7NeWMl/+0SWoFj7D/XwYcACRO7JAZxB
 SnJIHPDHXXZbIKGReieJWNCTNjyW4A37+JhBn1IXU45KfUXH/QY1/PLI3L/9jwFsVn6y
 ZEbxOByVfLCbEFmt9QgVU0EkHwNZSVXm9ccOQ5zZADVmXDCPn0fKObbOUfTCjpbu3m4H
 lJtI3A3t8Eo/DM+Cgtdl+Mh5asXMIRTBwAH36VsAZxM0NSk95q97lIkmEFdsp9BsQRc+
 SkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762429465; x=1763034265;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DnZNOUQ+QBgwGc9sQ7AsOjK+UWvxNbshrOfkn2Y8d9g=;
 b=PJVGV3jzbO41JW0B03jvLA9CXzS1kZa9wsVjPTt73wFf624xZ0zEVElsJejsSNHElO
 tfR2o+IkOqervNfx5+9rb6OdGRY1lOLw1ZRBp4iuGldlXCEMKEBWoT37RACJT0X1NHuE
 LOEbIbARh/5QV6K8DyCP0k1/u4smIgDJWf93ATRX/u+Y0wTvIoEWB5DZm28gh1OhU9am
 3SF33g7MG/pYfDn7oAY89n8lXRCGNebuS1US2q/ApeVN29XvZ2J+9U+zfGf/aueUllEU
 bsrgmLKAf43DWCl9kn1H7JD0XsAcMkEpNmHfKc+HzkLCU7oe0zzd3JQIHaJK1zIvXU0v
 zNNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn8exQBD1ClpURiaj/ev7KJIhL1HZTD5oZuZQcESknUENV00QtVsQZNqKvBzx2+BLP3WcseM7VZQ==@nongnu.org
X-Gm-Message-State: AOJu0YyG9I2ZmauCH/G5TrbHFBvsBMnA2XjzuEWXSBNo2swfPrBgZtOu
 xbezggLqS/KHO52lzVf/h/UchutkQWRXHVG6uNxtZJq2n0svK5su+1NEjnNBYsz9FmQ=
X-Gm-Gg: ASbGncuDmkipfTQww61vuDBJE2+o8QXeHjDHYKT6XaOF2QjLkoB5v5eWjw3/s0wsG1A
 zDFh+//3HWibjtO55A+0PxKfNxtliBrk3L7fe9wvTMFWfunjw1dRNdmH1g1dZTlq72bYptUiEG3
 uWALCWu++Cm8+m0INv+j/jOqNyD/XepzHxOMnBT+BFmf5JuBj6wHIkiOzd5IcNBLXzgSrIHKj+o
 GzxiPehox98ija6KeuGL/p0rpF+EFjP99oS0Lca84+s/wlTbLAvYMNEYiVPHaK9U/Pu3Z2iosAy
 HhGALF3Ym+RsX5TjZMIxDdoJf4YDgyH72qDk4knpbJKTLc/1KXvkAojeUMkcN1h8zz1xtKEQtxu
 3kYM+MzFxB/kL/5VP7tCipXqUlLzN/jeQa7KZDyHZ4X+jRp5SxDsrwv+knH5HiMgaNRV293YfOf
 1hONoQ6ZCrGZgKYfVSXbLiArXnn/ZPKZhE/w==
X-Google-Smtp-Source: AGHT+IFd6wAXCjRtWahusXkziYC0KA04j6npNgCmullb9vGtQ1L88dBp+DdYb/Yc85mM3r1CvRaKvQ==
X-Received: by 2002:a17:907:9484:b0:b50:52a4:8f9a with SMTP id
 a640c23a62f3a-b7265539e48mr653430066b.45.1762429465125; 
 Thu, 06 Nov 2025 03:44:25 -0800 (PST)
Received: from [172.20.148.161] ([87.213.113.147])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7289331d29sm200571866b.8.2025.11.06.03.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 03:44:24 -0800 (PST)
Message-ID: <a5fe4478-2a86-495a-8bea-9b524aab3dbe@linaro.org>
Date: Thu, 6 Nov 2025 12:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: add support for FEAT_MTE_TAGGED_FAR
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20251104-feat-mte-tagged-far-v1-1-cdfd7db40397@gmail.com>
 <9b196058-a0e3-422e-86a6-7c405681bf42@linaro.org>
 <CAFEAcA_wOPO-BsMUB7_CtLKgb2HQEx4K62WJxoekabQ5Mo=Cpw@mail.gmail.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <CAFEAcA_wOPO-BsMUB7_CtLKgb2HQEx4K62WJxoekabQ5Mo=Cpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=gustavo.romero@linaro.org; helo=mail-ej1-x631.google.com
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

Hi Peter,

On 11/6/25 11:31, Peter Maydell wrote:
> On Wed, 5 Nov 2025 at 17:49, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>>
>> Hi Gabriel,
>>
>> Thanks for your contribution.
>>
>> On 11/4/25 21:50, Gabriel Brookman wrote:
>>> FEAT_MTE_TAGGED_FAR is a feature required for MTE4. The feature
>>> guarantees that the full address (including tag bits) is reported after
>>> a SEGV_MTESERR, and advertises itself in the ID_AA64PFR2_EL1 system
>>> register. QEMU was already reporting the full address, so this commit
>>> simply advertises the feature by setting that register, and unsets the
>>> register if MTE is disabled.
>>>
>>> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
>>> ---
>>> This patch is the first step toward implementing ARM's Enhanced Memory
>>> Tagging Extension (MTE4). MTE4 guarantees the presence of several
>>> subfeatures: FEAT_MTE_CANONICAL_TAGS, FEAT_MTE_TAGGED_FAR,
>>> FEAT_MTE_STORE_ONLY, FEAT_MTE_NO_ADDRESS_TAGS, and FEAT_MTE_PERM,
>>> none of which are currently implemented in QEMU.
>>>
>>> According to the ARM ARM, the presence of any of these features (except
>>> FEAT_MTE_PERM) implies the presence of all the others. For simplicity
>>> and ease of review, I plan to introduce them one at a time. This first
>>> patch focuses on FEAT_MTE_TAGGED_FAR.
>>
>> I think it's ok to add these "subfeatures" separately.
> 
> We can add the implementation of the subfeatures separately,
> but we should not enable them in 'max' until they're all
> present.

ah, true. I forget that when we do that we enable them in 'max'
as a last step.


> (We don't always adhere strictly to the architecture's
> "feature X implies Y exists" rules,

Thanks for confirming it ;)


> but in this case
> because they're really a tightly linked bundle that add
> up to "MTE4" I think that presnting only a subset to guests
> is likely to result in them not behaving correctly.)

Gabriel, given what Peter explained above, although the patch
is correct, the best to move forward here is to embedded this
patch into the additional series that implements the others
"subfeatures" and, as a last step, after the patches that
implement the features, you enable all the features in 'max'.


Cheers,
Gustavo

