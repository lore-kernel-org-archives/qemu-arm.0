Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1807198lfb;
        Thu, 26 Nov 2020 14:28:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWBAudscysJ83O+KaEi59duvKRkX083rUnV7N9TVyA80+NYNMdtxwUAIcPgJdzGqHLUcIq
X-Received: by 2002:a25:c4:: with SMTP id 187mr5222117yba.517.1606429735397;
        Thu, 26 Nov 2020 14:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606429735; cv=none;
        d=google.com; s=arc-20160816;
        b=fcIyKMnJKCum1BacIXslExWfu/y1d63/WeVX3V1Puzkv1hBIllZJyRkjfSOoTOyPgU
         bf35B2eGTUW5c8w0cxVTNuEL/aY2amAsBWyooom1LFO3fZyZu+QR0WTjz+cjOwBX4LSN
         AS6B8PoESdRptxQZGP6pGxYgCy5eDI2ZsebLU2vxJIPs0OGGcOfAOdWi8RMsDTKUAxHQ
         r67yOO+dEeNOCCpZ/tafUM8vcAZHno7aY1rcjbievPpLR7HPlHd32juB6VtSoa0sRcbJ
         1i9yGkHyitz3ISrB5pIVEjR2atcfr5w9ewu3aRtMT3TWDJj8bdYcmvYb/claD8V3B9zg
         h+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0y4RpvpeQrQuyoRlFv0Z0WA/0BbXyrS+nASu+yXFU3o=;
        b=I8ACln93Nz5FrBqBRKLUGD8nbtj/DVSQYAfJoPvUcwTNPibZV4N9CkJ1T2ydWrc6TF
         klgCg6TILXIkNs9g5XpFqjk6WyzU4dekZMxWr2AxPLEPrGzvO10K29mpMoLF7RdkQDFv
         tuagtGesvmUR5ygG/ZyqjSypE4M7ABZyoIR3gs0jqg1pwce4uvlelR49k5FG9WZXr5E3
         PLjUkcnlPGvqB35/HA0zekpAthGO5d4UI9s+oRBzSBg5Yd5xvlakaVcYw+mF7sxavogY
         44I0IlGlwNWSVoQZw2uGfCr6nJZB8f8XgaSrMYdkSHdChH6SwnSYc8N67g/EK4NxN7yK
         DPHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hElLGIZy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p197si10178507ybc.189.2020.11.26.14.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 14:28:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hElLGIZy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiPl0-0007UZ-Rk
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 17:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiPiz-0006Bv-2F
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 17:26:49 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:37072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiPix-0001E4-Hp
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 17:26:48 -0500
Received: by mail-ej1-x642.google.com with SMTP id f9so2733752ejw.4
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2020 14:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0y4RpvpeQrQuyoRlFv0Z0WA/0BbXyrS+nASu+yXFU3o=;
 b=hElLGIZyKxfkWo5oFGt112j81TeN/dNGw+p6eQPpW5gD1U1gxlLNgXDXqH20REMoUB
 H7WH3lBucKZlCQ7UZM3tx52vobqNALWO7RXL8YglfbKxxPf7keFtYeVSoo6uNYeGzHWI
 EPeLAmOhV8Z5lBb0nY2OUmVzYmrqkCdC1yUaX81SrfGhhq0OfrbJQdCXTBEyKVRIy4IH
 ETdYQILz9JIxjGDnbstZwV5GZwrLpba5Jkqh9krRrZBL2ynI9wXm9Rqm41lwiJKKmlvX
 PpXno1N+zTThsK+mDjPJGkCDUhjlC1gbbC+jDoE7XQc/VdOIqHt7/Mt+2PfMk6E8rdWF
 85bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0y4RpvpeQrQuyoRlFv0Z0WA/0BbXyrS+nASu+yXFU3o=;
 b=HqqHitcAl19eYadFTwXIHDbQO9QM//j7Uwe9In7yBvjwBA8CxfsXhAbR/GxsOMv3n5
 3zEM2D2WlpEe3ZA/uou/uxNKekx8DWDuXEhsS0l0Qv4mDf9wIDhe87hgb9idfzHimzru
 qS1Dp2WZCDPd1ViaFccOAVtICZ59r1DnlyJYICyWsd01C2s/w3fCiHbKXnTa8VtEvvVj
 91/XnhAvYqsuOgz1ro0DomNvuj7+xa9QIUCAzUiY+WLkEX53CfpjtqIoLuA2vwxiec+1
 aRd+5cFCiwIQ+u/yTbtU0kQUgXmhkmPq8irVT4cVUc6ufo3+ioAsRZHtT89aYHPy6vFD
 41EQ==
X-Gm-Message-State: AOAM53031QiqCfgx1BCBmF5vTzYREmnL9A1FfJnDPSkf9AcgQizZuFsk
 Y5WYQNOVUgtFi0mlcJS8nvrKsCjGHYjy+2CDv494nQ==
X-Received: by 2002:a17:906:d8a9:: with SMTP id
 qc9mr4615748ejb.482.1606429605919; 
 Thu, 26 Nov 2020 14:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-5-agraf@csgraf.de>
 <CAFEAcA_XZu07Fg3G05VWYDYTJfMSAzOH5yyd=rFLJVa73juDtw@mail.gmail.com>
 <785c216b-d4b5-b65f-1ddf-4c6374b72ece@csgraf.de>
In-Reply-To: <785c216b-d4b5-b65f-1ddf-4c6374b72ece@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 22:26:34 +0000
Message-ID: <CAFEAcA9QUfBQpmH=8_A+xDm53GkkOgFEDnkTDXOX_1A-bFg0Ng@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm: Synchronize CPU on PSCI on
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ci0RNo+Iy+To

On Thu, 26 Nov 2020 at 22:16, Alexander Graf <agraf@csgraf.de> wrote:
> cpu_synchronize_state() sets the CPU registers into "dirty" state which
> means that env now holds the current copy. On the next entry, we then
> sync them back into HVF.
>
> Without the cpu_synchronize_state() call, HVF never knows that the CPU
> state is actually dirty. I guess it could as well live in cpu_reset()
> somewhere, but we have to get the state switched over to dirty one way
> or another.
>
> One interesting thing to note here is that the CPU actually comes up in
> "dirty" after init. But init is done on realization already. I'm not
> sure why we lose the dirty state in between that and the reset.

Yeah, it sounds like you need to figure out where the dirty
to not-dirty transitions ought to be happening rather than
just fudging things here...

-- PMM
