Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp607411ejv;
        Wed, 27 Mar 2024 10:13:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPTt+Uc7w9myhOie/1sxbpMIBxsBnICs0APesYkwbnUixJYXV2WBPhNjLd0PKI7iQsWz7XBAPdr/Q18wPHJY7KV4pzEAJE
X-Received: by 2002:a5d:6b87:0:b0:33e:7402:f4d3 with SMTP id n7-20020a5d6b87000000b0033e7402f4d3mr425300wrx.33.1711559637286;
        Wed, 27 Mar 2024 10:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711559637; cv=none;
        d=google.com; s=arc-20160816;
        b=vykRsx9AqftjCCJUkEt1dJ92vG8B19Q8Wk9E9oIJTyZfKjElo2EXNyNcXpAABP4Nc9
         /Pdrss2Tdlrr2PXBUwg+T6TdDfKdc/G4XVg9YXY1vsHYuVqWegYqVjvATZCu+izk2WR6
         tCm0qZfr/Kx+JwTZD0HK2SnYHSBL2CAmmpeCMCT1CS3wEOsxf6Z82o8dLXDV7avVjWd0
         rXhLOCIZCn2rSYLgYfWeJHjYQeBIy1432cI6I1gj4s92udoGr31vd2wlMLv0NlUijwmP
         bNDb1hG3p4t7U8738VeQzL0mNOSRLcwC6KTHtzSWvVJ5S73DJbeiuqD6F27oUPovFaNH
         o/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=vu7suNCUX1YMKGA4SET/IwU/8+fAPUob1HodKRWXOiw=;
        fh=/X4CJ6feqMcRKd1h9Ck8goQFzLfMlFk+eVGAaHS15ZQ=;
        b=k9ex5fe9FrRo2UVBiFfY5YfnRwsr8h+p5vxsS1QlJamBBy1UtOnLOWHU8sHSTtwRqI
         lxky7dzua9b7iQ56puwLm1NuGUOhzZTbRn/VBfu1FSYxiaB3fkx1Mir1jJ1Wi4GJfa24
         X8iEqQSG7cbLncY7v/qarUr7DPh3jOqayULFIxKzwFsyhY/OkqNtdCIgew+3HqEJXxMO
         nL3AQXXqu6zSNL2xCKyvfqJ45V2S7p/Gi5QuZKgaZTHbVLn54/9Jaut5sgTaLa9QLVth
         n9r1X2zjNyFiafYzCfE1A4wBMXmhLNthTGiab3SPrwrlmmtw5WexeQmgO4CWSLR+5B73
         5Jrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=chaI7cgG;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
Return-Path: <anthony.perard@cloud.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o17-20020adfca11000000b00341a26e3d3csor3521604wrh.1.2024.03.27.10.13.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 27 Mar 2024 10:13:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=chaI7cgG;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711559637; x=1712164437; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vu7suNCUX1YMKGA4SET/IwU/8+fAPUob1HodKRWXOiw=;
        b=chaI7cgG8KkZSmeU0LuvKyHXxhdDmc0BGtl0uSpiAtjwMpdnkXR+PhUEpW1WgIXDcz
         QthBgSfMaSuZ+L+BGGkObrgCRvw25ZYVdOCMUiGJgoOn2PTbyRWmwch8L5CXTJbp5xs5
         4hHvpHke1m5dH9pz9+NIaYHhfoPvK470I2rr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711559637; x=1712164437;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vu7suNCUX1YMKGA4SET/IwU/8+fAPUob1HodKRWXOiw=;
        b=ixv0RuXSYiXvrhUpJ3TjET0lfjYLfnUjpnWB7e+qwCQ7XNLFbdrSpbhZR5YPSGFrZn
         nuncO5Y3Oa951JtKQtcuZpQZ47PgaUN615N4hQrOT993t42/FX1I3tuVffpUUrsjlJvS
         AJkAo5UKZMpyLjFbw+gUsifioqzAEsPaT4qgMv6kEYThOGmeIUcepOlkq6VB4kVP3yxv
         b21+pwc7zb2kd1JbDBv6RMVHtlTe2CZJhdd/nBBG8Pu8NlBPfrB1O5VmssViiR2gDlrz
         o+6CtU3GIIr4dJtOvMBJJywUEwMzl/bvFAbnv9s28toHXeMx3qL0/doF7Wc+BJXByEtn
         RX0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGrfIVNxMH60UaovYg5tcDEBFKtBcP97ZHxPNZ4I7uT9b3RN4+/wZJTSdpVZZyI/ClhheM6AwSnJ2UMBXiykeyvjme8pc+
X-Gm-Message-State: AOJu0YyP7d3MOtna/+oeIu6kwDTBsFHEpRuErcdzsl5jspI3yT+oLW4p
	IsfAT5PLl6lUXhexDRdcwsSqhFkgFAyXWQjR9oEmamwoDNtIZqsu4vmqLYurVsQ=
X-Google-Smtp-Source: AGHT+IHuzwyfCe0U7WV3L9+qNX5m7LH+o76ieKYIT56YXzVsC6yBJ1zoRlezauX/mZrHEMHFIXhO1A==
X-Received: by 2002:a05:6000:ac3:b0:33e:64f3:65a5 with SMTP id di3-20020a0560000ac300b0033e64f365a5mr433896wrb.52.1711559636869;
        Wed, 27 Mar 2024 10:13:56 -0700 (PDT)
Return-Path: <anthony.perard@cloud.com>
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id w17-20020adfcd11000000b0033e786abf84sm15317168wrm.54.2024.03.27.10.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 10:13:56 -0700 (PDT)
Date: Wed, 27 Mar 2024 17:13:55 +0000
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
Subject: Re: [PATCH-for-9.0 v2 15/19] hw/xen: Reduce inclusion of 'cpu.h' to
 target-specific sources
Message-ID: <5cac8283-2e26-44dd-b113-d8499a0ef618@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-16-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-16-philmd@linaro.org>
X-TUID: a2SE7bs1Cqoo

On Tue, Nov 14, 2023 at 03:38:11PM +0100, Philippe Mathieu-Daudé wrote:
> We rarely need to include "cpu.h" in headers. Including it
> 'taint' headers to be target-specific. Here only the i386/arm
> implementations requires "cpu.h", so include it there and
> remove from the "hw/xen/xen-hvm-common.h" *common* header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD
