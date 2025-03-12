Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp551114njc;
        Wed, 12 Mar 2025 14:27:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjVfydKjPwlv4OOcqoA8Nq3xsC6IB560y3FSiCxJzLFrHf0TWXsyx7u3GsW2EVU80JozEXG/H4/eCn2A==@linaro.org
X-Google-Smtp-Source: AGHT+IG4TlHfAK/CfBIXufc8kkW7zTBv97sf/B5AaXxj3mz3/F+3ZS8XEilJw9wSsWVq5fxk2s/S
X-Received: by 2002:a05:622a:4b0a:b0:476:6a3d:de39 with SMTP id d75a77b69052e-4766a3de6demr223421751cf.36.1741814824004;
        Wed, 12 Mar 2025 14:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741814823; cv=none;
        d=google.com; s=arc-20240605;
        b=AKGwkqtBOtrU1HeKVIa5ZYGp+NngZNLiCI3xWFCRP0HVbkNYb5W2q+deSdyGZx4LOG
         sBpTpJZiSt1/nxaam9c4z9NXT6YVrHrRUjuzZKIQIz9GO8ik9tZTjgvA+/GMNpQLjPkG
         zBA+l+hiyCfuhAdaeeMWfTN5RWiVAuyzn/31nKkZPSFHBr+K6s45Dl/IcGXZNo03th1f
         aUVsTo9oYeG2H1Q8g07Zy69e5malio5iJbddOq9yoorjYlUhASLRTgvRwZHGUtogVYHT
         X7YRU50hmVo3yNcIBY4Cz5ZPkAFU1bsRptMlwaIcUkE+CgLUuy2z96lNbl4+4wDx3gfh
         qXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=IgSgz6vFBS3cgR3J274hWksqtkA8WmsNY5kKUjfioRM=;
        fh=nLSOKVK4E8Y/5yHzXrEJTooXAiP/B1Ve+mIa95FR/sc=;
        b=c4UKONkBDI9XkqdIKNKM7Qk6aeDjAgk6R3SSYEtZ4UWik5jISHzDUHwywq5G9i6paa
         PWE+vHfbocKqdK9EXq2b7HzqvvZU4srhrj9sgrRAOz+qAn8noNLKkRiJv+/OiDdKX7Kr
         xIHf8roCahi/QEwxPNHiqakMSVpJifLOXOiwjzplQHZv4xpuJXvahfqL4R8Tpwt8Kilc
         S5gUXDfxNR3JNWWb8/3zPn3JpGZhBmZdX2XoOq8Zu7NRasWCNqI6++ZWLwahhkkWyKbZ
         fERJcpzrbbA8gHs457bpP93dntwbSPKKocqAgvR9c5kZ3mZoXKyNkGH1slx96+AxvgB0
         V63Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=CjaKQvXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4766b55bca6si94208811cf.603.2025.03.12.14.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 14:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=CjaKQvXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsTau-0003Il-ML; Wed, 12 Mar 2025 17:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tsTat-0003IK-1w; Wed, 12 Mar 2025 17:26:27 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tsTar-0002if-4P; Wed, 12 Mar 2025 17:26:26 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so375739a12.1; 
 Wed, 12 Mar 2025 14:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741814782; x=1742419582; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IgSgz6vFBS3cgR3J274hWksqtkA8WmsNY5kKUjfioRM=;
 b=CjaKQvXnvEJZeSl9rOy7Q+zKbp4wwowtov6HjqCIyewzJ7fXWHyX08XTbWHtqY0av4
 Y5FpEU4X0pVnY5Un8/L+VUPVIlP49VVi3BB1MIhMkcJ87hgwPwrfa7rz3bvUSFQrBY0Q
 PUWqCYRvZXbyXk5q4tfhq4YArCPa6TqHeADkBO+Nwo+Rlq/WWCpNKAS4GSUK/vK3JMb8
 ZJJYpB6dgiJpKgw4BYTSV194YlKQccPsSxuiDX+tS5US50RxQoGG4Osqfpvlf3rdTrpV
 2ZJ/1GAH2AP+iojgAnD0ze+mhw0zyfQuiitCsDyPsCUzEUvZtCg+yFGEbbdtw5S0UzbH
 Ip4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741814782; x=1742419582;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IgSgz6vFBS3cgR3J274hWksqtkA8WmsNY5kKUjfioRM=;
 b=rpshnxiV/+zAKXhxAPM0HbnofTrSHQUM1qon7wopUdtWwDMdhwT3DKyQdydE2hn8Fc
 rkZdIrlDha/keV4sLJZUNnvuDhm0Xx1OYCCP2D3vKgozhxKt2oFREYqiSqCICTYxSQ7W
 ydjfh/uTAuP7SP3rCW2hmQ5r81gybSa4LQpevbbuqGW43NweFk6VgVws7vpSY2knW8BF
 4rPW5fDUhzeDrJ40B/YxVO1Z+k950dxLOImu3YbyhsrVdPSTKi/X2c+vfwFzewEg6q+b
 u0E1JZNU3wuwmiphG8c7rICcm9CPV0ZSM1jWZHjiiSypdz94Nu4mamsMdJFbveV3yjCp
 X5Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp1EZdaVXPwO4OwjAq42FLXjnkikOOWvp+TzI72p5Vz5OdlZByAU50nopMjl2aAsUMHBmbHoZorw==@nongnu.org
X-Gm-Message-State: AOJu0YyW0vxuYSKRv6A0P7mVJj+LPcxqzVjBujVyowKUBYcuOiYQFgNt
 JvRNnNiyKbWmiM9pxRJqqyOiQMw4ZbyMy7jmW1gGXwswrg0zw25CzUhW8g==
X-Gm-Gg: ASbGnct6W1NQ30Yj8aq0yL98/MtSFrP/D+aSffW+lJnrL569EtIx9VxM1884WJ9m4rB
 CQ7k7gW521h0IciPxh1VvpX1ix6O38C9vv8xKrNkYSZRKRCPg+kXt8JSYZiVjnC2aix+dR/F4Hn
 vmGfhaN1Lx6k7HTwitkfIVbd6rIk1BdIHHZJooUwmlW+iXtbXP+Kp4RZcwb+8JeqFFQt0wl/Vfx
 ttQIiEHMy43+TomAQF7a42xwUPUadx+cHZp0cJRMOtJ8xYq++08tmYImCHA8vbEIoTFTmUiIR1j
 WgflyOSdvZWgPL+wKlH0bW+S1z2ZxFWhuAeM/c1U6P13mmJMo53qKqrs7+dHXcVXaBEy+GlGzqf
 QEvhgMLZFjgMbTS1upCL60bEX23uAEPwfiiVGSp00tEdCdtjJ/lUxHNcd0UfUH2QVfoRI2PaQyg
 Y=
X-Received: by 2002:a05:6402:5248:b0:5e7:b081:8b2f with SMTP id
 4fb4d7f45d1cf-5e7b0819420mr6434927a12.8.1741814782036; 
 Wed, 12 Mar 2025 14:26:22 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2c4e-b100-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2c4e:b100:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c768d1d8sm10024540a12.67.2025.03.12.14.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 14:26:21 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 0/2] i.MX 8M Plus EVK Fixes
Date: Wed, 12 Mar 2025 22:26:08 +0100
Message-ID: <20250312212611.51667-1-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: KoxIExJUAgS/

As discussed in [1], this series fixes the SoC class to be not user-creatab=
le=0D
to prevent a crash, and to be derived from TYPE_SYS_BUS_DEVICE to make rese=
t=0D
work properly. It also removes an unused define.=0D
=0D
[1] https://lore.kernel.org/qemu-devel/1cdb6643-8fcc-4bd8-93fc-fcc93589c9a3=
@redhat.com/=0D
=0D
Bernhard Beschow (2):=0D
  hw/arm/fsl-imx8mp: Make SoC not user-creatable, derive from=0D
    TYPE_SYS_BUS_DEVICE=0D
  hw/arm/fsl-imx8mp: Remove unused define=0D
=0D
 include/hw/arm/fsl-imx8mp.h | 4 ++--=0D
 hw/arm/fsl-imx8mp.c         | 4 +++-=0D
 hw/arm/imx8mp-evk.c         | 2 +-=0D
 3 files changed, 6 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.48.1=0D
=0D
