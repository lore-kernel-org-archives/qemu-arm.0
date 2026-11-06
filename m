Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2FD606A331
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E+z0Wq5h
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPMOp-0003w1-ED; Fri, 06 Nov 2026 11:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMOe-0003v4-E7
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 11:02:35 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMOb-00023d-67
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 11:02:31 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8b306bbff8eso5850537b3.3
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 08:02:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793980944; cv=none;
 d=google.com; s=arc-20260327;
 b=CW5T2pUOEKUsGUrkYc3B4gWCcFnva7Hia2DptCirCrs3T0D6t8SVB3RHFo3yizubrE
 xqHJazI1N8VKPPMV2kyArbTqdJKUq8z0XT0VX5N+WL1q6uJR+748ZzFQ1+0+D+IpltNP
 l1zeLm7GJPMs2iHVWSKcLUkWTUMaizrz8gDGUQD6r+LLLAGozf/DLqBDQndWsOW42gi4
 bvPm2TuWpQ1erQudBsLN3YKMkpfGcT9QnVFXpw3sGwTS3I3JLv/K9HCFYWKZRdp72jco
 MbwBpU7r/cKjuxvLbEVCGWHKERPYgltX74mLb2sVOLov44cfc2+Rvnaoot/ed7nYo7aG
 WgSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kZCBSloje9XqtTEpv7EcNMvQtBKDJh6EPwCU600igOY=;
 fh=Pn5k4soGPi+vl7do2U6vtr594uMX0/F5SgbQ/h3Mits=;
 b=awoVgNRnVXKlCv7xcTgpk9akeJzSQkTiS92q0pl0KIzo83u1v04zeqPpxIdnJfHcz1
 q0d9BIEmfRm/fuPI5RXtt+9YGo84lPGOsmI42Cr51Ii0Z6o0ln3FuZCAhZhUKHZ0jifk
 rVg+CmwkVx3jRRDrRQLAq/c85y/pYx/Z33Q8Bi8oYUrM6KzvcICsvMJKGaXLwU1qlnL0
 H9bO1dpQZm4Q7SVWzS7h0MiY7TZob/OKwWu7QZansYZffDVqI5I5wXQz20pLgovyULeU
 jqGpeGoswO59+9MksC+tbuF7DomBwJ6JYokFIl/HhPbRH5PpJy/onJIvpPIdL8VPNGbH
 I+rw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793980944; x=1794585744; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kZCBSloje9XqtTEpv7EcNMvQtBKDJh6EPwCU600igOY=;
 b=E+z0Wq5hYM2dwqThCFuhhet7H0P2HbDdUsa8R1vkISm/vBdaWtoG8NZGn9T8/etvni
 aCBzlsDLSh1sCDATb3DwpSAFKoLu5bDaA0RjE6O5mTZFt96a2EfT1gkmXy62UXAhn295
 j7duoypqi0Ij4Oe70adLpXL0EpMggSshElEAb2uDWZQnSDKEqtynMhGNLlpg/kW1Uxkp
 iSMVmlhNOQ9f3Vtc1rnbD2rZf59UYql0IKpP+mDRI5d1FiRlYFEPbnv0Li6ulsTBMGoc
 XpBLL3v3dx1fU1iocbLXe4W+Lq015e5dSraRty6vGY/gADfTLikaM//bDawMYIRQJXBH
 lEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793980944; x=1794585744;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kZCBSloje9XqtTEpv7EcNMvQtBKDJh6EPwCU600igOY=;
 b=xuMqce7ZK3GzWpRvgOHHDCdptPRR/vMVb7NqVVdMEb5SSw5SEUAoLOcah2CkB21p0S
 t3VkYxvD6me8VwUjFiNvWK+iEnRrl4UOz+C8z8K/nst9KW2zWtnMYmkEu1ngp8FVvJ+5
 iujAY5bafH9Ny4hSM3IFUV86XDUPLlFCXa7hvKzbOueXdfKO/GM/hRbbRcGcdz2xvYHG
 3vVt3CyWUzCHLaSmKSDosVF5mZNv4AgDAzkIla0o6cymHWlL2Wu8Hxb8r0q2rZJOk5qk
 1EwduP2rOkZV6WboRF2PxHEVW7wVL9BMOPKVOZnCfxJipnpXuVLOT2u7AOooEuIr7KNH
 sxcw==
X-Forwarded-Encrypted: i=1;
 AL+hErGEAUBccblaUmpY2ixzLDbM6u+46NX4ZJMdpPmeNUXDyWU8qQHQcIIOgiwpVxp7rwItQjahnsb/wQ==@nongnu.org
X-Gm-Message-State: APuU4Z9HvxXblh6w5a60DlFs95jwoEbZswmit8L3LHMwBZjb38prrIGM
 KIy6A+CzBRLgPwQQ5gINtyov9Zm7KhfhoUG1zNfdDSXgiTQl6ZPtyVhdxT9uCV7bPVeW2kmS2zz
 HHfyLhXv3CIOikvdqx5XblXl3cExt2uU+THU5jLi6vw==
X-Gm-Gg: AYBFou1wgy3Aio3A2bhuunfBNm+tslVFdKsOhUG/IDZy+RmJ47OJwBiKLITsKEbvJ2V
 gnSKbCEOMfb3TFzBoX33EdjPkbVZ7lXVmccZQ6Lejgyxlyc4wWvDIKElIYnmgCXyCgS1HR9vTt0
 8dbeUyPPAXJdVAKg5yz8qHHnb3MFLVu5cwm2WcBkr7xER4bJrkgHNIb712Id0LC1J9CNQtxcG87
 JOtP5VaPixU724O4Jr74z3ybtOD8kJJ2XlfzOXergfNH5cPBbdZJgvQ2USk9nmGe/zLbLMecm0e
 jYCIpVyy74XWNb3/vYOLshEoBAvDwzk4LdOyqc14a3AV/Mu48gv8EHk674Dwt0aIhHqv510q9Oj
 nrEp4PTYgvMgBvc4G8lVMjCnafNew0A8BVmFLfZbwDucET/iTrnYIiVd1fX3SafpIsEeYoXFEKh
 614p9PlX26WW+zvrNinXtc
X-Received: by 2002:a05:690c:6605:b0:8b1:a3f3:7085 with SMTP id
 00721157ae682-8b3419c287dmr11732157b3.60.1793980944149; Fri, 06 Nov 2026
 08:02:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-2-philmd@oss.qualcomm.com>
In-Reply-To: <20261105125203.40320-2-philmd@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2026 16:02:12 +0000
X-Gm-Features: AclHuK8uvR8xxkXdSiK1iaQiEfbrGMfyI7ASL-Ch-aBtNpd1c9eXgL8t4kEBjpQ
Message-ID: <CAFEAcA_kzBBUcyPEG3Cn8TnGqvqfOaq4_skEG+r1FXO0Q-n51g@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] tests/qtest: Use qemu_hexdump_to_buffer() in
 qtest_memwrite()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 5 Nov 2026 at 12:53, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Replace sprintf("%02x) by equivalent qemu_hexdump_to_buffer()
> helper and silent when using Apple clang 17.0.0:
>
>   ../tests/qtest/libqtest.c:1522:9: warning: 'sprintf' is deprecated:
>     This function is provided for compatibility reasons only.
>     Due to security concerns inherent in the design of sprintf(3),
>     it is highly recommended that you use snprintf(3) instead.
>     [-Wdeprecated-declarations]
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

