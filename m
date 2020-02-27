Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4574515lfg;
        Thu, 27 Feb 2020 07:14:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqyDtQPOALw8PXs6COnevLIyLYUskwLRZEjgE1J4Xj+G7tJP9lhaojRzaMWGpFY15ZnffJp8
X-Received: by 2002:ac8:4cc9:: with SMTP id l9mr5132057qtv.207.1582816476791;
        Thu, 27 Feb 2020 07:14:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582816476; cv=none;
        d=google.com; s=arc-20160816;
        b=dyJpSzMkz/NDKGw8yAu/AwwUUTsiADjvU1T1BCarNgy3G4RuiUhs7wjAUrYNx4b86q
         zhnQNxPJ+20TFp48oKVH7G+O10nRNdwlIHWizMXcgcAWDK70wfkIkpawAEAoqvKCnKBl
         IXvWcgjh+fOGWH2kC0jRezbzwWzQrBxok9ErJvGvSmYaFkjEpcpYGt8G7OG48K/TGznz
         5AkPMIDhJXU/I/jB4ZvENZ7Lru9brqGu3+v4XjUuB71t4YXIugHd77bVTDonIAFGqstk
         Eb2NSyp13ie5fxyL72wepHL/ng3jOltnzJ6xAxonSz1GWCYkk7bWQRoNjOErILGF/6Vo
         AQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tBunEO6n1Cf3cqibwNADI9A/VhZGvU7kq5vzac51UFs=;
        b=sXwuPp7hppJyVynDTP84FLGB01WVMF1g42MQegi6uw2YXNNCidzw/MXzqrHYmu0dga
         AEnWs+24/lfp3M8rrUrgEGqWW1c7VGfBLdMKNdp3v2qToAMSCzHhnxdQtiOCufUlaDEX
         SfUjkETzCxFnhtoqf1HpFj8dj/8bd/OEEc0c6KI4UTqgbB9JbKc5LP4a3HHfU2UqAqbG
         cr5TqMFV1GxFp4cElEzyymKkXMKlWEClBt7qMoHWZPdMuo3R8t1C1my1EbXuRKgB8DVk
         CUb4NEEy/+/VJEFxXZsFYwtRfDwKxBiI3821/rUD7LP7lUWd7daDuD7OtuJ3vG7aVUlC
         9Dtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JBemmj6f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p22si1310413qtn.382.2020.02.27.07.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 07:14:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JBemmj6f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7Ks0-0000bu-7J
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 10:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54996)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7Krq-0000bV-Ei
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 10:14:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7Krp-0003DC-Bv
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 10:14:26 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38337)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7Krp-0003CO-3k
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 10:14:25 -0500
Received: by mail-ot1-x341.google.com with SMTP id z9so3216907oth.5
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2020 07:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tBunEO6n1Cf3cqibwNADI9A/VhZGvU7kq5vzac51UFs=;
 b=JBemmj6fDzrzZHcTQqIF5ooil6h9GdvALZS29ShHp/Ao5mTXmNOQJvqdtrSyUwseqy
 euy2Zv46C3pOxM3Q7kO3YFmKHKM3PoVunxZdKgXcsKOSZP+DtFGAf3H6wEcAK0zyTQe5
 5j3tgVHfgpB6Z1FP0ZJzpu1+rGW5UNMO1Dqjbj9y9Wq2vnS1FVKsnUq1oEVaqhyvYO0g
 kRgu7jtNdj1lReKucp03nRmlBmw7yRO6W9hAdOgsEcM24+/QuD2umDViwhekAjnrlGlE
 RC780l6NX8vrDDHPnIih9cFnQfL04Kb+vmzspPefOJ8Z/JM3myQDBJ5aoImeKxNxhcmv
 lCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tBunEO6n1Cf3cqibwNADI9A/VhZGvU7kq5vzac51UFs=;
 b=UIqddToGkPcs7+kJBd94hjz6YgFSaWJ+xsKVpSCbz/aVg8YPN+iPCqizexmxLPS5tb
 sa7AYUtMjabIZT82gzMXgxjC4MPvPdC6d5PhrbZkwIKzW/eoT27QKMNVXl1DkyRWddhL
 jo84ONhdmKdgPSQQFS+ARekpzr2kaal/IvYruTpYPGeNcTswg6VmydafQJf38iM8+KwS
 UvAFlUqhgqLRD8Z6aevJVGt764xNzvXJk/LNh14i95gsn1volM+hs3X3/uyxQ70SPf/I
 4Wn+BNYxTm8qyUFBpIFMEMUTnN/0Lpq3vFUps2YjkKfltrr9RIB78WQTvU67pMa0PKfd
 P/8w==
X-Gm-Message-State: APjAAAXo/OaOvj/FcQVVSpHNQzIlKktv1aFygWq+MApA/4jg2+uMUD91
 MpEH8L7prbmYWr0jm4hWxOF3vPnXCYfHY/0uRHNzYg==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr89504otq.97.1582816463293; 
 Thu, 27 Feb 2020 07:14:23 -0800 (PST)
MIME-Version: 1.0
References: <20200227112617.66044-1-root@stephanos.io>
 <20200227112617.66044-2-root@stephanos.io>
 <CAFEAcA9qbndHqoW1oaUAKMZY5hNYjP+mMt-K_WqoT9Z=Q=ct7g@mail.gmail.com>
 <e1813f57-57ac-e6ad-d119-dd6c2cdc90e1@redhat.com>
 <SLXP216MB0285F1E97DBA3FDED2ED72D2BDEB0@SLXP216MB0285.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <SLXP216MB0285F1E97DBA3FDED2ED72D2BDEB0@SLXP216MB0285.KORP216.PROD.OUTLOOK.COM>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2020 15:14:12 +0000
Message-ID: <CAFEAcA_s_UgtRJKjHnwFrPj0PSzbEuPEpdePnTpJ0bbuBrCJug@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm/armv7m: Downgrade CPU reset handler priority
To: Stephanos Ioannidis <root@stephanos.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NnujbElPcFsO

On Thu, 27 Feb 2020 at 15:08, Stephanos Ioannidis <root@stephanos.io> wrote=
:
> On 2/27/20 10:31 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > I think Alistair and myself use the 'loader' device with Cortex-M board=
s and never hit this problem.
>
> I tried both `-kernel [ELF IMAGE]` and `-device loader,file=3D[ELF IMAGE]=
` without any success; in both cases, without this patch, QEMU hard-faults =
during start-up due to the unavailability of the vector table content at th=
e time of CPU reset.

You only run into this bug if:
 * you're using a Cortex-M CPU
 * and the board model has aliased memory regions so that the
   flash or memory you're loading the ELF file into appears at
   multiple addresses in the memory map
 * and the ELF file loads the data into the aliased address
   rather than the CPU's VTOR register reset value (which is
   0 for CPUs without the Security Extension)
 * but it doesn't matter whether you use -kernel or -device loader

So you can work around it by linking your images to be loaded
at 0 rather than the higher address. It is definitely a bug
that we don't correctly handle these ELF images.

thanks
-- PMM
