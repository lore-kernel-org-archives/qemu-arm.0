Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp466967ejv;
        Wed, 27 Mar 2024 06:37:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+5JZgZK1Db34/BX9HK34Ks8aHXLeyOALc32rjjm0wYj41kbbcfx8yNRkSypbmUfiYWDdfWJ4MJQWXX23Xf2RAT4TOIGP5
X-Received: by 2002:a2e:88d7:0:b0:2d4:76d6:e9c9 with SMTP id a23-20020a2e88d7000000b002d476d6e9c9mr10744ljk.52.1711546653480;
        Wed, 27 Mar 2024 06:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711546653; cv=none;
        d=google.com; s=arc-20160816;
        b=vMYkM5a1G/bX4D1qObbPOXF0EEO2I3sanLtxfFRXiZiganqRssnaPPqsTGc7kH4fkj
         iBLJRv08jci3hPL440kY1EzeT9N4RQ6nT61fugm1iWFLWlfdjakXvbuPsa46zmZtApyd
         7DhvqU77kCUPUeB2uQQ1syxVrKqCCnda+TL8Yv4BTBuXCRJE/sDjRsJaNmHhVFXC4Qar
         P1s0Zo2KJJTtw7EEQUcA5oOFBL/EQWXgNs0nGXP/VQbtuY3wRoVuuW0cMsHx9FraCxhu
         dnMBHVSfYySMUJGOy1cnMz+vTbggo+UIRfT42MMkTmJijAojc4mW4X+4kN1Wy33PAP6m
         KG+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=smTZluOGn/fUn3D+QqeEnI8LdPKMkXjE5Ourcjod5Ew=;
        fh=VLEkH7YwpXsTGXy3kWAVTpJbYVLsrlbabsIPNWxz8EE=;
        b=MNXvxFCiTtQn0rUgEEZ2ub41yOXRdKSZAMZ8bnt7QM03CS6Aydt1z1i2C84dfxvWVY
         W628JtDOKPaF09c2sGmtaqAsZq68i3VBkyFSh3Id6pnSrI/29drkKLlJzhQiEXFxQcoT
         zp3e3QZMxboQhpgtGpAIlmp8DGhe2gPLIKfMrsFy1KLmOquHu3eYS4BE9CN0mygn1Y5e
         uJgvBUkbPHe+BVo5MlNogRedF0W+eF9lDntOjF0oABmyF9SsUsMqtZP7kq5khq/eWIJN
         vFTmy33Y9bBld+t6zGdWP1sGhqVjjwlPu33DgkZ1Q9upoccoKeaLRmmfOvWJ40B8Gt9K
         ZQuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=XQmXjHud;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
Return-Path: <anthony.perard@cloud.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b4-20020a05600c150400b004147ece64d9sor2420365wmg.1.2024.03.27.06.37.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 27 Mar 2024 06:37:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=XQmXjHud;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711546653; x=1712151453; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smTZluOGn/fUn3D+QqeEnI8LdPKMkXjE5Ourcjod5Ew=;
        b=XQmXjHudRa45bjC3Gisu5AJ0EApzA3ZQhJ7Eet6OQmvGhOrIyLQjjeW3eFlKP9B1pI
         4mKw2fSjE4VQSQwbO0uzv7Q2bT04Dn0ZdvWr8s1QBSQU8AO1Ru4oj0f15Js6kUD8RWER
         Ome/UQmM/Y0WGLcGkgbu3hKcrWXpCVfv32swc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711546653; x=1712151453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smTZluOGn/fUn3D+QqeEnI8LdPKMkXjE5Ourcjod5Ew=;
        b=WN/L+cftFIvTKpOLFCZXun7QCGYhlkxgDepgt7N37PUM6N148oIJu5t784fohcrzLG
         v7ag8AZXaftiLO8m0jZxKfEu+DVZYERJxFAnwlfMmCZdZ6Ea+cLM4/f/xrOaw0SZhY+X
         Hv+Yx+62D8LXzytbeJI7G+AQsotdwO8A8cHe+XLlbOEyiv+m27hcGHGMehgnPjER3SEL
         Wk8RPucoxIPDKQ8xjwhJe6UrOD1IA11FTJd7b/S8rg765gYwFamoqKpTPzgwhFScqdr/
         lDo4IBUUok3VYwk8zih2lsbzgM+1ZqHDymftBN/MVIq3boyeTJhwIPrQ/4HgKBh7am6H
         7Wqg==
X-Forwarded-Encrypted: i=1; AJvYcCUYnlL/+SKHu8hKA+vmwFKFBfOVaB2yK4MYGC12qR4w/QQsTwyzX09wL3j9ITWLVspqi2Zt1eiKK0mZ89JFe+G2GNKDQh83
X-Gm-Message-State: AOJu0Ywf+afjJA2BUBnea3XxXsNqhd/lCTubdCC3fvdNXiOqy9a0um/G
	mq+6JNgcLN2ClKogoZcMNk8k5mtFczHRrZerd9zYHcKZMRStcKN8GOg9MeH+mbD50yFYlBgzqcl
	R
X-Google-Smtp-Source: AGHT+IHmCd6Z7pLRTa8judRkvI7RAqt4OfBOEutc0X/kcSqKXxmUpEJ5ND/lGGVRsxmC7KvW/3fTRQ==
X-Received: by 2002:a05:600c:1c8f:b0:414:669b:aa9 with SMTP id k15-20020a05600c1c8f00b00414669b0aa9mr9727wms.28.1711546653009;
        Wed, 27 Mar 2024 06:37:33 -0700 (PDT)
Return-Path: <anthony.perard@cloud.com>
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id q18-20020a05600c46d200b0041488978873sm2166371wmo.44.2024.03.27.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 06:37:32 -0700 (PDT)
Date: Wed, 27 Mar 2024 13:37:31 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH-for-9.0 v2 11/19] hw/xen/xen_arch_hvm: Rename prototypes
 using 'xen_arch_' prefix
Message-ID: <3c553c67-c54c-4156-8d69-bef3476b63a2@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-12-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-12-philmd@linaro.org>
X-TUID: sDFOjK9Jn0b3

On Tue, Nov 14, 2023 at 03:38:07PM +0100, Philippe Mathieu-Daudé wrote:
> Use a common 'xen_arch_' prefix for architecture-specific functions.
> Rename xen_arch_set_memory() and xen_arch_handle_ioreq().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD
