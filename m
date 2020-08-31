Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3914508lfc;
        Mon, 31 Aug 2020 11:48:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDbFYq3ZmZWLJoOdv8liF08cw25o4HPF5ZTEAiSk3InlZ00G9xKnUlabjEbScUsqWTfGLf
X-Received: by 2002:a25:8250:: with SMTP id d16mr4327975ybn.402.1598899728106;
        Mon, 31 Aug 2020 11:48:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598899728; cv=none;
        d=google.com; s=arc-20160816;
        b=T7Y0zxClbhPeIRSb6zGwsojs1CJQYSAGTjo9RPXDflOPmoQo0+tFvILCvaAsXeV26Z
         OKXNdLa0qvhM7evR1X94pEmFtniLjl6IQtIdp7QKvSWUhrfi3V9hKwwxuc42JZRnQRxs
         pL43AbC8He3eZBaTWwiwQO+uAAgGbf9ZMK8v8IR0/rrDOnpTPRoVdA7NQYzp0FzylMby
         NV3nQKpxu7kP+9Iz5zjJykmkZWpFkbyA5z3mUalPlAdLPVWVHCiACO9WuzE6T0S6rHAy
         99PD9DymqkS+3k+ItGf/KdxLur/5x3D/nQEPtem/Vt3GJvA/XcTVfXJ71iU2V63Pm9Vn
         o/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mK71VREtEkOu9ZKpeTR3KQKmWZikJ6Qi7gLJ4nuKuVw=;
        b=BNTJY7Wdjifx2Lfyp1IzJkzszBSnkGk/UKP32mrHyFmtVmK8HQK7zNY4abT8hV2/rP
         Aycqod3QU5uMKj5sWeevPEXNV3oL3kKy4z3pquvIxEEsk/7DxIQRt/Crqvaq10LUNNad
         lY20IMq1y6waVxs4xJjIG+fhHrXUJgttJ0UAzmQVezQ9hsWqyoG0onzmbY4rUfK0khKC
         cBLRJj4XhXZWbwLTXXYlzzm7P3Wvn1p9g4bW28vRW2oE10qBVBzx3Ghha5BoZ52AXMv9
         Domkx6QaK3Ucz+RD6ncXpno7DW4h9dH/fjQ4Mu4SWsrHWGF7a+sJ3FnKdGu/tXvvt7Nu
         GAHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uIIbZkly;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si9914940ybk.319.2020.08.31.11.48.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 11:48:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uIIbZkly;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kCorH-00078d-AW
	for alex.bennee@linaro.org; Mon, 31 Aug 2020 14:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kConw-0002sY-Q3
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:45:20 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:44237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kConu-0007px-A9
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:45:20 -0400
Received: by mail-ej1-x642.google.com with SMTP id bo3so9841942ejb.11
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 11:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mK71VREtEkOu9ZKpeTR3KQKmWZikJ6Qi7gLJ4nuKuVw=;
 b=uIIbZklyGSfvKaWE0kBwQK7R1HoP8K8cRhSaFZ/g+rPl3d8wdKeyHDwSJmQ88aMPMd
 9S8Kx6sYc+0J6k5ynLDv4DqQCz30gSuqUfLej/Fhl/ITz6JauD+hxKpaH/eakD2hZiSM
 Qjge+qKICCRaYdFluSex4OMnduJNF/yXpnMwQvPJ/ahsMVoj7wLg4QnIhKiEqeUOFtB/
 CCQ9Z5laxjZL7pkqZTw0xV0r3wLdt8KVWpQvsbxFEZFYPhk3LXDZhVnwDFmYg0UV35y4
 ZO0nEW6z339zUVHpK+2TVTa7HxnJJ/DIRH2RXEqY0+0/MKwO5/LQpZ2/LyV6mx5F40zb
 eheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mK71VREtEkOu9ZKpeTR3KQKmWZikJ6Qi7gLJ4nuKuVw=;
 b=BOll5NkaAt6jA1mSf2/xirS9o9lcYlavunNzy3PdGoPpym6GvNfibMSUoyr3y9z1Lw
 8S0qqdbbkUfxw0h6EAP+hRsfIrPj1tZjGSw+Q6aJIQFpgm6o4T3csHWNmodAcCa4XQUw
 Ogqy9hkpquy5ycwkQr8sVhe7eFcnG2IehUFavi+6ZBfEYNcgfaFwdXQlUccGEiBZZXGZ
 hDEafb3CZY5KMX91OvGKq6oc2K502g/cB1X086qhAqvveU+//jshjlfk1+4DuTK5IV8v
 dEjjpZvybXylHtbZChukAs8uO9pkZxzhvqGNAzetO+tjNUcGdovRFRv9FdVZtSv4ZZD3
 /tcw==
X-Gm-Message-State: AOAM531abMQ4GgfK4L4IWaQAEmCxDEXLSN8+y3i55EKcEkZeec7kGgyR
 mWOF6ybAcKIGsro28Q8LV+IsBVFmmlZFfSDE+5n1+g==
X-Received: by 2002:a17:906:f28b:: with SMTP id
 gu11mr2158357ejb.407.1598899516497; 
 Mon, 31 Aug 2020 11:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-52-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-52-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Aug 2020 19:45:05 +0100
Message-ID: <CAFEAcA_4HRgdzTf7NUO8=_LrvK+-gMDzHywRffxx=-h938zQrA@mail.gmail.com>
Subject: Re: [PATCH v3 51/74] arm: Fix typo in AARCH64_CPU_GET_CLASS definition
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9EB8c9HDipFw

On Tue, 25 Aug 2020 at 20:23, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> There's a typo in the type name of AARCH64_CPU_GET_CLASS.  This
> was never detected because the macro is not used by any code.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes series v2 -> v3: new patch added to series v3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
