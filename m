Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp173123njc;
        Thu, 14 Nov 2024 00:29:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVkn/aR1Xla7a0IdsEU8SUmqxSl6fWZOmVQYmCAKP6iBV199Ol4wkACqO5DVH658M3ovYfbtn5BotFLnQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGTErOdJaZrXNwLdgQAo5n/EeJBL0CpDYZsN5p0tnslMlwQPNLZL3n/VBGBCNX8Go6kONp0
X-Received: by 2002:a05:6214:5690:b0:6cb:4b70:8ead with SMTP id 6a1803df08f44-6d3ede88876mr14299356d6.37.1731572951852;
        Thu, 14 Nov 2024 00:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731572951; cv=none;
        d=google.com; s=arc-20240605;
        b=Cxg3MglVavs1FQr7G0ecDpprRa+rGXZMmTeOn7qQLp75GqEjEIqfC4C3KTufSomgY/
         0kHnBMhYYQ2RdaKbFMKHxXjK1OKScq4toT359ciDRk+Zk6lLYJC3D9wI9xpBPYXRKZmA
         1iUo3P6jbp6aZTph3ydmx3XMO285DHrgnZ5ofIlKQvpdjlllSkakq6Zg8aqxcXU+K2ze
         xEx23BXFmhjuNpnWjZXsLY92V1EF2qi2XeuYC5XhGqqoYEh7lV7vnUCBxFcF7RGBNjj3
         mSQQCfqWt8uypJvKiVLl26o00YONMxE762TLU1+oJu43h8IrGcudAxK+S+TRnCrns3Dl
         7AlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=K/Tu8mWGJ8cTc6lgQaWkyV6i5KYU6zfwlS+5jmko0W8=;
        fh=z952g9ApiDFRP0dmy3uO41/aoQ5qmnw/krEjVJr6DyQ=;
        b=RIgAg5yYwkLXm7gjnBA4qF0ndsLsMmpnYDP9y/f64jeeq/QWHPHsDGZFQc0urerHuw
         GkDxNM8iqu6KasAyb96w0KM6iz9vvkyumDdsRVlqmWD3V72vzXls/EhKS03JX+JEMYEA
         VexXt2xnTnainXDsNJeUt+/H+/4WbBDNWE1eHO4z38jHPhkRHRBufR+SAY96kEKEqrIn
         FVMJIeA1yYlhDOO29FrRWwTRqJzSev/IvKG6Vddc04jQXcWmdlyDOdNHBb/uYgmHM/ec
         19I255/aoOpN8fGT2Z8QZOoRnBVT5p3EHu6si8/wTBBrd5xpjOiy7v2WklMDmr9tZfEu
         ph3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=in0AeGPD;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3eea195d0si6564766d6.561.2024.11.14.00.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 00:29:11 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=in0AeGPD;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731572951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K/Tu8mWGJ8cTc6lgQaWkyV6i5KYU6zfwlS+5jmko0W8=;
	b=in0AeGPDGbROUHaOQM+FjMeXJSVu73lqqNQxAlWHUTPoFK1HZqGIGjtYvYQucJRojLDNUg
	NMevdM778bPNgWTeU1XcmesAHpB1Lxw7c0wnDMSEDFL16c10ZbLRSPAfLvUbcciuYZ0/H+
	WDqvg4sgxHqDJZ4ATKCwbCge1DvMfRU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-3aJFIQlWMbGUWifrBA4TMg-1; Thu, 14 Nov 2024 03:29:08 -0500
X-MC-Unique: 3aJFIQlWMbGUWifrBA4TMg-1
X-Mimecast-MFC-AGG-ID: 3aJFIQlWMbGUWifrBA4TMg
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbf76b01deso4358676d6.2
        for <alex.bennee@linaro.org>; Thu, 14 Nov 2024 00:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731572948; x=1732177748;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/Tu8mWGJ8cTc6lgQaWkyV6i5KYU6zfwlS+5jmko0W8=;
        b=Xaie3oXxcvO/12hPsr1XaDSvVnePKgzABeaDvz1TJeOfNovLXtbEIoTjkS0oC8OHz6
         NZ8uCPs67BHcIe2IZ9CmNQ2ID5XcbERTvGDqT/pHkZSnqMgJPNJW8kzrRGWqbfIimppb
         moHOguuK6fG15uceBiEvhNJTPiGx+fAm/nK8wKi0BI5/3wPM/Lol4ryR7k7iErGcZ1Je
         2hSagkSaHjT3m2RWyxt5uhEQCI4+BbDYMMuRgMtv2ihr0PwsGKowp8YXxqmZ7l6x1AfP
         AOleDn3LsDfvnPCH8DUMmW34sqwiZKwHryPRhc9oJ4ZtZruFKq9TOZZFnvh7XoTc95Sm
         LIVw==
X-Forwarded-Encrypted: i=1; AJvYcCXVyveiYhK0QUE4SEbOKQ7M62P0kBlBXHn0Eqb9OtTvMH6Bzq8Opj31K3HLzgs5mtv4TuHhXkGYmlperQ==@linaro.org
X-Gm-Message-State: AOJu0Yz+CkNdBPlC5jA+Ea8dklRgEac5zHfBij+Wk+LGe8ds5N64NmcW
	/w/XfaPCzhSjbN54bks7ykuOIX6nzlGVCu9DRO5hneETS11PnfNivtCwPQpJEgDxiGNTUHVmD46
	0Xt0dvpwqmBpio0ug2SruDeU9BGdjgWLR7OCQ/qsXyzXMb0kwHOxUrLuF1JlnoA==
X-Received: by 2002:a05:6214:5c09:b0:6c3:5b9e:699d with SMTP id 6a1803df08f44-6d3edd1f74cmr13821256d6.2.1731572948019;
        Thu, 14 Nov 2024 00:29:08 -0800 (PST)
X-Received: by 2002:a05:6214:5c09:b0:6c3:5b9e:699d with SMTP id 6a1803df08f44-6d3edd1f74cmr13821126d6.2.1731572947795;
        Thu, 14 Nov 2024 00:29:07 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-115.web.vodafone.de. [109.42.49.115])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b35ca3059asm25437385a.84.2024.11.14.00.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 00:29:07 -0800 (PST)
Message-ID: <e2792708-d2d1-4d13-8b43-103cabdb279e@redhat.com>
Date: Thu, 14 Nov 2024 09:29:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] exec/cpu-all: Include missing 'exec/cpu-defs.h'
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241114011310.3615-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C5V5YvPtATWp5mrmWC4_cyAKK4lewjtNF9ZSHcCngxc_1731572948
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ybjdTawm0F3w

On 14/11/2024 02.12, Philippe Mathieu-Daudé wrote:
> TARGET_PAGE_BITS is defined in "exec/cpu-defs.h".

Actually, it's rather defined in cpu-param.h, but that header gets included 
from cpu-defs.h, so the patch is fine. But maybe adjust the commit message 
to avoid confusion?

  Thomas
