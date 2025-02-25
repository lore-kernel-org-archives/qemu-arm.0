Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp242726njg;
        Tue, 25 Feb 2025 06:16:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV93rFsB/D165mAEX1GP9tAN/P3Ria7hd0pzEEnGQ/RSzPwGMWvS3ftxVBd3HVR7ZAr7O6ewntbt4R0ng==@linaro.org
X-Google-Smtp-Source: AGHT+IF65tyhdBBqg2hJAJO7cVF+wp+lwtyZwPqVy6rGJ168/DASPbVigPgnFqNZHxDj9tE6F//j
X-Received: by 2002:a05:6122:3c94:b0:50b:e9a5:cd7b with SMTP id 71dfb90a1353d-5223cd2c8a8mr1802466e0c.9.1740492970254;
        Tue, 25 Feb 2025 06:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740492970; cv=none;
        d=google.com; s=arc-20240605;
        b=XgaMphYvDYMzEIUosfinqenyYBIWJgDMsghFzpgxuiZ9QexPooE31oLeN8eKXl9DFZ
         JndRPCW/T3NVmZpgDZIxmn8KCY2RdxT4et8FUG4VoLDyQhObz3yV1l6QeHs8sXHsVbU2
         aANcH62zkcVlpbgqZdQOIHoXtRi7gOwei70vIC/STk0eVFPBf6ueRcOYERjxdXdtdNwJ
         CBqMAWMkG0QmElm/O/DsXsCr23MF57e0fA3+WP2of2CADDqEgb+UPY/gVVwi+0DabIs/
         7mNZGIThhCu3N2CI8IbA7SRASnlZ9ix1HOWQ4XyOdK/oxdug6M3Cyv0B+H5rMslPqujy
         KbCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Vz0ABdgSxp6SALma5ub9VzcI6UoyNasetIN7p0P5FA4=;
        fh=fKwj2+NZC3kHU5hAdl3ZYj0w79ZoTjWns7pJ6ao9ZzY=;
        b=bgrNq6yxbGpOmpigWKQwkhuDQDigLSpRwFDpUBx1ao8LAuOgmfG10/9tWYnLL6f3TD
         4oFIoamRYuiheAics4Wqh1/osnNWSUKik5BosFq4LdNzpk3hkxbgGG0bi/w2OKr7szij
         5P6Dc4CaNs6rdF0Tk2vIKkXxQ1h4LDeeN9FbTZOxb/n1Y3tLftwwSrpubuel9xs/gFuy
         sSwOj/wRmcjTbM8ezFrOOe30LdPvFfn474VwBbdCIIRO+KTbsxLdjZph65jkWSl+Ja53
         iI2fe74RN8q8GD3X7puDoEfvYR9K+oqk5lFwbr5NJTSxUz5Ztt1UVbjboIWjvpSgRdDm
         XNkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bDD0Wvdy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5223e07723fsi296805e0c.91.2025.02.25.06.16.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 06:16:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bDD0Wvdy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmviX-0007Mn-Sm; Tue, 25 Feb 2025 09:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmviS-0007Kq-JX
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 09:15:23 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmviQ-0006Wp-Kw
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 09:15:20 -0500
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e549be93d5eso6076773276.1
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 06:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740492916; x=1741097716; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vz0ABdgSxp6SALma5ub9VzcI6UoyNasetIN7p0P5FA4=;
 b=bDD0Wvdy41qF1esrU6aDHv2k/x39DeOB3ZeNxiUB4GUmBuDCfLMehyCYKeZMO1HpVh
 hPBakGtVMFMGTTKmgHacw5WbrMozZOpxGqP/ue5xhXGOxpsyFN/K6x3uUl5a5jJ76A2/
 J6pOaruzWtrs4nCvap/hy4EpbKsesglIA4nxrRYSTqKqGsNGchjg5rm+nNTeJhIL4NR1
 qyAjTltOVqlCSnkJrME+T2kPPBwn4b26EJ4G+LO2XCkx3BjNa1oJX1p/8rO5oJwiJkM6
 dvxXR7zlOvkjIHGYkkRhEReDjGm+YAeRaqc2+bJOnglndDiyWxKDj3vmHha6qN0TEI5M
 e+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740492916; x=1741097716;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vz0ABdgSxp6SALma5ub9VzcI6UoyNasetIN7p0P5FA4=;
 b=CYVHrXUY6mB6UHRANgdoRqVt6CQLbSGg+ULguwrERWIB1xSIUJwcQLVTWZxxsrIPJ+
 nc8b+MP/fJ98CAaC34vGrSSNfN0XOIADzaxYiPNPcECFqSRnFZoRz8RaNSD5zNoU9Rq4
 b8x9r4JB3VN0T3iFxRrvvhVmhpFi0+PQ4FSoPM1Yml52q9lZ6CQi75vkGLevqkXKgD1o
 0JPWPD46kpuJN10AWCWL8QqSbV4H5FuucOw5opy5aausdG0TZYqNTQ2sA99N/7oVUegs
 ZOJxtiU0primsbkDq3lRa//fax8I/pWk+A2nR2pKAU9N7q4gA725nZreJyBEmJlZBbNA
 Noqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLZm5t7OaLUeAaVNasjYC7E38Bi2NVyZqyNOIrfM/ViUDCqo/ysjKipxrBhyQkL3QKnZifHM7x/Q==@nongnu.org
X-Gm-Message-State: AOJu0YwLsdRB6FkVLDBl9qGPORD8niby7p6D2KAUljPuBrPi0W8qk4a9
 ql1rLrKSpNLV94jGfeyT7RG+izTgi6WsXPD1tK6X0fI5keKTITHpKqCbotPgQbF6JkMYFT1Y3XE
 xBim3J6iTCmcJ5mIjE43D/b9yK1WDb97tSF4BBQ==
X-Gm-Gg: ASbGncv/UtzVIKLT/2jNVPAL8C9RnpHZ/kxYiVsk6B5WfbM6eEEhIX8hQ63qbckCL8h
 jf3x0vQscJqOHnK22CKlayWfqZqS8gBXk3ugpnfFir+3W7sprNBgtF5g2akaTrQt03iCpK7Lwd0
 /wQNZB1XNo
X-Received: by 2002:a05:690c:6912:b0:6f9:88f2:b8d with SMTP id
 00721157ae682-6fd109e6973mr28813827b3.11.1740492916301; Tue, 25 Feb 2025
 06:15:16 -0800 (PST)
MIME-Version: 1.0
References: <20250223114708.1780-1-shentey@gmail.com>
 <20250223114708.1780-4-shentey@gmail.com>
In-Reply-To: <20250223114708.1780-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2025 14:15:05 +0000
X-Gm-Features: AWEUYZnSEcCA3kgccc7Jtu6vQvHIlb63F9n9zhBuYv13_m2vXiYQr_X5ozJPh3Y
Message-ID: <CAFEAcA-_z3E0wee3BNPpsxHOq29g+BKYJF7DEYBkPfPYNe5a5w@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] hw/gpio/pca955*: Move Kconfig switches next to
 implementations
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
X-TUID: +CLNN9YlR0DI

On Sun, 23 Feb 2025 at 11:47, Bernhard Beschow <shentey@gmail.com> wrote:
>
> The move of the Kconfig bits to hw/gpio is fixing a bug in 6328d8ffa6cb9d
> ("misc/pca955*: Move models under hw/gpio"), which moved the code but forgot to
> move the Kconfig sections.
>
> Fixes: 6328d8ffa6cb9d "misc/pca955*: Move models under hw/gpio"
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
