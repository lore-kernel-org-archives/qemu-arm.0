Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617D1C5DF87
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 08:33:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxKgJ-0000o5-Mv; Fri, 21 Aug 2026 04:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxKgH-0000lj-N5
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 04:32:53 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxKgG-0006Sm-5v
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 04:32:53 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-6688acd1a51so1243360d50.3
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 01:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787301170; cv=none;
 d=google.com; s=arc-20260327;
 b=gk3h7KD9SYdM013cln9Bq3bhnylixkoa8pDyah3fx04TEYbNHf9g48EH3VdZFVfNQN
 qFt2WHXgUeGjHLoBxjHrrh/0xTkwMqRBPAl+ZtGEuo6iVKao93bYPc9EBFbdAC0bugVV
 Eo/QgYFBZ34DEyac9mfmio51Jm7XCE3PLMbdHvmI08nb8nzGZZtdm0L4r4e44QniYtpr
 D6JJp1Ky33di9cl68BcMAI/Wtdj8I3ZNGFR+7cn0zjAQ16/G7gGKagnjs4SEIKKuNeqx
 VSHncRBzYerus9j7b61H44CAo5SzeVjGAwfhGggdtwWEP01xXQrRFUNdf/WLR4r9zMv/
 CUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=X7V8EptM7f7oCanY7XL4s7R6X3Lifn2fSE2td+MsNQY=;
 fh=DlLTM6KvEch87Dtvu2JeAFhJhcKYM31xP2SsUFlZijQ=;
 b=QF7nZI3OFhhJHX/REtXMf24ydwecwdc5VVrMnn9pjl3EWqu+PHYdKv3ckZKToFZ7DO
 /Jjcy9FDtno4RFu9yi15/BlFqZ22txssvlpvtYPDemtNRVBDWPzbpksAUQVCWCWWm2sZ
 Ig8F6An4xIVtlF56cPfOmVYYjjlhXEvx+rWwXEs6e28SUuGYK5HPZSHm0/MLANvGjrnx
 1IPfinujw9quaZP67O3H5IzXiltGhvMGPAmqz22+GMUkLtTH0VnsV7BrvOctdvTLlvxx
 XRdJsrSS+LJW5KHdrkp0KpWz+2PzfScZdHmVVMGV8sKE1i4fTVzV8aDBIb9ytoZlvm2a
 pCYw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787301170; x=1787905970; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=X7V8EptM7f7oCanY7XL4s7R6X3Lifn2fSE2td+MsNQY=;
 b=ERzFwEd5yHRfWaNQbga3KWWhpv5Nktdwc1Rv5kmBOoKEOTu4L+pwwtyqRgwxJaIlHq
 SNcuMAMDYgw5zcoSXeO8WeSVf8jLrXybkpTAWOrvacRh7nXF0NcmtzK5Bjmjl0E/qZBX
 vwyuRT2KGNDR/hp2K+sheRITREJZEYa6PclXI/J1bk7Ql/LXfEMQLWajyrFpykHJGAia
 +Ruje1VipRi0Wb9f1EkyRuX+hRe0NLD2HWN0nMgca7H8P18sUvkCibW3uhtGMiB2O1F1
 MSeDvxCX2uSPeKN2t5Kh2rcfYj9zmWphiZrmwWEwJ/bCxjtjjiM2+RMT/vBT78VbV6sw
 Y5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787301170; x=1787905970;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=X7V8EptM7f7oCanY7XL4s7R6X3Lifn2fSE2td+MsNQY=;
 b=kHfTDmB6gXRBHgNwmpRIQkj9YW2Zwsjjh1FfbbOlECfaKxq+h13FdUYKGtS9PSpQLn
 ICwkM2pdZHLAjOG4ogyqblPwLW4cOXHqJFzCSf7rHs9t+fA66SPmDZNTKydAHZbb85YP
 TR32U9fnZYP3721myOoADiQgNsu3THhAPOWoSPwjDZYfi9mUkvVlB2dEpcS3NPb7Or38
 qMtMaqagimw+8qMeeOJTyFc+hCDlOpu5bdT3RfgcqWn1CRZfJ5NR1qjv7iCPNprsAjJs
 RPkgp9QSftxuBssC2cyqorJEpI8LpBKkeAPW3P4nBdiLtLWwrZxvyCHphOTf6632PYoE
 3Wig==
X-Gm-Message-State: AFuF++kHkTEwG9ljquMmvakrczgYLkLAiLx3JrevecGj80N+vwy+8Jh6
 aVdO7EhGVWRsq5jsnMUz6SEKVGGKSl3FXDltgqsaPpPjjuTQA+vx+tq6AtvEAJeF1elZCgyUq7y
 Dg4UwU3I6PKF9oWtkAHVnlPp+2WvspqjcZe2SesrQzg==
X-Gm-Gg: AR+sD114OfLd91ys5jbh10YliV+2bt1Mw+E2H+6NXQmIs66KeSSUIJKSEsomOzyZO2O
 8XLKmzISfWPQJ6Fiq97YdL4awBmbBXanGZucxkQru3LjB6+3hvdNVTFoymYE+n2RO7gVpHb8DA3
 eK4v4TfcQb0TCWl+9lP5qO3W7wrGSdRJwoGbRZ90WtyBW7IMIu8ScrietNeddja8DgVW2kcYvOn
 uKoaqYeZQCsK3mxy8a37heL//DVaYO5VIAIaZ5J3wYBXKhn4eaIUMoO4nhx4WFpXwQyivHBZTD4
 ECNh2nH57dLY5JMRN12FwR9PiaVCR1syMNqjJlojj/PrH4X2/YApCBhI58fV830Gjvj6FCVEhu8
 Y2zhls/E32E2iLQn9iCm6Bnx9gm5Cz0fn4vkko5M=
X-Received: by 2002:a53:c203:0:b0:66c:b8ff:fa9d with SMTP id
 956f58d0204a3-66ce4b343fdmr1550464d50.43.1787301170232; Fri, 21 Aug 2026
 01:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260819185430.3467629-1-peter.maydell@linaro.org>
 <20260819185430.3467629-3-peter.maydell@linaro.org>
 <be278ba9-1e87-4def-8bb9-eeb14b17a03a@oss.qualcomm.com>
In-Reply-To: <be278ba9-1e87-4def-8bb9-eeb14b17a03a@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Aug 2026 09:32:38 +0100
X-Gm-Features: AcwNN1WQ9Gkaemd4bv8KUaD5itzpcG2M1Nw1KHhx8Nj6LmceEfSfTfhvcyOGlQM
Message-ID: <CAFEAcA9ui8LDnYK4uWFEMMATvxSkx2QZZ6aNFMs2Ag5PcuFvzw@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/arm: Remove spurious WM8750 dependency from
 Realview Kconfig
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Jan Kiszka <jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Thu, 20 Aug 2026 at 11:55, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 19/8/26 20:54, Peter Maydell wrote:
> > The REALVIEW Kconfig stanza has a "select WM8750"; however the board
> > itself doesn't actually use this i2c audio device: its audio is
> > provided by the pl041 (which connects to an LM4549). Remove the
> > spurious dependency.
> >
>
> Is it worth Cc'ing stable?

I don't think so -- the dependency is harmless and has been there
for years. We only need to drop it so we can delete the WM8750 code.

thanks
-- PMM

