Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659CCCA5FCE
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:20:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOwN-0004EU-SZ; Sun, 04 Oct 2026 12:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOwI-00045k-A5
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:19:52 -0400
Received: from mail-yx2-x2a.google.com ([2607:f8b0:4864:41::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOwG-0001Ub-Im
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:19:50 -0400
Received: by mail-yx2-x2a.google.com with SMTP id
 00721157ae682-8ac502960dcso7473907b3.1
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130786; cv=none;
 d=google.com; s=arc-20260327;
 b=ipY3MxYI/uDHn+KzJKvtwSZRhtxrIuA2BT/+pGxHEXlsg8/j7e8vK0MT8LpzLP/Ppe
 SAFYFMgElwTv3GhYiHepjXhbCxnDuEaR8ZPiXVrfaz7rJSLpBnWy7NfcnoP6ddTCniyv
 JApy2SvPuGjGni0xcodH2NvhV5opaWJUhKDM7b5Mrta6dHONxhdjYpN1Uv0SHLibM2c/
 h5Z0Y3d9w0K0Wd9Cls1OZxfa2MnPJfeXyd3CF41S35Z/4H8wHdrw305sool97sTpBa/Z
 JSpTN6838wvkNC+z+2wlsjyoyRrmSCM4NW5tlS6og21kXijsbCPivxf8TtmwKvFFTH1n
 M2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6ovEvkl+LttCxZtAeQ8JUv6rn5rkz22ePRjZzfQwZ+o=;
 fh=7TVvMFmZIQEkE/NTRJe19vfjyEc8vOetYtzVNEwjBBc=;
 b=BzAy4537cgfn59Q9DRwOJn2OfVmqoUHyBKCD14eawcljhFO4lQ5vZ3duhVwtQmBOxV
 2ZzAC3L94Lq18WNGcqwOou0jMFEJdtSgbyVc2LlJ/yBe62jYaqrHhIlF6j600x5kKVv+
 0nsdSpXccifKYpxRTAHV1ruySM/REa4PhPB56iKCMRXRnQtbOzQbliRsAu0AhhFhM9Ll
 gmdWupqyQKJaMxhTCbSebFSEAClRZLruQew6XYuP/JtVLmaQbCPqXO6csEJ4yNrClWX0
 CEanpE86w5h8XbsQEu0Q3XTURdf+WZNnAH3Mwso8EU/SeCUZShzkOcrzmIpLx/I/s4/f
 mKSw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791130786; x=1791735586; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6ovEvkl+LttCxZtAeQ8JUv6rn5rkz22ePRjZzfQwZ+o=;
 b=W5W3ty6jK8dS2VPTUhCgGtZgI94Je3zzIZwnpLFhurhDw6ECEH4IIEO3OEFhFPyqBk
 j5KYn+nD0jMEL7sYiuAfrnDzV+H646hQCAQiFNXDw6NVflvvD2pF+q9QfzThaJbzpEeE
 y319EquAU0eTG122kfZHQQk8TvF4XGUfBtqsiacii42uYof/MsmS0N8AIMwYqMABf7Bu
 94qmvOFcjiGC5kpxQA94MubC8jwIBQdwTER2Epm5BmSE2HJckw+9Oq4hSarac69tIZKI
 M3qTgrm9SWh2W8nbsu93a/XY4QCQA+LeIvEsY/KfiLvtnsNy59vU/9V6TerqKr0aOoAj
 e56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791130786; x=1791735586;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6ovEvkl+LttCxZtAeQ8JUv6rn5rkz22ePRjZzfQwZ+o=;
 b=JIecZi5GjhOQn+FApxFmPEy6Y+TfFtkk+i2IFUc7StlljSJ3sA51a+xzp3gIIj9JbS
 SzVZ/3L0yomBhMRVehStzdVhiGLKFZdykiuK01NMAJGJTasFyCkL8sHval6oiPtvwq5b
 pPaZMXh5EhAK5nvO/pIGzItFCpuDXtgugqujqMy5Y1yzBHRAo0iRjdvPg7TuoUdBiABP
 cjkoMroJR7kWPi7xPvQljRWfhq/LFxWTiIneE2jVRxAuHu4JPyIlXRCLQ7B7+8nvm2w+
 mf1oVnicvARdcxB1jEZfElGOb7yb7VGsZOPU79jS1O0SlYyC/rZ/Bj4Be+Ori7hfPOgT
 ZhIQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy69vmcLtALhXBVNW0AHexf4/D/9zhtfCmv6iYFnsM0qG+vwd25Qj0r/Oz5yi5n3xf+v6sV/xiMTg==@nongnu.org
X-Gm-Message-State: AFq9FYIlxZ1N5EiN3rWQEMDfQ4o6dGkJeMrAXzD4FgNGEQB1Xd1/Qk57
 dVMhANqSdz9uQJK+m+Btp4oe4Ed1gT2fNk8Z0lEGdiiOcRjrQ3RZ8ZBBnKDjKnkWwgo68GUePIP
 Vc9Y9ekRljOK1hFgCmz+FTGiMK2PK+bA=
X-Gm-Gg: AYBFou2vdhp6gRVPc28duRMfdcqMkAUTI/u8HDYkSD0ykSK9B3d9xICAGf5ncolpwiU
 FWUKgvZ40ZI3rxyIw7qTJzcs0pD818To9xkFjGT3xo1HPU7Izn8IVcZILERW40N7db+D/AQy/zn
 tDVBXoPtHjn4ZqgCjuH464zs/rpv3AfvyFlLs8XDfU+mYmYCbyLII5vX+9lv7FxhYtRQoKxBwwp
 +AS4EWirvKjCsxW3O/PMubmSQHO600Id5K1QR7y2IXkOwL2ayeKMfjbNnTRZEhSGMg/6f1pLdZ4
 UFlRisdoSsTw4txN/ocnmOfY+rvvy1B/YUavMFH5KNA4Gw31Eci0lqPugr1DmpIP8Ex/nv0QBwW
 u2kgfnOrpjMOuyUw=
X-Received: by 2002:a05:690c:389:b0:868:505e:b96d with SMTP id
 00721157ae682-8ae36817a39mr28966097b3.2.1791130786056; Sun, 04 Oct 2026
 09:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-19-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-19-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:19:34 +0800
X-Gm-Features: AclHuK-I98Yb2ADAggzBndS-6Txyxgm_HhDfFCFVUK8e4HyuQro_QZ7wRfE-0S4
Message-ID: <CAEUhbmWdcRBdaFdceHnQR-XR-j6tteZ5LZf9kfe1JKwwF1ezMw@mail.gmail.com>
Subject: Re: [PATCH v2 18/30] Kconfig: Extract config IMX_GPCV2 from config IMX
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, Oct 4, 2026 at 8:29=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config IMX_GPCV2 to eventually eliminate config IMX.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig      | 2 ++
>  hw/intc/Kconfig     | 3 +++
>  hw/intc/meson.build | 2 +-
>  3 files changed, 6 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

