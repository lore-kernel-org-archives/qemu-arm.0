Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp1210372lfl;
        Wed, 16 Feb 2022 09:31:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxZaLulw/nQkDZ9Rb2FFWDmmB7qHthlgLe91R8xwiK0y7sYxQBAblr0GwFp8aM09konnLo
X-Received: by 2002:a05:6902:110b:b0:61b:3576:95d1 with SMTP id o11-20020a056902110b00b0061b357695d1mr3061633ybu.694.1645032685689;
        Wed, 16 Feb 2022 09:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645032685; cv=none;
        d=google.com; s=arc-20160816;
        b=NemQW71+2glP0h5MgZEZObq//WS8wBx+55KU9MCOHJW+Nw47fkaGyvhr6AeTYkWMHl
         O4voS1hUy2KW9q/mB62JnspG2I3SFgADiFWtFSFe57VMbWvd5bHnKDgD2B6VeMp7qhWn
         j6HIDBJpAS1mCYQFKJL8NgYH7Rr+7uI5IOeIBMnZ+PgMFeXAuxvTjNvcGeMfI1FPJUh/
         3Sr2wgtc5pnn1q7h57a1e1B2brqpE6UuP47e9JUbl/Q0O8osh8VnKraiQCGxcS4KADGs
         P5YGJL5Bma98xETu+bQu8Yk8Y4YRWeD2Afnn0moLgixrcflxioSKc0i7k+RGK0dN3xe6
         Oisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vBUm0YdV2EE79xpUeJWWQEnL6VxDFYRjfpbc3mKWXw0=;
        b=H4pOmZ4bp8zokXB//z7D7WZ2YcgctuNs+qq3CnEgO8v6MgzM4J1Ngv+3Ftt9sdcZHp
         nxMgtRWAUeQbzY4vW/dEzssuVQX62+eGtIG0m841PQrbi22y4iEXcVLGbt+yrO0+U7ng
         lTgIEZ8zS61M1I/yV2NTJZwugDBVwZZTjuxJs0l3gIVJ8YnAdJ3ijtSn0ZlJKOYSIQwU
         BmS+V3AMUeOHOsYQD+xL/VMeX7thsq+jirhducEtuY6y8/HhMIl1OL6FFfBhhu5J3cnK
         fJfHRSFGvE0pO5QoqtOgSz3fBR7159VMRxui843mDT63kDDnUWkuM1+Kgf/wipt3moCN
         1nIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y9rIHPlX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si18715491ywy.133.2022.02.16.09.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Feb 2022 09:31:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y9rIHPlX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKO9E-0001Yg-TN
	for alex.bennee@linaro.org; Wed, 16 Feb 2022 12:31:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKO8b-0001X4-OA
 for qemu-arm@nongnu.org; Wed, 16 Feb 2022 12:30:48 -0500
Received: from [2a00:1450:4864:20::432] (port=45655
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKO8X-0006N5-F3
 for qemu-arm@nongnu.org; Wed, 16 Feb 2022 12:30:44 -0500
Received: by mail-wr1-x432.google.com with SMTP id p9so4615145wra.12
 for <qemu-arm@nongnu.org>; Wed, 16 Feb 2022 09:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vBUm0YdV2EE79xpUeJWWQEnL6VxDFYRjfpbc3mKWXw0=;
 b=y9rIHPlXNoi+KrqaNOSYDqpysoZfMXwoe1WigX/ec4GBMQTKw1bAEbjFBnY5zj1pgr
 u8FoRd9McNI543zi190ApODe4meOHTeB+4fMkBowEk+8915K9KyqEvgBRa5PC6wJSEop
 lXDqEjykdx61dVcXpm+RNSxGkjat8VDFRScbOqrjIwmnjlm2GALK/xyLBJuPw15OIRVd
 qM2YdJuGKlSIA5YjxFs1+1jfgo3266hDyLRDnWBPieg89jJH2IHURpwRFfcUir032n4B
 l/pnUb8Bj8z1PEm47z8si8Fnmb8LgBxgGAIpcmEVZ7AHPo/FeyYKvmJd2gdt0TLzjsYy
 Fl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vBUm0YdV2EE79xpUeJWWQEnL6VxDFYRjfpbc3mKWXw0=;
 b=mG7D9ofCos15JgJ1QuJJiotIuinh/ttnSCJFzY9k/kH+R9lTyHVJmxjtI6XVi10j+h
 tT0s29MLOjtxbp5MKfq24vuoSkkk4It/329a5rkUbBFeToeUO4GxeACGVKvwdgV6o+AU
 x7lLgh7RoH/SlnYWHOrIavoQ6m9upi8xPaiRzZSq9NxDygM5F5LH+PJINCOSBDYhZlQh
 69/b/qDBLBP0+InwWuZenK0A5wNmU2EyhKp96VvJL+JR4vlSDxX3kXH1Tgz4vYBZDV5j
 awG+fGXgR3sHmXZpaQjaNUaPLZR+lk/CdGSUu3S2gQmdlI6tI72qvr06TqhVAJV8JzAb
 c97A==
X-Gm-Message-State: AOAM533tvUno4I5ExE0PsY/r+4ogasXrz9rgYLREi0i9rVe/EPxn8LNp
 bqc5SO9o7T3lNJhn3L1XLF4Jvcus5Z1otTTX9eraqQ==
X-Received: by 2002:a5d:59ac:0:b0:1e4:9b6e:eac7 with SMTP id
 p12-20020a5d59ac000000b001e49b6eeac7mr3188214wrr.172.1645032622226; Wed, 16
 Feb 2022 09:30:22 -0800 (PST)
MIME-Version: 1.0
References: <20220208181843.4003568-1-venture@google.com>
In-Reply-To: <20220208181843.4003568-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 17:30:10 +0000
Message-ID: <CAFEAcA8m2yhtih_+XCOJPUzAwtLuF2exF+vaa1woC7bYoryVXA@mail.gmail.com>
Subject: Re: [PATCH v3] tests/qtest: add qtests for npcm7xx sdhci
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, Shengtan Mao <stmao@google.com>,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, Chris Rauer <crauer@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OH+2iYSMBbwV

On Tue, 8 Feb 2022 at 18:18, Patrick Venture <venture@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
