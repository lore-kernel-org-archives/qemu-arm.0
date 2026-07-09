Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75865C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 11:01:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whmUa-0002TZ-M6; Thu, 09 Jul 2026 07:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmUZ-0002SW-Ei
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:00:31 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmUW-000547-WC
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:00:31 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-664d7863920so1539174d50.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 04:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783594827; cv=none;
 d=google.com; s=arc-20260327;
 b=myOk65rNdCeOMs/kSrsUiBajXmS5B3wSpLB6PY71921CWYiWi1EIsq0sw4GqAXRhUz
 8mV7RtfLS0L7Hjk5JqpOgngAw6Ji84zNQtxJX5gi4JooLRzBOVUVf10pW0zZu0N4VmCM
 /ngf4lgtT9jMoX+Xnc9JrSISvMwQeu88MSdhYpBtt+h6Ua5O3tOlxGB+2MhjlvCB2P7N
 l80COem3bV+sBChT7vqtCIeEVwOIflpt4fbkhYlx+i3BmLOoJG1e+2vuT3vfH6JqnvUi
 dNMW/t7jqA7MYnCIt98hpEm/NnrNs50UexTQRYsXIal3uYel9XFwIqKczYCE4ZfOmapC
 C64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UcrkeuriwESCkax1tc2sXwJiv1kMdNza6yhe/5MRVQI=;
 fh=ykr1JYkzNFh2c+CVgNwNkI4GY8RIoM8kz9w0pIC0lrM=;
 b=TJuEhkdB/EFLIORvStabrh8j8zufKroqtgD0B43eKxxk0fZTz6C5jFsTNPxfBW4Ghl
 R2FRGkv1II4IWureyPIAxtAbqrjhfOvoinhyAma+xMPoY/PKktl4upQTvI0TMZEZ0KnG
 48SSfdy/KJVohzDCXzuBlRETlfR4vkIeIQSgCliRkkuA1ftYiJJ7a35y/JUa34166kZq
 s3cjYZaeEv64rf9o4m4gN1FAphWMSjFtwTCkzFcNHKGjgNse+yodlGfMf3UvOOHEnYV3
 Im3mToVgnCCIQAp9kuPgBgN/LhNr03iq9YXw8fcQNnACiV3D05OE5+bkjFPEniDmNtmV
 cONw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783594827; x=1784199627; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UcrkeuriwESCkax1tc2sXwJiv1kMdNza6yhe/5MRVQI=;
 b=ZP2EkGDLmaQTUt6FyLK/vVQE1y61wogPKrI1FJevLDtOXxg8C/Tbt8LbaYD8UmjXdo
 T9X32s29OHN0m2xpO7iRYEZfD9xutXXFvBY5Ff5hoDygNSxxWSWj7fpBNXD+Z5ACjHbl
 CnLhF5/1tRrZF8o5YDWz1JgSK0MrZEIvG2sZd3rVVCxm+AbSKKrFIwdu6mv+Lq0RppQz
 jU5roKjBjfjh5hrA05uW5etmpdosPNGN89UUCBfmf+piHC/6JKn8Nx/UNm+0DHlmFfe6
 TdkHosF44EgpR03jNRtPKtO/A8qbF6ie9UsSu/i9sCEcTvI6XBdHxIUfI2PblUnfvHmx
 CXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783594827; x=1784199627;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UcrkeuriwESCkax1tc2sXwJiv1kMdNza6yhe/5MRVQI=;
 b=Bm6IfUdwfmp4ckLs0UI1ZbiaohgLqUTrTZAcvm76pGq22FQjEZj2gBaWMojkp2mdpl
 qwB1sP1RSsY5LqT7eksjQlbO35nK9Be8NjTRctnYhpv07EC8m2EP79HGLnzKG1ykZH/0
 6HPiU1xDdIqHPcW1f4lwZhVsOV4cI/rQz+yqsihZDYk0fJsNgW1LEBT5TTVHbdtPz0xz
 0KQ0gjWcbnzhXGO4SepWwEz5RkirCN4pdYl7kd9Y3MlC1HIzEXGfn9JDINP7rHgVbxru
 7GK2pcNtKkbYJKJPRXxb38te5+73g7FiVX0vwUx/MjIS50DXjdwmyKm/2qrAudGIqrHm
 xFiw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoWKR4hgtgSD7WmQbNptW2+u5Dm4JOem8EYv64DydWmX1heeMWuGw6pd+WZSjFCYEtGjl+y1GMSSA==@nongnu.org
X-Gm-Message-State: AOJu0Yz62Dip2SZUuEfU+y2JylAAAPOiAOCfTzVwf8UDrJ0IprmX1KYf
 L1gLEY6puZFmV4ZCv0GEa/yX+AmgRCvl9P+hTAfnk5aQAem8UAWrlfvC/UbKoeO0ygUtCEUEae8
 QBZbljH5sTFhMHg2BNE7nTIkSnxTRye/gizqOiww1BA==
X-Gm-Gg: AfdE7cn2MyuXysrz1Sgl9Qy0Yqb04nhWDB7w7ZB86JB/wPvod4iO+HiPNI4AhfU/kh6
 ihBn/UBWyhr1pmzcnNzU0LzNbkUbHcqhahISkrSvy7YfZzTH51fL09UjRjJJBwlvTW5HMKF1Jtm
 Q5GM+ak1WQR3xo8/JxvVIkG3j2u6RnmDwfYnNndbdstl9//I9P6m6TvKMcpMQ89T+O5m3w8imx9
 tbJI0N9aDfwYrwGwjsuG+1+BtXEJvbITVHuu0gYH5KqBZ09EYKOCL4okuGSXGuEJXP2WmqgWg2m
 gW/k2y3Sx/AaHh+zTJOXla7qZ5NpbVE72mVRqxwwrU3u0CfYTDj2I+OM
X-Received: by 2002:a53:cac1:0:b0:664:ae69:230b with SMTP id
 956f58d0204a3-6679f28b918mr3997311d50.72.1783594827380; Thu, 09 Jul 2026
 04:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260707145407.70287-1-corvin.koehne@gmail.com>
In-Reply-To: <20260707145407.70287-1-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2026 12:00:15 +0100
X-Gm-Features: AVVi8CeotFHBKi58-Vligna6L6HXiUYDiOmZw-JiRgR4ZqG0i9hwZQs9X7YDQYk
Message-ID: <CAFEAcA_nHT9qW7ofvay4M0Bo_LNXKDumEH5ntuYhXEcPYgzeTw@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/zynq_slcr.c: drop duplicate reset value for
 DDRIOB_DCI_CTRL
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, YannickV <Y.Vossen@beckhoff.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Tue, 7 Jul 2026 at 15:54, Corvin K=C3=B6hne <corvin.koehne@gmail.com> wr=
ote:
>
> From: Corvin K=C3=B6hne <c.koehne@beckhoff.com>
>
> When adding a reset value for DDRIOB_DCI_CTRL in c8ba862dbfdc, we haven't
> noticed that a reset value already exists. DDRIOB is a 32 bit register, s=
o
> incrementing it by 12 will access the DDRIOB_DCI_CTRL register. According=
 to
> the manual [1] the correct reset value is 0x00000020. Additionally,
> c8ba862dbfdc won't work with a reset value of 0x00000021 because it tries=
 to
> detect a toggle of the reset bit (bit 0). Therefore, we drop the old rese=
t
> value and keep the new one introduced in c8ba862dbfdc.
>
> [1] https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/Register-slcr-DD=
RIOB_DCI_CTRL
>
> Fixes: c8ba862dbfdc ("hw/misc/zynq_slcr: Add logic for DCI configuration"=
)
> Signed-off-by: Corvin K=C3=B6hne <c.koehne@beckhoff.com>



Applied to target-arm.next, thanks.

-- PMM

