Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A9D606A326
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NtpEJK2o
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPLmI-0003PL-Q0; Fri, 06 Nov 2026 10:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPLmH-0003Ob-0g
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 10:22:53 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPLmF-0006I2-Dm
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 10:22:52 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8b33a08df33so6392847b3.1
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 07:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793978569; cv=none;
 d=google.com; s=arc-20260327;
 b=jzzZwJ3yamGr48X5hJOOaMtI3KeXlgJZS8MlhF7+DSjoRP0ZIuVPkKaxWxt37X3qTE
 Tp/sp9ddBQWhEqLKIO0LxaCiIvDCUvfjRPv2UHTl0cLKp4Ji0/dy981wle11w/NmoYdI
 iprLSrHcUxJzN9Pu2FV6v4kf8X5PnxFZ09RbND/Fz2BY71VxUVrP6cX7kiZEoWoJKoAR
 RUKBKbYlwhUDg8o/foJhF7i4ZK4w9ssyn92HVsIqojBHb+/Nfzv8FAFc7CnSAOgaHihe
 pIIpKoPCvn9QaAU7s7Oj04cppZzzuAfG9YuM6Es1M8sk8CVToKaGvzHCmf4RuQ+r6+uz
 KMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NgCynz2BTXsi7D6o3kCFYHP6eF5uA7H0LsUorveUV7g=;
 fh=+sExoGn0fqZoGk21g2es2VLurf0ZncFQPZIGTNxjRyQ=;
 b=QZn33ItoD5VksmzGq1LhbgZBRcSkov/7eG3ftovPjUjAv2gSnCnVDlz/c5nXElIWWk
 bPtm+rH7V0IkbKVkoxikzsfxkFga74Z33vCMobYzKi9aasKS43WfklgYJpapBgS1faIz
 8DdOn8Ts5vfXF79BnoDUenKkyz7zahkdPYpQ45leE4w5nXSKc0u33tGXpNi/si27acL+
 rUn4aptXiZB8FN5RzO1cZP2Tm10V2B3IkfYINrLK4Oz6m7Na306VAph2PVbf+jRZN/fp
 XLfgC8Wq0kH+lB4m5QPNuvJSpPfXEekJxnGvuRyQaRLljZeGxdulOFeNAZB1YlKsnMjV
 Adkg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793978569; x=1794583369; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NgCynz2BTXsi7D6o3kCFYHP6eF5uA7H0LsUorveUV7g=;
 b=NtpEJK2o7U3Ixhlh2C/RHInUjTAfdokXKtp/nQIX3UyyhjMoMMbT6RKc8VnOKNBcSB
 JLdnwT6O+Nnjy8BCkL8cvO9QJXbjN6p8jS3rn3t4UyUbEO11mt/FSYn9NyXvD1EmQ9d2
 xuvxyXQG80PaELeuG2nQEIDyBZhF7JaT029/TBpWhyeXWdM1XcXYLmXWE1qqJFJubvgv
 9okyMgtYvdUJs6jbJNxLo7iLUWP3laJVSZk0BI1sf+kPtQPYqxe4Bfx5sj/mfeLJWWYi
 ySde4PB2E37uB4Mvbo0HWUHmSd991abN6B/9cxaU5bI7QiRSbJoER5FIE5EWbzyoLVxZ
 7owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793978569; x=1794583369;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=NgCynz2BTXsi7D6o3kCFYHP6eF5uA7H0LsUorveUV7g=;
 b=UbKiYLh3dDIm3PhfSuee54+sXARHVtzfpPCzjlY9usp62DiaJO2RJON3LVYQqidmdj
 1Wz/oKm0DckfRR9vfuf49Zgv9x+JNKjLuFfg8iImu0N2PtJSZwxLxtMl9wvW/2gM6Wwq
 6fVz6cACTDuX3s8/KJdy4QfAOw8YedcmSuKWd4xeXAOTxhWXhGagdZ9i/kcZmyfnLsbR
 JTX2/PdIjhlFMBLIF2NtHndSap+rHzGaGwxWDxYw/eURGSNFF4uBqPNsaoxdxtinNS81
 622UzJ8o720mkiU3RfmWI4+btyzqHFSeZk9PxpnGFz1T1CZg117cYoSLr/uAntibUalS
 hvjg==
X-Forwarded-Encrypted: i=1;
 AL+hErEfkHh30ySq6YiQIwHHNOaLl4Rlex9PKbK5swcqOSdCrOr2lXVKXIKpVrVGVr8BbuusOgLP+e8gRA==@nongnu.org
X-Gm-Message-State: APuU4Z8eEf4HQ6E1OW537bAwQfYheGI/jarnvBizEYm0TwcuwocTHm34
 J5GjnhgHLXcDApD0KZmbRoS5Gp6UqW0QmtKX0DRl6fV2zB+HBq0BZXBEpL2gpzf8NzWc0R7gBuA
 qfFunx/J/k0AY3PBuY4J78FVsOOJvvIfv1lLAcTBCYuFrs2rOnbAo6nM=
X-Gm-Gg: AYBFou3wHei9J6mt4z1Ou4TyXpaFeU0QmsdiNNnwBtP6PhXZcN5GC+NiPH6usqL6Ot2
 xLiaSVbdwJH+Kgop6kOMZEkIPxU0qXKXXMQR3ZIyV+CZ4IESessBGly21yCfg73GVOKwDzjViMh
 vUvzP9SQGQokcQ5g/RfzODfgWvXwgshtxtOpzDfB20hAndgFL3CpjLpZ00NmkqIXayUfHmQD/IU
 pD1wIfX8gqNQS3upnRAlXyQt1yd+dwL7phxbdo5RhubhadmzFq0mpVehP3Nh4ydoPgL4wIn/BfY
 +hAZ65rdzoD/D+6+vkNyzXEfQDMCDvYV7+WhUJr5PRy2k4ntgKJrRhEbA6DJ0E35pt6BGj7eKtb
 JyVlLwTmIkJ3lg2tl7CUVqpwqXs4F/aQh0vqhkDp+h4koePkHwhh0G1EoElhzMxJphFZGH/xn1r
 Qvq7AFGlX0NiPCENHI1Zfb
X-Received: by 2002:a05:690c:dc8:b0:8ac:c329:682d with SMTP id
 00721157ae682-8b341917c9emr17131407b3.11.1793978569320; Fri, 06 Nov 2026
 07:22:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104140058.24068-1-marcelomanzo@gmail.com>
In-Reply-To: <20261104140058.24068-1-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2026 15:22:37 +0000
X-Gm-Features: AclHuK_U9J4G1p9ShG1MX9X2A8t5Zq8VUeUZoSsx1y9Hlnl9-74V58pyzlRfhqE
Message-ID: <CAFEAcA8ZMdOF0MphnEEYTNTRJPmzx6rw0Q9N0jgiBkb9W1tf7Q@mail.gmail.com>
Subject: Re: [PATCH] hw/net/bcm2838_genet: fit the RX frame within the guest's
 buffer
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Wed, 4 Nov 2026 at 14:01, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> The RX path clamped the payload copied into each descriptor only
> against the whole RING_BUF_SIZE register (whose upper half is the ring
> size, not a buffer length) and against the size of the rx_packet
> staging buffer. It did not account for the status block and 2 byte pad
> that precede the payload, nor for the 4 byte CRC that is added to the
> reported BUFLENGTH when CRC forwarding is enabled. The BUFLENGTH
> written to the descriptor could therefore exceed the buffer the guest
> supplied.
>
> Clamp the payload to the guest's buffer size minus the status block,
> pad and CRC. BUFLENGTH is then at most the buffer size, which is at
> most MAX_FRAME_SIZE, so it fits its 12 bit field by construction.
> (It cannot overflow today, because receive() drops frames larger than
> MAX_PACKET_SIZE, but nothing in the descriptor code made that obvious.)
>
> This also fixes a hang: with a buffer size of 0 the old code copied
> zero bytes per iteration and never made progress through the frame.
> Treat a buffer too small to hold any payload as a guest error and drop
> the frame.
>
> Resolves: Coverity CID 1690161
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

