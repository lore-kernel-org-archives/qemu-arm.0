Received: by 2002:ac2:4c90:0:0:0:0:0 with SMTP id d16csp495864lfl;
        Thu, 20 Jan 2022 03:44:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIjy5RCQuzbR4KBTxz2h2vAlKTv8nCBodEt0H0o2n5m/MLwNp1JQDlTIN1GUSWM2923aCA
X-Received: by 2002:a25:71c5:: with SMTP id m188mr46064616ybc.655.1642679066189;
        Thu, 20 Jan 2022 03:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642679066; cv=none;
        d=google.com; s=arc-20160816;
        b=Pl+zjRWQ4t6IjCeY7IuE0qFaY1Y9jDJy6cG4Q0zgrEgBGbCbANoTtZqkk/wVgQq8uv
         3cbie/3gk8RxY6mH8MnqO1plLovzX5+QgddJaah/Kq3NYqEeQ0D1HmsmERX69zCUq2fe
         abErfA7uztLA7rATug46UOL8yvDPz7JcyyDB8H3oPYldSV18y8juyA9WqcOoTxss+p1/
         AgrWFCVHe04gvxh2pgWtWSkROpXPLI/ucaflMHOma7YQAwMFBMRqSn+Yre5UofTGDuJM
         a3NIDbYinnaLgcuUHkWGlQjQgVeHiyuTg0QO6cNBY+OS/1dk4hB8Wuwde9fs0bZI+Gy1
         emjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SazEl8tO0s6qxkBn0r3yA5OM8MuQHUkCVU/yN4RJXw0=;
        b=g7bGGisyJbTKKMYiZCchl1Hfhv/sM7hc4M6oEPFc8BPD/W6moBnHIMvICN632cLEnZ
         6TX50eyPf6u0S85jxtPbRhSWvYg60BnJUfU62+353vgaVn0+dlPRc9GK4/2g2Uq3G93C
         agDaoDO21dymr9fI8qrv6JaLi9LcRzcp3qkRNou63vSxincw98ufaAEnx8GR4/rSBExm
         IRNProxaX+sMQJ/6+LdG2CiceKAdx9LebjpiTqze7bSvXknF8oYlzD9P6WvIEO1OVCgD
         hjqEQSyAE/SD+sY4G3vq5ZsiivumqxooVVSRmuHokQtjxzvkfEU1zB+zp4tf1KZMssCn
         vOOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="c62Klz/d";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i128si2649286ybc.494.2022.01.20.03.44.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jan 2022 03:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="c62Klz/d";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nAVrd-00040a-5u
	for alex.bennee@linaro.org; Thu, 20 Jan 2022 06:44:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAV4e-0006KZ-8s
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:53:48 -0500
Received: from [2a00:1450:4864:20::336] (port=45655
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAV4a-0008Ah-EO
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:53:47 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso12667128wms.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 02:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SazEl8tO0s6qxkBn0r3yA5OM8MuQHUkCVU/yN4RJXw0=;
 b=c62Klz/dxCrUKTrZFAIJRsgzI00pZJ8u9XnMgJhQNsKnBkrMM858T3Y/ZlQq+G67FG
 kb7VMARpG7e8yswIDszGoRMSVIR7bd885elEyYALoRtTxQzFefk04HX9xBDDd5WUJpyO
 omcZi/70Jk96ZL8eW0awQztlFO9PbLiRUuO6t/96ys5btD3F8Czzqvb8ky/T3pjeWvn1
 x+9RRKSwrytmhiVqV7U9zBXmV5MXPozrTPJ7xFghcUQqL1M7VyQJuwy6LysUFT0IVxxA
 cPBv0hT3o+c1IUELkudHWICv3U1SxL7zNo1zP/tqPy+bSpTGKcOyO2rQYcnm04Rx9IzK
 bo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SazEl8tO0s6qxkBn0r3yA5OM8MuQHUkCVU/yN4RJXw0=;
 b=RG5zdoV6C17v919/d44TWHhoOM699/+gCVD0vuLQjGK9HZHyls6DOCwGAteU1MLap0
 KROqy50ebb1ReA8yiy3PO7YfUV7EV7waUpMFA+hMKpdLa/AWsXFk9uU8AsrkVB/Xe3ca
 MfQ0WvvNQNkR+u+XDcq/eEYVRQAGbGIt8norWxkjD3kXL9oaFTImZgibqx2ofpy3IXPd
 HRMqm+Rt60hcWuZZY0RrdXFF7UICK0H62/27RC1U/PULeTBX1j+9CDIFC21Arp7kVaKy
 PnuWCuvPE6kwuSwf4ZbYYZHPiewlCpFa5r/Kgjqk2pkbTnE6cn3l6Gkkq2v3pmTGqWx9
 BpTw==
X-Gm-Message-State: AOAM533awC4Iav0xTrtNJD6s46+2k5/+/VY57+3zpKt+e9nzonb968iD
 zOUPfl0ZUehTniLWy775Hbvi1i0R9rMg5IdU8kqCrw==
X-Received: by 2002:adf:bb52:: with SMTP id x18mr3077342wrg.319.1642676001832; 
 Thu, 20 Jan 2022 02:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20211215182421.418374-1-philmd@redhat.com>
 <20211215182421.418374-2-philmd@redhat.com>
 <4e3cdf08-b767-9a00-e4ca-70580bba4aa9@amsat.org>
In-Reply-To: <4e3cdf08-b767-9a00-e4ca-70580bba4aa9@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 10:53:09 +0000
Message-ID: <CAFEAcA8P+F11CFCVB1JgcFD_+jfdGyGUt1Goi9wBQq_sExzxPA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] hw/intc/arm_gicv3: Check for !MEMTX_OK instead
 of MEMTX_ERROR
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PjdLMImExXTo

On Wed, 19 Jan 2022 at 17:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> Can you take this single patch via your arm tree?

Sure.

Applied to target-arm.next, thanks.

-- PMM
