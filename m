Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp299725njb;
        Tue, 4 Feb 2025 07:49:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVKNxeD+DR/EJXpeMgNGaJ7zF+YgqlT8aHJ5hkMdDAmTx00UPvaFQ1iriMS7/3ck3/fSwNqAok3a/vWrg==@linaro.org
X-Google-Smtp-Source: AGHT+IFMNMJBcevpvyDl+9YR+efL4WcEacgX55oQVvbfeoxyrm3ZNSDPFhS3EJO/iECEW2HIXD/i
X-Received: by 2002:a05:622a:7402:b0:46f:d693:1a81 with SMTP id d75a77b69052e-46fd69320b5mr278685281cf.38.1738684190165;
        Tue, 04 Feb 2025 07:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738684190; cv=none;
        d=google.com; s=arc-20240605;
        b=SNJ/RPAEMdKOSSn408d+0h1Il5wf+6zPrWvYoPPcRJkIo0CrtAwwz83+WVQal5iZ7E
         ZPVw3uKHMgHrmANPQYowpn8nGEMb9x97sEV6zWoDNlN0n/yJlW667s5rA3ArIYso4n04
         rJJMKN1iUGTBmpnSafZh6w0snO+HdYg8kT1KI3PR/GZ4i+bN1isdcRXrJnvFiuKRaD5u
         6JfRznVQg9g+hqj2RvDTNVVr2N6iiu85lEAAMbEDC98WBRCYbxOzOfoNMsxvpCjGJWKK
         inX5gF5wn9FjE+UQEmAZCCtWRLl8lRB2bkX9pcb5rb+fSKJg65v26MHK8C5qpwkI02Hv
         xjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Gx6h/sKWlMPC8H6OLa3HGlBIfvFzU25N9x7MCpmX5l0=;
        fh=v8sq2hfXVUCGq+4C8Ng3qsm3w1vZp9y/0ZccxsLtJ/8=;
        b=HxGXHbRodpr4G1LGCKL85Aki9i5cU6KoC8uIwgxK50Fkub95I0vzXOoMo9npvziYfQ
         fNS12t2vpdrIYHA+2wWSNimAM96tfxFF6dJxX/f6f09/KyUvGPl5ycTwoHOAoLxwe8N4
         xJhd27MpmPk612QaFEZauulLeWKpcIH0zPtpuZnydoKf9G5zOZhaafcbfhj1qNsKaXx3
         yfV+D3UePldEiJwqNwivM9ip322af6+aW54RxPa2ca5TztLc2uoHm2Wsg9rUymbN+XIi
         R9xD63822Z42kEeAWa+N0xnqpiiZZShCuzdY4mTOMtowiSNKucVA+3yJ6AXS55/Ued+7
         whCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v5L759Cm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bbd964si27290481cf.462.2025.02.04.07.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 07:49:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v5L759Cm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfLB5-0005e9-Dj; Tue, 04 Feb 2025 10:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLB4-0005a9-53
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 10:49:30 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLB2-0008EW-Nd
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 10:49:29 -0500
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so5778926276.1
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 07:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738684167; x=1739288967; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gx6h/sKWlMPC8H6OLa3HGlBIfvFzU25N9x7MCpmX5l0=;
 b=v5L759CmzobfZDNmGudYEuZ43xBu95hJXLhrjmwfxcRpojAPFdRlft8/h3rSPG7MfP
 uliJq6BgAOXzJGlsnhuFW56UElLojXXpJVAQNh0J+HPMMxZVYN+JUV7ENCSnhgfg9PoF
 tc2tncA0kwuR4bo9QZRPjWk5vaJfNkjLDLyP/RFZx8uHuqqubA06m5Gzaxi19Y5fEATy
 oLg6A6ylcSw7QBOBDiNBiNhhTZ4yqFVl1eKl1b8HF8/g8Og9XdmKQLWRo2GnmjcBQXSB
 qzysI8W7gm7XJHcZfzn9O+doqEuKKotMiFAoRfi7k0fP7Y/mrVyjQ4+9ariTlDFAcaNm
 gvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738684167; x=1739288967;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gx6h/sKWlMPC8H6OLa3HGlBIfvFzU25N9x7MCpmX5l0=;
 b=m4O8wKfIvxvi+cZ55utoPfjxtjEXHrPlfjNokYFrxbgiOxVZ4OOKeDSZXLeSFTJIkQ
 Rmx7D/scClOdt8NBuiAfB0KuaOfTfaF4bxe51RkZNrqNM/2uHoHzVlYLbBCR5nDRjUZw
 F2Y9H5XtFgtkZ9I+37N33ReCVvtfwnUztaegS0P1egcZUn9H/XNZMkm24gcPzZf2HjCh
 UrtEnAtwRiRW6vQvI+yawOWYaHbHP/jcvDwjBBds49m8X5XcKPdpopsG5OspwBcCVKWV
 XRrYTJ3J6C8ASN8ipiyJLPVAaneLHfVid4N2U1s5wZmY1ru56q5WCnDyDpg+J79DgcJ6
 2CYw==
X-Gm-Message-State: AOJu0YyUmrI7EHuJdK5aqIFKU9T1v5NOck/ymJ/8dsx2ThxDdPd49D6y
 Kqx1DaL782r9V4JDoPcTEQ0srsnUayPWBTABJOpCu86wzOVlKEHm+fL3wBvS9mfhDCXQiWwEXIh
 D3mxtkgHBLmvndY56DNWHyH3A84fbUMql+ffCFQ==
X-Gm-Gg: ASbGncukiZmJIjg3IqtmVAZE9mNunPL+X38J+SoUPsSo2N+z5IoNclTGngHtHOWYU76
 SBKB0TEymAzNJKQ2EDWq1s/YeLhc+eBwR8agTKSvN91xpw5f1JI05w9x9oYSveETgMWR43hzCGA
 ==
X-Received: by 2002:a05:6902:260d:b0:e5b:12f7:cdb1 with SMTP id
 3f1490d57ef6-e5b12f7cfe0mr3789121276.34.1738684167193; Tue, 04 Feb 2025
 07:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
 <20241226082800.2887689-9-wuhaotsh@google.com>
In-Reply-To: <20241226082800.2887689-9-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 15:49:16 +0000
X-Gm-Features: AWEUYZmL5M92dUsBRhXl5g0IjyjiLhFUK0vBG-J9ehpVqZTt2qpIOOGPJMSc1pk
Message-ID: <CAFEAcA8Z=kTymMs1YPFUvqgr4sgNg0R2nOfKzyM28YUFikqT6A@mail.gmail.com>
Subject: Re: [PATCH v2 08/17] hw/misc: Add support for NPCM8XX GCR
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
X-TUID: vdTrqF5NSLtg

On Thu, 26 Dec 2024 at 08:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/misc/npcm_gcr.c         | 131 ++++++++++++++++++++++++++++++++++++-
>  include/hw/misc/npcm_gcr.h |   6 +-
>  2 files changed, 134 insertions(+), 3 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
