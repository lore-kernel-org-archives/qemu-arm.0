Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3242541lft;
        Mon, 4 Jul 2022 06:49:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0YaRlu2wOJUjz2j4IAw2CHA2ay2omLyxThtPFORM5YC4IbwOyrZbytCEzCCLjOZPyYI6k
X-Received: by 2002:a05:620a:a4f:b0:6b4:7dc9:2e0b with SMTP id j15-20020a05620a0a4f00b006b47dc92e0bmr478299qka.100.1656942594377;
        Mon, 04 Jul 2022 06:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656942594; cv=none;
        d=google.com; s=arc-20160816;
        b=Y21s9r6f7LfLiMoUZHyyEuS9tTcIicZia+lV4ZkoN0x0QoZjl+L5wN900/ngBvqLC1
         WftHTLmqlP4Qxa6nbDUM9ZUKJbp0J0pORXuh280rUVPRbz74kqZAq1nSmrjNhQE0q0Zf
         oK1VuAjZug0HVa9cKpOT1CjMFNWd7/z/EDipdyyUM+hhLdnTAajfxw4R8oUXBoQ19uw1
         RQ9huZ0P0ncDQmNrb2QtVLNME5jiZOB8/PbM7zi54TDq/DB5JuSa+h0CcQN6Siq1Vmv2
         qnHIUDnMz5HM8rnA6k9itpmebDGQvNBkO7RAb5qMep5IaJlkuMJt8SlN2LX5wpi7FFfA
         2oBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rFWcARzgioLhc7mszRFWnY3H5j6n7sixLEMnVdjW1JQ=;
        b=VQomDnu2uwBnPzcmlBdma0iv7QRltg49VlIBHUueWG/jDK+Nr4r1r2t4Qgc0c6ZU9/
         pXvvd5XEgVjYsMIK09xEqEaHTqBQl/WUtrbcJ8UcAiDuNIz7+MDZVC7ZpLRpxkz6IQH5
         EoHX/9blcfySwC3cdgM8PI1YOuWummiVBOjaNmg7giAUuNyt9zGmB2RSW6EwD0yJycEi
         vAZx04EMatRSa9GjosS9Rl0X9TDf8utfyjnHeYPrfN09Ag3v/Is5xstJH1SbFfhG02YH
         DOhkeXjGyOiPOv73Mc+ho72qr8Rh7YBB5LOv6PxUb9DK+n5wIRQGRXUp2CyBg9Az0LRI
         ou+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QtVVg7cS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ff24-20020a05622a4d9800b0031d36dcbd8dsi5691639qtb.567.2022.07.04.06.49.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:49:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QtVVg7cS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MSX-0000T1-SG
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M1N-0005Q7-VU
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:21:50 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:33781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M1M-0002td-Eu
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:21:49 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id 76so1267845ybd.0
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rFWcARzgioLhc7mszRFWnY3H5j6n7sixLEMnVdjW1JQ=;
 b=QtVVg7cS55S/3GXKZUTYwMw0QkgTJle3AhHfmNj2kUGF3HKBDjhv3yCR8fXTn5y4D5
 /D0oWzPjZF5hfX56IeztY4vDHCxrymy39bjHrFu2ZN/ImWfY9ds9yhDrXwdKJu+okLyV
 TKliFspDvbFyLANwswj0cCNqwhBiaKggTQ99CPmeldcc+ZqPNr92B6/b0Sj58KS4HwoU
 Miq5d7PmnFKzKrna7Zrfu4+KApcpXmcZvSVFOUL9w+svQvkc0m+4q98NIGbklVMMtCed
 e1wbQKI/ZB3OPLTrU8lEsBPOHW96RiFfWa8De77W/48nqxGL1NZFJfFSj4mE3SFUmOj6
 VvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rFWcARzgioLhc7mszRFWnY3H5j6n7sixLEMnVdjW1JQ=;
 b=y7G2qPXdRE3OtF5P2C/cQz9ptn73EiF1m5/h1z/IZebH5UillRCGBgyR27PnnV43+f
 6kQLUa2k2uSXASv0h5jomL/bzwxShdQ6SX2vYm1EEYQkLPt6GC5Rx41LcIit93IcgWSS
 rkRF8NgXxDJ0CMfdRa00bKRXw/VDcqFDRCKB/uAaZ5ysL3srdApPu7jzFJJHjZEi1q+m
 3lpApMQf06YnfZbpUX6rUQuZZShSSkRRbua2SYQfukMXakrXT1vC/lhbNmsSELbztcIu
 h4vi4akUpvYc3Gg2N07LUNvjcGNPviy1JXM1g1UBHdflP7n+iTt9gxNZ5j4GTA8Mta49
 UmZQ==
X-Gm-Message-State: AJIora+BW9ZLV7QaWXXcs4uAchzTFlUDPyLIqanq/pYg3L48puyawaWc
 bOD3v6swb2rVseG3iU00LJHCw3H6rjxlDtCb/CEbAw==
X-Received: by 2002:a25:500e:0:b0:66e:4c27:6223 with SMTP id
 e14-20020a25500e000000b0066e4c276223mr4873819ybb.85.1656940907140; Mon, 04
 Jul 2022 06:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-14-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-14-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:21:36 +0100
Message-ID: <CAFEAcA_zL1OaBJMoQZC-1vz1KRSf-rn=f3K7VGVFhk7nu+S-WA@mail.gmail.com>
Subject: Re: [PATCH 13/40] lasips2: remove the qdev base property and the
 lasips2_properties array
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: THvhnFRpaaMK

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The base property was only needed for use by vmstate_register() in order to
> preserve migration compatibility. Now that the lasips2 migration state is
> registered through the DeviceClass vmsd field, the base property and also
> the lasips2_properties array can be removed completely as they are no longer
> required.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
