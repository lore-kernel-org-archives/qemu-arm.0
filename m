Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp973598njb;
        Thu, 4 Jul 2024 20:46:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLEKDG3DDcILKQdupI229S7nNTS6lWuswwti75ARfb556lQ84hisD5tceNpVqfSShnPfvPMAYX14p7DGwI7kGmbwdjsNon
X-Google-Smtp-Source: AGHT+IFXIb7BDz/3sBf4aEOP6vbrigZinJBcmaf7nPi2gY+Ffc1zC+YsM1ef2qEaugJLSAmOKA4M
X-Received: by 2002:a05:620a:5360:b0:79d:7b02:ebbf with SMTP id af79cd13be357-79eee2e3c6dmr337076085a.70.1720151170942;
        Thu, 04 Jul 2024 20:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720151170; cv=none;
        d=google.com; s=arc-20160816;
        b=Oa38n3ItB7yUaLyMDTJUedc9qHap3w7DD57Ymwt1ZuSZBUzNiQjyimpEAPzSxzE4Jy
         V0OcC2ghRujG0R2tTO8MCgTWT5G30euQSMCFYjuFsV461TDB+tMHHdlMd8OD2JKafPQ9
         pkXtczxEuIqX4682tIgVvjU4bWgmeT6VPfcXPf77b2SxOItsS9A8aOuEXC8j6bGycWWw
         DXRad4pvgI6U0AXOvSWLOrOwspmHuMJySZrKkJks/k0HqYmdePOjNpplvg8ubJfuSssB
         kb4LXu0rx78gx3GvillqLY7BAei+Qo1poJCAkqCRgOWIqyC/POm+/lgYHk6CgMrTzBXU
         DLag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=0z28/R+1HUMxeQ/OQbP61JLM18xJpVW3NIwLgcPPClU=;
        fh=XYd3nlz1imZB8xXeQHM+01qZJ8iudtgMnw6k7asy4OQ=;
        b=fUFZl4jZ6y6dLdtYRPR5+ignyBfHiw187EN4W+LZRuKbciykyfmBWTJhNwuq5yqZzf
         nvYqa8L6mexK/ktVUV+9kK56n13HDro5Ry8TxFuvUWK3z3aqnHum4MX8cFP3k/wipKKG
         8vsH1owpOvk/s6v/kh7ZEpsO1sJBBi5a6rxXbFbAw7g3wRjOUI+awYHrarWGoGTHDa81
         LiLx9NYDrZG5W9H28uxDpHA9DypZKbJS0dUA4IVMB9+X2y6o6z30I/XrUaikMbe8ZMbc
         STnc2C1KGljwYktIZ3iGtofVXqy1KPgPwI1tzn/cOHk352HkCJMebPvdpzrM7hIVHj9J
         z6Wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=AnEEtBJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d69262b35si1616162385a.56.2024.07.04.20.46.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 20:46:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=AnEEtBJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPZtZ-0002CF-Pq; Thu, 04 Jul 2024 23:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1sPZtY-00029t-Ci; Thu, 04 Jul 2024 23:46:00 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1sPZtW-0005b5-MQ; Thu, 04 Jul 2024 23:46:00 -0400
Received: from [192.168.68.112]
 (ppp118-210-145-155.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.145.155])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4799920127;
 Fri,  5 Jul 2024 11:45:54 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1720151154;
 bh=0z28/R+1HUMxeQ/OQbP61JLM18xJpVW3NIwLgcPPClU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=AnEEtBJXOXZVBA4gw5A+5DtDWPCYgWxYY64gC12rXW3/LmaLT1optpy7N3CtDzLm+
 ruN31UFLsWtS4070mDPMaviqy7oWhcqf+kpx/m8G+ANjVro6Xahe/itteGj6f5zvG9
 GdmMGE5mD72k6VbeVg6EF40gvkFnpRs5Lwlfw4tyMQyt7iI/Gl8Ik2veikebSazhWm
 yMMTF+nDcxUXVP5r7LfH7Ir36AIn6HfXEVXssxS1ZaEy5rr0B1cnKm+1rpSkPNOSOG
 FzZ4BRbf2cwLqeg82yL3uBpnrb8M4o1KKL272gcHpkLqO3nYYTgLBiI1OK2LevhV5I
 94RX0W17LPkaw==
Message-ID: <797e5463b4159f1fad33ce6da2b22772e5fe113f.camel@codeconstruct.com.au>
Subject: Re: [PATCH 8/8] aspeed: Introduce a 'boot-emmc' machine option
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Peter
 Maydell <peter.maydell@linaro.org>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Date: Fri, 05 Jul 2024 13:15:53 +0930
In-Reply-To: <20240704053651.1100732-9-clg@redhat.com>
References: <20240704053651.1100732-1-clg@redhat.com>
 <20240704053651.1100732-9-clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
X-TUID: alMTDFjVKQW0

On Thu, 2024-07-04 at 07:36 +0200, C=C3=A9dric Le Goater wrote:
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> The default behavior of some Aspeed machines is to boot from the eMMC
> device, like the rainier-bmc. Others like ast2600-evb could also boot
> from eMMC if the HW strapping boot-from-eMMC bit was set. Add a
> property to set or unset this bit. This is useful to test boot images.
>=20
> For now, only activate this property on the ast2600-evb and rainier-bmc
> machines for which eMMC images are available or can be built.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
