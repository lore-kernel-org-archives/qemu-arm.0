Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp280879njc;
        Thu, 14 Nov 2024 04:25:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcIMYaWYMBt1/Cua+DYaM+MN6q9Y4F5/+aX1h46LgPNzVvO1ChrIKsepdbakKi5BvoyD2paNlM9XnJYg==@linaro.org
X-Google-Smtp-Source: AGHT+IHeSN9eM1ZrWX68SXWriihCq8nHmjMvxguPVOplrP+zgTz3KN1xn1Nv2obIt40Tf/X0wPWd
X-Received: by 2002:a05:6358:850e:b0:1c3:7358:3d1c with SMTP id e5c5f4694b2df-1c641f3cf89mr1108394755d.19.1731587105331;
        Thu, 14 Nov 2024 04:25:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731587105; cv=none;
        d=google.com; s=arc-20240605;
        b=Bax5BmEqSNMlZbYbfak40VGx/B3If3vCXoy9+TVCleAQOaonMmnrf2ycQxMoH67jNJ
         weX5babokhKPZSgLMKF1xyApWonukiZP+WQrxX87gzGmj34SFBw+MB5SeRgJK13ZTSNs
         +uDj8UEiIEURBR0A7TEst7s8bqs7dw37T4QYpXMs3yWm/OcBeW5xc4uPp7WBnBuwN4Im
         4uMN05n70mRXEy9QHLMsIySLNA4xttNYRT7pZRX162bKlhlXC3I4nwlPkKLlnwkDgPI6
         gXXJKlV8rpzxlpkuLq8EIIyheweOB3mvLHcufWI1BwTNN/H1f87a8Ir7qI5vDuGXYFp1
         4XNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=d3Zr56rVpRPBCvSgcoYTySp3vkQbhuoBFeXwsSxaBvo=;
        fh=RMtks/B1rDlA84QWpidei8UFy5/+bnY9o4N8QVy6c1w=;
        b=juiqDmJ+rOxrLpX8Qo0v3My/VYoHXtF7envJNJCtFCkbgCIpF1I6p+1xg6Spl/1t5u
         yjVFpwoOgGFi0HGntzLOmGrOtsed8OBVQc9Izt1BrE5B78L6yKIVrEbwe9jhnRdOjQSd
         vXTpLPTdzHSPu+rrQ5twwREiJ5kkGQNoCvw1hOtQ4QG7/OGeWz7x7Rshl10wodp/Hu0J
         k+5cPXPhsqOwlsCgEMMFRD7vR1HJPhHESDlHu502CiHyTqEitzc9BljPh5JbcX9TTKlo
         XyRbpY2o7oGpFA/NHGnf8nIYf+lhBQWl6+fWSPzpBPDwZSHMm+iKLTJTmLogeicgWtsa
         yYuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TjCF3re/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635ab41623si9817861cf.599.2024.11.14.04.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 04:25:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TjCF3re/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBYu0-0002jW-Ll; Thu, 14 Nov 2024 07:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBYtz-0002j0-1P
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 07:24:47 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBYtw-0006f4-T9
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 07:24:46 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c9454f3bfaso763002a12.2
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 04:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731587083; x=1732191883; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d3Zr56rVpRPBCvSgcoYTySp3vkQbhuoBFeXwsSxaBvo=;
 b=TjCF3re/BGuelBvWShoV55g5A0ocEmdCZw8M8Fz8cb+Bgo0PmMjgCzeoQDm5QtyPkf
 6kO5ZyEdh1nZfXI91en5UqclRDgufwKSOwBhKx51Hec314HMmiwr75pDdrverwBadLbu
 pCi0rrDtLL1kRsw+H/dbW027yhqCFHqqxYHzar8LIk9zPtMJu6UlNWuh/UX3+QSzpPZ8
 gyGMlwU9scnZAZASHoms/J1pwm60uM/w9yavyNrUkk8DmY7IWPwTdkntmQbHB8s0jCZ4
 4sfNOV6v8qE56QPsq/hyZysNF9SiNSmfNPJvte0kvvH1ZpD/MZeFL1Bl0VbWPwluFtbI
 8UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731587083; x=1732191883;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d3Zr56rVpRPBCvSgcoYTySp3vkQbhuoBFeXwsSxaBvo=;
 b=Cw5l9hmoNVQXDnWqk/kMQCtx9TsO6SM71S2VMDUN2kCL9s3UTeVgFuhftU87Qs4Aob
 Q5q1hk6QedeB5Y7rgP3jS+3IFW6bBkFpnA5ytfYYRrr5BFKiMhlgXuw1goDM2H8yGfLf
 COACwN5kOmskHrIqdeXU+EFVBlin1oZcyRFlElqux+VERDlnfVdPD3jdRjuwqeI0wFEc
 SIqirO5kPNBmCejXMauP3zI0cE4NR6kQZBTBzes6kl3s9h+dTLCqRh14vJwvBuZ8gcWI
 xuy9tBOcgogtBKGDciR4h2yQZQTReE6DrYv5H9tu2V6jGc8MnjklMnCBRq6qo4uyRJuj
 6PuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO95CaiRxAux0DR3RpS9VhlN8iDw5dvary2PSHIj+llxoKP2qAMHESwkQBebXzAwTeFvxTF0Nsgg==@nongnu.org
X-Gm-Message-State: AOJu0YydbvSgYW6AFuvMkkNd4hZzELBuw7n1kURD/Yvs79DdBgG0Rk2+
 NyAw0H0mjLsz0E34EQ9m8O4JE51SJ4WzsWdxGxF+VCiFs4UG+BSUIXzNptF8D9D98VrhbA5ID8C
 7uuj6I661QNJ5j5rB2AkOQcDhtPSKTQqwgrj9+34NI5+jf8z4
X-Received: by 2002:a05:6402:1d4d:b0:5cf:74b0:36b1 with SMTP id
 4fb4d7f45d1cf-5cf77e86514mr1547396a12.7.1731587082528; Thu, 14 Nov 2024
 04:24:42 -0800 (PST)
MIME-Version: 1.0
References: <20241112141232.321354-1-richard.henderson@linaro.org>
In-Reply-To: <20241112141232.321354-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2024 12:24:31 +0000
Message-ID: <CAFEAcA_CsWCNKOqNKJe37JRXnOPikLSRq9FyMR+T0sLLkAidLA@mail.gmail.com>
Subject: Re: [PATCH for-9.2] target/arm: Drop user-only special case in
 sve_stN_r
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: nKLsffnaZWyd

On Tue, 12 Nov 2024 at 14:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This path is reachable with plugins enabled, and provoked
> with run-plugin-catch-syscalls-with-libinline.so.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sve_helper.c | 4 ----
>  1 file changed, 4 deletions(-)


Applied to target-arm.next, thanks.

This looked like stable material to me so I've added the
cc-stable tag; let me know if you think that's not
appropriate.

-- PMM
