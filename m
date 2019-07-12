Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp801588wrv;
        Fri, 12 Jul 2019 04:42:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGmX4yLsOjfXeEuFhZc2E/kfcy3XqGD0uYOT/uYGYr5ahOjAkEzvExzZYtLgMME6ugpbh7
X-Received: by 2002:a0c:8695:: with SMTP id 21mr6203378qvf.166.1562931733363;
        Fri, 12 Jul 2019 04:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562931733; cv=none;
        d=google.com; s=arc-20160816;
        b=TwXIJkEs8L0jfFmfIV4GS1EAngIpJeWYdL7fyGMRF7Tiu+9VombOOAr1BRkDY1noqx
         u5EhU1Gaqn1l85Teq9ZdXrcJbrHIzaGeoCiIWY7c/ji5H+EWPEQm7hwW+VfMJZbl4ZcV
         yCCzKXYY5Lu3j5I50CVAxIezng8ZP47DHIjlU050LmCgfXFWYU7hH95atbFAk5uzxsoM
         RZTrYk2tqEAQnAPyntNlPACb2456u3Wz3XnuTD8Zbc8sQt15036ax7zeuOik8kW2zdA3
         Uh9EL2zYIF+Zlyl7KN8QDZlWCc6Rr5FUWHdmXgtho1vBzD2DzDHnakKr8jx+uAj5lGB3
         Ad1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=RtTAsmYiKjo8503DePWq6dc5QCoibhQ814Ufc1IUnVo=;
        b=B9JxDHeo/kFHXJQtCKpAyR5fCx9j1q+7BiBUTwd6L16t8MMI7qZENXkBl4U6Rusysc
         nXlIZ256A8oDNKgTuZkV4SebhtzKr57PM3bQW7Gy/kn4TSC1aD5EnQ98wngZgovPZvY7
         D8WVA5hSepI6xXj4DW3UcEED11xTs/9shzJ8VUpr0m2Lg0bsUJwADnzUzleUMn8F/MeP
         6KxD7JOJ/xxkVxvAyWYCvj9KrwL0MyzhaIl5JAj0zBaf3i4ExKJYTjNHJxWqNhlxxH+s
         XxKmNeTY6JxtkKKNMdlH5WdFT10fb5h5d8qXrTn5sFEy+3CQT8Zlh0ezsR9GUVXAI1nc
         wSlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <dgilbert@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 8si5346679qtu.149.2019.07.12.04.42.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 04:42:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgilbert@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C5BA3082A49;
	Fri, 12 Jul 2019 11:42:12 +0000 (UTC)
Received: from work-vm (ovpn-117-214.ams2.redhat.com [10.36.117.214])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00D7719C4F;
	Fri, 12 Jul 2019 11:42:10 +0000 (UTC)
Date: Fri, 12 Jul 2019 12:42:08 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH  v1 5/7] tests/migration-test: don't spam the logs when
 we fail
Message-ID: <20190712114208.GH2730@work-vm>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
 <20190712111849.9006-6-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190712111849.9006-6-alex.bennee@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 12 Jul 2019 11:42:12 +0000 (UTC)
X-TUID: PLXCDnvoC/m/

* Alex Bennée (alex.bennee@linaro.org) wrote:
> Quite often the information about which test failed is hidden by the
> wall of repeated failures for each page. Stop outputting the error
> after 10 bad pages and just summarise the total damage at the end.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Yep, occasionally you do find you do want the full set to see what's
going on, but this is true most of the time.

With 10 you should be able to see if it's a single page that's wrong or
the flip gone wrong.

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

as Laurent says, the 'another' would need -10 but other than that:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> +    g_assert(bad == 0);
>  }
>  
>  static void cleanup(const char *filename)
> -- 
> 2.20.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
