Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp961446njb;
        Sat, 12 Oct 2024 07:08:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3djag+qS2QCIikWt6plLEZdCXeI6ZLW7PeUf1o+E2qvVBl9T42fdf1IRBPsrvtOW/Ix21F7w2hTcKYg==@linaro.org
X-Google-Smtp-Source: AGHT+IGMtBbBGA5iRICCHcX9xUxWG3POINUMBOivUquFTLdOtNK/nHwIUTL/KseUNqEYE7DtHuna
X-Received: by 2002:a05:620a:2684:b0:7b1:19f4:c6e0 with SMTP id af79cd13be357-7b121022c51mr523124485a.51.1728742090776;
        Sat, 12 Oct 2024 07:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728742090; cv=none;
        d=google.com; s=arc-20240605;
        b=dGz3AlhQP5brZd2W+Ub3SP6YvXs97TJchf1+4cIhae1nzU4B9FO5D0f7WSua5q2Fxi
         tX/qpf0S4+B/H2uRXTuLGr1xjltAdHEnxNWcnM5s53vP3A2OcEU5d6mRHigc/F4bzgxX
         XkUkp2uQeMYO+2Xr3iXmjNScMe6I+uECmxL9P+Vk46rzA80NEf0fyNJayZFwRSaIrhfm
         hDX+KJf2UZvaZRvOVBq/W8thqpNSlCLDWSn725pLtQA3iRr9O5UyC0rcc7uasfwbqaVk
         XRi0uiOwfAIaZf11x+AokFwDfecQ2a55cLp3Dqb3qdyfZYWEUPbLcOqQS0JLcNAAZ8E5
         hGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=hgIkR0DOZrDSIrMwIkDRUb0TbppctC9X9/nRHWqBGvo=;
        fh=7v2QTzyz8hwcQbnIpHirPzu84PR8N+x3uHFOEBjVWGg=;
        b=c+AMBNYOhNfgHXC++zYKeywnolU/qoM2Bwj9L+5nW8W/lQQ4gHs0kIpSTG/KOJpUuQ
         PjRPh5rdwzvw1yzlKyoMu04ehTTU1eBYwIQBy1DnDlic6YKf6A2QniJxtAmtLtkY0+1P
         O+JtxXp359moakm9MK1r1U5d6lY2I3GUP/6rQ/fLw/TOYxqblxa2J/FnENCOGsANSfwe
         bm4qKQMsBxkGvLhvb26EDz7hdRmYey8sfSvzOWkVN9oPHi3NbU5xhZWaTw8BIVTMidq/
         NLUCEbXziVj0iZj3q6H5uUqCLqPDae6MU5sbpDmbJVeC1S+cevrnkXLySLWTmetqY0KT
         M8Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ngG8crGo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1148fc349si619274985a.125.2024.10.12.07.08.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2024 07:08:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ngG8crGo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1szcmf-0004cU-QM; Sat, 12 Oct 2024 10:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1szcme-0004cB-8F; Sat, 12 Oct 2024 10:07:52 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1szcmc-0007CV-Fg; Sat, 12 Oct 2024 10:07:52 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d538fe5f2so1254986f8f.2; 
 Sat, 12 Oct 2024 07:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728742067; x=1729346867; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hgIkR0DOZrDSIrMwIkDRUb0TbppctC9X9/nRHWqBGvo=;
 b=ngG8crGoMWphN93hwsaaBRu8wY5tcLJYmUHk6s4rb/Ou6r60d5MNvLOt49MM13GAsd
 3+px3Pt+BxL5Wli1Fs1icNPkYBs89gxzUoKq4WuaLnQyDi37iKbJbsiOVHwuMQzvBuCj
 HNsBWMMBoDkNkv7sCNGysaf6QBJ7jYCZVzWUaFdNaBszGpCdqa4+YRF/6Z7fPhsbJiCg
 0Bmp7ANIt6WZS+kPHBn3Xsvj/7/qpcsj9rr6UEWY6RtcajXXbd3yW89+YAvHYv7PXKct
 5SdVxqryRp3dEvJL5fxY5xit6JosNFsmd93BLNPIyHWeyLnNQ/dDpQ2+I8LOv3VWx5du
 2wYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728742067; x=1729346867;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hgIkR0DOZrDSIrMwIkDRUb0TbppctC9X9/nRHWqBGvo=;
 b=A/3P3+v7mjJ0Ak9yCkA2iCJrLqqcLK3DjJTiGHOGI7ZHeP3h5e3JaXSQeZzH7fnwN4
 TTyd0wPAuot/S4PRYmZi9UmcF6FIhqz4kt06X29Cq14WW4iXbNSm86Mk+l5YCIP0VxVL
 YiuzMJLHMOS2Jt1yF9zPN1rOajIXM7TFftpcflWgoDyZ4i5FI1DdEuKwfKgFfOLJXLDb
 EwBSUHu3FWrcAt9nd9u3eBDTvy9X8/fgk1Lx+LyEe9fI6M5XDy5hWXmvP/pFP5ADJXSj
 LhCksaHYhvHOnMA5jbH/OGX3w6u2G3SbwIDXkTh6egLQ0qSrEWJg4oQ5rc6vBuhzevKi
 KbpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI73yA/0H1pV8XcHLtni/Xcfzp+jnMsnchKjo7YQvNDxl5n5YKF1kDzhD2AyRQzEDU2/eDx6hqDw==@nongnu.org
X-Gm-Message-State: AOJu0YxB6jlVo/um6IgFui64qFJ4ulRXVrju8ARtCRO9oq4wxR282SSs
 OyUuYeFELvrGhLTdKXbMMlSxZ3nEZItL6uz5egRTzYb23GAVsMwldqI2GQ==
X-Received: by 2002:adf:f2cc:0:b0:37d:4517:acbb with SMTP id
 ffacd0b85a97d-37d551d5265mr4285817f8f.17.1728742067052; 
 Sat, 12 Oct 2024 07:07:47 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-117-250.77.11.pool.telefonica.de.
 [77.11.117.250]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430ccf5188dsm100761985e9.24.2024.10.12.07.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Oct 2024 07:07:46 -0700 (PDT)
Date: Sat, 12 Oct 2024 14:07:43 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/4] Consolidate lan9118 phy implementations
In-Reply-To: <20241005205748.29203-1-shentey@gmail.com>
References: <20241005205748.29203-1-shentey@gmail.com>
Message-ID: <D9A7DF9D-A506-431D-82D7-23136A94EDDE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x430.google.com
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
X-TUID: 0Fw9WDHCdwXS



Am 5=2E Oktober 2024 20:57:44 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>hw/net/imx_fec and hw/net/lan9118 implement the same Ethernet PHY with si=
milar
>
>but not quite the same code=2E This series consolidates the implementatio=
ns into
>
>one to fix code duplication=2E It then continues to make the code more re=
adable by
>
>reusing some existing constants=2E
>
>
>
>Having a dedicated module for the PHY allows it to be reused in even furt=
her
>
>device models=2E
>

Ping

>
>
>Bernhard Beschow (4):
>
>  hw/net/lan9118: Extract lan9118_phy
>
>  hw/net/lan9118_phy: Reuse in imx_fec and consolidate implementations
>
>  hw/net/lan9118_phy: Reuse MII constants
>
>  hw/net/lan9118_phy: Add missing 100 mbps full duplex advertisement
>
>
>
> include/hw/net/imx_fec=2Eh     |   7 +-
>
> include/hw/net/lan9118_phy=2Eh |  31 +++++++
>
> include/hw/net/mii=2Eh         |   6 ++
>
> hw/net/imx_fec=2Ec             | 141 +++--------------------------
>
> hw/net/lan9118=2Ec             | 133 +++++----------------------
>
> hw/net/lan9118_phy=2Ec         | 168 +++++++++++++++++++++++++++++++++++=

>
> hw/net/Kconfig               |   5 ++
>
> hw/net/meson=2Ebuild           |   1 +
>
> hw/net/trace-events          |  10 ++-
>
> 9 files changed, 254 insertions(+), 248 deletions(-)
>
> create mode 100644 include/hw/net/lan9118_phy=2Eh
>
> create mode 100644 hw/net/lan9118_phy=2Ec
>
>
>
>-- >
>2=2E46=2E2
>
>
>
