Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A61CDE001
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 14:50:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wclOY-0005u2-Gf; Thu, 25 Jun 2026 10:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclOX-0005pR-Jc
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 10:49:33 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclOW-0000Sq-0K
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 10:49:33 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-664345f8645so1894426d50.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 07:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782398971; cv=none;
 d=google.com; s=arc-20260327;
 b=CVfI7iFuJ0kr+EJGgd+iPPLdXb0cgMMOnI2177h9MAJLIqqnKkseHV/29c3eZ9G/co
 4rv2GBHoY2bj/7zf80KrytRyWqD7cTiTN0hDITHeB/ti7jd3Ljawr67aY+1UqhroH+x9
 /8Uy/QZk2bPGG1oc1ki24/JH+XIj9GI66kbz7Q/Fzo6wTzfEgWef36pxg4E1jX3tQ+68
 51mjCZ+p0BgINUKTwjnYjxMylyoqEjLLRZ6x9WKqVfx1oJUTsefCg8PfDBBHxB0IXy40
 FFvZW9M9k9fsgdR4KGLaTbtO2relq28WvLbrV+FKUVXAzl0QdUt0TO2lmvABlNQzc5hy
 DJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Rw0HfhI7BJOD+4UVug9ahXXlWhekFk0Jzb2lruLBVeM=;
 fh=4uhLsYvq/DrayIcsRK1+rC5+ZAu7AIAX+Whpe0VboGY=;
 b=P3eXFbjtwdIoddvnFuTeBBNLmyo+kehSTGVUZtP/LflMdj8wqlmqmxZbXNaq2C3vca
 bC/KryW/eV1WJooma11O7IcWgcpJduviOxZT1C36UC3Utl2BCGKWei4VGZiX+XPII0Vi
 nhrsNP4FpZAopAOnLSGE4hv6qgi7drPs2/ua5v+L1Q/oP1hWjBoNOwkcdOKRe93VXRmx
 IP8Fg2euOw6TptUjrlTWHeU5oYi+BUlqsLBTkPjIS7P+8mgpVBa/7M/x4+KviDBzOIrK
 Qi6ncIY6wreDsyRJ2Pm1SoRGzKtqUYgdQED+tbf6oEbAW3ax0TnDw80BvK7LrllAVfiA
 Ux9Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782398971; x=1783003771; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rw0HfhI7BJOD+4UVug9ahXXlWhekFk0Jzb2lruLBVeM=;
 b=CGI5nKud5zkJLghvEknCZZUPVyskefk+khJccaOKsSS1dsQoH9Y7Lp4Oh9C/Ez8Hf1
 2aPFe16iH+RcempJX9MTN5Ipqk9o2hIpQxI91OQS3jCt+7zg3qKzS8FnT/bqOWME9e3K
 MJVrqUV3b7ikmVLhKKQupeLwbGAV3CG85lMSkuB/9LLbBq0nDyKbVhg9oZvkFYABVMtT
 uBWlypu2Gksh8CAkeO1DIOtC+RSaaaEDRZPWX8URAqJJhIBuA9q9seIlHoZfVOE2tgWH
 ItbYOJS/WnAyz7HdCNO0TCJxvgtBFWuY62ND21xih38HzmtF1uQ5eY7OLCLcSgcG8O78
 6QhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782398971; x=1783003771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rw0HfhI7BJOD+4UVug9ahXXlWhekFk0Jzb2lruLBVeM=;
 b=MghqAgcAxyjhpqn++ijww3km4+mBXtJjgyaG8Oaeh72CnbMDAUYj2UwTp0ejCmmvY5
 sJo5jrr9UtVbQYHPw58nbOUurWAU1u1ZqOFwg2aXnJwxPTnORIo+N1+wzIxR+s6PjAyg
 kRPU/6zQaueyXYFXz90LCMKdiW7jgXVAhlCF45ZkfapLueFCkGhwmFceOtEVUf3m0GqP
 u424MXGYWaMMwyuaeUqhQUeGW+Q92frGn02P+ptGu4geoF9NoiFgQUvDkV79MwBfEg6b
 KkO2eZlXi3nZ7FURTHX2iSo7A9+uKMXvpyP/3eqQU43G/WSdCerfa0VtNtKq3hyrz8HW
 p+ng==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp30X+ZTlVlK7YTrvnzX7VlipnoBhJACwnZZU+tN4rIEcl1SWQxCMJpJYe200zS9SjvO5EqSnZy1w==@nongnu.org
X-Gm-Message-State: AOJu0Yz0Ay+fA1SwN7rxUr4nNuQh4MvfZxEfbFdeP9/V2edXOI+w3MNJ
 8YPlMUdnVM0cFNzYuJ/xpYdXXD7BsGdyKaJiLEHvXje7hh6QpK0rmZLygZ2GiruV1k0xhM8RygP
 JZP55nxA1LN0J4ORDtJwSNNlCw7nTMRJ4cvOe0FAhVw==
X-Gm-Gg: AfdE7cnzt8rwHydQCuWV4brmpE3cznuqJu+NFtbWqxAFgeKSFkyPdlp/KXhzuWDpPa4
 aofCz1oLlGmNQ0xItCX55hEAHNeSGvAVzk7A3nJisH2TwAKLF3Bpqb8wbhDge8BeL+mznnNgHko
 gB6gM7dW4deu83UBFqlicEhoms3p+2A4n0BJgRX1PgoTAabViztnTAQt8EMWjAki+M4VzkTWI4B
 b7Rs+dKIfg6jrM6MacJmgdv1kx7DGXFDv6YPmjIH4vmanYh40kr5HXSqPkhttcQfENSOngegjcq
 kx5vQKia+o0+WaFVWc5z49PkssZd56uwPTftC6jV17yntcrbNWxvlwZ6
X-Received: by 2002:a05:690e:1686:b0:662:c587:4351 with SMTP id
 956f58d0204a3-66487e02aa3mr1957554d50.55.1782398970624; Thu, 25 Jun 2026
 07:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1782140438.git.matyas.bobek@gmail.com>
In-Reply-To: <cover.1782140438.git.matyas.bobek@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 15:49:19 +0100
X-Gm-Features: AVVi8CemKf_lxAexYgtSsYH1dl92XnW4W0vQgF5o42uyydlYUN3ajK12BHWnobQ
Message-ID: <CAFEAcA8NPX2uARh-OriY8geKB-a67A_yc3LGCLB7G=-NWDG+WA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] hw/arm/sabrelite: Add FlexCAN support
To: =?UTF-8?B?TWF0ecOhxaEgQm9iZWs=?= <matyas.bobek@gmail.com>
Cc: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>, 
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>,
 qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 Nikita Ostrenkov <n.ostrenkov@gmail.com>, Andrey Volkov <andrey@volkov.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Mon, 22 Jun 2026 at 17:08, Maty=C3=A1=C5=A1 Bobek <matyas.bobek@gmail.co=
m> wrote:
>
> This series adds emulation of the FlexCAN CAN controller, version 2,
> found in NXP i.MX6 series SoCs. The controller is integrated into
> fsl-imx6 and the Sabrelite ARM board.
>
> The chip has two FlexCAN controllers, but the Linux Sabrelite
> device tree enables only one by default. Linux kernel with both
> controllers enabled has been tested to work properly (using a custom
> device tree).
> See docs/system/devices/can.rst for an example of QEMU command line
> invocation.
>
> More information about the implementation can be found in my bachelor
> thesis [1].
>
> Changes from v5:
> - fixed buffer overflow due to unchecked input in
>   flexcan_enabled_mailbox_count
> - rebased onto latest master
> - Link to v5: https://lore.kernel.org/qemu-devel/cover.1781111270.git.mat=
yas.bobek@gmail.com/


Applied to target-arm.next, thanks.

-- PMM

