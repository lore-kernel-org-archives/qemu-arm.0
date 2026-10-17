Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD5ACCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 12:41:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI3j7-0007f6-MF; Sat, 17 Oct 2026 08:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3j6-0007a3-6k
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:41:28 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3j4-000486-Kq
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:41:27 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8ad98c3fb15so5928327b3.2
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 05:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792240884; cv=none;
 d=google.com; s=arc-20260327;
 b=EwlL15aMIFpt9BqjFkUhEfZJp12i7tDvyI2QzegXbT1g2fo7EBGwlU3x8EzaXER3LH
 SpQQcQcvktCaFjhyYPRrEFid9bX+Be/cEOKhZUxnY6cAD4SeLFAfN6WfJapCcifgF7gT
 T7wbqtx7ya6s0bsyYo7BoiwQiYMbERolve4JwLncbp32ZVWOqaWmJ5pHUfUoWSf+q0rZ
 IN7NmhHu3V5bbHesHi6sPtizc7WYLkWl6XJ0T/xQ6d3mBSdozZDa0zWWr80BKhJ8ncfb
 ohkgHEGxH+sFavShvGNp2ZtOjKtIVC0mWikdZFne4zN8esMaUHYN94T8f3tvv0Fg7gwO
 RZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=BnxfMvd8hzhoJRjxUTNsa+DrzjsydedZmNeDt5wN43o=;
 fh=8rZU27bgpAZ8zCoE+iyODEwghXCt0UVXml0kPKlYOLg=;
 b=W0PM+UEPZQdFSN/SRNyo/oLJ+VepzzDzksr7rAaRTllfkoZWILrZqMeuhrKQQoFnkh
 YeVRiM64LJWILHiyJbidD7SWKRHekC/JUdA6JyrS7TNRIEKFV1HFD4Qln40JnUXcibhP
 FHtq/o+h0Obcybh7QKcreOiK+AhQoOcPuKwsKRWRBMSKwAGvNxJ3+N+gpDtIBJlYvxKZ
 b/nFmjfbKCHzO8qO4Z3P08CCLGT9i6y9FuuwiWBpvvVMUR/UYP00t/8tIIpwO6UfZg7G
 vhyalHlVA9MleFn5FbF428LdsSiUgAQaDt0mMiPDuCrORqk7KryJlfuLC5VOzqT6TnRm
 xuIA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792240884; x=1792845684; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=BnxfMvd8hzhoJRjxUTNsa+DrzjsydedZmNeDt5wN43o=;
 b=iD/6PIzzbf69sJmnhPI45HE0qcIPZfvsADcgKOxSWRG7vPRwHygbRaMJN2/eAdVTPH
 5g9uVhkuS7y/5//yd3WHTnDLMQLVOHy0gHhnDj8dhwAcy97+fzLYreysSo+4XJNY7h2w
 Wy5itUqVRZjj+GenrXmhm8gsflv4nI9cqaJvsyyYyeXbzAaZtdCwhJpWxbnoS7zQRw7H
 DTs86jSZ5JasKzim7MWm04uxP3QEOYGSNDCvqZ/lzmqWzTpzMc2Xi7NuTotO3BrqTMx6
 gEyhv+BHAkgNHnFTdESerxpNA2kdrFdHiVi5gdjoWLTbeiRltzteoq0SRpa9gjT5MMTX
 NT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792240884; x=1792845684;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=BnxfMvd8hzhoJRjxUTNsa+DrzjsydedZmNeDt5wN43o=;
 b=0VgTZed5t9oVg9Cy4BlBXWiUgn7nyhQruUsmkElvjVQLwwD6bmzqDr51sVL9cYbbXf
 4gBB8baDy2aLZoPfAiH+fQuOnNrr9tzhO2EA2QySjve/K5K7C3bHoGQKR/QcOj0PNBjG
 6sJSQ2ExUKeE3Td1Mp/2CqLmstWswzNzKNQeGaJrrmtJPLMDNSI5l4dZ6kC/RFCodBTF
 g4cwijebn0hSlHQ4WoiLeSJ5vGm7je3o8rD6KzzbvjpWmc7KiJcHMUX6TwRiKGuL/97M
 104LdaL3TdImpkQbopndGdEiVstRRH4XwodF2tScNa3OQWbSQdWxnWABaCm/XK/CYkA7
 hggw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxHAKS0fiNkTj5ey4pqV1OweNcnhVIksfbPez6ZLbpNjCcbhc3Q9Xym8rJmAheAR5Rt8tz3TFxJRw==@nongnu.org
X-Gm-Message-State: AFq9FYL7TeKVo3uv8KqnIfYZcSj7XXcKqDzKCGodpfUQ/1Z8Yvv7zqZh
 YW48Ieg48j0/27eG1fcteLY566lfcB1f+NQou4c7MTlFeuaC162rMBbT7lWaM1jwL+fYS9dtXlL
 CnrsiRF+lA6jOW5eDMzfmBzicpEVy+bdRwo9j3UWNVA==
X-Gm-Gg: AYBFou2yaSZ8AO4Be8VR1HMs27VkEZDRqWqZKbQ6qSRTLhPQhBhzpAwiHfRhmn3PqPO
 7XMUFYmLJrw8RHYVVahcPq9ReHoHKa26I0gC4RbPLVcnJZKgtEx8/OYCjQAgAvKgP8bvQUmFdh5
 gzdUzDDbAaWlVqlkVe4wbWFHYNwD9YfNtDLAAbEB2bIFBN9VkFZGVkdFjAV4pns3naoMvGgaGbV
 ez9BK3RMvWao5oYa3KNDDpKP/yVG8E8wSAmBF9/KpXHZgop2Fp2xmHoTzy3v6Ul7Ipq3Q1yMjE1
 LFy4on/F7eTl04DkZWZZNDQaLqCOMD2WbYBA+GloY4XFLasqsHERYKv8vAHBqGdGZozNJkiuSV/
 MrW6rZa+NVc4O0qC7gfTBmhwsZaWymAxdBYXf7o0=
X-Received: by 2002:a05:690c:dc7:b0:8b0:a64c:bb37 with SMTP id
 00721157ae682-8b0f21d78b4mr10467927b3.43.1792240884274; Sat, 17 Oct 2026
 05:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-7-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-7-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 13:41:12 +0100
X-Gm-Features: AclHuK8s_6G-7H-gcymbN_BdTHpDigsmc-tqiQK5w4TQHN0NJBnDkWMl-K1kUrs
Message-ID: <CAFEAcA_8t57R_zRkP5Y=5H=aidoTp1Q9pfk0Z1-mdV3tex-riA@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] hw/net/bcm2838_genet: add GENET register
 structs, part 2/4
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Add the UMAC (CMD, MAC address, MDIO command) and DMA (ring config,
> control, producer/consumer index, status, RX descriptor
> length/status) register layouts and their field accessors.
>
> Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
> networking series (patchwork series 829638, posted to qemu-devel in
> 2024, never merged). Carried forward and completed by Marcelo Manzo.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

