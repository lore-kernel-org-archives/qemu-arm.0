Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4886418njc;
        Tue, 27 May 2025 08:14:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0LdeW3umVyFYvGsGLEzCoKiZEidJ3qwQPQfVwOaeRwMUAOcHowaL+GxsCu11SmeF98X3vxmnsXFb88w==@linaro.org
X-Google-Smtp-Source: AGHT+IH+gGLDxfNSbmIF93BU04IxtUb07eulPb20fCvzRTnaME7dsQS/8SL4Ne3/Dgt/ZABEk6TS
X-Received: by 2002:a05:6102:3f49:b0:4df:9635:210d with SMTP id ada2fe7eead31-4e42418db0cmr10953813137.23.1748358853732;
        Tue, 27 May 2025 08:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748358853; cv=none;
        d=google.com; s=arc-20240605;
        b=E67py99EfpGgVwfjg0IFye1HuGWBIsyPM775rDm1e+NfG4z+CRp9JwHZs045zDimLr
         OZ7ceFspc0rpnleKkyP0FwP+ypniNZZRpn/nI5vC1Bvpk0oswBmH5FlZaD5Yra+JwZ/e
         2n3R1gFcbtEQ4OEW1Ue5OWCm4SSAWnzSliMqX3K5JnPBRnm2NL54hQm5va5kdjZFXqUd
         FL9iK0wEBsZw8RiEIidisz2yGRrGkKxHd6QNTvRWzchHMbaRZyTOBmdfLiueojXbIUwv
         DP9NCq+ojOP3w2sZCbT78QLBtfRCgDyFenYf7Z2jJHcKxSMio4vG4x8hf68T260Tpy80
         2Ewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=8apzc3hKBADlByrGAcTgFkrtIBoYZ8sDMVLHX0c8uCA=;
        fh=/ttYUcxX8eHM5Yk1bkAh97DHD+Oh9Mc9pA7621YtjX0=;
        b=P+DXJRcZvVAZektpHdCKCXsqp+smUKPhu1tzWZtd6xTqXqJx+KsQ58bFwYKPxmURaE
         MvC5MPDKsog1tTIk0BTRkjsGIuXoO6/R+rqjLhFYAnIYkqQu3CSNM8gvm0towMFNs8iZ
         Ngryf1i3bsEHNXxeQhtYaaAallT63W35KkSmhBNlIob+YSdv6OIw7jkrD7dN419eR7WA
         A0SFUKmbXTwlJoVe7Pkezp+8Mg93CpeWHcnJzaZ5Ob/d+V0MmzC5Fni1uNjdrRUfoBvj
         uJs6irgFiAOW2qjxI4AgpPstgEg2bKzEYZQpez99pEY0A76XyH4R8zU9IUAS+tJXnfOr
         HmFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FQVpr+YE;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e598003891si203823137.195.2025.05.27.08.14.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:14:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FQVpr+YE;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748358853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8apzc3hKBADlByrGAcTgFkrtIBoYZ8sDMVLHX0c8uCA=;
	b=FQVpr+YEOT+87Ow/jMckYwyGml1TonIgqirv3VJoRW3TzpB4WeaBogso76fsKdDZV+j/lW
	G6dGHOMhtkp/xdMkp+dCSM42qeZSLc2V1n3eEIFY55EXmLdjxSUOTMq1kEzzEKFDADZc9L
	sxjuaitoyynaBJcjcoRzPGHUEfztFns=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-Lb-mwlgTNaOWFQSa4H84xQ-1; Tue, 27 May 2025 11:14:12 -0400
X-MC-Unique: Lb-mwlgTNaOWFQSa4H84xQ-1
X-Mimecast-MFC-AGG-ID: Lb-mwlgTNaOWFQSa4H84xQ_1748358851
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a34f19c977so1681087f8f.0
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 08:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358851; x=1748963651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8apzc3hKBADlByrGAcTgFkrtIBoYZ8sDMVLHX0c8uCA=;
        b=GBMSpjyQpD3HWp+6h9LmQyv+x6SorS+3PBXpFrQPFUX1lah4V8vFUsIZ3TPqKpCTWB
         esfXKpGRKCNiH/1paHW/xYivFRts8euH+U17FcdxYy92iV2j/+T7mi71YWqNQrO+t/XN
         T1TQW4+hkrmERuB48abKsyitca5pNVmMEwItg+7n8X4fxbzSgfcTUwBpf1Y5CnoFfswc
         AOYtlqncKPbPjpf3SovhdgWIwsWaSZ7WXpUGTF7gBawIlH3g7TTQ2HkwGwOoxTHRLKOy
         aWI11DK+55e0fVWP0tmBAF18ECugjDwqF58CZMZtYCcYBweYYEw5ECtfLcN2Ny8NZWOC
         3Jng==
X-Forwarded-Encrypted: i=1; AJvYcCVp1hUYQITChU1XwoxPnlKNrT2vmB9H6QBOEwLBWnQiweuxURyvs8liGXmyBcJXjARRvnV2fqgkbw6AfQ==@linaro.org
X-Gm-Message-State: AOJu0YzBgzKm0Y8dGCaao+AnTHohkuiEWUhNBXqsUtCHVWNp+kIJQaW9
	I6EvtAm3aukH9oI5plx2u0/uNVG0LXvQytc74K5VDbfIEYbisM04ZandFTwseJfnrS6cy7HgFv+
	ixWEFRjle5rv0UR/IR0jPf1gQuN4hgcH6k+dMg4cD7Y7k7rsLqIXYc1l1MA==
X-Gm-Gg: ASbGncuVjHXEmj2pVR77nJaH3roV/1oifmWXsH7gp8AcaQimJhqplNdOEk0vAxAXTsi
	Didg4icrmtzXNZvuU23b7xy+GtPFJpczg2W8xVkGmUOvvfea/HcpwELnWg/gjLVjnATWRCXOcwV
	Ca5F9PbOwgSMJ1zpGwjUrMAfnfY5y8FJw6omzGgi6ui3j2w7elk5TDjbs0TdtE2bkB5iKENS2xP
	i42oD5GbxyFAibmeKVb8Qkq77QkydYEJX/NrHqRujaBw2qDZZvBrDYxSiciyr6oEZX1z4wO5S+y
	JYWxqYCW8Hk1oPkrmCuLiQUSdImALmyH
X-Received: by 2002:a05:6000:4006:b0:3a3:7816:3e17 with SMTP id ffacd0b85a97d-3a4e5e8f81emr995578f8f.8.1748358850689;
        Tue, 27 May 2025 08:14:10 -0700 (PDT)
X-Received: by 2002:a05:6000:4006:b0:3a3:7816:3e17 with SMTP id ffacd0b85a97d-3a4e5e8f81emr995545f8f.8.1748358850337;
        Tue, 27 May 2025 08:14:10 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d5deae4dsm7410998f8f.2.2025.05.27.08.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:14:09 -0700 (PDT)
Date: Tue, 27 May 2025 17:14:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 20/25] hw/acpi/ged: Support migration of
 AcpiPciHpState
Message-ID: <20250527171407.364f68ff@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-21-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-21-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lCAAizwh70sbELjWY9ADYsCTN1cvLMPf2U4EK3i2474_1748358851
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: OBUDg/T3nks0

On Tue, 27 May 2025 09:40:22 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add a subsection to migrate the AcpiPciHpState state.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/generic_event_device.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index c0dbf9b358..9334249cf5 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -415,6 +415,25 @@ static const VMStateDescription vmstate_ghes_state = {
>      }
>  };
>  
> +static bool pcihp_needed(void *opaque)
> +{
> +    AcpiGedState *s = opaque;
> +    return s->pcihp_state.use_acpi_hotplug_bridge;
> +}
> +
> +static const VMStateDescription vmstate_pcihp_state = {
> +    .name = "acpi-ged/pcihp",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = pcihp_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_PCI_HOTPLUG(pcihp_state,
> +                            AcpiGedState,
> +                            NULL, NULL),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_acpi_ged = {
>      .name = "acpi-ged",
>      .version_id = 1,
> @@ -427,6 +446,7 @@ static const VMStateDescription vmstate_acpi_ged = {
>          &vmstate_memhp_state,
>          &vmstate_cpuhp_state,
>          &vmstate_ghes_state,
> +        &vmstate_pcihp_state,
>          NULL
>      }
>  };
