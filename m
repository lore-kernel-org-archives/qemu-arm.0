Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4295708lfa;
        Tue, 8 Jun 2021 03:42:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsRq2abhCSjQnaGA7/p+5UREYwFq4K32fqZ1m8CT0cNj7Q8h4xZ8X2Y1LNI+mM2+9j2nNZ
X-Received: by 2002:a05:6402:1b09:: with SMTP id by9mr24162948edb.201.1623148972600;
        Tue, 08 Jun 2021 03:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623148972; cv=none;
        d=google.com; s=arc-20160816;
        b=LMHvmL8LUCwqXyWbr65k9SPIAot0E1d+cGX8MTLR3F2Qk0k3lrk5pM7zT471HjlZ1g
         9yErJzjrpA/b8lQw3XP2e/q8rJ8tSSMKLTb7wXN5AXc0266fVCc6zHHxD+gNPR0tn2BJ
         YgEx4QQs9MTZsTw/CQI15qzc3JRCrN+Ouxe1yvVP6MwOcyYgMIR6lc1AF2nASwCZYMir
         zmjDFOYwCvlZ/hpPAhyh2ONYmCiB2OZEoP9GJkMikNWqMLc8UT9jq/QfL4Cq7725fCsd
         7X33L5Xd3HOn90rJJF/xMKXhzPmIM18Q23qhnZlpm+JvHlqWBeCdfibJylD5Uliv9tIW
         RPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=G1EizyqKlAZ+Hg0iEpM6ML03wpjMinDZsv1HB6ywObE=;
        b=h0XPc2vMOrdH+2MP2o4/xENPgQYTASF2eRZOxkaGzfaOghgQzsGb3edgqG+okgBuSl
         q+unfLK5ffTSL5eMNZmMOmNj1RCcj56SkMkpcbr8yIvFcCa1O/3rf829pW4AW3mvnOwc
         DIvdoDo6DMnaGAknpBdbpamIkumhytRvk7NsZo5QGOdQjWYEJFACnNnHWpWVOmIiRurW
         GkRfDr4UdZ6Afz/Tbc3tvWnBz+dV7pkYqXJ3o3h+nst1GFZzeBQachzaOdFIy8JtXfKH
         fb28j/LZ7uDIfXoqwHgZx2dgw2RnIhGczWMUc/JM9mePri21zZeBlsXPmpI6/l0eQ8uL
         ttTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vddkc9mt;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i16si15465704ejg.401.2021.06.08.03.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 03:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vddkc9mt;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623148971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1EizyqKlAZ+Hg0iEpM6ML03wpjMinDZsv1HB6ywObE=;
	b=Vddkc9mtNGey2sXLLUI841GN6WJFi9+eAgApbG3/U60TaIVONJmcG7bJlCv5B7R3Ki/Ti7
	sq5p+MA5kVeimmrr6L04kyWTXLkrt5FvhojRIaks2nAoyW18+d+wI0+7OPC4g2brhxKcIt
	QY03xqRDh9Z36ODwnTwDAVb4A7XtvRU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-9FlV5zPjMuKW-Wz9yi2RGQ-1; Tue, 08 Jun 2021 06:42:50 -0400
X-MC-Unique: 9FlV5zPjMuKW-Wz9yi2RGQ-1
Received: by mail-wm1-f69.google.com with SMTP id a25-20020a7bc1d90000b029019dd2ac7025so584760wmj.1
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 03:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G1EizyqKlAZ+Hg0iEpM6ML03wpjMinDZsv1HB6ywObE=;
        b=aJ68KxrYFnUgT/GEUAsDhl0NB3LP9m9BOhpRZtsZDi67fKqg9eskE0R41RDx4CnY6Y
         pkItmERYmH6qvcJjHnc4Cz31nmcERn3lSIRDLOHVdkKczsRA7QgSl4YhRUeklwFAY3d2
         sXouoeXhSNH1HmDHb0u6lxXbJgSPwI7lRbRvoR8wZ9QyeHEqbWZ+zqeapeCBowG/CkaE
         icaNOSsGfDj0yg0SIH7gZvjACkraz8sJuadNhsprAnD9DoMXg/Ti01JMWQZZNLGVSb9c
         sdeQKerecHx1XmRpn+cHVF1azAOS26MJbv2CW6X4inle9XFXnnPEIhaE7AfBOVuretaH
         xtcA==
X-Gm-Message-State: AOAM530OzNXOr1FAQAW92LVr+kkdqyDJY7iZvw4UyxcBNd/tv9AtiN45
	bynH7kmG7LiH/uSylYHmw+w5I+oMNp1ZQtWJPVkVYVLyfN9S0VyjrugIoC1SyVu8AqKnferWFMp
	RSnnc3Lp5USFVrBh5
X-Received: by 2002:a5d:494c:: with SMTP id r12mr21613864wrs.421.1623148968877;
        Tue, 08 Jun 2021 03:42:48 -0700 (PDT)
X-Received: by 2002:a5d:494c:: with SMTP id r12mr21613849wrs.421.1623148968754;
        Tue, 08 Jun 2021 03:42:48 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id a1sm21974940wrg.92.2021.06.08.03.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 03:42:48 -0700 (PDT)
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com> <87r1hi7tna.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <762ff787-c2e7-b0fa-7938-64bea05044e7@redhat.com>
Date: Tue, 8 Jun 2021 12:42:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87r1hi7tna.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: hOV3z+S/cLg2

On 6/3/21 7:19 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>
>> - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>   specific information. Currently the common structure base
>>   provides the name of the accelerator, while the specific
>>   part is empty, but each accelerator can expand it.
>>
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>     { "execute": "query-accels" }
>>     {
>>         "return": [
>>             {
>>                 "name": "qtest"
>>             },
>>             {
>>                 "name": "kvm"
>>             }
>>         ]
>>     }
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v8:
>> - Include code snippet from Markus adding to machine-target.json
>>   to be able to use enum values or union branches conditional.
>> - Use accel_find() on enum to be sure the accelerator is enabled
>>   at runtime (chat with jsnow / eblake).
> 
> Hmm something broke because now I get:
> 
>  /usr/lib/x86_64-linux-gnu/libpixman-1.so -lgthread-2.0 -lglib-2.0 -lstdc++ -Wl,--end-group
> /usr/bin/ld: libqemu-aarch64_be-linux-user.fa.p/accel_accel-qmp.c.o: in function `qmp_query_accels':
> /home/alex/lsrc/qemu.git/builds/arm.all/../../accel/accel-qmp.c:15: undefined reference to `Accelerator_lookup'
> collect2: error: ld returned 1 exit status
> [1327/1413] Linking target qemu-io

Sorry I missed that for user-mode, will be fixed in v9.
