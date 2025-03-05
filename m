Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp654101njm;
        Wed, 5 Mar 2025 00:31:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHorZuyVz5G9t4n2XAbI9l7HTMF30ED1miJOhmHXBPk0ejh4j0tUZzsKwES0ocJ0EvIkJ6o
X-Received: by 2002:a05:6902:2513:b0:e60:9cf3:5a51 with SMTP id 3f1490d57ef6-e610c403e11mr8547806276.17.1741163469834;
        Wed, 05 Mar 2025 00:31:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741163469; cv=none;
        d=google.com; s=arc-20240605;
        b=gsDe2j5mJ6+AFpHxkSnnpyi6u+te7pcihbXYBAE3oNdNQaJ8nWMIcgoUDDI3XN3tOe
         6EtN5Jh9CuCKZEc/7gBVCGwx+v3O34vfKfde45G5XwotrQqR67slnjKbIQASQubfw1IM
         L93f8C7x1V062Nt9/z5ofqjaCzOqHrWBdTSgD5Ed5+jHfPTjenWCWVGAtxd84FgvhjW9
         Brlz80jEWL70Abbe2liGr+1VdwrM3KH4sRQray2J8RWTOmphyg0nsVbl4fbVBlhAddsg
         xuDOy4GLBLjPMeV6Y+w0rdiMttC/5Dgz0bqWNqrOySBwASwI6hxlddSNYZiOIYVdbEn2
         etDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=8nBjuin2Lbe79ghTaUiX4CP3xI1Xg49qzkChxqbFIFE=;
        fh=HIOtrNxQ0hnz3EHw+tiAsJYkdfi4QK9y44Hwm43nND0=;
        b=cZiCqllk3YmGzylhKHUJtyPgmrnZFAredB1aHtoYEujApQgY5+UAEFR5jrGsVvVzPG
         2b/QvnwaoQl9U3aKxhafbGV/JH8+aGhCRUxlAeKBzk+VYjmZvkdkZCrFJIf2ha8UZ8EQ
         VCt8B/sGZIEdOpVEWw4vFwdBIkXQTjq3PFA4UDAaoaYIvhi5vwZFChK4KBvyVNmNnXQG
         HhG/l4VOU7FSCUN32XfNKH/zFgnbPGNSfSYiyESD1cwsbM9gVIu17pxzcPeWUcqo4xlg
         hD403FFxRkWZBFTSrNV7Z/Vs4uHf0MSRtlKIxPaaHCZEsvHi4bKMxTGK8ZQk3Iw8VfW/
         YC6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SZrKbPdY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e6111e325easi2416665276.69.2025.03.05.00.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:31:09 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SZrKbPdY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741163469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8nBjuin2Lbe79ghTaUiX4CP3xI1Xg49qzkChxqbFIFE=;
	b=SZrKbPdYosIbnE18h403L1ambWZTUGa9MszlsJt/FrnvpN/6QrjJaxy6jCBLSVSkUr8pD7
	Z/lVBrCZ45p0zVhXFsN7N4xJMr1IdSHR/gIRnl+wtM0oSKNfEmpu+LcPlxDXsYJkQYONhJ
	hplVEL6EMc6qAIXLxo3ksAg6VUI8exg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-CMuizEBNMEmEOoCcxwRXpw-1; Wed, 05 Mar 2025 03:31:01 -0500
X-MC-Unique: CMuizEBNMEmEOoCcxwRXpw-1
X-Mimecast-MFC-AGG-ID: CMuizEBNMEmEOoCcxwRXpw_1741163460
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43bd0586b86so6695325e9.3
        for <alex.bennee@linaro.org>; Wed, 05 Mar 2025 00:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741163460; x=1741768260;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nBjuin2Lbe79ghTaUiX4CP3xI1Xg49qzkChxqbFIFE=;
        b=hQTFgoqKUuw53/s1cdwE2dc/R4TkwOjC+ZefHF3LzLBq5SVHV6P6UxsnmEZk7OGY1o
         Oj/uPgSumrqYPjiiuddKmLCj0WSJ+jG+NF3oASJhuq4RMjvO3akARThfM7WpxR/d06xU
         6/0D3rc3fQ0JFINcQRjdlyVmZJ6YRDg6jfvpC/aFEDWPmOvbTuiB7luZ2y59HRHdV8+p
         Hr1dxGdmaso6lTR9OYI/rEj17PoeSgeHaXyS45JN+2CKu/Dq73W9fAwcaFGsH3XtO9b7
         kfUsLE0vkpNlGlWxcuqdOhKiegvc7narSq5n/7VBwyfv5WIjzpexB6Q550mrKBeLFiDB
         jGNw==
X-Gm-Message-State: AOJu0YwYyuoQXdnQmu87JEBEZqFrqoJpfOojpDmHXhc7lPkZr2tOawhg
	GsHqrunoYLqq07YXar2jdTHVeOR9iGWt7WWy/IT8xp6cwpr32wjb7xDyxDBn022rSk+jJY9PYgr
	6qLTR6MgdgsnDe0HTYwcromVrxLf6QHRQpMMUj7LXPBb8yUbVowyzaz6BDFSSH63HPS62HWssmy
	EhND3cYuedHU76s7eJ7+R+5cVr69+ul3SRfg==
X-Gm-Gg: ASbGnctn64ZjAifaSSXCN9Q6VmHnFGS34w+LyklkQ8XSx5xTV/y4sa1jl85N/Qaj9X2
	NGnExXCzZ3WZ0UuE7CxGMtV9bwJjTUOUI54ZFWGofe8gDwvh682kdA5J/jB0rOeX3PdwJ7cWqo4
	d1c7jUz/ktWBFcY095XrDxFI+CEu42sl9OdclnvVWTHARKM33Fu08el5tIe6xBcVO3R5ae6ZMx4
	Ac6yWNfoJObjjKoAyWwzKXvHJFAEu6U+mDl1GpkWQLVFnwXQPPxDyArns0sDJIm9d/UDr80ai3P
	m+OUJLO4cdBIquXVcgaxL3jut3KWgFuhCDI5bFB13SKZ0UA=
X-Received: by 2002:a05:6000:2b0e:b0:390:f699:8c27 with SMTP id ffacd0b85a97d-3911f727144mr795410f8f.12.1741163459972;
        Wed, 05 Mar 2025 00:30:59 -0800 (PST)
X-Received: by 2002:a05:6000:2b0e:b0:390:f699:8c27 with SMTP id ffacd0b85a97d-3911f727144mr795376f8f.12.1741163459572;
        Wed, 05 Mar 2025 00:30:59 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6f22sm19891114f8f.47.2025.03.05.00.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:30:59 -0800 (PST)
Message-ID: <07c73848-3476-419d-8400-c741cec038e2@redhat.com>
Date: Wed, 5 Mar 2025 09:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/32] tests/functional: bail early if vkmark hangs
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, qemu-arm@nongnu.org, Alexandre Iooss
 <erdnaxe@crans.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
 <20250304222439.2035603-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250304222439.2035603-5-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: heX_2j_T9vFV1uu19k68w_TNzn7fl07vg5Hrm9TR17g_1741163460
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PSqpnrk/wLyc

On 04/03/2025 23.24, Alex Bennée wrote:
> The message:
> 
>    MESA-VIRTIO: debug: stuck in fence wait with iter at %d
> 
> Seems to occur more often on debug builds. Rather than waiting for our
> long timeout to hit we might as well bail as soon as we see the
> message.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Thomas Huth <thuth@redhat.com>
