Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp782227wrv;
        Fri, 12 Jul 2019 04:23:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwmxfx2Xgv6t+jt2hwdbQxibFLrkFFy+qFrZVGa/yfH/r14r5gkAiIp+0EmaI1APM8+Q1mL
X-Received: by 2002:a0c:ad76:: with SMTP id v51mr6306449qvc.232.1562930623541;
        Fri, 12 Jul 2019 04:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562930623; cv=none;
        d=google.com; s=arc-20160816;
        b=jrWeygOSLse2EbKPwhhmCe40kEKl+j65oIkzDSZmTd1fj72wzYeOZ4aHEcRoDjVekv
         j5ALvCA5Y6N1ZcTNJ7mL8yPc9CWbyh9prm5UcOlAx3Ipw3yhBgvvdQJpAZj/v03NW9JH
         9EVuBgLXOnvm7/MR5SblOlHHnwyvsn54Mghau9vZ7I0ogj5bPMtrz3Af3fjPVAhcWSIb
         OCVGDELN6AVAiAtg2Cor9eODRbkvsO18OecoBZnlo2NPJ2P4Ko9/YJ6wfhwj0WcieoR0
         cQgscru5ZKN8kriRR7ovuJvDIa3AWtlEy/1z1cXXQ4HqjCUPGKTpYOINUKFWQTqnrN1L
         voTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:cc:to:subject;
        bh=3G+i4PzdrAdVttW06b+WUVZYZE2Dn9A32XKwfOIaKQY=;
        b=YtZXKUHJ1y67b3GfbGzxPOa2nl5NSW2Usbu2flseVIYbawokwZR8JtovTis7U8fKSs
         ekc8ZTQbNi10fB8gZbLvSNE0BLGrONlsP6VDAYOmrjXX2A/tagH/70ZMgvLY2SM41/5k
         ISPhGt9+PvEH5ac4Ej7oDUgGGUuBTpsdxKFJmdaQpU1paWHhl2XYlXBTvXHH+kzxRMqQ
         z+V03+P82xZiuMqJwdBGi1q1OVOLANZzfBzU06B0EP0nbIX5qSD5J4una4+kz12E8Nge
         iiua7kAoCRRBMoeIVER50zn1aaewwtYZs8LrfEkoPHpgKRsHKL2X4sQ8TiELyDohRCxS
         8nbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t64si4803625qke.110.2019.07.12.04.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 04:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E6BF3083391;
	Fri, 12 Jul 2019 11:23:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-202.ams2.redhat.com [10.36.117.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 811AB60BFB;
	Fri, 12 Jul 2019 11:23:40 +0000 (UTC)
Subject: Re: [PATCH v1 5/7] tests/migration-test: don't spam the logs when we
 fail
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
 <20190712111849.9006-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
 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
Organization: Red Hat
Message-ID: <52bd9e31-7248-2f91-e876-5ae337508d20@redhat.com>
Date: Fri, 12 Jul 2019 13:23:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190712111849.9006-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 12 Jul 2019 11:23:42 +0000 (UTC)
X-TUID: gL3D4bbo5KVh

On 12/07/2019 13.18, Alex Bennée wrote:
> Quite often the information about which test failed is hidden by the
> wall of repeated failures for each page. Stop outputting the error
> after 10 bad pages and just summarise the total damage at the end.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/migration-test.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/migration-test.c b/tests/migration-test.c
> index b6434628e1c..ce041f80c2a 100644
> --- a/tests/migration-test.c
> +++ b/tests/migration-test.c
> @@ -308,7 +308,7 @@ static void check_guests_ram(QTestState *who)
>      uint8_t first_byte;
>      uint8_t last_byte;
>      bool hit_edge = false;
> -    bool bad = false;
> +    int bad = 0;
>  
>      qtest_memread(who, start_address, &first_byte, 1);
>      last_byte = first_byte;
> @@ -327,15 +327,20 @@ static void check_guests_ram(QTestState *who)
>                  hit_edge = true;
>                  last_byte = b;
>              } else {
> -                fprintf(stderr, "Memory content inconsistency at %x"
> -                                " first_byte = %x last_byte = %x current = %x"
> -                                " hit_edge = %x\n",
> -                                address, first_byte, last_byte, b, hit_edge);
> -                bad = true;
> +                bad++;
> +                if (bad <= 10) {
> +                    fprintf(stderr, "Memory content inconsistency at %x"
> +                            " first_byte = %x last_byte = %x current = %x"
> +                            " hit_edge = %x\n",
> +                            address, first_byte, last_byte, b, hit_edge);
> +                }
>              }
>          }
>      }
> -    g_assert_false(bad);
> +    if (bad >= 10) {
> +        fprintf(stderr, "and in another %d pages", bad);
> +    }
> +    g_assert(bad == 0);
>  }
>  
>  static void cleanup(const char *filename)

Good idea.

Reviewed-by: Thomas Huth <thuth@redhat.com>
