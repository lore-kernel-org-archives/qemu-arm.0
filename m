Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1920734lfo;
        Fri, 5 Feb 2021 03:19:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGWHLuQA422nWfLmJ8IKR4YddfuLOdiTezGNEnh5wcCONlvCVTAd34lOeG46z6s3a/gh6S
X-Received: by 2002:a25:7453:: with SMTP id p80mr5379858ybc.297.1612523948016;
        Fri, 05 Feb 2021 03:19:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612523948; cv=none;
        d=google.com; s=arc-20160816;
        b=T/9evKtP/KWGdDk1874PE1oLim4iRO7qJPwKFoF2vw6WPuA0L6EtPKVOnMz3n+ZmO/
         8NscEEbI/Yqpx2TmpIbGWIm9F53tNBw8/OcFFBw8u3FtHKWC+T5Orh8k2WTGJX0+1R3C
         NlzQPc4952nF2i8gEfukF4kaCDVhC4ARpxCBmo/CORvFy/H0HlEG7Z7j3pjxOD486+iv
         cScVI0TF4j1IK443a86Nb9lAg5u4/iqucZK6XP9sgwf1r6hXtobVtUGTFonJp9Yr01qu
         3rPSqpZPfos0piSHak8tvnNbUoHyo9ovHXHfoiJ0WQVKR8ixBatUxoqeRIg6XdOMP7J8
         MVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0vuXvM/bJGug4mq7H8UJvt4RDRw8rbMIFY/0o0XjdpQ=;
        b=gnszVEOJ7iOg1rMLyq1F5WBd73vpCvdSj8HOV6P4CIwL4pd3tk9H0Zq6DB6WF5BTLa
         BL3AV4XT9dd+G4xj+rZHbOzQIRNNxkLY/CutbDd5FsIoMOKI9AEF+HTN04So7F0oSTGi
         LHu2Dd+eJ3GpmihQKRZssPOqysZNOlePQuFSRtWfJ6SIWoT2BSULmfX+oG1JdbejmoLJ
         EeM9ot1ufNjmsjPCg0wHNOJIrEz0w+rgGLPpDmEHrqWc+qgljwekHCU+ZeOMvRD3k/1d
         shdy9gnmZtwm1MW7WOe6HOW7HRCPBBCiQiZCC93V4M7N6MvEDPAbJbtag1uKDIvkzWsI
         Lh+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MpEBRsey;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s185si8146369ybf.68.2021.02.05.03.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 03:19:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MpEBRsey;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7z8l-0003Xc-Cn
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 06:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7z8Q-0003WR-8W
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 06:18:46 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7z8N-0002VI-4y
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 06:18:45 -0500
Received: by mail-ej1-x634.google.com with SMTP id hs11so11426764ejc.1
 for <qemu-arm@nongnu.org>; Fri, 05 Feb 2021 03:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0vuXvM/bJGug4mq7H8UJvt4RDRw8rbMIFY/0o0XjdpQ=;
 b=MpEBRseyWBR3oWy9OyOgEQxXBf4gJb0HC/pyVWsyuFnO3hq/TCEByextSFPDfBq8Sq
 VXnF/xOauIptCsxDdIe8vcK9qYf1hM7BSjVx4Nygdz4CMgst1TR7uyQCUot0GXxniun0
 MjJ9DHoOaFibgmMk/XaXdDXKtZg0Sgp2rsx4eAHtqBl+5z1Ht9NpmhiXlMTY0L9jO0TZ
 0r7rWETt2h7M6g2pZWhXut69b6dSnAqclexpkO5aJk1VmvtPm8S0PNMLy6oy+SzaNchN
 bFMRiynZPwojXhxfZ9ugePaFqi+NQr4cWC8QZZh6FUBLcqYpnzvTHnlt9pb3EcJW0EYd
 e2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0vuXvM/bJGug4mq7H8UJvt4RDRw8rbMIFY/0o0XjdpQ=;
 b=uoZSeNHtLUBI6jaABojrgvxR+1xSHhjwFsgxUM/JBoA52aBYSesDkPpQjG5ai+69bc
 4ddnZDnaYRw9o1LxYKm/aZSfjNV8FCu63pJB+ddDs/0UDkrk06iCU9PVhFd45r9+QMtz
 01N4MmHtgPQ7Wkzat8PQl8sGp8MME2a9IRe94NZs3+wqJUM0B6qfMXgILK7AxQxtpXva
 3TnjGhfduZudM/3nJqDv/9WcgIPnnrkVXx5dZPbpkn1k3ePE9NCtdBpMwitiGaf6lidG
 sCPyC7heCLmXu45X2xRj1iDSqtJ3pSddtU3QLC4jcTFYhu1SYxJJQWdYzq7ppetG39xF
 3HMA==
X-Gm-Message-State: AOAM533IH/Z3Ef1ZOck1OlyGiLgUoDWqylc0r7diTUf4hYp3zFfLDovL
 ahMiKYJ6mCi1vJHHX8CLMBMIq6P7uSnl/99COQ1hLw==
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr3568776eji.407.1612523920088; 
 Fri, 05 Feb 2021 03:18:40 -0800 (PST)
MIME-Version: 1.0
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
 <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
 <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
 <CAFEAcA9JkTEOhmoFjWYfR5d7ANhKnc9URk89Xe36q7qMVxkMmg@mail.gmail.com>
 <aa8ccb78-c977-20fa-a814-4223b678d9c4@amsat.org>
In-Reply-To: <aa8ccb78-c977-20fa-a814-4223b678d9c4@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 11:18:28 +0000
Message-ID: <CAFEAcA-+dS5r5LvW5DTEH2vBrm1S2rs7sjjh2V7zjtD6ut0wBw@mail.gmail.com>
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, schspa <schspa@gmail.com>,
 Kevin Zhao <kevin.zhao@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wbFlWMEe9S2r

On Fri, 5 Feb 2021 at 10:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> 1/ virtio-mmio must be sysbus-device,

Yes.

> 2/ we can not sysbus-map out of main memory so private container
> is incorrect, and Versal can not use "mr-ps-switch"?

No. If you have a sysbus device, and you want to map it somewhere
other than into system-memory-map, you can do that: you use
sysbus_mmio_get_region() to get the MemoryRegion*, and then map
it into whatever container you need with memory_region_add_subregion().

thanks
-- PMM
