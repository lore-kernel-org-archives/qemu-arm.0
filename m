Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5662835ejc;
        Tue, 28 Feb 2023 03:47:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+34Ch4Mc/l8BbZOrpeHTX2miK4g1Xu9V3cjcsCPU35bpvQIAfFBFDHWbgpoSPm5XSVgnfU
X-Received: by 2002:ac8:5b4e:0:b0:3a8:fdf:8ff8 with SMTP id n14-20020ac85b4e000000b003a80fdf8ff8mr4186908qtw.36.1677584821411;
        Tue, 28 Feb 2023 03:47:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677584821; cv=none;
        d=google.com; s=arc-20160816;
        b=zQpLkzNsaTO0gU56bsoRWqCviG79KXfInJf/gEAnPBuf5dp8Nh0WoRgEa3e5/luXwv
         p7JTMVjSYo+WHFv4LxCSFQxJwYfpbqQjk3nLyTttweXGQf25HQwGi9Ar0g4pZfYZMC3/
         80xMx+apeofDhqlMdMeqEtn6inDQjgIdESF1oWnamFQuAyji5w4Y+RpQx5bPn50zcm5w
         8fK3NJWm6Mlxo3nsUtAL8Zr8QmOTJZnRljI/+tAqJQwNncV0NggCj0b+4crFmKD25Q4Y
         hBVCzTaZ/zBKyBCUnBI6fQmIh7h6AzcNmuQKo873y3JiA9agR+wRmYjOmzb9WEjks41v
         brlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=0nS0+RyN/H1npg0C1JIbWHZZ4SfeTHMMRyD4io5maU0=;
        b=RdWj4IoGbR7WhjkOFIqO4vqm5HvIU6180NfZHYMMy3hc30McJN/sQO4gnC6wHE1ZqF
         Dy8rI6QS15JgkTDkXA5/Tjt9M8juY/113t/ep23GsIxq7FVPNTHaXSCYGDrhzpu5FgJd
         rLOzqPsGkIz9bLIpiuo13QlI74DXO7XU90k9NWI8g1cbQ50VJUtv7dImY+W35bQn3GwB
         y7PvdKkPXIexqYgO9uuII+XhVXuha28MnglggbR2nBpcBHVf6NwAzwav8/2s9aQR2oN/
         IO8FP03nomEYbbLfiu1L2Z5UP0WCfcl8+NArUExVWaY+akZ04ITBwkzIrNCUNji7avCc
         0AKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bkQOTDbV;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id o11-20020ac87c4b000000b003ba201d92c0si9347007qtv.124.2023.02.28.03.47.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:47:01 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bkQOTDbV;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677584821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0nS0+RyN/H1npg0C1JIbWHZZ4SfeTHMMRyD4io5maU0=;
	b=bkQOTDbVvT59u8OUyKoZHI0fKCHpSdZlLa8iZd6dMoauHfRkGPE7SXPkRxjSMA6SZdZcJj
	Q4nVxOJATEiI3eENvVVXiEs2VnxFBCquz+LQLfVpl+TbF9JzWJ1LwBWgjMdZaGfvW2naCa
	L6jWj2y7CGIi+3yisrBlNOXMRLmtdlk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-185-BkgKl6zWMTKmrFBO7zwi3w-1; Tue, 28 Feb 2023 06:46:59 -0500
X-MC-Unique: BkgKl6zWMTKmrFBO7zwi3w-1
Received: by mail-wr1-f69.google.com with SMTP id c30-20020adfa31e000000b002c59b266371so1481837wrb.6
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 03:46:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677584818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0nS0+RyN/H1npg0C1JIbWHZZ4SfeTHMMRyD4io5maU0=;
        b=fxryidEioVG/92NQu1ANNq1pyN8qvJFX6gnjtG7o42FMUkT5VOK5TOcSGiSD9okEYZ
         c9yEYnatafA3JG69LMUd0bxcA/S62jcTWL1HlZa3GBPmKH0n1kSQVImljNBsJOiKg1Nr
         /m5+sRrJ5H9f6qQGAef9lTf3c9vur5+oPioflh2kaldim7Ff+ufu0GT7ONLRBtjdsf10
         4QBJTMOZW0dr0Z8QEPsDPul5e1aEpCLcuIuJ/ghCJ2e8nQd6M41GJhpp6mf0A+smA79E
         bZhfji1T/WtCGckYXHAqfUoZoWU/KD4TitCmrxlCn9T36jvGcDpy0UDvNgJ+RK9oi9K9
         /Nag==
X-Gm-Message-State: AO0yUKXpB0uKsCLkh6uD8aI+gspM7sKtobLd/ZFYbneNPY+OJwUOv8j9
	PtSNsbEM5CY05aydcn5YxKvHCYArgyaIYB0YUC2VdcT+4wRfBOCjGBQPosL4ictQv75LpHsbLNd
	DjsVmU+UaabhIrl2s
X-Received: by 2002:a05:600c:3d8f:b0:3e2:d3:b2b6 with SMTP id bi15-20020a05600c3d8f00b003e200d3b2b6mr2040457wmb.14.1677584818556;
        Tue, 28 Feb 2023 03:46:58 -0800 (PST)
X-Received: by 2002:a05:600c:3d8f:b0:3e2:d3:b2b6 with SMTP id bi15-20020a05600c3d8f00b003e200d3b2b6mr2040437wmb.14.1677584818147;
        Tue, 28 Feb 2023 03:46:58 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.141.194])
        by smtp.gmail.com with ESMTPSA id z22-20020a1c4c16000000b003e206cc7237sm15096859wmf.24.2023.02.28.03.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 03:46:57 -0800 (PST)
Date: Tue, 28 Feb 2023 06:46:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Message-ID: <20230228064623-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Y/3C+jC3Lk5MJxfu@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: yFTglK/4X+9d

On Tue, Feb 28, 2023 at 09:01:46AM +0000, Daniel P. Berrangé wrote:
> If we're merely wanting to drop CI support, we can do that any time and
> deprecation is not required/expected.  We should only be using deprecation
> where we're explicitly intending that the code will cease to work.

Good point, IMO.

-- 
MST
