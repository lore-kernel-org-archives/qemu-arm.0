Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2659973wrq;
        Thu, 24 Oct 2019 10:34:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqysreEgvCum5Npv6AmlXc/pILwfLfR0r0ieVEMj6eZedAfIbh2KTxJDw46oX9bJ97sk1y4J
X-Received: by 2002:aa7:c502:: with SMTP id o2mr5798103edq.223.1571938447472;
        Thu, 24 Oct 2019 10:34:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571938447; cv=pass;
        d=google.com; s=arc-20160816;
        b=MIciCfJWPgR8snCjrz6/A1GhA98XrEOQfejqh6PtguXamhtBTmRFHtrzb3yKZ58B53
         6GDSRL8cgNScYTmYIqpIUL+C0UaCVpDApuhLmCmIfGUx7eIh2rTzDM7d9S+YMOMCUn51
         uJzkG1LbtxPbEVJr3Kdgw0SXDNw1wwDOYnUaCAE9ZnZy22UlexXwPZZszRWldYr94GMD
         OGvmvIle4cb1bB9DSYJhZMgpgQ8EVfNSLsuGELZQmxuJQruqDai5DlBqtXzY6aFQUk/m
         qIH+fRo/3tPpNHk4sCE0r6o1LXwRfm+zn6ZlGbXAii0LfH/aUhV0iBjx5s69Uc1DPj2M
         ddUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:subject:reply-to:in-reply-to;
        bh=1xJHYBv5Uzib9/Fel0PYb7LqVDB8tn5oBzjjqNPX1nA=;
        b=E5UZhpAw+toLlhUM+pss1aGsN2SeN1gtsKuynDnu4QXOAgBvl0l2GviK1hKWDOH7kC
         xJkvopPoNjzTlyyqWc4P/AedyK6RGeRywOyjcqsP5GPgUxGCv4vWcVVkgentLf+oJPkX
         0RUzGc6OTYwI578o+thLnNQI0Ru4d+X7OiLhq7N8E03Ab6xSwd+tA/OgyWZA3LOBMeAS
         RN20f+DM2iBeB2UrbiuMwQcCGZV/ufri6iCvZhMJ1mjqfsDWzqdlmtgip2LkccRuJe5h
         PehNhBUp75Eei6S5ySzbk8smzbbF+8r3DuxJ4exLzrT3uc989JannGoakugS/Kl9M8fs
         kUbw==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com. [136.143.188.54])
        by mx.google.com with ESMTPS id l12si20746332edk.444.2019.10.24.10.34.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 10:34:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) client-ip=136.143.188.54;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1571938419; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l3vnN05vmMPjFEf0SNNVk/nO2jd1B9Hy9AuzUC0lQkh0hrqX0GtLiK3OHhh+1euvgbu+O1iO3oB1DDrxqm+YzDjvXNCEn3g32fodAF7IrI7qVs4QmhZNq8NJ6t4CHAu8IhDwnc/ws1AgrYM9OYGdZQJdSxK1cqA+tHHFyVxpJus=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1571938419; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=1xJHYBv5Uzib9/Fel0PYb7LqVDB8tn5oBzjjqNPX1nA=; 
	b=nM3SU8EOdPzzW68bK/StMFODrdIAFRmMAdEmqxTYjtPI9KA52Pz9H8COJEcADytw/xXdHPM9P8m+xcbAVMKoG/kkfcL43W36fou5+bSqsPcR1ac/s7oYgyT5TXupkA0kzKL7mzsahhh3JWXBhgVpGMwVreMzJWfWpu9w7q6xFqg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1571938415658556.4208570396182; Thu, 24 Oct 2019 10:33:35 -0700 (PDT)
In-Reply-To: <20191023192640.13125-1-keithp@keithp.com>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] Semihost SYS_READC implementation (v3)
Message-ID: <157193841432.8331.7323182040062540268@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: keithp@keithp.com
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, keithp@keithp.com, riku.voipio@iki.fi, laurent@vivier.eu, qemu-arm@nongnu.org, pbonzini@redhat.com, alex.bennee@linaro.org
Date: Thu, 24 Oct 2019 10:33:35 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: vNKTRTA0d65H

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTAyMzE5MjY0MC4xMzEy
NS0xLWtlaXRocEBrZWl0aHAuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29t
bWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxl
ZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBWPTEgTkVU
V09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5WPTEgSj0x
NCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgQ0MgICAgICBhYXJjaDY0LXNv
ZnRtbXUvdGFyZ2V0L2FybS90cmFuc2xhdGUtc3ZlLm8KLi4vdmwubzogSW4gZnVuY3Rpb24gYG1h
aW4nOgovdG1wL3FlbXUtdGVzdC9zcmMvdmwuYzo0Mzg1OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBxZW11X3NlbWlob3N0aW5nX2NvbnNvbGVfaW5pdCcKY29sbGVjdDI6IGVycm9yOiBsZCByZXR1
cm5lZCAxIGV4aXQgc3RhdHVzCm1ha2VbMV06ICoqKiBbcWVtdS1zeXN0ZW0teDg2XzY0XSBFcnJv
ciAxCm1ha2U6ICoqKiBbeDg2XzY0LXNvZnRtbXUvYWxsXSBFcnJvciAyCm1ha2U6ICoqKiBXYWl0
aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCiAgTElOSyAgICBhYXJjaDY0LXNvZnRtbXUvcWVt
dS1zeXN0ZW0tYWFyY2g2NApUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Ci0tLQog
ICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkKc3VicHJvY2Vzcy5DYWxs
ZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snc3VkbycsICctbicsICdkb2NrZXInLCAncnVuJywg
Jy0tbGFiZWwnLCAnY29tLnFlbXUuaW5zdGFuY2UudXVpZD0zYzgyZDM3MDk5NmY0MjliYjRiZTdm
ZWY1NmU3MjQ3YicsICctdScsICcxMDAxJywgJy0tc2VjdXJpdHktb3B0JywgJ3NlY2NvbXA9dW5j
b25maW5lZCcsICctLXJtJywgJy1lJywgJ1RBUkdFVF9MSVNUPScsICctZScsICdFWFRSQV9DT05G
SUdVUkVfT1BUUz0nLCAnLWUnLCAnVj0nLCAnLWUnLCAnSj0xNCcsICctZScsICdERUJVRz0nLCAn
LWUnLCAnU0hPV19FTlY9MScsICctZScsICdDQ0FDSEVfRElSPS92YXIvdG1wL2NjYWNoZScsICct
dicsICcvaG9tZS9wYXRjaGV3Ly5jYWNoZS9xZW11LWRvY2tlci1jY2FjaGU6L3Zhci90bXAvY2Nh
Y2hlOnonLCAnLXYnLCAnL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLW5qdTZrd3hpL3NyYy9k
b2NrZXItc3JjLjIwMTktMTAtMjQtMTMuMjkuMzMuMjQyMDU6L3Zhci90bXAvcWVtdTp6LHJvJywg
J3FlbXU6Y2VudG9zNycsICcvdmFyL3RtcC9xZW11L3J1bicsICd0ZXN0LXF1aWNrJ10nIHJldHVy
bmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDIuCmZpbHRlcj0tLWZpbHRlcj1sYWJlbD1jb20ucWVt
dS5pbnN0YW5jZS51dWlkPTNjODJkMzcwOTk2ZjQyOWJiNGJlN2ZlZjU2ZTcyNDdiCm1ha2VbMV06
ICoqKiBbZG9ja2VyLXJ1bl0gRXJyb3IgMQptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSBgL3Zh
ci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLW5qdTZrd3hpL3NyYycKbWFrZTogKioqIFtkb2NrZXIt
cnVuLXRlc3QtcXVpY2tAY2VudG9zN10gRXJyb3IgMgoKcmVhbCAgICAzbTUyLjQ2NHMKdXNlciAg
ICAwbTguNDY0cwoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcu
b3JnL2xvZ3MvMjAxOTEwMjMxOTI2NDAuMTMxMjUtMS1rZWl0aHBAa2VpdGhwLmNvbS90ZXN0aW5n
LmRvY2tlci1xdWlja0BjZW50b3M3Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQg
YXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBz
ZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t
