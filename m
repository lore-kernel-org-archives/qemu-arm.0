Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5BB606A328
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Oct 2026 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YTT3sVhM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJ6o7-0007Nq-Hf; Tue, 20 Oct 2026 06:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJ6nz-0007N8-0d
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 06:10:52 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJ6nx-0001UB-Ej
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 06:10:50 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8b0dba37a7fso26453507b3.0
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 03:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792491047; cv=none;
 d=google.com; s=arc-20260327;
 b=AcjLzlTvFQaYV7DRop82N95TuhpE103W5Lf0r5DVQs0RN72yKz2wBLWb625JFdGnPi
 FXABaTdglmydhaj0M3oryWdhtS3lj0QH7xAwOs9NQ7QvFiV6j6IakIsSt+jGIyVGC4NU
 dLMuQX+N6IGR9rob8pfvFR1Es9NX7Gv5JDhlHe4oK0vkBLsqcjae0Vk7d26nzxUjUL4q
 7vTOsuRsEXNUriOZt/sCiGjDLr0zVnsQ8y8jAsUyOGJCLzWLDMDtRrxNtNqTI0oXEA9q
 YkAn1BqYGTmv6mqdrJuJzcrR0xTDp4tsqWYaHdBufGy8Q83mOmGgQu3PHIZfDhAN1YaO
 dQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=XedVSjkTPy5bjNGoI+CW31BMOMIfe61DP3t5o5HQigY=;
 fh=asSeL9Gjp5Ctw6ar4nZHzcYQHK9wauV4IbDnqmIzDvs=;
 b=jbrjoD4Sra4yiA9p3SglMvPHpGdEuwrZrRwSmtCN3mPpX5Wj7i10nDCJv+NXcu8UjR
 uhBC76MtbCBeOXHKzM1o0mOmlBaHcwNoPtSJoqolQ9GXxwtntZSwLfnwr9v+Ns6jKYiy
 mNYUfKxWo5eIn2qFE5wZYstvZReJ3cQQrrioxbgegXVUBGD3HmikM/0IttUuFyoimy95
 28imOpM5Ax7NFQ2oqiqVpXvLO5puFVTvuSqdPWFYuCbxjmEZKRO6kCZIjIDuwFANVvUS
 lppL7HQQlYbHW9ZQljV7psukiKw7MydLH2WWXJ/a9zwNo/Ljp2KKPGq8fpF8fdGEWuwq
 hKww==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792491047; x=1793095847; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XedVSjkTPy5bjNGoI+CW31BMOMIfe61DP3t5o5HQigY=;
 b=YTT3sVhMFRtGIc+DFa2w4XeWESW/Cds/FUZiZgDUWswuOzFznP6rJtuHfkih8TPC9z
 Ab/Kqj+JQxJfhVayytvX0axP52UnBlIDXHVy77q7heG7xxAtubQlD2CK8COpW2P/Q7W7
 HfmAyxkN5J8mB0TrvYhyiHagVMdK75yJaEWUBji4jsBJjGn+BnpkBBO4fElflVLtknmC
 +LNMGhL63d0tnLq1qdkLUS7JI72Qocy+E01K+xCiayvFCBAO9g8XOEvx3AeiQM3mPjqn
 +Y8GFqPEdaO+9QK5RtqZa/bZDAK7REqGuWIX6Yjftgc6M3b2jFKhBtgO1NcMxPRDOyVu
 hGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792491047; x=1793095847;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XedVSjkTPy5bjNGoI+CW31BMOMIfe61DP3t5o5HQigY=;
 b=zZ5C1pp6Oq/SiTCDWb0sNg7mforkROoQBbUlx54XnkJiN0mp7Ttb9Mpvm6aqeJ0Cr9
 QJOgMgod11Yt342d8vkGe7S1kkZY9uJzdb3excsqd5RUWWAzF7G+QO+k6Mq/ibFZcyUA
 sQzXOKSNxFNdFxRe506KvrBXjoFprLrEMf+VasfefFdkb+zlF5xeoL9fqs9AfIE8zWu7
 PrSVXQRTEaiUoNIq3z1EVvgBkpYcMm9la7rl92YZa+jyahLbnVk/Y0lvLa7dvS+o4Tka
 +mQFD4u1wuVx5Sx0PCC/DUIOtSh82K2yCwmMACTJi2g8tv4FyDFfoA983LexN7+Z4gh1
 Kqpg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx+hB6VexFgYjEZroFDQrtF7GSCb23SVMGTREx1js7JJtKvXOUE/m36F+FL/hzD+PlS9OmxFDZzXA==@nongnu.org
X-Gm-Message-State: AFq9FYIHe+r7JmqsMEvx4C78a62lpf391neHYjdcJbaMVgeI8OB8CjKm
 kNe9crS+xbx1afYvRPyFpeiExhhFqAcKVxzC7IGItbUw9OqiHt012hoiIJiO4gYYi65glmkN3ql
 U4PXWEC5FEK6oL1MEKKaqaZx54ZAy6ecGfnOyvf2sSg==
X-Gm-Gg: AYBFou0AMCE0rAuh+CY4wIMXI6LXgL5ZvsXOD/BltachFxhcJXQqZeugqMa18L6dkNn
 q+6XNZyZkKc6LVYsJ5tp1ti+JiSowsjS/54uyzBlxmw6LHoBzn+3kU0Z2TXf4EC5o76UK4TFVGR
 qoTrB8ghbQLPE/3LhQuup+d+YUCWvq9UhMEZwJ5gl3KbMRQ4JR0T/nuMqQb/iq4n0Sak0osqRQE
 6XUWRqkVAk2fd8oBkwN0TNnKINIHfY0IBa5BS9NEtGa+hIoPnto0xJiqPCQtCqHtELR89EyE7Qq
 CghCnoLrEJ1iELmjN0Kx0IdGApfVKn7MkdFY9Am0MubB8RdbjkbpsWGXNqmXVFszEMUPDJ+WCDi
 GKvmAEcEHhwurwcd+JEmukdz9MXjbBzrlrR0puVE=
X-Received: by 2002:a05:690c:fd4:b0:8a6:1205:12e8 with SMTP id
 00721157ae682-8b0f219f587mr40737057b3.44.1792491047373; Tue, 20 Oct 2026
 03:10:47 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20250929165230.797471-1-clg@redhat.com>
 <20250929165230.797471-17-clg@redhat.com>
 <CAFEAcA8OKABUH8S_F4HrWLKDC9XYqWGxD5_xMAPOPmc614u4UA@mail.gmail.com>
 <de908487-9d6b-48bf-b2ae-3b645d0bec36@oss.qualcomm.com>
In-Reply-To: <de908487-9d6b-48bf-b2ae-3b645d0bec36@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2026 11:10:36 +0100
X-Gm-Features: AclHuK887vqIPhEhWN7aYM8cZ_jyHtcgzZXHJS3A-txkdNIvR5Tqs3ygF4QCyIE
Message-ID: <CAFEAcA-dpL07+04immSxFyYvPon4coYeAijNw6NqEHikXuH82Q@mail.gmail.com>
Subject: Re: [PULL 16/32] hw/pci-host/aspeed: Add AST2600 PCIe config space
 and host bridge
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-s390x@nongnu.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Marcelo Manzo <marcelomanzo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 at 02:05, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 2026-10-17 17:44, Peter Maydell wrote:
> > On Mon, 29 Sept 2025 at 17:54, C=C3=A9dric Le Goater <clg@redhat.com> w=
rote:
> >>
> >> From: Jamin Lin <jamin_lin@aspeedtech.com>
> >>
> >> Introduce PCIe config and host bridge model for the AST2600 platform.
> >
> >> +static void aspeed_pcie_rc_class_init(ObjectClass *klass, const void =
*data)
> >> +{
> >> +    PCIHostBridgeClass *hc =3D PCI_HOST_BRIDGE_CLASS(klass);
> >> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> >> +
> >> +    dc->desc =3D "ASPEED PCIe RC";
> >> +    dc->realize =3D aspeed_pcie_rc_realize;
> >> +    dc->fw_name =3D "pci";
> >> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> >> +
> >> +    hc->root_bus_path =3D aspeed_pcie_rc_root_bus_path;
> >> +    device_class_set_props(dc, aspeed_pcie_rc_props);
> >> +
> >> +    msi_nonbroken =3D true;
> >
> > This sets the msi_nonbroken global in the class init, which
> > is run for every type compiled into QEMU at startup. That means
> > it's effectively forcing it to 'true' for every machine type,
> > whether it's aspeed or not.
>
> TYPE_S390_PCI_HOST_BRIDGE seems to do that since 2015 in commit
> 8cba80c3a0 ("s390: Add PCI bus support"); why isn't it an issue there?

It is in principle, but doesn't cause a problem in practice
because s390 only has one machine type, so there is no situation
where you're trying to run some other machine that shouldn't have
msi_nonbroken set to true that was compiled into the same binary.
We should fix the s390 case too.

thanks
-- PMM

