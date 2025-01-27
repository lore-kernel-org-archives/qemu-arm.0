Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2434569njk;
        Mon, 27 Jan 2025 05:25:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVaPNJY2X+t02EDFlTFSZcxMYXL0t3kaKcXFEyOdGDlKttk85+gD40lHvIf8zajZ/8/ErR+a3BehA8kaQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEGNkrH1Al32c4NwuMZsLBAgBSGPmFUOxdZWLLTK7gAlvTvthYYR/ifaSkqKV1pKj7pD8Z8
X-Received: by 2002:a05:6102:578a:b0:4b4:e7e7:56c0 with SMTP id ada2fe7eead31-4b690b7beecmr41857996137.3.1737984314187;
        Mon, 27 Jan 2025 05:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737984314; cv=none;
        d=google.com; s=arc-20240605;
        b=DZ1tUcPhaN2USDzxL19JKL6n32iAXByI6f7CSKzj1EIhEeHfwpda99wy7TezPqTnDc
         nbM8pFM4bZWsmAbcegCrvPPcAsNlNlXGjSFirUNHVP4knemC8mGI0CxCTUqjrRw32bRw
         79c1r/hO6zuPzRB2nDGP3m3ht6WC9kJQzKo+Gc2Wzh+xIVK+JpETp+cD1fyCg/8/So5s
         3KrSCnOItNUZGDm7lb0rpNA6OJ8Z0McO6zAlEGQMXbZ0hkzOZe4RPlQ1gkYVMBZ+PKz0
         SSncx/T1WZZSuoehS6iUwa9emMynr6ivUwZm4GmOOHDty8gUC0ZzBHWc59nBfLNim1pU
         /Sig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BMlMZixLUZNUXStYeVlvk6q/O/yYQ8+E2isojwrzrt4=;
        fh=ictVOiTz0vLRrkOimHIheDC+cczFPWRTcjjXOQg8RS8=;
        b=dCKhRhbHWeps8uTWo0IGepCkFI22zIcLH+F7V8MJgvQwT/ixPRrUsTOWs19utbyheZ
         CbaFyBoU68bEo7ewo3wDIGsOa0RurhVyCS1l/XZJ4YjMDyiDP2/01N5sEq0MGZXbAUbL
         drS8YUfp9/ZKYdsGMKG/Jl/IZ48Lwest9AoQ18m4l0pSZZ07NUVy4+bCWkoLzOk8Ml6b
         NbiZWRmZA1rCap7wwYY4kejGBYJX1X00Mp/PFhuwXImbxs+EPl7FheD1emNnp0Rw++57
         cJlU6msfMaNWh+ZS4e1rRpL3CD+yjMcrtFpGek1K/ARbpk4dbjpQ79F/UqWkU4fAseYX
         0uCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SZR2kecY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709981bf3si2723582137.235.2025.01.27.05.25.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:25:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SZR2kecY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcP6z-0003xN-Of; Mon, 27 Jan 2025 08:25:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcP6s-0003qL-9j
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:25:02 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcP6p-0003NF-E8
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:25:01 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e5447fae695so7610363276.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 05:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737984297; x=1738589097; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMlMZixLUZNUXStYeVlvk6q/O/yYQ8+E2isojwrzrt4=;
 b=SZR2kecY26amNVU3DoQVp9YjLSVsWWX5tZAhIw1a+e0U/QZe+rR+4rDGcVGEK2VJvd
 yin9gyHt4r/L79UDkxS2kHlvyljg/umVdFnIYfEDsgXueO92qhFYTMKx/fBOG6qY1kIV
 kn+CcSALTk68vlF5QSou7HZUZsFeHw6CZUxyW8N8cCi+nsqTfgR+mfATy7acDCfsjA1Y
 qPXcIn/Fp683yxffTFEcLwXnuRaL19E6+0iKwWGiJq6RVtb5MAQSc/smXT9YR7jHRtus
 opQXeWuFAoRSfKnLjtPE3MWtCCDd+fXKnbuIBzSCWs8qdqDNj2xe81luukYjXm1Z03a1
 jSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737984297; x=1738589097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMlMZixLUZNUXStYeVlvk6q/O/yYQ8+E2isojwrzrt4=;
 b=kws46jqCLwJu3UgdMcedQvYLhWY1SVqV05mfgyr+8O/IViFS08LFhQsoZIn6kOwmBK
 ljFJOJ+/2leImyEwF76jPSHfp6Vsobly1s33hKcDB/QdQ62tdQpWjEADNubdY0MpPLux
 zMacopWsDHV2RDNEynbBakV80hZBHQBpuOP+8CoJmreBGaf/h6gUJsZrh9VhsTw20Tqx
 XzdWu9/uD4b0/97PrMSKvKnw/bbnOUzCVYjorWc7rmFdcKjC6ROqBcjjcAUilrezXFJB
 qEMJUTQFPrziUSjkFVXlCIY5H7zrIgdh7hHsxIG2gZPyjqhoXZ31eEZJSNSPS6pzpwWx
 Gzkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUax3vlJMbDxT2JXiStvqKq+p2BWZXxF1wwafOH5bZ3oRp40EFDArPPu4OwbmkqcUJEYb93gEZ2NA==@nongnu.org
X-Gm-Message-State: AOJu0Yyf57iTDsL0OJSasO5w1v1HpqVx5nRldVYwtgY4evi0Nmjf3Ddz
 MpoIgtwacU97ZeSfLr8w2vUj3vVPeUB9/XjKITkSMQgqHjnO1JpNg1TAl/CHWOW5LwIPzSA0SSR
 Aok+OOxOPIXd0lf6PeDZieEl3UbT6ZkW+jCVLew==
X-Gm-Gg: ASbGnctEEvGgmZgN3Cijm/8ELS2faNrX/3OHCSywwtqKgjT0U43ayFyYnBKCQaYuU34
 ZhvnkSGJcr0auK/H46jmO05SZTpAzLszjIlg0UAeeqaLIoIEY8VHxWMobYbJdX+13tH6tjqrm4Q
 ==
X-Received: by 2002:a05:6902:1791:b0:e54:a2e1:9aaf with SMTP id
 3f1490d57ef6-e57b105aff9mr29361442276.18.1737984297608; Mon, 27 Jan 2025
 05:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20250111183711.2338-1-shentey@gmail.com>
 <20250111183711.2338-7-shentey@gmail.com>
In-Reply-To: <20250111183711.2338-7-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 13:24:46 +0000
X-Gm-Features: AWEUYZkHKCt9owcbMBbChf8bAJS-sYXZh8H3fLQsLixpY4PZL9vDJpS3xsEa0N0
Message-ID: <CAFEAcA_m29rWYQPtz=xSBsS_FXb5_L6+DGBA2o_TrLcFy6YC3g@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] hw/sd/sd: Remove legacy sd_set_cb() in favor of
 GPIOs
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W6O79PY0R2S/

On Sat, 11 Jan 2025 at 18:37, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Commit ce5dd27534b0 "hw/sd: Remove omap2_mmc device" removed the last use=
r of
> sd_set_cb(). Rework this functionality into GPIOs.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

What is this for? We have a non-legacy API for "the SD controller
needs to know when the SD card is inserted or the readonly
status changes", which is that the controller implements the
SDBasClass set_inserted and set_readonly methods. (See the pl011
for an example.)

I would prefer it if we used that consistently, rather than having
two mechanisms, one using GPIO lines and one using class methods.
I think we should delete the sd_set_cb() API and handling code
entirely.

thanks
-- PMM
