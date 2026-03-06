Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22546FCB608
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 14:59:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyWe2-0002yh-SB; Fri, 06 Mar 2026 09:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyWdz-0002xK-WE
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 09:59:13 -0500
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyWdx-0002GV-JP
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 09:59:11 -0500
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-64ca09f2056so6852093d50.2
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 06:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772809148; cv=none;
 d=google.com; s=arc-20240605;
 b=jH9kMODdVLLbn9aKAZVXvrDbfWFYqbpvYZgfmptGI//7ft2nHgHPNcKXBEB7Sa461G
 lvII7+k2N7yOu0yy/Q2BZgGrlvRcf0tdLPhABhpUyjkmoymcFbDFhrfc8VDGZXhqc57u
 388Ap/fYYEk37BeDQJZyfRRk075PRNdHNwnz8lXEtJVJ6obg0UiPxmzaFepI3sPYqrT4
 Hp0InDLxklPWS2G+SA7wT/07CFpmtSM4wcOsIk6K+ywsHNwGgxhUetVSE+CfpkJuAL14
 Rm430eRY66brwXnd9Zd8vhGEV81BvBC1OEjK9tmUSGyxYS17gAtgpI8cQQGLeyTGpJPt
 mG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=kqLiNDrMG9u9CrtCxuMN9Ra3KZe+gyeOFGxvnlKdFJc=;
 fh=sl7jx3zRQUzlmAUohLhLDR8QV5a6oDUY2DJOhZ3s204=;
 b=JOMBnqFPQr7QqKFInM+rBpgXd1dSpdVpNHuJqssrGYUlqv/xnv5N9ZdirJNW5idWJ3
 3DJRohi3u/MAfttt8B9ZRU8kC9xk7CHLclsY8gjDS9xifVpMD2/YRTOZA/ip1LxIDcrw
 R+zfOZKdcDw7Q91Xu4YZjuinX7bF78rPjVTuatfNY4rvaTfShJYJSXDgYw1ljZyoiH8O
 z2CRrp38V1Ox7YEbEzlNQxWAVXjD15CWajfDUdIxo7Ou8OcgLjX/S/TFBfsg+fat9wRR
 8bcWPaGXMZIEU3RWCPh5ctcVcMXzraI6s8P9oZOazdA7nEnfhX4iNk5F/Q5y9c731k6o
 UMXQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772809148; x=1773413948; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kqLiNDrMG9u9CrtCxuMN9Ra3KZe+gyeOFGxvnlKdFJc=;
 b=XnW/Bb3oQUW7p7jUqws2DOAFQU/BnCepTj+H5tekEEBRIYFnfRhLJV6WSN0Eb5r3Vf
 /PT7ocjCyUYc5ABWudoYwubg58k039VCVzQnB7sEoxlXcXM39F8C2Lthl+gzNUraygYE
 rgUpZlGLzC1mlUxwEHynk46GHvaC5YwVdmm7B2lhuAQTdxXSbyGzos+lS/MpPXdl5yk3
 G59hQ0XEXfWKcmdLH0pSvlqS/FqcVUx7MV2BlhUYXmB9OLoG06/QUiUJ+uDQS1HwsVqc
 7UhcoiyssVfjR6McJ/Y1TJ0/xHku71ZBCCwBrM1sD4DiPNB+BPp5wzn+DWW4z+pELj5v
 WBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772809148; x=1773413948;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kqLiNDrMG9u9CrtCxuMN9Ra3KZe+gyeOFGxvnlKdFJc=;
 b=l9Z9SM9TonecwRoftKcOYE5VpzDuEwENBSZcCN7trCwQJdf5FqL7EqeCc0kO78rFAx
 3AZ2/Frc9+QL/mnGVCdkzKwRDgqsh7A11D/V/uWDgM+v9JP/WTw3SaG0cH1+0zlX2Y1/
 H+PjcyPAJ4Mr2jV2obNorl7R28IHNxavyyoS/X6QtSstMw3PjjAaetrTKc0RRNTgrq/o
 iaCtcR6vRYsBliAowlEwMmz8sV1gvr0W8OOVQZ+OUbdHfSxz4e0poKPb8T7UInVKG/Yb
 FW+qJK/tUTFEffrZz9pBuqw1oEGpeoOGIjPpLiTaztt7G/O0EBduUmRjV2o46R148Ggx
 PTHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWozKhQJi4ye2l4MuJU6PAkiRQm0FFprb6CH9mmdiZnforMWNF1GWEc0Kfb5myu83HnWVRfWldcmg==@nongnu.org
X-Gm-Message-State: AOJu0Yz20Z/+tTN+TdLJXHbD72JADqXpotx/a4PHTLICUUzo+D6+06Ww
 fxRVvuPji4jpAbbzV+MyK8eQsgHQ+MnWalmnjVfOQtQd6Jg6oXJas0t3+jSU4ZN90ks6l/LXIdq
 BnPXUHTjQuIWgH8q/omhxwpeWxtNRPxuHcZE4HkSSWg==
X-Gm-Gg: ATEYQzzBVWvvNWtVT07mT6uqs/gvyxIuXA8jlP9g5Hgk/ByoQIHtcoLTumZPdgFytVn
 8gEBDCf868TqMWoJ1OBZDMJoVoQRmV1uKimYKz4Q9Z+yUSr41jzKMvOdnaN3nXiv3WqgkZRNU5/
 EWLsVF6awTGfX73BZILsH09t793ddOunnwdIl5+hYR4qb9a+VV2HJ81/Sp1j/X8FfKreXwtyDdk
 wyaEy8x+Tro1mIRISsXX+PE2i9tJVENdSfsiRd+alNmqFlqZbbvMPbJ6Pgrvw9iZf3PRxd0BrTQ
 Rnfs8MNt0OG/nCElRrfrvYUbWiAUoVPOxDEPDqhrOX3AgQZMba0Xxt0srpnkTuXVw4M=
X-Received: by 2002:a53:ac9c:0:b0:64c:f53b:d3d9 with SMTP id
 956f58d0204a3-64d14384e56mr2143910d50.75.1772809148424; Fri, 06 Mar 2026
 06:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20260306130107.35359-1-mohamed@unpredictable.fr>
In-Reply-To: <20260306130107.35359-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 14:58:57 +0000
X-Gm-Features: AaiRm51VBQPLO4FWA1bXltCpVpvd7PXApj30YfPW5iQkdhzSjA63fi_bOrjM9FA
Message-ID: <CAFEAcA-e4GZB_TRG7Jm3O-RNJneUtk_WufiXNn6=UDHsgG4kdw@mail.gmail.com>
Subject: Re: [PATCH v15 00/17] HVF: Add support for platform vGIC and nested
 virtualisation
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Fri, 6 Mar 2026 at 13:01, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Link to branch: https://github.com/mediouni-m/qemu hvf-irqchip-and-nested
> (tag for this submission: hvf-irqchip-and-nested-v15)
>
> This series adds supports for nested virtualisation when using HVF on arm64 Macs.
>
> Reviews would be very welcome :-) It's maybe a bit unlikely that this will make
> it to QEMU 11.0 I might as well try.
>
> The first two patches are from the SME enablement series and are present for the
> series to be buildable on its own.



Applied to target-arm.next, thanks.

-- PMM

