Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3060220njb;
        Tue, 18 Mar 2025 09:40:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4esAECua/7zutbg2jwoetnnu1smaVimgIoYzYmxCpDHNcWWOQlLx91ZJQzN5f8Mv63Tnu6PwhBVH7Mg==@linaro.org
X-Google-Smtp-Source: AGHT+IESXo2PEpRDkav22vJ4u6OrNgg1zdy/unYMnYGgYZkj3j/GRG18+wAs5xyANTGbF3EyXRzR
X-Received: by 2002:ac8:5d4b:0:b0:476:9017:bbf1 with SMTP id d75a77b69052e-476c81edf1emr214859981cf.46.1742316008139;
        Tue, 18 Mar 2025 09:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742316008; cv=none;
        d=google.com; s=arc-20240605;
        b=U+dJ0PDbfFD+kRtz9zHNRZnyUo+Uy36lg6ufwJOVeR9Ze8e0c6ROBFfLZvar6Jabmk
         tQ+oeO4FMX/9RaKI1BlMXczW36HYHyBrSNg8neJ15lvrcQRxXjp53OCWWTkQzWod5OX2
         ddR+4gycRFa1cIg6cLx47UTuryuOPDkx9Fbiw8zjlljtfAWj7yY8cZew+vRRdPsHQrFD
         FyYj5bELelHOhn7axieE7C8jFesFe7VcUCUJTAgwO5gvwKIw70jFXbpKH7jdbei6DIYk
         hSx64dfuemgrDWszGhfU/uaOSlQlI4Tcs7WD9Mn825i/9F5Arv0HJKL+9RS8q3YNzZlJ
         fX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rbNQxrWPKgNC03cG8BVFNXAwV21VUReGzLMEZsXe10g=;
        fh=jhSPwfrXBiuvj0IF3g/7JJ47NtQpmBvREIkzJNLXVoY=;
        b=EGwDI1kOPGcs7wVMDHelS4UxbaGrfzuKGMrMU8kG1oeVmHQdU4HEJeEWYrIJD6kw1s
         IPxESDjPoFK/21jzz2QetTlBsDWgi5x0t9DmfxnqCKDcIX4Eooty0DZ4wJte3J1vBjr8
         mMl15F7b6eTJMfuEzIOmf2yvIYNr8kcaCP/DJO7txT5YPJ5T2s8/wgqoGCtW+NKCC/fv
         nqFwPr+lgKOrEkMVnpZlUmMHlC7tTeHTFKnsoe6aRl3xr4IG+iHyLY4F6IquQ/xZ7w40
         pTQ8f5YoSkf9IlNMEnBQiGAuSPM6qsW4ioz5NRpLBkR7QxkagRpsaWjUpGsWBavcoz2t
         lGbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FA2WFSpJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb88269bsi123966761cf.633.2025.03.18.09.40.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 09:40:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FA2WFSpJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuZya-00010H-Qx; Tue, 18 Mar 2025 12:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuZyY-0000zp-QI
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 12:39:34 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuZyV-0005Tz-Ip
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 12:39:34 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e64165ae78cso2177772276.0
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742315970; x=1742920770; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rbNQxrWPKgNC03cG8BVFNXAwV21VUReGzLMEZsXe10g=;
 b=FA2WFSpJ/D7qnqW8foSl8bqXmYcAvGyBZtKcFfpLWGcSGTZd1u+Vo5A6KosF870Pvm
 uyTzpSgZp1o2u5kRnY5z6g/V2U37wCPmKc9N1B8nJyx4c8ESWmT1/sTiPhZdP5VjszZg
 EW96f+6FGweGdh7ssNNOUa4wUcbWj5PlZ1LJqu19HmwJcU0xNcgawHAeCOXufYNXW/nn
 SFRqxPN+Yzvpo5ahD+XeFulvZegL7QY6t12tQX6EsX6EnWoXSXsKS11KtXHu5gv5aTqR
 6xt1VjlVSVynebWACG3tx91332CkTYjYS8oTSI9bRRd0yYVAzPNlAEx7YvFc8b3vRxxc
 v5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742315970; x=1742920770;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rbNQxrWPKgNC03cG8BVFNXAwV21VUReGzLMEZsXe10g=;
 b=ceFdSYuawEx5JQZHo7G0neXxuj5o1OWy/Apub4urFi2Buufj9Z1cl6rukXKWzLdJAE
 e0iMS7aDCDZKARErsbpGeDP/m1xYIvxSZ45OQO+jhfNWKo3fYp8k00y6zFgBpyUzQQVv
 r21/eRmFJGEBuyuXRiaDWg7OhbPYwBf+p6ch0ongcKKU+dDuw0rcWzAqri2QZRZZ4cHX
 +sKZkFv3HrMCBFR4Oh1nJnUY/KuNj8RTuGwQeOrlNQSldL1JR8VHtmD3glpDPA55vjhz
 1wOKFC6Fk3LMzwJSYccgDZRumS0CCvi28gW2pmT6vdhnm2M/y+UNmXNEhVbSoUyhXR69
 35Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO1U/kgfpJ9JNEMuZyePefslXzRLLX50T/5k+OUhJAFfS0W81dBXBUotal3hwfARgbR4NUH/OekA==@nongnu.org
X-Gm-Message-State: AOJu0Yw4ZRP3cIKwiUtu7LZe5BoWfcKF/koVWBwCOIifqarBO79oD6CH
 7W+Kh7j/fdPBUoFmYHkT4Tynl/PzD46GbPmufxYaS8+QAY3BckuPiWyuuvrDXcbSn8FMlcmqL3A
 v30l99SacPrONvdmxy/pONLSCB/S1mPSAuQl39g==
X-Gm-Gg: ASbGncu3O6O9AcZtbxfHewrufIx3Cll1pAlu+THoQmi9eYWP1IMoAXwEl1Ekb4vlkNu
 6LNS8ruR585kY90RK/f9Z6rPp9dMQJHfIc31XEoQMqYhn1JakMX8hBLjPyaepogw/kxmO4sXEfd
 gupT48qjTFZauv3RGapqjC8OhDYX4yGoqhDdXsfA==
X-Received: by 2002:a05:6902:2701:b0:e60:85ed:8ceb with SMTP id
 3f1490d57ef6-e63f6512b33mr22050871276.22.1742315970334; Tue, 18 Mar 2025
 09:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250304124815.591749-1-kraxel@redhat.com>
 <20250304124815.591749-15-kraxel@redhat.com>
In-Reply-To: <20250304124815.591749-15-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Mar 2025 16:39:18 +0000
X-Gm-Features: AQ5f1Jruzr4RzXaG_o4fgU4CuCcLtIcR63x8pV0RKxi79gIv6eTCbFbGDSqECr8
Message-ID: <CAFEAcA9_rb321OBOfv9v84ZLO7aw_8t8pTDMUYxj2SNnSBfRmg@mail.gmail.com>
Subject: Re: [PULL 14/24] hw/uefi: add var-service-json.c + qapi for NV vars.
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: BkP8lvVkr6js

On Tue, 4 Mar 2025 at 12:49, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Define qapi schema for the uefi variable store state.
>
> Use it and the generated visitor helper functions to store persistent
> (EFI_VARIABLE_NON_VOLATILE) variables in JSON format on disk.
>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Message-ID: <20250225163031.1409078-15-kraxel@redhat.com>
> [ incremental fix squashed in ]
> Message-ID: <pji24p6oag7cn2rovus7rquo7q2c6tokuquobfro2sqorky7vu@tk7cxud6jw7f>

Hi; Coverity points out some problems in this code
(CID 1593154, 1593157):


> +void uefi_vars_json_load(uefi_vars_state *uv, Error **errp)
> +{
> +    UefiVarStore *vs;
> +    QObject *qobj;
> +    Visitor *v;
> +    char *str;
> +    size_t len;
> +    int rc;
> +
> +    if (uv->jsonfd == -1) {
> +        return;
> +    }
> +
> +    len = lseek(uv->jsonfd, 0, SEEK_END);

lseek() can return -1 on error, but we don't check that
here, so we can proceed forward with a negative length...

> +    if (len == 0) {
> +        return;
> +    }
> +
> +    str = g_malloc(len + 1);

...so we might try to malloc(0) here...

> +    lseek(uv->jsonfd, 0, SEEK_SET);
> +    rc = read(uv->jsonfd, str, len);

...and read() will treat -1 as a very large positive
value, overrunning the buffer.

> +    if (rc != len) {
> +        warn_report("%s: read error", __func__);

If the read failed to read all the data, we need to
bail out now, not proceed to pass the uninitialized
buffer to qobject_from_json().

Coverity doesn't notice it, but the code in
uefi_vars_json_save() is also not handling errors
from lseek() etc correctly.

Do we absolutely need to be operating on a continuously open
filedescriptor here rather than a filename? If we could make
these functions use uv->jsonfile each time then we could use
the glib functions g_file_get_contents() and
g_file_set_contents(), which get all the pesky details of the
error handling right for you.

thanks
-- PMM
