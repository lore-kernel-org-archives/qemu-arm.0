Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2985214ejm;
        Wed, 3 May 2023 10:19:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ41ufsfTxToIQ0gNeBuPtI5xXSPN3icAzDd28fJ1CtROFtWjsCDg8Ye5NxTQp0fNNLqjKbM
X-Received: by 2002:a05:6214:c21:b0:61a:175c:6ca7 with SMTP id a1-20020a0562140c2100b0061a175c6ca7mr10161662qvd.39.1683134393261;
        Wed, 03 May 2023 10:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683134393; cv=none;
        d=google.com; s=arc-20160816;
        b=zE1iKEbiNuU0E0BPI4lCQd9COSO03iFC8WwD2h/TPF8vFsh9idKJ3bhf73K3dRwzlK
         CiT8gZO/9y+JubZo3WTgNs3WKh2h1wAPn0nW18fkWxiStARzfNxU0jKE0uLCDLdpZCad
         iGT0sGu4+0+qUR6zucWzMS0HQDCNQQOKmPWsxhbKH4oaqJDC/aJbLrriLYYivBHhD3g/
         neaIKSAlxfMnL+WnCOEf8w1HjuktOZpoG+RiNH/cde4MVn+e+YKI0LLWmOItl2ztIeX8
         BB5QXAWX1uxlVQ6ZBnQsPOe1EwAF4ZsFKTlNxs+5q59yH6lYveLQeaYGdZgp+ngq17F3
         FQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZZYYC0Qe7bScIsdno69dMorO1WD3BXxkhNwr62fu24c=;
        b=MX0pwC/XHNLLxIKP/cYwZwgvntJ50cY/VJXHkoyHQ69heHqLfVd6GOebYitBwabS1J
         PvrUDY/Tqy3a4bsZTM/APG0n8e9+B6OQEP3EclJdqCq56owUTN2eY4Yk3qajE+UvzWhz
         UHhHQPhQ8ADDUxBu00a1VJWHEnjjvuPsxjeHLinKcIsREFgXAzQNahKqXY8aRbksOmHU
         k/GjILUg+f/hIyR3MIhFXPyDBs0fVWLV7nwzFxof3WXN2xQbntJSgU5XiWgD2V9Y4m8E
         XAZRiSp1nRHH0MJuDCNhb3pwpm9rmBjrVmDf9CqJ/VCTzapD+Uu/vcAnVe/M2X2UJl8w
         Y2Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gELCmb+f;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o1-20020a0562140e4100b0056eb16d587asi18434802qvc.444.2023.05.03.10.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gELCmb+f;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683134392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZYYC0Qe7bScIsdno69dMorO1WD3BXxkhNwr62fu24c=;
	b=gELCmb+fpr0jDSZAtVSbV1AWjwbiPRVxui9W8m/e//QiTt0Qh/RdJ85K+g1HwamhTjqZEF
	oZ/pBQugSPUA22ZDWHz7IfFz/k7wkKGc1Hm/dnVoVbH0ijPHNwoT9Ux/kjh8rVvmxIaYA3
	RVvwQuXtfnFYPD3wgrG5ktr34VGjxBA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-jhUHrY4wP7agnYZ9EB0JFA-1; Wed, 03 May 2023 13:19:51 -0400
X-MC-Unique: jhUHrY4wP7agnYZ9EB0JFA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50be1a285dcso1235502a12.3
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 10:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134389; x=1685726389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZYYC0Qe7bScIsdno69dMorO1WD3BXxkhNwr62fu24c=;
        b=ACgNu0wIhOs0AQbHDKoHVw+y679L27NdbHGqXtPipblHMqz6jZf0Yk9R4Di+/6AcFW
         5Tet0C/ocoCIOf65MV8P4ZduQmMH/duchR4ko3WttC8iVjGRwAFkRd4/Y6AyBiN/1e5k
         Z1Y9DdRjyADgU2bKxI33mYRtHRRq3mxC2tuRFtr7AudqPFknglFdPQFxGoZMNx3wX6mL
         CQFpgbrfdgNNQ3URTNqEuAZ9lB55hPYKWiQew4UU6MClvuuz8VYyTuO+PgKqJCgwOUNx
         C5pTMpVj+om/vX17A42v/rbSEaBoUrns2ecqyd8uhJZF4YmKOWRQlGdHJc07HYYCCvwx
         KaBA==
X-Gm-Message-State: AC+VfDzX97++XW6wSdiDpKMvmMSkJPhM3hSMOBHKNkEP62H+Bbmk8o80
	4Uni5YAC5WuyqIUVTGlT3HtweyTYPWV6S8Nkv2eNUXjIGIldhtBwgcQp37kKpGfDooEsWn5nE9V
	CkxWv0GvuW7c/VxcAisuruGLrcbITrbFcJNUU+IbTKsD6pl2yJx8wPyv9WYVDdxNMxPcIZm1pMe
	PP
X-Received: by 2002:a17:907:971e:b0:94a:7b2c:205e with SMTP id jg30-20020a170907971e00b0094a7b2c205emr4107292ejc.72.1683134389745;
        Wed, 03 May 2023 10:19:49 -0700 (PDT)
X-Received: by 2002:a17:907:971e:b0:94a:7b2c:205e with SMTP id jg30-20020a170907971e00b0094a7b2c205emr4107235ejc.72.1683134389349;
        Wed, 03 May 2023 10:19:49 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id h16-20020a1709070b1000b0096593aa87d6sm268665ejl.210.2023.05.03.10.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 10:19:48 -0700 (PDT)
Message-ID: <3675e3f0-fda5-9492-a8a7-f608b62a3fbb@redhat.com>
Date: Wed, 3 May 2023 19:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 15/22] hw/sh4: make RTL8139 a hard dependency for RD2
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-16-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-16-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1TJV1f45aqXr

On 5/3/23 11:12, Alex Bennée wrote:
> We can't just imply it as the board will fail to create otherwise.
> This shows up as a "make check" failure with a
> --without-default-devices build.

Not needed, also typo in subject (should be R2D rather than RD2).

Paolo
