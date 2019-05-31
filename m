Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp856261pjq;
        Fri, 31 May 2019 09:19:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIwhhNhtA6VcMNJeD4wRxnEugm4OgcfGrt2Cs8bO2p507/AqM6qAb/ZrfT8DxC3SDNQgqz
X-Received: by 2002:a17:906:7541:: with SMTP id a1mr10060122ejn.50.1559319581373;
        Fri, 31 May 2019 09:19:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559319581; cv=pass;
        d=google.com; s=arc-20160816;
        b=QbhteP3u5cIzgNNqH4oytCx7g4RR+cBhRloHYXC7yBPo9VbTK4coVW/nQmS19v3F42
         l7EDuL5NRL4jxsZjTHJ5ueLfCuynQIE8yIHq+YJMmrhoslyzYpwUKS0czPNNasGktDw/
         eHlEnGctjURzr9uXep/r+TK06uT48TH2cH2kld5Im8+lJQvYWEohIW2yYXM0e91egSFg
         zipPzylPc53enq51l4hjl+JEmTz7CiDSu4ErJrWnd7OpAQaCg98oJnhn23bS6dD2h/nL
         jFa+lN4S4fFNs7Kvf6izd0Mcui6/rPZHcok63jGMKbsSIP/UgkcC+Gmq/tRAFR2SVzTQ
         M6Dw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:reply-to:subject:in-reply-to;
        bh=SkWGZBZ9BhVLu8XbGCUPtzKgVXcBVtFAfQFg6VZ+Udw=;
        b=D//5NUS53BqFgFPTrS0ZGt+liOePX/cZDfpqTV3zppF+DzkGXirunRLEVk3J0/xt6+
         QkVWd60AhIQZTAXxuZnV9c76HZw09IKUgUJDNdTOKuWYJvn8HnJQE473H8bktfmWsW2c
         hg1yWojY+/v7LXcx8luAzP1+SnF12SzQX09RZkt3tczzZr47RivlrEynXLV1suE8s9gj
         9drbHE4gAEHtr/mcz8DrTjPot+Q85zolJASXxpzm0GMVtQIem9eThmJW0Aa5WE2X21hl
         XNxXSGH65nMnIA5448hrzbfcOkuPXyKOpEuqaU3KBU2RwlYy4UiRLjW4Qb01i9xSQtr6
         R8Vg==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 135.84.80.217 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com. [135.84.80.217])
        by mx.google.com with ESMTPS id k48si755645eda.20.2019.05.31.09.19.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 09:19:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 135.84.80.217 as permitted sender) client-ip=135.84.80.217;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 135.84.80.217 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1559319513; cv=none; 
	d=zoho.com; s=zohoarc; 
	b=aJyyMOcFE5frvCiTWTIdcWj5jz+fQkE8Z0R77B1hcEaIJg0lrcUCu7aDckxIo1SEQDc7czqqJHDR0d+1UBuTNxBD2iqYlIUO3l3wGfPUsRH3vFhWrb8+povjSwtokVzVRJfIDI4pctqKlyKZ2FmVQuu0TLt8VqIyv1ATe5ECdAo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
	t=1559319513; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results; 
	bh=SkWGZBZ9BhVLu8XbGCUPtzKgVXcBVtFAfQFg6VZ+Udw=; 
	b=fYSzd8m0prcBtgR97bYxOX174UFzFIx1LdslAX8jTJCyGB1fqv8wUvdVnagZwi9QBIw8o8adTH0OLIT3maTGMRHNYYfB4J9GtpPHeCBGk440PX7uGeR7/VNwgaIv5lW+uCmAiQtV/O+kw7rE5Brihp7OCykV/b1Apuym9Di9AP4=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 155931951101099.43089206900481; Fri, 31 May 2019 09:18:31 -0700 (PDT)
In-Reply-To: <20190531154735.20809-1-philmd@redhat.com>
Subject: Re: [Qemu-devel] [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING disabled
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <155931950942.4137.194678647486612190@ce79690b2cb9>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, arikalo@wavecomp.com, philmd@redhat.com, richard.henderson@linaro.org, qemu-arm@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com, mrezanin@redhat.com, alex.bennee@linaro.org, aurelien@aurel32.net
Date: Fri, 31 May 2019 09:18:31 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: dCiwZuqEg0jG

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDUzMTE1NDczNS4yMDgw
OS0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1JGQyBQQVRDSCAwLzJdIHRhcmdldDog
QnVpbGQgd2l0aCBDT05GSUdfU0VNSUhPU1RJTkcgZGlzYWJsZWQKVHlwZTogc2VyaWVzCk1lc3Nh
Z2UtaWQ6IDIwMTkwNTMxMTU0NzM1LjIwODA5LTEtcGhpbG1kQHJlZGhhdC5jb20KCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9u
dWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5h
bGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFz
ZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRj
aGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICAgICAgICBwYXRjaGV3LzIwMTkw
NTMxMTU0NzM1LjIwODA5LTEtcGhpbG1kQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDE5MDUzMTE1
NDczNS4yMDgwOS0xLXBoaWxtZEByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAn
dGVzdCcKMzAzZmJjODExZiB0YXJnZXQvbWlwczogQWRkIHN0dWJzIHRvIGJ1aWxkIHdpdGggQ09O
RklHX1NFTUlIT1NUSU5HIGRpc2FibGVkCmFhZDFiZDg1ZTEgdGFyZ2V0L2FybTogQWRkIHN0dWJz
IHRvIGJ1aWxkIHdpdGggQ09ORklHX1NFTUlIT1NUSU5HIGRpc2FibGVkCgo9PT0gT1VUUFVUIEJF
R0lOID09PQoxLzIgQ2hlY2tpbmcgY29tbWl0IGFhZDFiZDg1ZTFlNSAodGFyZ2V0L2FybTogQWRk
IHN0dWJzIHRvIGJ1aWxkIHdpdGggQ09ORklHX1NFTUlIT1NUSU5HIGRpc2FibGVkKQpXQVJOSU5H
OiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQg
dXBkYXRpbmc/CiM0MDogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cgp0b3RhbDogMCBlcnJvcnMsIDEg
d2FybmluZ3MsIDI3IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvMiBoYXMgc3R5bGUgcHJvYmxlbXMs
IHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2
ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5U
QUlORVJTLgoyLzIgQ2hlY2tpbmcgY29tbWl0IDMwM2ZiYzgxMWYyNCAodGFyZ2V0L21pcHM6IEFk
ZCBzdHVicyB0byBidWlsZCB3aXRoIENPTkZJR19TRU1JSE9TVElORyBkaXNhYmxlZCkKV0FSTklO
RzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVk
IHVwZGF0aW5nPwojNDA6IApuZXcgZmlsZSBtb2RlIDEwMDY0NAoKRVJST1I6IGV4dGVybnMgc2hv
dWxkIGJlIGF2b2lkZWQgaW4gLmMgZmlsZXMKIzYyOiBGSUxFOiB0YXJnZXQvbWlwcy9taXBzLXNl
bWktc3R1YnMuYzoxODoKK2V4dGVybiB2b2lkIGhlbHBlcl9kb19zZW1paG9zdGluZyhDUFVNSVBT
U3RhdGUgKmVudik7Cgp0b3RhbDogMSBlcnJvcnMsIDEgd2FybmluZ3MsIDMwIGxpbmVzIGNoZWNr
ZWQKClBhdGNoIDIvMiBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkg
b2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1h
aW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQg
PT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBh
dmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTA1MzExNTQ3MzUuMjA4MDkt
MS1waGlsbWRAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=
