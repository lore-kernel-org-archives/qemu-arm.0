Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1141185ejm;
        Fri, 21 Apr 2023 06:18:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350b8TX58zkKvZLjAhxGqDtQgjBB2VlDus/qDPjbL+YSk7ZEWuWosHCG07brXiLDIw910aE3U
X-Received: by 2002:a05:6214:5289:b0:5f1:6aa8:cd2d with SMTP id kj9-20020a056214528900b005f16aa8cd2dmr8443859qvb.22.1682083099321;
        Fri, 21 Apr 2023 06:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682083099; cv=none;
        d=google.com; s=arc-20160816;
        b=XvOby88Ho0oIE7bBEWyCJ7L82OSgJHeDPYY7L1JqRn5F835m4lePCuAEpL4znB3y0f
         9GIGGh4m/8bVfLuvPR09aqyE9yV/XKspl/R5ZDQpvjpluAOyl6gT4YTL0SjTqAehGbJ7
         h/FODkmTVrbdf+v0SyHbKP1XWvYX0ovDBGuHx0EZ7Tl/8prcxef/fetXpWohouBCOX8b
         2WkKwp6kbb6aGLnNRJ2E/4NUy9906BYlppFX53L6r+uaVoWmwde+WTIcnWtZukA9ERez
         f5Xoz3/FzhgT5zUbR0p/lrq66Y8I3OMk7oH3x/wiAIXXDJRCBZ9yWQs6ee2eHJ8GnhDf
         KMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mzvF2DULtypOJobk7Fu9q8xQ/OplwahSBqHm5YJpxN4=;
        b=jla/hK/GGJAtEuj2UiM2Psw5NN28FIxp6L4fqwjdWpFnm5ILJtYh+q18JJNFe6T9fY
         ye3XN3uD9qKVlnHV3CJqFLJe+0sK8DefSvDqpGFDa3JcX0YvOxHO6dzCFXMpJHEBJWyK
         vUVkXCqKnyI8cfX/rgHomIi4c7ZZQ9NuVdmW77/cL0Yk3kAnNujnAcjaWFkMsUFfYZ7r
         B+iOxaO8bEVNtGNr4YIL50mNiwGp5OupTt9QmIJXq9lAM3fhI8fMeq2H6RpRfhInRJuk
         fAtANAvWTAuRqlqhxKh7ACPn/gW1OZ6ohky2nxMzz7Nazr55zowsJj8/ACtRc/HLygA1
         ggpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fpb3NyuL;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h18-20020a05620a401200b0074a64614573si1671174qko.585.2023.04.21.06.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 06:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fpb3NyuL;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682083098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzvF2DULtypOJobk7Fu9q8xQ/OplwahSBqHm5YJpxN4=;
	b=Fpb3NyuLvEPkGSZoQYdDyi+NXxYqbrCf31n2arS3r1nzhX7emo9WdLMrXgtyD6EfOeG/3O
	PEQ43nMX2StV9u/ye7j568DeasHCJSd2eVcMqfQ5vMwey9+Ttt7BOeeXovvIyWs/UrybPw
	QJPSqrbGBuwAM1tL4c1L8TExwWArNx8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-CNhNS7OmNy-nGTXl5I1xyQ-1; Fri, 21 Apr 2023 09:18:17 -0400
X-MC-Unique: CNhNS7OmNy-nGTXl5I1xyQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f080f9ea3eso6923325e9.1
        for <alex.bennee@linaro.org>; Fri, 21 Apr 2023 06:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682083096; x=1684675096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzvF2DULtypOJobk7Fu9q8xQ/OplwahSBqHm5YJpxN4=;
        b=SwK1SF85K86qAoGZHeF00sKCQR+FHZZIYfGbJDkcuDAGpHry2ySooGdQILir0zmXPS
         qM2HHqkOSOioqtm0ZDIB5VtuW6+kdLr8M/kJBEq7BNJNPKIWGlEF6MQIf5Ix1C5vyYwX
         pQbbUKCwnLb1IMyf2YzdfCMINcUWW5AG+vSbu4Wn/Pvs/Kr5CZq5YqQChcS+iR0kpA0A
         LRkUhqt3AYsCX0gcHJMzSJmnQydGTHJN2EbAkW0ncuHonMduENvtbAe3yT/DCDt1gEC0
         xvH/r7HpiKaanZcowwUm7pDAfk7mVvIYQYhswXCrtBPcbPfqfSqpi64AT1guuoYu8ctj
         BCkg==
X-Gm-Message-State: AAQBX9fl+mfS4w0+LOV1kqgeP1IkDIJEttFvk6gkoUBQlF7NntkAv/0C
	wha7dhYrY7JgmFt5Rq30TpnxNZ+d49RP3gITbvn/VDX/em4y/c0pQj11aLekhFZwSnNTDMvCX2f
	Ybd+PZi2rlVOHIx75JZJGZ5hzn2MKbiSfJx9M2rdrzsOU+fhcHx2Sqxv86XM8/wF4o02wY9kj
X-Received: by 2002:adf:f7c5:0:b0:2fb:87f7:3812 with SMTP id a5-20020adff7c5000000b002fb87f73812mr3877168wrq.1.1682083096775;
        Fri, 21 Apr 2023 06:18:16 -0700 (PDT)
X-Received: by 2002:adf:f7c5:0:b0:2fb:87f7:3812 with SMTP id a5-20020adff7c5000000b002fb87f73812mr3877143wrq.1.1682083096494;
        Fri, 21 Apr 2023 06:18:16 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de. [109.43.178.20])
        by smtp.gmail.com with ESMTPSA id z16-20020a5d4410000000b002f79ea6746asm4378571wrq.94.2023.04.21.06.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 06:18:15 -0700 (PDT)
Message-ID: <aaa99094-9cf0-3f6c-c6bb-efc8c317aa16@redhat.com>
Date: Fri, 21 Apr 2023 15:18:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/3] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230421110345.1294131-1-thuth@redhat.com>
 <87ttx9bck6.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87ttx9bck6.fsf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jydGaD0ZCjOk

On 21/04/2023 15.16, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> Fix the broken ast2500_evb_sdk and ast2600_evb_sdk avocado tests.
>> See the patch description of the second patch for details.
>> Also add the test to the MAINTAINERS file (third patch).
>>
>> Thomas Huth (3):
>>    tests/avocado: Make ssh_command_output_contains() globally available
>>    tests/avocado/machine_aspeed: Fix the broken ast2[56]00_evb_sdk tests
>>    MAINTAINERS: Cover tests/avocado/machine_aspeed.py
>>
>>   MAINTAINERS                            |  2 +-
>>   tests/avocado/avocado_qemu/__init__.py |  8 +++++++
>>   tests/avocado/linux_ssh_mips_malta.py  |  8 -------
>>   tests/avocado/machine_aspeed.py        | 31 +++++++++++++++-----------
>>   4 files changed, 27 insertions(+), 22 deletions(-)
> 
> Queued to testing/next, thanks.

Thanks, but could you please remove that "self.log.info('going to starrt 
*******')" line in the second patch? That was a debugging left-over...

  Thomas

