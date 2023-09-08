Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp434071ejb;
        Fri, 8 Sep 2023 06:44:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCMFsbmcs+nUFUPrgPyY+smjHXncNg37Z3CKY/9d9jgzHJ089ojHbfuKULFWcVfxH1rbwt
X-Received: by 2002:a05:620a:4415:b0:75b:23a1:8336 with SMTP id v21-20020a05620a441500b0075b23a18336mr3239340qkp.49.1694180662131;
        Fri, 08 Sep 2023 06:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694180662; cv=none;
        d=google.com; s=arc-20160816;
        b=GQSVsqJyTQ3sZP/JZVVA8/Z/wo3couY6Y4F3xKR1pp6Au+i/OP9/eZHv3I3327tI4k
         58iLKjHHBIWsc52JKXqg+74lPoc0XwKzML9WXHmRv47yiw//yj/zTVWvyb0wFrDOUwYz
         7awyE+Yad0GMGouzH8DAIMxN5VNgvc0R79uKjN8Qw0neUgEttjUR7dSkI0H+g8E1Gd3F
         SBb9kSwbVczI133E1FMsid2uM1SWZPSszd7EfWndqMFwSxREuGCewcFrW1Zs49v4VttM
         iOUQiGJpfOUtnRMyGAvxMv2jqAjp53t/b7ZP7NQvkERym5VeYeW1UVCZkTS0x5j5/r9e
         TsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JnWAPaytL47BZJ5aTLD4mxXO1BCTndRYvryRSYsMG5I=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=hbK1rPrD7HaS/sEZ8AOpnxnCUkDDiupy2hskUuQX8FbsTIx8HfdlgzBJ9/gvLY6zZ0
         eg0t5VZ9V/XxLIK37wES681btFEHZuXF34htMlFj+mk8ydTHtiWwWyYCLfBQUTa05SWr
         ImxaiDJDhJFQ9MPTPBY2HdeieR4Qh8ydvYulBp2gDHs2zO0UsdLcOTB9dclrs4aSjgJs
         lxFcMzcOVuNgEu/xEuXsKFK7t8dYFVyU24/kn5LoTNCD5FO0SqDCQP7WpAVIbN+E4bA8
         6K2KKYL1XdTBORUMZ5bOOy0ekfXF9FGYUzAjZcFl3V0dfDKSlmkwjHWT90lR6CnMpEhl
         egVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfL3wdy7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs44-20020a05620a472c00b0076daa480ef0si1049073qkb.709.2023.09.08.06.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 06:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfL3wdy7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qebmN-0001oz-EP; Fri, 08 Sep 2023 09:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebmL-0001eY-RL
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:44:09 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebmJ-0007WN-Ka
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:44:09 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-501bd164fbfso3351920e87.0
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 06:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694180646; x=1694785446; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JnWAPaytL47BZJ5aTLD4mxXO1BCTndRYvryRSYsMG5I=;
 b=zfL3wdy7U0rplZwZr2nD41wfTTmGvsGo6fbYMnI7OdhPTjJfh3ckWBOgo08kfYHb5g
 hshxDrq5OVGCsCCjAL65FC7d0TyCSahsIfKySZEBwwmcvCK34r6wABnYQDNsMxUygDiz
 8r5/lEOo5bM1cxXtPTQ1+FY/xNVXDFNmLtXik2awYnOtzEXM2KF0SUS7hQ0L3ghl90wm
 oNIkzDZRbPgMs/ZWckk6cmil82ldkJYzIZRmTOKgBRmtW+PXGdnWMUPFz/8rqlZvuCzF
 XA06rguFGLWx2kiQstU8nrzuDv10cmWf0Houttiupu4U4JT4pGCHT6JyGpNE1dla5WL5
 lVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694180646; x=1694785446;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JnWAPaytL47BZJ5aTLD4mxXO1BCTndRYvryRSYsMG5I=;
 b=V685gCMspLIWuMCoABuj2e38tEDSNfZ26FDQrghiOSUP0RTm6iu84kmIym/j5J3D9Y
 TkcLcRE4iAdaDlL7o01kWr/pjiZpfsoccWh/NYsfpeFF8zBtGa74UAX5fmQs+GsQ8fBb
 UIHMW61kGuEXsRy3VnlLWSgm0B4motlPWESCNmhOIss2VIjloyqjZgh5DtUjM9Hxlctz
 em0EaBGxd+eUMR+piFIYAFD0M9qOLt2yEdR2X5UzENrj1UxyR9Mm3GvBIEOzjQaCOICs
 HrkWJU61JcZ8x3S0V+MxXkUJWTEbTekjULwABq+AvZR2yWm2ztcoC0TEZlBlaJKbfPf4
 hz9g==
X-Gm-Message-State: AOJu0YzjDTJ5rHxoeQ2H9eW3c59yl5/ZYOfwnOp3SFnFjO9oijRRW2aF
 THYP/uN6qfqWLxfr4Adx5Wz68kSwuLy3KcyNd2/D61AoPwV9ie4I
X-Received: by 2002:ac2:488f:0:b0:502:9253:c56f with SMTP id
 x15-20020ac2488f000000b005029253c56fmr1625867lfc.44.1694180645761; Fri, 08
 Sep 2023 06:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230831232441.66020-1-richard.henderson@linaro.org>
In-Reply-To: <20230831232441.66020-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 14:43:54 +0100
Message-ID: <CAFEAcA-ZH6ufnN7wMrFN_vkWRZoAFkhOzuUchhKBwcXYNdkiUw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] target/arm: Implement cortex-a710
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x135.google.com
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
X-TUID: MlacQP9d8jNh

On Fri, 1 Sept 2023 at 00:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v3:
>   * 9 patches upstreamed
>   * Implement RMR_ELx generically, as a stub.
>   * Implement TIDCP and the closely related v8.8 FEAT_TIDCP1.
>
>
> r~
>
>
> Richard Henderson (5):
>   target/arm: Implement RMR_ELx
>   target/arm: Implement cortex-a710
>   target/arm: Implement HCR_EL2.TIDCP
>   target/arm: Implement FEAT_TIDCP1
>   target/arm: Enable SCTLR_EL1.TIDCP for user-only
>



Applied to target-arm.next, thanks.

-- PMM
