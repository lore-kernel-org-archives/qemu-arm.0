Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp573945lfc;
        Thu, 27 Aug 2020 06:39:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN6MdFapFjfJKs0fduhlvFPfrOyhMvfzJcedr2axenMgbVdNsPStPVbfTI7P7KABdSXcoc
X-Received: by 2002:a25:de48:: with SMTP id v69mr31219336ybg.191.1598535584115;
        Thu, 27 Aug 2020 06:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598535584; cv=none;
        d=google.com; s=arc-20160816;
        b=ku+65yGHckaifNCPz42F+Jn94Uiq/bifgBBBPmBIPjJH4JC1REDxvYtXcTrWYwSyFS
         KbG4rKfRibnI2sMpISihohUJX6J+9ixBiY2G0ueWi8YUQR1ILmvYbTuDhTTmYwVq65Fs
         uxtP0flw9uW+cV+mR4y3rD7Rcl9EJBW89yn3jh3FrQWPIBLrCXnNWKJsfAKHrP4BqUs8
         RJ3m1zTiU3aQ5KhDTaK2f3Ou2w8eDhdUsvhUrmjDPwCtoHO5QF3J+ZKjbNSgJjcvCUp7
         W0+cs1Je+BtDCrflVYrvkvOP0SkNvIctyGgL9ZVZ/qIalm9kboQy/qpVRB5F3ZAJ798C
         U+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOOpIUEpKND8Xenl6ngCr01i2rdcJVzjIROy+VzT8mc=;
        b=uPHTTJoQEw3rm/a7o9L0wzMLmwqBTkfgLP73ZjOPkofE6O80TebKZfPWpSJu1WT0zc
         81kTK0akIObGkygUXoE3WAGfg7VRFw+26/MbPMtKsowa3floZRrqrD56tZI7sYW6hcTL
         Y8yH4vc93fmrsR4TseMw97qV+UVzcFbsm7rO4VSkfcy/Wv+M+vOAAxunGzS3we+9YSFE
         d5uT/NRgbaI+hzbHBvugm+EwFtpvmkzXrkvDteGXLOweRlw9Fi1STuVMysK/Z88wUAEQ
         KSuhRg4/IqSTao9pkeeEZBtZoxEvgQDgsMhT2RKGCdJgl8A0lbZFtorPsC/D3cLowpPz
         hbPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BIKQVPU4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17si2455595ybg.304.2020.08.27.06.39.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 06:39:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BIKQVPU4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBI7z-0008BZ-Gt
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 09:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBI7t-0008BN-HS
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 09:39:37 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:40414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBI7s-000688-10
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 09:39:37 -0400
Received: by mail-ej1-x642.google.com with SMTP id o18so7683497eje.7
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2020 06:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uOOpIUEpKND8Xenl6ngCr01i2rdcJVzjIROy+VzT8mc=;
 b=BIKQVPU4RcwskeVNuunnMT/xS4nu5Nc9NqNaZIueGifjJjF3PDrCaooS0R/jrPEy+1
 fxKu08NIzewknB5Evyg9fhyWl13c+0Q2EyO6RIxjH2fojyCtVTQ8S0bxlq4KejeATY+4
 MLNWH/yOU5EbifLdzGHG4W3BZnRIMYWuDXDx6HSwWgPGixi7VGI0pkvNBnF/XosFWgiU
 TSxyURiC7hWBzIH4jLrjA+zaYXEO7CF0vqZTXk+pbVMasRVfUDopdWBkdnYX10fIiZTf
 AhXJqtXbBnIgNTRt9mxaMHr7gf+QdVwIzvotYAQTQOMdu7jMXr7ID0+2dpahQ9QNH15p
 cpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uOOpIUEpKND8Xenl6ngCr01i2rdcJVzjIROy+VzT8mc=;
 b=aHhDgs6NxcrgeOH4Rd8iYMkrzrNDeGYFGcUvLelCHR7z/HvICHZkKXH2lricQwJ0q/
 2lW4Uk/HWe2gKpD4GqWx1YMV7iEn8cIOnnmZ+Y0ZiNJH+e2EMU3iEoQ5weL3xNqY1bFY
 d0B89j4NiVMe3OVOWptTO5/XGD5PrX4z+A42JiHj3/ED6y58TxT15QhWOIePqzG+w+Ar
 eTqvq80bJltV/lFxgviCGNVM3vmZ+o8qeFQrZadT8oS/vFOzgQ6hPBBdIkw35bIniM1F
 2QAv+oy08YP5fF4MEQ/1xIH+QiTr0r0VK7e791/C8HA48Ia8o1eg1AvhPDzuOHeKZgux
 HucQ==
X-Gm-Message-State: AOAM5325KW81t9hQ5Kz3BV6rwikth5z6NlEk9SXMo0WFiun8NysG2mDl
 qc8vS6dwT1tJgpU1ardWW+yi0NS5E/pXI/LILefePw==
X-Received: by 2002:a17:906:d8ca:: with SMTP id
 re10mr20234887ejb.382.1598535574148; 
 Thu, 27 Aug 2020 06:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-4-peter.maydell@linaro.org>
 <6dee2bdb-f585-ffec-e57f-47517e278baa@linaro.org>
In-Reply-To: <6dee2bdb-f585-ffec-e57f-47517e278baa@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2020 14:39:22 +0100
Message-ID: <CAFEAcA8Du8ejOK1v-CKtppB2GJvKtxPmhBTDKVndceOHMQ+cFg@mail.gmail.com>
Subject: Re: [PATCH 03/22] target/arm: Implement VFP fp16 for VFP_BINOP
 operations
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JDIbmTUP1hLL

On Tue, 25 Aug 2020 at 19:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/24/20 7:29 AM, Peter Maydell wrote:
> > +DEF_HELPER_3(vfp_addh, f32, f32, f32, ptr)
>
> We do have an f16 entry in helper-head.h, for documentation purposes.  It
> expands to the same uint32_t, so it doesn't make any practical difference.
>
>
> > +float32 VFP_HELPER(name, h)(float32 a, float32 b, void *fpstp) \
>
> And here it would be better to use uint32_t explicitly, because we're
> definitely not returning float32.
>
> I guess you could see if dh_ctype_f16 works here?  But that looks a bit ugly to
> me.  Perhaps we should have introduced a better typedef somewhere...

dh_ctype_f16 does work, yes. Unless you can think of a better name
I think we should go with using that. I'm not sure that "16 bit float
held in a 32-bit unsigned integer for the benefit of the TCG calling
convention" is ever going to have a particularly snappy name...

thanks
-- PMM
