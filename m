Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1353444lfb;
        Mon, 19 Apr 2021 10:12:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgRWuDqABvxTdE6tYNqkt8k0YNXHHYOdIB96oQIqW3M8ZDe+zQ+SRMIc220z2879P1peTV
X-Received: by 2002:a05:6602:342a:: with SMTP id n42mr15386427ioz.88.1618852369701;
        Mon, 19 Apr 2021 10:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618852369; cv=none;
        d=google.com; s=arc-20160816;
        b=eeXc2EiyIHa68dTevxyC+9+HwboHo/KrwtfuzYqsMDdRDpm2aa1HRomR/igTOdMg04
         swV78BNGnloea596gMJJXCGk/sS+ats/lyFQgmWjVNjQXImO4WQs3UMUh7lu4nBmvrho
         EXZkz3k9apDZidMLmUf6Y5faKVCe+3uvpWRE6MDznOqJlCr0Mraqjv7bNd85eSRhA+k7
         3Dv2/qCMRallf5lugxbCGPrlQKU74Qcnf01eUoKWafhvaLMA9G2wtFDOrXx+6UylceNR
         DQSYM+8DWoxYO0TB2mOOwmtSj4xdD53zz6ksYR/jzjmlPqfFYvIrC+viibde4y+sJKxv
         sWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vSbnsjrrEEPFiTgvryEudcdqG6b1KYpQL8pftH3WNcI=;
        b=LyX37enX9UkSvee9JrBEyw4U4SVsysZL0p089UTx+4BsiC6wwkju+EHLIMAl3JRnJe
         6YsNzc9q0DAxu/I56h7FMOyr9RE56Ecz0FyLI/0uBa2GlMpaVH/otXblr0EbqPLGQWSn
         VFzj0lLgX+KyNr5mYZg5jeTGoJnwNypoPoqNm4Vz2mq3nxrAkxlSYKxCwbzR1EYPUyv9
         5C9IMpy+hweM4OMVoQUwBpQJZUgN+AGDSVSEVoOdR7BBxNuAoRlmoHZcorrLThgU+HPg
         9NX/rwxWg/f0StujR3GHXbFD6Mvi/+l1L/lZ0zLhXYcGaQ5SH7Nv/xnjClZADVFUWLKa
         ScgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mtdAEz7F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8si14710877jat.114.2021.04.19.10.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 10:12:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mtdAEz7F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYXS5-00053B-0b
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 13:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXNS-0007pM-CY
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:08:03 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXNK-0005hW-BA
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:08:02 -0400
Received: by mail-ed1-x531.google.com with SMTP id i3so15951703edt.1
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 10:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vSbnsjrrEEPFiTgvryEudcdqG6b1KYpQL8pftH3WNcI=;
 b=mtdAEz7FucSPgBCVpU0kTLuAlKR0P572S5FGp4UBUQpzp0cw9FRXdUvcgd6gbGYyVR
 iiHVXdjw6xhjX1iZIiNi6AWzXV6flk3YRUNpjrCFJsG1D/k2uoQBvQc4GJEOLVShPKTy
 VCg1pIxsA2OPLErhwQPyKTOImEIJqzvXGZZ0Ci5yVmIgoIlQ4twTalqiwuSq8yqvAY/y
 iCpkDSI2dxXfTNtiIHRSPqme8IKVx0Nrwc7xgMMBwsJeaeJpKn/MMeom6hf7EzmTdzUR
 QRo0Ud4vfiXcE3SHn8+WDeUDE5cgtLq5RINKCdxPvwzbgMRUnkBA8zbYbgav6y7EnQb3
 +UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vSbnsjrrEEPFiTgvryEudcdqG6b1KYpQL8pftH3WNcI=;
 b=G7rZeWe5zIypogv41ZcZmzWyVMQboTNU3RBDAfpaeNDVUP3zu/RGNEOegwWcM+3+cC
 TGgmAiE6kaByGZoG9T+n70PJEzRWB7ZepIMv3cy6lBaPO7V2DfU/DcLSLV4hafXwgWH9
 Jgg+BiYGS0fvllj2DIMmNP/F56gM4Q3gC3lmDRWuozRsEE3YienZ1dn13mrZDcAWTwv/
 2AaL37d1mzmg47Y9sAf3gIc7Bbuy+axxDpKjePPn9cRq4H1pqI6OBPGZtVloE/kTLIc/
 sbIs4QkdjsJyWi7inLIxklXHOKiSN8gPRe3i8QWctW/X0FoZwklLrMrjssUMisJ4wTE8
 pYVw==
X-Gm-Message-State: AOAM530rvjBG2JfAk1j+XdjxSMmkp2dMeLRwUWM2rpEfympDOTyOCO88
 RiwAmQNesvSc7gl3ijlg3/u5hCh0SC4QpFwRwIKjPQ==
X-Received: by 2002:a50:fb0a:: with SMTP id d10mr13937192edq.146.1618852072842; 
 Mon, 19 Apr 2021 10:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-8-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:07:01 +0100
Message-ID: <CAFEAcA83dN54S6C+NaZuz7B6fbHY-mQ9iucZAH==j8M8TrnU_w@mail.gmail.com>
Subject: Re: [PATCH v4 07/30] target/arm: Move TBFLAG_AM32 bits to the top
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: mZRr11kztQ5/

On Fri, 16 Apr 2021 at 20:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that these bits have been moved out of tb->flags,
> where TBFLAG_ANY was filling from the top, move AM32
> to fill from the top, and A32 and M32 to fill from the
> bottom.  This means fewer changes when adding new bits.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
