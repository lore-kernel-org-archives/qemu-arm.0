Received: by 10.223.197.9 with SMTP id q9csp1947233wrf;
        Sun, 8 Oct 2017 17:57:59 -0700 (PDT)
X-Received: by 10.200.17.1 with SMTP id c1mr11347381qtj.198.1507510679102;
        Sun, 08 Oct 2017 17:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507510679; cv=none;
        d=google.com; s=arc-20160816;
        b=bLGw9yArdsl649x3SVjrkjAHAlYJhR54i+Y2wyGwygSibHNHB2exh15D0jLW3+igWl
         UAzcPNYDYMbQ1gUfGPghGYNMNesFdXaG/W1cuJCY6dlvD6EtS8PUqsWowea2v6/ZUT6g
         6aGnrnLslYvzXxv/dW/xMx5KyrYYrBsGLMW5qjepl/HK8yMnoALfNNTAffGmkrWSdPDF
         Xb/+dQ4Qrmi9Di6rh6ztuxGWeNtQcaWmHPLr8tZqR3yyCA28+6TFHgzzJAD44oDYqDG4
         GtPmuSh7uiandoXv2an+Ptozskcbi64pLNra1W+0JBJ8Lre+EdQR84UhQU52fD1LKAbQ
         wUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=vUeOsSFZIvZxn1LH7LCUcf81nYygLB1tdFBUKDbOmkE=;
        b=mMKZhIyGw0fvFTy9WpwuXjuHHWZv1zAiwkCZbE5Jtr0/AcENBlGwVMKAgzEQc1MxWt
         YQOXi+m0tizlMaaORwKfiSkWLycBrDXlhPbvSubqyZ6cF++q0vlBIR7rj3GLjBFjOidv
         bzm+wNMv7AfUmfVO1HH06xXHtig/NzKblkKhc6FeSq6/0Jj3B0szS0JtfqPt68Axhs0A
         7mb3EjQR0nDJZ2zFgzmLwoWlz00TIlkghzv8YwOW9HPb2ogh6mzbK2NW25s57M0FtKes
         I194XP3HYeg8o79ZEQzfo3Hd5scU3XeoUU4TQqLe3HkFcHFTEVvnFO9Gxjk5nMKoR1D4
         686A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SNg0GWYJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x27si134180qth.249.2017.10.08.17.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 08 Oct 2017 17:57:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SNg0GWYJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1MOM-0001Wd-Lx
	for alex.bennee@linaro.org; Sun, 08 Oct 2017 20:57:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e1MOD-0001VK-9V
	for qemu-arm@nongnu.org; Sun, 08 Oct 2017 20:57:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e1MOC-0007dy-Co
	for qemu-arm@nongnu.org; Sun, 08 Oct 2017 20:57:49 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:52271)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e1MO7-0007bQ-UJ; Sun, 08 Oct 2017 20:57:44 -0400
Received: by mail-qt0-x241.google.com with SMTP id o52so40428636qtc.9;
	Sun, 08 Oct 2017 17:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vUeOsSFZIvZxn1LH7LCUcf81nYygLB1tdFBUKDbOmkE=;
	b=SNg0GWYJO4CvqvAHMfp2fxP07aY2Qho25rmFjhrQtl89y0FCiN+yDmDkzFLMAqOWwS
	/YZunl4b4HBQ8NIZPI3I97J4LhdgFKV0WsI9wugiuGEVwYYsXgUDkqVJmoaQSD2/uB50
	neMG5jRahf3nLeheCop7MD0OlrY9xP1BsEX2wb/3ODGmnwMQYFR/qxC9NNJYOY1xUngC
	VszbU0pppr08cZe7MQkUysv5jFrNqlhp9p6KNVkCrwL3tfUDzwyvWluUYtDe9O3o483u
	gbRZ7wzr4q4BbN+SBtvDBQWHDIkpYh/yBJ4xmp7qoD+0z9LXP65rDz8xRtHC/j086+0T
	RaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vUeOsSFZIvZxn1LH7LCUcf81nYygLB1tdFBUKDbOmkE=;
	b=JGTqCN3RducEB7DxuJdQZ5RYPpxo+UGCkcT8q9UhrjV8tSmp4Zq+Mjigu9UXx/+K17
	u2DNS+ZzWGvKrlVTjbsqjJV3Txe2qv63v0Cn0AcOXblgdSLVDeMvTu/BPsXCGuxPOZc7
	5/MsmkE05z+Yvvn5oh2GPHtWp9TmL2xn+ROv1hE1XsjtB9WgueFpXQZBDyu6f9smOqXB
	tdWxQdQ+E0qUon1TpdrtKAq5GSBxJKmx3eknFEljkI5W0ZAKR81AFX3DlmPruffmjhTL
	mde8g0KWF0I5qSmRfVwTdWK2YNSza4cA85zxMz4eHxXOoi+Rew4QrhK9fUviVBH3odgX
	llqQ==
X-Gm-Message-State: AMCzsaWuz5NqQu7xs27LO7/ys7saL23HPxx20qpWIOCn/ElPQNjeLCSO
	QW2jkdB6wPGH5ZYflfP5Lrg=
X-Google-Smtp-Source: AOwi7QBkcqGWJxbSHVqXFa58pV/4ImDarJxhn5to4yYNG0VcMDL1hFAmSBC6hI77y62m6E6ssTvcOQ==
X-Received: by 10.200.46.146 with SMTP id h18mr12768783qta.100.1507510662995; 
	Sun, 08 Oct 2017 17:57:42 -0700 (PDT)
Received: from [150.168.2.172] (200-127-152-82.net.prima.net.ar.
	[200.127.152.82])
	by smtp.gmail.com with ESMTPSA id w8sm4103291qka.88.2017.10.08.17.57.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Oct 2017 17:57:42 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6f338f6a-c6cb-19e8-2d6b-48f4a931c7da@amsat.org>
Date: Sun, 8 Oct 2017 18:35:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170920070135.31379-4-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH v2 3/6] smbus: add a smbus_eeprom_init_one()
 routine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TfzVYWejCZZS

On 09/20/2017 04:01 AM, Cédric Le Goater wrote:
> This is an helper routine to add a single EEPROM on an I2C bus. It can
> be directly used by smbus_eeprom_init() which adds a certain number of
> EEPROMs on mips and x86 machines.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/i2c/smbus_eeprom.c  | 16 +++++++++++-----
>  include/hw/i2c/smbus.h |  1 +
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
> index b13ec0fe7a2a..2d24a4cd59bf 100644
> --- a/hw/i2c/smbus_eeprom.c
> +++ b/hw/i2c/smbus_eeprom.c
> @@ -140,6 +140,16 @@ static void smbus_eeprom_register_types(void)
>  
>  type_init(smbus_eeprom_register_types)
>  
> +void smbus_eeprom_init_one(I2CBus *smbus, uint8_t address, uint8_t *eeprom_buf)
> +{
> +    DeviceState *dev;
> +
> +    dev = qdev_create((BusState *) smbus, "smbus-eeprom");
> +    qdev_prop_set_uint8(dev, "address", address);
> +    qdev_prop_set_ptr(dev, "data", eeprom_buf);
> +    qdev_init_nofail(dev);
> +}
> +
>  void smbus_eeprom_init(I2CBus *smbus, int nb_eeprom,
>                         const uint8_t *eeprom_spd, int eeprom_spd_size)
>  {
> @@ -150,10 +160,6 @@ void smbus_eeprom_init(I2CBus *smbus, int nb_eeprom,
>      }
>  
>      for (i = 0; i < nb_eeprom; i++) {
> -        DeviceState *eeprom;
> -        eeprom = qdev_create((BusState *)smbus, "smbus-eeprom");
> -        qdev_prop_set_uint8(eeprom, "address", 0x50 + i);
> -        qdev_prop_set_ptr(eeprom, "data", eeprom_buf + (i * 256));
> -        qdev_init_nofail(eeprom);
> +        smbus_eeprom_init_one(smbus, 0x50 + i, eeprom_buf + (i * 256));
>      }
>  }
> diff --git a/include/hw/i2c/smbus.h b/include/hw/i2c/smbus.h
> index 544bbc19574f..666cdeb04c07 100644
> --- a/include/hw/i2c/smbus.h
> +++ b/include/hw/i2c/smbus.h
> @@ -77,6 +77,7 @@ int smbus_read_block(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t *data);
>  int smbus_write_block(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t *data,
>                        int len);
>  
> +void smbus_eeprom_init_one(I2CBus *smbus, uint8_t address, uint8_t *eeprom_buf);
>  void smbus_eeprom_init(I2CBus *smbus, int nb_eeprom,
>                         const uint8_t *eeprom_spd, int size);
>  
> 
