Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1135068eje;
        Mon, 10 Jul 2023 05:11:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEFIZzNK9wiM/YCB3soJI6aJCLG1A0PCUTxwdG0lvbBfgUTyShGQ6B9m/D7pbWhseWXssGs
X-Received: by 2002:a67:f243:0:b0:443:5389:b653 with SMTP id y3-20020a67f243000000b004435389b653mr841850vsm.26.1688991065398;
        Mon, 10 Jul 2023 05:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688991065; cv=none;
        d=google.com; s=arc-20160816;
        b=qPc2gjIfhIHIKazlzwEGLjCavvagSWPnE1uxyb0UyzK1Ydu9OAfagYL3KktIh6FpP4
         cWNvAiDM6bG6pPZa/bh2fFjQ9qlrVdXdQom/4CRq5/eX7gNMvxQLclGnrSorCmubg8nH
         sXEA4jvD3vjydvL4L9HSE0ewVyoDc3KjbBuNExN5VZ1tOiKszy3lUiYyWJFVl0o01nYw
         G+Ke9CGBf05Kym0yipoWjft5Pfs9htr9IQkr+A/R+3EW1ZiOE+Q4Yd2EH8dsFrroTfaS
         PSZx8Yx2HBj1OTJ6eosPUYOo4t1cLVoSpqR65F8uZEwsB4xqYFdhEs0OlZorSmqck99J
         qiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZhAlYnIhAjvuhmMm+cYmQWN65YRA3JYBO+OgLBOM78c=;
        fh=b624LbjzG4VWFMzsZgf3/HqF92Nx4gGAXhfigjORDsM=;
        b=hAvHs+2CBKxP9CO3TimWL0/XpJovGb7auomSDL3GGA1GJbHZK5Qu1UjDfOR3z+UyO6
         udxAQkeawyjOTM7YznprbkFyOuMu5AbUe5m92KOuXEzlTJ5FGzAL898YjfdZO8z6ZmYk
         TcEovU+F2x5kvC182yiObsjfpHAH0XtpTjKX4QyTal6dL80KJ0QItbqMLZoOL8Yjd0GQ
         TY9eDe2rW1WxCij4RyRxdGHAeo8JS2TZyexw5ditGANRR08ZxiiFkBPgm74nzrfALv67
         1BWXxp//jMF5xkZUx77ATB7QTkeAeDGDk60h9A9txQjhchVETdL7cV42EXJDDd1a0BeH
         mlWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JPxoUnWi;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id g3-20020a0ce4c3000000b006378420a3d4si5398996qvm.117.2023.07.10.05.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 05:11:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JPxoUnWi;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688991065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZhAlYnIhAjvuhmMm+cYmQWN65YRA3JYBO+OgLBOM78c=;
	b=JPxoUnWiPcL+aSyX7FhvVXjIucTXdZvHTyfYfKUqmZ1MYs5VISBg4M/r4UGfl/6lklnHJG
	1uaAyB77OVXChZCuETmBsrXJrJi/FazQIzgay9LPUqdyQQB7n0FJh/CA36D9K92gboksvd
	NBJYcDlqOeKZrfncRvkR4ae9vpIiUk0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-k1YtczLEO260-nNePsELZQ-1; Mon, 10 Jul 2023 08:11:04 -0400
X-MC-Unique: k1YtczLEO260-nNePsELZQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-763a36c3447so404717985a.3
        for <alex.bennee@linaro.org>; Mon, 10 Jul 2023 05:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688991063; x=1691583063;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhAlYnIhAjvuhmMm+cYmQWN65YRA3JYBO+OgLBOM78c=;
        b=VzQFSXrPmna34MwuNRMzH7SMQHOnPbMZb1G5LKkKtQCqXwXQVnDkiTQoMQOCuyq3jE
         GlhedgvK5uLmsT0/uPfFCG1ANL1pm2BMdtx0NvLSGo11LYaCtObC8/1olR0YbNp8eGHE
         jpQEL/8O4MQ3Nz1l6Ryq2Z6oZK/llVPJ2C/3hTU05yTnbXsL6KwKs67xaDhV6GS7vdRU
         W0WbwvnjvaDtUeDVFSeHn4k14kUP4FpVExmdR/a++sDjiSj2RK5Fj0YPPAf2mWIjPq5C
         3IhvNnJDr4NFASQovjCJOgTRUx6a+NSCIiDmJUl44p/bzeU2ze8tcxC/4nDVsH+ZfFpW
         edJw==
X-Gm-Message-State: ABy/qLapa/gLTyvztpi/MP7v+y5rpJLyLsakM+p9sva9xkUUzyrPf+ui
	xG/AF2qerhNYUvs+5mwU94MTUcf82+Hf2cNIjWEbch22OAx0iZwWJMI9lI3LZc6TfYpTwYEfDCi
	/ic3621fOC22bqX/0vbClbJVaBlAFXiYZwZgwPZhVOcIbZjqHvYCT6F7JKnGWPfWoqvf8Z5P2
X-Received: by 2002:a37:b605:0:b0:767:4068:1e06 with SMTP id g5-20020a37b605000000b0076740681e06mr7404248qkf.78.1688991063576;
        Mon, 10 Jul 2023 05:11:03 -0700 (PDT)
X-Received: by 2002:a37:b605:0:b0:767:4068:1e06 with SMTP id g5-20020a37b605000000b0076740681e06mr7404220qkf.78.1688991063242;
        Mon, 10 Jul 2023 05:11:03 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-179-116.web.vodafone.de. [109.43.179.116])
        by smtp.gmail.com with ESMTPSA id z23-20020ae9c117000000b00765a9f53af0sm4800683qki.128.2023.07.10.05.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 05:11:02 -0700 (PDT)
Message-ID: <f9442f36-fe47-2dfd-2bb6-ae9c007a7511@redhat.com>
Date: Mon, 10 Jul 2023 14:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PULL 03/18] tests/avocado: Add set of boot tests on SBSA-ref
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: richard.henderson@linaro.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:SBSA-REF" <qemu-arm@nongnu.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
 <20230427154510.1791273-4-alex.bennee@linaro.org>
 <e61e3522-2cd4-9e81-e74b-2932a53b8da0@redhat.com>
In-Reply-To: <e61e3522-2cd4-9e81-e74b-2932a53b8da0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BrMHtUCOL0Eb

On 28/04/2023 12.33, Thomas Huth wrote:
> On 27/04/2023 17.44, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> This change adds set of boot tests on SBSA-ref machine:
>>
>> 1. boot firmware up to the EDK2 banner
>> 2. boot Alpine Linux
>>
>> Prebuilt flash volumes are included, built using upstream documentation.
>>
>> To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
>> the same Alpine Linux image on both.
>>
>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Message-Id: <20230323082813.971535-1-marcin.juszkiewicz@linaro.org>
>> Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
>> Message-Id: <20230328171426.14258-1-philmd@linaro.org>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20230424092249.58552-4-alex.bennee@linaro.org>
> ...
>> +    def test_sbsaref_edk2_firmware(self):
>> +        """
>> +        :avocado: tags=cpu:cortex-a57
>> +        """
> 
> This is failing for me in the gitlab-CI:
> 
>   https://gitlab.com/thuth/qemu/-/jobs/4196177756#L489
> 
> Could you please have a look?

This test is still failing for me occasionally:

  https://gitlab.com/thuth/qemu/-/jobs/4623296271#L290

If nobody has a clue how to make it more stable, I'd suggest that we disable 
it in the gitlab-CI ?

  Thomas
