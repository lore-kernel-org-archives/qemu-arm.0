Received: by 2002:a17:906:f150:b0:9a1:ac8c:26bb with SMTP id gw16csp70385ejb;
        Tue, 22 Aug 2023 10:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyXhqb4/wpzY2iuJ3mqDEM8BpVICkQmoYP0WjY+sbhgd427OnnSdWNOB/c3nFshRy05PGg
X-Received: by 2002:a05:620a:a14:b0:76d:a8ff:c2f1 with SMTP id i20-20020a05620a0a1400b0076da8ffc2f1mr5351360qka.76.1692723762644;
        Tue, 22 Aug 2023 10:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692723762; cv=none;
        d=google.com; s=arc-20160816;
        b=jx6nK/K7/YzEoIC0uoaVXmWTOKNYNsre7xzdZcpQ20wOzmuvaSefO7zyP2DdnuwHSF
         febdiMlPc/zj75KKd33CCfK1h0KrnSp0d7Lt2Vu1ZSMbZNbYk6EMgtShAnu41PnM/UPV
         ek/JN0oD5ZqkjTwmPS+1xJZKg5GmYk8dB+uDYreEF6NZilQQuc9wAuYNsdE57Td4S8Zk
         sPHj63o26uqMrDHSLxCKQ2KPAmV7H1+DFCP+F6s4C5Oh0V1WYpd4P1vGbjOWNRmjPL+W
         9n4JqajEmFxfDcNWB+hAgodAnOcI3f2iseDmr6X7Cng6Bn6H/w2mxmeEByUWe/Fwn4c8
         aFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NO/hXvsZQzGour+b4WKm8Pz/s6TYJUAERQ5W+PsN5tE=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=Dh6kgrM6SXSq1j2ym+y5J+jDPiyUMVdK9hiRgsFrjj5lUs4/xS+sD9mVXFJjrtPRTh
         vfqsfc+KaIwbVnAB2L3Nc91Y/MlGmPKaVEcGDhTsMiYDLBO9UCF6fWQo921Fq/NFiTuC
         xM9hLTkebeh94L+AHxRRbzZ/KQ9rX7NOfo78eY2nZqB311XhwXw2PkmVWpGY3Iq9Ap9G
         CyHDzb5n0zdqLZQsRVliS3z4ZtBL0dk9peNw0v4kMFnF7IPVuCULr1C+EW+7my5/W6Pi
         gk7SaQZxHoXUXrWCtSjxg42wqxrFiUTwzQ7Zokw5zXn4/mzFv6F2594YVHp5wID7PQce
         sf5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q5IfgzuM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az14-20020a05620a170e00b0076da7493e12si3073107qkb.505.2023.08.22.10.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 10:02:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q5IfgzuM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYUln-0008Nn-5L; Tue, 22 Aug 2023 13:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYUlk-0008MK-CN
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 13:02:18 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYUli-0002K1-7A
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 13:02:16 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bf0b24d925so30390275ad.3
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692723731; x=1693328531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NO/hXvsZQzGour+b4WKm8Pz/s6TYJUAERQ5W+PsN5tE=;
 b=q5IfgzuM2o1BrsTuBXMC4a0MShaJg6TBkPlX2hDCUwc//OlwkPiceIdUB7IX6RKk6k
 kapCglB1PBNhV1VAlDBh4Bgyy0n7f1o6rMDa2OEby0Km8TCtLhoOKUPG2HhUitsgch/Z
 9S3LcYsjhM/pwfi8/z+DRtLf6FrerNmB6C3+iQP940Ig9nGynxCYgJigi4VRWVGwmR13
 /RPtbCSILmQ8SFbl52gsywmbRN5j2hxrgqMfyxxAkX3+1z+9ZW0CiPSeCZ1CM1Llqb+3
 VRUrYSLSAPjYzdJ9QONkwqFsFdKtM+i0qsMRTM5cQeWV1bs21JwvX7K/AlMVCWiSHVge
 6DTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692723731; x=1693328531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NO/hXvsZQzGour+b4WKm8Pz/s6TYJUAERQ5W+PsN5tE=;
 b=MozrAuURfJOWPETNwctbNEHhGXBYFobNkEYTbG6YuIc3HetaOkSkRftmphI6DtkxOq
 ir8mKimeF/knNCEdfAfN+OPiUN6zlFfk2I7VEQVxgSFpeQQO35ySHHN+GP+GP6TAKXoe
 I8WBuBIQzr6mzqCILi0QkDvyaUbTZNytUQauLeo4fQd7jgTt3wzI3rUvoHTl0Tn5r+v+
 a5WzCReJNOPliLTTErNbgx+2DKsTzj9RZa+f9NEzIPr92DtuY9jGaxQDU9ah/3GBM3zu
 Y/hUoQF9YYfUKKIgr8D0NAPn31AjxMVmedvn/vBmbyjpGVjhS4yCMWW+JqMIZPplVemX
 x9xg==
X-Gm-Message-State: AOJu0Yyos8Iw5VpbWTYENqVwl4WmmtTvFivb2fMAVtLtIDt+UEUzqpDn
 NljyBvnX4GLfRRa+mwpo9As1Pw==
X-Received: by 2002:a17:902:f80d:b0:1b3:d6c8:7008 with SMTP id
 ix13-20020a170902f80d00b001b3d6c87008mr7058436plb.57.1692723730919; 
 Tue, 22 Aug 2023 10:02:10 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:4e3c:f4a4:b92a:b5ab])
 by smtp.gmail.com with ESMTPSA id
 27-20020a17090a031b00b00264040322desm8761121pje.40.2023.08.22.10.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 10:02:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/3] linux-user/aarch64: Add ESR signal frame record
Date: Tue, 22 Aug 2023 10:02:06 -0700
Message-Id: <20230822170209.1130173-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: nFYPKIwdSXOx

We use this ourselves in qemu for SIGSEGV handling, and the kernel
now adds one for the FPAC fault.


r~


Richard Henderson (3):
  linux-user/aarch64: Add ESR signal frame for SIGSEGV, SIGBUS
  linux-user/aarch64: Fix normal SIGILL si_code
  linux-user/aarch64: Add ESR signal frame for PACFAIL

 linux-user/aarch64/cpu_loop.c |  7 ++++-
 linux-user/aarch64/signal.c   | 54 ++++++++++++++++++++++++++++++++++-
 tests/tcg/aarch64/pauth-2.c   | 25 +++++++++++++++-
 3 files changed, 83 insertions(+), 3 deletions(-)

-- 
2.34.1

