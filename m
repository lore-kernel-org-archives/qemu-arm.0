Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp2878146ejb;
        Mon, 18 Sep 2023 05:42:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv2VEoezOi4uil0LGdPSBsJ3gkH8ZqW0kpWGGR67h5mz+utUcXSIzcVgGONtxkxJNJ9ORz
X-Received: by 2002:a0c:e183:0:b0:64f:4c7c:2e13 with SMTP id p3-20020a0ce183000000b0064f4c7c2e13mr7320756qvl.9.1695040945362;
        Mon, 18 Sep 2023 05:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695040945; cv=none;
        d=google.com; s=arc-20160816;
        b=paOo8bMDvlWdc1jw+4r+JYCZLBJTq3RBrFpY7cJRBuu+X3D8aiGICLxGw6u+jFM5Q7
         pDNA8WLp097AbBJbM5lFig7CqSzUHQq5919g/AG6wOzvW0ncKg1bdrllnkT/wyNeEJRu
         oab+FVvE9MdLSg9LEn5q0VltGwPiBnH/w7J+bqXzIt0jAxf3/uBJm4YMBCKjYu6kAGE2
         5IyVL4SCKb4qOkae9ldUnQhJ8Xtfh/tKTv0Aj/VNTwQL7zogpYATZpIBVjsLnqP2HvJ7
         6Imp1tdPGofPYzlHyJlnatqaUbkGjml23u7Rk5vNj8bKZm1lB+fxbSY5kOGZs3tpBpvU
         JJOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=I3DBEATUhrUmNTQdwzEHc4hoswf6rcuMK8fN1Oh2dtI=;
        fh=rW+E0ka8cjM0BRqNpCv7iXBHNEytiQxpoT0WH9UDH/4=;
        b=dKJQ+nEKZFoSSb+ErhxLZmAVrXfPKA7MEg7gUm4lmGh4UPJUw4bb2ysPCIims/rIyl
         qf7gZWjxbHUaBUEVpnp3/wPHbz4ijwwTCYzbz1dxFiQ40o4E85Y33397Vpa8nZWhhAGy
         zpzXiTfk10k3ZrqqZT3XwVrMHxbheiFPkZpqBpPSkpXH8+jDr/tCqH3nulvmzcmM1lbZ
         UIh0WMcOBbIYK35kpmOrV1SPRTb52WnyUkWn8U8yqJkti6E3HLWGld8qlILVRlYpp+PP
         x7/IFhCcQ24LeIinFyvvmtU7XobU4Z1iVCxQLjyifRZuw+iYYjWBiWjF7DHwrxxaGcR2
         eGvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XSqQMmpV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a0ce446000000b006564bd093efsi2758471qvm.345.2023.09.18.05.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Sep 2023 05:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XSqQMmpV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qiDZR-0004he-N5; Mon, 18 Sep 2023 08:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qiDZQ-0004ge-DA
 for qemu-arm@nongnu.org; Mon, 18 Sep 2023 08:41:44 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qiDZN-0000o9-7d
 for qemu-arm@nongnu.org; Mon, 18 Sep 2023 08:41:44 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-502934c88b7so7329076e87.2
 for <qemu-arm@nongnu.org>; Mon, 18 Sep 2023 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695040899; x=1695645699; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I3DBEATUhrUmNTQdwzEHc4hoswf6rcuMK8fN1Oh2dtI=;
 b=XSqQMmpVrtUiNtuscMGULrphNq/4gV+xe0V09TIx1hm4nvfcH7Pp2JBogsTPUrXwX5
 wGKY1Bl8MPBf12TBVTqCwWbQYTjKEbWRhTsd5KPpOlSbeWqzuhsYxpgAiCbITC88zt+X
 XVyRFeJajNHFWZ70/7W5uGW9v7X0s7ReSLZ/vVQCltdOUuxBHntGk/ZAbrVzCeDF+bwg
 2IEkVMd28e4/7VbJhIt4wsuPvzqQsZFEsFATIhcq6kyUlCmqN+xyInkYdtCw6D3+vubV
 +CflZCsefbiFevNWj6MaFg0Lr29xWSj4CZkI+lHgEGPL04qXXhX0ku8beMK7w8OL0qzp
 JT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695040899; x=1695645699;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I3DBEATUhrUmNTQdwzEHc4hoswf6rcuMK8fN1Oh2dtI=;
 b=Z1HImt9QR2erzmJYyUHbZkjef6zFrylVmG4cQCSXEZcl4KsuJygSfnYT905kkm/VeG
 XNcjImnvB03VxmXoPIv/OWEUyCNvdmxgPJVzsNatUI8tD2PLvoWHiLPwK3X4cNBhQH8Y
 8z79HNwqiF2P4+WxX/TcQl8D5yfmq9KlR4yl3gDGzfRVSgL/KXwER82RQxhVJ9GKaeoz
 kCLW346+owpDQsvmTVdCzg5dqqVK6RKXNg1FpsC6UYaPplwerEKvCn7aNgNKUqldfD5H
 pnzxrYV9KzZ0ZIA0UUv6Iae9Qb3CO+DHrARZ9cIaMml+HZfhiw6mkzqLhjs7TlTl2cX9
 j2Lw==
X-Gm-Message-State: AOJu0YyuegjrzvsGx5k9AWVtgRDdWi8th4EEvWT9OL5lPfd5bQup153a
 pOMT2uqGlb/RVifTFp1QPbfTbMfN4rHSLvgnK3r4jA==
X-Received: by 2002:a05:6512:2039:b0:502:df85:c049 with SMTP id
 s25-20020a056512203900b00502df85c049mr6247403lfs.2.1695040899192; Mon, 18 Sep
 2023 05:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <2023061615433049315231@phytium.com.cn>
 <ZIylkIt38MXaTytx@memverge.com>
 <20230619105809.000007b9@Huawei.com>
In-Reply-To: <20230619105809.000007b9@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Sep 2023 13:41:20 +0100
Message-ID: <CAFEAcA8beGka0AzEkX4SE1B+UwFpck2_0gWM9bV5WgFbWQYB1A@mail.gmail.com>
Subject: Re: A confusion about CXL in arm virt machine
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gregory Price <gregory.price@memverge.com>,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>, 
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hfmFogMnSdAV

On Mon, 19 Jun 2023 at 10:58, Jonathan Cameron via <qemu-arm@nongnu.org> wrote:
>
> On Fri, 16 Jun 2023 14:10:24 -0400
> Gregory Price <gregory.price@memverge.com> wrote:
> >
> > Last I tested cxl-2023-05-25 branch of Johnathan's fork is working on x86:
> >
> > https://gitlab.com/jic23/qemu/-/tree/cxl-2023-05-25
> >
> > I have not worked with the ARM machine, but Johnathan may be able to
> > comment on the state of ARM support for this code.
>
> ARM support is not yet upstream.  There are some precursor problems we still
> have to solve because arm-virt should also support device tree bindings.
> See talk I gave at Linaro connect that includes some of them:
> https://resources.linaro.org/en/resource/hM986DSHfoTrZ98UjpvLg1
>
> For now, I'm carrying the arm-virt + ACPI support on the tree above.
> There are a lot of things we still need to provide support for in QEMU CXL
> world so for now figuring out the path forward for upstreaming ARM support
> isn't at the top of my list.  I'll get back to it at somepoint - probably
> next month.

Is the Arm CXL support still out-of-tree? I ask because at the
moment docs/system/devices/cxl.rst has some aarch64 virt command
lines which don't work, and we've had a bug report about it:
https://gitlab.com/qemu-project/qemu/-/issues/1892

Could you submit a patch to correct the documentation, please
(either fixing the command line, or just deleting any claims
to aarch64 support if it's not upstream) ?

thanks
-- PMM
