Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp412163dyc;
        Thu, 3 Jul 2025 02:33:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV88BoS/ndPTrkCnA1k1vFgrf3IOx8na9STklMK8sqXvOevOIvEyMm+/5R/+Kvh0I8RYg8iAnNRCZ/t/g==@linaro.org
X-Google-Smtp-Source: AGHT+IFEHJRajnEZ1m54V4tw/YhzWoJMrit43QrmisNdRQ5r5vT3EwoMg73MGYl+5Wa51ffMEE3G
X-Received: by 2002:a05:620a:468e:b0:7d4:61de:5cde with SMTP id af79cd13be357-7d5c474c339mr1061923685a.54.1751535205513;
        Thu, 03 Jul 2025 02:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751535205; cv=none;
        d=google.com; s=arc-20240605;
        b=Y7TQV8LltlipueckBXIjgquhJYbt4SNgMZaEa3KMgKAz5tC/kKqQ41riWsJNHkE1d+
         V2NXa2k3oJXb++KzmElwcNCJmxdgJ8SewOIoWHPILuIIWevyz0AVl2ReFHncwFjh+YpV
         yxAJpr1C8Ldn/cf/ds3bGnePS6syF7BviHEZq8oSgbnHWdf2gJOJ5SKxSEnzzmQoQpMH
         a8xnpN87YUJdliWq3KEW2SVcVGoUB3IbBDrogbwQrVFUKvF0tlB1kSiRHqYItLTtxz4H
         6GEFbW/J2sWnXKOBwwTmkIkFwFGIMxKU4U9Odw2ES5kG/Hkdq7yiyJPWdxXIbUIywb0s
         nrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=26QHZQPTntyN3BkXTjCvYecn8ebMiBue53nPN4y+JeI=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=Po2a7A3xP3yWJxEEyuNoKDR9phBvxRtZMB6vskn0C3r3AlQi738IbVQygv97BdaAfu
         YtfiwMOMZd0eGiLN3b6p1EtQJp5n0CCAHWKnzmL+85fZugrU4X5dmZne9oR321fHs3uO
         m6+mZRoy7EKX9g1S+zSFctp0YSt9oOlTtZP2OhmiLmlkOuaJ8tejrJlqnKCiAF+0pEpk
         8JMqTc/SY0pTgr2MJB08tJRyK3FWKN/v6E/TQ/IXsp2ERNbN7aducok55g1Vj1e5zB7l
         VxYIgRCZM0qe2Exk2+Zsge7FJ8gqNzrDucQLG2NNXMPNJQFff0Km0++dSZCaFIpY18JJ
         +VdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ppw/mJUx";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44322571csi1538473985a.172.2025.07.03.02.33.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ppw/mJUx";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXGJY-00073W-Ob; Thu, 03 Jul 2025 05:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGJV-00070c-Of
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 05:33:05 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGJT-00012o-Ae
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 05:33:05 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e81749142b3so6135759276.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jul 2025 02:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751535176; x=1752139976; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=26QHZQPTntyN3BkXTjCvYecn8ebMiBue53nPN4y+JeI=;
 b=Ppw/mJUxSVlFl2xLEny1vlbnNAddpyZvX3F/EFsHUykPB0N0wI4B3/hb6RmWvvNQYw
 2c6RK+SdFi+r1JejPYB3rlrFkxaba72ObrXjW23dtOfX6F74ZfPyDSAiBYCwxoPt4xwJ
 0y1TA2AWIBXMhzfHibPa8IZf0+KOdKdfxx1iJt84sLTf9IUwPaWqCX0ywdS//HsRgxH0
 XDRvPLzYNbr6IXsALCLAmr6Ra33vqDTKw/qZpqglarCt5FiwQQoYgBy5miZJef02AI6h
 OKLn7ly0zS4diBWApHLtqO27EVDPh2eigYN6BiaQxhFK3Mi2Qgghl908QGCW2dr0ghc6
 IXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751535176; x=1752139976;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=26QHZQPTntyN3BkXTjCvYecn8ebMiBue53nPN4y+JeI=;
 b=U5MavFF5Ilqh+gW/wAab25LT9q0vI6VxpguK3Vbxpw8ZhnIeenFQBEN1I1RfDKpvny
 e1d5LwoRGxOMLIEsOryV8qHJ/631X2NR6i5W5WvpPyzBogi6eZWy1tcAEDFJZ8E+uboI
 bet6I6zse/vZ7HT8psB/JVCM185FS0me3QMQIleu5ccqqNwXE2UjavcHAugHWQe0CkMV
 9C7kPNsaKyKOkho6rId3dXG+43jbiWvClsBfrASk0U8IylpJRuaWs+9uT4+foe49Ijac
 fMImpVddlUSiKJmeOIHWAleVXdSx4aIEaMpiciOtY8iVyRMoIewhOdbCSLjYGhWcGbTb
 ouuw==
X-Gm-Message-State: AOJu0YxzS1C3GyPFlcT/GKnP2ZIz9onnGcDKtXXloLHVWcCZjP/gzJnh
 s2bQW0zF0OW72IECg83ATEAdBo5L0OsQhngRu6wIFucj0RnlwcXgJgEEcBOuFLLXmpLexr9nVnA
 IWXWar+or7Te6Fv4HlulM42tpX4iyp/h0fyFJE4ygiA==
X-Gm-Gg: ASbGncvPhwO7tKuMMPk+quR/5Mv0oPDdQAfm0rKKSF5rsLEiFm5ddiKDta0pHUl1Nkq
 yHP89ITT1Ac652SyPZiuH5kBIxZ2e7QRnUES2lZ3Vp60IuicZwNY679wLxZb82bKaJC6EbQyjVJ
 7LwzR6RrUCT/ze1mttwJYxDMmRSVZtPHhDyj2DNW9oEyvn
X-Received: by 2002:a05:690c:9b0f:b0:70c:b983:f058 with SMTP id
 00721157ae682-7164d3615cemr83412397b3.14.1751535176292; Thu, 03 Jul 2025
 02:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-7-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:32:44 +0100
X-Gm-Features: Ac12FXzD_0HPfTKeXYFP4cQu59Ilfczv8cwSxXTb8KIf0gR4jCeaejDxFUBOq7w
Message-ID: <CAFEAcA_vC2-zJhbR9JuQHTJ3BHsoCfC+uUT62KgV6PTYuxsujw@mail.gmail.com>
Subject: Re: [PATCH v3 06/97] target/arm: Add zt0_excp_el to DisasContext
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: og4hx6vTnNH/

On Wed, 2 Jul 2025 at 13:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pipe the value through from SMCR_ELx through hflags and into
> the disassembly context.  Enable EZT0 in smcr_write.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
