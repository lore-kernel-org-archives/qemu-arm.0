Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9764BC44508
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 15:27:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjf2a-00066B-H6; Tue, 14 Jul 2026 11:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wjf2R-00065D-PU
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 11:27:16 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wjf2P-0005n3-U3
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 11:27:15 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-81e8fa1b8d6so35781167b3.1
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 08:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784042833; cv=none;
 d=google.com; s=arc-20260327;
 b=DybPloRsJmb9bxuOEMj/od21isQUj1ZnreIy+ewdcZyU/vV0903HdW+iOejLuk7K/j
 uNa9SMlHv7MSByxGxj/VSUkBlboSTui97fLvH4044TMZaU6WgcqQNy3LPIwZ3H6BlpFs
 S2Y57vehUGiihICG7QhxrprxU+fEuw8Xnn4Siw9eqVGNGnHzGL1ml6SbGauaPP0ubFeo
 6DlrammZPSc+b0T1or6WiPxFSRgu0u0lfKgzg2sSSy/aUv1kKIJVvs6yiSNKa2OOt3TT
 b6WBdrYAMJDhsgmBVgft1vG9idUqqjj2FMvYLbEiK+1P4Bc8Lj7ss7TLQO2QzNtDZh/a
 KV/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zDCrKapO5C+WvYB1C45nVy3NZ4MnNXizM5QOey8jfgA=;
 fh=y8G/l4XWdubZPSea0ZKoQzPDZB2Aj2eQ/SCc9HjwAGk=;
 b=Jykr1wr11v2CGWQYiLeEiFbZe2HZgXxf+wbWviSQMmqAmVm2GQx+Txq7qRBkdcm9ti
 95oFORSsinfMzKHi6HhMeWK5eMc4VrcEiVhmmyDggsUzshr6l5slbW3RPvC/wZBMJf3h
 XVydEMHmb5O7xpP5jbJcZumtIlYoLGHJrU2woUvsV4i7Rz2Tbo6LmMWksL/06GGIKv35
 nH7prJLaTi0SGI+Ovu/qaXxJcHI17hpVPUkdk1T9DGVn35Qp04n1ImP1HNIUlgGB8BkS
 F9Ls3V45lGaf1FTUHPjY4wq50mY/vCERGemS0gAvuyl3GVwFk0Y5jBi+hg6GkUdVlRVd
 smrQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784042833; x=1784647633; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zDCrKapO5C+WvYB1C45nVy3NZ4MnNXizM5QOey8jfgA=;
 b=bjso+moQCmmlljSWbhfVxYam1JrBF+r9x0FdQIJxtsekdvvJSItzCX9qNJOjP48x8u
 PIdU8/zhvXcPPJeacEcktF8bkP1XUvPJ6YfLNBazkOYKtibpJvCV4gh22t5eJ8f09RsK
 YV1/TM8y5vwpRpgTLYLbi0SinzoYrEFjgHyOIIC6nNE6CdicZnGsH10+pP3wP/FxpgFo
 sGVh+q7P0CVYV0xL8sAAr68EVQS3ZMMpRjAT0THNRSJ9dcgJbWWDYQzhCmKz0Xcwmj3U
 lGxs5ldzOYfAOY8vK+qKhSNCFnfM6lTy/IFCQ+Pi7CLNh3iC7kOvUxBaoOwiNZw3U8Ax
 LUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784042833; x=1784647633;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zDCrKapO5C+WvYB1C45nVy3NZ4MnNXizM5QOey8jfgA=;
 b=KLJ8dDhJMW0N1+koDVSwRPfRnU5VkqTA7FalgoyeEz/ofOxX9XNGC2h02T4yizdsg5
 lWxq7G/CQ8P9ckyozaRuacYrSPUkqfkmJ7oo+KAJcOasqH8a0LdXFnqIglOky/9O8NN0
 UOPUMfZf6hH5cb0gFXNtVYNqK1ar9fHkLK3d25FBZ7YuAZ0kLqXwnsa8ltCQ7k3lit+B
 tubsd/GqVsxbplcYPUkzsdZEpuEhMOdLJnCQRRF4wFRIkLKuLfjLHY3pESJgpc0LrWPW
 4BE9Pz8j//X6uoM+azCGMukfYrXkfGX1gZNIvXhLbTI70M31qcCSQ+cH5+Pa2fgz8ySi
 IbgA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoGFIh8J9MuC2vp7UjTatsIpDkSelO/0/IhgZ0D0BOIZ1TMRWATYk1La+KxuDMen1AQ+2CKNlg1YA==@nongnu.org
X-Gm-Message-State: AOJu0YyNTig6bm7UXEogmJ4EoPL7OAKwJevbvaRl4ORW1K7/UTBK1ntE
 wjqvVPjn/JchvDKWjJ6A8tI8ScPxcTtaLeDp3NR4Bu7FBroWlBcjpbEXgwCN5oUN+dbcrLzE5xO
 aNVMyv1IJwUiEGRIa1F85FwXainaK2yg=
X-Gm-Gg: AfdE7cnRWHMGDVM6iK3GKJe2x3AFQsmKgyyJfsrnmA4B17VirJg1pSIMzXBB5+WN+dS
 c0f0c5akwHqpeK2dc/TWFx6/j12wNFWv/SqqmfKbw+WzhWC5Z5ISR2PfAWP17+dIIbUpqhqWpRR
 aSWbFQb2+FR7c4YPfEh44lOdY9qCc4oWR9wl5BkBWIcaU5UIyQzyT3YLQgwbEb15nZdmgM5/kTI
 fmoFlwQgIKw5TImk/GRAWDjT7zs3XAM4Ddr69po1DVcXMJN/NmueOVezDXqO46wl1A3pc56
X-Received: by 2002:a05:690c:6005:b0:80d:e214:c2bc with SMTP id
 00721157ae682-81ebffe4a65mr19131057b3.35.1784042832785; Tue, 14 Jul 2026
 08:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260714124621.522948-1-clg@redhat.com>
 <20260714124621.522948-5-clg@redhat.com>
In-Reply-To: <20260714124621.522948-5-clg@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 14 Jul 2026 23:26:59 +0800
X-Gm-Features: AVVi8Cc9Dhlc8yy3a3Q7CaWihlRAYYbo1SDUC16ZVqPRfi9yUdePuYn02kkwdZQ
Message-ID: <CAEUhbmW+LvM+2nP7uLQgEyTpfZNXp=jt=HOV_9g9F96k6PYXkg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] tests/qtest: aspeed_smc: Add Quad Output Read
 (QOR) test coverage
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@processmission.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Jul 14, 2026 at 8:47=E2=80=AFPM C=C3=A9dric Le Goater <clg@redhat.c=
om> wrote:
>
> Add read_page_mem_qor (CTRL_FREADMODE with QOR command and quad data
> IO mode) and write_page_qor (user-mode QOR) tests.
>
> Link: https://lore.kernel.org/qemu-devel/20260708111544.1440761-5-clg@red=
hat.com
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  tests/qtest/aspeed-smc-utils.h |  4 ++++
>  tests/qtest/aspeed-smc-utils.c | 43 ++++++++++++++++++++++++++++++++++
>  tests/qtest/aspeed_smc-test.c  | 16 +++++++++++++
>  tests/qtest/ast2700-smc-test.c |  4 ++++
>  4 files changed, 67 insertions(+)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

