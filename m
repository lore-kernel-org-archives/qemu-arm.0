Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA1CCD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 13:31:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSapA-00033c-76; Thu, 28 May 2026 09:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSap7-00032m-E8
 for qemu-arm@nongnu.org; Thu, 28 May 2026 09:30:58 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSap5-0004Qf-LE
 for qemu-arm@nongnu.org; Thu, 28 May 2026 09:30:57 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-7c58e6eb2c8so129218477b3.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 06:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779975054; cv=none;
 d=google.com; s=arc-20240605;
 b=ktrudDtvPzTI1xifaHHvJzz5cbby8EK/r1vPb/HoJLBJyCtLtR386evRtzg4eBUyYo
 J+2Ac2YMp9u/q3DuYVAGS934dt6+lO5pdI9YWGsbjxXLON8qIo3VvcRCQQsUWDh3i8oz
 Rv/tofMNGM+ys6a8IKliN3fg6daswQb3RonRRZx1Hiub2aLmL9yQ0j7oDb+12a971ot/
 5oQZ3xjk5zZoRxYR3RrT+gTIxIkO0XjZTchXoW0pwna44tuhnAmJLdc9wFerRoc9sDlZ
 aKdczl9Ep395CjSxVfwdft0ua/73/PgzG3j6nlxS9aHoulU/NKBaogkY2n8WDn+tJBKV
 XYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ypOqJwt6MG32xNjPn5nD9rwsVdwX4MHa5fFYaSfgigk=;
 fh=oO/89jQQ5YDwzzZVPKzvAqi4qDhxBykuwjhDMKdtHio=;
 b=M6HfqxVeWogzfccmSfdbIgz21dcYC011d2RWy5ogGSynTkFMpG99cMJ5RFK9DYZBc1
 Qic4HWfTSksxl8XE+O93R9RGCFdLxM9y+Idhk+p+SN8GO6JvESgISLo6WmbQTslkLZmb
 ir2/TXyqjSifAXarYPhFxBFberRkpLRqVIkP9/qQyny0ZkJffv4mnBpjGHQF3dsD/Qnu
 kaukqQnIaV3AiTplqyaQ0thqhRFldQ5YvHxIBhMI9eoTHhq3CyrlNl6+7Jo0oN6Dvtd/
 fgnZO5c0Vg+S3swSLnyJfuY2Pxwc60ibozPNjks861/qhpBxdSaJfcO2vznqKntbtZ52
 MS5g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779975054; x=1780579854; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ypOqJwt6MG32xNjPn5nD9rwsVdwX4MHa5fFYaSfgigk=;
 b=iu3U1KksYdYy5vDjJwWiHSzo/y9+PIpqZMqVBI7RdUR/RG9sR/u0dYI61kCxLklKTN
 Z6bwLIeZ9ypIgq3iVDibQ9E19AEDXkPlWOYnW0aYsG25gDTZ4051O6Kdpwx1/9ekos9w
 4SVJFsjhCeqS/dfzM3h6X5ZHePK5UFDpXYxifp0Selnkd/aCGX79zI1RX8Jrin4kFyNh
 Vq4onUiK6ZL0B6joLKAvbq11MrlvNxYd14HbiCrf5yviYXeju+tVbO+Mp/hsBhgBgr0t
 44hCgW/ioUHSgWR0bX5wAV4/lB27OlZue/dkHUBEmPY0KRkuQ7J56/ZLpHxUCFsfohtS
 pOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779975054; x=1780579854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ypOqJwt6MG32xNjPn5nD9rwsVdwX4MHa5fFYaSfgigk=;
 b=MApwngEll4T0/dgOXAHViiki+qEvGk9hHU57BhYa491iHq0yxpeF6aQEbGHbCz9TPU
 r35MR9u18mrDUJnVlIdGabBQXSOd2JrLTUQo1yIM2G+7OQGxW68LVX4GzIHSlZMDLbni
 MudC8GdcKTI9QvKCZsThP1JdZPDbhWhYhsJHj/oXWeAgkvVYgfOW+YYO9ovfJkYsDgCR
 92Rb/ZPAQhuKLEgYinOBSXPtfCS24duVl5KGZnW9ukNhQ2KiEQpZuo62oZEAMiLATNJE
 OfePDpmQS8oon1Pthjb3ONJZDkWRPjZaav58yRrOkP5dQIcp3B7gL5jlOFVeZZ13HFmg
 Le3g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9LJUz8rr7EZ5H8V+Sf8HED5eX3XkFzT1c7yUbLKJETJD2sDrtls6y1QrXxf+40jYQ6PXxs+bxUtQ==@nongnu.org
X-Gm-Message-State: AOJu0YyXy38ZezUx3K5IDcZD91LJqEjg90OyReObtAm5WdQC2PRr6yxn
 P1BP1xnbxK+Ikn/g0En9fVo8pbJZmO8VnzkqDqpcxF3Fwucj8MFpwBTVWnu49XyIPP7QkZK79j+
 sWH6F9Pf/7/lllRgx91UTEVOq4WC0jSmjfbRgHe8S3Q==
X-Gm-Gg: Acq92OGDKGUz15Dsp9bZ3FBBam8bAOae0HQb5jFQ5lo7TIxIp0L4aN2H9bMaurJK97i
 PKdxGnKq6qhdfaRiEDzf6Fe/ugksPwSrSlSMB2ZY3zpQrfJVHjSceVELbm7lMhawbLyRSIo7VoV
 27JJo5jRk6tVxIOMaZftQAUwdKbWGPQYVEMtJ4DaHm9ZRT4un3Qsxnma29YuYHWujG1S6tP44kP
 QsSeu7u4jBSEJfQN2j9EDJmt+t9+0sxzSuz61lnbUT2tP3YFyOFKTCTq4YT4a8xqsF/YS8e3KWw
 lLxlGPyh3FvsxFYWRqPZCIKB904xdCPOVp78alud0Se0udXyOCzmjsvveeouJsSKnLrB/NVS14s
 NzA==
X-Received: by 2002:a05:690c:6e8d:b0:7cf:d242:d94a with SMTP id
 00721157ae682-7d336cb26f5mr294889847b3.25.1779975054261; Thu, 28 May 2026
 06:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260518073401.11279-1-corvin.koehne@gmail.com>
In-Reply-To: <20260518073401.11279-1-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 14:30:43 +0100
X-Gm-Features: AVHnY4ICvIK2kVYst-xM5rCWkEt_5-MtQKgfi0AIxtJX4e3SQiWpvev-OPk8Obo
Message-ID: <CAFEAcA9eNjS6MLjmub8YRFHiGUvRt47KnNGk8_T03VO-63JcAQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] hw/arm: add Beckhoff CX7200 board
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Mon, 18 May 2026 at 08:34, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: Corvin K=C3=B6hne <c.koehne@beckhoff.com>
>
> Hi,
>
> Beckhoff has build a board, called CX7200, based on the Xilinx Zynq A9
> platform. This commit series adds the Beckhoff CX7200 as new board varian=
t to
> QEMU.
>
> The emulation is able to successfully boot an CX7200 image. The image inc=
ludes
> some self tests executed on every boot. Only the cache self test fails du=
e to
> QEMU emulating the cache as always being coherent. The self tests include=
 f.e.:
>
> * Network
> * Flash
> * CCAT DMA + EEPROM [1]
> * TwinCAT (Beckhoff's automation control software [2])
>
> [1] https://github.com/beckhoff/ccat
> [2] https://www.beckhoff.com/en-us/products/automation/
>
> YannickV (16):
>   hw/dma/zynq-devcfg: Handle bitstream loading via DMA to 0xffffffff
>   hw/arm/zynq-devcfg: Prevent unintended unlock during initialization
>   hw/dma/zynq: Ensure PCFG_DONE bit remains set to indicate PL is in
>     user mode
>   hw/dma/zynq-devcfg: Simulate dummy PL reset
>   hw/dma/zynq-devcfg: Indicate power-up status of PL
>   hw/misc: Add dummy ZYNQ DDR controller
>   hw/misc/zynq_slcr: Add logic for DCI configuration

>   hw/block/m25p80: Add HAS_SR_TB flag for is25lp016d
>   hw/arm/xilinx_zynq: Split xilinx_zynq into header and implementation
>    files

I'm taking these patches into target-arm.next, since they've been
reviewed and most of them are bugfixes to the existing zynq code.
That should make this patchseries a bit smaller for the next round.

I've left code review comments on the others.

thanks
-- PMM

