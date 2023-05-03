Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2981897ejm;
        Wed, 3 May 2023 10:14:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ54rSQM64CF0UWZOpTFJUyNz6br3DLjeprtoaeRl7Xvdx1vzkIKul+3hJuI7d8TIbgVnGY8
X-Received: by 2002:a17:907:8a16:b0:953:838a:ed61 with SMTP id sc22-20020a1709078a1600b00953838aed61mr2607948ejc.30.1683134068423;
        Wed, 03 May 2023 10:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683134068; cv=none;
        d=google.com; s=arc-20160816;
        b=zL2UbUF+uYqWIAR/20P1myCpgWBAhL904BfuLA8nEkt8A1oymHsq5jHtTwvAhdGyaZ
         xHN97FhK4XyiKle5NSXsTajxdEs4+nNuuTElmvM22S+1N3QBQjeaG687ikXU5Jr32PpY
         jZbBHl1QurDYawQba3bmouCbcsRJfObxuaVE4nTsj0G6M3LgjLKRXhjrl8ktTkRZmC5p
         lLkUFo98usK7BlsbM2Sdf6ysgATXMTnswfJY2hryO5V134E6Bg9ot2kVs0z3wJ2j+2bH
         F+9FjpdihEWglGfyxypzAfvDColNwN0bDz2iZBDAoRe/cKH6U7t+asTqKucqwyAQtB1p
         wriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KPuxb7t6Ub9IyBGCCTrrWQdZ9JCBR7dViJZoYif4jtk=;
        b=qdGnJgd58GfjvfIz+79PlF47ih+qUzk5H3iBC/UMHKxbFZooGoLXmZsdOb0+akkQL+
         1jLCr5RMnLzjDkDe6d61Nd4zPu4amkuH1IsO+C5lo9O5gZVfVB/cxOspOjzKSFnootUq
         QL1hNMfyaC3EXnOdIZkoNR9h+lDXcdbzJUDvOQ7pZx52phHId5xOzHayWZ9Xd3ywVD7O
         x16qgWVuu9MQI7DlLXzVy3UNR+NEvFhSA0Fd9XnRQ7b+xPDx4Tdw5zIDKFp29IaOKItq
         K1SVdid0u/ll+zJS5JD/b37d/6UCrHbN5AaFw9C7L71C6CsqZw7IvuVa8f1XzShkVZNz
         m02w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jNE1YSTX;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q17-20020a17090622d100b0094f1a10c6c5si23629157eja.894.2023.05.03.10.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jNE1YSTX;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683134067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPuxb7t6Ub9IyBGCCTrrWQdZ9JCBR7dViJZoYif4jtk=;
	b=jNE1YSTXYMrQkU7FTjPsKHxpFqrvQVfZnlEAbgULxjufnP1AwuO2K3Enl7hcj9XbxwbhaO
	dlLh7i/QfGPDyvPNjhQ0OufUjgi2DGSJ9NsJ+EJMioon6zgZlx+Xl8c9/CQYRoxSUM+ggC
	dfBXqXhHS13jWpDMyU0szzPrkvxmUVg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-dK66aZbLPbWfP0wrKYwaLw-1; Wed, 03 May 2023 13:14:26 -0400
X-MC-Unique: dK66aZbLPbWfP0wrKYwaLw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50bc6c6b9dbso846017a12.0
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 10:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134064; x=1685726064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KPuxb7t6Ub9IyBGCCTrrWQdZ9JCBR7dViJZoYif4jtk=;
        b=cM3FHQ+H5KcQ/EjpCxtKzmTgHdJRX+ciuwNiqUa+ivBtF4XaWyNPyGtoQfsz+hGF6e
         Kgajox4tSHMtYzexge67PJtE5KX4e+c7tqhJAHgUW9wbBcBcFD1unhXMe4cop7ltt9B3
         DfmVckEzg9Vyk3tl3U4Bs37Wuu4RXxpow+l5zvbgNOnLXjqY/r40iHdUFcXkc329obSE
         XQmk88P8Ne+WAqS8JKHB8WZx03XSZ1mUDUG/7Dp02zYaybHn4ko9sicTWi68dA2SeBK/
         oLal/a5GiISwGtzxiFj7jSjQvFdM7rYAm43Ww4a1gHou4MmkJpfoWdcFPFvqvs/XxJB4
         p0Pg==
X-Gm-Message-State: AC+VfDxSwK5jA5aUKcag3WGtdtFOVW76D6jP+krmoJiMQ6fhzIYeoV8V
	MJM/7VP3HwvueT2QRQrclLC8CDkDEyYSq0/eK57zHEL+44t1NdmrkSSh+/ToOgtT8QeFwg6R2AC
	F28mAX5Qy6c+WiCUAz3u9aT77x+c3jZ+PlYKdTrkeUH5nSsD4fUpi4GJaN8C3gUTPb3umjOhlN8
	mL
X-Received: by 2002:a05:6402:8c5:b0:50b:c013:f933 with SMTP id d5-20020a05640208c500b0050bc013f933mr2437159edz.6.1683134064502;
        Wed, 03 May 2023 10:14:24 -0700 (PDT)
X-Received: by 2002:a05:6402:8c5:b0:50b:c013:f933 with SMTP id d5-20020a05640208c500b0050bc013f933mr2437105edz.6.1683134064152;
        Wed, 03 May 2023 10:14:24 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id f22-20020a056402069600b0050bd4b8ca8fsm901134edy.14.2023.05.03.10.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 10:14:23 -0700 (PDT)
Message-ID: <e0b66013-be38-f580-c3b5-7e793ca1f8cc@redhat.com>
Date: Wed, 3 May 2023 19:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 11/22] hw/alpha: make E1000_PCI a hard dependency for
 clipper
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
 <20230503091244.1450613-12-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-12-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hdUGFczQnCkP

On 5/3/23 11:12, Alex Bennée wrote:
> We can't just imply it as the board will fail to create otherwise.
> This shows up as a "make check" failure with a
> --without-default-devices build.

Not needed and a test bug.

Paolo
