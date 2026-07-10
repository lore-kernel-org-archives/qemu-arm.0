Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EB9C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 16:05:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiDjL-00017L-H8; Fri, 10 Jul 2026 12:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wiDjJ-00016m-Jc
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 12:05:33 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wiDjH-0005CP-Ak
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 12:05:33 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-66766d649fdso1598535d50.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 09:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783699530; cv=none;
 d=google.com; s=arc-20260327;
 b=SFBPC6Vyn1TrQvVegOYxYsmZ2ajHKcr5gF778+CskLnG6CDvuKW+c3deK8qJXP9RXl
 MXI7gA8Co9YxupvQps3THxdjUlY6WhDD9UA1OSZiOn0LkfoeUi3ZqUMHD5n1wjBfyqx+
 GyCmbkbmAmMYconlkuaXtrpaMYT1B4EwIC1B1ozZ/fL1FcPADh/RO56mPsDBHgAXhtRn
 ctZne5CgWc1A6lrvmneSAnp4KRgEwpSBFBHcGIZs9bK3KooeSR/zOxigluKJuVnKjRw2
 RcEk78Ad0RhbwxWDHfO6AqunEUtiUY9yC+XPXlnF4kixhutCF4tNwFyCuaNIrKOVSEyA
 Zneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=JjRqBV6GD0nzOQPZYnLK57qn2ikPRZS3euqQT4WBNHM=;
 fh=LENLphO4/ZXCLmcfvHFMeP2NubVcYmecptAVcBMRDc0=;
 b=VKPKp9FCiN6hpZtMo+avKdf5RJbsX/OUwvnCxhL4oUCE/GbRHZM/KmkLjZI3CY6Dvr
 lySlzQWt3LF6N9sIQj/kL4hQIZgedUR64G84dZDIoSiGGoTm+L8PwJn9KRI2Xfi9k3AF
 HbtiWWDDvPnbeT1xi9x8wOR6DxyjVw0sCMfbHhmb63tSK1PvRhLMDqM4s1py+sj+d6YH
 UhIivXURCghQopCay4zl3m+p8sGxE0CHTSeYDLMAqPD8+FjDOgF15Bt1HIFp2CIALYdB
 gETmiszWKnSxAJJS37Gvrys3oTqgPkNTYzUeeiMpaQq9zSheACYXSw1CRrDUrC24f1cg
 TAjw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783699530; x=1784304330; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=JjRqBV6GD0nzOQPZYnLK57qn2ikPRZS3euqQT4WBNHM=;
 b=OkvIzRKw3KdDS/d17aG9T/oFVnad+1KgM/8Rvm0xFBFcWg0tr0s1AEKyd7vwdEyjDQ
 hImCCwelNN6j44gyoNn0wwyXPxNHb8HIrqNN3VTbVR+ojXteO30iZuKOK2xuVdEPwBwo
 8V/CAJI/N02qI3P5Bnkf/S7Won3IlE4LoWpERXXF8THtXJySY3ksoAidmWx5gZ+SQ6T5
 fMzY12jYc6uQDe356jDdVHYKxGQ4NeWy8C6KRLZZYMldMdf2JwTdRCTHYhMgK4yMs1rs
 VAUzBwg6K/jhV7Wq1OCqsfT8BtjjPGdRHTs8hQPyYbaeqbEf/rEzA0NbZP8wJTIJ5jcj
 fS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783699530; x=1784304330;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=JjRqBV6GD0nzOQPZYnLK57qn2ikPRZS3euqQT4WBNHM=;
 b=bLC0horhszm4KHdZpePooiWARlfIMscOeSzfDr2t2XApY0LtnjeQARN6jhYsf1LpZc
 aZ6GE0g+c5JLVGF90lw7qM6YaZW3oywhqz8bYkeZHhjYRa56VtNN1i7yEg/Qf+U1mjrK
 47WI5Q31hB7TpjwNDkE1hOwQKv6l91eHbJwqOVZ+coZLy+o4de7R+hiDibkU9Rikr84X
 5vjVlA8rgDN2mHfBvg53g0luQdkTXzbkbb07R5fBNKb46Sw2oDio/w9v65L2vooB5qty
 7AlUf4TfuH7ZXCgJaW1dpKkAvbW9JlTJAI7VIhABu+QV5N42W8yiWPUAeFBvXSRowNsh
 D51w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpnpy+5P12AnJJITt055ykzPpYzFw2TZH13HOFIdyJWFieTq2yz1IrZ1/fSAaP+Ov65j8ePkbjPMQ==@nongnu.org
X-Gm-Message-State: AOJu0YwpGkaFWYsp2h4UwYy9d2Ps/g4sC07K6dbHuIzrBl8Z8LZITIVy
 sScL0gR15VXlf0iJkST3rPo+UDg2CwBVgAK4j/0up9CUN60vFf4oeDh+pD1EgKt1C+Ib5IIEyhB
 zkdWuTY0Yuip+rjPAu4qsFCGd5jr+eqOHkJamyHPOoQ==
X-Gm-Gg: AfdE7cnoJHEzQ4qECoug0XWF7jZaUPEd+cN452GBmbRporWuGcGY/bB0JFb0dDLDVeH
 liJQFXcF+KZoTKa7HK5dBGklQPdwuob5d6u2iNownv4cLwCax7l9HhoEin+CyX/VeD2Rt15zB/E
 hnGgRQbyyZAEi6++GZ+Oil8SX2jZTbn6wcqPS26ccvaogaN+WeGsw/Kfivdtp4xg9KAY0nEn6Q8
 39ASAVfA9QR8zVr8wu01Gr51ryEU2lyBnfGMCE/WSf2GDHTD7tG4MlLqI139zu8OkA0d62+Vwyb
 bOlToaazoNoAh9zaIqh/BHbK6D3by+bH/lzMGB9hoPvO1zwNCgPVu/pj
X-Received: by 2002:a05:690e:bc6:b0:667:9fe4:8d7c with SMTP id
 956f58d0204a3-6679fe494d1mr8274537d50.90.1783699529167; Fri, 10 Jul 2026
 09:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-i2c-adc128d818-anacapa-v5-0-fe8292d86b38@free.fr>
 <20260701-i2c-adc128d818-anacapa-v5-6-fe8292d86b38@free.fr>
In-Reply-To: <20260701-i2c-adc128d818-anacapa-v5-6-fe8292d86b38@free.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2026 17:05:16 +0100
X-Gm-Features: AVVi8Cdip2x3LDXCNl1ZWeozoKWLNRi3-ZwZ674T_ECc_kwwScoaqc-w-PHAOF0
Message-ID: <CAFEAcA8mygA035i3VSEGzQWppCDaUz0HM5mNU9DvTsOjei1F8Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] hw/i2c: parent slaves created with
 i2c_slave_create_simple
To: Emmanuel Blot <emmanuel.blot@free.fr>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Alexander Hansen <alexander.hansen@9elements.com>, 
 William de Abreu Pinho <williampinho@meta.com>, Emmanuel Blot <eblot@meta.com>,
 qemu-arm@nongnu.org, Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 1 Jul 2026 at 18:31, Emmanuel Blot <emmanuel.blot@free.fr> wrote:
>
> Slaves created with i2c_slave_create_simple() were left unparented and
> showed up under /machine/unattached with no stable QOM path. Add each
> slave as a QOM child of its bus, named after its I2C address, so it has
> a deterministic and addressable QOM path.

Should devices on a bus be QOM children of the bus, though?
I would expect that they ought to be QOM children of e.g.
the SoC or machine that created them.

Do we do this for other bus types, e.g. PCI ?

-- PMM

