Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5604399lfc;
        Mon, 15 Feb 2021 05:08:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXs5giYkgvim/J60VCDaACiabLf8D3C4Fyx3lgOdOLGHaXbC0FuNEVspQoD+3IgpTF60k+
X-Received: by 2002:a1f:990a:: with SMTP id b10mr8056356vke.4.1613394491332;
        Mon, 15 Feb 2021 05:08:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613394491; cv=none;
        d=google.com; s=arc-20160816;
        b=utkbrAjFFKLpPUInjHUQrVaUXku9re8FIdhejL+Z/44CNDBsyMBDMlbQEFhXt6lVKB
         3kkhoAVe658NMHNm/k2XNr2eMiY5fMd8k701oSg/QELshf+ZDLkZ5aZWr2M6JbQgK9SV
         LOARbJRdbAwjNdNvCLc6XFZ5S3BvqF0wA8UgHzv4/8laQoIZpuipZGtyRw1Is07ndBYS
         2Te75KrwsLi+VGoMzBy/L9lDVo9SFQvFmi6t6arOGoYHLL88mvnqQTG7lsRPh+Z1CdkK
         4MDvouxZTFF5VrqyT5s38ZCd1GkdpePGbO2Mh5Jck5Z/Iju+3Lk6OJZFj9rOzv0eSjDX
         R3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IKJsdhkV2vJ6zx4ctG4+7oTMZNHczpTJrwy5PMpSZN8=;
        b=krjIy2Y5+IOz9iH3H+nn4GDOTt6URTiJo1p7Ejwpjnp1fRCmHcIG7o+etJW6hFRMCT
         7LdQ2C8v1mKek2fLvy8B3sUBsV8KONsOQnjUzsBSV7Hkzj3pR1UYgt7WDm3uuA0u7kKu
         JE5y+A8Ying1J6LxTLDZJkcNxLv/WxasgDBmMPXdzW/waiY8YU7XlDC/I3OOx1q5t8nB
         3kcC7yvuaMLvb9K9LZFHp6Ayeos0IrVg4jCILrAdOO+waW5HdfL8LcgByCSsaS9jCQ3p
         cauOLLnvX+Pu6X3NnlDoB1awam8MnLZ5Yfb//oFlAg1VCC6mJQ2vWWXsp0m8RVeEhm9i
         +49w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lTr2fokF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si2831765uac.256.2021.02.15.05.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 05:08:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lTr2fokF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBdbm-0007KZ-Lu
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 08:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBdaa-0007ID-AZ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:06:57 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBdaX-00018N-9J
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:06:56 -0500
Received: by mail-ej1-x634.google.com with SMTP id w1so10928146ejf.11
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IKJsdhkV2vJ6zx4ctG4+7oTMZNHczpTJrwy5PMpSZN8=;
 b=lTr2fokFpB6UTMSSQbvu8XBEpfWfT6Rcc4o4iYfZPAlMH8CovXPGKNwTi9ZLfjOeOE
 tsmOKIYPjiawLB+HBYilEsAWVizlGqG4B8VIY8rbpMtV8Q8u+tRs/hBiwJs7JNuM3lM9
 KKEnY8i9GgOB55j7CmM3Dd+kL0ZeubIlvYPWbbNhF6XgLE5AOoh8e57o6HrQJ7LNC9cV
 YONv2iTI5ClRpmvD3y7YZyXV5tX45Ucz7JrVbI/LKkG7x4ujrWMbLPqntY312oL71WDd
 DhNfhWFSKFVFfbclXTgVT3Nc35Gr2a0oLNV6KN9/8A0WVKleyYzk1v/tzJZX+PoSmHEK
 sTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IKJsdhkV2vJ6zx4ctG4+7oTMZNHczpTJrwy5PMpSZN8=;
 b=R1wTApilLTRs3z8gVjpRScsJZIB5iiRwqbzKlNh7I+nlivY1fBZDKJVzfuIoiNlpAu
 AiK/aFI9so6GXGXo7o9fAMmPxgpv3PHpRGHldtm+ip2pXuZIm1rdljsCtC3OIE+kILd6
 7hux7J9hpuwEgszTHS+rfTekrjI771ZRD+jNqxdPawy8dlqSaUhHG/E8TSieWlWkdaFg
 g0iHI0nZWRSkRs11OMEf/Pg3tAxCE6cMzivoiuFe9qTodu7zk4RtZM9fozC+P+LtBZ3e
 QJ5Vef5B5AA0jYA2eMF5jRB496hN800dJRlt5VKk/86qJ7RowSRg0ak7VORiFDFkeUi4
 IP8g==
X-Gm-Message-State: AOAM530R91+7Ze6d1LYMd4b+LVmoVNIP43cNMVelADOLNHXBfI0MNrNV
 fAEDuc6cdd3FUpTTiLDIKmxEMA49BpHmbbCMUnvRmw==
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr15580891ejh.85.1613394411600; 
 Mon, 15 Feb 2021 05:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-3-peter.maydell@linaro.org>
 <f8a4c9ac-5114-6f9a-8cad-4fc49b036d21@amsat.org>
In-Reply-To: <f8a4c9ac-5114-6f9a-8cad-4fc49b036d21@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Feb 2021 13:06:40 +0000
Message-ID: <CAFEAcA8h3J-Em5fRhFxxDhdmNF82Gza0oCPvE1kXJZhCGJGPLw@mail.gmail.com>
Subject: Re: [PATCH v2 02/24] hw/misc/mps2-scc: Support configurable number of
 OSCCLK values
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oXe0I6HjndTw

On Mon, 15 Feb 2021 at 12:02, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 2/15/21 12:51 PM, Peter Maydell wrote:
> > Currently the MPS2 SCC device implements a fixed number of OSCCLK
> > values (3).  The variant of this device in the MPS3 AN524 board has 6
> > OSCCLK values.  Switch to using a PROP_ARRAY, which allows board code
> > to specify how large the OSCCLK array should be as well as its
> > values.
> >
> > With a variable-length property array, the SCC no longer specifies
> > default values for the OSCCLKs, so we must set them explicitly in the
> > board code.  This defaults are actually incorrect for the an521 and
> > an505; we will correct this bug in a following patch.
> >
> > This is a migration compatibility break for all the mps boards.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> R-b stands :)
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Yeah, it's down here...

> > It would be possible to avoid the compat break, but we've already
> > broken compat for the mps boards this release cycle (eg in commit
> > eeae0b2bf4e69de2) when we added Clock support to the armsse code, so
> > there's no point in trying to keep compat for this change.
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

...below the '---' material, because the script I use to add
the r-by tags isn't clever enough to figure out that it ought to
add them above the '---' line rather than just at the bottom
of the commit message. Sorry about that.

-- PMM
