Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp876866ejb;
        Thu, 26 Oct 2023 23:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRv2QbE/K7WhTCTF4dfpw7GIMvRzCTgpZP35ZcDD4zHQxTjc6XJKXQV0n4ynj5sCX2gSCf
X-Received: by 2002:a05:620a:288a:b0:77a:da7:23d4 with SMTP id j10-20020a05620a288a00b0077a0da723d4mr1663059qkp.42.1698386666544;
        Thu, 26 Oct 2023 23:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698386666; cv=none;
        d=google.com; s=arc-20160816;
        b=PI2H8C+6z+g/s9sOXVK8nHq3a0ZthWQCxgYk057eIRTrmYtNI5HUYxsCuNO99ZNxUW
         F5/O25jozB7OBNpm0ZSPRKBIgFvEuuyWZx2c1on2rjGtqMIzkG0F+MXpmQX/tKqklZCu
         c/Zgp5F51qn77eXpx0gf7muyJn5tqtOoiztQHkieQWTuXIbtnSiEYd1G58XFJQLwXP7f
         fXhk5Y0ylnMSsRxvrqf9u2ydYCnSF611tRPHXazcXJM9YJvp5P8lzgoPwaRUPYh0AQhA
         +BIXm2PSiAcLmhxbM+2RSHbJP4smnmNZOf7yvg/s7TE8w60VDSY9vZCVjG68OPfqK0QJ
         fVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=j37K8FxIXu/gC4Ll3V0MQsq6GE3o5InyQ6X/EJ2m94A=;
        fh=sim2U86zRlLRwV3n1fh1353Mj/dJtAIDiQYoryW9CS8=;
        b=vSDfrE1Am+Y/th4a6HfXIGIum8jj8nO3wMwgMB9IJ+/LLK4iReGyrgEMV4ktep9pOs
         ynTDzI5UGDwrvusha+iAOoWpz8Vyrxm//9hSLhWccTlotaFYViRKxvNNYgW93HVpc5Ua
         k4XjOxZl2Va99jmMc29+P6MVhTgJzCrdcHS4WLyR6Tu+d6CLnmmi6ttyKEf/GnVenbYC
         WDLmOLbtnLn4193EaDp1Nk4l+bZeXfOlqKYyTYeuxkS7Mp/R74uCs12RgrJi2KfCHajM
         j2gXxtRP2S2FaMVt1oIqP+AIM9KtOgmELLiiOQUYz2ftI8WtbHM8/4AUBWMMGEbIb4OS
         LeOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=Xx2NDsX5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05620a0c4700b007759afd289bsi396805qki.133.2023.10.26.23.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Oct 2023 23:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=Xx2NDsX5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qwFx2-0002Rw-Pe; Fri, 27 Oct 2023 02:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qwFx0-0002Rb-Mk; Fri, 27 Oct 2023 02:04:07 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qwFwy-0007RI-BG; Fri, 27 Oct 2023 02:04:06 -0400
Received: from [192.168.68.112]
 (ppp118-210-136-142.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.136.142])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A8AAD20038;
 Fri, 27 Oct 2023 14:03:55 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1698386636;
 bh=j37K8FxIXu/gC4Ll3V0MQsq6GE3o5InyQ6X/EJ2m94A=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=Xx2NDsX5k1SWeyYVoTJ7bSGMLnFjc+Fn4x5r6myB0FMW/wvwymx/Pcpica4eV9WGp
 qhH5tL52yYwl02LJ1p7QFheTklaxy3Nq/7dqFCLUkVZLSGAZZbHkMowRPTde3djXLH
 HdnWXD4Y64GfM9udjfaXcjrrziJeSQep690SGnuwFHaq2djHtzfd2zN81apYLNL+aE
 ZqG59g5UqlYCA/KjvZvc1xtmXSEW+IkMwiERI2YbNhI/IHyQ4fCjB28ZxMOWvOHsoA
 3LArFlMkDyfleXGk7igo/dhhZqztjRyGOYpW1rNJyaQ0+i67By/QAUPgRsxYSnP9qs
 bGFt6BW/mv/GQ==
Message-ID: <ba4267af6624c203322b88ac9228675c4d18eef0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] misc/led: LED state is set opposite of what is expected
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, clg@kaod.org, joel@jms.id.au, philmd@linaro.org
Date: Fri, 27 Oct 2023 16:33:54 +1030
In-Reply-To: <20231024191115.4134426-1-milesg@linux.vnet.ibm.com>
References: <20231024191115.4134426-1-milesg@linux.vnet.ibm.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 98/SXGNH2GpQ

On Tue, 2023-10-24 at 14:11 -0500, Glenn Miles wrote:
> Testing of the LED state showed that when the LED polarity was
> set to GPIO_POLARITY_ACTIVE_LOW and a low logic value was set on
> the input GPIO of the LED, the LED was being turn off when it was
> expected to be turned on.
>=20
> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
