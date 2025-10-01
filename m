Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6005FCAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:55:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3sbP-0000hs-FL; Wed, 01 Oct 2025 04:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1v3sbN-0000hI-3l
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:54:21 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1v3sbD-0004ds-5T
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:54:18 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b463f986f80so244824066b.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1759308844; x=1759913644; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5Zh10HA3jd3BGFgUDTi6jZ+9AfEQlb5Kz3AUdlvCQRc=;
 b=eiIl+rco0kyIgKA3VmALGk7KsfCXPL1dT75oMrjtjHEyssPj6mVWCVTGbmntmWxd0y
 HKw/gbcAXhNoy37jlJmQWhsZ0FbS36x3lQCWzrBdQZJJ74bZSG1/4HCwJRU8ru1/Dtf3
 HaEn6TK17pCuQZWGZz7IT2VwjtA8TtEEMhFju49aF7PYpvqS3ZH1fgDV8/hvKkVmAR2D
 9uP1phliu4by3hreJK2sHGifwTDaNprNBSyvjslS6Rcnre6qE8r8OvatpMZn83jBuydy
 9/QlCHRDy/vKfe0gMlty4tDoi9cFpLY+v0V3PDUUy5lTKY2qPtwyw1my37MP9JobFtBT
 7FtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759308844; x=1759913644;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Zh10HA3jd3BGFgUDTi6jZ+9AfEQlb5Kz3AUdlvCQRc=;
 b=dR8kxomQCaoi4MDtpJ8+fX3jlgG1aB5k4lNljZueNLAx941tjbPVuZMUmtQUux/HaB
 QKyxCz7KO1M5RnxJWu0DSqD2fw7elRA5u6/WJw8gveQTW0xQLcnBAVfw5x7YwjDtYwaF
 jzimhVyERJwNSJAEDY4l0dzPE1KB3+qYSbkoD8btv7uMOEVw9d0PqnigQbEOgIi86zIv
 zgGfDZ01v9mEjZ7II9t0AIzUaVEmpokLKXYZwp6VxANTdacRlzLYrbmw0rFRMFAlbHYY
 TvPB+XDVLmpKqSZgIqiOe7yGJW/n6zQ71rtkMkBIAjYuBHrkfW/iPJbQAmdpZDRzbG68
 Fssg==
X-Gm-Message-State: AOJu0YwRH5UFLQ/NcIyp3wLKvUK7oMgh26PErYmWhM9bfh2ogVyHynWa
 nEXS+XYPQul4IxBOaf+CHHBkRZm1iZVjjT+ns6MpRV6VzDQg5D8j8bYkYDX3jtdQd7Y8SgsH/7d
 SfALxd+/xQ97W6XREi3r/O/Qn3gxbXaH0HlYIKvPt3Yq4oAJw9C8Qnw==
X-Gm-Gg: ASbGncukrrHOAgRo9TVzfPa5UwIoYBClxhXruXNFsoWeO5+kL6oP7uRPwhksFEHx1uz
 VbPe9ZSGNRGilWhfhkZc80S9/SSilvA7AGPUUA2Jomt0HTX60zKm1dUiSugFlo619j3y45Fv4JK
 UqOapKrVESyyz0gF/fFUIY9uXCVAaC1OdMqvmMNM2gNKYm7HfxFqWtt2NIsMNKhVylC8jU/BsZ5
 2NQKlFCJn43uFRLIchQZWLWRKOYVf8=
X-Google-Smtp-Source: AGHT+IGFBL4zsWyLpF3k8R2ybT951kwllSJWAlf6Wa5RkOI4YUsgHRU35nq9BYGkQ3ol1Txmlhe6CaigrXG4TyqjyJs=
X-Received: by 2002:a17:907:da1:b0:b2d:9286:506d with SMTP id
 a640c23a62f3a-b46e612bed0mr345459066b.38.1759308843815; Wed, 01 Oct 2025
 01:54:03 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Wed, 1 Oct 2025 10:53:53 +0200
X-Gm-Features: AS18NWAc5OXjaU_6ylbXYWtac8HygHEdbA7wCtqpIDFk3fZIL5YU3laO9cBeKWk
Message-ID: <CAJ307Eg67ri0=-ocEr-q=Y9+OY-9XKGFb5AYh59-X8szH+3Ryg@mail.gmail.com>
Subject: [QUESTION] aarch64=off with TCG
To: qemu-arm@nongnu.org
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=chigot@adacore.com; helo=mail-ej1-x634.google.com
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

Hi,

I'm wondering if the check [1] preventing "aarch64=3Doff" without KMV is
still valid nowadays and if yes, if anyone has ideas about what are
the remaining blockers ?

For the record, I was able to boot the Fedora kernel coming for our
function/arm/test_virt on cortex-a53, after having removed that check.
  | qemu-system-aarch64 -cpu cortex-a53,aarch64=3Doff -M virt -kernel vmlin=
uz \
    -append "printk.time=3D0 console=3DttyAMA0" -nographic
  | Booting Linux on physical CPU 0x0
  | Linux version 4.18.16-300.fc29.armv7hl
(mockbuild@buildvm-armv7-06.arm.fedoraproject.org)      (gcc version
8.2.1 20180801 (Red Hat 8.2.1-2) (GCC)) #1 SMP Sun Oct 21 00:56:28 UTC
2018
  | CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=3D10c5387d
   ...

[1] https://gitlab.com/qemu-project/qemu/-/blob/master/target/arm/cpu.c?ref=
_type=3Dheads#L1213
  | static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **er=
rp)
  | {
  |  [...]
  |         if (!kvm_enabled() || !kvm_arm_aarch32_supported()) {
  |             error_setg(errp, "'aarch64' feature cannot be disabled "
  |                              "unless KVM is enabled and 32-bit EL1 "
  |                              "is supported");
  |             return;
  |         }

Thanks,
Cl=C3=A9ment

