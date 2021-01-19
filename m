Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3488524lfq;
        Tue, 19 Jan 2021 08:58:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjdY5hBauwsuAIpVhoeYg6grQS81H0pZ+vF6Uo410cckaIXK8ZjjC2xkACKhPXAZc4r1pA
X-Received: by 2002:a25:3812:: with SMTP id f18mr1069610yba.207.1611075511555;
        Tue, 19 Jan 2021 08:58:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611075511; cv=none;
        d=google.com; s=arc-20160816;
        b=DH+Vys4u4oPiNQiyCnNGz/4u9QPGhC79jFTnchD1TL40ZXjgU9C44VPfEXHFGDiQ3g
         WI9pgg6odxfe92h9+ioT89b0pQNKoep2zO1FDh+b7nrP3Gg+SvnNYFxONEg3AeVI44AU
         KtA+g32u4y/w2s+8QswSdTSGCuq1B4KyOhvqzA0XXaqh2IWIDbWP1GO2/m+DyeALuTqo
         3e2WzxS2kj/BMb8E4Wc9kFKZG6LquC3Jk6SnnrOJn3q3r16XbuxEKz6bIW4g1O7xk6F0
         VcH37HCeYczgRNKlfj4Qsv97i08bUkg+9IfOCvVBXm/GW6BCUgf8IN32IbEoCVX30LfT
         egJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xd+BCL3iHWTvFRJb3pccf1sHG27Ef6cwmx5A6nCxzVY=;
        b=YtW/fFNphjxcpcayghmIaxQuJbqaaY5O+BTp2wppVNIc4T/M+P0bt83mBla1tuBP7r
         nPPiDuaKL9aXGUZqgsHEr51DfOjbhIUl7PjOFqS9m99cFt2wAaKsDRN2sa6x/Bai10iZ
         B3SNOke0ZJZkBoTmhL3l180/SQvaSCHD5AR2DZAmjTN3SFZjApTqZXvRQs9YZ6akOIbt
         KQ9Ro4HcsbSuKYoKnUSs2/AqvWLHL7NrQ9Eu9pDjfW3V01Ynyrn01Q88EWlZMB6zCCjE
         HTFYBiMN3VhzHUrZD0YvE8HJcEUYq1aztipZiViekLvvsCXK9i8HtDdgbKJzN6ac93n0
         vAJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tUIfihmc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h124si11455226ybh.37.2021.01.19.08.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 08:58:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tUIfihmc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1uKs-0003Dv-Os
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 11:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uJX-0002nY-5y
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 11:57:07 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uJU-0002cD-74
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 11:57:06 -0500
Received: by mail-ej1-x635.google.com with SMTP id b5so13061589ejv.4
 for <qemu-arm@nongnu.org>; Tue, 19 Jan 2021 08:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xd+BCL3iHWTvFRJb3pccf1sHG27Ef6cwmx5A6nCxzVY=;
 b=tUIfihmc1flp94UqJZfsCna0dWXCIKwDDPd/6COPKD4cpYdWVkNLZWD3ETXdP/A7p4
 uwWwZ8zpQNoEGOxGgEuFIdZWDlpb69NeGF6aXWMGAG5/szt1MIfO7T8r2T7ojTaYZjze
 EQAtX6K4U4bzv5F0unWrkOmGVo36xaXF/dTX2f9vJ+6hqDdhWdo3OWg4w5vig9sZDh4z
 5/zJ8zxkYj9H9CsfvD7Ql4jQqzt2wsBpOZJMpbVlGJSSe2UiWVqk8KfX1E7vnFYyPJ6K
 VimVNpxXu3UzsZu8Wj/tSxxnyXqYed1o9FBjTVs2XkTCGjfWWvXmonWWfaD8qtLlq1On
 9ClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xd+BCL3iHWTvFRJb3pccf1sHG27Ef6cwmx5A6nCxzVY=;
 b=E/tre9JUxeaaYp/IRmKGN+K7pWbl2Sm+DNdVJmgvb6hb2pYIt5x/FqsfqcOCsO31FO
 8zOQnGNJMlIS1sjaAoXFROkbDG8hoWOTuawKb0wY94zLcQ83DocuAWG7pMfF1kQ8rTCi
 dtL7IbcAUjciZPDgdkzoU9xQRXNV7uIKR4FdPOz3c8J0n5ZEQkxhp9Bs6bnY3LMJQ1GA
 GO6mdfxQIYY3l58d8p4YhmmVAoSUXe1Jk/R2wPYY9SdIu1mvrttDisHIdh1WlfReCxR1
 AiQMoTpH3BrWDrq5NlPUwuLJfcz18NFmd8yrWnC+Z6ZhwLfDo8DVeqEkS+Ci0EFI84dx
 PWgA==
X-Gm-Message-State: AOAM5306wXEOMxn65/j3d1opW19L8yMwbSLM0RydKXE99Zf7Lj8tL8Wk
 ngXmu16HsTFzPUGvLWSiYtQ5uwUPPZ1rAjBfzL5cqg==
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3679461ejd.250.1611075422833; 
 Tue, 19 Jan 2021 08:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-5-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 16:56:51 +0000
Message-ID: <CAFEAcA8mO4A4OVtsuVv15CXGABEZNY5euTfLsRd9ZvM1a_0D7g@mail.gmail.com>
Subject: Re: [PATCH v3 04/21] exec: Use uintptr_t in cpu_ldst.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
X-TUID: +MInrlgOPO3E

On Fri, 15 Jan 2021 at 22:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is more descriptive than 'unsigned long'.
> No functional change, since these match on all linux+bsd hosts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
