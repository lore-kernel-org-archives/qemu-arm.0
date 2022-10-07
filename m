Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp287977ocg;
        Fri, 7 Oct 2022 01:17:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4d2ROPs9k2PNFWOSYTloc8oYYkmUuVycaeMtE9X3bQU683HbT80enyiLQsehzNqegZAFud
X-Received: by 2002:a05:620a:172c:b0:6e6:9896:7ee1 with SMTP id az44-20020a05620a172c00b006e698967ee1mr2818553qkb.298.1665130676151;
        Fri, 07 Oct 2022 01:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665130676; cv=none;
        d=google.com; s=arc-20160816;
        b=uOHZ/HjW+piyDWkzQZcoEm92+nq9NKdtkJ+u1Hb+S24IRKCATiFw0un/8UEjSHWhJu
         BYl48v0pjcGmoqIfIggoHJFmiWUEcLgt9Z23QRMisr3HFikoRpCXK5OWE0g0hfGufxb1
         SR+79dLpKRD+zvfw9CkFBXxi+iZn4JP0KzxffGs24AtWJjG2/v8HSP1sehcKn4gMr9C9
         HJrSkHDpKtioWH1g2Xyfk4eyiRHdcTa+/4uW7lFb1usOLVwhSDrNX/33JHpl44v7eL72
         jPepYe1lZLFbmiN9GmryPk614zKdiKqZKCLJ6k5VJW8I7mqlgzbcv26HFLfpSQ3Iu/yv
         EyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Xx18lHJrJa25XpeylvaXYsd+YwQwXe9Yw+bbuhBl8ys=;
        b=iaIGXNlCFjHDX8FId3KPQ4URC8dF+DQMq4QXxUSVOxxvgEVG/qvrvvaBcWoDEjMr/W
         4cj5lRfiCl1L9Qc3ut/r1UdDUTGHV+VMZWFZRZtptKUsmBvGlR0ozOifmG9mG5uY49e8
         9HCivXk9GB1S4tr5L9ZtBJ21A6r6xTy3+1qWU97egJVIR4I/yQ6UVVOrbcf4Vt+da7V0
         I0No8bowo4SRuquV8g+0b7xclCLdR4sOA6OsSivUCr11pWlc+hZLmjbPkuE0AJGIY3H7
         n/cX3KuosGZVZT+SRf0V1nJyuhxlUWqFZ9AWh20WMbaqK+/NyzK988w0nlaNOjg/LmjP
         2YHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ktXfQ58e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020a0562140acc00b00496e2258627si579958qvi.129.2022.10.07.01.17.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 01:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ktXfQ58e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogiYL-0002GG-ST
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 04:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogiPM-0007Zf-H5
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:08:37 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:44578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogiPL-0005mX-1W
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:08:36 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so4068406pjl.3
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 01:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xx18lHJrJa25XpeylvaXYsd+YwQwXe9Yw+bbuhBl8ys=;
 b=ktXfQ58e8A5ADWaWQBK1zfljs2h1bWl/47izBE6RZ6dEg1VlWAOf3jPZCB2RAriCui
 ld2c5kXXTNin2WpQx3JR29/oPn82JRI2bE2cXsmjmUmpo6MnRRdh+uS7d9og9En0OsWI
 E4CvkAMKKK8hPWoornQOP0HNV7UANtwV931SAfbIkx0kG6wH92ZOnVMSZiclA1HmoiEC
 yNk+3+WdFYIYB/BlN2GCwG60fwXxjyhQDvDZwv3pNWfoXGjVf2JZfi/rBLEfw2My1hkL
 iPPV0vje/Aho2t6JgUGIZpHg+mHf6CaLDY5rDd60uC9IiRKxoYeQnsAgdBEHwcwJQM4H
 /kEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xx18lHJrJa25XpeylvaXYsd+YwQwXe9Yw+bbuhBl8ys=;
 b=vnfncK7h56ImM6CXhz3z8/JANcVcQJHNu8wqBN/WozmVbTwqcrqnkU4AEd0Rt6majZ
 NgHgYcNbEOABYu6h3RtXdZPeCANr3AclW+YqodaLKlmG5SZPdTN4i+g78pNRj3cRwC00
 R2RVdg3nBcd4ylY/XuN9BgyYkuZikc0slKN+n7TPqDqyll541wnuInLagiGNbY/fXHHU
 rLwm7qYTkqo3Nq+QIN/K48NH/8/mJkPjkzxSJU6e0F/CJCaUJqHgsnTb5xsy0SLkanRD
 IP3UYmoox54SBBM/MKAIO13nA8RgX3SHg0VBTVXiLG8fqVBEhL+WtcqD8yVO+Sm7qS3l
 di1A==
X-Gm-Message-State: ACrzQf15vXf+XpN4sEaHa0wpBKNS+JbGG1Mj49b1RUC7mxUNP7osq5Yj
 KEDdRfrwSdEWcd8qBwtjG0+gv1dkYbHuoSj6rBvO7A==
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr3598554plb.60.1665130113509; Fri, 07
 Oct 2022 01:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221006225232.3558794-1-patrick@stwcx.xyz>
 <fb8c58b9-35d9-55ab-5164-a28530ba38a8@kaod.org>
In-Reply-To: <fb8c58b9-35d9-55ab-5164-a28530ba38a8@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 09:08:21 +0100
Message-ID: <CAFEAcA_UNe+3-i6T8vrRNSVWg9nO6RWGi6bF7SX0Sf9xO5k17A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/aspeed: increase Bletchley memory size
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Patrick Williams <patrick@stwcx.xyz>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: seCSOOOkHNdV

On Fri, 7 Oct 2022 at 08:28, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 10/7/22 00:52, Patrick Williams wrote:
> > For the PVT-class hardware we have increased the memory size of
> > this device to 2 GiB.  Adjust the device model accordingly.
>
> You should add some defines similar to  :
>
>      /* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
>      #if HOST_LONG_BITS =3D=3D 32
>      #define FUJI_BMC_RAM_SIZE (1 * GiB)
>      #else
>      #define FUJI_BMC_RAM_SIZE (2 * GiB)
>      #endif
>
> or are we done with 32bit hosts ?

We are not.

-- PMM
