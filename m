Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555F4CD37AC
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 14:56:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMS3F-00017m-AP; Mon, 11 May 2026 10:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMS2x-0000y8-Tj
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:55:53 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMS2s-00053D-IR
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:55:48 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-67c566cb519so8318101a12.3
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 07:55:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778511345; cv=none;
 d=google.com; s=arc-20240605;
 b=K4efaQJdeGq4slPKTBop+fpaWNePBMpoNRBAHHlvuFEuA2DtV4JgovWP10plGGddAE
 130mOi6vHr2vBBVfLC5F3yG8DNR+FRoUg7X1A/6Bcfagl4J0DbH/VnvXH2FRg2hLuJ5Y
 UubZZLiUf2Rg/ORd9laFcM6dPJ4XrFs88+J4QqTLqcNYN4QCOOrmnMSAx+YmMV3Lj7OD
 p+r24E/2N0uTNRkKdXw40oL2JDJ5TrMFySt3FiItie0QYTBQTQHARdITVyeyvciNh9XF
 l4tvDFFtE5jQjO9XXJf9Rf9tzMGb/N6G28tIwakMs3K2uR2suvJ1azO3A6N7Q4NqWcV2
 qWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=VNijOCZkE4OPNW65AVHwTEPv8tZ0Qv0gS7rrW1ZRJ2I=;
 fh=tcAB78Y68aXOEGA38JKn7qbjPlTeynDp440rqDjt+tE=;
 b=Feti72sIFBA3bH4V+xqu0xS2LJ59NlQgW08OKsmN3FnIep5P/4OEKNVRH7eCq+QI6l
 ToaRplWorlHAfwkkQ3hVPrjKcpa7bB+7t3+yw0AhyXStdnIFMbE5Y94g2JMZYnARnuiH
 O5MsLfmLkGXGslo8Eqtju9uNwVuLCLeuTzyv45CJ5nAaP88ir9hjQMpcmeEtuTonU7hW
 M0ye8yY1oET+V+anPL0hVLZVTcQgBr8Q9Es2UajWjt3D0z4mJ4nXclrmAPtXHAI8scAX
 1xVqPRbjSyLSZ8kODcN70arvKhWtckBgg4szk+NIS/7vnpb6ZznwR5hw9vVBIdR6vvk0
 WpRA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778511345; x=1779116145; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VNijOCZkE4OPNW65AVHwTEPv8tZ0Qv0gS7rrW1ZRJ2I=;
 b=IzYlYsLRsjPN82lDVBSk5Ym8n9c+mgZxVS/xtesxxLlOCiCr/F8bBs9r7L0zqZZrj1
 M5AZhAYAEWLwH6bdOcdl9pf3fk935lhf9iMJOHP+QxXogWlsltTDyocy8wHFpZu6rtOW
 nxc56+XUfReHaKpC2X3AnvnNTFANeVZQqfQjUvY/WIPb4mxOU8WHC6eoTLirfBKHYEyM
 6BT2pzNOCEtIzu78e+bP/abOI3OkSvxsWDlCPlYXJSY++oWm/LiSbkarOoB95hgq5kTa
 YFairw/yihApxEKMj5qF3C2WSYTUDqHA5P84MyKpRQJ/HzwcB+j9JQsFMwcsSFsFClgC
 wAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778511345; x=1779116145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VNijOCZkE4OPNW65AVHwTEPv8tZ0Qv0gS7rrW1ZRJ2I=;
 b=Y7I/beqvjjRQFIX+IETaRPO9p31YSy0DXyi10ALQSwYf8seSkYQdVsOdrQPy8wIzx1
 YF5IZtkzockQzfAbQTxGGKZJm/IkntL7qPaqe0RIoCxPwCcQ9T3EieueL3EnPFHDqCgn
 pWcGwzs8VKPbI8wc1fb+PGW8OuYgkJybEsWtR9d/E5J+gAnWKgoHTwGZooQHKjbUcD3o
 mOg56cICOwMyN/LGf+/CcMQHu4V0eQ8Rzd+qLh7SoarvWtYiV562KyUrPXkvNBBRHqTa
 iYFWskCtSG7qFSXnSfkHsN98WaaR6ug9JWyxgjXf5d8l2id4gd5MM2SWLx6vHFZ7wdCF
 AIqg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8j8xk5hfD9Rim9eePr1chlzTzr8s4ogWbvTI7paP7D3W5ozLiyiL1B/xMFYm3KkQmaBvcnAxltQg==@nongnu.org
X-Gm-Message-State: AOJu0YwCZn+OtIogqb2/EIVlh55I+6RLAkhFThuIj1yB8jvXhnT8E162
 kBlZ6TOWp5wH2rrEG0JShxfu3CbPW/PEcUY7WHwzzXAvVFhKCwDMXv717QjFSOaAGYQ8d+KVw7u
 R4SBQDx1MVc2VBYHE81okLn4Dx0LyeiD52iVqGmKr8g==
X-Gm-Gg: Acq92OF3LIPZ+XFiyCqh+XbuZpd1Ig5PWGELIxZ4e+NVY2BcXuwre18wvV0hr6DTq3y
 3yvbAteRCMFrRO1V/LfRsGPjKLwOqh0FVSdDYQqkfNiNZUMkostjC3lDen7bJCtNbXasatncfnA
 KfdyMrINLYg4+seGmzpnDRILrde/+0cnE3qBHb+CTDV5RKWS8ieIJMUBgsz6apb2Xw7avQhmzhi
 LURzlUHcVJABpeitVReCEJP3RfZmyHlBpDoL/WnomvJy60i0L3oRimTtXsFo+gswZyAO+S9tuDb
 y/VjdYGpBCL5tXVNpcZLCT0L5ZPrczSCp4r5jDgc1uB5TPo5G71/eYNEkabh3xZo9rU=
X-Received: by 2002:a05:6402:358a:b0:67d:7e99:bf4e with SMTP id
 4fb4d7f45d1cf-67d7e99dbf8mr12904734a12.23.1778511344777; Mon, 11 May 2026
 07:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260507135816.71171-1-philmd@linaro.org>
In-Reply-To: <20260507135816.71171-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2026 15:55:32 +0100
X-Gm-Features: AVHnY4Ie-olQv5pFeO2VeMx-01TWBPN7at8OUMBeA8XwpiKIsGjEvNGjXwgvRis
Message-ID: <CAFEAcA-d2EspJcjyfbBNPX3x6GF0kbDCO1bnoDWb4pyEnFgRhw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Build ARM/HVF GICv3 stub once
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Thu, 7 May 2026 at 14:58, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Move arm_gicv3_hvf_stub.c, introduced in commit 48396ad6ce9
> ("hw/intc: arm_gicv3_hvf: save/restore Apple GIC state"), to
> the global stub_ss[] source set which holds stub files being
> built once for all binaries, instead of one time per system
> binary. This prevents symbol clash when trying to build a
> single QEMU system binary:
>
>   clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
>   duplicate symbol '_vmstate_gicv3_hvf' in:
>       libqemu-aarch64-softmmu.a.p/hw_intc_arm_gicv3_hvf_stub.c.o
>       libqemu-arm-softmmu.a.p/hw_intc_arm_gicv3_hvf_stub.c.o
>   ld: 1 duplicate symbols
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

