Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp418441dyc;
        Thu, 3 Jul 2025 02:49:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwBkg94HB9kAoRxJ6aFcSpd3kaL99Igfz3dU6T6nGvfGdC5uvq8NJNpSzQBR/tEuKdqAd4Ye/T1l7HqQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGM3MVfGSqVPRPBlZOsEK8TLAtct8eKhOGdqlDz9rVTfO1kQPQe4ctov695zQ/1MlQmsrLc
X-Received: by 2002:a05:6214:2503:b0:6fa:b42b:2bd9 with SMTP id 6a1803df08f44-702bc93798bmr53744996d6.37.1751536184430;
        Thu, 03 Jul 2025 02:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751536184; cv=none;
        d=google.com; s=arc-20240605;
        b=MxpTKHUA1KGfjQrnf6BpBCkZLQ9r2G1zQ0EoTSB83ysKTpL8kdteepAkO/HKKdUd5W
         ijalgWpZx3jnfwS2J0ggMLsAR2CVJf8Nz/FSWegzFwD7XfpHeWtF5Rd1TKZlKAUtufGc
         le7OF0T77rOzYdCTNFQgmD6EZlGX/8iUsJN9QHb0yvr+q9+RXtTEcQkWA4DxO5/NVRDO
         GuV5gDlm7M3WfDfgYZDedDz11TTM+t1nNA5R9vpevKyOcJu3iXrEsNTkeF0PBt4nH+bg
         qxYxgR40/HP4DLVCQdr1hPE8tgCqjSIXl2Lbz7cf8H0WTjpg7KAd0Th/Qw4UunGULIFa
         41zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Dt3Qn5FiaR9rYN4TTmSry1xkmc95CmHF121XGvGJ00k=;
        fh=lLTZL9VuHFXP1Y6JoT+21IHfdfMFDjyL06K8Up73Sr8=;
        b=dr9JiTUcYzfqTPhEVV1MUn5R/7lYT+IEKZVpibGSBF/aTuiywKxnY0kV8NFHT46ytK
         O6a3whN11i6UQAxiARh5+23A+VNM8rOrCyY+YNNtViUPJGnJLpJ9aAfUuVlZ5KOzNKRg
         MAvbpH6VMacxKMB0JHhor9zxpff2kQpJ49w9hzgTlZ+zz+H14Su7+tGZbnFM/jMcQARZ
         lp3vsmzRkujQGONcAbHBsStTjl+0fMS+Kkm+lA+DAe1qHlKrx1XTwAi5ae+eNP015j7S
         nU37gF9uCG/sD7YFc0AdFR6uSXk1UG3ovFQeigK83sNtbGqT7oo1KfioiSsvqs/MAMcX
         3sBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W582pcw1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77354df6si167821286d6.215.2025.07.03.02.49.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:49:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W582pcw1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXGZQ-0007AU-Cw; Thu, 03 Jul 2025 05:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGZO-000793-Cq
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:49:30 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGZM-0000OU-T0
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:49:30 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-71173646662so57191697b3.2
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751536167; x=1752140967; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dt3Qn5FiaR9rYN4TTmSry1xkmc95CmHF121XGvGJ00k=;
 b=W582pcw1+JcXuAvixXDjW4CngR5KHwzkx24A3KWzP+3iOgS5I9CJz51xgNJKO06d0q
 bo2G6Kq9PL19mjWgEn0dEtsANN2ZzVwkMNbCx3XkFLS2PusKxUDtQGvGj5JIPIYdsG/8
 StSq7YHIvuXCgcw34w8r0aPYcmcm3NrUc37TUtO1yjBj5WggVycrnbVXv8u1a8C+f7Kt
 jU9W69o+8rXluP3l+E5aLhFIf+h5XNyU8F0KXyw7vLI89pkruuMseMPp1qZTweVaOeFT
 s5K/eiFdHZkeLnJUoMo+5RKT138sfZY3MklMTemuwaDBOduxfrll1FnYHMhqZBoCIBub
 MsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751536167; x=1752140967;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dt3Qn5FiaR9rYN4TTmSry1xkmc95CmHF121XGvGJ00k=;
 b=jAzWQuuf/23+dWqswy8d7gP6cdxV9WozGrM711wKgCoc6Ky4ohIqg6xD0N4iW4RZml
 TSisRTKMUj6VXMMmO7d1fZu4RsOPyraMKfCB51evryi2Phx9i2osLCxapF0Lv3f5PmZT
 jFAJdzS5WO6l1qjD6slaXbU0xHtpswP9Dts6bOdi3ly70L631zgRVGqsX3x+u/92OGbV
 +u4vD96EsGqov0YZN4j39H11dEl8KlTrMqxVRZso1UFM5F07fs5wAdtZQiKRALkNAL52
 5B9siKRvNr5f3foTw84vsR5UX8vU7BCG7zrONONQQ7zAScvhBfScHxkdMMZoQ0+Oipzo
 hDIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW45pmJyvXFC3gzNSj//zWcF6NZ+RRzIfCuZHeY9IBe7XleiqRM41zPUtjZl7YqdNLWV/mpISskig==@nongnu.org
X-Gm-Message-State: AOJu0YwQsJazC2i5HVuPkhXvoDH5sZ0OB0huZCOxydE85Mgq0/e/iBKB
 2pqZGbEbxPkB3JaewhvdB3xHRO5RaAjypi0cI3OgyLRi1+cRw8bTeLnXeXOXQ1h78wckOwbND/E
 rJ6avyqr2BndNDHuSYnBCGZJyWB2BzVSuYQpDD9zIHw==
X-Gm-Gg: ASbGncuZ9N44WV2fDGmxnWi/W6Do/LvU8HW9G+c5CAp4s5U75U+9R++oqNcV/rpxiCY
 hWJIpSTl+rvsxPAugaJI/uaRQOM3ljSjqMZcWZlyrHXXPGqIe7hAhn1N3zEH1S6h6JwODbGXjB6
 UV8dlqDSx5bWO/lTGa0cedCHMFkuHW7m/IhpigWjTRHhuk
X-Received: by 2002:a05:690c:dca:b0:711:7128:114f with SMTP id
 00721157ae682-71658ffd52cmr40373837b3.12.1751536167306; Thu, 03 Jul 2025
 02:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-33-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:49:15 +0100
X-Gm-Features: Ac12FXzG2NAu5XZbDdxeVgRZZofrBm5ozt8H8HPVqC21Hbz_-EKNCGLLlGoJeJA
Message-ID: <CAFEAcA8_hJvLDNhk=qZ8vbxH_+WjVHd6YXsQjhcfDKhonYTZDQ@mail.gmail.com>
Subject: Re: [PATCH v3 32/97] target/arm: Rename SVE SDOT and UDOT patterns
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
X-TUID: I4nOfUMsUj5O

On Wed, 2 Jul 2025 at 13:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Emphasize the 4-way nature of these dot products.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
