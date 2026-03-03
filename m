Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB5EEC1430
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 11:34:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxO12-0001HS-87; Tue, 03 Mar 2026 06:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxO11-0001HC-NZ
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:34:15 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxO10-00007O-1y
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:34:15 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-64ae222d978so5184868d50.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 03:34:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772537653; cv=none;
 d=google.com; s=arc-20240605;
 b=YO2uOPC8HC/paLBgvGA1d0VymBtv7T85Iti088NmV5si3J6jZudgbMUXAb+bg+Chia
 xjxkQnKyCwLfS/+c+k2RapaQWs63/3fQ1MZpYeWQm9oQVWEWW0514QD1IX++rRdcD9Sj
 CikTqs1XgmYw4pWYUH7fezz5WxrUE2LsJdcmiqnfmqMZbJjU1w1nZXcKW2jTC3jqtdMv
 /qylUlSvrK36qTrqp9RRuPsCeoFUsIqRwOJN9kUd2I3D1kCI3TxLyLc72i61zqJOSYrS
 A3LEONpI3X8KeehSiIbNFhDRDCbhBbJXX3//9pbNSWwiPjxb3jVDlQ9GPI7btBa/Vlp5
 yxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=0/wlMglP5++N8BWRPRlhE8xjZVP3ThLRbOhbAxWuTTo=;
 fh=CaSfi5GTNeHLrRfOUEuDNokXAoKvftBDLikGbobv0Tk=;
 b=HLRcZ2cP+WKKoJ7KFVCRgLt603eJzzZaNtXRkfX0e9qFL5rqDJe2UmIk0UqpyCVCpY
 DZrRIULsmOteRV4lAMYy46c8fOgE1mi/uBnnOQgicxGCH9GG9sGTywPjHkz8ThsGbWhJ
 zEqfOZbFd3RXjMmLN9BOGH8bEguKdGOChihXV2rR4Bur94VPe7HsWUiGLWG/2HWmlvWN
 T48ueOM+VhraGMEo5rKtsa7lod60oX2ok6m21QhNVB3RAb5QJqjvGopMf/9KMDvV98FR
 uLHUMhldzBwMaKifK+r6cPO+Q74tDBr5C2pqLZ5L2srEayJUrbfpfd3YZB+ca3nz1Ir8
 j8Qw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772537653; x=1773142453; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0/wlMglP5++N8BWRPRlhE8xjZVP3ThLRbOhbAxWuTTo=;
 b=rL2i8pW7UZuxHzCnGGPSqzIdazCBEJNYsEcQexza4r69+7SilS7faSDbfkMc6dBocx
 g9PPPEMAoAsIzXcZmNBoHGo34COjaEdgYi+haaXvhjQVbKHWqY2y6ZaSWxuv3XicnsCN
 Dajv5QjyFSJAPYlm7uMRk+Y4i7NsQedos3DolYplBZdQbnzHh/jCJcLa4BtpiYandgui
 3UoLrjRF9Jbn+723g6leOmue5hF4tQz3qaMUSOzmDeJmyH/qbc4m7VVoe9BZXtw4oJ4f
 F7mkkJ8VBILKb8z6JMOFqhiHlz1SNhynMKFJMcQpremARkjKputlIxzKcvERl1w27Lyc
 c1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772537653; x=1773142453;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/wlMglP5++N8BWRPRlhE8xjZVP3ThLRbOhbAxWuTTo=;
 b=Rv5vaJH2huzOp/FI1YCK7SR40apBF0c+STOeIElwkLYmZ4N1P2k2TZDD7FxVEMCzCE
 dv6OBtIPjnkoK8R2WNSzZYTz6Y9ndkxGZxZqqT47SMAIm3KGJmg0norKKLh7bsSjnnXX
 Qi+9TZ2Pz8L6XcwniN7Q8E0Mq/j/fHtmdaHERxiEmRTrIKXinJDZQKvoEgbVTI4r/5Ko
 VScsgNKGXLMf7F3a9uKDJYWQOi0LXFD/ZlMkGZZavDiId80aUbRYAQ5rqCAF44J+iqrr
 dtsrYN9Ok/bQ3iBSqcpBUg3/sPafVra2mp+w/O+ojH1kVcTEBT6X8ftPJmMUFY23J/To
 iaGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDXc0Vq1yTxaZI4pCIpNrFmrfPgKPiBU6YhwOrS9QjwRnpaY3FKhtwQNec63llK+0teyN9fhC39A==@nongnu.org
X-Gm-Message-State: AOJu0YzWfkmjph0uaI6NzOgNXHzOPAudHUMC7Q6uMbkJbwRAAmviSVIi
 XLZS90y7O7C0fMDhLv6rrrQWIHiM0bb3N9jGNAH2FXpCBQQx+2NkvhtuTyy5skUQlNZ7s+cPRZL
 Vd0RYPaYjodahRQ4ezfbPxDterx++PB5WCxzdH++siw==
X-Gm-Gg: ATEYQzwulQ2tlrbTZmsAurTxv8ubXCtNHOna3+c8K7xNLXiqbfiCikWn7rPMgpaQH4C
 FDSt/2QS2kfD6JZnb+AvdSMTXbAAnVoI3tUivpLb6CMpJyVa6jLQn+jzp5Lv74iJ7R+/G41w18w
 NSdjTi6Rr96ZlrUz9vTMYBLUtf+/2PEecK/zX2CcbhCT88Ytzlt86is1uJaqckTvz1tdsSjdY2X
 yzZTb+X5gYmGhZViryeyMfCtKmOme/mhjm60OO1UneX3ZIqUWjHo0obvEbWEtAoi+cE9f+M4qeB
 dORqd3y9BmqvOMI5rdOWEmlLMkwyo9COTxfgOTPoskWslu0NgT6cQ3mefQ5HfbaoryM=
X-Received: by 2002:a53:bd11:0:b0:64c:b5ab:7113 with SMTP id
 956f58d0204a3-64cc2328544mr9207806d50.81.1772537652992; Tue, 03 Mar 2026
 03:34:12 -0800 (PST)
MIME-Version: 1.0
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-9-shentey@gmail.com>
In-Reply-To: <20260302220254.1166849-9-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 11:34:01 +0000
X-Gm-Features: AaiRm51k_m6i7GX44xCmo2JXbikyXY2uWRlsDJ5ZliaQ_ROwM0fKpOitwMrEu5o
Message-ID: <CAFEAcA8+Xj=vgG5s9y1Mk=NcJKk2x6=x9RntR+3deaqtk-JThA@mail.gmail.com>
Subject: Re: [PATCH 08/12] hw/char/serial: Avoid implicit conversion when
 tracing
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail.com> wrote:
>
> On 64 bit targets, the MemoryRegion API passes an address and a value as
> uint64_t, so use that for tracing. Keep the uint8_t for reading since
> this is what the device model produces. On targets with less than 64
> bits, uint64_t is wide enough to avoid narrowing.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/char/trace-events | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index 9e74be2c14..a3fcc77287 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -5,8 +5,8 @@ parallel_ioport_read(const char *desc, uint16_t addr, uint8_t value) "read [%s]
>  parallel_ioport_write(const char *desc, uint16_t addr, uint8_t value) "write [%s] addr 0x%02x val 0x%02x"
>
>  # serial.c
> -serial_read(uint16_t addr, uint8_t value) "read addr 0x%02x val 0x%02x"
> -serial_write(uint16_t addr, uint8_t value) "write addr 0x%02x val 0x%02x"
> +serial_read(uint64_t addr, uint8_t value) "[0x%02" PRIx64 "] -> 0x%02" PRIx8
> +serial_write(uint64_t addr, uint64_t value) "[0x%02" PRIx64 "] <- 0x%02" PRIx64
>  serial_update_parameters(uint64_t baudrate, char parity, int data_bits, int stop_bits) "baudrate=%"PRIu64" parity='%c' data=%d stop=%d"

We know that the value being written fits in one byte, though,
because we just asserted that size == 1 before trace_serial_write().

-- PMM

