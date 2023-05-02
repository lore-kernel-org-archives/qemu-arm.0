Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2100282ejm;
        Tue, 2 May 2023 04:11:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7nuAPA/m5w/Loft7X9/KvstE9OCw3fLtVj+XF0T/iSWrq73yBkNoiX7HCGa/SKhpEsdott
X-Received: by 2002:a05:622a:2c7:b0:3ee:dffa:5b30 with SMTP id a7-20020a05622a02c700b003eedffa5b30mr30128913qtx.24.1683025891047;
        Tue, 02 May 2023 04:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683025891; cv=none;
        d=google.com; s=arc-20160816;
        b=CyYGt4z6P9Fgbv9igGlbSxmztcaZCD2Tn8U9diJWCh0LmycmS4ruyPFR8FWPtU1or0
         CIBOHpJlMja3o8J2rpZYIA6sUkz3t4jfhijm30Ca9SQIXlY28RG78A4TFOBEljM51POC
         0Rr8lBEHfHYRXJh4sxijHUZa6SG9xBMl8iBt+EraBAuIyxZAPAquMojJyxq2K9FtIMME
         LV8sKICQLZg0beiT5Urvp3BCCk3n5pDgkm7n6cC2BVjlGa5FEXFwYsBG2a7ykxims6xr
         iSjw1mntxjdIUFTYo+m294JP2buOkFvp7u5ccvgBa/+udXiFgGH96h0AKnyKX77Ri8i6
         x2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=TknfIgaxzR+ZJuIIyBbjoqhO2J0jNOEXRNk0vVgjNL4=;
        b=ZFMaLajvMhuKVh7VSfI5QofI5esS4zkBwbikq8EcP4ZkD5KznNLDq7IhbiltlwuLCM
         EF0rHy7hgn9Y72NaTOZJoVcVgt3Q/3qkDGi9m8EbGsJo9ZUWvY4X5zHfhacPb42LnVBD
         8qhTjEF59Hrg4Lghatst/xodKI3cu7rcT/3ZWYJHx2fMhvBhtI7TLhyBjOdywhKxSdmS
         s5bvOlMdZCXbUFa8ZFxKZS607e5jJkVtijXe1JCAMvOkEqSBXu2AX53waCAAw3PZ+hTZ
         TWaeDLNN9TMlJYDTqHuQAbZfaobprU1v3zA5D5KFvQJ6SDYGNhlMLtDufDgA6jBYY5Zv
         q0qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@danielbertalan.dev header.s=protonmail header.b=xDIevwLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=danielbertalan.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5-20020a05622a034500b003ef57ffc9f9si16690025qtw.17.2023.05.02.04.11.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 04:11:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@danielbertalan.dev header.s=protonmail header.b=xDIevwLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=danielbertalan.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ptnuH-0005ee-U7; Tue, 02 May 2023 07:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dani@danielbertalan.dev>)
 id 1ptnuE-0005eJ-7O
 for qemu-arm@nongnu.org; Tue, 02 May 2023 07:10:50 -0400
Received: from mail-40136.proton.ch ([185.70.40.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dani@danielbertalan.dev>)
 id 1ptnuA-00009N-Ka
 for qemu-arm@nongnu.org; Tue, 02 May 2023 07:10:49 -0400
Date: Tue, 02 May 2023 11:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danielbertalan.dev;
 s=protonmail; t=1683025841; x=1683285041;
 bh=TknfIgaxzR+ZJuIIyBbjoqhO2J0jNOEXRNk0vVgjNL4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=xDIevwLVIWQQQ4kCdx5OVmYLMOzHdw1k4E/j5wWwB/nD4ogW09dtDgeVByL2sRJmX
 aPSDrhYvG4Qir8NXUuao+xNI82sn11DM9mgsD95+SZThPYv6A8EI48o/a2otiBc6DK
 gx+0CBzPuGmxGbHvwrbt0mF4Pdh4B3ENgDKEHfZp3581XBxyknby6Dy1dugkxF70yw
 qLWMbbM6npW5ohkygY8DNDPk61fXmOaKN983EjH3bqPeNyF5OUZK+RoRudpCQOHy/R
 v1b9OLBDm2iW7DF84ZT5LI8wA5k0n+t086EKsJ0mhUx0UzSzq47misJz+oCk0K2hRV
 Vn4DD3a1cs2xQ==
To: Peter Maydell <peter.maydell@linaro.org>
From: Daniel Bertalan <dani@danielbertalan.dev>
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/bcm2835_property: Implement "get command line"
 message
Message-ID: <vxR7X7H0IH2rUOb1rvzXmmG3_3raS-2LMKN-ugFoq0ziCSX199bwb_i-zZ5_KdhWzllmtwIlvJF74epNBag-Etjya_nhkplFFNGmi6blpvs=@danielbertalan.dev>
In-Reply-To: <CAFEAcA9vHxxNGp4SC9AYnqCmLZ-a87MeD7Uq6no8n2Vxy9gi_w@mail.gmail.com>
References: <20230425103250.56653-1-dani@danielbertalan.dev>
 <CAFEAcA9vHxxNGp4SC9AYnqCmLZ-a87MeD7Uq6no8n2Vxy9gi_w@mail.gmail.com>
Feedback-ID: 20340505:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.136;
 envelope-from=dani@danielbertalan.dev; helo=mail-40136.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cjcXXT17biuR

Hi Peter,

Thank you for merging the patch.

On Tuesday, May 2nd, 2023 at 12:15, Peter Maydell <peter.maydell@linaro.org=
> wrote:
>=20
> Are there any particularly interesting bits of guest software
> that try to read this property ?

We plan to use it in the AArch64 port of SerenityOS temporarily, while
we are in the process of bringing up device tree support.
I added it here: <https://github.com/SerenityOS/serenity/pull/18557>

[sidenote]
By the way, do you know if anyone has managed to run the raspi3b emulation =
in
EL1 (under KVM/HVF)?

We are currently only targeting the Raspberry Pi as the the AArch64 porting=
 effort
is a small subproject -- virtio peripheral support is out of the question
at the moment. It would be great if those of us that use AArch64 developmen=
t
machines could run the OS under hardware acceleration, while still using th=
e
existing Raspi kernel drivers.

I'd be happy to put in the work to make it possible, but I don't know where
to start.
[/sidenote]

I haven't checked any mainstream OSes if they use this message, sorry.

Regards,

Daniel

