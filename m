Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2160058ejf;
        Mon, 26 Feb 2024 08:23:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVG16PWMYl1Z0vms+vPy+CCiAaReOLr601+ntheXsHowiMggi/btwBsACgu9Z1FFF/c9bX6afigJ2JGc9882aSYsXWG+SAI
X-Google-Smtp-Source: AGHT+IHqX+PUoFskC51yK4Akk7qBk+nQTeebtieglyaUbI7dLtQfNA29mown7wggq7eY5uTUg3JG
X-Received: by 2002:a05:622a:588:b0:42c:791c:3e67 with SMTP id c8-20020a05622a058800b0042c791c3e67mr7831750qtb.16.1708964624268;
        Mon, 26 Feb 2024 08:23:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708964624; cv=none;
        d=google.com; s=arc-20160816;
        b=FMJKyJfNSunAzgBf4fUnMnIgzJTmfXGIGvB60wI2V5173MqIMNB0SbLUN/iGP8xXyC
         BPzTtWD9vmNzLF9A2sYHP9HT3dFI4nzS/8NhGTe0PUzTtSxcZ64BM40LWot1AKpwU/vL
         39Q61Tm8d+MKx7OjLv396IHeDdokMLOQt2bqQt455AsNKriMhuGfCowekEckWrDb+3dy
         bphJaZ19i7QNMrImwJT3CjTo9jj2f+gDi49Gwj5hXJyFp+KXStwBfaNMdlBHZzhBT182
         sLjp5x+3ppCG5I1ZMq6yTuEqAQDl8nwAgicRTEISe3Go0DFd4sF1vABvu2DwR6zr5yXT
         CHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=R8cjoQrTkGA3CXcE7dt4RfYTbCi3yLhj64dJVI+faEM=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=jfxcSL85Ho/89+V/JD6GZOKQllNhY4AGGCoz07q6E1F1N5/Rry7DEC5knVWlqhPBpr
         a4Pc5v/HFsNZ1Q+1JShSBWPT4Yv2rqjKS01ULt+c1i4WmHaLNZJBcxL261Xgl6bHM6Zo
         7WxtslyNUgsa2av2A3Ff+XgkIBAck1MLzLqtYhXuFsS8mieRsG85jEYdriQr5XA5KnlG
         7W8FSPyY5of4CJBVS8QL+KYGXghN0M4O8Efs3IwfSxUk0x3tRAV1nPuVFunpRe52Q4DT
         C6S9NU4MeQ+RT1xWG4zLK43w3oEBdNzA+zO15BiK87guPAOdJR4xSN3iNcAHxJ//LKrR
         Rasw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fUyb4sSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id he36-20020a05622a602400b0042c65075ad3si5302522qtb.250.2024.02.26.08.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:23:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fUyb4sSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redlI-00017o-FM; Mon, 26 Feb 2024 11:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redlH-00013p-C0
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:23:27 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redlF-0001Aj-PX
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:23:27 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56454c695e6so5758173a12.0
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708964604; x=1709569404; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R8cjoQrTkGA3CXcE7dt4RfYTbCi3yLhj64dJVI+faEM=;
 b=fUyb4sSZkVxIbu0sKiMEPxacJjxvj2wUCN3UqUE3mUE2MTpubak7cbJoxR3szpR06i
 vdaiel/VrvgusCDF0yz8QWjidifxiadGSDhMBNGT4CcgLXlT4MBvaQwbZEhZQLp/YHQ1
 0auVgaGO8Jamee9r6BlI+6OIPQ+T63kuAhRXcSZ59ohvaMSO/WuXui0eop0ZjaD0nOLv
 AaarNCzE3AmhENrCU1SW+rTzMKEYNsdiNLiEZXfSvanhDe2glgWTL1/l5nGNQazZh4CF
 TLthg+b9oLTZDLAv9a1r2k6lvoWaiiK26llVUt+2phQWgQJxQqObQJ2qNR/EjxqMx+d5
 YLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964604; x=1709569404;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R8cjoQrTkGA3CXcE7dt4RfYTbCi3yLhj64dJVI+faEM=;
 b=cbEbeAoUwWR2yzf320hrOdJcsbfYBDFDi37xJNIx5j2h2HPZrv1eMuGiFKQGl3cL/9
 Ge/sbiz3VQj/yBTLpNJMdABcPxnG3ZL4veWFNEKz/SgTPGiSghe4tMlNLujTxhzrpIRJ
 U8RCLKgRFG+Fzr4dvpi1Rdlqytcu4kGQ8KyQOVdVmES3TXuw1Y8F1s52LYIdN265TAmb
 IopaHGdYFB+PtduMBuVeqjksMBEp3EPwcfKwPL7+0NbNJSX5HxgrAQrkMrBmsVC7qpIZ
 u7SVEE9oH723FoXOD4fGrQC9OxaeKDVG0DD6bAF8QUQI7pQFql/FPhMoQL12wZyy64Tm
 xLhg==
X-Gm-Message-State: AOJu0YzXqPn7v/MhXRxLaCYz74tS2Vc1xCPCU5tWX9rnHvV7yebPA8Ez
 TRtL9lOITMVcqbcYr9bMkaGYKAaK/OMxnCiLD8/oqZdgjRupIb5gSS+SZ3kblFsVoLA2ZwQKBWP
 HC49Cvy6FfJYIus56jRvSn4JxmweJe1q2jM8Fkg==
X-Received: by 2002:a05:6402:4581:b0:566:22b7:3324 with SMTP id
 ig1-20020a056402458100b0056622b73324mr591589edb.18.1708964604166; Mon, 26 Feb
 2024 08:23:24 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-33-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-33-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:23:13 +0000
Message-ID: <CAFEAcA_o+xFJpkDahOkz3UGdV1aHfvpSN_jUKT-EajxHCvYHOQ@mail.gmail.com>
Subject: Re: [PATCH v6 32/41] Add mailbox test constants
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: 8Rt/hcSXuOaj

On Mon, 26 Feb 2024 at 00:10, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mailbox.c |  1 +
>  tests/qtest/bcm2838-mailbox.h | 88 +++++++++++++++++++++++++++++++++++
>  2 files changed, 89 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
