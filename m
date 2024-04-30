Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp3034507ejb;
        Tue, 30 Apr 2024 08:09:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcS7QN9oQ2wGC4SHzok2QZQPR4O3IZkG75ldfEY8NfLDP7aJWhqj438mwhQaLGZ5xGdbtsYUDJ1Z8Dx5LULEdCqz4+C5cX
X-Google-Smtp-Source: AGHT+IGvO5rEOekiOCYnPAY7rCyhMrCb7N8u3j1nftVRomeOUgd0E1oymm3cYlFSRy9n+cgzMYE+
X-Received: by 2002:a05:6512:2117:b0:51b:e42c:2ec4 with SMTP id q23-20020a056512211700b0051be42c2ec4mr1970778lfr.24.1714489770631;
        Tue, 30 Apr 2024 08:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714489770; cv=none;
        d=google.com; s=arc-20160816;
        b=kgRmYYmPxDd2VvukuIAp8w6T4YzyHZA1C/UzD/vcEuEt2sYCpubiQ4NVS0nmIfwf6s
         BttSg39l8zjHbSak2vTBJ8cmXxoTsgGGG8ItPwtC6uBZoC4cOX9eAypWNdUcpBVc9C4e
         8C00lOMfLm1zM1e3ZZlaDycYYwvoS/KFHrndXmepXKDLxxkI4udlZIg7b4d2VAHaxhIy
         LbZlY/33rj5uQXxLJYX5aTi7Ei6H0NWcSbC1x5OOAfNbG5DuVm+Hdv9zztbiErYFek7h
         NtTMiP4Vcb0tOPQXaSdVtGvK4oMwHCD+hNlNSFEwvYYrTDpWOk+iyXEflPKUmDCqPabi
         EkIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kstWA/A41b+HIEwe5CE0/GXOQwIeOb+3kH17kJQI4m4=;
        fh=bOB9mhK8OW9uAohLJhAPpX4ybRC0NNpFIh4v5OdyCIo=;
        b=c5BRnSLBFzO0ed9KhToBipc8U7uVU+OZP7VRhBssiQWT/0FcDG8/+GvZ/qlYXzeYCW
         EIaNXwn7n9FoJQeie2kyPFDVO2o8o9JnQRwF+vbN8daMtoo3ArYLyAxfZF0cdJ/ewJSg
         nEwRcPDqJqHiLjZ1TKx0Xhz+PPCEvx5PwliegdPYegHx15WEsggsJhj0zS385XTK0o3k
         3x/4mfwsK49jy7VE89gRQSPxlRmskp/BH8ugxMB0iODEb4hnJYUeYtLWMQLyZRf29dwb
         OmdvGHrWKQsN6wu6f/rI+ZosVB3svFFpcziIMdvuChommtsN1rL88fBM7iLPllE1zJTV
         AG3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n+7c+GKC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5-20020a5d64a5000000b0034bccb197b3si8525631wrp.227.2024.04.30.08.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2024 08:09:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n+7c+GKC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s1p6c-0003lq-Jv; Tue, 30 Apr 2024 11:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1p6Q-0003Gt-Gd
 for qemu-devel@nongnu.org; Tue, 30 Apr 2024 11:09:06 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1p6N-0000yS-Gp
 for qemu-devel@nongnu.org; Tue, 30 Apr 2024 11:09:06 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56e37503115so6297391a12.1
 for <qemu-devel@nongnu.org>; Tue, 30 Apr 2024 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714489742; x=1715094542; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kstWA/A41b+HIEwe5CE0/GXOQwIeOb+3kH17kJQI4m4=;
 b=n+7c+GKC2s9kUBlJF3dHpvWu4yf8p8ewYTJusuHfkRP3YTDLw2vTYhgQrA5SPcc+o3
 b3OLWHKCaprLzgcR5WVPW9Z10ABdbZ8Z3pmb/E14H63+3jLH47MkjlAEgp4DKHhaFEYL
 hoIIGPjZkBhV2gtrXQFS98IzN9G0fFw+ADVKsqZMRQz2KO5Ei3DL7NiWt/t3Ge6+oC0s
 FhNVFcal4G/m9RVAiCZ7ibLb58BPgIy0omrBRkHnvnqlawaTILIN1OOKAxag2hOh0huK
 h1OfAzWeXaIMpDVr2K5VZn7UTqOBxsHn7M/Ag+JUtOcSf2NSpY+kFUINPW0t7b3NySC5
 Wjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714489742; x=1715094542;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kstWA/A41b+HIEwe5CE0/GXOQwIeOb+3kH17kJQI4m4=;
 b=WWIkgZsi1R+TkYh6XGu1LytpNfhPRanNkClf9rwIU6xzpDyyxg41BfOxzQ2RrvNOQ+
 0OyOQlPZcncah2LnLdpDQg7cw8aJqvxA+gO/2YF554Y7EHQMemruwLdRSAr/bGl26bfw
 eATi27ap685QjPU51Lx0ks3OdawiEnRNyrfWun/X0TyijWiaa0RCm7vB7Z1KNs0rIOxq
 Fg6BccrpDYtyYaYbr7FJNrccOMetWd9fnQ6WRgIpdn/Nm7EvAmn9JUkBce5gQWEoC/u4
 dEyDUDyGmgCv6L61JwsCroL9FGt8DeoYGXe28ucQ/OxbEs7MDE2g678NLbK4oGWfDHqP
 x1/g==
X-Gm-Message-State: AOJu0YxzfHKIONdmVPKlVu8iDTg2MA0t8uliii1owYNY2PwrXlNYke1A
 e/lTpkxwJlai4TBsMsPP4qfmCvOPH5aESKZewt+Y9PYGy0lS1FY04mLAT2l5botH7nlpYKUVogh
 zeL/LIeXsqZfR2SXI+jy2+J+s6ng9wP7fL7lRxQ==
X-Received: by 2002:a50:8d5a:0:b0:572:7bae:7e74 with SMTP id
 t26-20020a508d5a000000b005727bae7e74mr47119edt.32.1714489741704; Tue, 30 Apr
 2024 08:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240424200929.240921-1-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240424200929.240921-1-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2024 16:08:50 +0100
Message-ID: <CAFEAcA9ssyX3knVnJAi3N6_aGgQ6HQYw-5iPxirWweJFkd64NQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Add device DM163 (led driver, matrix colors shield
 & display)
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Samuel Tardieu <sam@rfc1149.net>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: u5BY6Xzpo59f

On Wed, 24 Apr 2024 at 21:09, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> This device implements the IM120417002 colors shield v1.1 for Arduino
> (which relies on the DM163 8x3-channel led driving logic) and features
> a simple display of an 8x8 RGB matrix. This color shield can be plugged
> on the Arduino board (or the B-L475E-IOT01A board) to drive an 8x8
> RGB led matrix. This RGB led matrix takes advantage of retinal persistanc=
e
> to seemingly display different colors in each row.
>



Applied to target-arm.next, thanks.

-- PMM
