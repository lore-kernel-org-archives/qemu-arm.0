Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA20FC61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 09:09:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzW6n-0006qj-HX; Thu, 27 Aug 2026 05:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzW6m-0006pB-UV
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:09:16 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzW6k-0003xS-13
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:09:16 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-836c8bde2dcso27157477b3.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 02:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787821752; cv=none;
 d=google.com; s=arc-20260327;
 b=qvL43unZ4lA0+4st8+W3KGKgaCw3MvE2DkMbD/q1di+m6oJyocQ0e8B6+5GtXJ6i41
 Yw4iaeheY8NT14ba7rZulkLrxR2DjVG5ojp50fzbNtSri6sagqQS2qr1Cm7mz0Y22l3i
 TyWSXfQ5m4ilDSEhJAdVzlOg2GP7ple6JZR+BRN/YFtUYJefncJ6vl6gnt9q8A2753Ou
 W+jrLEEEFtR6nLIID+AkSdLyo2iHk5J/SJDLsZ9GFlJgvy/Q6oF5V4GkenuClBffcpNq
 Tzcdrq/BFHJd4nA86c5a2BYkMcRnShZ7ULfvKS4Mqx5QtfwyyW0fA2VfdXLxIZeuWO9/
 9hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nNeSuIzM80Ev2zL1czOqBtBwyX2vwQaGwFcIup6MpMc=;
 fh=e2yhL/wfN9YGauTuySouv/cehqwq9hhbe6pEoE2ibQg=;
 b=QTG+ZcmhwBhrUQbDZWPwlxQIwGmnyMtJ5TYWmNy3U2MQy0abSczVw6xf5k8bPqQKEG
 dGvPGPK1cRXIXbx4o/QBEQo2qGz83tD3XfYukc4JWioXkOc7arrj7/V6R1jXMHPbcm0O
 Lyy41zRMSEINY2+FdeDhtSh1lkZsZtax7i3FDaN/pNTwXdeQ56GhG5cfz4HvfVtLwDsc
 uHXD00ypePLxhcDnxCj/fGcZBUWGzmIdCavgJ8xZYze5OGplgv00RMAZ798U3bc3ZFv3
 lWFg5grt/BUNYD5TFi4MQTfgLGlmQF3pQgZbGZ7smqB22v4474lOHzfQdJ9s0IcE5r6g
 dK9Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787821752; x=1788426552; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=nNeSuIzM80Ev2zL1czOqBtBwyX2vwQaGwFcIup6MpMc=;
 b=yFOcAJBWYMt4NMqIcRvdb6U69H3WAaeGJWb753ZKMREoLbf4axqrpeDuTsb4nSof6H
 6fTVucgffgMhv54GOc4Z0FTM051m2lk/zLjo1tlhRcCeutdGF/Z0okHEEfse2VKtaYSr
 U3o9g785pJGSolWgk9gt37QKLCyxppU3rGh33ZbsIqro0oGEB7Tg+LkgeKGWiSLq1So4
 dI2j3oDf7c3bde3EOmbygDBw7BtMXqBSaR4xIPrMdMZeFtGTa2PoZTAOIzYU1yagMLJN
 ENFy8UmA90h+LcXR/Mz/gqzw2DHEn6m5bZs8KuVMPJgtEWmLyhf8/Y0NwE1zPkkrXXKJ
 hk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787821752; x=1788426552;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=nNeSuIzM80Ev2zL1czOqBtBwyX2vwQaGwFcIup6MpMc=;
 b=ski9PKDKdgxD/8r0MzRrBT6VTyZJMzKAQhJYQ7zxmEhLd/i/fSKNnFjgIr6TxOO3yc
 Cm3YypNL3XwqXBt5Qgj4eH4DXKxT4nPMtOqXCwCeWed1qhFvDntI9090NlqC7RwetHx0
 M3DSilA0hmXYOMW0uxQP06KZGSgKs8c1l2P7m77l7U9Dr63rUeqqaZs3QSuVZo0z7bnK
 zFeXjNi8X+c/SX5+qQJi1nAObKFgWQ9aaLIGSB5G0dyc8LaHJ36Ns1aSJ7oTXoYCjte5
 HVWP7YRYZ+WMyUqL6i1+1vaI8N5bsj7pghLBk8HclySnmGHU/Nq+nMajVmgYjWZ2riWr
 tZUw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoM4XD4kUE+g0JDT0kZpdvosTwJMj/iziZVgj9CclfHt+G3HZsaHdNyt6iR5Z4ZQEv+NbKutn+Bcg==@nongnu.org
X-Gm-Message-State: AFuF++nG7Rw983X6PtSoNiqijeX7b+/7kW8ItMWfUbxj37Lgty3WRfS/
 2dR5xTlbg7oh20yPeuwywMtHRI/z6CRZ143jhuajSdUmHQ5zmKhoHuRWsyoH7Dk+IB/COwO5iJi
 WME6RJPBiCVEaJZMt7NQEL9eDyvGIcW0ZYTDeQyFz7w==
X-Gm-Gg: AR+sD11axCUuAgLwEmW7TDT2R+mP5EPKpNc1HOmzvL1z7pHd4mEZMdnT/8NBvbO+sVa
 mYbNmUlgQw+4Vvtx0pUedsSGUQrKyQFe6mgwtl0IZpZY31hx4F6x0D/TRmA8FRlJBGF0Ippgg/X
 MI46sthYxQiSIBc5hvqWlTjnz1eLptzFAmwro1DoALxyRb+PavBsX0WcfS3NcJzAIlVqIeTuYX+
 90tFw5V9r9cTXACNqkszinfm6bMjFMlx+CAzq33wpGUiPsFfEhazkP588FH4PvKSRqLd/tOh69o
 aJPzGXKMS5f7ML/QPMXO4NKZXiVB9F4ZqYVHwCQ40RAp8flLW1yh6gdDnPXj4hwRH2doUH9l9RU
 Q6ecs31vFaU/1UmvmIr1gUbP5lT1aVjniqsoktIg=
X-Received: by 2002:a05:690c:c50f:b0:858:d554:79e4 with SMTP id
 00721157ae682-858d5547cd3mr37363137b3.20.1787821752523; Thu, 27 Aug 2026
 02:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <20260825040452.1322251-4-stephensportia@gmail.com>
In-Reply-To: <20260825040452.1322251-4-stephensportia@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 10:09:01 +0100
X-Gm-Features: AcwNN1Xaft9WTF2mwWCVxtI7CYhEOz70afodYE300sE0wIN3NECIiYZJsbmOtus
Message-ID: <CAFEAcA8h4JwFFxnTQwxgC2HPAE_YA8CnLSgJo6pdhFcJeLyGmg@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm/strongarm: Fix dropped upper byte of ssi
 transfer
To: stephensportia@gmail.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Troy Lee <leetroy@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 25 Aug 2026 at 05:05, <stephensportia@gmail.com> wrote:
>
> From: Portia Stephens <portias@oss.tenstorrent.com>
>
> The strongarm model intends to transfer a 16-bit value over SSI. There
> is no machine using this model with a peripheral attached so it is
> impossible to know what the intended SSI peripheral is.
> There is no in-tree peripheral support for 16-bit transfer, update to
> use 8-bit transfer.

This is the strongarm synchronous serial port; the manual says it
"is used to interface to a variety of analog-to-digital converters,
audio and telecom codecs, memory chips and keypad controllers
as well as other miscellaneous serial devices". I don't know
if it's actually connected to anything on real 'collie' hardware,
but if it is then  I don't think QEMU's ever emulated the connected
hardware.

The data is between 4 and 16 bits long. I think the intention
both for this hardware and for QEMU's ssi_transfer() API
is that the guest software is supposed to know what the device
on the other end of the SSI connection is, and program the
controller appropriately. If it programs the controller to
transfer 16 bits to a device that only expects 8 then things
will go wrong in both hardware and QEMU; conversely if it
sends 8 bits to a device that needs 16 that will also break.

-- PMM

