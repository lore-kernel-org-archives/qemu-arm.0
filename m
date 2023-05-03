Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2976593ejm;
        Wed, 3 May 2023 10:06:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55ubzxZtWYXF/NWg9jWEElRRosrEnyzWQoWlokvENf/CQd7xSOLBxmZRd3pKWmsGgZ0fY3
X-Received: by 2002:ac8:7f14:0:b0:3f1:2f86:16f5 with SMTP id f20-20020ac87f14000000b003f12f8616f5mr1265445qtk.36.1683133566461;
        Wed, 03 May 2023 10:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683133566; cv=none;
        d=google.com; s=arc-20160816;
        b=dH+BL7UDXygrdO3EFOpJlgaIWz3jg5JTd6Gt02pC3K89e81uIzy2xXuggXgoFIRLol
         29jsyStRBkctJkBOQ5qXewsnugYv5SHm8Ivt5zp5L4yd9jprZOwA9CDbjyajBvna84YJ
         kCAUYnybttt/kToXJCfajfyuY9Gl3KB6eF5+vuNhl6eg0a5eEqnc+X3xAJZDfbzXu8zx
         2vka3BI1n54MW8yCnctAkxWd8Pt+bt3wpwHWqKIqKtw0jJEeAGVnLlnBtF6sWmK0CabK
         fsJEjHJ4WHxUiCqjoCRZecCVNhNXphrgDkWJU4CqgwLDFTaVXc/SxDojBpZtmc7FNRjP
         9g4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=J+rjya1IxEy6TowkQRkdsrRfLfYqkX5NeKS1vxwF+fA=;
        b=BaMj5TQ9Y/nnkprZjrvpwFp8oGp/tvAJNeI/WvK3AWgADXJ9X5aCm0FpkxWehV9uCf
         mkAD3k/qVZcf6/4Y2/deMmbcugZ8IbEQxfA/CklFXZV9I2gSSdj+wZ5MmKVkMkG1kWKb
         pf1wifwv3L/1Qoj6chUk+AoEuFoFWzMAtKinlnFzH957haIxQKpmNxJP/T1LEKd6LngN
         Y449YnQcYrf2iX77YshCYw5PINUVbZARJhvj9+ZYaoEpRWZ6ZrxkQ1kES+ebCa4FSq8s
         s/VKhEqmpnQtTCCMuyNjRVoAXyXXh/wbVONq2t3ayxW78tWOchTrN6dXcByzav3No6BA
         6+mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FCuUyK4N;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id q2-20020ae9e402000000b0074e1ee30485si2311653qkc.16.2023.05.03.10.06.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:06:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FCuUyK4N;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683133566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J+rjya1IxEy6TowkQRkdsrRfLfYqkX5NeKS1vxwF+fA=;
	b=FCuUyK4NmEhPlsqRFfqEXAaeW9nr/Odtlq8h2pjw0PX/zDUZfYsZwM/HZjJv62uQ5H+5WQ
	fYHS6i3t4kC8EZM4I43SQx9f/SznJ+40bJ9gUn+cn5GQWY8rORgoMgCt79H5B8uGrLc3nF
	N83JX2j92TLiilR2VZqECA1L+DxBKBo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-wh4JZrWmO0O5I2NupRTrSA-1; Wed, 03 May 2023 13:06:04 -0400
X-MC-Unique: wh4JZrWmO0O5I2NupRTrSA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94ee1fc1233so540372066b.1
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 10:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683133562; x=1685725562;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J+rjya1IxEy6TowkQRkdsrRfLfYqkX5NeKS1vxwF+fA=;
        b=RLZz4483AHFS19VDN1K7x6WGwiUDkvnUqosGzZBET2VvlROzjP9VS3hYvhEn0nxojw
         GGlVLQ6huoTiXHh1djX+zgTgJDlokgHNU1bzM1WjJc0hR2w+mSFUb2omUswZf5K4mt5g
         G0Yo5ZqmwVXXkkjtNbWaL/eLOnOcdo1JW2goHRrkJHxT5A2RmCw3jKCfcRA4P32yqoDQ
         ADBzgiX8ZQu7p3eU0OUOIJ/QYNjft70SWG6JPTOecJbQBgCk4ntAm8eXH/q+CluXlsni
         I2FIyW02q9zGtop+cvhQFbHCQTxYd6SEy58OD4PF47irlHwCn5+wsQAAZwk9GhJ65up2
         hWMw==
X-Gm-Message-State: AC+VfDwSaotDq7SfduLYN8KK3xLZdApbjnahrU+uavM6R7++IZzIL8TD
	Ia62mYdKvsSNN73+afreM4hqY932+uqNp9iM2aBh9ezn8IGuJ0A/SJ+9J7zUSYOzL32HBdT4KUE
	YP+ukxLjUyq7MtGKNgVEZ0VnrrssIefWpFoRUs9PFbeXLdEbXyLPyn+0SlBBokSQhuQE9huEsR3
	mK
X-Received: by 2002:a17:906:9755:b0:878:711d:9310 with SMTP id o21-20020a170906975500b00878711d9310mr4437562ejy.1.1683133562450;
        Wed, 03 May 2023 10:06:02 -0700 (PDT)
X-Received: by 2002:a17:906:9755:b0:878:711d:9310 with SMTP id o21-20020a170906975500b00878711d9310mr4437499ejy.1.1683133562024;
        Wed, 03 May 2023 10:06:02 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id a13-20020a1709066d4d00b0094a9b9c4979sm17427239ejt.88.2023.05.03.10.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 10:06:01 -0700 (PDT)
Message-ID: <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
Date: Wed, 3 May 2023 19:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com> <87y1m5s9yl.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87y1m5s9yl.fsf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BXoYsRIVTPDb

On 5/3/23 17:35, Alex Bennée wrote:
>> You should select a device only if you cannot even start
>> the machine without --nodefaults.
>
> Which is the case here right? We could skip tests that explicitly
> instantiate a device but these are tests failing with default devices
> the machine tries to instantiate.

I'm sorry, I meant "select" directives are needed if you cannot even 
start the machine *with* --nodefaults.

Devices that are added *without* --nodefaults should use "imply" 
directives instead, as is already the case.

Paolo
