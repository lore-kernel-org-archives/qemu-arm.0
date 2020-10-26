Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3074956lfa;
        Mon, 26 Oct 2020 10:40:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+TKUiWDGE6lpY/lCy54gxpoZ8sVJ132b3rXFFouCbw6pbPgOJeJAJcHdKH55Th777bOBV
X-Received: by 2002:a05:620a:128b:: with SMTP id w11mr15774332qki.181.1603734006507;
        Mon, 26 Oct 2020 10:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603734006; cv=none;
        d=google.com; s=arc-20160816;
        b=fbHi+OThXiB2yRZ27A95ssWNrTOd8XUEBFBJNT7gAyL7R264K+GpXok8+352YRvB4J
         Hnz/pnGXIDaTA3mGwgY3c2l4aV4z44yOmDCJ/R7WTcAgSfpsfQZl9AMcDv0eoCfoQlKh
         nl4/QA+2qZhbf3RyXNC8ngRuNc7emo3IVXg9bJwgGiKsGjIcfO12osyXQDzOuOTwg5sp
         Aejb/9tYhP0rABPtRKAw90buvsDbljUPvvem9BsbinD61f8PNS6VjLiN+b49HJv5ZPmH
         uWcXAW9fgkUOEXzKPu3zZv2YRtPlgq7xNxVedXvpkEudP2cuPH1zVjt7iBeXz6baqVfU
         kD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vxAv0lWoZx8C5WFTT6h0MSryuJV3P7Oh2D8vRQwO2kI=;
        b=oIjoaUATOpQjc0JscLnhgxcpJoOCDtYNTw7aVRRqB37LD2JT7qmnLDDewkD9dJb/Ul
         8PTJaupa8gZQj4Sk/2OOv82jpbYc/947vPV6lNtGfliL3cGiJCHhIDVtWUmzu5NKLzrl
         AyqPjqQC7oixko5ptu3JPauVOh16p4XCIzZD/wz32OvHooQFOsqsyxNCXxy6JqVvfdoW
         9HoNFnY/Cf9AANuu+GR+kMpu07dZVBPEd+b5dAzHuij0llgCxzW7lpmGTKflb272JNPD
         oGd35Hs8Yf6x6gv4eUR8bKchMkOrJD1aKGqF+XLLQSXhYg1BSkmWq9zMqLMxQ2DnjaIK
         7Hng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UPI4Q1MB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22si5876740qtx.346.2020.10.26.10.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 10:40:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UPI4Q1MB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kX6TV-0000Xz-Uy
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 13:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX6Ca-0004BP-Gp
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 13:22:37 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:43587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX6CU-0000ax-U8
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 13:22:35 -0400
Received: by mail-ej1-x643.google.com with SMTP id k3so14756500ejj.10
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2020 10:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vxAv0lWoZx8C5WFTT6h0MSryuJV3P7Oh2D8vRQwO2kI=;
 b=UPI4Q1MBnMT52SoAnYtuQIUZqhJm3/7kRo7HTBvXsa+HOYgzcYneyanCv/dRS2iir9
 iOwJ7gURdOqNU+UMZZh4kRrlYGXTka/WehLQBbhBAU6RRP+LlY8grkFM5mhz0z8aC3JQ
 f7PW0FyNEDcnTpvgwKp9D0Mgxw4rmvEsE2p4Net7JNA6E+vmXnUo9NWVB2mE1YmnArVr
 6ot8fmErY6Bb2ljXgRCzcK+qIUKQZv94OMWHDPRthex57FgCN1fQyW552am9bI9z485v
 N0a7TaZV3dlNHuQY+4TTl+cqtD8e8zbOsm5Noz4zMq/A0dg/tzTcTzVBz769cCBqJbXD
 aVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vxAv0lWoZx8C5WFTT6h0MSryuJV3P7Oh2D8vRQwO2kI=;
 b=PFq7/hSvOHCLlCKOVpH+HHZJuXQWQgdGzY65BzdhgDmf0FrSFUlForZZan2GLTk/vW
 XatbNfe94VgnkcFr9NGDHsVLbogPJkTJNZLfkudGxdcfaz3N4ckagues0o1C11oHIKsQ
 7e41uVwgGBI33U0rz9j4/rAZzkLF5As6XiuGnjsT/C4Afg1CIq6yHx3SHKzuqDgsZBNQ
 r8R3dCObDLEkIceGG7l4FHf7Q7PJthJNl19O9BSc2QKl5dhTWhUeY2Mp8Td1cA1WIljb
 mSi5tzNaGd+cTec7ud++WNCgKfPQoQxKsIP+fvHGpaZwdiGrYcG2phmqnCRNBQRDeCXx
 tCZw==
X-Gm-Message-State: AOAM5317q3HwZRgzgeug905qsV02q6jKQAiCul3LsnWpGhahNGluFasH
 R+Ge6fYHVLQ0slcaBLivHMDPXgLEbKnokqMM3/kIoc89hUk=
X-Received: by 2002:a17:906:3b59:: with SMTP id
 h25mr17396696ejf.56.1603732946895; 
 Mon, 26 Oct 2020 10:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201024170127.3592182-1-f4bug@amsat.org>
In-Reply-To: <20201024170127.3592182-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2020 17:22:15 +0000
Message-ID: <CAFEAcA_-HXBcS4qEcJ56uKv0-9jUetMDHz3-2=SqS_GssA758Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] hw/arm: Add raspi Zero, 1A+ and 3A+ machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc@lmichel.fr>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y9WGHjZlMzxa

On Sat, 24 Oct 2020 at 18:01, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Add the raspi0/1/3A+ machines.
>
> All series reviewed :)
>
> Since v3:
> - Addressed Igor's review comment and added his R-b tag
>
> Since v2:
> - Rebased
> - Addressed Igor comment
> - Added Luc R-b
> - Added model 3A+
>
> Since v1:
> - Use more specific machine names



Applied to target-arm.next, thanks.

-- PMM
