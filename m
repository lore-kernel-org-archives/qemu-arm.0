Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp645344wrt;
        Fri, 4 Jan 2019 06:10:58 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XJWTCQBFJjUkFcdKxp6piTtvBfxns6kw9nYQhGq0BAhQKQ4aoM9fXVz08SFJIh4SnAnnl1
X-Received: by 2002:ac8:164a:: with SMTP id x10mr50740922qtk.67.1546611058403;
        Fri, 04 Jan 2019 06:10:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546611058; cv=none;
        d=google.com; s=arc-20160816;
        b=d8eJf5mfRcl+cvOgmVlPVyBdXgoYMbRPB5okdcjjvrq3NTsOiVK/Zyviru76GVv/LG
         Vx5o35eSa3XIVbj3dLou8wzgFDprqNE2kgOnXCIRQ5jgu7kUlHdscH9+l6weHO4A0s3N
         OKl7YJ3+pTf4pc/mwRwpP8RXs+TGrD3jY38hjjTdEtDk9hyKpANuMzsuPfsusDjX4WHW
         jQwhzwFCexeS4tUXg25ojv7L1Afn78+F1e68Wj8ierTUodx6Lebs9ZtVKtYNXH5bfsga
         diSa6o4+JGONOlmsGLODCymGxweMUmMlCJGaFzepeOlxaYqfTLV27+w1B/nuit3YF/FS
         YmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=OVFS66i2sdz+giUWaPdON+sVkf2dHrjC2j/aX3RdL04=;
        b=MSb46433CtmmWRvMbYRPsCLGtLmViouuq0whRTnQdlu4ACwnNxkOyDrSZ7WC55ZHsu
         P3WYDlb1G7QKqrGBiWmL7iKcZS7QKLdBykti9CZOImowrEUk+2UrD8oIALby1Go+1YAL
         1x2+6QJTOxvrGdHwQtOtk6OK1RGbcPlPkaA/yP8Ok3JsjSG9Pjs9SG+w4a/XtsBgeAwr
         cFdx+DZ26ONgegUASm8+ePT3m/552rzmvwdl889auhVdkFSQMtDpGpLsq0glEvoP+k+Z
         1K/ObGQHmN+YkfEUC4CSryRSK/+ar+w/5g3PspNB2LhM5X/gpYucwKWxv5lv8qJ7IGr8
         UgMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OsiRWMRC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q123si291381qkd.203.2019.01.04.06.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 06:10:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OsiRWMRC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfQBd-0000Lm-TS
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 09:10:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gfQAx-0000K2-JH
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 09:10:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gfQAt-0006TP-Rq
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 09:10:13 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42637)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gfQAs-0006Pk-6D
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 09:10:11 -0500
Received: by mail-ot1-x341.google.com with SMTP id v23so32160947otk.9
	for <qemu-devel@nongnu.org>; Fri, 04 Jan 2019 06:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OVFS66i2sdz+giUWaPdON+sVkf2dHrjC2j/aX3RdL04=;
	b=OsiRWMRC6NDcXHNqk1uxiA2/BnK7OYmyikqMwIBNriLCyk7en18Sd10paT1MwsXNpf
	hPTgEGfe2sSgJ6OQn7T+35f45NnaBrctsjQXu2VRXTvQ0MJ0fkBaEvdFayrZicAOkinR
	xWMGbKNL8K6CyxL+ieb4N7U0al24+MyJRIqhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OVFS66i2sdz+giUWaPdON+sVkf2dHrjC2j/aX3RdL04=;
	b=tUIXWvC4RU7d2pvIoSi7dF4z58sGiRQCdxRDtLpHY4x9jAULwH2F+DyO6rqLKPd8Gc
	7/Dnj4Wr8XLUXMZyZq6XPlpibdfyB5C5abk8ANaZinIAgxJzL0coZjmkdq5U+rpj5wIA
	44CdsBctCSVKCOmVW7bTEfa5sW5YB72dS6qnXt2KRcRfrkwsyOMYbKQK3F2o7r+Ol3yP
	Q97p4tuRBhZGBoQH4UV9SreCzV9GZY6Q0WfL+klKYzhFqvIoYKiq7yF6QyPcYL97QOc7
	DteyMFZkDiot9cMRN786tOAfRiAdtVEYDwDn18fi4NlPg+RxDHVewrvnkCZw8Wisjei6
	l06A==
X-Gm-Message-State: AJcUukfE0N1cWKapTbZi8jhfVyW397tK0LEFxknOwhSe/vv2aY29wVF4
	EGaagu0YPE0K9iMi05Lsbxzrn1THvEHKf3u+1CkB/g==
X-Received: by 2002:a9d:6f0b:: with SMTP id n11mr16764267otq.363.1546611009544;
	Fri, 04 Jan 2019 06:10:09 -0800 (PST)
MIME-Version: 1.0
References: <20181209193742.7582-1-f4bug@amsat.org>
In-Reply-To: <20181209193742.7582-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jan 2019 14:09:58 +0000
Message-ID: <CAFEAcA_nOm4gcuF0NgYtqgAfB1UaW1MFmcRCtWwrUr9-X+Xe8g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH] hw/arm/allwinner-a10: Add the 'A' SRAM and
 the SRAM controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
	Charlie Smurthwaite <charlie@atech.media>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9eQDv7fVi18q

On Sun, 9 Dec 2018 at 19:37, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> From the "A10 User Manual V1.20" p.29: "3.2. Memory Mapping" and:
>
>  7. System Control
>   7.1. Overview
>
>   A10 embeds a high-speed SRAM which has been split into five segments.
>   See detailed memory mapping in following table:
>
>   Area          Address        Size (Bytes)
>    A1    0x00000000-0x00003FFF 16K
>    A2    0x00004000-0x00007FFF 16K
>    A3    0x00008000-0x0000B3FF 13K
>    A4    0x0000B400-0x0000BFFF  3K
>
> Since for emulation purpose we don't need the segmentations, we simply de=
fine
> the 'A' area as a single 48KB SRAM.

>  static void aw_a10_init(Object *obj)
>  {
> @@ -85,6 +86,10 @@ static void aw_a10_realize(DeviceState *dev, Error **e=
rrp)
>      sysbus_connect_irq(sysbusdev, 4, s->irq[67]);
>      sysbus_connect_irq(sysbusdev, 5, s->irq[68]);
>
> +    memory_region_init_ram(&s->sram_a, NULL, "sram A", 48 * KiB, &error_=
fatal);

This creates the memory region with a NULL owner, which is
OK for board model code, but since we're a device object
here we should use OBJECT(dev) as the owner.

This is more important if the region creation happens
in the instance_init function, in which case it will
result in a leak of the memory region after the device
is destroyed (see for instance commit 09d98b69804cfd9e),
but it's worth getting right here anyway.

> +    memory_region_add_subregion(get_system_memory(), 0x00000000, &s->sra=
m_a);
> +    create_unimplemented_device("a10-sram-ctrl", 0x01c00000, 4 * KiB);
> +
>      /* FIXME use qdev NIC properties instead of nd_table[] */
>      if (nd_table[0].used) {
>          qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);

thanks
-- PMM
