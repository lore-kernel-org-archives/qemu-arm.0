Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp792949lfg;
        Thu, 13 May 2021 12:50:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG2uBA46RsrqCkZCP+aKvt8C8t/dqqyDLsfOH3zfXPY4XYY1/gatPCChNs9rh4qAQVEA9d
X-Received: by 2002:aca:1007:: with SMTP id 7mr4085425oiq.134.1620935405253;
        Thu, 13 May 2021 12:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620935405; cv=none;
        d=google.com; s=arc-20160816;
        b=YNoj8whO6JKLAYIjEWuC7hs+o+Kt0AZd9zGvKlST6L7Ir4V44QC/2ixC5ouziKzrel
         hsyfb7HxmWOz/WxxOPyb7iFXKfYqgs0n3my3Kfq7N1n6bFD+AJxJ0+ActA3MNuQVdzkv
         /Oq2ywb3CVnvxvHlyQk0dS1qBwc/G0qIa7BODXcptVTrKcA37xixm+iHCMZumdRnO/5P
         SLO0Ys86FfPTJmrNnrCSb+fvrzu5X/j8ZPYfmoJx6hVHV/+fnEuwKecB2xSNCO64KDpy
         vOJH6WPFATvpX6ltzmLv5AmxsZUkCFE3e+qyKGJjCpEgndjFqJFlSAk6qsSxxTq0J5C8
         k01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=brZcaQSIL5KZPryhs9E/VBzxUNjNLY9llFPvzcPHh/g=;
        b=Yk7QBuztHDubAXMYZ4vyQiSntImow3q/9CCCWWaA+6MErh1LYcQ17LwuZXbY1j6Vrc
         fDrXN2phB0U4jMLoGXImLQq1Xh9izf85M47MrxVJeiDn3pjm4NlyQEQOBhta97QFfw0N
         dDGfrCGPXmRoVsBVEbVtxj01P6HbzivFNLP3CFiHVxSiMj+IKEeVIjQhH3eqrplpmBU+
         UaJLG64ft8UDXdRcDHWvpPmRyqc+zp9SJuKcEDN5k+0CdVxTr/DsL6KHueBE9TgeNwem
         ZI3Hh1Sx+OOonoNaED7kspoRqMqARxiemXn+wsDM4do/f9w3bA17+GH97XNzYHbbCVke
         pnfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IuUk7x+b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si4148731oia.22.2021.05.13.12.50.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 12:50:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IuUk7x+b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhHLQ-0005mQ-I0
	for alex.bennee@linaro.org; Thu, 13 May 2021 15:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhHLE-0005ir-7b
 for qemu-arm@nongnu.org; Thu, 13 May 2021 15:49:52 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhHLC-0005jB-HM
 for qemu-arm@nongnu.org; Thu, 13 May 2021 15:49:51 -0400
Received: by mail-ej1-x62a.google.com with SMTP id w3so41511208ejc.4
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 12:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=brZcaQSIL5KZPryhs9E/VBzxUNjNLY9llFPvzcPHh/g=;
 b=IuUk7x+bYj0gsp3A4xPFaRTAOW0TjBnktCTYdxcN3k7AGhjZ/YqWHFHHu3eps4RQXb
 gd8Cc8Btq2N2KUEdu2nhGVnbwXWiigOrlzUtLPqnpr8v8S48iICFJNUNoi/ThQaEQrVY
 Sv4OikSwk8E/0n7vagcPQ3sRzuL94Jfa74LBmW/h1D0SWbk368YivmdYFkRGpdzfFeEa
 sDCrqNIO13vPukofS6yOWQmP+Z8S5wIkvrRDqHDRnFzJFBUWpM8Eiyb9A5BfQ7AcFJ9G
 M8mY+MtkiX1WGPgGGC6XObfNZTSnpI7pQibH62cSTGnsScM0a9dFmQmtA0/bGNuWZkod
 soqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=brZcaQSIL5KZPryhs9E/VBzxUNjNLY9llFPvzcPHh/g=;
 b=WI9f2n4ASlM0WjLakb4PdFPN9XdTXXWyyn8B3YlLEpuDm+C5aDJwDGDIB49jsyNRLM
 Jn7X4VTPbqa9yOTR1M2VclAAR/17G0Ma1y7f+/WPDtB94NTlf34WNGuTYEtryPX+2xN9
 cYHuUj0EBloMHbNWIUuFwRvzxwR7qdPByWgjXiTpQ0o26tRxQ3zGLkkgRb9W2erslsqN
 1e1/judEzv7ZbeHhYTuXUdjE66CPwAXIVMVPzGRv3WcfTA428I/euSyizpUAdIYNEbG3
 R+d1H4Dcotfs6Mp2LyynS568wK77YTA1xCe6dkLv3oDgan6lrRQNi+hwroEqgu+2UG79
 fKCA==
X-Gm-Message-State: AOAM531nyvzOxADqHLgVlhw8yNuleGlBucDn2AaxLD/93t4F8CUPQMQy
 FXdhyR6/zyv8ejLQlZ/kT9IdyfOZzoHqCj/LqVcQPQ==
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr6374991ejb.85.1620935388977; 
 Thu, 13 May 2021 12:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:49:37 +0100
Message-ID: <CAFEAcA-DC9vL_C6F=P309wAE5vaQjJuMrrorN4nobaKGC_7PEQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/82] target/arm: Implement SVE2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: B0rrCRe6b5l4

On Fri, 30 Apr 2021 at 21:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20210430132740.10391-1-peter.maydell@linaro.org
> ("target/arm: Split translate-*.c.inc into separate compilation units")
>
> Based-on: 20210427214108.88503-1-richard.henderson@linaro.org
> ("linux-user/aarch64: Enable hwcap for RND, BTI, and MTE")
>
> Since I believe Peter has both queued on his target-arm.next,
> and I didn't want to get in the way of his bulk code movement.
>
> Changes for v6:
>   * Rebase as per above.
>   * Rename isar_feature_sve2_{i8mm,f32mm,f64mm} to sve_*,
>     because these extensions do not depend on sve2.
>   * Update hwcap for the many extensions.

I think I'm done with reviewing this series now...

-- PMM
