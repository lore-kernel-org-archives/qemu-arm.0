Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFB6105F78C
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Mar 2026 12:35:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w11jb-0003J8-R5; Fri, 13 Mar 2026 08:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w11ja-0003IY-5F
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 08:35:18 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w11jY-0003Wz-KD
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 08:35:17 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-64c9707fc11so1608573d50.2
 for <qemu-arm@nongnu.org>; Fri, 13 Mar 2026 05:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773405315; cv=none;
 d=google.com; s=arc-20240605;
 b=PME+iNxoksr5pNytuG1wkMqOiU/EgOn/RtBt3C1oYTAyDQFAvROF6EWCvcBeAn7/T8
 1EtpkA5dbzwGeFVgnslBlM3bqo9GcJ9zmZ1rPhdHpql/Ug5epqfhBayeHorXPpqJ88cj
 1qPXiMjDM9EOeFPkaxkO5VkexvinX0ivOsR+6DoFPAZe1msx0w8fu9YEHWKZwc1xzzkY
 TZXVkxmlgTgIpK458t4EHvwnKFTdlj/TIUQ7yAtsKzqwp7rDRjQsvQDjjO+jciyiOtj7
 b4tvuFwd4n+UOJrkAABO3HsdSZY7AAOrKpgUP+/dUa0+pwqOTDRW/TPoIFkFY/gbbqEU
 NGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=AlNspcE07UEWTn6y9KFkJ3h/Khw4tpNT9mIFukVluNU=;
 fh=pBjtrSB4ONhC0Hsi5b3LnVv4hnEBzjdUjnkdoSYwcAw=;
 b=cJ9HYM7sfe/E4F114D11KnxrTuOpdff82EOJO1lSdgWcn9BAdvCy466xxhzGcD948r
 jSXDNMQaRn/7womjLAiQ5+KMcIi45jzj0b7rOXhGWbbCR8MosW+PpfCpONJ3RkvLwem+
 vNK5eVF+cajc/RnBWJ796fDxrdjqFZRCFGcmQ1hbLk8lYEzxY/hOo0Q4Pxksd6rJw9in
 495hEXb2SzGncRI2LhvQhobRYpRU63xnqsaajBvGD+NLS0g+ZIZ1WjUMz+7sOiM2/jn6
 w53KhGzzDEmyWo+x8dI2shu6tw2f4go8GoMBLrg6JoUCb8Afof80KO5VJhkVB+ThnwkG
 3SKg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773405315; x=1774010115; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AlNspcE07UEWTn6y9KFkJ3h/Khw4tpNT9mIFukVluNU=;
 b=fCD4/Vn66ZLVGgVvKLaUH1SHQEzfxmlTA9nfP2CVJK6kMb9nIMRtgLW2djj2gE8Cf7
 8wB6vyg6nhJYiPQnkHNhl2wxwBPPFmmQ5iw6C4joOMKh1kuTxN1cnOve+biRiSE8hO4S
 +0+aczk0FhUTByfD4uPnLZHV8nGZsKH5AvWhaY8hO1Qakcl325CD5qiww2QonrDYv6D0
 SoxsqNwkUok2tj6GLhCnClJBy4Tr3ppd+uPUcZUEqkBrnJOzXwTE/zPSt6dPfJi1yvFG
 YpuZwmlQITcdH0FCTIDBEnESL4+LYjIfTy1q46awIpvh6R39gsnSM6SxAkNjDy2RkQ5J
 XMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773405315; x=1774010115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlNspcE07UEWTn6y9KFkJ3h/Khw4tpNT9mIFukVluNU=;
 b=ELHct7830kN4DQcTw0snw/uFk5le/S2/zXU5hfTR+SVAWbdY0ov2Yfyue1mpxbqEqV
 ouWEig3SnMcEzqCQ0dhRyQBnmowaW76/42ZxlI2+3KzXR1HOPz31RpHEr4/OrcYMamlI
 sM7zqIVgfy6GOOQPxS6Na1fy9UApOsaFhf5g40Tfr1KZvxPDuUYyi49fOwiur4ZhNtwk
 qDoUBVkyUtTDdKuJ7u3HThNCF9sfxRpsPtGyx/qISlUyuySLt1Uu53oo+5RGoM15I8rj
 rZNvp8uxdgZ0V4kd747QvaeqNA+jAfntex75J5HNAeHDdp/EdaG3gSEstYYDYmBm/Fy7
 WYXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM2LUJluHe9LwUSXDyfeqgegXGtDT3gVuvEuXoxVT9tgAXlAbruT8+XhMAuA+N8V3uFG9MlawMqg==@nongnu.org
X-Gm-Message-State: AOJu0YzE6SwDflUnaU8fMSPpzAxcH6BkGankti09t2UBchRVDvI910nS
 mkTA3sV2o25Xr5gkkm8AxRVrMiF9x3yND6BEkQ++s4KvNw3LEY8mxC/gIUhoketdzTgs9Jlyqne
 L7Xn6zL6sOnrO8hEoYzPZtRfp8BiTjSEzfF6vkwKOooElIRxm6t6K
X-Gm-Gg: ATEYQzxEg8/2vv2padxjkzb4z9QZdVl3Zr7xZbuxWfWOGiEZM81Ss1M4X44MCE7IpIc
 XTu4uCuSQ67OOdmQH+WFpBrtNJ6eSy2Mz9x+A3KfzlrNy/yY5wOZcEThNVtt/OEDOXBhgqKlVam
 v+tja7QlMKvnMaQRECCBFc9NezgqdICrgxFZyMpSm/8mzOwpVSwhn0fEdgsa71cZI6l3vrWxSdz
 4tIlZPkNhXUpldOdH7Pz8zywY83i+LfVruOAUjol5N/FiCcBDsxuzHZtxBbl8vwuJjY09WsTnKr
 +YasfAoNj2F+Ac0qTvPEL8fV4rlK+ZFmr0yZePFL9GwbJ3R7yMbLsnp18v8v2uzLqW4=
X-Received: by 2002:a53:a492:0:b0:64c:a2f7:b49f with SMTP id
 956f58d0204a3-64e62fb509fmr2118771d50.35.1773405315045; Fri, 13 Mar 2026
 05:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773301927.git.dingtao0430@163.com>
In-Reply-To: <cover.1773301927.git.dingtao0430@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2026 12:35:03 +0000
X-Gm-Features: AaiRm5292AN2DxUSFlfZi0wXZ1_PsPsdIlpigTs_NmIFQVTv6buv1wqkUrcjcbA
Message-ID: <CAFEAcA_qvAzHS6xDG5jErRxakhVD32otVgcHL4oLbK3P=NTBAQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Fixed bugs in pl080
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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

On Thu, 12 Mar 2026 at 08:02, Tao Ding <dingtao0430@163.com> wrote:
>
> Hi all,
> When I tested pl080 using the existing dmatest tool in Linux,
> I found that pl080 could not output the results correctly.
> The main issues involved are inconsistent source and destination bit widths,
> misalignment of LLI, which can lead to incorrect data and even cause qemu crashes.
>
> Tao Ding (3):
>   An interrupt is generated after the DMA transfer complete.
>   The swidth and dwidth of pl080 are not equal.
>   The LLI of pl080 should be aligned with 4 bytes.

Hi; I've taken patches 1 and 3 into target-arm.next (with
some adjustments to the commit messages). I had some
review comments on patch 2.

thanks
-- PMM

