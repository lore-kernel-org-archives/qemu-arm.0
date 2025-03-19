Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp429535njc;
        Wed, 19 Mar 2025 11:07:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpVvGUXFoF7pv32/IfZck3h9fKsDtQYdgUchI8D2Sv1Vfw4rDqwF+Wx2EkyHgX7npBfwvGSlQzG7yxog==@linaro.org
X-Google-Smtp-Source: AGHT+IGETZWPwgBJ1sdv65N2FK2OeOgZQi93aZRU5QNiCcNpWYB7yqByOoiOCW3/QDC8Ih5AHi0V
X-Received: by 2002:a05:620a:4095:b0:7c5:5794:3e66 with SMTP id af79cd13be357-7c5a83d2986mr503254685a.31.1742407622348;
        Wed, 19 Mar 2025 11:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742407622; cv=none;
        d=google.com; s=arc-20240605;
        b=hcPJxDZdCT5WL50VVKZPZ/44M3YUnT2tphY1LwS3EPWhF4eOvo3y9NoXlnS+6X6aOf
         Xp67/I5cTPf1moYaxiBZjo50t+ButFl4uYOAQllEWzzb+BV7jDYDsEAPqARus4+OTn9M
         WsnBFmsLHCWNx8XfGR2ddAG1YlVbjHMg2H+dL6lilP0wPwH8+tN0P4MeKCH0mClLaVjK
         jaWR+Qdrd2CdSR/L/BO/jblwuCZtPYlxeO/AxKMfW3QG6QzqDM293iP19zq7aU2/98jX
         PY+PbxmCIEeOTS/67EePpSTozUuK5YW7jZ8QF0uurtC1aQrN+NUmQuNANchAXlcCNisg
         orgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xmtBwKm4Szm1gHVy8RrQRWt4HCE0PgIASJVO5lH2kdE=;
        fh=mbYoY/zbxdcOePc/3+e9EEGLViEQeU0NKE1W6T7B2xE=;
        b=No+00AazslcFatlluQUQSyO+Eey40R1GplqTMQrwhlrfnzSoRTESud3/2TI15MoqGT
         c090qMWI8SlPwQtyc6EMiFedkdwSLZcKSUnAVm1afge5YYrXAFGbtEAoOR9DJzvfSiLI
         PpLLB9/zV0SWgf/QRJeDE4+INXbF7sOwKE2LXYtldFbQSd0bLT62bFUt7lPwoxHQ1lzE
         U0IHcqj3TwWVFsrlPgjuwrB61z26JY7lcHxRtAMgUn2woliMGBwXHYES9MzbHNA3/XbP
         4Miib7SPHumzRF6Ek+HyIDhChu0EoUfc9vo4tIs5ZW+EJf5/SduCDNBfeHh7XazhF/rX
         Ycmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IeLz/Jco";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573b9793esi1486005385a.144.2025.03.19.11.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 11:07:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IeLz/Jco";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuxoH-0003k0-7h; Wed, 19 Mar 2025 14:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuxoD-0003io-U9
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 14:06:30 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuxoC-0000I8-7m
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 14:06:29 -0400
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e63c3a53a4cso5967631276.2
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742407585; x=1743012385; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xmtBwKm4Szm1gHVy8RrQRWt4HCE0PgIASJVO5lH2kdE=;
 b=IeLz/Jcobeh/9KqfC0tYI5hujmWxUXjyb42CTfnff0d2pX7cQfP4Y+loiD9BHbbcvF
 J6xvb9BEF+rJovySwvZmWsBwuyN59w6VN7H24dlgGBkQW1f/TTM/LPgvCa1YN347pSF3
 cOotfs2m7WFrwbVHUdMNRvU/4i7OFm0kdhpL3nmCpfZ9bpNvoWXJUNnUho/vEExgge2e
 DZC8qY2zzeOMji7oMXpJ20OFB/RLyAd3kiqVmgy+lX65xtIEIzOxa88zrmCkezKHAAJY
 LkAbnUd8eI9eWcoyiTLOGqLBZjPjEO/Qio1B/dFwxZXMxT3KzYFDLASNggk2m/DQkBg8
 89hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742407585; x=1743012385;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xmtBwKm4Szm1gHVy8RrQRWt4HCE0PgIASJVO5lH2kdE=;
 b=XBoIQpVL7KF2ZfcWTZ3YIqAixRNAR/+AMS9IvzBEQVdGpJ9506YX0NFBdX+UhxZz6L
 4jJq770gbXK2CnLLnxkuexgXpuqAQ8SAumjMAmISArj3kvfAO2f/eCGUWU4oCjkbvM64
 ZZl55Dkpe1f3E6s4ZIU59Yg3XnDlKCjZNafpXUBmVepAOrUjDZqzhfvbhqTvWuIb8oU7
 tSxcQPE48NXuW55f+xUb8Z1s2NLkgc1HaY1jc2iwbwy5bFYjX7eAdFOuHORNP/+l51Hr
 65nzeIotdZdqy+oEkRhxaDMb6B4Q/zzPahtSLnsAbfmIk8lSvjV8YTvxxu+KDa9fpy1C
 2Aew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLqF1P0RZuLUtcg4pprpfGqt1n1Jh5omYoQvLA7qu6LPRhnRatG7eFcBdIqfpp1uz+EbTNxdynqA==@nongnu.org
X-Gm-Message-State: AOJu0YyPVd71SoILvkPkm7sNcxSfxOwUxUzC0bajk0SRD6DnsOBoGWKy
 pbSgnEVk7J9fSbftplA2e+zg41Rmlp+/DA7PMOZE0J9sNxYRw1YeU4mP77/sD8DU61a3ze6NDYf
 xfB817N2991gSOLj1YR630sw9cGB/ahxqbEMlkA==
X-Gm-Gg: ASbGncvLpTfmgxYd54dqY8CezBeu0SdmQu766UQJFUf9CU8MhGs76GjKLHW5bljL19G
 Wppj7kNrpFajdIw7jpw6GvKPgbh8cyP1YjF6TwdGDqEYRbEEG7YHFWG9zTcog5i9y2Q4+O7zCUt
 GoKsDhnAs11fzevd/UNs5pmh8rPHI=
X-Received: by 2002:a05:6902:1883:b0:e5d:c7ab:5e0e with SMTP id
 3f1490d57ef6-e667b3aa230mr4672209276.3.1742407585714; Wed, 19 Mar 2025
 11:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250318205709.28862-1-shentey@gmail.com>
 <20250318205709.28862-2-shentey@gmail.com>
In-Reply-To: <20250318205709.28862-2-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Mar 2025 18:06:14 +0000
X-Gm-Features: AQ5f1Joz43oLlyq-P2oXE_vh0qhjBfYXjZgo-xTddWbBGimZkBXyuwZJYvviD7U
Message-ID: <CAFEAcA8VRjD9bP+GOkCoVkFveTnuVbtfmk25rUHvQSec_ypjjw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/arm/imx8mp-evk: Fix reference count of SoC
 object
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
X-TUID: 56JQt64hYU/m

On Tue, 18 Mar 2025 at 20:57, Bernhard Beschow <shentey@gmail.com> wrote:
>
> TYPE_FSL_IMX8MP is created using object_new(), so must be realized with
> qdev_realize_and_unref() to keep the reference counting intact.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
