Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C33ACD3436
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 08:10:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLGHa-0001SD-Ju; Fri, 08 May 2026 04:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wLGHR-0001Pt-Bk
 for qemu-arm@nongnu.org; Fri, 08 May 2026 04:09:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wLGHO-0002Gl-V0
 for qemu-arm@nongnu.org; Fri, 08 May 2026 04:09:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso1007935f8f.0
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 01:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778227789; x=1778832589; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OxPDueJKKHp7zdpcq8WomB/rOsfpNLv5ZOuNuLUCntg=;
 b=dpVdqLBr7IMXCqZwA52ySAPSYmTC0sMahMv3gwbN5PXWUYt/gO8dUC3FFwjmiONBqO
 ROoFmfIVRPrLc5nmSroqqIpKicfBe14hWagO7rB/zTxbqR0/4V1pmzdM9MorAYmKsSFU
 5ocl5Phui0ZjbkXe/HL1kV59ljm/zQiEL2JXg8bqoA1kKOpxAuy6JeNpJ0I4coFauRZY
 Cw5fXJ4KOTx+K33F9QBk7MeDDwOpliZFEIFTjqvfgQp5iNnjA6fbdpQXZFGqXZLpFgi2
 COKHxudNrHc41UbSVhNXnoJtvJf7rk8DJLDkH+K97/SRfvndfPM+9F7G+30sTlx1zs4Y
 eZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778227789; x=1778832589;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OxPDueJKKHp7zdpcq8WomB/rOsfpNLv5ZOuNuLUCntg=;
 b=c0tov+XDapJZN3AmiVMiBSfKR0VehqQ+nQJ4d/G252ACGWLalcK6smD3iNODe1Dv/I
 FfgJDkx3a5LyvC+TyrRC1l23h8ymLPdU81NQCnzgyiOdTFSTNsRXPucxv2UZNWvyEBOP
 ORqSHSLP7WeFxOpv3aFKK2CpQQXU6ejxSGEOlf3iUoyKBNytMnOHOoSOsv5YZO4ezEIC
 dAIjkC5Jl947fLOca6kuTDPoNqfvd1briryIKsFvjv6lzV0KhTHQbztJb/33OrQpbrRR
 R8uRT1bJkGvKZ04UsOklQLNvo/jqkN/e+x75dvNQepujrPunCSwutGt1RuhQV97f61D9
 0Y1A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+4j0tKLNTBPovM9t9ceCwQYbNONv2+WxWwL8ytOyv7O5rqR7w/yhUYQ/tvlhHCZaSEYaHWWdawvw==@nongnu.org
X-Gm-Message-State: AOJu0Yyv6hUSl5ozJ94Ey6c2XGlImybTxqzrJEwa9+GDsEcSzmzYKh39
 t9Fkq8WCg4gvFdk0vGbMldDyD6eh4i9qctdYPUpxqQ91f9FlxLDgyeID5lQbJbVvPsU=
X-Gm-Gg: Acq92OG95GeZam7oYUCUGlbbeeO4cveGDg+qWxGUvp08P+qWha86OcP1C3/xUnaMg2u
 GG1FjZ1zKldQS4r4NmWt1xJnfgfXvubRIM/pji0MJsL7065o2LpJV/6uIfLSW0KeE2DhYHQ5ofG
 /y9vSQhkhRvXX5se/sTK60swhoXeOlRZfUHSFeCT8T+qLUUA0j+X3LNnz6COuX2cZXiIWZVIar9
 URSY0mxrgC+QI14PhBx1d+2kTB26tVcHwTvsV1xueWbwvo/UWCLmCD//WaSg70NUwE2xrZlQrmy
 zOmhLkDdKOVTy07JBjz4+CVqgiIqoTiocIyqnsaPEl1aRoUCjALwQzRDnNxOwf+6mXomCAwQK5/
 Wa25TyFypo0GH01WyFU6bN5KEDvRnD2NWoMd2vubD4ABCJdWxkvA07p4R7BsjGRFhUMG6X0J3A5
 BdZfbKnLiSa3QXllajBkrwT5DNwjU5nPAg+zuG4uwx9brMx8Xfa/GFQqlEzR/7XmxoetOv8gO/G
 m4=
X-Received: by 2002:a05:6000:611:b0:439:c299:4d8f with SMTP id
 ffacd0b85a97d-4515b524739mr18018377f8f.17.1778227789265; 
 Fri, 08 May 2026 01:09:49 -0700 (PDT)
Received: from [192.168.0.200] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548ec6b071sm2483669f8f.14.2026.05.08.01.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 01:09:48 -0700 (PDT)
Message-ID: <9584c669-e084-41ca-8747-f28e1f5da25c@linaro.org>
Date: Fri, 8 May 2026 10:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] tests/functional/test_virt_vbsa: Skip UEFI test if
 virtualization not supported
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260507194728.2034696-1-peter.maydell@linaro.org>
 <20260507194728.2034696-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260507194728.2034696-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 7/5/26 21:47, Peter Maydell wrote:
> If you try to run the functional tests on an AArch64 host which doesn't
> support nested virtualization in KVM, the UEFI test fails with:
> 
>     Output: qemu-system-aarch64: mach-virt: host kernel KVM does
>     not support providing Virtualization extensions to the guest CPU
> 
> Catch the VMLaunchFailure exception and if it matches the error
> messages the virt board puts out for virtualization not being
> supported, skip the test.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/functional/aarch64/test_virt_vbsa.py | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

