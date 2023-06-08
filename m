Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp391604ejb;
        Thu, 8 Jun 2023 07:52:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4NV2FbP1QKnt3Xo86W+2Q7WmMswwulS09stMD91XWqpyk9KesWNgNh6cCPbTKMnBnXYUZV
X-Received: by 2002:a05:620a:880d:b0:75e:8f18:6fe4 with SMTP id qj13-20020a05620a880d00b0075e8f186fe4mr5591096qkn.44.1686235945469;
        Thu, 08 Jun 2023 07:52:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686235945; cv=none;
        d=google.com; s=arc-20160816;
        b=AIFvPf/FWr1wP8Le3qrhLjSE/lasXQg0IRH2fGprb7tua7MHypjumoKhTHCMaIAil0
         bidnLYgl4WaWXWFnnJTbzfWhZxHXC4bGUb/T5dALstIGnku0qAb0C1ueXyYTltcEe/Jm
         RGlPz7BliyHz8ZDUQWfSuQpN/gv4gVOVRXI9ZYum6c4qYpgVXFN/GjHFg3yKu96Zt0D3
         q4dURB0sy8Uo7WUa5kvoD2K2dbNGhyI3xC0+vEWLNLKl03Igb/pFKI+VRFjcGlWiiaUW
         5dxLX1UlIKi/etsl6RMtldZ8TL3dzJpO5zb+lbDfvPfU+YbEJCvY9JOS3lk1C1QHAcHO
         xKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=JxL1c+8WHNEQTzF53nQ27ehYDd2x3vCVLz9vMBU59zU=;
        b=hIdwUhgj/ONe2XxC6Aiof/yTwcI3EefPnu51cugr6S1GIJd4A9B2G8CSAlqoV6mzfU
         ihNSr3q+x3xVKB/knjIdzKU/kfFk86o1yG7Fg4zCdjlBe6UqY1S1CFgXRe8E6400NdwF
         dq5NqfsTt5uB2FkQ1Wj0VaCxUdJ8v0b5Ux0myvhUMz/47g7tc7KJrIuQBqbWpiKVpZuL
         NZqmlhZM+/AKEMyeE6yF92u96QduDRIDbT0Y6S4p4SfDd/zjPQlqqHseFYQyyTmZyQGH
         9RiBM1HC3gwXdSvnlYYGxLnemZedO8YWHfMXBNNZOrZNnp9eeC+Af1AL3SJncWqZFkk3
         a2eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vXkM4aq6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i23-20020a05620a075700b0074e3da5eec8si675696qki.626.2023.06.08.07.52.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 07:52:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vXkM4aq6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Gzq-0005iH-7m; Thu, 08 Jun 2023 10:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GzY-0005B0-DD
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:52:05 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GzD-0001lO-1S
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:51:54 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-97467e06511so129332566b.2
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 07:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686235895; x=1688827895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JxL1c+8WHNEQTzF53nQ27ehYDd2x3vCVLz9vMBU59zU=;
 b=vXkM4aq6/9WtZm3ru6jcjPr2ImX24/tDFfJ6UTO2ZagK4XKhR/hA4ddE/+v+OBRWOb
 +HqcEah9dykdso+0W/Cwv/qsWb+y8asWBKyrpeNHht+A36RA9ivaBvVVUjKcYPSgGVbf
 Jg7nZrcZwEqT9yL76Su5W3tWUmRmuc5Oo4m/UsBPxXqGBuYlFJRe9LV/2PEYg62mlyp2
 OzaelIOlcLMRNfXZmHbIzSuLeFQmjaObTnB4INR/zEUhmSBzripaqgR6b7AKz1dG8Q5S
 mzylI/ehDMp0tFuj30II3woYVU9VnKgvOROHIsND8Fnj046hT0Yv+m9bo210MgZVw4Ep
 8RAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686235895; x=1688827895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JxL1c+8WHNEQTzF53nQ27ehYDd2x3vCVLz9vMBU59zU=;
 b=E6DmQa9MiAyq4GTWjZ8+VCOyWLb1tvbFXnKFrbqXvpEHu51WZHJ2kM0VmOqzJLsdQD
 wOq6QwoAl2vABMOmhq0Iww7hrBIW/OS0dZZ3/jxbA2qoQTsezhbwWSCVuSICV/9agFHh
 i3NSRwshJ9s6tdJusk+X7r1b/BcalO8ce2weRM/Nuwf3ShN5EWbxib4cJ77fDURPA0Rx
 9NnKR6MikCgoH8p4JbrTAVnQrxltrMVHrCPHDKlVe5XfZMsIWsuYmQzfkKWasn2SziNV
 4AnAlwgyhp5XbhB9BPonAZh9BTwb49MZFdPTzpPCgQZrxlMNwjQR6MXG0VAUegfwXRim
 ir/A==
X-Gm-Message-State: AC+VfDwEpBBKagYHJi/ugRUVIPbJHtef2Bu/2XqWC4IVSSt1MdfRGtb8
 iTGhPDJbixw2SqCEnBfREc5yp+0IFbLHhbMEMQwK0Q==
X-Received: by 2002:a17:907:3f97:b0:96f:be1e:bf1d with SMTP id
 hr23-20020a1709073f9700b0096fbe1ebf1dmr9827813ejc.69.1686235894975; Thu, 08
 Jun 2023 07:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-12-philmd@linaro.org>
In-Reply-To: <20230531203559.29140-12-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 15:51:24 +0100
Message-ID: <CAFEAcA_J6w_Lopq4RR3nZPMo1fOa_B4CdckbnpkjBCFfW0CDGg@mail.gmail.com>
Subject: Re: [PATCH 11/15] hw/timer/arm_timer: Iterate on timers using for()
 loop statement
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fvHWAW/B9U9E

On Wed, 31 May 2023 at 21:37, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The same pattern is used for each timer, 2 or 3 times. To avoid
> too much code churn in the next commits, iterate on the number
> of timers using a for() loop statement.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
