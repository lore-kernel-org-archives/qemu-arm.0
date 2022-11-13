Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2194864ejx;
        Sun, 13 Nov 2022 06:28:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6vxCm7AaMMcXmFeKQCv8UFmUxMGyWwYZUny3uEOTrR0uRX8DOA+9/lthDtLgTUcJ6rxRCE
X-Received: by 2002:a05:622a:1305:b0:35c:d017:2fd7 with SMTP id v5-20020a05622a130500b0035cd0172fd7mr8676058qtk.579.1668349700754;
        Sun, 13 Nov 2022 06:28:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668349700; cv=none;
        d=google.com; s=arc-20160816;
        b=DU0MAcLuMOIazaClcPk8kBPxbkAU2lt6jK904PdOw7nPWdtCHPKz9l3PMV+jRH/AMx
         2gU/54D9EE2imq/iyK482b8Cp5QtpT/GP1dAG+zLpnZ8MO4hMKq2h8SF72BeOLhiR/xI
         Adnb/Iy3CS2WI0Jn5RbpS5KomTzgSvUt+VtlYBlrmzPcU8kCzGjTkTY3h/ELIz7esh5W
         fRimSVXvbB9RpYjw/7BKGUA8jw8RwtmhJrWQSsQzVkk9jWsd/ZIB0X1IPG2m0ZrSJiPS
         g7eWx7kBVwc9aKaYo32umHLnOYt7qTMRPY6XUBZ1tD78XkHisDBJj4J0ox4fWuNfWzDb
         L3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=/fO+nWzL4i8L08IU0BDqIlg8bM0EXwOxb/GfYb/d3do=;
        b=AIEYAWhrlcGEq3O8NoCckEZKJ3b7qtLednk6BAPG0lNoUFoZNfs3wK1dplWRESpIeI
         PTaZKLdKHHdT4GmdIR+GOQhy5khkiyWAAmOJwrbsAQ3RVApnkhxtcPdoqprPZZ4atgm4
         OLZQYvvDgg5XMvap4N3uT+umDW/hqgAZBkUrEnPwcy8J7D7NZp+XGH35rTQ99Nl5MhGu
         nAKz3kT0ya43bN61xYFRTwuJSKX/h5LEkY3uDIAMDY9eHcFaO+AmVH5eOYeV4oxVM8BW
         cVtQx7vUPIBNiD31DDOOYsJeVxZmvcS3QNHZjTApq4gzl9xZRk+ZoAEqNsLl1O5MlwJ+
         9cmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NjvMR1Yz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020ac85f54000000b0039cd6209ccesi4558867qta.176.2022.11.13.06.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Nov 2022 06:28:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NjvMR1Yz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ouDxx-0006nW-Ht; Sun, 13 Nov 2022 09:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1ouDxu-0006mk-Ad
 for qemu-arm@nongnu.org; Sun, 13 Nov 2022 09:28:06 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1ouDxs-0006I5-7W
 for qemu-arm@nongnu.org; Sun, 13 Nov 2022 09:28:05 -0500
Received: by mail-lj1-x235.google.com with SMTP id a15so9887803ljb.7
 for <qemu-arm@nongnu.org>; Sun, 13 Nov 2022 06:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:organization:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/fO+nWzL4i8L08IU0BDqIlg8bM0EXwOxb/GfYb/d3do=;
 b=NjvMR1Yzg7xoq0Vr6HVUJPKzAFkY8hGfxTBDZDMxIodfL0BEKjlJ1L1w/qxIrv4jze
 1BD52HGbIqq7wAVrP10maUKgBqOvAbd7lFCAjKuFkXh8daT3/Wk7/cYlm6RlwlKPkJZb
 D8cy6Kzip7uvtK0xLEphWuQP8SaPGCau2OpqaNV8hpDJASQTwvHg1vUKlaUrmmWJ+CQY
 +c/yx3BEKyxwJ1q7ZqexT7TIJmP5ykPM1IqReD3aSaZhXElAZ3pfgl+e27iFAJaF3W6Y
 8IdtXS8Fhs+LbsW4480OG86dfKV6659soq+dbM1uobg5rGA/D8EaLZZZkYWFldz7gReg
 +uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:organization:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/fO+nWzL4i8L08IU0BDqIlg8bM0EXwOxb/GfYb/d3do=;
 b=I+itGQJM0huwm5SDaX9WDslAdcBBqtdl44sytozWIMHjIkiOjioNej38w1DYCkTDUN
 4vmkfyUTl4AOwDwsNP0P+vDS8++TIxLQ5Kx3u4zDi7I1/+oVPHMmyIpH24n9i8f2dpEr
 BifG3dVDBaq0a82wGY9R6UmL8aj7vO9EyPLKtgMfjX6/QLuFPtb4NJBzjJZSJ59tlCsr
 00ZxCoYVEajrDGKZgaEySeOPzKd/eLVtICVTetxHkK5xIh35+3f8IzFp3T+k79c9lLDz
 ACj+WuQfJes+KwQHa4p/z5GSpR5hkI+xAlXLbkaKo6UjB4eCgXugQm6eaXIbvmw8V9Eq
 oO0A==
X-Gm-Message-State: ANoB5pk9FydMTkXjhq39ot7szfcsuXlHs0rzx+M9vE1pSZLvkeA7AgL3
 E3AnJcWA5eUlgQ0iPRUwjCTewQ==
X-Received: by 2002:a2e:9998:0:b0:277:13a5:83ce with SMTP id
 w24-20020a2e9998000000b0027713a583cemr2703615lji.426.1668349681452; 
 Sun, 13 Nov 2022 06:28:01 -0800 (PST)
Received: from [192.168.200.206] (83.21.150.143.ipv4.supernova.orange.pl.
 [83.21.150.143]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05651c033500b0027722e99323sm1486556ljp.5.2022.11.13.06.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 06:28:00 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------GRXOhC9wAEzOxscaP0dJFzSx"
Message-ID: <60ea2be0-f53c-5ad0-ab66-173b926b245c@linaro.org>
Date: Sun, 13 Nov 2022 15:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 0/1] hw/arm: use -cpu max by default on sbsa-ref
To: Leif Lindholm <quic_llindhol@quicinc.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <LeifLindholmquic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20221109133525.762667-1-quic_llindhol@quicinc.com>
Content-Language: en-US
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20221109133525.762667-1-quic_llindhol@quicinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: EEKmb7O9hjlw

This is a multi-part message in MIME format.
--------------GRXOhC9wAEzOxscaP0dJFzSx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 9.11.2022 o 14:35, Leif Lindholm pisze:

> We have mainly (well, as will become clear, in fact "exclusively") been using
> sbsa-ref with the "max" CPU. But sbsa-ref was created with a default CPU of
> Cortex-A57, which we have not updated along the way.
> 
> However, the "max" cpu has seen a bug where Linux boot fails around UEFI
> ExitBootServices. Marcin Juszkiewicz has found the cause for that, but that
> requires a patch to TF-A. (Has that been submitted upstream?)

TF-A gerrit instance refuses to handle any of my SSH keys. RSA, ED25519 
ones.

The only change I did to TF-A was removal of coherent memory stuff as it 
was for a57/72 and blocked me from building it for a76/n1.

Attached it.
--------------GRXOhC9wAEzOxscaP0dJFzSx
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-qemu_sbsa-drop-whole-coherent-memory-stuff.patch"
Content-Disposition: attachment;
 filename="0001-qemu_sbsa-drop-whole-coherent-memory-stuff.patch"
Content-Transfer-Encoding: base64

RnJvbSAyNDZiNzA5ODY3YjRmZDlhNjJlYTFhZTZiY2UyZjQ1NDk3MWI1NDhmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJjaW4gSnVzemtpZXdpY3ogPG1hcmNpbi5qdXN6
a2lld2ljekBsaW5hcm8ub3JnPgpEYXRlOiBUdWUsIDYgU2VwIDIwMjIgMTM6NDg6NDAgKzAy
MDAKU3ViamVjdDogW1BBVENIXSBxZW11X3Nic2E6IGRyb3Agd2hvbGUgY29oZXJlbnQgbWVt
b3J5IHN0dWZmCgpXZSB3b3VsZCBsaWtlIHRvIHVzZSBDb3J0ZXgtQTc2L04xIGNwdSBlbXVs
YXRpb24gaW4gc2JzYS1yZWYgYW5kIHRoYXQKd2hvbGUgY29oZXJlbnQgbWVtb3J5IHN0dWZm
IGlzIG5vdCBnb2luZyB0aGVyZS4KLS0tCiBwbGF0L3FlbXUvY29tbW9uL3FlbXVfYmwxX3Nl
dHVwLmMgIHwgIDQgKy0tLQogcGxhdC9xZW11L2NvbW1vbi9xZW11X2JsMl9zZXR1cC5jICB8
ICA0ICstLS0KIHBsYXQvcWVtdS9jb21tb24vcWVtdV9ibDMxX3NldHVwLmMgfCAgNCArLS0t
CiBwbGF0L3FlbXUvY29tbW9uL3FlbXVfY29tbW9uLmMgICAgIHwgMTIgKy0tLS0tLS0tLS0t
CiBwbGF0L3FlbXUvY29tbW9uL3FlbXVfcHJpdmF0ZS5oICAgIHwgIDggKystLS0tLS0KIHBs
YXQvcWVtdS9xZW11X3Nic2EvcGxhdGZvcm0ubWsgICAgfCAgMyArKysKIDYgZmlsZXMgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9w
bGF0L3FlbXUvY29tbW9uL3FlbXVfYmwxX3NldHVwLmMgYi9wbGF0L3FlbXUvY29tbW9uL3Fl
bXVfYmwxX3NldHVwLmMKaW5kZXggNjdmMzMyNzNmLi41MjQzMjkzYWUgMTAwNjQ0Ci0tLSBh
L3BsYXQvcWVtdS9jb21tb24vcWVtdV9ibDFfc2V0dXAuYworKysgYi9wbGF0L3FlbXUvY29t
bW9uL3FlbXVfYmwxX3NldHVwLmMKQEAgLTUxLDkgKzUxLDcgQEAgdm9pZCBibDFfcGxhdF9h
cmNoX3NldHVwKHZvaWQpCiB7CiAJUUVNVV9DT05GSUdVUkVfQkwxX01NVShibDFfdHpyYW1f
bGF5b3V0LnRvdGFsX2Jhc2UsCiAJCQkJYmwxX3R6cmFtX2xheW91dC50b3RhbF9zaXplLAot
CQkJCUJMX0NPREVfQkFTRSwgQkwxX0NPREVfRU5ELAotCQkJCUJMMV9ST19EQVRBX0JBU0Us
IEJMMV9ST19EQVRBX0VORCwKLQkJCQlCTF9DT0hFUkVOVF9SQU1fQkFTRSwgQkxfQ09IRVJF
TlRfUkFNX0VORCk7CisJCQkJQkxfQ09ERV9CQVNFLCBCTDFfQ09ERV9FTkQpOwogfQogCiB2
b2lkIGJsMV9wbGF0Zm9ybV9zZXR1cCh2b2lkKQpkaWZmIC0tZ2l0IGEvcGxhdC9xZW11L2Nv
bW1vbi9xZW11X2JsMl9zZXR1cC5jIGIvcGxhdC9xZW11L2NvbW1vbi9xZW11X2JsMl9zZXR1
cC5jCmluZGV4IDJjMGRhMTViOS4uNmUxM2VjZTcyIDEwMDY0NAotLS0gYS9wbGF0L3FlbXUv
Y29tbW9uL3FlbXVfYmwyX3NldHVwLmMKKysrIGIvcGxhdC9xZW11L2NvbW1vbi9xZW11X2Js
Ml9zZXR1cC5jCkBAIC05Miw5ICs5Miw3IEBAIHZvaWQgYmwyX3BsYXRfYXJjaF9zZXR1cCh2
b2lkKQogewogCVFFTVVfQ09ORklHVVJFX0JMMl9NTVUoYmwyX3R6cmFtX2xheW91dC50b3Rh
bF9iYXNlLAogCQkJICAgICAgYmwyX3R6cmFtX2xheW91dC50b3RhbF9zaXplLAotCQkJICAg
ICAgQkxfQ09ERV9CQVNFLCBCTF9DT0RFX0VORCwKLQkJCSAgICAgIEJMX1JPX0RBVEFfQkFT
RSwgQkxfUk9fREFUQV9FTkQsCi0JCQkgICAgICBCTF9DT0hFUkVOVF9SQU1fQkFTRSwgQkxf
Q09IRVJFTlRfUkFNX0VORCk7CisJCQkgICAgICBCTF9DT0RFX0JBU0UsIEJMX0NPREVfRU5E
KTsKIH0KIAogLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKZGlmZiAtLWdpdCBhL3BsYXQv
cWVtdS9jb21tb24vcWVtdV9ibDMxX3NldHVwLmMgYi9wbGF0L3FlbXUvY29tbW9uL3FlbXVf
YmwzMV9zZXR1cC5jCmluZGV4IDRmNjBlYjE2My4uNjFiNmNiYzEwIDEwMDY0NAotLS0gYS9w
bGF0L3FlbXUvY29tbW9uL3FlbXVfYmwzMV9zZXR1cC5jCisrKyBiL3BsYXQvcWVtdS9jb21t
b24vcWVtdV9ibDMxX3NldHVwLmMKQEAgLTY1LDkgKzY1LDcgQEAgdm9pZCBibDMxX2Vhcmx5
X3BsYXRmb3JtX3NldHVwMih1X3JlZ2lzdGVyX3QgYXJnMCwgdV9yZWdpc3Rlcl90IGFyZzEs
CiB2b2lkIGJsMzFfcGxhdF9hcmNoX3NldHVwKHZvaWQpCiB7CiAJcWVtdV9jb25maWd1cmVf
bW11X2VsMyhCTDMxX0JBU0UsIChCTDMxX0VORCAtIEJMMzFfQkFTRSksCi0JCQkgICAgICBC
TF9DT0RFX0JBU0UsIEJMX0NPREVfRU5ELAotCQkJICAgICAgQkxfUk9fREFUQV9CQVNFLCBC
TF9ST19EQVRBX0VORCwKLQkJCSAgICAgIEJMX0NPSEVSRU5UX1JBTV9CQVNFLCBCTF9DT0hF
UkVOVF9SQU1fRU5EKTsKKwkJCSAgICAgIEJMX0NPREVfQkFTRSwgQkxfQ09ERV9FTkQpOwog
fQogCiBzdGF0aWMgdm9pZCBxZW11X2dwaW9faW5pdCh2b2lkKQpkaWZmIC0tZ2l0IGEvcGxh
dC9xZW11L2NvbW1vbi9xZW11X2NvbW1vbi5jIGIvcGxhdC9xZW11L2NvbW1vbi9xZW11X2Nv
bW1vbi5jCmluZGV4IDBjMTg0ZjQ5Yi4uM2Q1YjE5N2FlIDEwMDY0NAotLS0gYS9wbGF0L3Fl
bXUvY29tbW9uL3FlbXVfY29tbW9uLmMKKysrIGIvcGxhdC9xZW11L2NvbW1vbi9xZW11X2Nv
bW1vbi5jCkBAIC0xMjksMTEgKzEyOSw3IEBAIHN0YXRpYyBjb25zdCBtbWFwX3JlZ2lvbl90
IHBsYXRfcWVtdV9tbWFwW10gPSB7CiAJdm9pZCBxZW11X2NvbmZpZ3VyZV9tbXVfIyNfZWwo
dW5zaWduZWQgbG9uZyB0b3RhbF9iYXNlLAlcCiAJCQkJICAgdW5zaWduZWQgbG9uZyB0b3Rh
bF9zaXplLAkJXAogCQkJCSAgIHVuc2lnbmVkIGxvbmcgY29kZV9zdGFydCwJCVwKLQkJCQkg
ICB1bnNpZ25lZCBsb25nIGNvZGVfbGltaXQsCQlcCi0JCQkJICAgdW5zaWduZWQgbG9uZyBy
b19zdGFydCwJCVwKLQkJCQkgICB1bnNpZ25lZCBsb25nIHJvX2xpbWl0LAkJXAotCQkJCSAg
IHVuc2lnbmVkIGxvbmcgY29oX3N0YXJ0LAkJXAotCQkJCSAgIHVuc2lnbmVkIGxvbmcgY29o
X2xpbWl0KQkJXAorCQkJCSAgIHVuc2lnbmVkIGxvbmcgY29kZV9saW1pdCkJCVwKIAl7CQkJ
CQkJCQlcCiAJCW1tYXBfYWRkX3JlZ2lvbih0b3RhbF9iYXNlLCB0b3RhbF9iYXNlLAkJCVwK
IAkJCQl0b3RhbF9zaXplLAkJCQlcCkBAIC0xNDEsMTIgKzEzNyw2IEBAIHN0YXRpYyBjb25z
dCBtbWFwX3JlZ2lvbl90IHBsYXRfcWVtdV9tbWFwW10gPSB7CiAJCW1tYXBfYWRkX3JlZ2lv
bihjb2RlX3N0YXJ0LCBjb2RlX3N0YXJ0LAkJCVwKIAkJCQljb2RlX2xpbWl0IC0gY29kZV9z
dGFydCwJCVwKIAkJCQlNVF9DT0RFIHwgTVRfU0VDVVJFKTsJCQlcCi0JCW1tYXBfYWRkX3Jl
Z2lvbihyb19zdGFydCwgcm9fc3RhcnQsCQkJXAotCQkJCXJvX2xpbWl0IC0gcm9fc3RhcnQs
CQkJXAotCQkJCU1UX1JPX0RBVEEgfCBNVF9TRUNVUkUpOwkJXAotCQltbWFwX2FkZF9yZWdp
b24oY29oX3N0YXJ0LCBjb2hfc3RhcnQsCQkJXAotCQkJCWNvaF9saW1pdCAtIGNvaF9zdGFy
dCwJCQlcCi0JCQkJTVRfREVWSUNFIHwgTVRfUlcgfCBNVF9TRUNVUkUpOwkJXAogCQltbWFw
X2FkZChwbGF0X3FlbXVfbW1hcCk7CQkJCVwKIAkJaW5pdF94bGF0X3RhYmxlcygpOwkJCQkJ
XAogCQkJCQkJCQkJXApkaWZmIC0tZ2l0IGEvcGxhdC9xZW11L2NvbW1vbi9xZW11X3ByaXZh
dGUuaCBiL3BsYXQvcWVtdS9jb21tb24vcWVtdV9wcml2YXRlLmgKaW5kZXggYzMxM2NiNjNm
Li5lYzU5ZTJmMzEgMTAwNjQ0Ci0tLSBhL3BsYXQvcWVtdS9jb21tb24vcWVtdV9wcml2YXRl
LmgKKysrIGIvcGxhdC9xZW11L2NvbW1vbi9xZW11X3ByaXZhdGUuaApAQCAtMTYsMTQgKzE2
LDEwIEBAIHZvaWQgcWVtdV9jb25maWd1cmVfbW11X3N2Y19tb24odW5zaWduZWQgbG9uZyB0
b3RhbF9iYXNlLAogCQkJdW5zaWduZWQgbG9uZyBjb2hfc3RhcnQsIHVuc2lnbmVkIGxvbmcg
Y29oX2xpbWl0KTsKIAogdm9pZCBxZW11X2NvbmZpZ3VyZV9tbXVfZWwxKHVuc2lnbmVkIGxv
bmcgdG90YWxfYmFzZSwgdW5zaWduZWQgbG9uZyB0b3RhbF9zaXplLAotCQkJdW5zaWduZWQg
bG9uZyBjb2RlX3N0YXJ0LCB1bnNpZ25lZCBsb25nIGNvZGVfbGltaXQsCi0JCQl1bnNpZ25l
ZCBsb25nIHJvX3N0YXJ0LCB1bnNpZ25lZCBsb25nIHJvX2xpbWl0LAotCQkJdW5zaWduZWQg
bG9uZyBjb2hfc3RhcnQsIHVuc2lnbmVkIGxvbmcgY29oX2xpbWl0KTsKKwkJCXVuc2lnbmVk
IGxvbmcgY29kZV9zdGFydCwgdW5zaWduZWQgbG9uZyBjb2RlX2xpbWl0KTsKIAogdm9pZCBx
ZW11X2NvbmZpZ3VyZV9tbXVfZWwzKHVuc2lnbmVkIGxvbmcgdG90YWxfYmFzZSwgdW5zaWdu
ZWQgbG9uZyB0b3RhbF9zaXplLAotCQkJdW5zaWduZWQgbG9uZyBjb2RlX3N0YXJ0LCB1bnNp
Z25lZCBsb25nIGNvZGVfbGltaXQsCi0JCQl1bnNpZ25lZCBsb25nIHJvX3N0YXJ0LCB1bnNp
Z25lZCBsb25nIHJvX2xpbWl0LAotCQkJdW5zaWduZWQgbG9uZyBjb2hfc3RhcnQsIHVuc2ln
bmVkIGxvbmcgY29oX2xpbWl0KTsKKwkJCXVuc2lnbmVkIGxvbmcgY29kZV9zdGFydCwgdW5z
aWduZWQgbG9uZyBjb2RlX2xpbWl0KTsKIAogdm9pZCBwbGF0X3FlbXVfaW9fc2V0dXAodm9p
ZCk7CiB1bnNpZ25lZCBpbnQgcGxhdF9xZW11X2NhbGNfY29yZV9wb3ModV9yZWdpc3Rlcl90
IG1waWRyKTsKZGlmZiAtLWdpdCBhL3BsYXQvcWVtdS9xZW11X3Nic2EvcGxhdGZvcm0ubWsg
Yi9wbGF0L3FlbXUvcWVtdV9zYnNhL3BsYXRmb3JtLm1rCmluZGV4IDVhNmIxZTExZS4uOWMz
OWY2MTkwIDEwMDY0NAotLS0gYS9wbGF0L3FlbXUvcWVtdV9zYnNhL3BsYXRmb3JtLm1rCisr
KyBiL3BsYXQvcWVtdS9xZW11X3Nic2EvcGxhdGZvcm0ubWsKQEAgLTQ5LDYgKzQ5LDkgQEAg
QkwxX1NPVVJDRVMJCSs9CWRyaXZlcnMvaW8vaW9fc2VtaWhvc3RpbmcuYwkJCVwKIAkJCQkk
e1BMQVRfUUVNVV9DT01NT05fUEFUSH0vJHtBUkNIfS9wbGF0X2hlbHBlcnMuUwlcCiAJCQkJ
JHtQTEFUX1FFTVVfQ09NTU9OX1BBVEh9L3FlbXVfYmwxX3NldHVwLmMKIAorVVNFX0NPSEVS
RU5UX01FTSA6PSAwCitIV19BU1NJU1RFRF9DT0hFUkVOQ1k6PTEKKwogQkwxX1NPVVJDRVMJ
CSs9CWxpYi9jcHVzL2FhcmNoNjQvY29ydGV4X2E1Ny5TCQkJXAogCQkJCWxpYi9jcHVzL2Fh
cmNoNjQvY29ydGV4X2E3Mi5TCQkJXAogCQkJCWxpYi9jcHVzL2FhcmNoNjQvcWVtdV9tYXgu
UwkJCVwKLS0gCjIuMzcuMwoK

--------------GRXOhC9wAEzOxscaP0dJFzSx--
