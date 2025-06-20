Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp871046njc;
        Fri, 20 Jun 2025 06:01:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWX41LLRFl7K5Tn2ulPu9vkGGc+b2FKQlYJG6gIgV6w4cFbWSG+Di2vwwmFp76gGsP/5evanJQEbf1MvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGGESf/+I0QqoBYt34DO6hAEoP9Tt90UVGNuHQasQLNaHUskO7wBbDO43BjAfrcbxTVzfoH
X-Received: by 2002:a05:620a:1a27:b0:7c5:a55b:fa6c with SMTP id af79cd13be357-7d3f9938fa1mr379133585a.38.1750424471035;
        Fri, 20 Jun 2025 06:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424471; cv=none;
        d=google.com; s=arc-20240605;
        b=eihkf/seH2NvZdRVtJwYFVH5tF93acVs4QrDyZcKP5yzrKBLaYQVNCiuILBLoYBv9A
         UumAc6poQs2v/kredQIELxltyXsziLIo26xRi+XG25W7kYZcamV6Fim65lBsVI50FIaS
         75iQbj8v6nJAy9s3LbYz7MB6ts3tyifEnCxi067n8YIB4sVijmYiHVNmd3dvjNFXAN+d
         2VP5dliTThUz0VUBBF2BKV4uG2MOG+Lg3SYVzVbU3Ubcg0hN5x7ojMTFsq6XgwaBGsCs
         fCnFIfjf0F0TB2sCE10sNX7YcMJH95XF6ogUJ4ZvUOssAzpCvyxQ5bziLfhGw+fmjX3E
         6+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=qXoO3w+AAUrwkhiN5hiuL+BP73w5x/IxZN038Wb3mUI=;
        fh=5Cbx4QYMdBxVUt6jjgoc6AfIcu3VBtj/HU0hPOVQu0o=;
        b=Nc6Or5DCYWQjilnlWXrwvTic+RLk+HoGECD3RaYDEyWNnw7HgRk/iFEaMPGOI/3RER
         VWAsdbN9bw7OW7Oiaw3cKeHr0HAnnx0zl+pI5LMlObASGjasfllF/WlwrGOm83KTHMDK
         GZLdLMkPNj2VNmE/hcCyQPSToX0Lo2L/oipkHh5qFzefQd+JRmu9vHfuTNfdQ4dRVGtY
         ADwv+6uPRVLZK3EDq5TtsISFSIM8BJKO7oBFdB+WO148ZVs4BXTPdimyaMERe5OL3PE8
         aeEuiqXnjHB8x3Rct8bVynvZixXbnva4E9TgbsKoiNIW7jkUBEz4wCplabUTnH1A1Rou
         QZmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="SIornf/F";
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a1edbdsi153672185a.548.2025.06.20.06.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:01:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="SIornf/F";
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qXoO3w+AAUrwkhiN5hiuL+BP73w5x/IxZN038Wb3mUI=;
	b=SIornf/FQHF3YzCfHyDOP/ls4lSojDWzmhCPQQtYaBLI/a0GZAYn1AqWvP5zNWhVlpTj7W
	uPMyaqF8N6aQjzwvhYORhp8XXfGp8I2awQo11OfmRuOovrniqjUsRmcWITV647Mq1dvwof
	w494r/ScQuCyGF9h9W5MGRyBG1+fZ28=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-Qk9bMvZjMcujqjaiiAeOTw-1; Fri, 20 Jun 2025 09:01:07 -0400
X-MC-Unique: Qk9bMvZjMcujqjaiiAeOTw-1
X-Mimecast-MFC-AGG-ID: Qk9bMvZjMcujqjaiiAeOTw_1750424466
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450eaae2934so14802585e9.2
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 06:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424466; x=1751029266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXoO3w+AAUrwkhiN5hiuL+BP73w5x/IxZN038Wb3mUI=;
        b=LWT/0iCV57Ou4mrUCpAmIXKcpsI833DgDRLYXQkE7JuzuS5QhqVsuSYvxXzEdR4m0G
         q2EX15XCUU6H/69uzGbUptjcPT1DJF8Eh0RIZidh0tW4PTSga2q7BxRP2RO74aXLRC+8
         tjWaSSqR4gmueYcWFyzY8JXaFMKYnM1UUuGUuEtP7oEjc5cB5X3XnjFaNvYNiIUtt1IC
         Pm7z9S6DNMchPo9JBEYjhLbGC3F/8liq2Xub6TbzSPKwKsTPm7bfCbIITwREdW/f9136
         A3KaIOMTmxnzGFT9hS7Viyc+X4Vrcep08GX8HL2H4Gremp6g7YZADj4/7bPtWP8svBR6
         Jdxg==
X-Forwarded-Encrypted: i=1; AJvYcCXIbhGJY8aSxvvOG1MjyILrHPffb10WbMdzMRwCqo4lzvfLRPCK+lUQiQFVWH1TcIBx1o6R8wVd/+wo8g==@linaro.org
X-Gm-Message-State: AOJu0YzTTut1cEKkot82YQaGoUuAnnxnXMPjx1xj/fWlf6MX+Gz4DR1j
	3G7iaoO0hmECOjlc1KqjbhGhxRyOep8NLwKt6s9b9oY+VSi5yN6J1m5pVoCJj/zHDLesd5BICyS
	hHTcZN0xFtk63UKxPv1hAKBG2dWaXA8nT15isQ4brIdpMVKfUoB5QkBP87A==
X-Gm-Gg: ASbGnculroIV/2zX6uuvIjsq9/L0li9+l9uZZ59wBVAw0njo96e1o/+opQVaYNO3I0j
	G4lvZcWYC6gtqRezxlERIELCtUddAfai5tRhTe2SDYJq7kNaXKtzekXp/W+Mw5U1LPQH1AOel4K
	82oY/Lz2udVVIKaRLlAk2W600EYyFWLJ/Sxfw34pKgKEjiVzvyXfhxyR6DshmoYCXd/j4Q62uI1
	G72DkJmn4TYjMC4/Ajs8c4aDbqww/4x8KoFYkH1pqKKPWKQ+872xjXw8JdqEH/gnnDbt5H5Qu7K
	xADdq28Eu600
X-Received: by 2002:a05:6000:178b:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3a6d12c4595mr2517292f8f.5.1750424465867;
        Fri, 20 Jun 2025 06:01:05 -0700 (PDT)
X-Received: by 2002:a05:6000:178b:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3a6d12c4595mr2517210f8f.5.1750424465135;
        Fri, 20 Jun 2025 06:01:05 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1187df7sm2018151f8f.66.2025.06.20.06.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:01:04 -0700 (PDT)
Date: Fri, 20 Jun 2025 15:01:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 20/29] hw/acpi/ged: Prepare the device to react to
 PCI hotplug events
Message-ID: <20250620150102.702a8078@fedora>
In-Reply-To: <20250616094903.885753-21-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-21-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hAG-lZXwrqHz50k1D4o9iUKbzte0HkwX0S8MMRXjQLo_1750424466
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: JBbYC7aZNHw2

On Mon, 16 Jun 2025 11:46:49 +0200
Eric Auger <eric.auger@redhat.com> wrote:

[...]

> @@ -433,6 +443,12 @@ static void acpi_ged_realize(DeviceState *dev, Error **errp)
>              cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
>                                  &s->cpuhp_state, 0);
>              break;
> +        case ACPI_GED_PCI_HOTPLUG_EVT:
> +            memory_region_init(&s->container_pcihp, OBJECT(dev),
> +                               ACPI_PCIHP_REGION_NAME, ACPI_PCIHP_SIZE);
> +            sysbus_init_mmio(sbd, &s->container_pcihp);
> +            acpi_pcihp_init(OBJECT(s), &s->pcihp_state,
> +                            s->pcihp_state.root, &s->container_pcihp, 0);

bus flow looks weird,
I'd suggest to
  * set root bus link on x86 as well for consistency reasons and proper ref accounting
  * and then drop 'bus' from acpi_pcihp_init() its arguments

>          }
>          ged_events--;
>      }
[...]
