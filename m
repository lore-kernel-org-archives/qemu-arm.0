Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2608556njb;
        Mon, 12 May 2025 03:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGjVnStYYmsQecbWU1us5V1K7I/iVJsFn+G6M6ScZTSam8Gq9GAAKaoW26YWyX4IsRFRKlKadvIOqDAA==@linaro.org
X-Google-Smtp-Source: AGHT+IHDnQZgcsLaaj72/2pgjVKhV2ZAYyQLLceX233Rk+fbXJSIOi3sGMwt8J9KpWTLHzpZ8QKU
X-Received: by 2002:a05:620a:28cf:b0:7ca:e989:23fd with SMTP id af79cd13be357-7cd010f1360mr1546081785a.24.1747044432283;
        Mon, 12 May 2025 03:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747044432; cv=none;
        d=google.com; s=arc-20240605;
        b=gUYT5b8WprmxYMlSRVK+WTvV+6VYNkqfs+VRHgnFlkDAqIk2w1GOxlq1l4uuU85qda
         HQft3irAqO02CMLs2bb1uM25Q3rMsNttR3rz3BziMFG+YQh1IETuQDzfjuHIEkAPKgzl
         WRU1oTuBMkhmTqejdZwqw3L+Du5OQho3xsiuNCcDBt4U+BnABXSJ6vbp9HuhJoTaU5Qy
         pArdWou+RlsIQ4ykgcZBeCTOE5ErnEv7Xyfh2vX1fDfZdu+QrSF7lHOeFwRR+xLn+iBW
         AfcSfop8D6DXjZV3Cm4l5yX4r4cnvM9i/Jdf8OGLduYEg1RzVhQRx0vLxD/EPQQuRuOr
         Ijiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HczL6Nd7ZixXd5rqN6aNd6HYOrkGqiMhPCFx7BsY+A0=;
        fh=Syqchg4K5fv3yHRJnedxG7Ne36xNMUAL1n/Tsi4Sxi8=;
        b=DuDL6ulVpqvPYgk6Ynoa3zCJd1awxqbTrJp6U0brtNprfIE9nISq1KLZsz4fTMLWWu
         HUlli70ZU04ez/FFHPSnarlcniOUXDOoJKKFUiecor1JWIBgm/NwYpe4B49vhga+wF4g
         gCkDfgzjubeMARa+KJ7YxB2YBLk3BiHpZ0EypCVl1fpf1dqfTy0muib85M2uAnjYSsOh
         RLeVreRy8SQXVNPuikdSs1L8URwfHksQC+fFvLQeLEptcXLm5oTxLkefTh1j0KK9o0Jx
         vQmxeTNXhjo3A2dr38BlD2QE7S0WP1XpTmILlyR+Kb6iNfj4Io+88dBsguiZjPO+NUUC
         VSNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y/qCm9jK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fd43a9si804531085a.249.2025.05.12.03.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 03:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y/qCm9jK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEQ3Y-0000vG-Dq; Mon, 12 May 2025 06:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uEQ3P-0000u7-LL
 for qemu-arm@nongnu.org; Mon, 12 May 2025 06:06:35 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uEQ3N-0002EQ-UG
 for qemu-arm@nongnu.org; Mon, 12 May 2025 06:06:35 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e78fc91f2dfso2809732276.2
 for <qemu-arm@nongnu.org>; Mon, 12 May 2025 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747044392; x=1747649192; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HczL6Nd7ZixXd5rqN6aNd6HYOrkGqiMhPCFx7BsY+A0=;
 b=y/qCm9jK76bTvsvKO0oIB0q2kguksffE0P9EG05nMaJulfjcPNZhT49HtaUYo8ALKA
 FOhOG5VjTClA+ImEg3Hzby0XtzU4emo+yZDl9vPeP+1VR59uvYOecjcQImLHCehkiZkk
 k2H3edZbd/Xwzu5lEaRJqlMlqtC8pMNHYxaJee3rOC2/uTaz+U8sPbNWwF2z2lfEwiMj
 p1eXxSaKBAAWNZYY8g1TEtHHI9uusRjqv6bXf5v81vvVtpAjieXeA3dIUJYmda6KOTh6
 H6cjnzTrp9hHys1ryAw8XV+rbEDv4RsaeNT6W9z01YjrfXuwSSW/72lEr7duMwqyr3f2
 /cPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747044392; x=1747649192;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HczL6Nd7ZixXd5rqN6aNd6HYOrkGqiMhPCFx7BsY+A0=;
 b=JRoEMt60du7J7mWSSLXZnqwDwlXNAN7NuQ3Xa9g+6op1PRqIyuEAajSxjFsJ+jGJp1
 y9iMONBq6O50E9iid4EDGoHC0WEETYG+GuH2rkxxfJt8Uvr5UNtDyMxwv3B91aGvVdsm
 l9gzfR+C7PIGpc0RhZKbWu2Tu6kihzZK0vfZWn3YzIaquLGmeTtgQZ7XD5azFcgLniCg
 udta/TmRCSCr/JLu7b6bGgJ0YJzMEtacnI5wmIIQeJLpwviGyFb1ubJF3s9Glh2DcYxJ
 SSqOxQDsC0JyiWjkyu5VZSkc0G3Y61904lG3x/x4UDYk5M4/DvZcBJm2WD0SZyZZesY5
 Aoxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaBdfyTOuEkJFt/2ub0OItd+g4V6ADApIAv1rGfSPVMgP1GAMvhI0uwS/N2+2JfP7hZcBeULlUPA==@nongnu.org
X-Gm-Message-State: AOJu0YxEoFkOQF8M+B5rVJhOPkofw8fc/RpPV5ekpQQzuNvw4m/TKf/B
 dBXbbdR6WbJl0IYxhBlYIGS43DQeZXVtkadhvwI471dfl1Ftya5ILbTUd83rxH/GDFlrlGvq2Sx
 3EmhooztKd41FnsrS31HrwRcYatOdLq+mBnVjnw==
X-Gm-Gg: ASbGnctqGaieSnx801S0mUNY/g7YGHC2RvEg9eEhw1MMJhGUKF8me8MjrjE+FxUKb4/
 gYbGSAClO+DIlRpp8Pt1Imm506RN+/umD0qISrjhXW8jnhiq0GFU5K/21BfcLahoQyePypGHVqX
 keTe2mPcSQ7ryxZ1qEV7FakdSiMZancTuqdw==
X-Received: by 2002:a05:690c:6283:b0:708:35b1:d55b with SMTP id
 00721157ae682-70a3f9ed3dfmr156288527b3.8.1747044391908; Mon, 12 May 2025
 03:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250508072706.114278-1-thuth@redhat.com>
In-Reply-To: <20250508072706.114278-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 May 2025 11:06:20 +0100
X-Gm-Features: AX0GCFvqKcPyA_QwmnBwHh-Uc2dtrJB2eqZqP9uv-vYdt8LLdRDhIbu_mutj4MY
Message-ID: <CAFEAcA8gmFVres5yZTz6QuuioBeEFLZams=BNZR9oXUJmffoeA@mail.gmail.com>
Subject: Re: [RFC PATCH] MAINTAINERS: Add an entry for the Bananapi machine
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qianfan Zhao <qianfanguijin@163.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
X-TUID: IA6Z9yCCszyG

On Thu, 8 May 2025 at 08:27, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> This machine was still missing from the MAINTAINERS file. Since there
> is likely no active maintainer around for this machine (I didn't spot
> any contributions from Qianfan Zhao in the git log after 2023), I'm
> suggesting Peter as maintainer with status set to "Odd fixes".
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Seems reasonable; applied to target-arm.next

-- PMM
