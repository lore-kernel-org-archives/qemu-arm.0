Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1216840ejc;
        Fri, 25 Aug 2023 00:34:55 -0700 (PDT)
X-Received: by 2002:a5d:4ac2:0:b0:319:70c8:6e90 with SMTP id y2-20020a5d4ac2000000b0031970c86e90mr13162297wrs.24.1692948894836;
        Fri, 25 Aug 2023 00:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692948894; cv=none;
        d=google.com; s=arc-20160816;
        b=hX/sBQuVUIu/6Nkc5LxHuFpIgugnZ8+70OSwr/kpFUdIdWK1DhCVUWbO/v3aELcQgj
         3YjmnnW8jNf/oLYB+18M6FGLgVFwoueqNmbQjzBvDw3z7W1nCnXul0PgtWw6byzljoUV
         djj2MJBgG7arqtvLPtY9KBF4tUUHAubQiE2d/WIwj+iBP54SXI7o7evkScdHnwxkQ4wp
         8jXDJu61xM8RqPGcrHYk2Zmzlad5lkAJPyIY5Pe9J2AhG/prB9zKTLSxtDsmp1AmRk7u
         rtiKNutybzezdgr6KQRGCZuKyVHIjKWwcem71qQYpsyLi6xLEa29u2oMS0PUv1wDolUx
         vzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=84GmhXOl7P6Tk7mMSWYjKLpOgRyG/IkgrywMEq0AuUk=;
        fh=qmZ05mhLeMuz4yNBZ/q0UYaw6VXqQk8kLliJ08JnGGo=;
        b=l1dSXC3HPlJaO4ZHgwi2W3zlCVWyEr5QIg6G+o9aGx6ohLu7SlciUSAK+RGABZGPyJ
         X9NSWfrqmtbz8Ad0/AW+GycWkmvEVAqJZCwUnlpE3uCJTXLBJdkazr7kKhBrJna/oXlw
         kK8TvaH1n+4ZPXcPppQUjSyMnrxiRjOm4sDP5yPp3qneMcBWB/6kUkpCJ5cv2CP2ornX
         1yG/4ythgrtcXnP+zEY4khnh5biy1w9KNHB7XuKHj2m1oJncKuk0v4IHhFjExgc6pJyu
         BxzTAxwh+3rhuCTThFIXTFY34O26NlvRILvia3b6gTs5dqS8NVZlcNLD2EMgX0Gj/JmH
         RYrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fnZYXJFZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d1-20020adfa341000000b003175f00c81dsor395939wrb.1.2023.08.25.00.34.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Aug 2023 00:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fnZYXJFZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692948894; x=1693553694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84GmhXOl7P6Tk7mMSWYjKLpOgRyG/IkgrywMEq0AuUk=;
        b=fnZYXJFZ+iZzT0pD9y4Y5AxeQTDLt4kaiq2r0Li4pODObGYa8CBnHYmbEnuspCfuN8
         ZEAPoZ7rt6Fbi+JWP2e2n1jEU/RrIBwAkLmY+6tPGpOD2erhdxCAXblB5KaS2NNDXM0O
         4u4jyZGF+U8BJGXH66GQLx44wz/E8eAdxJwPAho0++c7JpsKuw2tluXGvF6i8eLangrD
         OkNCxJ6TKAkey+RFRDMmod9ZkYO5AIUX5QQyb4hnfYlBtUkhjuF4hgEvvheAd1bZq+I6
         5VLvZNZZKefhtlbkO50D5W8A6ccOGAVzlZ4pN8pI/tPE6drzu5F+C3sZIsF3p6Gfpr4w
         QbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692948894; x=1693553694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84GmhXOl7P6Tk7mMSWYjKLpOgRyG/IkgrywMEq0AuUk=;
        b=WsRio7f+2SGCnjmUAlvabfIoz6z7H5PEGMsTu8ravzxT1HCmOsxo/XRsTAISJ3Nokw
         Pwte5o/vh80IsWXfqjUqAwFcp/I9ITgVnRPL8tWrJeM7egoQ8gZ+acmVo2yW8+O58fMm
         v8orU7UKcwsMIS0xppnk+Qv4/fNKmjn8pDlzVwTtOgfEBI//lptjao6rj3HTsc9m2QYZ
         qkPBSeHw9+leLtRj2huEmloKITGoOSjhAg/cAjMXV/ykTyEVfJOqjTQWVQESQWNexBGf
         Xy3J3LihznlDwp7RuVOo9COAyJL/BWGugp2kS2f2nwciIEBQBQzKogZlC6ccbz5qy8iV
         oiNw==
X-Gm-Message-State: AOJu0YyZVLm9MVe+S9gJTVpDHp4odlPsbJRscUyUqZt5U8elUnfvW6Ig
	SPXc6jZoSGcJU59FwFljKhlF5yLi9sU0AiVz3q0Ypg==
X-Google-Smtp-Source: AGHT+IHJQWvqtmIX6rw9zSWT7Mz7ZWbY0SwY0jn6OhQVKUY6bqD7Q3h1UVv4qxsdl9fRAbdh4KRdag==
X-Received: by 2002:a5d:4950:0:b0:314:314e:fdda with SMTP id r16-20020a5d4950000000b00314314efddamr14952323wrs.23.1692948894034;
        Fri, 25 Aug 2023 00:34:54 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.164.69.26])
        by smtp.gmail.com with ESMTPSA id n5-20020a5d4205000000b00317ddccb0d1sm1392619wrq.24.2023.08.25.00.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:34:52 -0700 (PDT)
Message-ID: <02012ce4-db06-cacc-6e70-f5bd3108362e@linaro.org>
Date: Fri, 25 Aug 2023 09:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 12/12] gdbstub: move comment for
 gdb_register_coprocessor
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-s390x@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230824163910.1737079-1-alex.bennee@linaro.org>
 <20230824163910.1737079-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230824163910.1737079-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lbTS2QcJz/oj

On 24/8/23 18:39, Alex Bennée wrote:
> Use proper kdoc style comments for this API function.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/exec/gdbstub.h | 10 ++++++++++
>   gdbstub/gdbstub.c      |  6 ------
>   2 files changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
