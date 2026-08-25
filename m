Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD50CC61DB9
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 20:44:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyxzz-0006MG-RM; Tue, 25 Aug 2026 16:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wyxzy-0006M7-EW
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 16:43:58 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wyxzw-0008UA-Mt
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 16:43:58 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-cc149372c14so157492a12.1
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 13:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787690635; x=1788295435; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=urzaH75D10c+8t4xfbTqosS0c4Dw2gFtNSCz3XXzmi8=;
 b=FMBTMX4trQ0m4HDyvu3EePKeCkblK+08fLZZkTUf8MaiZK4uSJqs1kCmEWiu86WxbR
 rxeusDj3ode0d/j+zL2nHQ62K4FpNuYVbRn6jJP/kYrDjaEs+/DK0ptzx0o5roQN0/si
 mPqFJBeNZ6tmhNKbxoGMbolF3OZkKLviNEVPS1kNy/HCks3UT14ON0n29MsNs3ia10JN
 PqdOUW33SC4XoldWkoqldXwgsDIIwPQ9brebE/i9enC5We5Ry9qdq5UXxXtJbO3FuDYD
 07ojnPWY1S0CPsEIhqKZKbTSkoczGvxkqDb7tfUX2X0T5CD4HEYmwFfw8oA07ux8tZuA
 7Idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787690635; x=1788295435;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=urzaH75D10c+8t4xfbTqosS0c4Dw2gFtNSCz3XXzmi8=;
 b=ELXTeZOs2FvJXjktPw0wMU6CVxXVbGMzQUQibmIxFsu4JU3TkmNGuZzZ8bIEGHckdJ
 4kyaS85Llhy+l5rBmHP/NKXRyvLu24+B5dLfznRnFc4lElfCmiReB3Ofb4h822RzXl9u
 aWrV5ptDI1F3dxgQ0p2A6wCMTmrGMQi3Ex03D3uwAffPApyYt/suUGJWzOSXNGAMRzhp
 zDlp7Uv9QYv/wLlYHxQP8QrUv0ZXBvL4ArPJ8p6nR2eJT2Ez/qeEFccbxBE7udWpDTG1
 NL/qcWvRZLGYWc5iDJdnc4CK+HCYm/joJtyi3BC7as1+VvqLmpZbZiN08OWsBckfZ0SZ
 /D7w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrjeq08t2axxOMCCLHRZK+kSirh2AAUZjbJFbkOaSUiZ2Y4omfzzC42AunWLytTzAPtwGV4JT0dzQ==@nongnu.org
X-Gm-Message-State: AFuF++m9vMxbEgP6+d9Q3mm4AFmI1/ZSh1r/PmkAT+QQgDoehDaC+yXa
 1H9aWB2QTaXp2qYvQYRsOLyIDSSAkL+itLS4b5TmGYbGu4qK0TSx5aZNrLDmqbOKh/U=
X-Gm-Gg: AR+sD11Z+immkTfxQIBkpTih1xjEC3QVCH8/va3o3REOzbVm56UM8EYgvgSK3j+ob14
 I11mJEERNmX2ctfm91qsvqljAqwkslXCj/xp7u3aLHwHlyS9jO9sb3tS6ZgTDgma8fQxdHky1Hl
 hF7sIius4Rc5VRDMFhtWO6cVq/F56rixjWGJAyNQsk3g7yaVPwAGa8jYaNDmBoE/7ZEUCyvKz3V
 asNcV3nmVoBZLvbpDMWDETK7JjVArRTo48XFIklBHH5kpZJVqoXkkib/hpCIe+ie8UmHd2+OpQ0
 EdKddJYu3VY9+EEsQn/TOyamIifvX53nf5EER3ctkhpVXGT7UjeU0/wAdh9rO7a1677fJMoTUL5
 sYF+UW8Vk2JWF6yS4e/Ys+DSLviHP3SOn40rF/eru4QWzvrNhWpGYbLnGB/jP6EE7c1Dg5GSy2t
 e0vsyslqxFLC4fp3mm64sfXAz1sDc1MRNRJSWQ04Feo0vg8kJvCBgzGPkvf7UZHcTNFX5hnM6Zl
 p8EsRrYrqN9wcNbvucUk0jXnitr
X-Received: by 2002:a17:90b:35c3:b0:395:5f43:4ec4 with SMTP id
 98e67ed59e1d1-3966cdfde45mr4030055a91.0.1787690634789; 
 Tue, 25 Aug 2026 13:43:54 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39662c80d6csm2082862a91.1.2026.08.25.13.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 13:43:54 -0700 (PDT)
Message-ID: <f54c3c03-d92f-4368-85a4-d1570b25d6c2@linaro.org>
Date: Tue, 25 Aug 2026 13:43:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] target/arm: re-order ARMFault_Domain check for v5/v6
 ptw
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20260825145350.3726466-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260825145350.3726466-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 8/25/26 07:53, Alex Bennée wrote:
> +# Domain fault ordering tests (GitLab issue #4233)
> +test-armv5-domainfault: test-domainfault-start.S test-domainfault.c
> +	$(CC) -march=armv5te -marm -mfloat-abi=soft \
> +		-ffreestanding -fno-builtin -nostdlib -static \
> +		-Wl,--build-id=none -Wl,--no-warn-rwx-segments \
> +		$< $(ARM_SRC)/test-domainfault.c -o $@ \
> +		-T $(ARM_SRC)/test-domainfault.ld
> +
> +run-test-armv5-domainfault: QEMU_OPTS=-audio none -semihosting-config enable=on,target=native,chardev=output -M versatilepb -cpu arm926 -kernel
> +
> +test-armv6-domainfault: test-domainfault-start.S test-domainfault.c
> +	$(CC) -march=armv6k -marm -mfloat-abi=soft -DV6_SHORT_DESC_TEST \
> +		-ffreestanding -fno-builtin -nostdlib -static \
> +		-Wl,--build-id=none -Wl,--no-warn-rwx-segments \
> +		$< $(ARM_SRC)/test-domainfault.c -o $@ \
> +		-T $(ARM_SRC)/test-domainfault.ld
> +
> +run-test-armv6-domainfault: QEMU_OPTS=-audio none -semihosting-config enable=on,target=native,chardev=output -M versatilepb -cpu arm11mpcore -kernel

There's nothing in the tests which compile differently.  So I think 
there should be 1 executable run by 2 tests with different -cpu.


r~


