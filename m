Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2577014njb;
        Mon, 12 May 2025 01:44:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUv6fQeysEDhbZJo+ZYpIHhe6AD1iXVifeT0tfViUj509S86iqlkVQnW8XPhKP4KblF/fywixW5vbMoXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEsW7PlslTvBvQ6mzyVOGX9h2MY8SOtXfj6w3fOyrIxRi/ACvxB5iWH1pUrv2eM/xop6/OZ
X-Received: by 2002:a05:620a:c4d:b0:7c9:2394:4195 with SMTP id af79cd13be357-7cd0113d85bmr1827763685a.35.1747039467356;
        Mon, 12 May 2025 01:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747039467; cv=none;
        d=google.com; s=arc-20240605;
        b=POKFRBsTEKShyVY/IAGXGbxCbLVg3fNClpdxH7JWmf4bN6CuwocAyq+wWzVDqMsqm7
         qdktn83SWZsEoHG3hG4HjnEvHu9kLodSy5J9gVJXu+BVJ1BvgX3R3cHkNR69NbT7OCld
         qIWBFOLR/1kHhACxwuZ1zyPgpUhLdyAkxB+fos3p1BaL4Gf0FNiTcVapgH8SEnvnmSoR
         GCB3jpcK5M0rd5CwOOkYxi76rzYhqpQ7WMZR24+K5nXXr69GLP+h+kDqxLOFahqODjVj
         5wFix3lqYGqjyucsKMUDHzTXBSHQDQ07lLPdGgZvrfXiaDyOJNsYnSf5oC3+ilFRZ0i4
         mGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8NMssjOexXhNVoZv01AminjlYv1AX+PT7McAfM6BVIs=;
        fh=ng6aRxuII+0yrSII2QR/aX9px0FBuEi8eKQLedsMANQ=;
        b=YvY+ccZu2fTLclTQQj78SYVSjfLZKGS/GNuadebhI7kAEOiqVPbMMaCcrgBWiAI3rK
         CNTZNI4SPJvLLu+m9XLST2nq+sNITlBybcTXUl898q1SDQulKjInLVy2Y0b8T5Fxkwt2
         uqtd0NsnPCTXoVPHwnuhIkeLXbxvONT/ZY1R9GrhSkoRG6NuiM/0JM4xFnShEyLPuudm
         BPN6MPQ3yhizDNnArqwkGKL6fFjyWfbN7YtxMtFoI1g0KjeU3AqQR5b4XbvaHC7UPXoQ
         FkJ/XqB+9Ih4eZOx+BUwIxPl6cVOCjI7PLOH1FM/rOiRPqtFcEvM+enTh90MnwaRQ6dE
         Mi9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MuoNaEH0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00f51ecfsi770892085a.85.2025.05.12.01.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 01:44:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MuoNaEH0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEOlp-0004Yk-90; Mon, 12 May 2025 04:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uEOlh-0003s2-3A
 for qemu-arm@nongnu.org; Mon, 12 May 2025 04:44:13 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uEOlf-0001wN-42
 for qemu-arm@nongnu.org; Mon, 12 May 2025 04:44:12 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-7099bc957d9so34103707b3.0
 for <qemu-arm@nongnu.org>; Mon, 12 May 2025 01:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747039450; x=1747644250; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8NMssjOexXhNVoZv01AminjlYv1AX+PT7McAfM6BVIs=;
 b=MuoNaEH0bVSxWIdABrXg7Tx/b2nK1DDgKTnAtkKWH27cedrJd/ZOeL8P77rHZKy0Rz
 slq9RkIfaJarCZWMOnNt6TqCo9eLiXOtru8DPZ1beAaCauH5idRtsUvpYh3wZuFbMpBA
 3MyRftluj/vCtjtuaELHsfFXQS9ejtjcbs/H3B+oUge4kzaacNzxaO3OG4rV02pRDBPf
 1TJoTPeX3bOyxwf8lU9mpIZR3iFpKYmn3caMuaIHiIwMmmaajXUAhyLQ39ncW9hrchas
 WXMOSDyC+IJRjzf62ZzSrr59agXSr2kdqy9yvJkeRr102NvvOd+QzNz/d40OZglOxRcL
 PWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747039450; x=1747644250;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8NMssjOexXhNVoZv01AminjlYv1AX+PT7McAfM6BVIs=;
 b=UBiS9XqU8pqM9pj3+10Ksmq7RGhmltmA8seEiYy+MhdwYgR6LEfsbMy9U9kis21y2d
 RYGpoZSe/h0rNecd3Zk88+lKnltpIPIXoyOd0WlEmVz3B9mnzZk6AfbyWvl3crdZ1iVY
 Bw9eA5JqJsgTsiBTh53ua4oSUmKFSVXKalBCsEj6mk7wconiJP+Ukewn6M2xdGUzbIqN
 VfMX0IafjCE32hJII9tWNB58reTFxG27i+XQNJ/FryZX9K113U2TQii6NXlWffRy/xxW
 Ks1RAjxi1f+EqCV1+2kZstbICrrtkVz7NMLLelim1J9hxcsJeeI9j3DbT6YVj3jL4t+m
 032g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrLbaR5DTrLSkVzhLufo0ONtECw3ImPcv6VApPQCNm/OW+j45miU04GAWhmd1/uLkwosIUn5VMfw==@nongnu.org
X-Gm-Message-State: AOJu0YzC05kTiTB6bkWt3Sf4IudDCYCd1JBF4jGwxVA2+rYSptKYo4k0
 PZTD7QtpuyJSUaj2yh28CQG0EnWjU13qcRIOTqtfv5lOvr8/ERGpDsFvJ3Wf8/k/KjeLzxcWgod
 2pDSsk+lVrp0m3i///B3uRVxORbb2rBrQS9mt1w==
X-Gm-Gg: ASbGncvGUGFXN3bvrEalg8CfMIN/+7GFKahOtKW3HvyNsOLrs9Y9Kq86NwRhDJlaKUw
 tGVNT8xBB/IlmoZAtcu6/V9s52IJxywfkoCAHZI4gtCOOIR7LOdvFnn2Hmqku/jbCeJGaRpDA/l
 FPhArMVd8boyEC6eGvE2lQRnFqKmS0zOfphg==
X-Received: by 2002:a05:690c:608a:b0:709:19f7:d7da with SMTP id
 00721157ae682-70a3f9ec903mr197551317b3.2.1747039449853; Mon, 12 May 2025
 01:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250507091859.2507455-1-timlee660101@gmail.com>
 <CAFEAcA82=0Pp9U=W5EAjcVkR0GL_o1iVPuUPA=w2SFy4mwd_5w@mail.gmail.com>
 <CAFEAcA8qYRa+CHD+z687ATYwOBenrm_c1hg=yvVq-hzRDxMdRA@mail.gmail.com>
 <CAJG6D+g=87TT8qyHvztiLjr83Lm7oTR2qV89Pm4EfQC9zz25RQ@mail.gmail.com>
In-Reply-To: <CAJG6D+g=87TT8qyHvztiLjr83Lm7oTR2qV89Pm4EfQC9zz25RQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 May 2025 09:43:58 +0100
X-Gm-Features: AX0GCFvi9cu8Qm1NQ_zgOD0c9SKDZqhSr2m-I1m-K3C-gwlcNuoyOo0v69sEWcU
Message-ID: <CAFEAcA9sYkgaGC7L-ydvCUpDtMEpCdWD-YOuf5Gg=A3oMP5TKA@mail.gmail.com>
Subject: Re: [v2] tests/qtest: Add qtest for NPCM8XX PSPI module
To: Tim Lee <timlee660101@gmail.com>
Cc: farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, 
 wuhaotsh@google.com, kfting@nuvoton.com, chli30@nuvoton.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: iP2yWlEaeiNI

On Mon, 12 May 2025 at 02:25, Tim Lee <timlee660101@gmail.com> wrote:
>
> Hi Peter,
> Sorry about that. When I ran this qtest and I found an error then I
> tried to modify npcm_pspi driver to make data register read/write test
> pass.
>
> [R +0.080118] writew 0xf0201002 0x4
> [S +0.080126] OK
> [R +0.080148] readw 0xf0201002
> [S +0.080153] OK 0x0000000000000004
> [R +0.080168] writew 0xf0201000 0x1234
> [S +0.080171] OK
> [R +0.080191] readw 0xf0201000
> [S +0.080194] OK 0x0000000000001234
> [I +0.080445] CLOSED
> ok 3 /aarch64/npcm8xx_pspi/data
> # End of npcm8xx_pspi tests
> # End of aarch64 tests
>
> Here is the change diff of what I modified in npcm_pspi_write_data()
> Should I submit this patch for npcm_pspi driver? I'm not sure if I
> modified it correctly. Thanks for your time.
>
>  static void npcm_pspi_write_data(NPCMPSPIState *s, uint16_t data)
>  {
> -    uint16_t value = 0;
> +    uint16_t data_l, data_h = 0;
>
>      if (FIELD_EX16(s->regs[R_PSPI_CTL1], PSPI_CTL1, MOD)) {
> -        value = ssi_transfer(s->spi, extract16(data, 8, 8)) << 8;
> +        data_h = (extract16(data, 8, 8) << 8);
> +        ssi_transfer(s->spi, data_h);
>      }
> -    value |= ssi_transfer(s->spi, extract16(data, 0, 8));
> -    s->regs[R_PSPI_DATA] = value;
> +    data_l = extract16(data, 0, 8);
> +    ssi_transfer(s->spi, data_l);
> +    s->regs[R_PSPI_DATA] = (data_h | data_l);

If you think there's a bug in the PSPI device then the
best thing is to submit what you think is the fix as
its own patch, with a commit message that details what
the incorrect behaviour is (and why you think it's incorrect,
e.g. with reference to a data sheet). Then the NPCM folks can
review it for whether it's correct or not.

You can send a 2-patch series with the bug fix as patch 1,
followed by the new test case as patch 2.

thanks
-- PMM
