Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp626816ejf;
        Fri, 23 Feb 2024 07:20:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWA6eUNPv0D7Y+179iQ+F4SLOOF1JQ6Ov8UH3yX9LdnVgtmU1unCcjnUzzkioeKQlGZwglZ5hjTytSNcYOOd/s7OIK+RD2c
X-Google-Smtp-Source: AGHT+IGJ4Id8icbZ96BdgFOw9ZqqOvvgdSNNgctsyDrS+E1dDpuuY6dJse/E31i+vH0KM9zdsMDL
X-Received: by 2002:a05:6830:20c3:b0:6e4:81c2:a794 with SMTP id z3-20020a05683020c300b006e481c2a794mr128258otq.12.1708701648988;
        Fri, 23 Feb 2024 07:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708701648; cv=none;
        d=google.com; s=arc-20160816;
        b=LizviKxuxHRdt6o9169bLWXKVXS+rRzzjLVizOIpdKK2s9HLREyjGML+l91u1Yv0Wk
         sah88C8TDKulDFak/Wk+a2nxVMr7S37wKr6Hn5Y+c8/DNqcaIci762/J5ZBggTRaKcXM
         03mu4BSNBQBQ+Nz4dlOHZni6KLzfbBlTZYS4V37i7T7cG1t1iuMIgWQwO0DumSAZr3gm
         CvuJcm3bo7SybGBN/lnjf8CWT2kzfk4+FPaOCDM69i+n7NnDbBi4xFT+/DW22Oyesu6V
         TLwsCyj9h50fHUF+cmUWXKnB6UweN76kJ5YTMtLtaU4XcLbjCkCioSguPmdIENmeCbUG
         /u9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=oIv1Gk06z9tD/JisRcZsFGEjcZYehPqjDSC/Xnt5HDE=;
        fh=P2qEowBANoz7W3TASvgjWQ3Kpno1ihvvDShSbjIoRU8=;
        b=OJWrq2YjC0T0wUFJgOfdqTy27qBK2hDxTAe2AFxbGCmA9TCKVlyL7sdaHPOcYj2Hub
         /iEDHYvZKVbZdL6O1OtvXMhV9YRt86yEuZOwnRQR2OmoA26coai0mleSNPHofNc/cOJV
         eplYns3d4xDnZGd4h24x0pvbyPiVD8zvF8DW58+bFrrjdjGuFKx94ltmN032nyqJI0f3
         anL5h9Zw5gTpbypXwNFlRCMRfDAbzmSex4uwUG2Q7gXGrO5lgcidli5LOYJ/X3eYbJlr
         b1tbPQUDGHJ8m4QShKLgg1Uu+HjaGMRYgKLQuUkiovqYUqLHr0DUFvcNdZsU0Uf0RQ0m
         /tXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qoe//JRj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ee16-20020a05620a801000b00787510a3df2si15348128qkb.384.2024.02.23.07.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 07:20:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qoe//JRj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdXLu-0002R0-RG; Fri, 23 Feb 2024 10:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdX9Y-0003yr-Pn
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 10:07:57 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdX9X-00008y-Ah
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 10:07:56 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5640fef9fa6so1194993a12.0
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 07:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708700872; x=1709305672; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oIv1Gk06z9tD/JisRcZsFGEjcZYehPqjDSC/Xnt5HDE=;
 b=Qoe//JRjwV6wk5fUAyiqD5ayaZDoLHEec8lq43e+5yBAWlAIewzhP6a7KAYcyo4HvZ
 oz8Xq3P7LPzV7WA2MPrThZHWsNw6JV+S0sSkeX2C5xx2MpOHvwYJHX7agWTsZKB6CubE
 MN93nM1G1tQOHsubpcmAYhu1eeLaqiJ+3hqW3Cx0JTQ2Igt0IjLq7/Z4/l36snT+Y74r
 zGy5IYX28UQx1QVRrQw8vttgdVQVHsy5kNbYsJ+Y7ITCH0Ud/Sh5j+ysCwVeEZN2WSOK
 XS+GdqDo303qqz/acaR8E7xIRqVtwW0yDSDbyRMKBtrp/B9KiodS4LtmXeGKPTQOeXy5
 CEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708700872; x=1709305672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIv1Gk06z9tD/JisRcZsFGEjcZYehPqjDSC/Xnt5HDE=;
 b=YEr5hs+lvVDoTbUctm8wLggMlde8/qf03tsvGpQgnwgRWyRosY4Pa4wbVkR8A9M9v4
 fwCaBrk0lX/wIbY6D9gm5j4s9f1K12JM+VMmmCvSdnH3zrGDuWNEVPW/NlSW0HnZwsq4
 YWvTBV1AJfJF0KEzO4V4rRbul/j8dhxF2ArW/aY8wKf9wBmdfK3LJPTLC4E+rMDaE23S
 8ZUI+JK1EvyFcnjcrfbCeuwidgOewxTWr5uCS9gvySy+Mb1B24tCNVzCBkqplX+Hi2hD
 b7v3rwdogC6sWUI0Hg/BPNfV+EsYu2OBzf3d1fgBLtoHLRWzMBJv8oCn3PO8kvlldnsv
 Fx2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY1NPlUse3eXmlRHW29W/U2qy/PzpsTfCF1M0qxS1M0hABiJHSb9Y2zt9h+q9i73B+Nv6EYexfvA34kDzkcfsf8v7b
X-Gm-Message-State: AOJu0YxWXfmNtKS1qdQfz6/jO5/CEI+tC+J4duzsDhqK0HrUiQ/t9Itw
 RCqk5Ikcwtc4p9xl+W7sPyj7d3kcUuesQsP7GTxwx4N6HO5ryOxGPo+JtnsMHfuzMTYnoH1fXZR
 iD6mA7BGxWV9nbN02dLg4NlgVRagCTpeqxywPpg==
X-Received: by 2002:aa7:d912:0:b0:565:6c31:9a47 with SMTP id
 a18-20020aa7d912000000b005656c319a47mr88048edr.39.1708700872202; Fri, 23 Feb
 2024 07:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 15:07:40 +0000
Message-ID: <CAFEAcA9Lhw3KLEKwra86JskDrNgvi8N91efTH1aZO=YTHUknAA@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Add device STM32L4x5 RCC
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: NZHIktiYuk71

On Mon, 19 Feb 2024 at 20:09, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> This patch adds the STM32L4x5 RCC (Reset and Clock Control) device and is=
 part
> of a series implementing the STM32L4x5 with a few peripherals.
>
> Due to the high number of lines, I tried to split the patch into several =
independent commits.
> Each commit compiles on its own but I had to add temporary workarounds in=
 intermediary commits to allow them to compile even if some functions are n=
ot used. However, they have been removed once the functions were used. Tell=
 me if this is ok or if I should remove them.
>
> Also, the tests are not very exhaustive for the moment. I have not found =
a way to test the clocks' frequency from the qtests, which limits severely =
the exhaustiveness of the tests.

Where you have a device connected to an output clock that produces some
useful behaviour dependent on the clock frequency it is given (eg if
it is a timer device that has a timer count register you can read or
which will fire an interrupt or set a status bit after a certain time),
you can do something like:
 * configure the RCC for a given frequency
 * advance the simulation time with clock_step()
 * check that the device connected to that clock has changed
   in the way you expect it to

But you're right that we don't have any handy way to look specifically
at the outputs of a clock-controller to check the frequency they're set to.
It would probably be possible to add one, but we'd need to enhance
the qtest protocol to add a "for the Clock specified by this QOM path,
return the period it's currently set to".

-- PMM
