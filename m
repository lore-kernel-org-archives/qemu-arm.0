Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166D6E9A03B
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Feb 2026 21:37:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsSl0-0000Nf-20; Tue, 17 Feb 2026 16:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vsSku-0000Ke-Vy
 for qemu-arm@nongnu.org; Tue, 17 Feb 2026 16:37:17 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vsSkt-00058l-Ao
 for qemu-arm@nongnu.org; Tue, 17 Feb 2026 16:37:16 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4362507f0bcso170141f8f.0
 for <qemu-arm@nongnu.org>; Tue, 17 Feb 2026 13:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771364233; x=1771969033; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UpSN3Lrab8r8siEkLa/h4lJ4FB1v8ZaMvflu5Rz6HY8=;
 b=diaNcOWMXNSO4IVXSjkHJlOjc7QOKVjKXXJK4kW3G72rMasggJ4OdUdKFnmgJr85OE
 PEd6DcOVuFtyoyrRGVFiZI/xvKaOKp1P+7apjA2rAcwbork5LExwxrFVkUbDhkL5vWg0
 Zdh/Ep3HPgHCCyg51Tu7C/h7Vn0rbbg2xmDMFlKCuyYe5KTr7WtubEdY4sGbn7y+fld+
 1xsJS/oalxmrVdPH8nmYrIKkpGVgFQkBhaywg0F1Xq0EIrXdy9dv5PhDTaGkl1ay6j4k
 JaMn2wgtaDvO3Q1m7RTTzrdOvbaE+DX7rcZoXjkhk/iKo09hZEK6HCD8nRl9xxKhab/m
 Oxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771364233; x=1771969033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UpSN3Lrab8r8siEkLa/h4lJ4FB1v8ZaMvflu5Rz6HY8=;
 b=uijc9LR+boK5x7l+f1Y3lCfpisfdAAIzEwqxNtZNssD0knAooeWVqxg6xRLFEa8xQ+
 P8jgoKu3Ddj6C4yhq1WepPVaWgjE8P3TG5nuwWxogHVGOR/CkxkjSpjEcN+uKN75WszK
 VcUriPRnGyObT+EUt6Y0a0JUjKA1Gk+CHxMO5b0dAnT53I5H1DX0VTXlc/Z+qPjeVElB
 9N0rHTT34WEj/Nmcl/P+6W2TImQ2U2aB5DcZDYGKRWPOFUMHLhjakzAbYFOfKsNadE5W
 H6y0tHirrxyT/M5eeiTPK7rD9TNGJQFGAFBirm12OOBrfXTuT/lIavQHeuZxUdkZInWs
 /Csw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOzTALpnIuJgVdB/2CgSo1wDiD4k8voGMu0KiY3etrWaikxakp7az/IJildNhWpi68sgdJwRBhHw==@nongnu.org
X-Gm-Message-State: AOJu0YwMtyniN0zg1QdGw3q2d68iPI/p1MC9Qypd11Z9fMkHSZHJfx1Z
 nrDaCQJ9A30ZLkjLTJLvZMlfwOLY9cuWzuNnDT9P8Hd6bXzZDhiCxIspAde/iTAFd/A=
X-Gm-Gg: AZuq6aLTFo7ZQmPA0ivE9jxx7ihfT6/7LOaDe3hviOS77Vn0YDW5tN8nvDETSiR/xLm
 Bv1YUYerAp2sIZeYUUD//vAT2th1b02BnVwu6FsG9xo7ig2vktw75Dp0mkBQDGmu4T5vOy7CaRW
 JIHM+tKGm5FVaJ6TbXagic8alEGfTmJ0EmA6JTxdpe28LsTX2MLVZUPOjDoLt2ywrmUBDkrhz60
 PTsjouxTitt0+Efv0XXIBVVndBmjUYjSaCNkq7tEuR3ta4VyYklswjlB6fqrKaHJrApVotY/z6V
 K5W3dxPcBvEj594pQIjs4tGeM9Se/kfgGC4e9v9DXAZElGORkyvR/t3h8XsOD/RJwECQ1rDJAms
 VSlAxCKLdod8Mkx54iGH1Y8ETZxO3OqZkhtc0kzwU8Hy4WDSul2qUcPf8Q72LLFgAh9bFfxMOs1
 bErwXn0Fvdu6KVmwZFiQPhTBEK9UuLg/6rtaWHBZl7+xKC/2yqorUiH8jfZ7wc/JfS/Q==
X-Received: by 2002:a05:6000:25c4:b0:437:722d:5c66 with SMTP id
 ffacd0b85a97d-4379d612ab8mr25241446f8f.16.1771364233141; 
 Tue, 17 Feb 2026 13:37:13 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8209sm38808711f8f.30.2026.02.17.13.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 13:37:12 -0800 (PST)
Message-ID: <2f323211-af73-4897-8d50-62449737b080@linaro.org>
Date: Tue, 17 Feb 2026 22:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] target/arm/hvf: Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Mads Ynddal <mads@ynddal.dk>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
References: <20260118215945.46693-1-philmd@linaro.org>
 <20260118215945.46693-3-philmd@linaro.org>
 <EC8E03E9-3E48-4425-B4C6-D395BF34B454@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <EC8E03E9-3E48-4425-B4C6-D395BF34B454@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 15/2/26 11:15, Mohamed Mediouni wrote:
> 
> 
>> On 18. Jan 2026, at 22:59, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Keep CNTV_CTL_EL0 and CNTV_CVAL_EL0 synchronized with the
>> host hardware accelerator.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> target/arm/hvf/hvf.c | 25 +++++++++++++++++++++++++
>> 1 file changed, 25 insertions(+)
> Hello,
> 
> This broke VM save/restore on my setup. Will have a commit to revert this in my next revision
> of the HVF nested virt series.

LGTM, thanks for taking care of it Mohamed!

> 
> Thanks,
> -Mohamed

