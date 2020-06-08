Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5029668lfc;
        Mon, 8 Jun 2020 05:25:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrULdneHdS9vePqZGrGmI4dSRDPigo/cOk+BZUzLbbIHZuToMlRPg9BwyX2wHQanzawNbd
X-Received: by 2002:a25:9bc6:: with SMTP id w6mr37631270ybo.408.1591619152907;
        Mon, 08 Jun 2020 05:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591619152; cv=none;
        d=google.com; s=arc-20160816;
        b=QqCUk7IelfsxP48reZxc71nSa/noKo62l6fTNObBM6Q2Pd6f33sE5zjARtRRWuCkOD
         mohiMuUZlCEpjF/1hBgRywRKnK/C31G9jsZ8NSqZSrV9diYVSpeovEsbBc5133EQCmqg
         4pqw/RXXYk2FIM7Bx3yE7X7oNAEYesetag+Cpog9+hG8voRACythBB+9p2wROGJfyAZT
         c5KGlvnGcVTMWf0sOeeGpggu8bzgNwfd2vdMS8eno49MeDWx7tmogh0++rE/Ktwh9MvS
         dje7bWU3tpV8HnUpIeQTDQv0jh9GQ1gFRkGnmYTFxR7eL6+YeDSVp90PdNUXkP20v56V
         zREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GeGuSHT3wZCmA3munjpkH7vDl/dT5GBX8q8JpAyMUPk=;
        b=zXBOGC6HUsiDaWb7wD/3C8Y39neq5ebZN1lCvxkm1tXJXaS9D5KnznRJLa3+M675lY
         32w0j0lLMrW4+oHU1uz5UnuivL/3vYfNWqnT8qoooyzZGNaxe22kZnovTTFgtChatUO3
         k0iPdkciFlePKXpRbiG1Wui4fm1tGxiC3RWLVv1tWee3AIdEXyQ8pSBU0aqWqdaj8qVb
         UMv9RCKRYCz5aQUYquW4GjRIFTunAFimmMihqdzSzDuBQQaTl9ORtzdMv7kswWJrl3KL
         q/3HBGOxycWNVz5klE1ZnTiDf2cdd/Ar8ZKNOZ+IixtXno+NQYR3uBAcOEJwzFiBstqb
         nANw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gxqV2PC2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8si1638900ybo.29.2020.06.08.05.25.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 05:25:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gxqV2PC2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiGqd-0000wy-Vr
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 08:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiGqS-0000vv-MB
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 08:25:40 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiGqR-0002n0-6o
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 08:25:40 -0400
Received: by mail-ot1-x343.google.com with SMTP id b18so13446299oti.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GeGuSHT3wZCmA3munjpkH7vDl/dT5GBX8q8JpAyMUPk=;
 b=gxqV2PC2hzDoBPBrc6Ej305mse7y3cPHmHPCft0JqS23JVpkjtVfOT0/z0FyDA5yFQ
 5iK6MFk10dlZyS7e3b4lzh2XlgQTVjYbGtzk8IAohWvG3+KoXW9nAQ1Y1SN1sAVPy4FU
 MLfBbLmIzGmCQIbAYJuhXzC3A3XtPKZwcpGM060XevfvbqspMuXL0PxruWppF+1eNOPZ
 /21oXFnXRM5VWU0f53lfcZQ/aDyGvZfSV02F3ceNlkqH40S7mQWu1OiVC0rFX/XErmCR
 eg5MSOM0tYzwyjTPrc9LASCR75l7c137durJCOGnaWsgU1iHMRv1xEIpknStNRP4+ciZ
 +djA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GeGuSHT3wZCmA3munjpkH7vDl/dT5GBX8q8JpAyMUPk=;
 b=EPmjL2mhcI6V7k67eYJO0Fx6OdRCxM/CyNLasmTq2uJG4ERvBBuy1Zs7pSLOiZDgof
 3YEuqYccwzKWNCFUrHEaJS0H3bvp2TK2GFm+Fnch+UJPcCUVJxFibNlRhTG3+kOD11V+
 gMULxkz1XPFnAvDHcNYq27P+x4e3FB6gDHqPdXMvxCs0S8z+A+M6JcNGFgjTikLfQCJ7
 C+DAGV/YuVIYXzErWoLvqTuQaCmKEPm/AEO3snm61O1P2faMJ8HAAwthcyaKpxE2Yg4k
 3XvbG0OgP4Rm2vUt6JgIf2KzRrE67MDm3PZrPHRCVrbXqjBiKOgv7iE3YHDhOqEweY1K
 9V8Q==
X-Gm-Message-State: AOAM533+Yq1DLZZAzNnlgFGYO+tA/tQ9YeGpMbM3PXONQGybHe86nPlx
 E+K9ViF1NY1R04zAyxrAakcOQRP+9Gis2FnS6Bq26Q==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr4934173otn.221.1591619137898; 
 Mon, 08 Jun 2020 05:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200608114028.25345-1-leif@nuviainc.com>
 <20200608114028.25345-2-leif@nuviainc.com>
In-Reply-To: <20200608114028.25345-2-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2020 13:25:27 +0100
Message-ID: <CAFEAcA_EUf+4NNr+=XNNMpf+p9v0AJC-EV4YyUZZB87ePASXvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] target/arm: commonalize aarch64 cpu init
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SLeceHKykaB4

On Mon, 8 Jun 2020 at 12:40, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Some basic options will be set by all aarch64 platforms.
> Break those out into a separate aarch64_cpu_common_init function, which
> also takes implementer, partnum, variant, and revision as arguments to
> set up MIDR.
>
> Invoke this to remove duplication between a57/a53/a72 init.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

I'm afraid I disagree with this patch's approach. All
these three CPUs are different implementations, and it's
just coincidence that they happen to set a lot of the
same feature flags.

Eventually the hope is that the feature flag checks will
be replaced with direct tests of the ID register bits,
at which point the feature flag settings will mostly
just go away.

thanks
-- PMM
