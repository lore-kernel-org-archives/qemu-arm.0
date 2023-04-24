Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2684623ejm;
        Mon, 24 Apr 2023 02:27:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z9Lj6ynsXgvaFEkVDIS/2IXUdK4KpMmA5VKyhHInn6+B9ijo2k/+mZFvXzgdgBWn3PuQ4j
X-Received: by 2002:ac8:7d94:0:b0:3dd:a248:5474 with SMTP id c20-20020ac87d94000000b003dda2485474mr23389475qtd.34.1682328471899;
        Mon, 24 Apr 2023 02:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682328471; cv=none;
        d=google.com; s=arc-20160816;
        b=UoZgFocjrHQl0xs9XgQzi+dbcfxd6Se5FFIG8qzkbujI2NAkraqcfnC4QTsuVAKHGB
         tRvmni+05rBhToHSU6lQc7vvaJLGcb5Dfx60Q/eLa9G24ydOJcgTFma/ZE0xv8y0dKIb
         jFjUAI0AurPw6L85tZLYADto3ku7MHCwaHcxk55P9z7iAeKzlewKdob5Ye+OHfXpW45K
         hR0WLSB7yISSDxqj61h7JM8L7A4phOIomNsPRgtALtukd9CM/JBmtWqY/bw2mNCPUkva
         OJ8qEZ30FyfDmY0TbX37tAt9OVPVD0MC68GeABDUcv2dcfpN0XFU3covgSyTlrBwy3rq
         KA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uG465fo/o8k8hxcXOndRNy7GyIKVuwkFwjt16CHDyR0=;
        b=VMAvDLR1mRktWFW90QHUL+jxSHMJ6PCPFHSdYdfxWCQ3Kr4RFuhVq8Y0VQAe9A2iq1
         oGhEvkeEBXCfXjwdKp7SjfsnwtNVOsjhe+isrs9iMgZl4KMxefq67zDnrWH7mTi9Aobo
         i5pn2kP2JZpaIkpBSQ+pF0UPWQR6H0TwI6XtAREk8QUCzh8ahv4w+JpxZGSQRcvrLT0i
         bCJ6Ywh907eYna/18lZ5e91qArHABm4RW7ET37C133toTdgS62IhmeH7NDesSDPB3FvL
         gcjHmm8W7kUf8Ocz2LG5VCfMJOaY3rZR6w53kZRbWQV52S3nNJpYRLath84G7UuYVFmR
         jVzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tawy3yRC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id e15-20020ac85dcf000000b003d72cf4dda0si7189505qtx.15.2023.04.24.02.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 02:27:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tawy3yRC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682328471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uG465fo/o8k8hxcXOndRNy7GyIKVuwkFwjt16CHDyR0=;
	b=Tawy3yRCfAtoIeH5VjCOBb7m7wpr6y1csdPJdnsB+qHHproP1b4ZYybt7B+963SYTItPB1
	7BWBC9ANjwznqe+OGcca6VxeZWgY0X1m0Y5oVJ6yzeh3cGjw29UYVUwy3qDYBSvqKSQg1B
	hhJHumUbALuLfGbSQlrvA6Q0ES3Nw84=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-jJcM8_VTMMi6skAUKH1G5w-1; Mon, 24 Apr 2023 05:27:47 -0400
X-MC-Unique: jJcM8_VTMMi6skAUKH1G5w-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f1757ebb1eso13904875e9.2
        for <alex.bennee@linaro.org>; Mon, 24 Apr 2023 02:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682328466; x=1684920466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uG465fo/o8k8hxcXOndRNy7GyIKVuwkFwjt16CHDyR0=;
        b=ItMlllmr58a6xcIoDzcI3Egwi2KhzimEl8sCij0oZNzp5FB3MGchifEefbb+PzEdUO
         sRXkIq5kqBOA+2H2/ZYGXdeYKp+kbHlrKjLQ8VCGPfKta7wjBqb3kSyCBvVaQVn4VvB6
         PdacElblKkCQGFrbrYhXIsPTgb/4b/r8yrpFyLLDIc75QIxHuIZyCdoeL/+wheO27aBA
         6gz/1HU1rGA+zuEUH9wvC3kqsFhhptNhA5pG7moKkBn0dHSu49BEkthpgYoAcz7ujNDy
         wzmsgR9u/Zb5N3rAwZpJ6gVZLVnmGb28dDptHV6OxGmYgeZJeZQPRRe8glrtj50kzGYH
         QF4g==
X-Gm-Message-State: AAQBX9fwKD5SxuphlgW5Wtyeczzkp0tbMMVA0VmTGCh1+s+Txpn+psXj
	9xpJQ5YpjseNExHi2xbJmXZn6I2e0C9fXlyqiuptnqoT2EoZ0KDjtbz7uAyoLl1DTSVP+xwc4/7
	ZfWZgWqJ6ikr8bYCG2Qd6/cYyaagdU64QwIqDXEVoqY28O/butn2lkkptFNo2KBBi/oV9qRMe
X-Received: by 2002:a7b:c4c1:0:b0:3f1:7ee3:bdd8 with SMTP id g1-20020a7bc4c1000000b003f17ee3bdd8mr7649271wmk.18.1682328466224;
        Mon, 24 Apr 2023 02:27:46 -0700 (PDT)
X-Received: by 2002:a7b:c4c1:0:b0:3f1:7ee3:bdd8 with SMTP id g1-20020a7bc4c1000000b003f17ee3bdd8mr7649229wmk.18.1682328465936;
        Mon, 24 Apr 2023 02:27:45 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-178-102.web.vodafone.de. [109.43.178.102])
        by smtp.gmail.com with ESMTPSA id g10-20020a7bc4ca000000b003f171234a08sm11592517wmk.20.2023.04.24.02.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 02:27:45 -0700 (PDT)
Message-ID: <4795c4ff-3db1-3947-ec2b-2823f57ab1ba@redhat.com>
Date: Mon, 24 Apr 2023 11:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/18] tests/avocado: use the new snapshots for testing
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
 <20230424092249.58552-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230424092249.58552-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GzslkEmNhpV4

On 24/04/2023 11.22, Alex Bennée wrote:
> The tuxboot images now have a stable snapshot URL so we can enable the
> checksums and remove the avocado warnings. We will have to update as
> old snapshots retire but that won't be too frequent.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/tuxrun_baselines.py | 170 +++++++++++++++++++++++++-----
>   1 file changed, 144 insertions(+), 26 deletions(-)

FWIW,
Acked-by: Thomas Huth <thuth@redhat.com>

