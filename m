Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30256CCF2C9
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Oct 2026 10:33:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIOBk-000443-8I; Sun, 18 Oct 2026 06:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIOBZ-00040s-Pn
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 06:32:13 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIOBV-0000mx-KY
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 06:32:10 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8acda240937so8934467b3.3
 for <qemu-arm@nongnu.org>; Sun, 18 Oct 2026 03:32:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792319527; cv=none;
 d=google.com; s=arc-20260327;
 b=Dk3M4oR+bvchsxjatpZKDmXNcMuOdlfghASrLnF17AzwCxCFmhSD6YDrWQux1LyiLX
 dxonHvCoGQuHXYmCbES095m7VNjgbG53+dvkku6zK+6MPshWf4Vfxaehxml0H59+58bk
 dofbZrLlXIxzQe79oDxYSNb+BSlmghZcwrSPq8OhmhiTzd8MohMwcc9oSu1eHA5duMal
 tpwNvKdAX9DhBC7KJa92++ObOszY0Wx5jjVRBrdxY/AFU15F14M4sdE/4WeOwuLgm5OP
 d/PmSv7W3mF+l1U9Ru4s5Bxq1kw92LFtgT7dO8yyfJTALC9ITEHKLQZTo302IqWoszGq
 GrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=lcEW4VMJH7C14Mw21bAq04bF7/0PUzlQO6qT/Ox5pAo=;
 fh=y92sV7wX4qXniYNZbIYUvkUQJHNSONMhPrhuIjo4EFg=;
 b=KAiooq8dOyKfF7w5AhwoFpxjJZbGMbGe8pqJw4r8fw9u08nxASO9uiJ57muuguC4k+
 mEEZh3EuBXIubRPcnhkjyp7o0TSkzACu6490cJ3a/KNcQxFrtb0/55QxteM7Ty03VdyZ
 wQsdb556nbysNl4oHWZL1xxhmph4Kahea2KW1jZL6KzSVj+P60e3oFkFt0HQRDK8LTru
 +Uq5y3c/q/yz2mIjUSM23H29XUmajdQ/xDBfT5ek2JBGYJww7mpeKpyiG7E1ka8ImMzG
 djknaToOJ6W/5gv9Ume16lnqFGHwnRb7mQRzJp9SgAZMDjc/ZuqaN6knrOGRwDSDs579
 NK3A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792319527; x=1792924327; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=lcEW4VMJH7C14Mw21bAq04bF7/0PUzlQO6qT/Ox5pAo=;
 b=so+M4oTLaazKjpZMd33L53osHIp0CqpbFPinn07h9elvs85OZlek/Xyc5hDlTypKVm
 /+/dFfMDuHD6Vt6YA3rh1UYKhMmhXEBKwJs1uCdOFhjngWFVQbmBKrMMbd5M2OvKxhec
 g3etXPWG6K1gdXKLqcEiJ/sKdzHsbT+q96D+Y18u8TOIcgpgfiseWrb4t7Rm0HcsKdh9
 3iaNGHJxB8tulAnX3Zb7O5iSR69QFTg5QW/wsVOHGMI7EkfM4o9Ll8ROjbncJg7Nv7ai
 91uiFpDCDIq1KMnk811JbzAnH2XGZmcjm6B3x4AI4ntMfVdn3razBR6RCXpUjYRSuzwr
 BPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792319527; x=1792924327;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lcEW4VMJH7C14Mw21bAq04bF7/0PUzlQO6qT/Ox5pAo=;
 b=Xi+MPQfopgs7yOXc6oYQn8+nVJ/ZCKAsd9lffULvBHkk7IUtxte3LZE9rKUrZHg6WU
 Rql5UeC2FN8zP/WPvghLHTl7yNGBETyBh2Gj5sgnwXjGcTZdS121QqypGcWluN9aIkU1
 KCy4zjB8ewPwchvvmQ/Qc3BXzirJy370E74iVm9P9a4tkoMiiC0F7Kc2+6XVKrmPPIeb
 rB64rGipGUbsQ3VkeAh6rMT6wQiZ8o0r3mnipPWmHYUcrPnxieDUbIiDVTpk/Bm130VX
 8R80a45dJAGQpIaQxwaX+nwdTkR7yVlkV1wNaC4dZ+DMm8x0y7mUcoqb8YFRlWkNEY64
 vvnA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxRecxFWWifIhZ6yo+8wKM+ASL+QNgV2kr6Tn4d8vDO2T/IaTLxu9POOiGZR65b3iTRSpATKVSRsQ==@nongnu.org
X-Gm-Message-State: AFq9FYLoD+Dpaq4bcT8jqsRUB+OwQZKeF2yaoc2FbBJZxQoqxrXAGpox
 YoGwjlDHoKquSV5TMwu8gj+NRMi/8w8s1clbE1DBeVeV24RKDEiMPUNWpCdtXldJr75cIi2XL9l
 6ftbqnPVcnfWJ5mw4k2j+qrzvQ7PWGcTYOvzmj6BRNJIe7Sb9yeR4aL8=
X-Gm-Gg: AYBFou386o1uvDsuUIK6SneJQt0BjVbXEuAqegRVZsstejDJDjSiQ6uaWYYe+3oicTi
 xndjMe9xup+zsslZEGnV1qXYT28BN5HUZfckY51R5m1ilkhEYh64BmecoAXTd5kh/dW95/L9P35
 58Nts2aL3agEECSbD6yaoIuQ+yOCv1qcqcvyYgB8+Q6h0U1nL1tFX0CRgQeCwOs7/nSRZEMflFZ
 AXf83N8/KfdEktkRYbtpjbnSJrhTqxXAt5s+JbEW3ZTHhkxVWHwYKZOU+maArnGYZ+/GFbE/1cH
 Et+ouDi7mOqFw4q5vgBnDN2wn27psrjKsp9O7F2+vL2ZwhWTB83s7C5FyWmcd5WQVFqiWoIbcza
 khtg2WV0YltARK8FwYlVCaQ+ApCNDHEHadxyJSS8=
X-Received: by 2002:a05:690e:140d:b0:677:c29d:4fa8 with SMTP id
 956f58d0204a3-679ca93d449mr1197415d50.138.1792319527184; Sun, 18 Oct 2026
 03:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260918101158.42101-1-corvin.koehne@gmail.com>
 <20260918101158.42101-6-corvin.koehne@gmail.com>
In-Reply-To: <20260918101158.42101-6-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Oct 2026 11:31:55 +0100
X-Gm-Features: AclHuK_ruOOP20mY6liXAyFeL6oD7GvtR3FA8ZLG4oIa-kBkFcwnwWIO2hWKTbM
Message-ID: <CAFEAcA_92gWL-yJsPxswU94hENMYRowV5ZJ8mVGHxAbFYbacKw@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] hw/arm/xilinx_zynq: Make PS frequency configurable
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, Corvin Koehne <C.Koehne@beckhoff.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Fri, 18 Sept 2026 at 11:12, Corvin K=C3=B6hne <corvin.koehne@gmail.com> =
wrote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Add ps_clk_freq to ZynqMachineClass so derived machine types can set
> their own PS clock frequency instead of using the hardcoded default.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> ---
>  hw/arm/xilinx_zynq.c         | 3 ++-
>  include/hw/arm/xilinx_zynq.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

