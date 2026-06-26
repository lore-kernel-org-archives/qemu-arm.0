Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA084CDE00C
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 10:16:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd3bt-0005lz-4T; Fri, 26 Jun 2026 06:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd3bm-0005lJ-EH
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 06:16:27 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd3bk-0004oj-BG
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 06:16:25 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-664a2c7b579so337050d50.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 03:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782468983; cv=none;
 d=google.com; s=arc-20260327;
 b=Fj/k0Dc+hErdqKfUzU6f7dGIqX3aiRbet3Z2mhe3Ou2XBSnH/JQ3BnmMfL7/5K2SFN
 VTZAKVSMm2JpU68MPjjp3Y0yuRH1wkaIv9zZ69J1m/xpKJzsm8HJ8w5Rs7A+0FkxfdWc
 RVhBV42QaP7vfqzPn+XM8d5XMaj+GycQbR1nEW6LAczr6sGLdOroQp5ymp0yPEY11fHb
 SxNl8PyOIxy4582y1Oh3SRsBKNfGaYFFkxu+mys4LWdk7jCGj774zf9bd3zLg3helplZ
 o538ZyuNuubexMMGj1Mxc6OQx0KD3/fmfk4eoxd8HekERmUHoZv5zPBAW3O1V5Z6yKcr
 Ou9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=uLH6Bg7iG99j8VqmS6X+55BGd7jMKKPuba13KM0DDg0=;
 fh=kxGaq5CnseONqBPCe8ooHQf1PMP8AWqJCg1wpIA60Cc=;
 b=OyM9kNlbcqO4qZQtphK3mD652LS4C+7xLbqjxm4ucuKIAYzbJ+smVnKybNjWe5UeQ7
 sKk90q4VU9wAq3fNGlRM33IefF+cThowc+bnD/jae05DYBhLnJlgjMpb4a6CNOjr0+ia
 yup9dI5BwUwqYGXJyi2vPffPxv3oN+Out7BQK84aL5sVeLZkfplgUulPCW9dnP0fU2zc
 1uDu3kJVJFLZFwy+6VedA8k/V4yzzz6b5x71VNZZsy4GglND2QqKG+aPSLNWiDip8aYF
 X5fhLo8Bu/SpjM/P0RTgR2JHWx0/sYPibsenroCkoghK58nD9ckV4zH2r03nRI9Y+Fvd
 Iyvw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782468983; x=1783073783; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uLH6Bg7iG99j8VqmS6X+55BGd7jMKKPuba13KM0DDg0=;
 b=X3i908JMGIxvGk81xuCJ2+V4opa9OkqGGgdCPggiGmUr5GdkNY+A8BNMGl+mQIvUiw
 oku89cgGDncDrNy1lGUE32Se+MZ67DGgb38AN1vM8cgZHlZfL3JlXrDRpNEs22MHlwsi
 pccQwNHrbGGhY0YY9ro5rJE1jPEoRwMRI7xTEFTsQ1YRd6bcu0lmu5241BVZMdehWTD0
 apPkYt73XG2zFHoCIxGyip3vBGm201fjK48+eWF6gpRFdiVCdUm5S+g7J8kkwbQrI6oQ
 B9/6zKbCy5sfWiqRCSv4Wjl8nuPG71oNnFKb8iyCeM0BmF1oukxaeZ0anjML2k7x9BCi
 JbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782468983; x=1783073783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uLH6Bg7iG99j8VqmS6X+55BGd7jMKKPuba13KM0DDg0=;
 b=VTl/K4nfa/oy3LYmS4W7R/0s8WBa8kPTE6s6GlFDrQcJCsa/Z3rVUxKl6rR12Exu7R
 T4tOWRO/7iiRTmyplI93KoaSLbpNkC/ZhqRPBob6e2kdoajTci6wiJAuJqgyz8dPFfMQ
 Zws0n/JXsaPjPYabu0EvreVClL6QEae+uf6agZT9C5viF4NHFei+xMPB48hqPR5IKU1u
 KZKXIdDB8gNFKx6JmBx1MkENrwfWQDHVALJpLgmM9liQqgAZQ3W6gffPgTx9Fk6iq4r9
 pCyiym9YXjckvziAmTDo7IW/Jb1FRy7QkFvHqoKqDgi0bjz8kCFGvMVbjSrZy6fuH/Nx
 nGlw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqM7Zy355Aiu+09SDI58sG9R75cIXWXEUPKYPFgHIQzMJB6GQAaDkWcqaCZheFYYHSMqAn02TX73A==@nongnu.org
X-Gm-Message-State: AOJu0YxESRAF9Yp5RemlCLKsM1w2nGkmh9X4ZksIV6GkI24yuBI4xx7F
 xVEqgXX9JI/pRWIRTeI0k92BnGHm00rFSixx3k9KJ4BfcH+Qr3hhWyCIJPGt7ni+Gv26uXwLptn
 mnqUefBbNsyc5HepeikMkS7vZEGPzajobSrcsOV8njQ==
X-Gm-Gg: AfdE7ckhD71XvhKuoaxCLWRGzBN2jkpE2VUGM0nKaowBXBQvE8EsY7ntK/58lUQo+2c
 vDhAsRy+5XxncgxX74nbQgGJcAoSGb0eX3AwsWGQ3Ml1LVJXPXEgLeHLC4SP2/NPipenH/uIOTo
 MjAdLrGgQhYKBsWODWMQNdq4F4CxX9b1n53DFXV4Eb+/KkttrcAUt2WdJOQdzFdePMyEGpRiNhw
 WPvcTHZblJQHN5UxfrA47Qm2Ktz1tHsPa44tO2nGz9ZCnmVUaX/+M21jt+0dZrgf4iGkBUqxGT7
 HhNNDpVn2Pt9co34p5xu9k/mqdnw/d+azefHPnhfBUjqYloAKc+KfUMm
X-Received: by 2002:a05:690e:118a:b0:651:8d82:acc2 with SMTP id
 956f58d0204a3-6648837b980mr4887384d50.63.1782468982696; Fri, 26 Jun 2026
 03:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260625015159.719300-1-richard.henderson@linaro.org>
 <87se69haxi.fsf@draig.linaro.org>
In-Reply-To: <87se69haxi.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 11:16:10 +0100
X-Gm-Features: AVVi8Cetq6nHRepOAX8D-37Ro_Ydf64NQ5JTLgO4S5AqcDOZKM27_OXcnE65fmc
Message-ID: <CAFEAcA9fR=iZ0tqk2xBQixrMdD-JJf6LZCLCArUwWZtQTW_UiA@mail.gmail.com>
Subject: Re: [PATCH 00/10] target/arm: Implement FEAT_SME_F8F16
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 26 Jun 2026 at 11:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > Another minor feature working toward SME2.2.
>
> This conflicts heavily with master - did a bunch of stuff get merged
> that broke it?

It'll be based on the F8F32 series that's not yet upstream
(it's in my target-arm.next queue).

-- PMM

