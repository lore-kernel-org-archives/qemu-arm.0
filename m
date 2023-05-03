Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2719690ejm;
        Wed, 3 May 2023 02:51:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ74rsirT+yZd3aLsXyM4wU8rDej/9fH+EW2t0+8ET5v0oCtOA+SOlkd9bxWrukbyOeHLte/
X-Received: by 2002:a05:6214:234a:b0:5f1:89ba:c0dd with SMTP id hu10-20020a056214234a00b005f189bac0ddmr9174025qvb.30.1683107503904;
        Wed, 03 May 2023 02:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683107503; cv=none;
        d=google.com; s=arc-20160816;
        b=AgUQan/lpyjdiUivruL7PJmRcC08SqgYQuKNGTxWNNwGDp8Dh3R3nHnHeiw/LQlB+a
         geHK+RXWtg6CvSBqE7WMAZMlfT7h4kwro1imwTEwmLrDoli3AfcW+1jz1m7H2p22uK0I
         dTnjXwXRjPIaW9ohqcQoBwH02+ANCOaXSeuLitbmk3E/8v4b+NzpstF0w7pCx+fVOHAZ
         INbXub5c72uTrEzvpRnXfA7mY/zCJdcddl1gicWCIKaEgLfKLKHnTDKNmq0Xkl1L2/ZZ
         ZpuOZdeQPzgbVjWbN1+E8FX4qliUT2EQ9uYUAvbCs+Y4MISPOQyws0YNJatrJc7rCD7x
         gPHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8C7eAF3BkV6fTbkBLLehxwlHzgJPLF8jk3ZWdlnriAc=;
        b=igas9NhgaxIiPo/Lbe8hG13UH3gwoSwuZ9dijGmn8/yiq2jLi4f9Q7BftpxJe/9oYW
         Jv+LyhEyn6lwmPzQ1ZikrKrSk8KBy3dZnxZnnpOi0laSdCDcAZcsc5R4qWWVB9Yt2Ok/
         OaB8hLE6h8TeSAr1GlDLYuBGHaUlpJRc+bK8sFwZPW7I8tSKXm/U9Gj5IjYa2a3cBZ4w
         sJhWIYyr3Ob7xA1n7kv5dcrzR9QqAok+kEihhf81QJwwDpcv9LAsrfOx4X1MAT5Gaxyp
         9Ma0O3kuBYkeNf271yAoL/NO6D6YLpuQ6asXyVte+qKvvaZqy+H6rj8cqlkW0VluGxvD
         fcGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OXDO8Zb6;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id gc14-20020a056214230e00b0060f7b695034si13776141qvb.426.2023.05.03.02.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:51:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OXDO8Zb6;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683107503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8C7eAF3BkV6fTbkBLLehxwlHzgJPLF8jk3ZWdlnriAc=;
	b=OXDO8Zb6X3abBu6geh7ZQZywQrzB7fn6JkfXctCH/Te48KrHVm2Vb+IdkYsB51BLml7QwL
	p7/rbQmLSuDWYlrg82146OviGBEzeBNLM0G1PUB3TZCrAWbXlbkrcbiehVnbbk1T+3MKr/
	dyB7j2ZwyglLOJAMGlylNKo6uBsc0RY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-m-AYQuwtOPq3ODhHcir5jw-1; Wed, 03 May 2023 05:51:42 -0400
X-MC-Unique: m-AYQuwtOPq3ODhHcir5jw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f321e60feaso16625005e9.0
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 02:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683107501; x=1685699501;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8C7eAF3BkV6fTbkBLLehxwlHzgJPLF8jk3ZWdlnriAc=;
        b=JFfsuRZQWh06hNfqg5KFB5MCDPYElEGB28hTNGeVqna5RCBAr8TEpyNqKzpNRMWToD
         aECEd3j1pjJ4bTP5PEOdbsI9suLotSFRIfShe4+9+Yy26g9GLrOGdK1zpik1st3MqR9O
         qyDHLmqwxqJTS3BwsbhhQw5eYXDMNJyztSGEF9IO9HFqPSbd9jW/yEWqeSP+1KhnHOK5
         Dk0IEFUOscCkiBm/eUqn30ahxdP8OTgkEu3jGe+GzHjfB8rGtv06/2W7C6RHafMdreaL
         M0M93DnGU6egr10YmwYhdJwz1464wUQ9SvSmVtu9d6WR6mIIKt/yBHG9YiwqlxtfSLAx
         alig==
X-Gm-Message-State: AC+VfDxKbGrTWK6bSqbBY/PHoeMwHzZ7AQmX5AJ1UB0x1xNKZElH+smp
	LilmQlrjvPCqzb1pa17fnqA+AknPy13NZjORlyfD51nZ9/4MwRA8R3H/BgfELgf5IKN9feP/xYp
	sAFl/DIXRCNT5fN3qD2tcP2MkxKFtOskq6EDFqX4gDO/m5ZetUZwX+ZQWSP1S2Xu7zaKecYMu
X-Received: by 2002:a05:600c:243:b0:3f0:7eda:c19f with SMTP id 3-20020a05600c024300b003f07edac19fmr14576599wmj.11.1683107501342;
        Wed, 03 May 2023 02:51:41 -0700 (PDT)
X-Received: by 2002:a05:600c:243:b0:3f0:7eda:c19f with SMTP id 3-20020a05600c024300b003f07edac19fmr14576543wmj.11.1683107500908;
        Wed, 03 May 2023 02:51:40 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4c82000000b003021288a56dsm32451125wrs.115.2023.05.03.02.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:51:40 -0700 (PDT)
Message-ID: <a4fe1cc0-aad3-c77e-5e05-b5e6e32d69bf@redhat.com>
Date: Wed, 3 May 2023 11:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
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
 <20230503091244.1450613-23-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 22/22] tests/qtest: skip bcm2835-test if no raspi3b model
In-Reply-To: <20230503091244.1450613-23-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: KlgBbAhnTaiA

On 03/05/2023 11.12, Alex Bennée wrote:
> We can't assume the machine exists and should gracefully skip the test
> if we haven't built the model. This is ostensibly fixed by
> db2237c459 (tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI)
> but I still hit it during my tests.

The problem is likely that you build aarch64-softmmu with the minimal 
config, but still keep arm-softmmu around with the full config? Then 
CONFIG_RASPI will still be set at the meson.build level since it is taken 
from config-all-devices.mak here.

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/bcm2835-dma-test.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/bcm2835-dma-test.c b/tests/qtest/bcm2835-dma-test.c
> index 8293d822b9..2e6245e9e2 100644
> --- a/tests/qtest/bcm2835-dma-test.c
> +++ b/tests/qtest/bcm2835-dma-test.c
> @@ -107,12 +107,11 @@ static void bcm2835_dma_test_interrupts(void)
>   
>   int main(int argc, char **argv)
>   {
> -    int ret;
>       g_test_init(&argc, &argv, NULL);
> -    qtest_add_func("/bcm2835/dma/test_interrupts",
> +    if (qtest_has_machine("raspi3b")) {
> +        qtest_add_func("/bcm2835/dma/test_interrupts",
>                      bcm2835_dma_test_interrupts);
> -    qtest_start("-machine raspi3b");
> -    ret = g_test_run();
> -    qtest_end();

Where did the qtest_end() go?

It's maybe cleaner if you move the qtest_start() and qtest_end() calls into 
the bcm2835_dma_test_interrupts() function instead.

  Thomas


> -    return ret;
> +        qtest_start("-machine raspi3b");
> +    }
> +    return g_test_run();
>   }
