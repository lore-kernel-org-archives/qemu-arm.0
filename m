Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2579879lfg;
        Mon, 2 Mar 2020 07:42:20 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtmOZY3vyLXzFF/JA6vKFQcMivr+CRbzn3ISA/KebhdW4yn070kLW+Az/yQUq66SZQNa5bI
X-Received: by 2002:ac8:44bb:: with SMTP id a27mr317876qto.160.1583163740095;
        Mon, 02 Mar 2020 07:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583163740; cv=none;
        d=google.com; s=arc-20160816;
        b=DuAyrT51W/yIGdkpnHA+qV5I6PRqJDMWB7AkJyTDlUrHsBo5JWS9eSEP3zh6sV7cNn
         sPeSiJqw8Xv/FGlGD9Hw3eOLuQU9BCEYrF1AOGg2HfvsQTvo0a+ywNkulErig7MFpXul
         8dGIFz4szEdh+KQ+Qpo9Ymac19Oy6CWayuE+ST8r7WGAm3jSrOPu4Js6HtZYVnKIMlHu
         r5JS+4m0OaFBO8mp3IoFwcuovQkSh5zEqIATkpOZUpxC9lTo/6rivozc/KqcsK1yPtIy
         2NQEwAw232OF1Xw6Vy9aMATT4ROOAnD1my7md6Zxu0co9bpPC5Cigjymr57WnZbGlpKH
         Y+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qnpikZpenghZcvg8TrA30U3uz97Cyec/8QNbVbuXg9s=;
        b=SR+EynCIMjCqlIV+BcIMViasIiuwAOUahMRHrBF1H1s1WQ/1J6MAyKfABxUBUmYX9Q
         fgOZ9OqqHBsZxDlovHm9WOkjzObW8gzOPo2aS85hGTrYO/wupC2gvwuhwIL278NqI9zB
         E3neqOrORKob+U1sdJfu+cItETMry+fz9sx1R+yxCsRMGXEt8V6AKrLp++0MK59ncqlr
         eVZckgB1uMQhXGjVI6ZlowQBJLicbPz7Y0Ql4lUL/xuSncg/P4SyIh5sKLJLjVJRdsLS
         iS/k9kwvZZ/SfbnEiS+ZncT9jtqDQViPyHwi8MDl+ZdhanAhS6w+cyahxv+BaRgELHw3
         U3vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cmX0Qdrr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10si6276718qkb.307.2020.03.02.07.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 07:42:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cmX0Qdrr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8nD1-00069K-I0
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 10:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43325)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8nCs-00064Z-9O
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 10:42:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8nCr-0000A9-Cl
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 10:42:10 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42022)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8nCr-00009w-8M
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 10:42:09 -0500
Received: by mail-ot1-x343.google.com with SMTP id 66so10112376otd.9
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 07:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qnpikZpenghZcvg8TrA30U3uz97Cyec/8QNbVbuXg9s=;
 b=cmX0QdrrtGLVM+0d3LzUiB9SAAkxaO9YYqmgROfsaU02BFIkljru1uFTzxQi2pzZZD
 OqP16LUvmVe014+Cl/cWMWKcZJ4vmY04XbXGkwKd2eK0CX/u61iXI5zhGUsU1yllbm98
 fOlMgMP6q1pQBntlXqgIjUsQB5xqKV0ldh3Oan0RJHWmQZneycAIJ4IREjVuQJSZEh0L
 RyvTvDExblRVOnx4bMjhi061Cas+YlXCEjWpGbTTgoyMwJOrUWADW2FC4ZBfCD52Tw+c
 VXfrcTpes8ZCJBsCGL8lO/YONrSNfhbOFjfijoaJl5rpi1V1Sw3W7UdTH387l2qo+2DE
 RQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qnpikZpenghZcvg8TrA30U3uz97Cyec/8QNbVbuXg9s=;
 b=PAaAo6RfklITqEk3/KAov9NlnBH9EA+0qNhWmn53B5RBFaJyb+/SlB616XywLC34HX
 fsg+lzaSyrVJm9QpssrYf+EVgRfoVUWCyWm8XamjcVtD4w4PMjgXGqU0Z+CIY00yuy/7
 UovIs/TLd9vouTxX1Tn3gLtkF4znZL9PudRC7S3L8GkPpqntZw7kyLEmWBZSjRELTMZx
 kNcw7kW1jU/+iCAT3bsDQo8gYbNlEEK1sIgkxtmcONfwL1vVX2x2VfRQVBEWUxHaS5es
 /6JCs2ofbkx8O1UjqQCVidVFmnRwM9evf+b15RRW3Jyif5beekWYBphO4w4vpzJ7Qv3W
 ezbw==
X-Gm-Message-State: ANhLgQ39PfjDW8IlIbFE/GREdnw/q7RMSuuhSqAhdJe/B8fwj0KJ0Bb3
 nqZMEI4m7k999F3Q9fKny2FyLu0I242PJOKiUAg+IA==
X-Received: by 2002:a9d:6f88:: with SMTP id h8mr5379982otq.91.1583163728437;
 Mon, 02 Mar 2020 07:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
 <20200227220149.6845-4-nieklinnenbank@gmail.com>
In-Reply-To: <20200227220149.6845-4-nieklinnenbank@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 15:41:57 +0000
Message-ID: <CAFEAcA8u7F=F7VFsUUWm5PR+tqWk7ptS1tjjo2gAF+cBqjd25Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] hw/arm/cubieboard: restrict allowed RAM size to
 512MiB and 1GiB
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DpRkdk/Qo+em

On Thu, 27 Feb 2020 at 22:02, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> The Cubieboard contains either 512MiB or 1GiB of onboard RAM [1].
> Prevent changing RAM to a different size which could break user programs.
>
>  [1] http://linux-sunxi.org/Cubieboard
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
