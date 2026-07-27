Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042F6C531D0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 10:05:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woICr-0000E1-Fw; Mon, 27 Jul 2026 06:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woICp-0000Cc-LO
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 06:05:07 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woICo-0006GV-2v
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 06:05:07 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-664ce3000e6so2158819d50.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 03:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785146704; cv=none;
 d=google.com; s=arc-20260327;
 b=J44W81WePv88Pm+dqG2K4XEkn+N7sZGwgxyfRmbbm3C+HdTsDsgn6rwI7xISG58p24
 7yVquNm5PRtrODjYsJT8iHvIPG4LR8OxPUtlkzZ5KcwTHzdhTiIuQV3N8qMqHb2GryWC
 tTDZdBnhAabBkil2dtVxV7FwJsppc4detIRrtm9oW+Y244IhIVYKJisGLays1H/+kB+g
 GpSAcXikw2TMkD3RBbjlMFgsTQjmjJO19Xk3UUwyTXOCSaeXW/zuGKoflsS4Qyt17T/F
 kzdpZs0PGYKSorcLlS4ZF9HRTKrzktg0CcqEvKCbt6xwA5UEaSjBB1tIcuPZeZTJGp/F
 V9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Mzk1OFpsPkIMuuBU6ZG6dN6///TBASQuFccmd8wYFlM=;
 fh=oFz7qokWGlzzOTDR+j6p7omgwgXAgA20GWKHNvALQ5s=;
 b=MB2MHS67AWc3PUVetUuBoZBewhGf31uLzTHCDaeEWF1+a/t4aD/e0RyCqRup+jSM8h
 3DFw+P8lp1wZprc8hao+wxcTDvVeE9olikWgs4qj22NxD6dZayXjjoX2/D5LNI8+PQer
 bRZCcAbc2y89s+JCCS4de0mP/9czjhTgEDr8xQUoqHP2bo8wj3RMY2zChxpW9CQTCyNM
 CrC/V0+hktAaWUZ7VSW8ptswR7JpgC96SPtgDZqD7Z3XrpIKmL/uVwgbA14CURbKMpBc
 bR+fbRzlHrBWm1RdYi/P/IXp2hBM7V6bNeIK7t7M5EEBKDUwkyGR7DAIUEl49o+8ZW05
 g9Ng==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785146704; x=1785751504; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Mzk1OFpsPkIMuuBU6ZG6dN6///TBASQuFccmd8wYFlM=;
 b=yXuZSd0u7VBCJmhxzayqVw4gHuvC3w3plGmita8oNdHeKv8fBMZ3T1IzroAW1wOYGh
 My10t49K9j2pE0Cpb/qpfvoJ6NPxeSrvMIN6xiJaug7haOMHp5fG1BS/fkNqSz0vJ4GZ
 +wGq2+9CC9FNkiKc0fcOgEAlgr25q/zj85WUJRJwFUMbi7W3OeU+LIr4rzhjtAl8Hffo
 TezdeEpliKYgsIYKQdqz19w63GnD8az76x5bq7lzRLLijyeCShuegWSm6iE0TtRXGUl/
 cNFgnMUstfB/K+mRTFBeBx/lqXOwwUqaEdFP/+a++aS3jmDaK3VG8+B5Vd6KGb+csxGC
 OPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785146704; x=1785751504;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Mzk1OFpsPkIMuuBU6ZG6dN6///TBASQuFccmd8wYFlM=;
 b=BfzGZ3my+bBrJ7zUJq6JVqwEYlg9gwX5dWh1/o/TRnTwqKzwQlEzJBYHDVAmeg032D
 n4fClHbjcA1NjZREPXD+Y1VHr1/tyGWzWspq1RAnY8WLEhk6qm2R9L3YZaVGgaBF4Hl8
 gmZrKNDxDRkMMgwL9/qjGTWCE8vRrDXVTbQxuIuVqhD1zgOooKZYQ++xiM2o13ndQAdt
 2fD1xhc9Ltyk4AOWw9hn0+DMKGFDxi97StIdiT4TT+vE+foxULxKiRdZrGnxTzSykx4i
 5GCW1HYyjvuLzMMzhtdip40xdm/TwlsQFoGisagcHWfUNXo40x6pf+dDMKVfm5qFEWaj
 9K4A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr6lAkULD+4m6QQdwxjRKG2iCOtCeKKa/hRJyx/MbK/i0O4AoaXjjVA/MZqAKnOGJK2OzHEmRAhVA==@nongnu.org
X-Gm-Message-State: AOJu0YyUrA/Gs7B66W4z0knl91R8KSe7NFT/+OPbr4fdUc+qFhnX1dfA
 M2ouFF8cJAe14MUsGxTYRHbtVU3aFHUm7MGMsnmOX7FV+g8kxMYJbg5d1sBYALK7/RJ75xHOcdy
 7H9fBWzZSS0nJR8yKgYyKyu2wlAWv6d8oOGfK7k+35g==
X-Gm-Gg: AR+sD128UD5i0FRaV6bCrGC/rf92Qozt8tb4g7e6nmm1RgdWQh7+AgCifUvNpkUI/id
 EuhZ0fhHMHwr+uJeY+r+C6KczNUfpOdin/gMfIlX5hSbSVnJe3DAEY7P0SQRjl1bD1vH3qftquR
 6ly8cKxp3PyPqCMVmHb0p+NEoIJr+NNJE1ACP9EJUzvXAyVzYkzag0vX/YeM25KPsTE6RSyt5LY
 2a3CARSdZIYm9baJIcjHO5wCSI70upuwoxmJJY6JCpzBjs/wpWOuX+yvqW2/pmGMz3o4rVciclv
 xvBIW/ne+/lfltKWF28plIP8nUAvOaIhXsaCRZn8cafr+Q==
X-Received: by 2002:a05:690e:158f:10b0:668:9b2a:3f1 with SMTP id
 956f58d0204a3-668c7cb9e15mr1587486d50.107.1785146704413; Mon, 27 Jul 2026
 03:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
In-Reply-To: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2026 11:04:52 +0100
X-Gm-Features: AUfX_mw0bvpRXxcQLiKs-ag9eUHn01oMQV0PoPhBGsrxZhawTxtJes092BCM1_Y
Message-ID: <CAFEAcA-q5ihYpgYtEosQ3+SgbMdw7e7=xk4motLFL-A==g1k0w@mail.gmail.com>
Subject: Re: [PATCH] fix BCM2835_I2C_CLKT
To: botszhuang <huang.botsz@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@mailo.com, qemu-arm@nongnu.org, 
 sef1548@gmail.com, botszhuang <22925483+botszhuang@users.noreply.github.com>, 
 botszhuang <botszhuang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Fri, 24 Jul 2026 at 13:51, botszhuang <huang.botsz@gmail.com> wrote:
>
> hw/i2c/bcm2835_i2c: Correct CLKT register offset
>
> The Clock Stretch Timeout (CLKT) register for the BCM2835 I2C controller is actually located at offset 0x1c, not 0x20.
>
> The previous incorrect value caused the guest OS to read from and write to the wrong memory address when configuring the I2C timeout, which could lead to unexpected controller behavior.
>
> Update the BCM2835_I2C_CLKT macro to match the hardware specification.

Checking the datasheet, this is definitely the wrong value,
so the fix is correct. I'm a bit confused by your commit message,
though. The value here in QEMU can't cause the guest OS to write
to the wrong memory address, because the guest OS doesn't ever
see what we have defined here. It has the offset hardcoded into
its own source code.

It looks to me like the effect of getting this wrong is that when
the guest writes to CLKT (at its actual 0x1c offset) we will log
a guest error and give read-as-zero behaviour. That's not correct,
but I expect for most guest OSes it'll be pretty harmless because
the guest probably doesn't write the value it wants to configure
and then read it back to check. (QEMU ignores the value written
anyway.)

I've applied this to target-arm.next.

thanks
-- PMM

