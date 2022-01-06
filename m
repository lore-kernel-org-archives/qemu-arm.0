Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1161209lfb;
        Thu, 6 Jan 2022 09:41:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylmGkj30DPw1z0el70fWcW9N2DUoG3tbQ/VG66ZhnXQe/vZmub0gDEdHtJsS/Pcu4OWz1y
X-Received: by 2002:a25:8401:: with SMTP id u1mr24296289ybk.179.1641490919187;
        Thu, 06 Jan 2022 09:41:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641490919; cv=none;
        d=google.com; s=arc-20160816;
        b=Qins6kyy7XfQl80PvEhEtc4CKTGTiNBS7WQ3XWqNiuTzRa8dp4IgyFfMvqmJ4/bE4R
         z7qbvWciwvfy0BWGWNRl3R3tZ1vBS/Ay6hD0xMSjzOsHmACgz7Xm6ifAAmj8dccDWm46
         XQQQaGb/MBszIAxWngUyr+EOpVT5Tdd/s8XrqVYnZgNDsSLYqQBWxUjGX8kaoPviGk5d
         2hLJwm0DNmVSo12pa2KRrXY1SUah4zKHP4CnOXVaGTHcfnNGbumby1DTPJF8EqGPPc0u
         ByeCfglvVdwOSbzEuqm0clD3RA9EISSaao+LwZo2gKfdtQJTq/6UnJBipkK+kmAOCoHx
         ahpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ah5wxiQ0AgQh1F/khNBb0l2wx0jcLCWgwsTaSKGpxSc=;
        b=JhmyJKt3+3M3Th4F/ShxQk1Lg5FbWNaXCnPxJbyvsTe76XDX4D27IQfbF43RIViRbS
         xqVlob5J9vBqulbAglrknHnO0b+teTUFn+9arMX6pE7m2MH9ZTf+T/IrQlB2ieqeNWLH
         Cy7yTFxMruZlys7lLTM64Y4gOSvQ/U7RTUY8hSED6gmtFN9YlcZTsX+A1FMP8URyTl3h
         z9TW6YsINunkZgpeVj6snPIgPOWXzf7UdSr63Antdg44MW5YGmDsgfHryi+z7HCy8jnH
         5u4wWsfljazxi9YI/k/dthOvdxIuUexSI+8e2pVb5yZ43n1D4sJlg88hKl4rbA2TmSqy
         DNAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vHehU4pS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22si1711785ybh.654.2022.01.06.09.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jan 2022 09:41:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vHehU4pS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5Wly-0007em-Ep
	for alex.bennee@linaro.org; Thu, 06 Jan 2022 12:41:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5Wlm-0007ba-Jq
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 12:41:46 -0500
Received: from [2a00:1450:4864:20::336] (port=41953
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5Wlk-00062I-Ld
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 12:41:46 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 g186-20020a1c9dc3000000b0034755f8fa58so866786wme.0
 for <qemu-arm@nongnu.org>; Thu, 06 Jan 2022 09:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ah5wxiQ0AgQh1F/khNBb0l2wx0jcLCWgwsTaSKGpxSc=;
 b=vHehU4pSaJCrCT+5RZjAgiNTyvANHm/zKNZCyPjzraJI4hD9sLG/77EAJEAuHm2JHN
 lUBQTZJHX/NTrR13NtfVw1R1ZsXSyWfUvEhtZhTlpREV7LHkjYaN/vuLFCZYDaexvbkN
 nO/1iHpO1MUdgiJ2vylzLqVRm0SFR72oOWHpq6zYN9CpNzt77tIzxTIhNop5sTEbpmot
 UyiN3cznN64n5cjKRYRtmntu+Z9wL0it3bi4QWT4G4S2f/X7jSuoMAXg5HoU88JRf3f0
 S1hYhbx8i0VgVNhlIkMb1EwwzL4XT6CHl/AJC94GstQEOPUXsIxYK/XHfIbauwW8MN5C
 GuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ah5wxiQ0AgQh1F/khNBb0l2wx0jcLCWgwsTaSKGpxSc=;
 b=c49YlhVKvFuG/0i8Cc97IDzVxA7Kgk3vzf7PJaNd3uWep8HAf9CHHGXLQpI+1Q/DaK
 c8G9KBzc2E9IVCNwEMfd33ahUV8ZH1IzR6x7URAUG0lQpcyD84kCm+uZQjBcu9EXnrjV
 1M3U4pF9i9mfmfIhP6RRm6R+8v+hAV4Neq0jIriGZZXk0ddREqSOd1CRr8bQ0PahQ4rC
 MFdOcigN0UhLZUIB1pjx7YbCg9FhHQwP/4q4tCA71Bqhs4iOcY9UWKXVZ8JiCdXOsqH6
 /sx3NNu5BYro0ZaN0cBp0se5+x8MVaPnSGTOOZDWW4yyU+oC8So3Br9tU8eNoUe9HfRJ
 r64A==
X-Gm-Message-State: AOAM531qkk0XHa1lv29r1WKyoG1YTiZUUBu5iZMjFKX4AVdBTKWuSvfQ
 5ECpKtBdU0ZP7dEIEr+HCh7jXnZipkrVD6ZCM6sYsg==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr7898850wmh.133.1641490903211; 
 Thu, 06 Jan 2022 09:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20211210083034.726610-1-troy_lee@aspeedtech.com>
 <914155fd-646e-b551-9c54-3b132a5abfa5@kaod.org>
In-Reply-To: <914155fd-646e-b551-9c54-3b132a5abfa5@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 17:41:32 +0000
Message-ID: <CAFEAcA-n+CDyqsLE=fyc2+LRqMFYiFOBkb8MShuUGRYsu=p2FA@mail.gmail.com>
Subject: Re: [PATCH v1] Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 qemu-devel@nongnu.org, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: idhoqEdOLr0s

On Fri, 10 Dec 2021 at 14:05, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 12/10/21 09:30, Troy Lee wrote:
> > AST2600 Display Port MCU introduces 0x18000000~0x1803FFFF as it's memor=
y
> > and io address. If guest machine try to access DPMCU memory, it will
> > cause a fatal error.
>
> The Aspeed SoCs have an "aspeed_soc.io" region for unimplemented devices
> but it's too small. Anyhow, it is better to have per logic unit. We shoul=
d
> change that one day.
>
> For my information, which FW image are you using ?
>
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>



Applied to target-arm.next, thanks.

-- PMM
