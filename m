Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52D8C44500
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 09:30:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgff0-0002Ip-1v; Mon, 06 Jul 2026 05:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgfej-0002Bi-Kh
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 05:30:27 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgfeh-0008AX-D1
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 05:30:24 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-664d35b4777so3948114d50.3
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 02:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783330222; cv=none;
 d=google.com; s=arc-20260327;
 b=e9NGLv9Do8n0zHCrzoX7bQrGV+NniMGj4khMMdrvgD4z1X17iUFRRAyP+eBdJO41D1
 Lu+hzjpDEKyRdnIfB4e9z70eLr+SIaLr/1AmfKJOzUBYzfgwtDCaSo+1NZTc5h0D7VBs
 ZHvyBuAgqPtv3Ww9V4ECS+OIBb1mghmIcvxLuQ+p32QOQHhTuj/YE1q6dGdScmmiXXMw
 MRVAxjKcYg0mFFU4n5sCCMhsKNbnp9gLtiGdvSlIySQa3vxpzw6hanBfsjW6JMWPPTkR
 S8dY2brVyrRjr0SUuegZwkvLjYYjTjAbgH+VbwHbl/pJQqf1l9WHS04OGGDvNS6ln+gi
 9UvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1laCnAkCmus+RdL3WBsb/PkScrDxrayjVQoHHNn4lhM=;
 fh=/uAYs5c7KNBEHbpyTPn38Dh44oglcXXvx9Tt1LUlB3M=;
 b=kFhuB9NFMLraBUrDa89WUZOjnxssHS3Ir6C8sO47OxBkJPJqmletGLn7VtVmXOfAcq
 DOs3rvTBBzH/BgvOyFPU+FT9Bo+X8Y5cVKH+m5aEQ0DU3ztOJLWfExRsZZzuA4fQWh/7
 bnwGSypIoG1pOU/V1VP6q5XU4Eh2tcoSpptophDkQEVeAks6WD/NYyCbKq3V9Rhv3uWJ
 y51sWUpAD/srbJfR/Y3zwYWxZobvt5PbIG9Tpy8PrfKsI9K8M19nnA6WgBSulmxOMb/V
 GE1QJujR5K2PSSlkdQHWwchwz7VJBl7xYduk1JJOIC+neIAGJk7Mx1+7SS1T6s/JzFst
 2W3g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783330222; x=1783935022; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1laCnAkCmus+RdL3WBsb/PkScrDxrayjVQoHHNn4lhM=;
 b=kseKYH6cMu3hRvcinoffVnpu6t9eZyO5VrSU8kArRl8zVuWNaZKlVjW+TES0yzKvjn
 z5vfokhfhf2r5oyam6hO9JImuEpZ3V9RHuBnPjUfM1GfWhGlXlW1xt0HhgYo1adp4bT7
 Fma/H/gmNLyJDxqr8Y+PNJ9TTJvENjZrjkAhDw0TsDTTjyFCMjWAjSpORioCH5TrsWWM
 TqaAAeVIsXpSfyqj1dxjtnEyiFtBmIj6pQTVPgDLAfgYYp7aFtbrdc0rLpyD3TXN6szS
 SEMBBwxsHUGLTux6iJ2hNoljj5YQUUV3osmWNgzyml6NV0Im+ziHUNtF11na4Rxeiot/
 LprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783330222; x=1783935022;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1laCnAkCmus+RdL3WBsb/PkScrDxrayjVQoHHNn4lhM=;
 b=Fa8lxd4ImO1402zARLsvL4AXA3Dl4CXP4PuTXtloBcsM//NGbfwzv2HdptZL0xy4MD
 bqP5l320V3v4WMi8rBUK5CycV/c/f8A+L8/Pvv/Pqf1MCri5s/Vu1WKdGSuZZHiZp9hk
 KptVN+BtbjdhSOO4Z1Og5z8duSVXOADXhR0NYcNjZQKu+4YFt/YdcgnK2mhHXMCZxb73
 7QBmB/Qa0p4NGOC9/yybsDJYpjNLcGjPGpLDWhKhkda9/vTogAz+6nk/fhb9VZ4skAd6
 NEAS8hpScTnZeOqaoLofYBU0UOkMpu3mfPuJvYKod+JzKOOxHq6pfMXLlJ7AnVDW0gmw
 JWcA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrcdCHqgT1qspl4QIDZnhnzfJRoYKrksmC8Mj0zdQPBqbR/Sm5PLBj/fEBrNo2P8ZFeR6MzfIad/Q==@nongnu.org
X-Gm-Message-State: AOJu0YwlnL2T7ZmIo/7HqQmfVcIJAzh6UcFgVsa2yZXk62ETaFQoJ7CB
 LdXl1z0gkkPW8nnk8b2inv/jnvKmqmTPKQuydqEj7YhbjbiQnf2CSm2ttlne+8TQ5080MXK/VQe
 h+CrODZki46K1GsUaAjbINtI+tY0jv5SxLzfS0yfC2w==
X-Gm-Gg: AfdE7cnWUIdTosPbxFRMjHm5AIQGXuDkO0sFBU3ye31DCOfsOTPc7Bbk3xwVRfseyIk
 cvke5jAsaiO+jGUWg8pNngcC7Z6qDX28GqOyZqm5vBJ9n6SYppINgtnIpJzF+Wp2s4AS3ExAyzL
 S2hkuEs3B5/yF8rrSEhePQKrWttzuessjmqPZEvT4OEBjAaylGhZMJpMPLKegrUy5CzZbsRJvoI
 gW8WpUB/Jep9H6LcyD4hpz2OI488M+GLGFpkme8Ad7L3+6t9JY+t8P807mX5QBZ4lia9h7JfYiM
 w6zpaGTD+n+P6yfSQ/yEjTpL/HH00UnWiqjktcIqmLPmUFJDPIRZjx8Hn5EK5KcQ4+E=
X-Received: by 2002:a05:690e:4594:20b0:665:9b8:5511 with SMTP id
 956f58d0204a3-66652f12b8cmr7455519d50.55.1783330221096; Mon, 06 Jul 2026
 02:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260614222131.5795-1-imaginos32@gmail.com>
 <CAFEAcA-GGP6aALn4Az5By31q1R3d75Mm+p_YXN0y=tO3GxDYrg@mail.gmail.com>
In-Reply-To: <CAFEAcA-GGP6aALn4Az5By31q1R3d75Mm+p_YXN0y=tO3GxDYrg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2026 10:30:09 +0100
X-Gm-Features: AVVi8CcnHyWnWA_521BYg5tnYcX-wz5ImmOdHDjWlLfTsHur1pAt6keYnGyTYZU
Message-ID: <CAFEAcA8zLzVLzTq-EJQ9+OpxytMdPuFkUbOF7xjmY0JrhPhYhA@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c: pmbus: NUL-terminate strings received via block
 write
To: imaginos <imaginos32@gmail.com>
Cc: qemu-devel@nongnu.org, Titus Rwantare <titusr@google.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

Ping: Titus, could you review this patch, please? It would be
good to get a fix into the upcoming release.

I think on another thread you said also you had some patches
to upstream to fix the "guest asks for data multiple times
but never actually reads it" potential issue ?


thanks
-- PMM


On Mon, 22 Jun 2026 at 11:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 14 Jun 2026 at 23:22, imaginos <imaginos32@gmail.com> wrote:
> >
> > The PMBus string registers (e.g. MFR_MODEL on the ADM1266) are writable
> > by the guest. pmbus_receive_block() can fill the destination field
> > completely, leaving no NUL terminator. When the value is later read back,
> > pmbus_send_string() calls strlen() on it, which reads past the end of the
> > array and returns a length that trips
> >
> >     g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
> >
> > aborting QEMU. This is guest-triggerable.
> >
> > Add pmbus_receive_string(), the write-side mirror of pmbus_send_string(),
> > which reserves the last byte of the destination so the stored value is
> > always NUL-terminated, and use it for the ADM1266 MFR string registers.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3388
> > Signed-off-by: imaginos <imaginos32@gmail.com>
>
> Thanks for looking at this. Notably, the bug report in #3388 makes
> a completely incorrect claim about what its repro case is actually
> doing. The repro case does the "write 32 bytes to trash the NUL
> terminator, then try to read back", which is what this patch addresses.
>
> I'll let the pmbus maintainers review the patch from a technical
> point of view.
>
> -- PMM

