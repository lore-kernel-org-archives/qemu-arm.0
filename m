Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp500816ejv;
        Wed, 27 Mar 2024 07:27:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVI4ak9f0adO7WgYcL9+ySBzzALI0m9IdqC4a/2Ds/vqJZ/fQCxekKkJQlYPZbrUe2SjFbTsWfQfOlIpz2fADP5bBtdAYS+
X-Received: by 2002:ac2:5b50:0:b0:512:cc50:c3e0 with SMTP id i16-20020ac25b50000000b00512cc50c3e0mr4169426lfp.52.1711549663372;
        Wed, 27 Mar 2024 07:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711549663; cv=none;
        d=google.com; s=arc-20160816;
        b=FA1UO9dbNmzzrOsgFinTYljjqM+6MCLB0YC0M7jmn0C8q+MlEs2vwJ70UZpUaBHF4Q
         WbuGHvR5Devgf/CcGd6Ikw+v3FrPWflzp6ifikHzlQAvDkjaLydribij99eI2IczKjTx
         Mmzvmvy1ENKuJNx8eCsTXs9HnexWMUX4vgX+VLBKyPo2r0Ww9+N/uWEm34+9BokljKYm
         fwShlJndFMWs45Ip+BIo3K9CO7maTxnwb0CgzSgO64qggoorG1x/KeztrhsdEnrgrrVa
         KuTzdBHfW2rz57hT+cfBK5yEhN67dV4IQQ1Vi0w7Qiyt9ur6Khub3V37PxMglEvrZE/3
         3aWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=6s9TY9/Cn4vJqrwwNmvG7/hGbs5cbUMGy83r/DdqAYU=;
        fh=5p6jXgSsz3bn1d13qNPP8WsICO6/jpXqGx+fwBw47d0=;
        b=U6K09Z8Ur+VEi4YSAcAd+h0+0Si9eVhm4bnsuBFKbz0YXuwH7gE9lHk9iSmv9kRBeg
         IIN/JdEPkaJBO3RtppTQj1+F5p2OTTO/IrhkcKOG4ej6NxmFJYl4YXwqdaf3abpxEItN
         tyvXJ4yXPJ8ZWmcz40SQR+gvKU4skHfRVMC4k+f941sa8vk1510WpWTJNF//vRnAlBKn
         iwVSaaosByttbf3PN93iOonDeVdoPa+ebeO2WOZmV1faBp/Et199PNyuOxFs1NmKzrt7
         xDoXSzpHk6hBgWKv6V6TBPACBmUgk2t/9wMmeWCGsALGn80e5AGEJ7KfDrkm5C23451S
         /NPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=akD1Dr79;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
Return-Path: <anthony.perard@cloud.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a7-20020a19ca07000000b00513da9d0b2bsor2264114lfg.12.2024.03.27.07.27.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 27 Mar 2024 07:27:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=akD1Dr79;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711549663; x=1712154463; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6s9TY9/Cn4vJqrwwNmvG7/hGbs5cbUMGy83r/DdqAYU=;
        b=akD1Dr79DA3TDuVy4KYa7V1o6k/eb0e53W0mn1whei8/DVe+gFthftFHUt4GsrSKNZ
         EOZa5nEnHR7DGX0ZXoNWlyTU21APjyqyggod+8W5zUG6hAab+28n1D+SwSUQOhe/BvUy
         CGW5zQBwFysbriwMc+tsf+1PXXq5a17wgkUW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711549663; x=1712154463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6s9TY9/Cn4vJqrwwNmvG7/hGbs5cbUMGy83r/DdqAYU=;
        b=dw1RRgVK0+S0kMBVPhlZXycKDnUv+LllJGQPerTjI1kfpzUt763OlaIwiD5EbNGbmw
         /PfbIvT++pdxrUqqFbdTmNuY+iffMgCtyGRkGqHs7qVS3ggRwAMQ1y2LZXVlkw/CQ9IZ
         lBmFTo5+5yTRA+wynT7Eiq0jjUFwNxBIYa7mR/Bqr5xJhwyims/ITPsczsdWuDc6mHiY
         +6qiGwuxdthxHGH+qKrTSCUizCQvIHSJhgmlGpc9fDLT6iu8vZ0sRrLy/wpqGV1d0Yhm
         7+iv0vnaY2W8wO3vADqJe6+rL5vAgrZsg1wosNjq5Lt9n/0cT18HcioAJcUkU/yEFbZs
         t7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6g2nD+k2dlew5TouMqpPIQ23YgSY98bVnbzwlCPrnkRq5nqOrOSMFvvDOtudRxpqcvq1w2EagQYgEffDqyx9HzF0hJxF3
X-Gm-Message-State: AOJu0YyhaO86mYje1oqJ84ej6fAgcOKFKcjeChLmiwQ/EWNHvq4cz3I7
	jL90h034DsCluBzK+VQ5WwZlOh/b063ux4PHGnlIuw0pLqA5dWPbBN5rbYkW4TI=
X-Google-Smtp-Source: AGHT+IGfOGc5SfDKXbq/6cWQXWrbWdawL9QipNh4y7lGdJ/Uq0Y4kUnfad0T2fo+7kdSA94cBcA4PA==
X-Received: by 2002:a05:6512:6c3:b0:515:ba94:8929 with SMTP id u3-20020a05651206c300b00515ba948929mr4374913lff.32.1711549662886;
        Wed, 27 Mar 2024 07:27:42 -0700 (PDT)
Return-Path: <anthony.perard@cloud.com>
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id jw24-20020a170906e95800b00a49856ae93asm3739062ejb.198.2024.03.27.07.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:27:42 -0700 (PDT)
Date: Wed, 27 Mar 2024 14:27:41 +0000
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
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH-for-9.0 v2 12/19] hw/xen: Merge 'hw/xen/arch_hvm.h' in
 'hw/xen/xen-hvm-common.h'
Message-ID: <8829dd17-308b-45fe-8d48-a980470316e8@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-13-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-13-philmd@linaro.org>
X-TUID: 6pFU+5cMaABq

On Tue, Nov 14, 2023 at 03:38:08PM +0100, Philippe Mathieu-Daudé wrote:
> We don't need a target-specific header for common target-specific
> prototypes. Declare xen_arch_handle_ioreq() and xen_arch_set_memory()
> in "hw/xen/xen-hvm-common.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD
