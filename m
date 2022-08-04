Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp235065lfg;
        Thu, 4 Aug 2022 01:56:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5wo4h6/gVhyEGKNPVgj/+f9yVQdlAKD9qM9yYpeTPE5vCEBVGmXbzNlYFgDuwLoiwBY4xA
X-Received: by 2002:a05:620a:258a:b0:6b6:641c:9e8b with SMTP id x10-20020a05620a258a00b006b6641c9e8bmr553957qko.82.1659603363039;
        Thu, 04 Aug 2022 01:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659603363; cv=none;
        d=google.com; s=arc-20160816;
        b=o3zd/RAk9txrL6AVuXjNKRNKJBaGWSaDSUgxoXFqVOJu/+6zBRFS3Hxnhp4zp3HmVS
         8egmfCOk3hU8+nzOxyuAyu/ZVhF1KBMxLR7DIu9OkhWakjVv867X3O+BXLgtR9sZHfAg
         PQEt8R+c9cpoKHuZZgRMaXXrDygeCC7lebpOXtS9dO6F0Ca8WjAKarRvIYYOh3+YlvZX
         QSQv+sphMKvvcmzUWBk3JC3MBSTHi3yYW53XEQCeBGOXD+OioQ1CqsJJL2U17qnkqNmF
         GYkQoVOgiCV9DU8ReFJ8Lrwv+46OtJJbsF1GirVtFdNV46cOR8zjtTaudpsnkdzL11y3
         ufhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PzFHIKQTt/ASL7fVzo7cV0t0XlivZ8KMG3ejpHTM6cw=;
        b=ZJbpZYkZYkEyB3pvSB0f7TYx0hpBN6a/mrTH1kNbPXCQFn+UDOn+5T12UHoXU2Png4
         V9wrgYoKagZmOkUEr/SKnfb26pX66rtKXUuEpERTaPrmtelr/ZJkMNxYZsE+3w6t5o21
         +TXbx5pyvb8ggs5PsEwjgNXT6Kwp+7gZGgXOvbUNsrWSa0MFLYw0Eu1W5hWhs1XQjA7M
         gG8TdijRn5y+AXHeeg0YrrfkPuOo6NdjpM9MK3XteQBJbdU99za9+oUAWA68gUtjeJZL
         WiCSUxJ3QX8yqSbius3xE14jl8Onka1mT5vT45/4p7z3V9U2M/WjeJWv1lVCEjcfA2Gm
         VoLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IUFteWRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020ac8548f000000b0031effea2293si237466qtq.194.2022.08.04.01.56.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Aug 2022 01:56:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IUFteWRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJWeA-0005es-DJ
	for alex.bennee@linaro.org; Thu, 04 Aug 2022 04:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJWY1-0000Us-7Q
 for qemu-arm@nongnu.org; Thu, 04 Aug 2022 04:49:53 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:35544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJWXp-0007ju-MN
 for qemu-arm@nongnu.org; Thu, 04 Aug 2022 04:49:34 -0400
Received: by mail-yb1-xb30.google.com with SMTP id n8so32082054yba.2
 for <qemu-arm@nongnu.org>; Thu, 04 Aug 2022 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=PzFHIKQTt/ASL7fVzo7cV0t0XlivZ8KMG3ejpHTM6cw=;
 b=IUFteWRuXNy9stWzvK/wpFL6T6e/GFkGWODWMxeqDpznVEEEY2cU6HiYAGfLBmin5A
 1cNANefVNI0qd5SffinMOkCpQc73shKxKDTKHGNgyZHXZ6me9IauJZ0JEGIo4dlc5iKz
 nmVputpPKveH/lxvdtwnTJbByYvXFMOu3UsEB7zn+m81AD05YQPUNBvWr9iqO7q4PWHq
 SN7m8WIjwV7SWH3zKfAXzrhIfQdXZEt1br7BdVtpTrINH6qwNf8rd3AP1+Gu2F5appCU
 zOoO+5wGmcKBoYJb3XEJiu61lEb9el2XePxUPmNhKi1VI2jIF5QHLLCcmKbvdNDG6zY3
 GpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=PzFHIKQTt/ASL7fVzo7cV0t0XlivZ8KMG3ejpHTM6cw=;
 b=BU6aBbnwB8XnhWBZEqB6WhWcQXsoktbt9iFUSDMlcgKyZn7uj9Sq5GgHn6udL40lPs
 dqNOp1tqvOjjfQbV3c/STD9ki4GA51opnE2JDhjKmOaqkABQiKxwLqail8aZXth+0niI
 Mdwil/uL/Jw1k/eeJIZXR1VB5sfDTu17KwlRwaGXRWUM8BILlM9Wp/IbfAwkn3kO0L4N
 /UbBUDv3RevwE8X/Nsc896tZ0Pexrp5BlrRYTHR8gIquLLkKgnHZjwYvi0c0zAh8NjGl
 20EvNbZUIRsMxWjk862QV/suqLndNIMAQQuE2rb1sEV2ogARlphlS4ESP6xa92+nQGTV
 hp7Q==
X-Gm-Message-State: ACgBeo1+hazO1tVEftS+4eTsjQdlI58RUqBWcPBYVwGk2ldEsrleu8hQ
 u9zfY46cRr+ca5suOVQA3sIpMFVxvNz64PUFV/sOZw==
X-Received: by 2002:a25:cf47:0:b0:671:8224:75c6 with SMTP id
 f68-20020a25cf47000000b00671822475c6mr596294ybg.288.1659602968213; Thu, 04
 Aug 2022 01:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF8ZPDC+HOoJd=ssDT++KVbGyXV6bZUmri1anz08tfdWMA@mail.gmail.com>
In-Reply-To: <CAL7npF8ZPDC+HOoJd=ssDT++KVbGyXV6bZUmri1anz08tfdWMA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Aug 2022 09:48:47 +0100
Message-ID: <CAFEAcA_qOWrJt45gffZCBTDGku=K7NLhQ=zp20efYDm5jMAe9A@mail.gmail.com>
Subject: Re: [qemu-arm-static] [Known-issue] readdir() returns NULL
 (errno=EOVERFLOW) for 32-bit user-static qemu on 64-bit host
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QsATA/0Oaqb7

On Wed, 3 Aug 2022 at 23:16, Jon Alduan <jon.alduan@gmail.com> wrote:
>
> Hello qemu-arm community,
>
> I did not set up this email with usual format and contents, as this is a =
known issue.
> See Bug #1805913 =E2=80=9Creaddir() returns NULL (errno=3DEOVERFLOW) for =
32-bi...=E2=80=9D : Bugs : QEMU (launchpad.net)

We don't use launchpad any more; the current gitlab issue is:
https://gitlab.com/qemu-project/qemu/-/issues/263

> I have currently this issue as I am using libc2.28. If I take specially f=
or that, libc2.27, as explained within the link, the issue disappears.
> However, I would like to avoid this effort because of maintenance problem=
s.
> I was not able to find a solution to this problem and I see, it is still =
reproducible on latest QEMU versions (7.0.50).
> In the link's thread a Kernel adaptation could fix it, but I saw nothing =
valuable there.
> Do you know how to fix or at least workaround it with QEMU or with Kernel=
?

This cannot be fixed in QEMU -- the only way to fix it is for the
kernel to gain a new API that QEMU can use to insist that
readdir directory offsets are restricted to 32 bit values.
So far that appears to be stalled: we have failed to persuade
the kernel developers to do anything :-(

thanks
-- PMM
