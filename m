Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp278220ejx;
        Fri, 18 Nov 2022 06:19:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4P8yZ+it2DM6sAieRqjrV8m7S8LqN4Ne68Enrgx2iBDnNZGov62Y+R5cqvEc4n4FyOg72B
X-Received: by 2002:a17:902:8306:b0:188:5c0c:758a with SMTP id bd6-20020a170902830600b001885c0c758amr7697293plb.134.1668781144045;
        Fri, 18 Nov 2022 06:19:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668781144; cv=none;
        d=google.com; s=arc-20160816;
        b=oLdN3dujml+ewX86u4N+CVm5NJJuwb2mr/epd7IU6zPob9iV6A/0agP5n45vC9cumb
         VJyaZG5g5yxPcgt+9RxUVDNgXvWef3pxNXzaOKLHhz7TICZF9T0ajTP+L6IXwZBd+Drg
         5uu4iUvcQpJOXm1pu8HeTqKuhrx12ikwik9WHRMvlQ8HRfFxbdtGTrX6j5wYvxEsq+zY
         u/DUIv4zi5UuS+3BL123lbaAXEUddN1Zry0zV7ddsEnLZwLn8ocGh7v7/DUCgUGeSrd9
         EOCGPBZHCdWXdoYvfqu/B7HjQqJwsfU11730VDfY7ybqRILHimmtFb8ocF1yN9V1LHuO
         Ly1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NIQXKv9hoTI54ldR6fW56zHzkQfTtz/meRAlqUnIp7E=;
        b=cgPSbpKXE0u2oeOjtFmAIWekxMiG1rMgh5nTYC1/UwEWMa2Xr655kCrNNCM/WcI2G9
         JoT1U2M+PfJMQafUYEqtThwCVZIwukW73hG34ncMssl7DGnyTxZPm70gnktCQZI3GP+n
         7Bh/GAtIIT6yjIkakkUPgU7fvN1kVWqwLjp3Ua4AvN1GBoHnyfpd0CBohiOX9ZGuhiAb
         Pc0w800DCF6GyTIiGZ4YKwJL2o0wMHyMYxEdAHTXL7n2XsjReYeTdoH3xCI/EOXQ+sGF
         +8ayhaFAJhYfJIDOnBwnI7yTPnty0lPWmCXK7tKKIS5h89QVgcNKYCI8vew+Du3r/mMf
         Dp7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S8s8WaiF;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n6-20020a170902f60600b00187085e0aacsi3982318plg.549.2022.11.18.06.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:19:04 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S8s8WaiF;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668781142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIQXKv9hoTI54ldR6fW56zHzkQfTtz/meRAlqUnIp7E=;
	b=S8s8WaiF/og30T36CppxB6Dk1Q/9OST2cwRu1dxgN6lSMSfjZQcPqlLMUCB5PDUkEsftqv
	eCz9467rjmIfR1a/GIIyZXQairrfssU/Dr4kOk5Va0FTuXGuwq1S6vLUw9n2gaeRzElH9a
	ZX1PbrkC70MeHLyZUsdN0ySywKF0gtE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-Ysn2T6sQOdWxV3TfqTqWjg-1; Fri, 18 Nov 2022 09:19:01 -0500
X-MC-Unique: Ysn2T6sQOdWxV3TfqTqWjg-1
Received: by mail-wr1-f69.google.com with SMTP id w23-20020adf8bd7000000b002358f733307so1638211wra.17
        for <alex.bennee@linaro.org>; Fri, 18 Nov 2022 06:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIQXKv9hoTI54ldR6fW56zHzkQfTtz/meRAlqUnIp7E=;
        b=5MOrWngfpLCVyJI1byIQtEuPpVbpsoJhtN3S5U5Ax8xkrrkZx/iB3TdovBQOsSOe7t
         hZqN/3hErBNij8TMYCX2TsHDxdprJ776NX2SGPIwofiQDciNBGfSZqARTNpbAX21zVHJ
         1Szv3a3TcfJMbRUwdkFC/LvPvwdC1+N/8dYhYluCfsGOOKNk+k2rGfh7ycNEh13tXknD
         92swUvdqdGvppRjY7MSl1n7CArz8WD5HCSd2IQ/QUMpEC4nR4BZjoCRWnzD7NsniQqlY
         oh/qtDAcyv0SKLxeI2cRyR8i/avtY6+hbS/H+duJ8OqXgc+AfgJppUw5JXxHl6N4VsKB
         +LbQ==
X-Gm-Message-State: ANoB5pmBI6CkoFoq3rWtzxj/7nUzlUxbPjfvIB1iCtC9AemmNaIZx6pN
	kiFJ4u0QbIlf7bTLhHLDiBFxVtgj/ew0tHHFHWv4vwermBMciMJJC6ncNv/Fp4wecGlc38U0EeF
	wgHH/hCkpwT9uKhqGpsLBmN7ffwWkYkA0aqtYUoTJEYuYdnm3Mj6ouwOl2yBcP9ga
X-Received: by 2002:adf:db81:0:b0:236:5144:f8ce with SMTP id u1-20020adfdb81000000b002365144f8cemr4439916wri.657.1668781140190;
        Fri, 18 Nov 2022 06:19:00 -0800 (PST)
X-Received: by 2002:adf:db81:0:b0:236:5144:f8ce with SMTP id u1-20020adfdb81000000b002365144f8cemr4439905wri.657.1668781139930;
        Fri, 18 Nov 2022 06:18:59 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-177-78.web.vodafone.de. [109.43.177.78])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003a3170a7af9sm4974974wmo.4.2022.11.18.06.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:18:59 -0800 (PST)
Message-ID: <0dc256bb-d163-66de-a448-389e52c908d3@redhat.com>
Date: Fri, 18 Nov 2022 15:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221118113309.1057790-1-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Q/Mr9eMa54PK

On 18/11/2022 12.33, Alex Bennée wrote:
> The old URL wasn't stable. I suspect the current URL will only be
> stable for a few months so maybe we need another strategy for hosting
> rootfs snapshots?

Looking at 
http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/ 
there are only images for the very last month available - so the new URL 
will likely be invalid in one month already. That's not usable. I think 
you've got to find another solution or remove the test.

  Thomas

