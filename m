Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2716773ejm;
        Wed, 3 May 2023 02:43:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yAoq+8zrzFrLHp7QpIwd6kc/u6Ou+CsDr1hwT0rLp1WNkOFjWJ9tUrgrJgDuPFhEbIWOH
X-Received: by 2002:a05:622a:248:b0:3ef:4a6c:f9d2 with SMTP id c8-20020a05622a024800b003ef4a6cf9d2mr32842605qtx.60.1683107038779;
        Wed, 03 May 2023 02:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683107038; cv=none;
        d=google.com; s=arc-20160816;
        b=zUbQYa8pICx3+h3Xt97CE1ry7F4s6f4Cgbg/5+CtcETgvIz1lHcJKttMhYAJk4RgK6
         1YMy9+m0NXmKd1LNNfmLOHcJpAMjkH2FkEhBQaXoKbbOwpqJgfw4uOzccjFrC/2f7of9
         pYu4d59w2MW/KxUIMxHFOxB0eZq4pdblEuzwHTa4VkH6t45++Inx5aff/pVJN+i7EUDe
         1RhQcTUkPtErY9E+4qedVuv17tdEhqta0uuERiQxk9/d9P8YQ7flf6CtRTYTa6nCfz3Y
         K/8h43yTtGP3H6AbiT5Ft9k+JLBuGqmTINMegYJwIr8EQ2agzT5sUY8PENs1I0RQqA58
         ZjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wxOXh6c98oGKCIaqyo+cLYg2LNcki+YVv44cF0AJywM=;
        b=WOCrZ+VBUiBpvezg3U9Ytw9KXGSz7eku7jeGgm14o0Eb+k3nK7/oS9NvysHAdIU6Vl
         F4Ku5f9qbPsVQ6ageVocbtllekdwstKX7gxK1+tsqATMG8S3hd1YLqQA0ltLdazHmdl9
         G1ykjZ3Zv7fX8wteegt38MRh196npg1Ynys1xcBwTzNhxAo+kvpPV3WkdGUjmXSU3261
         n02FhCn3a35eiPPFadgtXIMRJrEypjSpKlrxdW3VtFy3CCq6rlAKUBFeFhfV1xS8p+uf
         RY2Wpe1OlLnZl47Md/8mUTMb1x0f38W9/AFwAtLndYJKNVNVNW9qHvE6Z7aXkhF6nXbC
         eQMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qj3idSdC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id t21-20020a05622a149500b003efc4058e60si13661505qtx.150.2023.05.03.02.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qj3idSdC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683107038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxOXh6c98oGKCIaqyo+cLYg2LNcki+YVv44cF0AJywM=;
	b=Qj3idSdCBQrlyyLj1IUqFaUk+ZrMKkJK25vXGqV5jCiY2GtMZQ7xpNdkyYoNNfHd4JCkHL
	IiOcpS1SSSuvizxtr2ClsI1E5xScA+NW+tVv8pfG4xNhuEc02VZAU5r/+JdWCaV8eLOl8Z
	xZNkFi0zSlH+/A0Kt6e7obpHj+Uyw1c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-cwUXZ90wMLa7qHPl7RqlfA-1; Wed, 03 May 2023 05:43:57 -0400
X-MC-Unique: cwUXZ90wMLa7qHPl7RqlfA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f315735edeso10563875e9.1
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 02:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683107036; x=1685699036;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxOXh6c98oGKCIaqyo+cLYg2LNcki+YVv44cF0AJywM=;
        b=DHAtXfw6SAKMbdWSup9Aw4bfjFRhFnx5mYQL8USy0JofH2TjCoLOc28qWo31Zhh5eU
         3Jys0/c6OfgLD4BMBg+jVb5ZbmUymFs4SyVB2id+fMUMXZbdN43snjCuvd6C2kdUde7e
         I/+cJ/d1EmrANcsx5Cl0HW8kVEGAzTAeKgYEtKTzDCo3FeSJYB0SHVSoy2aMcQaJY4+3
         JUqqGjzcNH4BWF/yQEYqPSFbw4hzffjGwd9E4I8abP2+67YfwDrzh6FMNs81QvwvYlm3
         aiX665pDVjjhGR6wKShiRqnKTRTq2uwmDfdV8uc/qx6R5gUcslEivdIT3+P1eF7JxpDo
         8gwg==
X-Gm-Message-State: AC+VfDyz99LeP5q/OGgppf8bShc/1az78phiSJOOmExQIefZSd7U1KNZ
	TWagibBCk/QsurR9vVU3k0OVCmiIiNOn/IzW0hT3B1gMACSX3h8MIktgQfJY62FmpU1cUHxAWjh
	zExaohE1ic2MCCmS/YJ2JElp85juy8W+jdamuiGdj2g/Dvkb9IFz+KVSfujKYvlD7Ty/Sg9Ay
X-Received: by 2002:a5d:4846:0:b0:306:403b:455a with SMTP id n6-20020a5d4846000000b00306403b455amr1074517wrs.27.1683107036305;
        Wed, 03 May 2023 02:43:56 -0700 (PDT)
X-Received: by 2002:a5d:4846:0:b0:306:403b:455a with SMTP id n6-20020a5d4846000000b00306403b455amr1074458wrs.27.1683107035877;
        Wed, 03 May 2023 02:43:55 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d684a000000b003063176ef0dsm6275273wrw.97.2023.05.03.02.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:43:55 -0700 (PDT)
Message-ID: <2428e066-f8f0-eab7-40d6-3332dcedce6a@redhat.com>
Date: Wed, 3 May 2023 11:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 21/22] tests/avocado: use http for mipsdistros.mips.com
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
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
 <20230503091244.1450613-22-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503091244.1450613-22-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: La1cafFJe4do

On 03/05/2023 11.12, Alex Bennée wrote:
> As the cached assets have fallen out of our cache new attempts to
> fetch these binaries fail hard due to certificate expirty. It's hard

s/expirty/expiry/

With that typo fixed:

Reviewed-by: Thomas Huth <thuth@redhat.com>
