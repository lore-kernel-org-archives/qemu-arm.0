Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42349E7DEEE
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 14:14:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmugA-0004oB-6L; Mon, 02 Feb 2026 09:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vmug8-0004gb-CL
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 09:13:24 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vmug6-000222-9d
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 09:13:23 -0500
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-64b9cb94ff5so5819481a12.2
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 06:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770041601; x=1770646401; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8dqGZx/EFAffkySLafgnYrquJYzcYauYRJecbHx5bU=;
 b=tJ2L7Xl9ttArTFKypBg1G4tHw1DnWI2dADMwKxTlZ/6EN1WV4FTw6GOJcZ1rAmVoc1
 ubmMFIX40Hpt+qjc3TF6sbyCQ92Cxbwj/mpHArBWr0dw5aPEek+765AuDxwIcl9B9qTV
 MLCYhBFhTq4QqnHLCY4eF/T+OpTrBPYjuiXLLLyhxjl5klicnRE61XVGQv1ln2flYjfD
 4PuuKXthF5VTSjbVd3uZhwbTMYviI91SdDdw64/IIoR+GFqUtXj7oaTzMI//sY9tevPr
 1t6giYUGiPsIKfaq1KlbnmF995o7/TPihcbWyVBoi6t3U6K4VeCv7sTPfMkfAlJ+Va/w
 RGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770041601; x=1770646401;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t8dqGZx/EFAffkySLafgnYrquJYzcYauYRJecbHx5bU=;
 b=FUVu8e8ucrDtgvbkrMPwb7e+tzpxzGhzm54qUlaICOujJPRLIbrUbJMVIlXKb42prU
 9/cIEPIe7t4Hds8HSZ6shafkdJ+2DxKvqKSp7N9waw+WcoAZrVt0sHm8UzHcACXfs/IT
 kZIUvPkD5djgEu7Zl7z3+RWBIWFktQbKu4Vs6MqX3SR1qpHJvO3ZyTEuS4RgnYFo+/B0
 wHXMunPTeJ1FJ6ol5/H2rgykti23ko1O5WBDgamXYIlOEY2WT/Bj7n2WabGZKjW2OKx7
 z7AF1Lmz/JYK4AvPVSFQexG54HG2BNPpya4udyMye+KmbTa5XX+b/quxUzfL3aj1dz07
 L34g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJP9JDjRRR8TPIPda3HNR72Jg9VgITKhrZNwkufWO4tdh8jER03tto8n1YPWrageM6ctUe+Ajq2Q==@nongnu.org
X-Gm-Message-State: AOJu0YwfPuyv/Nu0N2gE5yKJU2i32+gQ/fPKfKB0fQ1+oGtTwCwrxa9V
 VDkyBERB7cpXC4RP5wofOUnHtJSNFusTOxLcowfUEVXKaaybcBwmkSlWmUJXSLrZLg8=
X-Gm-Gg: AZuq6aL8hOCkfAjchylpafJz7+K/8AJtpoGy/Zx/z/3EDnyoKvFJZ5egkhWOMOppMqL
 K9TYoVn4TzDexHylDysGTO5qU9lAwNuDqp8Rh2Tv2DMQ8IUTYOGwNulxCHCYXKIMAdRIRoae9Ze
 kAwLOor+8rUNq5LzxaMo67H7qoKqkX3NjNR6caL1UFSE119izJZELotPXhTERAsmNWqMoReBbTC
 1I0LcGK0JP5LXDCKfj50c+rRWe9OThW6+kBCS2cNUNeEGMEfwUwCF6dqmGn6psHiGrUqk7h0uRQ
 AziciwJ1iE1SvsNWjnVxElwP+X2yV6ME4IY0cllUVGqSFWF+yP1nfQv7miH2Gc3JYwHKFOKRlF+
 bpyN3miGpun17liBNpZUXyQ3gVClr6qnSpdyD9XB93lAn7StAtJ16+QrAxJh9x66NOsyMIIaUhM
 oS6UDte6E71s4=
X-Received: by 2002:a17:907:72c5:b0:b8a:f225:ede8 with SMTP id
 a640c23a62f3a-b8dff68478emr707232666b.41.1770041600706; 
 Mon, 02 Feb 2026 06:13:20 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e0901c150sm557746766b.69.2026.02.02.06.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 06:13:20 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3CF585F7D8;
 Mon, 02 Feb 2026 14:13:19 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org,  Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 qemu-arm@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Thomas Huth <thuth@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,  qemu-stable
 <qemu-stable@nongnu.org>
Subject: Re: [PATCH 2/2] tests/functional: migrate sbsa_ref test images
In-Reply-To: <7a92bfb8-447b-4c80-a623-3491303b1369@tls.msk.ru> (Michael
 Tokarev's message of "Mon, 2 Feb 2026 16:18:25 +0300")
References: <20260128105839.3487840-1-alex.bennee@linaro.org>
 <20260128105839.3487840-3-alex.bennee@linaro.org>
 <7a92bfb8-447b-4c80-a623-3491303b1369@tls.msk.ru>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Mon, 02 Feb 2026 14:13:19 +0000
Message-ID: <87zf5rnshs.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x544.google.com
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

Michael Tokarev <mjt@tls.msk.ru> writes:

> On 1/28/26 13:58, Alex Benn=C3=A9e wrote:
>> As the builds in codelinaro.org are going away migrate the binaries to
>> share.linaro.org. As the hotlinks don't encode the filename we need to
>> explicitly tell uncompress how to handle the files.
>
> I'm picking this up for qemu-stable too.
> Please let me know if I shouldn't.

No that is fine, sorry I should have Cc'd stable.

>
> Thanks,
>
> /mjt

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

