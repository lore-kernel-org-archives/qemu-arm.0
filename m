Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1760823njc;
        Mon, 22 Jul 2024 00:49:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcrNvvDdQWSiaVhp1gQZa/C97IUxzZfTcrDxzFdftw+c2q7y/tlVrQWzK0jT+yli9eUjyweL8LU8Sqd7Ur52ItRC68KMBw
X-Google-Smtp-Source: AGHT+IEOlNfWGNWV9GJ93lcn88HYaL6lzFviKfYyCGq+Axmo0JC5J1pwIQCw/zwkJvWGC77DdkJ/
X-Received: by 2002:a05:6122:180a:b0:4f5:2b7f:f1a7 with SMTP id 71dfb90a1353d-4f52b800c30mr800817e0c.13.1721634564897;
        Mon, 22 Jul 2024 00:49:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721634564; cv=none;
        d=google.com; s=arc-20160816;
        b=mwMjZgwJeLGRnC+jgxli1RqpDmznEYOLX0vjiHK1Fwd1tu9uZ+1JIMdFL2whEmLKJ2
         +nSdvVMB7AJWAXwviPwMtWtIDD25fmHg5p30yrZof1jTxCrHO5oUXAwx+LrY6XERaDjV
         Gvu7+PcANJT3olO0niQ6Kop/5vep9b9c3U9sC8m5XVmU6gQkRh+xX9y8zMj6iGQF/t6G
         8vXZn7z/7N04FoGL9LaWGpgJ7uMQA8vRSAxgJt3k5HZcmbfvpGiTbg+C8WazaRCsJKQz
         mMWNIka4OB4TYmHebfTCecfjg0705aZEm2cIOfsfRAbvmmVuk6dOOWCun9+fdLw9LKHR
         vhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=nDLhW/EvsV4foDiw7atelQzE6sEnxMcaTf6f1U6EU8Q=;
        fh=UHB0ZivRkpaoZ/yBBMijp7LOpOT6u3ynx+wN34OKC7Y=;
        b=ub1N7Hg7oiGPTYWLY6S9/shjZLA0iGDtKdLlopBGewlnBXvXJnR4q9Pjew15Ov02wQ
         KSf8Wc81PI08GSUoSRl/zop0NTZTWjGG+7sLcyB5BDB/vCtsAz9h3KN5oUy1VxcHsUeC
         HwDnH2SAMD9k44U1qYKV5WIfFtKg2DAfMcn1auW8XwIDqk9JYESKERWkguJHssyml2vu
         ar++6+R4Jw+GfsjAUt2DeJQF7YDqnMjEaRqLXoXsgK66Vvy7zrtFVoxQp5jUFZRYttTA
         dUTKTLLLPA05EBszWK7pBo8J+qzGPl6vkqG04Cp835IXH1zvkepSBSTyCvlwGPdEhIni
         ndSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X2G6U9rR;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac7c759bsi73945406d6.189.2024.07.22.00.49.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 00:49:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X2G6U9rR;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721634564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nDLhW/EvsV4foDiw7atelQzE6sEnxMcaTf6f1U6EU8Q=;
	b=X2G6U9rRTw798sZWpiG7IKiiSDhTe8bWbvYNec1YAeC51y/8vx6iL3RvJj5F8IyNrAgNPt
	GPC+ESg7hVNUITqCpwrFF3hlVO5/P/yJJ5+j8x9bDr2xsxksPm8gh9XUIfhArQh5/a1+Z5
	RlMiO0DDerdFz3NBUvcWGGB6Verpm2k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-y6fKmSNRMFqMWU4JXh__CQ-1; Mon, 22 Jul 2024 03:49:22 -0400
X-MC-Unique: y6fKmSNRMFqMWU4JXh__CQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-36848f30d39so2229762f8f.3
        for <alex.bennee@linaro.org>; Mon, 22 Jul 2024 00:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721634556; x=1722239356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDLhW/EvsV4foDiw7atelQzE6sEnxMcaTf6f1U6EU8Q=;
        b=XjST5YASGsADJVkLJn6N4LjSKDTVwjCUZ7oSPRTrJcLjbnVpUT6Dzwa75xWvSUajMa
         vz/36abWx52P0TX6bEl3xgN9aK24lTQOhB5yHZj25Cgzk6NsM5bmIoR8gEXZx0t9rKpY
         /gYrPqiNHIinxRDSaw0+TtvocJIZGo9JDhEmRImCwpViiWAqjKqqW53mr7z9TrFAcmOJ
         FZj0+Cv0xyGsoj+j9aFtsS6zmRA8i1v4OekqUuvFHKQWiYTenuKPvrDuWzBFdynU3TXG
         LA4XaxOlLnKlJy34EabBkIsE3q/iyMVxd4NvX9CiPuVrwoFghd13oYipSCEWezJlnO9j
         Sl8g==
X-Forwarded-Encrypted: i=1; AJvYcCWqyU/u8FS2xTYkKf2nvIRLgRCr0dV/wpu4kq+mQdAOxPfMYSOMkHNVKCo7ypfuZJyszLCsC9IvA+k4wW+vdAQ99yOOaK6J
X-Gm-Message-State: AOJu0YwHkGg+4OnQzjBZFaiPKL9f2Uh4zs2HT9+Ezbi6CQmOzErS75gz
	SmRBV0R3CFvfVnQ7YXmA9XfIG5mDGwI6AoXif9cyMMSj8QE2n4wIrcCPgqkZ9zhsCrwt3IPFf+h
	I5xNlIb0owk62UwJI/tam3mJy37GKYUpUHpA9UuBfIor/Jz9DcG5nrwE414weDA==
X-Received: by 2002:a5d:6592:0:b0:368:334d:aad4 with SMTP id ffacd0b85a97d-369bbbb3200mr3493402f8f.4.1721634556288;
        Mon, 22 Jul 2024 00:49:16 -0700 (PDT)
X-Received: by 2002:a5d:6592:0:b0:368:334d:aad4 with SMTP id ffacd0b85a97d-369bbbb3200mr3493366f8f.4.1721634555570;
        Mon, 22 Jul 2024 00:49:15 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com (mob-5-90-115-88.net.vodafone.it. [5.90.115.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787ced56sm7758092f8f.80.2024.07.22.00.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 00:49:14 -0700 (PDT)
Date: Mon, 22 Jul 2024 03:49:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 0/8] Introduce SMP Cache Topology
Message-ID: <20240722034820-mutt-send-email-mst@kernel.org>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <Zp4LUSXlwXqI880x@intel.com>
MIME-Version: 1.0
In-Reply-To: <Zp4LUSXlwXqI880x@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: uIxu0ZnnAKHM

On Mon, Jul 22, 2024 at 03:33:37PM +0800, Zhao Liu wrote:
> Hi Daniel and Markus,
> 
> A gentle ping. Would you kindly have a look at this version of the API
> design? If it could meet your satisfaction, I’ll continue iterating.
> 
> Thanks,
> Zhao


I'm not really a QMP guy, you want Markus.

-- 
MST
