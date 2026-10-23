Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0A8606A31F
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hIkP3KSN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKCSd-0001j1-9c; Fri, 23 Oct 2026 06:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKCSb-0001im-KR
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 06:25:17 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKCSZ-000586-Jn
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 06:25:17 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8b05bf699easo6892627b3.2
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 03:25:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792751113; cv=none;
 d=google.com; s=arc-20260327;
 b=R+/AdvMfNQ2IO94fh6NHEL297BZCt5PXh8i6ltYQDURb0GS4qKm49DppZiUepQa0AC
 hWFZejSHeToEEPfA5EO66eVcUi9l/tZSY/EQYTebbZTL0FUKLpViNve4nXgS9CKeHXV8
 gTedVxF88jKBVTRkN8sMqyXLTbDdPR0kRX2sIJQcM67NcSwr54dCmsBtxas9X/D3Ltja
 EOWpw7sG/Xrjc684mbLulaobuAES60jF9Kn4H4F6UgjH87xrdQlT2g9twMUUI+IZ+vMY
 37n1iyL2CKS0TllPiWdPwii+1m9BBf8PS0DzBmSP7VfbGprioeJxeGnOP6Ib64QX5xkr
 Heag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=L+EW9eOKSKxO+de8ddVznNBy7QGtDkeAxVvnBQdsJ6Y=;
 fh=0q5C2I1/Zbxd7owNgGD4uTVlar2OTepJNMnSqu6oFhM=;
 b=o79HKkwu6QTgWh6MJZ0ywF/PBsVb1YCaOYxjzRjE3OlWNP1+3GhYaHVlz+UEUgXZya
 1h1a6dFFUeyBJMW5p2x1O4uGnuVp4ycwXkYMrZAl/2IIRg+4vJMJL2gBt+ki4DB5rV8Z
 ptX7UiFYuTCWrU0EvXwbAFGqUkqL4O/FtyYv/eVOf/fswVsRItURbaJkJRFYaTwTJn2w
 EM525BgjTa+mg5OhNwTFiinMTzEAWijWVE3FGCCLBC5p7lCU1BC3Y/vTRQU324OkFhQd
 ocxeICobqHf9aU5nLOOzeROzJGogDVpBOoTb4XVjsJdmdvBK9GtlpKT96C4qkXTIK+W0
 dIww==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792751113; x=1793355913; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=L+EW9eOKSKxO+de8ddVznNBy7QGtDkeAxVvnBQdsJ6Y=;
 b=hIkP3KSNR3hUyGzU5Y97EOtd6KBs5wRaHca3+PBmXhpzR7aXxZlWK4Oa+jFw/XNVJp
 7iKj0znFl7vmvqYCY0Vn/JBEdrsBAZCgSqpOuAd8D4e/O0UPwjEtc590Aw4YYxqhOlTq
 GKLKwpK9EuxYY1FmqxKNKc1ig/nrJgp+dbLJtdESu4xCwMJedBqf1az10mUQqkgUEJLe
 W9yrBxk6ECBIs9vn2E7KGMYMYU5WpKvFtM95weIHOLWC/9cAyFCooaxqPnWrxkEYMWoc
 sC8VYqkP+4DUVAgKbDKkjirCjEn4fhd+M8vLA+BaK1sbAIispPdloMniKrTxQ9d0Cutu
 ogQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792751113; x=1793355913;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=L+EW9eOKSKxO+de8ddVznNBy7QGtDkeAxVvnBQdsJ6Y=;
 b=JcY76VjNNMBjHk0cI5RTS6BSdoNbxjw/MYij1kCKlUeADDDW+giusaqjGJKYy9GheW
 d7S9PEiCsaR54dpy6O04UymUuTaJ71X21t+J/US9KP6dCsgQIj6wl8q23wMyE2uLtSGS
 rjqIctAUpc/TQXsj5+l76v2TbrCaSZowkOwC++uXpHTG/b/8wg1XCg8U+vZVR13IDk2v
 V242aPSUn9MH89S9zwzmhCIbqKi4py4VXkkYBqJWv/u0BYhtNR3b33OMaUgGRTY1ou2k
 thAsnsxfe0XVTz/gIdaAs+Hq+9DMc//TN1V9ddTwyp+1DXkj+CZ6b4BjtM4AjLhfXi5W
 Cvzg==
X-Forwarded-Encrypted: i=1;
 AKwUvBziCZT+jTa+Pvz0L8/yMA22O8ktcRCTJokbWSTPuUVNXh1trrB4mQuD8fRAeqJ0yoDQxJfB2GIumA==@nongnu.org
X-Gm-Message-State: AFq9FYJzYxe+1msJBtNMgj53BXMz2vGilf5LFkHGQ6kGqlBw1gbkGOmI
 ZZIiKs/g2UuYt9sxuRyNXdQ6qSQT62ON2BuCnGzKTzsnEc3sRHVRBXDOgalt8s32wZBzHDbMdp6
 CXBpCSN5UMabUavKykunCpAJ9vnN03t3TEC6i4bYPBw==
X-Gm-Gg: AYBFou1F/6usNkfTHgMUD4tv4TeAATGL8ok+G3qkWbch6ItO/dSJZ393lz7+J7HquID
 32F6bBnnS8P/ncxfDeRuPGc3hRd3eEPPpxtuefjiGYn0st9R4S9doULivQOWOvCDJwM58A8wKC4
 mHD1xpbEYWTzQrUdmEc4CV5NfqFyOgdkB8f+RJDwybEsBAJ08Axdzl1SRUcm+3Lpb2swgyeFJvV
 olhI9epmN8Zl9RWI2WgGI0GEuZd1511BSFqgdmAzjA4DzHJfYNOkCTksCvAygcFX/Dsqhfdx5vi
 qzcnPwMLUoQwWlwehEGuShths12jPueIw72ffHR5UBKRi4FQciUkgDCRR+h3dpLrE8NxUTDBgSp
 5gc8yY+qLo8+XUEpHY7pRHg98L58kjM0Ryk9bsZCEE63eCZIpkWWP/5GIVgO5ciD+vmznBYwuOI
 9cSoKTWPMC6ivXEppBvVuV
X-Received: by 2002:a05:690c:458a:b0:8b0:a352:f979 with SMTP id
 00721157ae682-8b157dfbee0mr8997407b3.29.1792751113580; Fri, 23 Oct 2026
 03:25:13 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018133603.64323-1-marcelomanzo@gmail.com>
 <20261018133603.64323-13-marcelomanzo@gmail.com>
In-Reply-To: <20261018133603.64323-13-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 11:25:02 +0100
X-Gm-Features: AclHuK8nL322sUl5LA1kxy152bAuiATgkLLk82L-a-Udgxkx4KTUW5dfKUHF1_A
Message-ID: <CAFEAcA-skfiVQAPKceMeSBBrQo_BRf_Ls4aH0Jiu51sh_YjMsw@mail.gmail.com>
Subject: Re: [PATCH v4 12/17] hw/net/bcm2838_genet: implement GENET TX path
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 18 Oct 2026 at 14:36, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Implement the transmit DMA ring handling: walk TX descriptors
> between the consumer and producer index for a ring, pull frame data
> out of guest memory, and hand completed frames to the netdev peer
> via qemu_send_packet(), advancing the consumer index and raising the
> TXDMA_MBDONE interrupt as descriptors complete.
>
> Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
> networking series (patchwork series 829638, posted to qemu-devel in
> 2024, never merged). Carried forward and completed by Marcelo Manzo.
>
> While carrying this forward, fix bcm2838_genet_tdma_ring_active():
> it extracted the per-ring enable bit using the DMA_CTRL register's
> 1-bit EN field definition instead of DMA_RING_CFG's 17-bit EN field
> (one bit per ring), so only ring 0 ever appeared active and TX
> traffic hashed onto any other queue was silently dropped, eventually
> tripping the guest's qdisc watchdog ("NETDEV WATCHDOG: transmit
> queue N timed out") and breaking DHCP.
>
> While carrying this forward, also:
>
>  - Check that a frame is at least a status block plus an Ethernet
>    header before looking at it, and that the descriptors of a frame
>    don't add up to more than the TX buffer, so a guest can't make us
>    read or write outside it.
>  - Check that reading the frame data from guest memory succeeded.
>  - Use lduw_be_p()/stw_be_p() for the length/type field.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

