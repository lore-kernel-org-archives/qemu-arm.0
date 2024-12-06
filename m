Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp962574njb;
        Fri, 6 Dec 2024 08:12:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX9/kZHfgWLvlPt2+/P0/CmGKKv6gcxfmksZtTB91yIT5KJsPo1j/sg8WEktjOaSWbPHcdgF8HxJcf0iw==@linaro.org
X-Google-Smtp-Source: AGHT+IHlGZFkXDj8zF0aIrde4KSxC9Bh+4+IAlYSOMJjetU7Lqj9/p/bjiBUHeNvYVeWCOOlwXN5
X-Received: by 2002:ac2:4c88:0:b0:53e:2fdb:4de6 with SMTP id 2adb3069b0e04-53e2fdb4f1amr1269757e87.38.1733501548305;
        Fri, 06 Dec 2024 08:12:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733501548; cv=none;
        d=google.com; s=arc-20240605;
        b=H6KPnpCBOtreqTSk0PT1MRanh81Im+f2QtUF/bLJNWEJZntoDr1oq2xpM1H2NKIlEC
         5W3gcEtO+LGZECW3Y9kpFcorvAH0o1kNhsYtLLuirUXGkzNcSokzT4G4gHsAaXTn87Rp
         8tyHLZgxHwaIWTXOC2/KIsmbJ2p/ACcQ92y7AnrW40RRkgawT0FlCH8lJWkpa+AbQ+qs
         Mqn4eTox9LVWWXjXotikd0R8lTfDW4z4YdB3ypjlSDIOeJXFt/GMQhT3U+sAPME9EmiM
         afbeNS3sm1Y67D50zDcATL3A2vyKwIibo0yBwgDCpFPqhefUPLAkZl62N8X8AZ6uO8/p
         gBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PuDCDux8HEAHY9Pzx394TWfXAEO/U1wpbtbglAlV7LM=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=NDcxeq7x1mrgGSh6/w013/USgerer50M/hm8t8VEzl9myl/5bccJqTxcrLAkQNOTXT
         i6VAF1KlvP7sna3zrjX0hUAzR6zgUKmkAPM1Ywz24z2VPSuVogQ15JPWIuUl6/pLRZu1
         sztN1rq93oqAniI4Ddeg5gi9scyuvPhrA+msBlP6WH4nzESpMLl2ckQDw7NHun5Hu95h
         naMWfNvyBDIY0fOx40SFBA6EUFStPLesh4Keed0Zjz2myHKjbVWJgLI9AvOrP9dQQzoq
         QrA9MFs1/Q6zZrZu/4qdMvJLU2B0hzhTOcIRiInLJjXJlcqamPFE5e5g6kraFzcrRLc8
         8rYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kKGlWGsD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-434da139fa6si22924515e9.204.2024.12.06.08.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 08:12:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kKGlWGsD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJavp-0006PT-MB; Fri, 06 Dec 2024 11:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJavo-0006P7-1R
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 11:11:52 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJavm-0001dA-OB
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 11:11:51 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3bbb0f09dso1301049a12.2
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2024 08:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733501509; x=1734106309; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PuDCDux8HEAHY9Pzx394TWfXAEO/U1wpbtbglAlV7LM=;
 b=kKGlWGsDiD6sSBpTZBTunV8coipzA6cOpDBXDRsP2GnHzYXSJVLhI2wn8ltUYh34hK
 mFLNcAvP4lNFLV5rZ5bzbCOCj5R+RcSCAHQwbPBmeCNANTwFzg4/alMChiML+HbMu8Km
 cAwifs6vlVyR6reJ0FHab5zkYte/IlyGhOdX4kOxCzdaqREIxZn+kwegmUyHoMD26Bnt
 4zv7HNI3jXeVQRsTMWriIcWCLgiGAj3SqfFYa30EeTXf7MOvebZLWBpQcqqjHrn/+t+X
 floJlEqeZyGZy3WD0JO+Ufs8MFcAw17U7oHIEce7DcA8Ica+MNfaIUqwnqZSA0bCDF1k
 tUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733501509; x=1734106309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PuDCDux8HEAHY9Pzx394TWfXAEO/U1wpbtbglAlV7LM=;
 b=jokAs2ehXXCGHGXz9NUUMN0TL+AOEk+PKFE4QK6E2s0jjgUL8mSxM3cIHOdjHOr+0R
 d7qYwkhD2uLoAYRdysLvA298SRG6hKwmGFi8TLDdcoogq1xFvA3AHvdSxpi277OtGgFn
 TzjyzH5KUyc50wjksz90wpaCCP4uChI4lvNHIcZileJxMUJ9ozkHjsyLzAUYVLbPn4BJ
 GQTF6URv72PHXVAqW/rofYqwvu6bNG6jSP7rbE4MDiXxBI88BGZeDhmmVbAZNC9LxyAS
 ewYch/au7OnpqUJj4dbZ0d4YSHg1Eru+xtZahp7wi6guYfjw88dVE+6abrVdfEVTNA9k
 7Ndg==
X-Gm-Message-State: AOJu0YwS3T4RlmJCV792ud+lczZ6KP3dKuFeEnE1u/wv067AuSH+ocS5
 gr+ONceomSxxGKpziVIBHXEdPtnZdFDfvS3hB2FMwavW5sxF5/kVbRcTPg8FPAsnUZl0og24bad
 VG+ML43Q38z6iSMpKGHha/minpnUftsbKOuTp9vTqDenDmoDp
X-Gm-Gg: ASbGnctYlVttUApkpZNuWgTNY3hA5ml2bWBWkRL+dSsUHTohEM3XGsHI7870A13zZpS
 WWhL+zj7r1oe7n/jP4os+Ap1wOBYwEPuz
X-Received: by 2002:a05:6402:5386:b0:5d0:e73c:b7f2 with SMTP id
 4fb4d7f45d1cf-5d3be660913mr2744595a12.7.1733501508797; Fri, 06 Dec 2024
 08:11:48 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-54-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-54-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 16:11:37 +0000
Message-ID: <CAFEAcA8CS8CbDS60Ru+ta2VJm2nK4L3aqzTZACkqPMFe7JHifA@mail.gmail.com>
Subject: Re: [PATCH 53/67] target/arm: Convert FSQRT (vector) to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MxzrlI1UCHQD

On Sun, 1 Dec 2024 at 15:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
