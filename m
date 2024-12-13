Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp530134njb;
        Fri, 13 Dec 2024 07:33:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUc0OuMEjOtSoS2zkC/RE2BLa11mFKTZ/npVjiS1/JZgFMiCbvDqstSDIPHovC8UzOEmUWDBWUTZClqLg==@linaro.org
X-Google-Smtp-Source: AGHT+IF+Nqt8566rSrqYG6i3hfB5JMae7bN6gZvGIzV4fuOCPk3RuM7c6C87NujBEEBLBo8APOEA
X-Received: by 2002:a05:620a:6005:b0:7b1:3bf5:11f8 with SMTP id af79cd13be357-7b6fbf14abamr495019285a.25.1734104021954;
        Fri, 13 Dec 2024 07:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734104021; cv=none;
        d=google.com; s=arc-20240605;
        b=IBVL60I9NsS6pUdRDePF9hj23SnhJdw6AM3TeytZy1HR3QT86m8JDvUzZWf3aUjf1+
         hFjDOFuLGmSlRwx2TEXNRgr4Wt1IHRzTNxkWg6QGoDw2s7zuM7PtfjAlptIFxQpEKL2W
         B5z255z/q4/wPz/Wjdw0p6am3if7Ss1qTCxSLaJG7tnrUJQBAv9k1lKogtnhfaKDeAtf
         69yYmalApo/8vNguQRuwAMwvBKxkj+mOk3s/K/70nJ+vcM5tUZGLFdvgcHnmR7HeP2zb
         bNLVIwyoBzEDdMpTFr4MUuGm9HvtZhE5ZYcX5KGygm+BtXsiBzH9SZEvvN2LIsyz/FhK
         i/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SgW0VK+tMWhI3wnmJtq9NRDsyYDXk+F8KoJoXxomD9s=;
        fh=6OwI4UUBGja2e/mH2hwY9ILcNF9OOicGl9ZjVPBU/bY=;
        b=ZsjVHAs4yIzfWluEb6jJjKp6nIBlWWzlR6ovCPbneg8m6/aLyVISzUO60s1iUjroo9
         LpnaTU7uvTB1YmpA1rno41FR7DqIHvrAkdQKTOwi5XHIS7+iDjgjNfaTd9qR2iT59hh0
         4PhhEIIYlAovEp8r1YSqw431QBKnWVfQg2b/P/66gUtCCWyRnhRH7KoKR6kgpaxMo+qy
         jJC8oCa1SnErcW7/TGzTjh2XPrdYw8W0zGNv37DC6SZ6xFv5YqT9ZnULayONbUredmqs
         rtkDNFPRbT601521N4GzZHEexkxFRdm6yViXt4cNOZhigYvOJEGs/T7u1FE1jidb3KdM
         I1yQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H6GXXq9z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afd756d6cbsi4181366137.656.2024.12.13.07.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 07:33:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H6GXXq9z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM7fU-000795-OS; Fri, 13 Dec 2024 10:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tM7fS-00078P-OO
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:33:26 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tM7fQ-00009Z-KC
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:33:26 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-6f0054cb797so15832727b3.0
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 07:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734104003; x=1734708803; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SgW0VK+tMWhI3wnmJtq9NRDsyYDXk+F8KoJoXxomD9s=;
 b=H6GXXq9z+IDCTQp35ELtzCWhFj04bAo4q+vttTi/N5NG2QJdDizyOO4ZfA1aKTzqJK
 WFCASKgUgYeCP9XMqdQV8XIWAOoSpZ+rkpuaM9B08ZeWIyK93Jb8dv9ectNPLNkjf0tW
 qhCfHMVP/vLn6ww3MRVTTVKLi0nkgxs6772JXPZ3QrCaGWsjH8N/UrAQAp9Qso1CrhrP
 nAvKqSxKs/VBMhuLA8VqNu3wa0ddWK7OvM1xhHEH3kS+mD3nQOglb9Zi05xXrQzmT/zR
 qnJY9WvW27CrxRLF6PMznxAUoAoWKlG+20KA9T5IcvY3/hsxIfnZWaiemo5s3JySg11l
 Mtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734104003; x=1734708803;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SgW0VK+tMWhI3wnmJtq9NRDsyYDXk+F8KoJoXxomD9s=;
 b=WHkI/Y3beIPY+ELxDXlg2pqugQXm8vbcakhrfyADo7Q8t0AyNxjE5wgcI5BxXjV0wT
 8qrCmKFd1tbDvD3SMPBU0hEYkq3QMrhrtCRijSv7mVqokjCGQ8i5WHVylD8GgbaqOXLR
 BR045jp+JYnXGHFUmrFgcnhWcrz1Cte552XTylPyS3K+dRFTOJDYJp3xI/OvZqUo1ZTp
 k6Ok+U3cEO2oKrlCmoDc+4FEuKCnFdEOCMim1rKWBy5OOUkKb4YJNbA9NP5NSxxLqW9x
 jGI0KD1bRYTnyKRylJqunhSGzRNZg719RPb90cJ/D5W38M180J8348yYPa4y9MhNsUl0
 DEwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBQTEEsyQBW13FQgmMyEK7iVYBgcPJA5WO8uXhEYrJH4DDpyIatP5l8r16NFOj4zU8iJT6AqdGrA==@nongnu.org
X-Gm-Message-State: AOJu0YzEKaK4njShB8Dxz3sdf0WihxD7KDGsFixWacG7tGxW73vTWtKS
 Iy1AD6RKULnAcEVamZ9PeRVEh6zfFXvHRdVA0989SQHDqqvPLzlbndouDM/lXQK8adgfAVdx6E3
 /9zXXfkFMGQ4eyMJoN9arCTjs0VW1FKdwtNxrjw==
X-Gm-Gg: ASbGncu7EI755TBQlJn7Ed5zvxLiyotDyQ3l7dVW3HFOcDqM8VFaY+gkvBe4V5hU928
 cAaxOqCD9Knyxxj+H1cUBoBJemvhUA2AFipv9560=
X-Received: by 2002:a05:690c:b84:b0:6ef:6d37:1844 with SMTP id
 00721157ae682-6f279adae87mr30185337b3.7.1734104002728; Fri, 13 Dec 2024
 07:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20241206031428.78634-1-richard.henderson@linaro.org>
In-Reply-To: <20241206031428.78634-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Dec 2024 15:33:11 +0000
Message-ID: <CAFEAcA94CLwdYs+FNuBONycfUGwva3urhq+bZ883oJNL2OkR0w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use float_round_to_odd in
 helper_fcvtx_f64_to_f32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
X-TUID: O4NsLDtJ7eA5

On Fri, 6 Dec 2024 at 03:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Softfloat has native support for round-to-odd.  Use it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---




Applied to target-arm.next, thanks.

-- PMM
