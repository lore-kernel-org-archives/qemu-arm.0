Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2698075lfy;
        Mon, 24 Aug 2020 09:39:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+41EOx6OvWXPgHKest10jYsU6knQMKO9f3YHL/ldUsIiYYXQNfUcVQI1DFTLxrXYgrERk
X-Received: by 2002:a25:1fd5:: with SMTP id f204mr9229096ybf.236.1598287190156;
        Mon, 24 Aug 2020 09:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598287190; cv=none;
        d=google.com; s=arc-20160816;
        b=FHZgtSlNr8B2JtiAtqUXmwkPv2PTHzNT5u9RemeMZIuMTN4jBgNsxTyKL/N6mTn/M9
         nOXSQJRfX2aa9ghozQ8JtXQrYtTCdJnhVAmrCR5RnFFKOg914OZXMnNe3sTLH//VY/tS
         gYbae+C4tLTahSQL8lN/vBvIPK014D5s0yYL6Fcmh0VBJ7Mi7OLdh9R4FZ/bvjTxtz6K
         qCpqUdMfL2wmHfGPx6ZhNFuFH5Mtr2s/oSKOJKAXFMTRHw1SqM/YHzIkg4bmia+5eSgM
         N0Uzytpq5JZWP5lvVFT3mi5NQI2cFrhPLKNZpYXGUwQ2UumFr9UQx9kdAbGHFNWKd00t
         DzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KUC5lQUeddxNURzwEfpyNte4kdBhJoq871krNkhUnvE=;
        b=J/2DFth3+P0+blst1Q1RqMp2ZSi/4L0TH8vZmmtT/Yevgim8LdWn8LyC2tjozEbU04
         Mnud6PzLYRmOWfvvNU5jv2drkVpb3W2BhUJ8JLjXg8cd9HDx+dnp4bwXpxG100tiS8cA
         drIyW2/+ei9orLovXo5RrLfw8yQ8l0IKMNbloeJ4itjofGv5uyJs3cROUr6tSRRH8ce2
         Ts9Wb3PSR2qAHBRxTSD1RTvNzo7MWWVZaEXynBqUDVKvU9qilNEpuAD0SDt8m2wA+fvw
         EhVkEQBWz8UctspusyfPR99YnQlIeuKw7pEd9OLnSMTxHSqNbEms11xdi+FP3L4vftTm
         uz6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iJQrFbsr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m74si12621443ybm.81.2020.08.24.09.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 09:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iJQrFbsr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAFVc-0003BY-4h
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 12:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFVU-0003Ar-Rf
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 12:39:40 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFVS-0007lc-JY
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 12:39:40 -0400
Received: by mail-ej1-x62d.google.com with SMTP id a26so12776045ejc.2
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 09:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KUC5lQUeddxNURzwEfpyNte4kdBhJoq871krNkhUnvE=;
 b=iJQrFbsrvKACOJhPS0KLuglagXanIhT7Q3T/Z53ANU08keJFePwzublDmOi0HDwRl+
 l635nVJNw8ntx3C76yte14dqsfRHK1Xk9+cqFIgBkOrxLEA1u1mCa12dST6d23Rv42Bn
 8+wiarJFreVZW8Udn18ZapD6+ckbWkHW0gSekkRAM952J5IaEAy50p+/OxuCIk2KdH8C
 ymNtuITGtiVekb4r+i7uu6vvRRCwOxeb7MWSeRrfoC/avkYm8ijWbDC4APURY+cTMwkf
 hTS5zuIkf29GHeLVirmtxc58qlNcQUmz1veFKNKRohxGQj5S7SSsIfps2dROmiLnA8M9
 P0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KUC5lQUeddxNURzwEfpyNte4kdBhJoq871krNkhUnvE=;
 b=Fen2efDzQDJaDOpeslTukE1uYO9MSpFrM+W3Nt6rkNFQ2GeXqRGia33XmzFwwsJHqC
 G0cJBjHbOPncA6y/6dphNIZ5uoiSuH4ZcOYsidJow6d34npztm2uG37k1YZHvrNSHDVe
 VJfSh4OhuDXCOqWn5PyfWFtMFkKMq6PmxS5YS2DnATz+ZMVi48+fgNBbWUXvZeWtOnwc
 UeKP1SQ4rH49DpSms3V/uBtDXcl2z6+lAwbHwnLXrkkuYXhDgHycAPAvo+/CyBmNBx/i
 aMvEiRDgh4Cl6Jrff2j5VW4tgmqzVBYlAad4gzsKqltfIK+hJWDaBrrBm+8vLcqqkx4P
 lobA==
X-Gm-Message-State: AOAM530JOk5OMWVVcy7hDLjNt2itJlLzhtElGv4s9rJ5Euyv+9zcTdxy
 ahkRCk//3dCMFFnnORBhj7WcPVzaW56KIW8QPoiOXQ==
X-Received: by 2002:a17:906:d8ca:: with SMTP id
 re10mr6116139ejb.382.1598287176846; 
 Mon, 24 Aug 2020 09:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200803105647.22223-1-f4bug@amsat.org>
In-Reply-To: <20200803105647.22223-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 17:39:25 +0100
Message-ID: <CAFEAcA-r5_iZQnj3JmWRYhUwuD6cr=PmJQKcUvbAiHm--ymWiQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.1? 0/4] hw/arm/xilinx_zynq: Call
 qdev_connect_clock_in() before DeviceRealize
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fTQh5aWE2J6g

On Mon, 3 Aug 2020 at 11:56, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> This is not a critical issue, but still annoying if you use tracing.
>
> Maybe it is worth fixing for forks that are based on release tags,
> else consider it 5.2 material.
>
> Anyway we can still discuss if qdev_connect_clock_in() is supposed to
> be callable *after* DeviceRealize.
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/arm/xilinx_zynq: Uninline cadence_uart_create()
>   hw/arm/xilinx_zynq: Call qdev_connect_clock_in() before DeviceRealize
>   hw/qdev-clock: Uninline qdev_connect_clock_in()
>   hw/qdev-clock: Avoid calling qdev_connect_clock_in after DeviceRealize
>


Applied to target-arm.next, thanks.

-- PMM
