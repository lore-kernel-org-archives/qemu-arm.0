Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp404583ejv;
        Wed, 27 Mar 2024 04:54:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVW5dbajZH0dOWBbpkqhT62renv4p7JXFaMBvt/u8tFBEdJpJsK2VKgX2pTFeIKuuhIG37U7mYt2NBRG37F1Oct1anQ8R86
X-Received: by 2002:a17:906:c7c2:b0:a46:92a1:6459 with SMTP id dc2-20020a170906c7c200b00a4692a16459mr3859042ejb.17.1711540467533;
        Wed, 27 Mar 2024 04:54:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711540467; cv=none;
        d=google.com; s=arc-20160816;
        b=NtVG+dVJIMJVYuPMsOPntTjenqYJ9c5cXMjgHm4P05YZ/ASZu96sOVPTEu6gtoeMaP
         kl3fXSbivDB5bgOgwYqMAWnLyzjjvDlNW/8vrbR8ll9yitxPDExeiO9qzmNu1HRZZ60w
         QPYmiNmFOGFNruqpmAeRmE1vgODQkehhmkAh61CIqDM90vBtZRVQJf6vs91WGgRk/I8f
         xeK4tlMLB4Hd/ZfuprvMQOAofyq+OYZK4VwzYskDGQ3grnZ7XzRRe9Yl0vTcTI1NWmep
         fXV/yFNurD9Vv5rN1CQ8UHd/HqVaB0AayBJP+eeVnd4Hci9hU9INWn5EBHao9Jxny59E
         y7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Xo2nfZBTCiRDB2jtZRoNWpjUBE4WiCL6rnHvacWUBJM=;
        fh=2B0FbhM9McGTzXhpD4pfLoNtHVr9e9iypRtNPTENN40=;
        b=v+WvPQurMifD9WrNy6nQiU09FHnPJWkEa9nJ35Bveb91/g1FCNkWxUZRpXHtLulXdA
         7b3AJZ6Doukp0mGi1+8WUJXB3iIZXfEJhbsf8Yw+4yS6l29f4g7/XtdqFcbYcEwhyTWU
         lad7TF+UxuBtM++89zz48EV5T7BiQ9UPzmZhv7/Ai6XamCCK2cnZfpH1NGausbgSEKPp
         jNK7ECcf/vLqGAjhrIbylS8WlXAB9v9CRghUHXmN3e4nDJZHXtk/6/BGxG6c6MJpLmO2
         29IIsZYNPRBjg1dklVHyoeJi8BgPSb6ygseL7myDN2TV+WDGCVshmIPJip8U6Wcr0/BD
         Ry4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=MNX8T4iQ;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
Return-Path: <anthony.perard@cloud.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w18-20020a17090633d200b00a4720d0d75dsor2808894eja.14.2024.03.27.04.54.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 27 Mar 2024 04:54:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=MNX8T4iQ;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711540467; x=1712145267; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xo2nfZBTCiRDB2jtZRoNWpjUBE4WiCL6rnHvacWUBJM=;
        b=MNX8T4iQjt4yepfEMC8nSoMl4e7KjZwxh3Blai6qEVkgBxC9svSU2B+pKtOUUKwX6D
         tDHtYBvbfN7glXd/1ZaAZHNw5yv3c64PxyYfDvTLACfTiJpLb1RtBVE6MTchJAlr8cVz
         sT9s6Qvsb6FncEFxlKMVxY24fQzRVvapBDv68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711540467; x=1712145267;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xo2nfZBTCiRDB2jtZRoNWpjUBE4WiCL6rnHvacWUBJM=;
        b=dkVIgnJOznhnfs96xwS6uiuwH5x+cbyctcJ6wwcTVL2XfR7qbbAwA8IKjSGqfGl1GL
         HmLUdblSvkM6LLLXBQ/Ya2TqOIGSYNK2fwKSbuxe3EKEPOmt9VYXntA3aS/D451lnuLF
         wti9pLqLfwzRqFClmrJooqMXocgMqztojupZGyroRcaN4TEDgRvlpbMPLOicN41YyGYD
         t5edQuBsObLcxYyosHbviMoxlk+n3zPWWWf0mWeGkjWvM7RpbqBZVMXh4ClIV4zkc78L
         y40GF1kv0bUcbw2X87srBxBzJgXfakS7jBpuGZaeG43BiJOpldoG05KZoCll3LzBmU/o
         jH6w==
X-Forwarded-Encrypted: i=1; AJvYcCXkPpp3Lx8LSl8Vt1fJKrZKgB4n2cZ9TmqIXCaEAfLDQfcZ80oRS7q2ObPMGk9hHZTcVhZKY1919xHNuC0kmNoEAtoVJ1bK
X-Gm-Message-State: AOJu0Ywm91kjZE+pf+dhe2e16YSjP0Wzar+aGFFkewSYh+VRgKR51gy4
	Mgm2GB+wtz1r0GkhL5Fj1VpXANzwgHp4d92WV/1FIuiFqIj5ubmYEzzHqRsBgjbD9GRCmxDES70
	K
X-Google-Smtp-Source: AGHT+IG9GlCL2qsgWyuFSglCpOBIwZX7MMRogX3VsIf8avJI3j19EV0AuKmIO9P0kiOttKpgN9U6dQ==
X-Received: by 2002:a17:906:1911:b0:a4d:f2a3:9c37 with SMTP id a17-20020a170906191100b00a4df2a39c37mr3310934eje.4.1711540467139;
        Wed, 27 Mar 2024 04:54:27 -0700 (PDT)
Return-Path: <anthony.perard@cloud.com>
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id x20-20020a170906b09400b00a469e55767dsm5334791ejy.214.2024.03.27.04.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 04:54:26 -0700 (PDT)
Date: Wed, 27 Mar 2024 11:54:26 +0000
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
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH-for-9.0 v2 08/19] hw/xen: Remove unused Xen stubs
Message-ID: <7af32170-a282-4f28-9db6-913087960acf@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-9-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-9-philmd@linaro.org>
X-TUID: 3Rq0FTAqCpu6

On Tue, Nov 14, 2023 at 03:38:04PM +0100, Philippe Mathieu-Daudé wrote:
> All these stubs are protected by a 'if (xen_enabled())' check.

Are you sure? There's still nothing that prevent a compiler from wanting
those, I don't think.

Sure, often compilers will remove dead code in `if(0){...}`, but there's
no guaranty, is there?

Cheers,

-- 
Anthony PERARD
