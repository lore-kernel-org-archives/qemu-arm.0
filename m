Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1671564njb;
        Sun, 13 Oct 2024 23:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbwHwfANrwQqj8VwzkWr8wSmioGG28IY9LvUvotuiuobeX0cZFPr1BMQm7C1dKWeuYq9us
X-Received: by 2002:a05:620a:4113:b0:7a9:8679:993 with SMTP id af79cd13be357-7b120faab69mr1151974385a.13.1728886365081;
        Sun, 13 Oct 2024 23:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728886365; cv=none;
        d=google.com; s=arc-20240605;
        b=MksV8XbSSzf+V2YplAobXcYOb/wIz1EE6k5XFzpa/kAfvCpjARVwviE/m+pcp/fgpS
         c9Q8nk2g+epvdAHBkyPiJ6SA7byFIJpGY4KMh9iRjobH+1kDevm4WN37i9DFmH4ufRpy
         G0ndx+l78WX5kFDVRok44LCCw+Np1cobgb3Qkf8e+/RGOX/PljA7cTW1YZJK7txgR1md
         /TYDdOTFEJhK8DbZNueyEgmUZe8HewnA1sE61zNSzZnudLF3etVyJyFjX1lE3YI0/ug0
         rdO1Xfhih6BjOGNQFIhnIiQpGF65nmqj+z+wiIMr8g9LyIbhIgVK0HTMmiaDuU0RkJpX
         OhSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Ug5xz4gHMrS22XpK0QsEJf3LjTAuzyx5wguFCtPfq1E=;
        fh=sU1tt+XyCqiJ1cjhcTQKPgYBwScH/eo8E18VfH4ulv8=;
        b=SwlBenprFhswLh9NDUc3BG73Y03/S37/nTLbAUqYDroVDcghEUL5FXGbGwnQXoBMk9
         ZErKi2AWKbAOHTYsHo+iZ1HOh8sK7VAbU7IvuFYWWyW0WZk5yMR9AVsqRgW3NKXgSF3p
         +sUwxGFnGLFYysZtBb8ov+5rr4Y1Ssr7AzkV2SmEcgnvMzmJCnAOx3+5Io7ou+4D3ZJn
         9KqfcVnOevllDg3Z+CiHvIzjp5kHGcy7p2lsRIEGZlxNqfymxAhWPFLYlT88ygIYJVPY
         92sXmcXQQpaBsj8aMyhOFvWGMfN7+SSeTAIRQ7wbGJPvohp/xIHv1DMRlPTgdVF1/BlO
         oBAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DCZrhkWx;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b1149cfbf3si984509885a.698.2024.10.13.23.12.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 23:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DCZrhkWx;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728886364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ug5xz4gHMrS22XpK0QsEJf3LjTAuzyx5wguFCtPfq1E=;
	b=DCZrhkWxqcGM5k7i6ngj1a59XQbmiDP8c/w7ubmQat2R1qvUzc5B7eg/Z4RzG57ZdTjaSE
	Gfn+61X85/2K0sqvXqHKIZOQWz8AAtV+5uw+WciSDrsiL/nAzl7EQgpm30XkySC1pnyKuS
	ETVr1Rl+Kt7MXTucFUbKNwDgf8rlF4I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-9Mh2Tmv5NTO53cCzPGh1Wg-1; Mon, 14 Oct 2024 02:12:43 -0400
X-MC-Unique: 9Mh2Tmv5NTO53cCzPGh1Wg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a9a157d028aso23912666b.2
        for <alex.bennee@linaro.org>; Sun, 13 Oct 2024 23:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728886362; x=1729491162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ug5xz4gHMrS22XpK0QsEJf3LjTAuzyx5wguFCtPfq1E=;
        b=Z206AZ/iQnKslhDPc8Cf3dQjk3bdVUf8hbUnOVrc6OrZQJRy0Hj9QpIAPDJghk7bgD
         drubLB4xDr1S5Hb2L1IPE92W9F/7+6e/Cw0j2iMbJuXk0k1Xd7DW4zbkqKAtYmhiO7Eg
         Zq90WpOhi8TKVjccYM+Gpi/xJWv8bqkYwCSjKdC9ST190RTphT7nyiXlrapK6skiA6wk
         zXBwuydAW70V50AbNjMhaHtCmilhgBR7QZkRFliiIg8TQd3CBuQ8CUV7Y4cMSVFhfbHu
         qMF7LxJ4b0AAVmjVFNAa+ZXAfZ2vdkS3RCxVzwCCakoDVRViwkO0Jd4bAxE3uYhfj0A7
         HkvQ==
X-Gm-Message-State: AOJu0Yw92D1liu/9XVgTLYktJWYofBJPYweEP8g+nV8ezrll/gDRb1WO
	JRFdAWc7xbHvSA9ee+CCGVgGP+dQpaxXF5HkWx50nr1y2kvta9lqIRPsj+WGMDc5xjPjWJ9dxts
	ieFQdyXGIpV9AHn0scILcbkmKFOy9Chc+Xk6RIKHbKnoGrzYoIHx125r0eaNiUnunMRLBQ1v6Rz
	Sma0JEn1Htr4wpA09xNBuHpIrj9enQ/pgkTdEu
X-Received: by 2002:a17:907:7b8f:b0:a99:88ab:c7cb with SMTP id a640c23a62f3a-a99e3c9d52dmr709372166b.33.1728886362417;
        Sun, 13 Oct 2024 23:12:42 -0700 (PDT)
X-Received: by 2002:a17:907:7b8f:b0:a99:88ab:c7cb with SMTP id a640c23a62f3a-a99e3c9d52dmr709369266b.33.1728886361932;
        Sun, 13 Oct 2024 23:12:41 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-26.web.vodafone.de. [109.42.51.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a0e004515sm100839966b.180.2024.10.13.23.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 23:12:41 -0700 (PDT)
Message-ID: <7e8c6503-e56b-4a01-a1f8-945e3e0020d1@redhat.com>
Date: Mon, 14 Oct 2024 08:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] Convert the Avocado tuxrun tests into new
 functional tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-arm@nongnu.org
References: <20241011131937.377223-1-thuth@redhat.com>
 <87bjzoaura.fsf@draig.linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <87bjzoaura.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: K68Z0rvRDiLE

On 13/10/2024 17.27, Alex Bennée wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> This patch series converts the tests/avocado/tuxrun_baselines.py
>> to the new functional test framework. While converting the sh4 test,
>> I noticed that the Avocado test was completely broken, so I included
>> a fix (revert) for that problem in this series, too.
> 
> How can I run them from meson? I don't see them in list (but make
> check-functional works). Shouldn't I be able to do:
> 
>    ./pyvenv/bin/meson test qemu:func-thorough
> 
> ?

Did you regenerate the meson files before running this command?

Anyway, the "official" way to run the tests is:

  make check-functional

This should take care of
1) Regenerating the meson files if necessary
2) Precaching the assets if necessary
3) Running the tests

Hope that works,
   Thomas
