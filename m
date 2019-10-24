Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2670308wrq;
        Thu, 24 Oct 2019 10:44:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5BfWVIIp6f9fVDGbm7oUkmptGmqo44YTuyEa17RNNvrbeYS7LETkoIAhOlWwS8OdMOm+O
X-Received: by 2002:a50:ac2c:: with SMTP id v41mr30479593edc.11.1571939050469;
        Thu, 24 Oct 2019 10:44:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571939050; cv=pass;
        d=google.com; s=arc-20160816;
        b=yicSc60EZsbKYINToWrwhRge5Ueu+7fO1Mp9e5iTUaPJM3P/oQ+7JX4t12b5ftSKi3
         dbyAkpLl8SSnQc6h5TtUwRFSwiZLjimeE+9zXD7xfUZSAPTd+vTJRG0pssNfAvWTn9Kk
         BLNRIAwRyETZ9/tcJp/cXGxlv6ZU3rD88Ag8y/5Q+G5NexEzZwJvvSRuxRcWOy4MENG6
         hK8Q/+4jY8RUcAVkbl9vOWYfAfnpy8RSZiUsGm8J+h0gjz3rMgr4U+ISDJSEE2qqRkBk
         Zihoq3QXFsXME3I100Ufe+4fVbC1VR2x9LEb1HUgYfX0C7EZEEC5+hCqpoN5kDDavGEE
         VPkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:subject:reply-to:in-reply-to;
        bh=4Rk43Y9w57kJAvGVSvrB0RJmDJrtaweEh771DHro3Bc=;
        b=0485owqNL7iWtQ2/5g+uzpgUntYPJhWIXyzqOMp/dn4yntDdBDr0lnDFkYZMLt4xrD
         k7eYW7B7Bry8Prun0+nftaDRLowhGvfvvlxcOTmpc16r2s5ScuiFeVXpRyLn1cKfDvJe
         eInqD7bnpzhfwiDIjmuTizai/Swj2RJFSpcmJadSudgDr2f66VxR7j6DG0oeoogXq5+p
         tT7wTRHwS85tGbkG4dHTVT214MM7qbHBKKEBC3/ew7u3cNkJVR5CZR/c43Qx2THbGGYO
         +z3o1Z/fzPx7GK4fhqnCunLnhfVT70IJahFRDPiFoIP2wsORbrrIkR+o0ylkberoEO+z
         fRbg==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com. [136.143.188.54])
        by mx.google.com with ESMTPS id b49si8143609eda.312.2019.10.24.10.44.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 10:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) client-ip=136.143.188.54;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1571939032; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q1uMC9cdjAg5k6jPzI8re46jIBo+MJ+BvtuuLGutUprjTUg78ENdK6jfV6fYnZRDsvxBU8o0SEtQqpzGnGuh9zRK+wizPUt6D4EA1IqyfpL9L+6CXo6YDBH9TPNCIwwJIjDsRPrmAuh/WaWD68iBGdeHShjqy1wpYopUHu0mlCk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1571939032; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=4Rk43Y9w57kJAvGVSvrB0RJmDJrtaweEh771DHro3Bc=; 
	b=hzjtnrnOaqgDL/SGJU+pqxKXrtfN299Fer7a+z+MsrlLT4jSfaIpGcMp9Ms+cGpb20CAQxwV5iJARwCHUps2EekIGXB/xETc+59g7PX4eUu4oCxuiM+svLT99gkRNvaCovPzTEJB4+YLPhOFhrRC7hS0rV+5HXTF5SuYaY+JYP0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1571939030276913.0451988225368; Thu, 24 Oct 2019 10:43:50 -0700 (PDT)
In-Reply-To: <20191023192640.13125-1-keithp@keithp.com>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] Semihost SYS_READC implementation (v3)
Message-ID: <157193902885.8606.12537127027528133435@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: keithp@keithp.com
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, keithp@keithp.com, riku.voipio@iki.fi, laurent@vivier.eu, qemu-arm@nongnu.org, pbonzini@redhat.com, alex.bennee@linaro.org
Date: Thu, 24 Oct 2019 10:43:50 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: pSVzx7BsM44A

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTAyMzE5MjY0MC4xMzEy
NS0xLWtlaXRocEBrZWl0aHAuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLW1pbmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21t
YW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVk
LCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojISAvYmluL2Jhc2gKZXhwb3J0IEFSQ0g9eDg2XzY0Cm1ha2UgZG9ja2VyLWlt
YWdlLWZlZG9yYSBWPTEgTkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1taW5nd0BmZWRv
cmEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgQ0MgICAgICBhYXJj
aDY0LXNvZnRtbXUvdGFyZ2V0L2FybS90cmFuc2xhdGUtc3ZlLm8KLi4vdmwubzogSW4gZnVuY3Rp
b24gYHFlbXVfbWFpbic6Ci90bXAvcWVtdS10ZXN0L3NyYy92bC5jOjQzODU6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYHFlbXVfc2VtaWhvc3RpbmdfY29uc29sZV9pbml0Jwpjb2xsZWN0MjogZXJy
b3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMKbWFrZVsxXTogKioqIFtNYWtlZmlsZToyMDY6
IHFlbXUtc3lzdGVtLXg4Nl82NHcuZXhlXSBFcnJvciAxCm1ha2U6ICoqKiBbTWFrZWZpbGU6NDgy
OiB4ODZfNjQtc29mdG1tdS9hbGxdIEVycm9yIDIKbWFrZTogKioqIFdhaXRpbmcgZm9yIHVuZmlu
aXNoZWQgam9icy4uLi4KICBMSU5LICAgIGFhcmNoNjQtc29mdG1tdS9xZW11LXN5c3RlbS1hYXJj
aDY0dy5leGUKICBHRU4gICAgIGFhcmNoNjQtc29mdG1tdS9xZW11LXN5c3RlbS1hYXJjaDY0LmV4
ZQotLS0KICAgIHJhaXNlIENhbGxlZFByb2Nlc3NFcnJvcihyZXRjb2RlLCBjbWQpCnN1YnByb2Nl
c3MuQ2FsbGVkUHJvY2Vzc0Vycm9yOiBDb21tYW5kICdbJ3N1ZG8nLCAnLW4nLCAnZG9ja2VyJywg
J3J1bicsICctLWxhYmVsJywgJ2NvbS5xZW11Lmluc3RhbmNlLnV1aWQ9MjA3NTUzMmVhMGExNGNk
MjliZWNiOGUxMTA0Njk3OWYnLCAnLXUnLCAnMTAwMycsICctLXNlY3VyaXR5LW9wdCcsICdzZWNj
b21wPXVuY29uZmluZWQnLCAnLS1ybScsICctZScsICdUQVJHRVRfTElTVD0nLCAnLWUnLCAnRVhU
UkFfQ09ORklHVVJFX09QVFM9JywgJy1lJywgJ1Y9JywgJy1lJywgJ0o9MTQnLCAnLWUnLCAnREVC
VUc9JywgJy1lJywgJ1NIT1dfRU5WPScsICctZScsICdDQ0FDSEVfRElSPS92YXIvdG1wL2NjYWNo
ZScsICctdicsICcvaG9tZS9wYXRjaGV3Mi8uY2FjaGUvcWVtdS1kb2NrZXItY2NhY2hlOi92YXIv
dG1wL2NjYWNoZTp6JywgJy12JywgJy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC02MmNnYzl4
eS9zcmMvZG9ja2VyLXNyYy4yMDE5LTEwLTI0LTEzLjQwLjM1LjIzMzg5Oi92YXIvdG1wL3FlbXU6
eixybycsICdxZW11OmZlZG9yYScsICcvdmFyL3RtcC9xZW11L3J1bicsICd0ZXN0LW1pbmd3J10n
IHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDIuCmZpbHRlcj0tLWZpbHRlcj1sYWJlbD1j
b20ucWVtdS5pbnN0YW5jZS51dWlkPTIwNzU1MzJlYTBhMTRjZDI5YmVjYjhlMTEwNDY5NzlmCm1h
a2VbMV06ICoqKiBbZG9ja2VyLXJ1bl0gRXJyb3IgMQptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9y
eSBgL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLTYyY2djOXh5L3NyYycKbWFrZTogKioqIFtk
b2NrZXItcnVuLXRlc3QtbWluZ3dAZmVkb3JhXSBFcnJvciAyCgpyZWFsICAgIDNtMTQuNDE5cwp1
c2VyICAgIDBtNy4wNTZzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0
Y2hldy5vcmcvbG9ncy8yMDE5MTAyMzE5MjY0MC4xMzEyNS0xLWtlaXRocEBrZWl0aHAuY29tL3Rl
c3RpbmcuZG9ja2VyLW1pbmd3QGZlZG9yYS8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJh
dGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVh
c2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==
