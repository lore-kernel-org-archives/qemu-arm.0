Received: by 10.28.71.27 with SMTP id u27csp1897214wma;
        Sun, 21 Jan 2018 08:49:56 -0800 (PST)
X-Google-Smtp-Source: AH8x227cs6afHI0Cj+PNXjcX4UKbx7WTm5cEYzENZFAoFNwkxWggO5BNwWDrz2C1anxp6tiWkwje
X-Received: by 10.129.56.5 with SMTP id f5mr4900143ywa.80.1516553396015;
        Sun, 21 Jan 2018 08:49:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516553396; cv=none;
        d=google.com; s=arc-20160816;
        b=Tvqq+fQsKxhhLwYL20Z7/xfVfI7HLf86uCTmtrLfBlWP/L+nUA2O7kg90dUrrM3dgb
         qisPXQ14QCNiODTuIiQCDtzAAArvANHKOS/ItVPoVTkCnNjSrItPtdCyLcmKDzbrZZqp
         ck1QvIhZNdZ3kCfZJ4odzVye6iOoYOztqivRUiqMGxXWv1uUh8MrvTMihaz7zsNm+i2s
         r3K/K5c0l+L5I8EcFmwfO33GRZuZ9Fcbevi8KVeH2XRQZaYFXIyTB5tEOlhV9/gwr/wU
         pq9WfxGpCUBF6S+cNhYhz9kyqE/vDMe1SuhFyG2lKLXn4HihGYpnhdXouXAPMPkak4nM
         J4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:arc-authentication-results;
        bh=Iauq2mqt+whQw9R1j52sjJVqCFAhGQLHDpXRhLvfFU0=;
        b=f7Qsf6CxqX4V0cD794tIGNP+MBV2TkrTL3jBf/dsqo1bT8C8ghscDi86kxJcaTBjOp
         48Xi1fZiPrenVl7jtHeAGddomwQmSOs8Wk8Ar5LyGclq7u13cHF6SzJPL66xHL0fLkgg
         Ku31PaVxjAasfEIJ+6qGVFyXzc9hPFso648xT3W2g4HM8Fbq58gqfFIy/FW4sZaX31CA
         vV6wBiHFVt+5E39KBWBztmmoKUkFIQsdFsFSDzEduaX8+/bTam0OaK7rf/3HRatLKKE4
         sSwXGUa8KEtRgS75DdNzv3rrNYsYBbn56xREITereR+h0hYyovErHt978Qdmg+KKGoVj
         nuZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f73si3197357ywb.323.2018.01.21.08.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Jan 2018 08:49:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edIod-0007e9-GR
	for alex.bennee@linaro.org; Sun, 21 Jan 2018 11:49:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1edIoR-0007cy-4W
	for qemu-arm@nongnu.org; Sun, 21 Jan 2018 11:49:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1edIoQ-00057L-FY
	for qemu-arm@nongnu.org; Sun, 21 Jan 2018 11:49:43 -0500
Received: from mail-wm0-f68.google.com ([74.125.82.68]:40255)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1edIoK-000554-Ae; Sun, 21 Jan 2018 11:49:36 -0500
Received: by mail-wm0-f68.google.com with SMTP id v123so12344970wmd.5;
	Sun, 21 Jan 2018 08:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Iauq2mqt+whQw9R1j52sjJVqCFAhGQLHDpXRhLvfFU0=;
	b=tJwzmJRCboZCrNiyTfbKqVC3h6ETNtb3Hywwf6bFbsQo9C9h0f1Tk1TiZaF+r6pkB6
	zGi2E82HBb1kJ9D7haL7VaytH1ZuONnKbvEjU9iylSb7EpntbSVwCUpMPIBkp1rHN/Rf
	16846caqlgm+aQHIdpsGUE2I3963PAEqlMgAk94RZ4SAgRomtVUFEvM5fLKyph70Xx+e
	RfiXm/41yf89TNMTCviO0CnUxXPh9UO/k0+kQ7fvgj7lrJ92DojN944KjQ8d+IyY9rED
	4mBuvPGDI3P5dXehg/KHiQmN7nsaiFp3jOAKviuWeoCBWImqHV/ktdiZ1rUj+UMopmr1
	Conw==
X-Gm-Message-State: AKwxytdh5V5MqLBTT2S/9vccDJZ55k5MQVyLk7i0D32TRG7wF6wIYnwR
	cuzCF918JSpVprj08655Wzk=
X-Received: by 10.80.220.141 with SMTP id r13mr9262422edk.120.1516553372896;
	Sun, 21 Jan 2018 08:49:32 -0800 (PST)
Received: from kozik-lap ([178.38.148.193])
	by smtp.googlemail.com with ESMTPSA id
	k12sm9652831edl.86.2018.01.21.08.49.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 21 Jan 2018 08:49:32 -0800 (PST)
Date: Sun, 21 Jan 2018 17:49:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-ID: <20180121164929.mq3jenhseu7ylj4y@kozik-lap>
References: <20180118182510.15630-1-f4bug@amsat.org>
	<20180118183108.16009-16-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20180118183108.16009-16-f4bug@amsat.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.68
Subject: Re: [Qemu-arm] [PATCH v8 16/17] hw/arm/exynos4210: implement SDHCI
 Spec v2
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Kevin O'Connor <kevin@koconnor.net>, Stefan Hajnoczi <stefanha@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G1YyHzJu2Hsa

On Thu, Jan 18, 2018 at 03:31:07PM -0300, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Acked-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> Krzysztof kindly checked those values with Manaul, the Samsung datasheet =
:)
>=20
>  hw/arm/exynos4210.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>=20

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

