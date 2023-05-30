Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2143655ejb;
        Tue, 30 May 2023 05:37:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7GcDlLlCfKAG59pGjodxjop/Pj1INNn2hDjWlCpnF3g/ymys390lnU5aT4cn8xIByH4qQw
X-Received: by 2002:a05:622a:609:b0:3f6:a741:192b with SMTP id z9-20020a05622a060900b003f6a741192bmr1699595qta.68.1685450248453;
        Tue, 30 May 2023 05:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685450248; cv=none;
        d=google.com; s=arc-20160816;
        b=UoF/4yW5hs8j34cOstGWRInsWHDsy2tUK1VtaKRIRKeWhIekpgBFVSDAySsJw1MrYv
         kdF4Icyy2U3jj6rNYqKPFJ0H5IAj/EKJQBVgt7aF/BboeuXR+SoNBjfPKzewTJWCtq4C
         5q/gsVY/7ghdf116EFfCpO5L4m2nuGd5vzBjaQqStgaoYmogK3g2v4EqwlpUyl96qjIq
         RUHP9sRtDj8jKyN4R/yuh+4JxUnokFEho8M4k2Q/NPnQIu3hJAKfFhm57j6FqCl6fcF2
         Q0MNEQnbhJy5hNMAgvsh8kscnJMMJQ6lyD4hPcHUECi5vL1uf25EK1PO5+CvXwUNCDkC
         VxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8gfnJZl27t40PnqqO7C0QIpvkiQme+YeP49/0tBZSSU=;
        b=cXq20MqoGI8MzBk0l6XO1tZ7x+DWqkNtgtKeehHY+ab706aVhluZLADzrxFEk+oh9G
         X4v5VnDXM99thifik7vbj1r8jy4VpERpCTsNIDzKwvmDm7kcqNxlCu8b6xap/qgirAIC
         tT1+2Yh0Pa27faGh7xl1WuKnSvBDHpAHev4wLdIYJqzIW2bb8BEgF3MCJ1zZ8xwLmUm+
         rdxVC8r2xJFhTmMAQr1vmqXZbp9kNK2ya9GWhO86KQizmvwZvqfjubTSajwxwF5zZhjC
         hERSloBVEMCCUO9vpNfwNvl9wcfeNHSqEop6Zo3I3r81WHH9arqEN7km7eGMEcr3k9B9
         mLwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cZFg5sCw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21-20020ac85c55000000b003f691f73ad6si6495349qtj.506.2023.05.30.05.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cZFg5sCw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3ybP-0004oY-FS; Tue, 30 May 2023 08:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3ybN-0004nf-TT
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:37:25 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3ybM-0002mG-6D
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:37:25 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f4c264f6c6so5015754e87.3
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685450241; x=1688042241;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8gfnJZl27t40PnqqO7C0QIpvkiQme+YeP49/0tBZSSU=;
 b=cZFg5sCw1ItIu9jjH48gQQVxgC1PQY34SxJOmDwUrzmjcei7InCFgDG7qcJ0goc7d+
 3yaIpGP0fSB0OBO1NQokNdqaapAqOoFN2ibBY98yuu2v2RSwT2prr4tyUeKHSA7qBOiX
 c2KjDCtpA0oOhdgWXM368ZPmeAmK7U8OA5MI+pmTXTpS6/NpiN1pVpEk9zh3lTugeSO3
 NoCdu7/aGUKaNWK4Fyc9mrUqE8TKJUo1NaLdOSUMvWY4QzVnJEpeQb3TLpALEmoLd8cs
 7cJ78P1c8SYR+RiZ2SPXEZZeBoYYuvoQGJEw9a64Mv520cMxJ/Y5J4CwKC5AtkElvM9g
 /kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685450241; x=1688042241;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8gfnJZl27t40PnqqO7C0QIpvkiQme+YeP49/0tBZSSU=;
 b=VX3cs+l0BL0NZ0RKvYi4XJEqHpyuXf8SVDQ2LvCV85sVA7kvU5cXfBYZlPnH22NiEA
 c/nTlv4JcNc1lrTtjn/6vCrnH3OvFdGY2nvS86iSiWS9+Brlsdwy5VrnFQdbR7PHGt20
 dPb8Y+ErHcAPisH5Zt1EeaC6+a9UkhUkQ3eWNpTAxmGSyNyyaCIV3Tw/wFxqbY84TLj4
 bUA36a2HZpuA+gyxSF9RP0iOyCa0SSEIRi5JrYolPu1lrDWER5kZRTlVmSYzWI6t5REE
 9aUg2Z4a5y8BhGCs7+beuGyiNXfFhh9v/RtzfX+Y/bfQtttYnQHJGNK1ReyxsYAqz2nv
 FO2A==
X-Gm-Message-State: AC+VfDzjZxQODZRubP7cc3KqrSs9tqul5hMDn2aeKzTR5oPK2HA26XIa
 y3f+/JxxOSKKNzI/aRACzj1DZRpXrkHbizy3n+yZEg==
X-Received: by 2002:ac2:454d:0:b0:4f5:d6d:3079 with SMTP id
 j13-20020ac2454d000000b004f50d6d3079mr656139lfm.11.1685450241609; Tue, 30 May
 2023 05:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 13:37:10 +0100
Message-ID: <CAFEAcA8R=m_DmgmMk9+q7u5nVqVY2EmHoEUO2ASqNW+MJB8tzw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] hw/arm/sbsa-ref: platform version 0.1
To: marcin.juszkiewicz@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ViX/OQxyQ6Lu

On Wed, 24 May 2023 at 12:33, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> About year ago support for setting platform version for sbsa-ref was
> added with "0.0" value.
>
> This patchset bumps it to "0.1" as we export basic GIC information via
> DeviceTree to the firmware. TF-A will then take it and provide to EDK2
> via Secure Monitor Call (instead of using hardcoded values).
>
> Basic documentation about platform changes added.
>
> Marcin Juszkiewicz (3):
>   hw/arm/sbsa-ref: add GIC node into DT
>   docs: sbsa: correct graphics card name
>   docs: sbsa: document platform version changes
>

I've applied the first two patches to target-arm.next;
I had some comments on the third.

thanks
-- PMM
