Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2078693ejm;
        Tue, 2 May 2023 03:28:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4lLVWynZICWPptcg+PhmSeuI8Quk/mykcUE8dr9VLKGiVDEvfACNHr3EDgdnEPROfseIjq
X-Received: by 2002:a05:622a:144e:b0:3f2:79b:2c98 with SMTP id v14-20020a05622a144e00b003f2079b2c98mr18527251qtx.22.1683023304723;
        Tue, 02 May 2023 03:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683023304; cv=none;
        d=google.com; s=arc-20160816;
        b=dCWlE7bqjn5DcnTH53G//e//HPqAt4pQVt6Gdk6WjdSrngSz79OFqQglqiGioeJV0N
         Il7Q022d3QhNa3B+mofhjIf2KZd/BOmCjodc6s02EZKc5/14v+l9OWsmsKaLo8CD8b6K
         o0wi5igqUSBPhYD5tUvxJ0C6AkPJWEqVQ92gqLsxKZIK1qUx+a6uIuyw44YLAK6C6Bhu
         Emt9WTCtjs+x7EE+CJeFi/pHnpg9TWxTeyvThb781KODGmnb4TB41GgSSrEc2FAIYQwL
         /rUJBZNoKJyOqVTwpp8IS2uuWJhQBqwWjn0kIjLHhqVU9HJmX/KULJnP6M+38dJg9qNn
         aM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uiFYtbbu+GJ8DAgMrIDX9dXz6hNz43k0g5kkPTV8j7Y=;
        b=jblHxwGPXPeBE0YQqDATe+GJJPbbp24dKe8494hSrRUhr2prPXwPS28uHE/Hq41M9P
         G1gmglxuI1Dgy+vRuIvpbeQYsdHxO+tx1+pXWBx8OMdN9hOOpO/T/6uLO2bHkuskMjXh
         901ZnehcVmmz0WQoG0ziXI2N6qe/dYAcCnZAgwkUBuyTFo0nGpTkeMp1dk272S1KraR6
         syiFGRUX8eeXtgn2nu4Y9mOLeSIxHOy/d1uRVujljw1A8ztLgrXdKLBRChiOYYlO86kc
         Sd3ciTw8XfDYTl0+EBjYN9/k07wgwbsz/087g3sZcjlqMTqZDAnyxYYsFyQwARnmbzd0
         hlfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l9rWETmG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a05622a048d00b003f0a31c8c55si11198226qtx.705.2023.05.02.03.28.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 03:28:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l9rWETmG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ptnEy-0003CK-3I; Tue, 02 May 2023 06:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnEv-0003BC-Kk
 for qemu-arm@nongnu.org; Tue, 02 May 2023 06:28:09 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnEt-0007fe-KM
 for qemu-arm@nongnu.org; Tue, 02 May 2023 06:28:09 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94f1d0d2e03so612523366b.0
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 03:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683023285; x=1685615285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uiFYtbbu+GJ8DAgMrIDX9dXz6hNz43k0g5kkPTV8j7Y=;
 b=l9rWETmGWOlDw2FvJEN9742JEq7yiucozsWqoFQwKI3he1LAvAdc1NSU6oxvDyRTBo
 uWGfxvOnxYzMSCAvT0TZdUxyJVYlaVqM4rwOV93Zv94frJUEdzimeLKoeZAOHA1wejhA
 VBAjdPgt2cV6xEr27bsMU7ixEtvXGx6+ORagPHfftWb/yMEF9mhXQ7nhEE0a+GzE5yqL
 td6izUYb6rsJS5JmnU3+N6PygmpIBG1qv9R2WJUaN3WWVmVAkKa/oojktEjftPLV0v02
 3FVUo9Pebd2hcdkhcMTLS1tsozEII4Kth1kSs2B3VRPdKn6/VuymBVAVt2P1vuELs/0m
 AFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023285; x=1685615285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uiFYtbbu+GJ8DAgMrIDX9dXz6hNz43k0g5kkPTV8j7Y=;
 b=YLP4LElAOgurPGhpdrZbIyAhzq0rsB/I97UMQ/RVyNhzuyR2RgJBCujQvpTPYx1B/0
 j8vvX5rEXT1FBtXTe3fZQe96I3cnjD1T8T6kj6mzCscy2+SkVlMb7SkucsshVRgCnFZx
 kXYqvJyXDVMjNAuWPpe6gxITt57ekVEigWLzwx2FR4nDAUM3qYM0MYpHHZo2DCGYUHdA
 76K6KemCAAXfdG2IWTdw9M6TSIqnGdz2U7reWEAilFZDAsaZ4hSrZ4fAs7M8huZGaNBO
 wluwn7TimleQmyIG6gP3ToXSbv2uq8iMsNMzNk009p5fpvvZcHL4uHfzp6236C0wHffa
 5egA==
X-Gm-Message-State: AC+VfDziV6etubcSyBpMuNi6KfNmixS9m8nwR4wqUxZIq2Gn9z49PGST
 P1zMqYnBuYVQDPAmZXlE/XcV3yq7OGCOpJa7Djf8siwVm8XWg5cu
X-Received: by 2002:a17:907:9693:b0:961:be96:b0e7 with SMTP id
 hd19-20020a170907969300b00961be96b0e7mr3884770ejc.48.1683023285420; Tue, 02
 May 2023 03:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230424152717.1333930-1-peter.maydell@linaro.org>
In-Reply-To: <20230424152717.1333930-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:27:54 +0100
Message-ID: <CAFEAcA8Pmk5U5BWD61mWNo=X_SLX9P_1sfuOwKFPT8rCp0CDHA@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: Fix raspi,
 aspeed bootloaders on big-endian hosts
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: yoNeuhlYHgo0

On Mon, 24 Apr 2023 at 16:27, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> Both the raspi and aspeed boards load their secondary CPU bootloader
> code in a way that only works on little-endian hosts. This patchset
> fixes that by making them both use the write_bootloader() function
> in boot.c, which gets endianness-handling right.
>
> Patches 1 and 2 are essentially a patch from C=C3=A9dric from a few
> months ago:
> https://patchew.org/QEMU/20230119123449.531826-1-clg@kaod.org/20230119123=
449.531826-9-clg@kaod.org/
> I've split it into two patches and tweaked it a bit.
>
> These fixes let us run the avocado tests for these boards on
> big-endian hosts.



Applied to target-arm.next, thanks.

-- PMM
