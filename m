Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp781444wrv;
        Fri, 12 Jul 2019 04:22:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVEtz6G6oJOGXc4sjrCgcxso/qDwwXaheluzSuWEAoRd+A2so1DhXCdXd2/Qgupk7D9v58
X-Received: by 2002:a37:9dc8:: with SMTP id g191mr5798163qke.431.1562930576456;
        Fri, 12 Jul 2019 04:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562930576; cv=none;
        d=google.com; s=arc-20160816;
        b=HzbQNeVnDgiH03C+dIl0c3C1iNWD6ZE2g4ylQoebNTT0T2aJI5axQFHI8/nGl+3nrK
         wc5O7SFk4XOOG4R9qd/OBA7q1pKLt6EZjG1dxOdbo8Hsd3uPcmIWi7rRLdx1907l2LA9
         OstjRbHGspmni7F83REO3V3RJoKMvQI5OCe2dTg5ROmBxdsUBNb1ikkegfGJ05mV67tP
         uNcfd1AOABpHU2uZEX7x70G0EIdBOeJ1JtelN4WTqP7TalF4APBk/VCJwpE8Ezk+dhkg
         qiD/N9C4ZPQ0N5KDmDYQZA1/X9gyKk5xPbBjKLvHkZn05nRKO6yRXj5YWO9c7lFelNO6
         Shag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject;
        bh=qU/x560Q6YRtolbDSCs4QjJjFeg58kf5WT9dn+UM/a0=;
        b=NF6WKUpGt3FHkpi8ap8QJmlcoKQnVyAGRtQjrj6ZekOGEqryhUTNgW4qUSNfnD/h2K
         nDwAk/slg0Ryy/Z+Vqo+B2k9VdtybjBE2IapwVJaolWv0M/nozdLI2mX4HTN6fpRVNiz
         mgko90Nt4ShoAW8atplpT5huAGBUD1LuKJ7USRjRrKncEz4KZMVBp+yYkXzoxBwNVnPX
         VbARSXz8wIwfyhBQ2VWlbiTZEj4HARmD0zWMhd3FP74G8AbUSXrKbSNNPyFIzDBE7zVd
         57jPMU+FTtpCkyJnRYkrIP0jA6uyRyWSasgdNZaW3BdVfES1KCWWcPSUUXdQCBbsd46D
         0TyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lvivier@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lvivier@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lvivier@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d54si5273076qtk.13.2019.07.12.04.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 04:22:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of lvivier@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lvivier@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lvivier@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96B9785543;
	Fri, 12 Jul 2019 11:22:55 +0000 (UTC)
Received: from [10.36.116.109] (ovpn-116-109.ams2.redhat.com [10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B524419C4F;
	Fri, 12 Jul 2019 11:22:53 +0000 (UTC)
Subject: Re: [PATCH v1 5/7] tests/migration-test: don't spam the logs when we
 fail
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
 <20190712111849.9006-6-alex.bennee@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=lvivier@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a8137849-8d9c-bd87-523f-f2c7cdfa013c@redhat.com>
Date: Fri, 12 Jul 2019 13:22:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190712111849.9006-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Fri, 12 Jul 2019 11:22:55 +0000 (UTC)
X-TUID: BQvhuKMMk0nS

On 12/07/2019 13:18, Alex Bennée wrote:
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

"bad - 10" as you have already displayed 10 errors.

Thanks,
Laurent
