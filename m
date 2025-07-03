Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp496878dyc;
        Thu, 3 Jul 2025 05:22:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVO0Q9XdCkNO+JPA+FIfimgF7FoSswcW6gjzsxRVU7e6u0SCOfZvyNRscW96kWzLC9/+Co8moRdB80wIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGeJ2kAVVN0vjZ8TO2dNHS+DxXBRBYqBTuLVBn2eWATT8QnlmyjUSQFXor57vhMHz4UwLJJ
X-Received: by 2002:ac8:58cf:0:b0:4a7:18aa:121b with SMTP id d75a77b69052e-4a976910561mr103882881cf.20.1751545355692;
        Thu, 03 Jul 2025 05:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751545355; cv=none;
        d=google.com; s=arc-20240605;
        b=TAQ+l0bffa6SZ8xFBu9QQ3Ar8WT9/jc36/qJRvFJjlKyz8lGjjQwmzcTUVPGGA4wPw
         K2kWrsEUkhgubqQ6XGRvSq5aUGcHjp6SrT/SkvYDLrHUkBDuGQiGXIq/8HxJJNGXiQwj
         ruRy2wyDNRdi7Zw0Y4fSI8PMgnaeMM/1Nby/rWzYiIzEZC3IboPObEE79RjbAuqIEzvE
         CqSKn82e+BS2Le9VfQP3OxyP3vzeAFlzOyA1Q82pIR8HtMQ7Hmsu/W6rcdMzR3SWaB2k
         qFhrQ9jsPNRXkPFeSdSiij8e8sfYfwFuQYGPhEPvKJbDhGTQyTRxRh3RSVZPufsVdBrP
         qORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vAigPDr82y1J39/o53j42j9ra/pn+xHQ0yh75wmRnjI=;
        fh=U4HuVNIQ+GdnMV2x4Ejzw2+oAJ43fzLxCAcbYSljk20=;
        b=UN4uB+TyMs5h3ekY/8zeRyWr587NMStyD+BbNXfIVRoqaBNitFgpXUm0AxmCUuDtko
         Dn6/SX0WWEu1g816W1ISm4X0tPYCHWIhF50a/Pkhz4+4PDijhZ9edWL/37dNNKPITDjW
         ApM0WduFu8L+ONUfyC49zw7q07gko6Qjr0vIQKw+vCph/n8GHJuUtijgFIkCHhRfwnhF
         Igp2ZBGgDIRtOrUsMOD26L1YR20V7vW+7YcgJGd0qfVjo0jLJsYoaysSLcDFtGthL3am
         pR/aOyXx7yGmZWqjaU4/+P1eAUGaohjHQPJdtkUArbQZDRBRBZZ9CRPbgWE46Khp1dxj
         D/AA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cjb2Uqfz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a83289c3c9si63233241cf.580.2025.07.03.05.22.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:22:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cjb2Uqfz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXIxL-0005GN-Qc; Thu, 03 Jul 2025 08:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIxA-0005FT-Lo
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:22:12 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIx7-0003t7-Qz
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:22:12 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7115e32802bso54111917b3.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751545327; x=1752150127; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vAigPDr82y1J39/o53j42j9ra/pn+xHQ0yh75wmRnjI=;
 b=cjb2UqfzDUAh3EP7S7N3c76jhYbDHp0Ve8H8q49CDVP4iLcXcWEoZ5UEx2219ltII+
 A87oqVmb4YeydwaVoHx0aoxbeZnosWzRTeHnO2TRjWYFjUsFUQuaqUdNIZEb+SbUJuNm
 R+DrQQAyC0JSREUVPR1MSkU23uFY8X+MmC1WF1Zznwjbgu6u1b+H7+eaN7AtotAn0vFm
 6sPVzvxg4QMOiI86BG+UYPqGzDmlgN1ChsD4k+SqkDnjExxd624OO2jKn+8MtmYYBtU1
 dxV7+d8oWsyQh2EbSBuf1z/KTBxANkvb2eNK5Tn93zuMxiocJifbz6iu38GtiWTLahIN
 Zvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751545327; x=1752150127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vAigPDr82y1J39/o53j42j9ra/pn+xHQ0yh75wmRnjI=;
 b=WLNGbJc82DM+EkcGmx0E7GYQkF9CZJ3KmPlGiQHh2eOAL8dtAxqNAUuBSPljJ41xFf
 ESfZSmmxnut1gV7QCKRJyjex21tjVBD6CbE5VDV8nlO8K/+oyskRRrMkRiMftB8XCt1o
 lhvGiOENvSNyu11SnGLk7bx9OOFr+OD6e6T/zuEe9lneHWZlU8bTR66yWi1EZPTthXi4
 wg+c23sXlfwcSILm82hBhq5c95rKFaaYPtS6xxhBq1N/W5zNPUHZ594N15hHiRafJjS+
 ogXQyZVdRO9ICTeB99aGwmDnCoqW5g62dV1581jGJHAn2sMV354+OJ3FKaXGti/0Zipo
 9wTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXNWTi1TlKRcOvnSETESCmKFQoDe6QvKtPeTxB2qGWcitrpDp7E20ZdvdYhm9hhPTFP11Ac3x8vg==@nongnu.org
X-Gm-Message-State: AOJu0YzFBgZZby62I/eMK5lEBwWwpIySTWt+pHOKV65R9gy/wlwyy8Yy
 gG3/iinnGFfpbeFGGq6KHO47SON+5Cabn1rsY/xRNYscEhTbzlQdQTu+G2JT0HfFgtoBUFpzdFe
 dilWYYGXsY839AK9OFnTNYmJBFVeS4VPtKpwXFecB8Q==
X-Gm-Gg: ASbGncuaCu5gop7mBiGnkIqyZf7jxbTOxBVV8WNqpU3JDkYl/RQdcGoYQwnaXouB1b4
 FeFByLwiV9ZkHsNz1VzTuFMaYDl3FjfGT4DidF97akLXWPKQJC22g1luUhISnHOs96HGZE/go4d
 hOve6/Roxadji3QfN93H6HzYHgUTRfwwJKVTjSnireoPfBmk/K+PFa7W4=
X-Received: by 2002:a05:690c:4447:b0:708:f6d:b79f with SMTP id
 00721157ae682-7164d47f68amr93282397b3.29.1751545327333; Thu, 03 Jul 2025
 05:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-73-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-73-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:21:55 +0100
X-Gm-Features: Ac12FXw6FwPOlOUdM5AoYxBcizpkPsw6r_QbEPy-Y4UdzxjpE9n4zVV8pu68xO4
Message-ID: <CAFEAcA_5o+a+NHT8nJZFLxLfSMXcAy9NDsy0Xbp-BPKthjrO3g@mail.gmail.com>
Subject: Re: [PATCH v3 72/97] target/arm: Implement SME2 SEL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
X-TUID: 5kGFXjVUIpDd

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme.h    |   5 +
>  target/arm/tcg/sme_helper.c    | 315 +++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c |  31 ++++
>  target/arm/tcg/sme.decode      |   9 +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
