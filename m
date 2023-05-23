Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1893210ejb;
        Tue, 23 May 2023 06:53:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7J79fedtZJrVpF/Yu/NiPBb8cs1YSNO14sL/Qdrk8LsBLvfxVbM3uPaIgEeSbhjTd55N18
X-Received: by 2002:a05:622a:85:b0:3f5:3659:4901 with SMTP id o5-20020a05622a008500b003f536594901mr22627861qtw.20.1684849989670;
        Tue, 23 May 2023 06:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684849989; cv=none;
        d=google.com; s=arc-20160816;
        b=ChZhcoeJEim4lG72xAWBDr2oBN+uIrMxAVNLTDbVlTDo0COBkWExhsmvDGQd5VeNJQ
         XYQhhbpX3+5TSzaJueSbkJdWxaikpUdSyDlaDGDGDv9cT+U8FGvmFTDWcV9ubG+92eh1
         4RHysJtOG8CDS8c+HhwJ7J+1J6T8eTJBHOf+T/U7UV6ASEPZ8TV07Y5b2nVdfKgU4PVM
         K+3jPZPQIg7LWwa3RuHQQuSYGtIhJB3Q52nC/DfSCbyR5w+uy81s9x4ssRbQjl7BHpZQ
         FBA7Qg1xJ5moZzkt4RcxHT/ZNpeIP8OwV34rAHGqbftcI3MH8lXcveeR6HzQXzL0qCl5
         1DUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=seuBDgT9aF3afRV8J7nFDrWYb03Aj0cUgIJWViRMfsE=;
        b=YakgBZS+ua4tsu3+OvBlzCGGjIlDlFUfbJDL3Z/Ndp0htZspvtczIaj8eJ2Fqo5Nqw
         +K21r5gdbcuTrhFfvz/EcGnfbXrczGtNo7lda0tCYiLOzFGg9LjFAvyrSMdc3huHcV2p
         mDq69vBCIQ+wVszoC+n+d1TW0fQOtS57v8P8HBc7o+z7OPYRm8z2k/mqZbTvzEzHADqo
         JBTKNov8hH9ZFe/wFXAmbIhx9bgBGhWl0ROxmjRVLT0ZJ9d4b5XrprKKbdpl1WtVjXCN
         osrS2a3xfFrtZpxhHtrSCAfLyoTslLLkw/d8AIsgxUIBp0R8f5yn/EKINy9qRAXt9G2W
         kOQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qHPK1/n4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10-20020ac85bca000000b003ef3fb25ed7si5315421qtb.172.2023.05.23.06.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 06:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qHPK1/n4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1SPT-0000Xu-7x; Tue, 23 May 2023 09:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q1SPQ-0000Qw-MM
 for qemu-arm@nongnu.org; Tue, 23 May 2023 09:50:42 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q1SPP-00022O-4o
 for qemu-arm@nongnu.org; Tue, 23 May 2023 09:50:40 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-96f50e26b8bso1003826866b.2
 for <qemu-arm@nongnu.org>; Tue, 23 May 2023 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684849837; x=1687441837;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=seuBDgT9aF3afRV8J7nFDrWYb03Aj0cUgIJWViRMfsE=;
 b=qHPK1/n4lZCOh5w5zb38bjb2SIHP5Jt4xh19NAW9RK0HcB69vXlOygCatqSrgNFkJ9
 mWWjRk2Nxax0iBxNiVbYLyzXwKy/C6RKOGUZZetDHehdjW0xvvWDqe4/01jXbEKtmUkk
 3kNgO8kuXG400MfksNG2tF4hqQxaTUl8gJjcjhOKcxWCcAtTaBqXWh+aL7zarBj3Pt5S
 NBQQSTdgU5dtUkFnCsFvvZqc0YoXvSHnU6DzhHsQsA7Sg2K/Ls+1TzLv2JKzfsKd82Qr
 QTVN3FmvTB4Vu/e5w3Xtxzlwqs2ENF8WQAJX/rPbM3MjU36R5jFpqPUZbt0gFqV4SWBV
 o8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684849837; x=1687441837;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=seuBDgT9aF3afRV8J7nFDrWYb03Aj0cUgIJWViRMfsE=;
 b=WjC0dOr2a6Jgwz/fPEMkQo+L3aaMhuwJUDLwlT8w34KjFamYutetkBx/XM7mgeGqRY
 8JECfbm18zSKdvZnD+giquy2s5Xk4wUOv6l4c/RYwt4RqSi2EmQGwUM3YZ75Iv5VLVCO
 CXHAVB1lfSOWA6/uVwTjjNbGaANwdZitDiIEBMv7cyc31zDn/xc6bmmlxtqqKUKwxrP1
 hwZ0JelaoT+ftOEsMAwEehrUlsrYLjFLUjOCRnYYewTVhv0/sziE5PkjDp5rBkrfg0Nv
 RjXxUPpw5Af6lHxtoM3EAhIuLo+GbL/zTJoahTxnXxzetsxMZHs0vFrVrdS0hngpn/G1
 lY1Q==
X-Gm-Message-State: AC+VfDzW8exxa3W0d4IMvLcnCyP4vRoInSffqptSYTbHtxIjBsxyWKpK
 dUrqPRpLwgTV/7JUZf+KMdB2T+WODLV6K+nS6v6fPw==
X-Received: by 2002:a17:907:26ca:b0:969:bac4:8e22 with SMTP id
 bp10-20020a17090726ca00b00969bac48e22mr12548923ejc.26.1684849837343; Tue, 23
 May 2023 06:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230517105303.453161-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230517105303.453161-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 May 2023 14:50:26 +0100
Message-ID: <CAFEAcA9GamGybSzd8FKBtmZ2qMgjRFy6D=Vhu1y0dL8m9Sa80w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/sbsa-ref: add GIC node into DT
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Phhg+ueKS/uq

On Wed, 17 May 2023 at 11:53, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Let add GIC information into DeviceTree as part of SBSA-REF versioning.
>
> Trusted Firmware will read it and provide to next firmware level.
>
> Bumps platform version to 0.1 one so we can check is node is present.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Are we documenting anywhere what the format/requirements/versions
of this board-to-firmware interface are ?

thanks
-- PMM
