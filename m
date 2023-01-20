Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1137778ejc;
        Fri, 20 Jan 2023 06:57:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtWD8qQegV4i3H/MueeTzYcwCQvAfU3EWap5TJmwJB7MrdzHtj66H6Abx9wEmK+Ekz+CzCt
X-Received: by 2002:a5d:6b09:0:b0:2be:110d:5d59 with SMTP id v9-20020a5d6b09000000b002be110d5d59mr12204237wrw.51.1674226626954;
        Fri, 20 Jan 2023 06:57:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674226626; cv=none;
        d=google.com; s=arc-20160816;
        b=Qh1+uniqlUj2kbOTJqZCQKw2Hiq7dRAwGNY9JX72ZwDT05K+LtxyjI3RXgcUUmkuwC
         VBUEQJmHeyb0+PfLqZK6TqXlK6fpjD/I/RHgeVb7TrT8wAUnbDEldF0WcPnaTIYGSbRk
         KbvsREpOj4Ysr5AVUmwHxeMZNz4H2OnkP7aER1739LfTK1/wyj1M2GXRSvD6CHxSmkGs
         QQeqUjGVpRjnentgAH+rXhQnYppTKkD67N2WcYWHsZ7nyj/pfNOgCcopF9zEmerfmVo5
         WwqsJVWnqrf8u9hzCpHlrvK2453gf7vQ8978g+nQ2rwHsjAh+C+JRZKofH6MtyS7lO8C
         uqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=qitVvuTR0tOIWL64dO40rqYkGVVNlOp0955q296y15Q=;
        b=QuJ3+OWIjO40Th3F1WzCC0lbK+F1RRz93jBn/L02v95Nk7NnmXLFliWImJ4j0na/un
         eCy4zIUTeSqsVTeNvs5F95VEJlYJg1TwNDtlpnQ7KXMROigPWEp6UlLBymWrvgjQMVG6
         NGGBX/FnTWQ3zCi76KaPGkd9fFxf2kwt/VTA+7Ydspq3vakzXIjhjXmlNuiwQu223q5H
         unfleofaubuzqNGJLw9mQTxjGCKEThedCYz0/AgJsChzeiE4eqhgLzRDRz7vlT6XXfWQ
         KoeLzOJ6Wgm5WoSshif8evl1k/47VG1g9rWVU8vxCiDH3Qrv7hyAFJbI+Ud3Qs9fISAd
         mePw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=none (google.com: trusted-objects.com does not designate permitted sender hosts) smtp.mailfrom=v.dupaquis@trusted-objects.com
Return-Path: <v.dupaquis@trusted-objects.com>
Received: from mailex.trusted-objects.com (mailex.trusted-objects.com. [135.125.35.56])
        by mx.google.com with ESMTPS id n1-20020a056000170100b002aaf0414a67si36729305wrc.34.2023.01.20.06.57.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jan 2023 06:57:06 -0800 (PST)
Received-SPF: none (google.com: trusted-objects.com does not designate permitted sender hosts) client-ip=135.125.35.56;
Authentication-Results: mx.google.com;
       spf=none (google.com: trusted-objects.com does not designate permitted sender hosts) smtp.mailfrom=v.dupaquis@trusted-objects.com
Received: from [192.170.0.200] (88.127.245.42) by S1056330.EX76918.lan
 (2001:41d0:117:e400::877d:2338) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 20 Jan
 2023 15:58:06 +0100
Message-ID: <13172d24-0cab-0550-5d2d-2eabd679b62d@trusted-objects.com>
Date: Fri, 20 Jan 2023 15:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Diificulties with qemu-system-arm semihosting
Content-Language: fr-FR
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: <qemu-arm@nongnu.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-17-alex.bennee@linaro.org>
 <fe4ae917-5132-e670-0604-c28b8c4e1599@trusted-objects.com>
 <87sfg6xvgm.fsf@linaro.org>
 <fc7e0abb-3286-f343-d36f-594ac43a8772@trusted-objects.com>
 <87fsc5y0pl.fsf@linaro.org>
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
In-Reply-To: <87fsc5y0pl.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------mbKxy0RbW4OaMBCc6XAbXIj4"
Return-Path: v.dupaquis@trusted-objects.com
X-Originating-IP: [88.127.245.42]
X-ClientProxiedBy: S1056330.EX76918.lan (2001:41d0:117:e400::877d:2338) To
 S1056330.EX76918.lan (2001:41d0:117:e400::877d:2338)
X-TUID: N9Am/0hWwZai

--------------mbKxy0RbW4OaMBCc6XAbXIj4
Content-Type: multipart/mixed; boundary="------------r307mYSXpZg7ZOCPTQt25fCb";
 protected-headers="v1"
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <13172d24-0cab-0550-5d2d-2eabd679b62d@trusted-objects.com>
Subject: Re: Diificulties with qemu-system-arm semihosting
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-17-alex.bennee@linaro.org>
 <fe4ae917-5132-e670-0604-c28b8c4e1599@trusted-objects.com>
 <87sfg6xvgm.fsf@linaro.org>
 <fc7e0abb-3286-f343-d36f-594ac43a8772@trusted-objects.com>
 <87fsc5y0pl.fsf@linaro.org>
In-Reply-To: <87fsc5y0pl.fsf@linaro.org>

--------------r307mYSXpZg7ZOCPTQt25fCb
Content-Type: multipart/alternative;
 boundary="------------VAVrK2YLDtiR7cyXEOrKGQFn"

--------------VAVrK2YLDtiR7cyXEOrKGQFn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

V2VsbCwgYXQgbGVhc3QgaXQgaXMgc3VwcG9zZWQgdG8sIEkgbWFkZSBzdXJlIHRvIGhhdmUg
dGhlIHJpZ2h0IExERkxBR1MsIA0KbGlicmFyaWVzIGFuZCBpbml0aWFsaXNhdGlvbiBjb2Rl
Lg0KDQpOb3csIEkgcHJvYmFibHkgbWFkZSBzb21ldGhpbmcgd3JvbmcgYXQgc29tZSBzdGFn
ZS4uLg0KDQpMZSAyMC8wMS8yMDIzIMOgIDExOjEwLCBBbGV4IEJlbm7DqWUgYSDDqWNyaXTC
oDoNCj4gdmluY2VudCBEdXBhcXVpczx2LmR1cGFxdWlzQHRydXN0ZWQtb2JqZWN0cy5jb20+
ICB3cml0ZXM6DQo+DQo+PiBbW1BHUCBTaWduZWQgUGFydDpVbmRlY2lkZWRdXQ0KPj4gSGVs
bG8sDQo+Pg0KPj4gSXQgc2VlbXMgSSB3YXMgbWlzc2luZyB0aGUgIi1tb24gc2VyaWFsOnN0
ZGlvIiBvcHRpb24sIGluZGVlZCBpdCBsb29rcw0KPj4gYXMgb25seSB0aGlzIG1ha2VzIGl0
IHdvcmsuDQo+IEVybSBzb3JyeSB0aGF0IGlzIGZyb20gbXkgZGVmYXVsdCBjb21tYW5kIGxp
bmUuIEJ1dCBpdCBzaG91bGQgb25seQ0KPiBhZmZlY3Qgd2hhdCBpcyBjb21pbmcgb3V0IG9m
IHlvdXIgcGwwMTEgKG9yIHdoYXRldmVyIHNlcmlhbCBkZXZpY2UpIGFuZA0KPiB3aGF0IGlz
IGRyaXZlbiBmcm9tIHNlbWlob3N0aW5nLiBUaGV5IGFyZSB0d28gZGlmZmVyZW50IHNvdXJj
ZXMgb2YNCj4gY29uc29sZSBsaWtlIG91dHB1dC4NCj4NCj4gQXJlIHlvdSBzdXJlIHlvdXIg
Z3Vlc3QgaXMgdXNpbmcgc2VtaWhvc3Rpbmc/DQo+DQo+PiBUaGFua3MgYSBsb3QgIQ0KPj4N
Cj4+IEJlc3QgcmVnYXJkcywNCj4+DQo+PiBWaW5jZW50Lg0KPj4NCj4+IExlIDE5LzAxLzIw
MjMgw6AgMTg6MzksIEFsZXggQmVubsOpZSBhIMOpY3JpdCA6DQo+Pg0KPj4gICANCj4+IHZp
bmNlbnQgRHVwYXF1aXM8di5kdXBhcXVpc0B0cnVzdGVkLW9iamVjdHMuY29tPiAgd3JpdGVz
Og0KPj4NCj4+IChjYzogY2hhcmRldiBiYWNrZW5kIG1haW50YWluZXJzKQ0KPj4NCj4+ICAg
W1tQR1AgU2lnbmVkIFBhcnQ6VW5kZWNpZGVkXV0NCj4+IEhlbGxvLA0KPj4NCj4+IEkndmUg
dHJpZWQgdG8gdXNlIHRoZSBzZW1paG9zdGluZyBvbiBxZW11LXN5c3RlbS1hcm0gKHZlcnNp
b24gNy4wKSwgYW5kIHdhcyBub3QgYWJsZSB0byByZWRpcmVjdCB0aGUNCj4+IGlucHV0L291
dHB1dCB0byBhIHBpcGUsIGZvciBpbnN0YW5jZS4NCj4+DQo+PiBJdCBzZWVtcyBJJ3ZlIGRl
Y2xhcmVkIHRoZSBjaGFyZGV2IGNvcnJlY3RseSBhcyBJIGRvIG5vdCBnZXQgYW55IGVycm9y
IG1lc3NhZ2UsIGJ1dCBpbXBvc3NpYmxlIGZvciBtZSB0bw0KPj4gcmVkaXJlY3QgdGhlIGlu
cHV0L291dHB1dCBzdHJlYW1zLiBJIGhhZCB0byByZWRpcmVjdCBzdGRvdXQgdXNpbmcgdGVl
IGFuZCBmb3VuZCBhbm90aGVyIHdheSB0byBhY2Nlc3Mgc3RkaW4NCj4+ICh0aHJvdWdoIHRo
ZSAvZGV2L3B0cy94IGRldmljZSBJIGNhbiBvYnRhaW4gdGhyb3VnaCB0aGUgcHMgY29tbWFu
ZCkuDQo+Pg0KPj4gSSBkaWdnZWQgaW50byB0aGUgc291cmNlcyB0byB1bmRlcnN0YW5kIHdo
YXQgSSB3YXMgZG9pbmcgd3JvbmcsIGFuZCBjb3VsZCBub3QgOigNCj4+DQo+PiBIYXMgYW55
b25lIGV2ZXIgdHJpZWQgdG8gcmVkaXJlY3QgYm90aCBzdGRvdXQvc3RkaW4gd2hpbGUgdXNp
bmcgc2VtaWhvc3RpbmcgPw0KPj4NCj4+IFNob3VsZCBJIGV4cGVjdCBhIG5ldyBiZWhhdmlv
dXIgd2l0aCB0aGUgbGF0ZXN0IHZlcnNpb24gPw0KPj4NCj4+IEkgd2FzIHVzaW5nIHRoZSBm
b2xsb3dpbmcgb3B0aW9ucyA6DQo+Pg0KPj4gLXNlbWlob3N0aW5nIC1jaGFyZGV2IHBpcGUs
aWQ9cGlwb3V0LHBhdGg9cGlwb3V0IC1zZW1paG9zdGluZy1jb25maWcNCj4+IGVuYWJsZT1v
bixjaGFyZGV2PXBpcG91dA0KPj4NCj4+DQo+PiBJJ3ZlIG5ldmVyIHRyaWVkIHdpdGggYSBw
aXBlIGJ1dCBJIGhhdmUgZ290IGl0IHdvcmtpbmcgd2l0aCBzb2NrZXRzIGFuZA0KPj4gZmls
ZXMuIElzIHRoZSBwaXBlIGV2ZXIgZ29pbmcgdG8gYmUgYmktZGlyZWN0aW9uYWw/DQo+Pg0K
Pj4gQW55d2F5IGZvciByZWZlcmVuY2U6DQo+Pg0KPj4gICAgLi9xZW11LXN5c3RlbS1hYXJj
aDY0IC1kaXNwbGF5IG5vbmUgLXNlcmlhbCBtb246c3RkaW8gXA0KPj4gICAgICAtTSB2aXJ0
IC1jcHUgbWF4LHBhdXRoLWltcGRlZj1vbiBcDQo+PiAgICAgIC1zZW1paG9zdGluZy1jb25m
aWcgZW5hYmxlPW9uLGNoYXJkZXY9c2hjZCBcDQo+PiAgICAgIC1rZXJuZWwgLi90ZXN0cy90
Y2cvYWFyY2g2NC1zb2Z0bW11L21lbW9yeSBcDQo+PiAgICAgIC1jaGFyZGV2IGZpbGUscGF0
aD10ZXN0Lm91dCxpZD1zaGNkDQo+Pg0KPj4gd29ya3MgYXMgZXhwZWN0ZWQsIHJlLWRpcmVj
dGluZyBvdXRwdXQgdG8gdGhlIGZpbGUuIFVuZm9ydHVuYXRlbHkgd2UNCj4+IGRvbid0IGhh
dmUgbWFueSBhcm0tc29mdG1tdSB0ZXN0cy4gVGhlIG9ubHkgb25lIHdlIGJ1aWxkDQo+PiAo
dGVzdC1hcm12Nm0tdW5kZWYpIG9ubHkgdXNlcyB0aGUgZXhpdCBzZW1paG9zdGluZyBjYWxs
Lg0KPj4NCj4+ICAgDQo+PiB0aGUgcGlwZSBiZWluZyBjcmVhdGVkIHVzaW5nIG1rZmlmbyBw
aXBvdXQgYmVmb3JlaGFuZC4NCj4+DQo+PiBSZWdhcmRzLA0KPj4NCj4+IFZpbmNlbnQuDQo+
Pg0KPj4gTGUgMTAvMDEvMjAyMyDDoCAxODozOSwgQWxleCBCZW5uw6llIGEgw6ljcml0IDoN
Cj4+DQo+PiAgIFRoZSBtYWluIHJlYXNvbiB0byBkbyB0aGlzIGlzIHRvIGRvY3VtZW50IG91
ciBPX0JJTkFSWSBpbXBsZW1lbnRhdGlvbg0KPj4gZGVjaXNpb24gc29tZXdoZXJlLiBIb3dl
dmVyIEkndmUgYWxzbyBtb3ZlZCBzb21lIG9mIHRoZSBpbXBsZW1lbnRhdGlvbg0KPj4gZGV0
YWlscyBvdXQgb2YgcWVtdS1vcHRpb25zIGFuZCBhZGRlZCBsaW5rcyBiZXR3ZWVuIHRoZSB0
d28uIEFzIGENCj4+IGJvbnVzIEkndmUgaGlnaGxpZ2h0ZWQgdGhlIHNjYXJ5IHdhcm5pbmdz
IGFib3V0IGhvc3QgYWNjZXNzIHdpdGggdGhlDQo+PiBhcHByb3ByaWF0ZSBSU1QgdGFncy4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWU8YWxleC5iZW5uZWVAbGluYXJv
Lm9yZz4NCj4+IC0tLQ0KPj4gICBkb2NzL2Fib3V0L2ZlYXR1cmVzLnJzdCAgICB8IDEwICsr
LS0tDQo+PiAgIGRvY3Mvc3BlY3MvaW5kZXgucnN0ICAgICAgIHwgIDEgKw0KPj4gICBkb2Nz
L3NwZWNzL3NlbWlob3N0aW5nLnJzdCB8IDc5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+PiAgIHFlbXUtb3B0aW9ucy5oeCAgICAgICAgICAgIHwgMjcgKysr
KystLS0tLS0tLQ0KPj4gICA0IGZpbGVzIGNoYW5nZWQsIDk1IGluc2VydGlvbnMoKyksIDIy
IGRlbGV0aW9ucygtKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9zcGVjcy9zZW1p
aG9zdGluZy5yc3QNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9hYm91dC9mZWF0dXJlcy5y
c3QgYi9kb2NzL2Fib3V0L2ZlYXR1cmVzLnJzdA0KPj4gaW5kZXggMDgwOGMzNWE0YS4uYWVk
MGY5YjlhMiAxMDA2NDQNCj4+IC0tLSBhL2RvY3MvYWJvdXQvZmVhdHVyZXMucnN0DQo+PiAr
KysgYi9kb2NzL2Fib3V0L2ZlYXR1cmVzLnJzdA0KPj4gQEAgLTE4NywxMSArMTg3LDExIEBA
IFNlZSBgVXNlciBNb2RlIEVtdWxhdGlvbmAgZm9yIG1vcmUgZGV0YWlscyBvbiBydW5uaW5n
IGluIHRoaXMgbW9kZS4NCj4+ICAgU2VtaWhvc3RpbmcNCj4+ICAgfn5+fn5+fn5+fn5+DQo+
PiAgIA0KPj4gLUEgbnVtYmVyIG9mIGd1ZXN0IGFyY2hpdGVjdHVyZSBzdXBwb3J0IHNlbWlo
b3N0aW5nIHdoaWNoIHByb3ZpZGVzIGENCj4+IC13YXkgZm9yIGd1ZXN0IHByb2dyYW1zIHRv
IGFjY2VzcyB0aGUgaG9zdCBzeXN0ZW0gdGhvdWdoIGEgUE9TSVgtbGlrZQ0KPj4gLXN5c3Rl
bSBjYWxsIGxheWVyLiBUaGlzIGhhcyBhcHBsaWNhdGlvbnMgZm9yIGVhcmx5IHNvZnR3YXJl
IGJyaW5nLXVwDQo+PiAtbWFraW5nIGl0IGVhc3kgZm9yIGEgZ3Vlc3QgdG8gZHVtcCBkYXRh
IG9yIHJlYWQgY29uZmlndXJhdGlvbiBmaWxlcw0KPj4gLWJlZm9yZSBhIGZ1bGwgb3BlcmF0
aW5nIHN5c3RlbSBpcyBpbXBsZW1lbnRlZC4NCj4+ICtBIG51bWJlciBvZiBndWVzdCBhcmNo
aXRlY3R1cmUgc3VwcG9ydCA6cmVmOmBTZW1paG9zdGluZ2Agd2hpY2gNCj4+ICtwcm92aWRl
cyBhIHdheSBmb3IgZ3Vlc3QgcHJvZ3JhbXMgdG8gYWNjZXNzIHRoZSBob3N0IHN5c3RlbSB0
aG91Z2ggYQ0KPj4gK1BPU0lYLWxpa2Ugc3lzdGVtIGNhbGwgbGF5ZXIuIFRoaXMgaGFzIGFw
cGxpY2F0aW9ucyBmb3IgZWFybHkgc29mdHdhcmUNCj4+ICticmluZy11cCBtYWtpbmcgaXQg
ZWFzeSBmb3IgYSBndWVzdCB0byBkdW1wIGRhdGEgb3IgcmVhZCBjb25maWd1cmF0aW9uDQo+
PiArZmlsZXMgYmVmb3JlIGEgZnVsbCBvcGVyYXRpbmcgc3lzdGVtIGlzIGltcGxlbWVudGVk
Lg0KPj4gICANCj4+ICAgU29tZSBvZiB0aG9zZSBndWVzdCBhcmNoaXRlY3R1cmVzIGFsc28g
c3VwcG9ydCBzZW1paG9zdGluZyBpbg0KPj4gICB1c2VyLW1vZGUgbWFraW5nIHRoZSB0ZXN0
aW5nIG9mICJiYXJlLW1ldGFsIiBtaWNyby1jb250cm9sbGVyIGNvZGUNCj4+IGRpZmYgLS1n
aXQgYS9kb2NzL3NwZWNzL2luZGV4LnJzdCBiL2RvY3Mvc3BlY3MvaW5kZXgucnN0DQo+PiBp
bmRleCBhNThkOTMxMWNiLi5iNDZhMTZiMmM4IDEwMDY0NA0KPj4gLS0tIGEvZG9jcy9zcGVj
cy9pbmRleC5yc3QNCj4+ICsrKyBiL2RvY3Mvc3BlY3MvaW5kZXgucnN0DQo+PiBAQCAtMjEs
MyArMjEsNCBAQCBndWVzdCBoYXJkd2FyZSB0aGF0IGlzIHNwZWNpZmljIHRvIFFFTVUuDQo+
PiAgICAgIGFjcGlfZXJzdA0KPj4gICAgICBzZXYtZ3Vlc3QtZmlybXdhcmUNCj4+ICAgICAg
ZndfY2ZnDQo+PiArICAgc2VtaWhvc3RpbmcNCj4+IGRpZmYgLS1naXQgYS9kb2NzL3NwZWNz
L3NlbWlob3N0aW5nLnJzdCBiL2RvY3Mvc3BlY3Mvc2VtaWhvc3RpbmcucnN0DQo+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uMzQzZWI0YmJiMw0KPj4g
LS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvZG9jcy9zcGVjcy9zZW1paG9zdGluZy5yc3QNCj4+
IEBAIC0wLDAgKzEsNzkgQEANCj4+ICsuLiBfU2VtaWhvc3Rpbmc6DQo+PiArDQo+PiArU2Vt
aWhvc3RpbmcNCj4+ICstLS0tLS0tLS0tLQ0KPj4gKw0KPj4gK1NlbWlob3N0aW5nIGlzIGEg
ZmVhdHVyZSBwcm92aWRlZCBieSBhIG51bWJlciBvZiBndWVzdHMgdGhhdCBhbGxvdyB0aGUN
Cj4+ICtwcm9ncmFtIHJ1bm5pbmcgb24gdGhlIHRhcmdldCB0byBpbnRlcmFjdCB3aXRoIHRo
ZSBob3N0IHN5c3RlbS4gT24NCj4+ICtyZWFsIGhhcmR3YXJlIHRoaXMgaXMgdXN1YWxseSBw
cm92aWRlZCBieSBhIGRlYnVnZ2VyIGhvb2tlZCBkaXJlY3RseQ0KPj4gK3RvIHRoZSBzeXN0
ZW0uDQo+PiArDQo+PiArR2VuZXJhbGx5IHNlbWlob3N0aW5nIG1ha2VzIGl0IGVhc2llciB0
byBicmluZyB1cCBsb3cgbGV2ZWwgY29kZSBiZWZvcmUgYQ0KPj4gK21vcmUgZnVsbHkgZnVu
Y3Rpb25hbCBvcGVyYXRpbmcgc3lzdGVtIGhhcyBiZWVuIGVuYWJsZWQuIE9uIFFFTVUgaXQN
Cj4+ICthbHNvIGFsbG93cyBmb3IgZW1iZWRkZWQgbWljcm8tY29udHJvbGxlciBjb2RlIHdo
aWNoIHR5cGljYWxseSBkb2Vzbid0DQo+PiAraGF2ZSBhIGZ1bGwgbGliYyB0byBiZSBydW4g
YXMgImJhcmUtbWV0YWwiIGNvZGUgdW5kZXIgUUVNVSdzIHVzZXItbW9kZQ0KPj4gK2VtdWxh
dGlvbi4gSXQgaXMgYWxzbyB1c2VmdWwgZm9yIHdyaXRpbmcgdGVzdCBjYXNlcyBhbmQgaW5k
ZWVkIGENCj4+ICtudW1iZXIgb2YgY29tcGlsZXIgc3VpdGVzIGFzIHdlbGwgYXMgUUVNVSBp
dHNlbGYgdXNlIHNlbWlob3N0aW5nIGNhbGxzDQo+PiArdG8gZXhpdCB0ZXN0IGNvZGUgd2hp
bGUgcmVwb3J0aW5nIHRoZSBzdWNjZXNzIHN0YXRlLg0KPj4gKw0KPj4gK1NlbWlob3N0aW5n
IGlzIG9ubHkgYXZhaWxhYmxlIHVzaW5nIFRDRyBlbXVsYXRpb24uIFRoaXMgaXMgYmVjYXVz
ZSB0aGUNCj4+ICtpbnN0cnVjdGlvbnMgdG8gdHJpZ2dlciBhIHNlbWlob3N0aW5nIGNhbGwg
YXJlIHR5cGljYWxseSByZXNlcnZlZA0KPj4gK2NhdXNpbmcgbW9zdCBoeXBlcnZpc29ycyB0
byB0cmFwIGFuZCBmYXVsdCBvbiB0aGVtLg0KPj4gKw0KPj4gKy4uIHdhcm5pbmc6Og0KPj4g
KyAgIFNlbWlob3N0aW5nIGluaGVyZW50bHkgYnlwYXNzZXMgYW55IGlzb2xhdGlvbiB0aGVy
ZSBtYXkgYmUgYmV0d2Vlbg0KPj4gKyAgIHRoZSBndWVzdCBhbmQgdGhlIGhvc3QuIEFzIGEg
cmVzdWx0IGEgcHJvZ3JhbSB1c2luZyBzZW1paG9zdGluZyBjYW4NCj4+ICsgICBoYXBwaWx5
IHRyYXNoIHlvdXIgaG9zdCBzeXN0ZW0uIFlvdSBzaG91bGQgb25seSBldmVyIHJ1biB0cnVz
dGVkDQo+PiArICAgY29kZSB3aXRoIHNlbWlob3N0aW5nIGVuYWJsZWQuDQo+PiArDQo+PiAr
UmVkaXJlY3Rpb24NCj4+ICt+fn5+fn5+fn5+fg0KPj4gKw0KPj4gK1NlbWlob3N0aW5nIGNh
bGxzIGNhbiBiZSByZS1kaXJlY3RlZCB0byBhIChwb3RlbnRpYWxseSByZW1vdGUpIGdkYg0K
Pj4gK2R1cmluZyBkZWJ1Z2dpbmcgdmlhIHRoZSA6cmVmOmBnZGJzdHViPEdEQiB1c2FnZT5g
LiBPdXRwdXQgdG8gdGhlDQo+PiArc2VtaWhvc3RpbmcgY29uc29sZSBpcyBjb25maWd1cmVk
IGFzIGEgYGBjaGFyZGV2YGAgc28gY2FuIGJlDQo+PiArcmVkaXJlY3RlZCB0byBhIGZpbGUs
IHBpcGUgb3Igc29ja2V0IGxpa2UgYW55IG90aGVyIGBgY2hhcmRldmBgDQo+PiArZGV2aWNl
Lg0KPj4gKw0KPj4gK1NlZSA6cmVmOmBTZW1paG9zdGluZyBPcHRpb25zPFNlbWlob3N0aW5n
IE9wdGlvbnM+YCBmb3IgZGV0YWlscy4NCj4+ICsNCj4+ICtTdXBwb3J0ZWQgVGFyZ2V0cw0K
Pj4gK35+fn5+fn5+fn5+fn5+fn5+DQo+PiArDQo+PiArTW9zdCB0YXJnZXRzIG9mZmVyIGEg
c2ltaWxhciBzZW1paG9zdGluZyBpbXBsZW1lbnRhdGlvbnMgd2l0aCBzb21lDQo+PiArbWlu
b3IgY2hhbmdlcyB0byBkZWZpbmUgdGhlIGFwcHJvcHJpYXRlIGluc3RydWN0aW9uIHRvIGVu
Y29kZSB0aGUNCj4+ICtzZW1paG9zdGluZyBjYWxsIGFuZCB3aGljaCByZWdpc3RlcnMgaG9s
ZCB0aGUgcGFyYW1ldGVycy4gVGhleSB0ZW5kIHRvDQo+PiArcHJlc2VudHMgYSBzaW1wbGUg
UE9TSVgtbGlrZSBBUEkgd2hpY2ggYWxsb3dzIHlvdXIgcHJvZ3JhbSB0byByZWFkIGFuZA0K
Pj4gK3dyaXRlIGZpbGVzLCBhY2Nlc3MgdGhlIGNvbnNvbGUgYW5kIHNvbWUgb3RoZXIgYmFz
aWMgaW50ZXJhY3Rpb25zLg0KPj4gKw0KPj4gKy4uIG5vdGU6Og0KPj4gKyAgIFFFTVUgbWFr
ZXMgYW4gaW1wbGVtZW50YXRpb24gZGVjaXNpb24gdG8gaW1wbGVtZW50IGFsbCBmaWxlIGFj
Y2Vzcw0KPj4gKyAgIGluIGBgT19CSU5BUllgYCBtb2RlIHJlZ2FyZGxlc3Mgb2YgdGhlIGhv
c3Qgb3BlcmF0aW5nIHN5c3RlbS4gVGhpcw0KPj4gKyAgIGlzIGJlY2F1c2UgZ2RiIHNlbWlo
b3N0aW5nIHN1cHBvcnQgZG9lc24ndCBtYWtlIHRoZSBkaXN0aW5jdGlvbg0KPj4gKyAgIGJl
dHdlZW4gdGhlIG1vZGVzIGFuZCBtYWdpY2FsbHkgcHJvY2Vzc2luZyBsaW5lIGVuZGluZ3Mg
Y2FuIGJlIGNvbmZ1c2luZy4NCj4+ICsNCj4+ICsuLiBsaXN0LXRhYmxlOjogR3Vlc3QgQXJj
aGl0ZWN0dXJlcyBzdXBwb3J0aW5nIFNlbWlob3N0aW5nDQo+PiArICA6d2lkdGhzOiAxMCAx
MCA4MA0KPj4gKyAgOmhlYWRlci1yb3dzOiAxDQo+PiArDQo+PiArICAqIC0gQXJjaGl0ZWN0
dXJlDQo+PiArICAgIC0gTW9kZXMNCj4+ICsgICAgLSBTcGVjaWZpY2F0aW9uDQo+PiArICAq
IC0gQXJtDQo+PiArICAgIC0gU3lzdGVtIGFuZCBVc2VyLW1vZGUNCj4+ICsgICAgLWh0dHBz
Oi8vZ2l0aHViLmNvbS9BUk0tc29mdHdhcmUvYWJpLWFhL2Jsb2IvbWFpbi9zZW1paG9zdGlu
Zy9zZW1paG9zdGluZy5yc3QNCj4+ICsgICogLSBtNjhrDQo+PiArICAgIC0gU3lzdGVtDQo+
PiArICAgIC1odHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1uZXdsaWItY3lnd2luLmdp
dDthPWJsb2I7Zj1saWJnbG9zcy9tNjhrL202OGstc2VtaS50eHQ7aGI9SEVBRA0KPj4gKyAg
KiAtIG1pcHMNCj4+ICsgICAgLSBTeXN0ZW0NCj4+ICsgICAgLSBVbmlmaWVkIEhvc3Rpbmcg
SW50ZXJmYWNlIChNRDAxMDY5KQ0KPj4gKyAgKiAtIE5pb3MgSUkNCj4+ICsgICAgLSBTeXN0
ZW0NCj4+ICsgICAgLWh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0L2dpdHdlYi5jZ2k/cD1u
ZXdsaWItY3lnd2luLmdpdDthPWJsb2I7Zj1saWJnbG9zcy9uaW9zMi9uaW9zMi1zZW1pLnR4
dDtoYj1IRUFEDQo+PiArICAqIC0gUklTQy1WDQo+PiArICAgIC0gU3lzdGVtIGFuZCBVc2Vy
LW1vZGUNCj4+ICsgICAgLWh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1zZW1paG9z
dGluZy1zcGVjL2Jsb2IvbWFpbi9yaXNjdi1zZW1paG9zdGluZy1zcGVjLmFkb2MNCj4+ICsg
ICogLSBYdGVuc2ENCj4+ICsgICAgLSBTeXN0ZW0NCj4+ICsgICAgLSBUZW5zaWxpY2EgSVNT
IFNJTUNBTEwNCj4+IGRpZmYgLS1naXQgYS9xZW11LW9wdGlvbnMuaHggYi9xZW11LW9wdGlv
bnMuaHgNCj4+IGluZGV4IDNhYTNhMmY1YTMuLmRlM2EzNjhmNTggMTAwNjQ0DQo+PiAtLS0g
YS9xZW11LW9wdGlvbnMuaHgNCj4+ICsrKyBiL3FlbXUtb3B0aW9ucy5oeA0KPj4gQEAgLTQ2
MzMsMTAgKzQ2MzMsMTMgQEAgREVGKCJzZW1paG9zdGluZyIsIDAsIFFFTVVfT1BUSU9OX3Nl
bWlob3N0aW5nLA0KPj4gICAgICAgUUVNVV9BUkNIX01JUFMgfCBRRU1VX0FSQ0hfTklPUzIg
fCBRRU1VX0FSQ0hfUklTQ1YpDQo+PiAgIFNSU1QNCj4+ICAgYGAtc2VtaWhvc3RpbmdgYA0K
Pj4gLSAgICBFbmFibGUgc2VtaWhvc3RpbmcgbW9kZSAoQVJNLCBNNjhLLCBYdGVuc2EsIE1J
UFMsIE5pb3MgSUksIFJJU0MtViBvbmx5KS4NCj4+ICsgICAgRW5hYmxlIDpyZWY6YFNlbWlo
b3N0aW5nYCBtb2RlIChBUk0sIE02OEssIFh0ZW5zYSwgTUlQUywgTmlvcyBJSSwgUklTQy1W
IG9ubHkpLg0KPj4gICANCj4+IC0gICAgTm90ZSB0aGF0IHRoaXMgYWxsb3dzIGd1ZXN0IGRp
cmVjdCBhY2Nlc3MgdG8gdGhlIGhvc3QgZmlsZXN5c3RlbSwgc28NCj4+IC0gICAgc2hvdWxk
IG9ubHkgYmUgdXNlZCB3aXRoIGEgdHJ1c3RlZCBndWVzdCBPUy4NCj4+ICsgICAgLi4gd2Fy
bmluZzo6DQo+PiArICAgICAgTm90ZSB0aGF0IHRoaXMgYWxsb3dzIGd1ZXN0IGRpcmVjdCBh
Y2Nlc3MgdG8gdGhlIGhvc3QgZmlsZXN5c3RlbSwgc28NCj4+ICsgICAgICBzaG91bGQgb25s
eSBiZSB1c2VkIHdpdGggYSB0cnVzdGVkIGd1ZXN0IE9TLg0KPj4gKw0KPj4gKyAgICAuLiBf
U2VtaWhvc3RpbmcgT3B0aW9uczoNCj4+ICAgDQo+PiAgICAgICBTZWUgdGhlIC1zZW1paG9z
dGluZy1jb25maWcgb3B0aW9uIGRvY3VtZW50YXRpb24gZm9yIGZ1cnRoZXINCj4+ICAgICAg
IGluZm9ybWF0aW9uIGFib3V0IHRoZSBmYWNpbGl0aWVzIHRoaXMgZW5hYmxlcy4NCj4+IEBA
IC00NjQ4LDIyICs0NjUxLDEyIEBAIFFFTVVfQVJDSF9BUk0gfCBRRU1VX0FSQ0hfTTY4SyB8
IFFFTVVfQVJDSF9YVEVOU0EgfA0KPj4gICBRRU1VX0FSQ0hfTUlQUyB8IFFFTVVfQVJDSF9O
SU9TMiB8IFFFTVVfQVJDSF9SSVNDVikNCj4+ICAgU1JTVA0KPj4gICBgYC1zZW1paG9zdGlu
Zy1jb25maWcgW2VuYWJsZT1vbnxvZmZdWyx0YXJnZXQ9bmF0aXZlfGdkYnxhdXRvXVssY2hh
cmRldj1pZF1bLHVzZXJzcGFjZT1vbnxvZmZdWyxhcmc9c3RyWywuLi5dXWBgDQo+PiAtICAg
IEVuYWJsZSBhbmQgY29uZmlndXJlIHNlbWlob3N0aW5nIChBUk0sIE02OEssIFh0ZW5zYSwg
TUlQUywgTmlvcyBJSSwgUklTQy1WDQo+PiArICAgIEVuYWJsZSBhbmQgY29uZmlndXJlIDpy
ZWY6YFNlbWlob3N0aW5nYCAoQVJNLCBNNjhLLCBYdGVuc2EsIE1JUFMsIE5pb3MgSUksIFJJ
U0MtVg0KPj4gICAgICAgb25seSkuDQo+PiAgIA0KPj4gLSAgICBOb3RlIHRoYXQgdGhpcyBh
bGxvd3MgZ3Vlc3QgZGlyZWN0IGFjY2VzcyB0byB0aGUgaG9zdCBmaWxlc3lzdGVtLCBzbw0K
Pj4gLSAgICBzaG91bGQgb25seSBiZSB1c2VkIHdpdGggYSB0cnVzdGVkIGd1ZXN0IE9TLg0K
Pj4gLQ0KPj4gLSAgICBPbiBBcm0gdGhpcyBpbXBsZW1lbnRzIHRoZSBzdGFuZGFyZCBzZW1p
aG9zdGluZyBBUEksIHZlcnNpb24gMi4wLg0KPj4gLQ0KPj4gLSAgICBPbiBNNjhLIHRoaXMg
aW1wbGVtZW50cyB0aGUgIkNvbGRGaXJlIEdEQiIgaW50ZXJmYWNlIHVzZWQgYnkNCj4+IC0g
ICAgbGliZ2xvc3MuDQo+PiAtDQo+PiAtICAgIFh0ZW5zYSBzZW1paG9zdGluZyBwcm92aWRl
cyBiYXNpYyBmaWxlIElPIGNhbGxzLCBzdWNoIGFzDQo+PiAtICAgIG9wZW4vcmVhZC93cml0
ZS9zZWVrL3NlbGVjdC4gVGVuc2lsaWNhIGJhcmVtZXRhbCBsaWJjIGZvciBJU1MgYW5kDQo+
PiAtICAgIGxpbnV4IHBsYXRmb3JtICJzaW0iIHVzZSB0aGlzIGludGVyZmFjZS4NCj4+IC0N
Cj4+IC0gICAgT24gUklTQy1WIHRoaXMgaW1wbGVtZW50cyB0aGUgc3RhbmRhcmQgc2VtaWhv
c3RpbmcgQVBJLCB2ZXJzaW9uIDAuMi4NCj4+ICsgICAgLi4gd2FybmluZzo6DQo+PiArICAg
ICAgTm90ZSB0aGF0IHRoaXMgYWxsb3dzIGd1ZXN0IGRpcmVjdCBhY2Nlc3MgdG8gdGhlIGhv
c3QgZmlsZXN5c3RlbSwgc28NCj4+ICsgICAgICBzaG91bGQgb25seSBiZSB1c2VkIHdpdGgg
YSB0cnVzdGVkIGd1ZXN0IE9TLg0KPj4gICANCj4+ICAgICAgIGBgdGFyZ2V0PW5hdGl2ZXxn
ZGJ8YXV0b2BgDQo+PiAgICAgICAgICAgRGVmaW5lcyB3aGVyZSB0aGUgc2VtaWhvc3Rpbmcg
Y2FsbHMgd2lsbCBiZSBhZGRyZXNzZWQsIHRvIFFFTVUNCj4NCi0tIA0KDQoqVmluY2VudCBE
dXBhcXVpcyoNClNvZnR3YXJlIHNlY3VyaXR5ICYgQ3J5cHRvZ3JhcGh5IGV4cGVydA0KMDYg
MjQgNTggMTcgMDUNCi9FdXJvcGFyYyBkZSBQaWNoYXVyeSBCw6J0aW1lbnQgQjggMTMzMCBy
dWUgR3VpbGxpYmVydCBHYXV0aWVyIGRlIGxhIA0KTGF1emnDqHJlIDEzMjkwIEFpeC1lbi1Q
cm92ZW5jZS8NCg0Kd3d3LnRydXN0ZWQtb2JqZWN0cy5jb20gPGh0dHA6Ly93d3cudHJ1c3Rl
ZC1vYmplY3RzLmNvbT4NCg==
--------------VAVrK2YLDtiR7cyXEOrKGQFn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Well, at least it is supposed to, I made sure to have the right
      LDFLAGS, libraries and initialisation code.</p>
    <p>Now, I probably made something wrong at some stage...<br>
    </p>
    <div class=3D"moz-cite-prefix">Le 20/01/2023 =C3=A0 11:10, Alex Benn=C3=
=A9e a
      =C3=A9crit=C2=A0:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:87fsc5y0pl.fsf@linaro.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
vincent Dupaquis <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:v.dupa=
quis@trusted-objects.com">&lt;v.dupaquis@trusted-objects.com&gt;</a> writ=
es:

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">[[PGP Signed Part:Undecide=
d]]
Hello,

It seems I was missing the "-mon serial:stdio" option, indeed it looks
as only this makes it work.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Erm sorry that is from my default command line. But it should only
affect what is coming out of your pl011 (or whatever serial device) and
what is driven from semihosting. They are two different sources of
console like output.

Are you sure your guest is using semihosting?

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Thanks a lot !

Best regards,

Vincent.

Le 19/01/2023 =C3=A0 18:39, Alex Benn=C3=A9e a =C3=A9crit :

=20
vincent Dupaquis <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:v.dupa=
quis@trusted-objects.com">&lt;v.dupaquis@trusted-objects.com&gt;</a> writ=
es:

(cc: chardev backend maintainers)

 [[PGP Signed Part:Undecided]]
Hello,

I've tried to use the semihosting on qemu-system-arm (version 7.0), and w=
as not able to redirect the
input/output to a pipe, for instance.

It seems I've declared the chardev correctly as I do not get any error me=
ssage, but impossible for me to
redirect the input/output streams. I had to redirect stdout using tee and=
 found another way to access stdin
(through the /dev/pts/x device I can obtain through the ps command).

I digged into the sources to understand what I was doing wrong, and could=
 not :(

Has anyone ever tried to redirect both stdout/stdin while using semihosti=
ng ?

Should I expect a new behaviour with the latest version ?

I was using the following options :

-semihosting -chardev pipe,id=3Dpipout,path=3Dpipout -semihosting-config
enable=3Don,chardev=3Dpipout


I've never tried with a pipe but I have got it working with sockets and
files. Is the pipe ever going to be bi-directional?

Anyway for reference:

  ./qemu-system-aarch64 -display none -serial mon:stdio \
    -M virt -cpu max,pauth-impdef=3Don \
    -semihosting-config enable=3Don,chardev=3Dshcd \
    -kernel ./tests/tcg/aarch64-softmmu/memory \
    -chardev file,path=3Dtest.out,id=3Dshcd

works as expected, re-directing output to the file. Unfortunately we
don't have many arm-softmmu tests. The only one we build
(test-armv6m-undef) only uses the exit semihosting call.

=20
the pipe being created using mkfifo pipout beforehand.

Regards,

Vincent.

Le 10/01/2023 =C3=A0 18:39, Alex Benn=C3=A9e a =C3=A9crit :

 The main reason to do this is to document our O_BINARY implementation
decision somewhere. However I've also moved some of the implementation
details out of qemu-options and added links between the two. As a
bonus I've highlighted the scary warnings about host access with the
appropriate RST tags.

Signed-off-by: Alex Benn=C3=A9e <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:alex.bennee@linaro.org">&lt;alex.bennee@linaro.org&gt;</a>
---
 docs/about/features.rst    | 10 ++---
 docs/specs/index.rst       |  1 +
 docs/specs/semihosting.rst | 79 ++++++++++++++++++++++++++++++++++++++
 qemu-options.hx            | 27 +++++--------
 4 files changed, 95 insertions(+), 22 deletions(-)
 create mode 100644 docs/specs/semihosting.rst

diff --git a/docs/about/features.rst b/docs/about/features.rst
index 0808c35a4a..aed0f9b9a2 100644
--- a/docs/about/features.rst
+++ b/docs/about/features.rst
@@ -187,11 +187,11 @@ See `User Mode Emulation` for more details on runni=
ng in this mode.
 Semihosting
 ~~~~~~~~~~~~
=20
-A number of guest architecture support semihosting which provides a
-way for guest programs to access the host system though a POSIX-like
-system call layer. This has applications for early software bring-up
-making it easy for a guest to dump data or read configuration files
-before a full operating system is implemented.
+A number of guest architecture support :ref:`Semihosting` which
+provides a way for guest programs to access the host system though a
+POSIX-like system call layer. This has applications for early software
+bring-up making it easy for a guest to dump data or read configuration
+files before a full operating system is implemented.
=20
 Some of those guest architectures also support semihosting in
 user-mode making the testing of "bare-metal" micro-controller code
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index a58d9311cb..b46a16b2c8 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -21,3 +21,4 @@ guest hardware that is specific to QEMU.
    acpi_erst
    sev-guest-firmware
    fw_cfg
+   semihosting
diff --git a/docs/specs/semihosting.rst b/docs/specs/semihosting.rst
new file mode 100644
index 0000000000..343eb4bbb3
--- /dev/null
+++ b/docs/specs/semihosting.rst
@@ -0,0 +1,79 @@
+.. _Semihosting:
+
+Semihosting
+-----------
+
+Semihosting is a feature provided by a number of guests that allow the
+program running on the target to interact with the host system. On
+real hardware this is usually provided by a debugger hooked directly
+to the system.
+
+Generally semihosting makes it easier to bring up low level code before =
a
+more fully functional operating system has been enabled. On QEMU it
+also allows for embedded micro-controller code which typically doesn't
+have a full libc to be run as "bare-metal" code under QEMU's user-mode
+emulation. It is also useful for writing test cases and indeed a
+number of compiler suites as well as QEMU itself use semihosting calls
+to exit test code while reporting the success state.
+
+Semihosting is only available using TCG emulation. This is because the
+instructions to trigger a semihosting call are typically reserved
+causing most hypervisors to trap and fault on them.
+
+.. warning::
+   Semihosting inherently bypasses any isolation there may be between
+   the guest and the host. As a result a program using semihosting can
+   happily trash your host system. You should only ever run trusted
+   code with semihosting enabled.
+
+Redirection
+~~~~~~~~~~~
+
+Semihosting calls can be re-directed to a (potentially remote) gdb
+during debugging via the :ref:`gdbstub&lt;GDB usage&gt;`. Output to the
+semihosting console is configured as a ``chardev`` so can be
+redirected to a file, pipe or socket like any other ``chardev``
+device.
+
+See :ref:`Semihosting Options&lt;Semihosting Options&gt;` for details.
+
+Supported Targets
+~~~~~~~~~~~~~~~~~
+
+Most targets offer a similar semihosting implementations with some
+minor changes to define the appropriate instruction to encode the
+semihosting call and which registers hold the parameters. They tend to
+presents a simple POSIX-like API which allows your program to read and
+write files, access the console and some other basic interactions.
+
+.. note::
+   QEMU makes an implementation decision to implement all file access
+   in ``O_BINARY`` mode regardless of the host operating system. This
+   is because gdb semihosting support doesn't make the distinction
+   between the modes and magically processing line endings can be confus=
ing.
+
+.. list-table:: Guest Architectures supporting Semihosting
+  :widths: 10 10 80
+  :header-rows: 1
+
+  * - Architecture
+    - Modes
+    - Specification
+  * - Arm
+    - System and User-mode
+    - <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/ARM-=
software/abi-aa/blob/main/semihosting/semihosting.rst">https://github.com=
/ARM-software/abi-aa/blob/main/semihosting/semihosting.rst</a>
+  * - m68k
+    - System
+    - <a class=3D"moz-txt-link-freetext" href=3D"https://sourceware.org/=
git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3Dlibgloss/m68k/m68k-semi.txt;hb=3D=
HEAD">https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3Dlibg=
loss/m68k/m68k-semi.txt;hb=3DHEAD</a>
+  * - mips
+    - System
+    - Unified Hosting Interface (MD01069)
+  * - Nios II
+    - System
+    - <a class=3D"moz-txt-link-freetext" href=3D"https://sourceware.org/=
git/gitweb.cgi?p=3Dnewlib-cygwin.git;a=3Dblob;f=3Dlibgloss/nios2/nios2-se=
mi.txt;hb=3DHEAD">https://sourceware.org/git/gitweb.cgi?p=3Dnewlib-cygwin=
=2Egit;a=3Dblob;f=3Dlibgloss/nios2/nios2-semi.txt;hb=3DHEAD</a>
+  * - RISC-V
+    - System and User-mode
+    - <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/risc=
v/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc">https://g=
ithub.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.a=
doc</a>
+  * - Xtensa
+    - System
+    - Tensilica ISS SIMCALL
diff --git a/qemu-options.hx b/qemu-options.hx
index 3aa3a2f5a3..de3a368f58 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4633,10 +4633,13 @@ DEF("semihosting", 0, QEMU_OPTION_semihosting,
     QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting``
-    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V on=
ly).
+    Enable :ref:`Semihosting` mode (ARM, M68K, Xtensa, MIPS, Nios II, RI=
SC-V only).
=20
-    Note that this allows guest direct access to the host filesystem, so=

-    should only be used with a trusted guest OS.
+    .. warning::
+      Note that this allows guest direct access to the host filesystem, =
so
+      should only be used with a trusted guest OS.
+
+    .. _Semihosting Options:
=20
     See the -semihosting-config option documentation for further
     information about the facilities this enables.
@@ -4648,22 +4651,12 @@ QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA=
 |
 QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,char=
dev=3Did][,userspace=3Don|off][,arg=3Dstr[,...]]``
-    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, =
RISC-V
+    Enable and configure :ref:`Semihosting` (ARM, M68K, Xtensa, MIPS, Ni=
os II, RISC-V
     only).
=20
-    Note that this allows guest direct access to the host filesystem, so=

-    should only be used with a trusted guest OS.
-
-    On Arm this implements the standard semihosting API, version 2.0.
-
-    On M68K this implements the "ColdFire GDB" interface used by
-    libgloss.
-
-    Xtensa semihosting provides basic file IO calls, such as
-    open/read/write/seek/select. Tensilica baremetal libc for ISS and
-    linux platform "sim" use this interface.
-
-    On RISC-V this implements the standard semihosting API, version 0.2.=

+    .. warning::
+      Note that this allows guest direct access to the host filesystem, =
so
+      should only be used with a trusted guest OS.
=20
     ``target=3Dnative|gdb|auto``
         Defines where the semihosting calls will be addressed, to QEMU
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
    </blockquote>
    <div class=3D"moz-signature">-- <br>
      <pre><big><b>Vincent Dupaquis</b></big>
Software security &amp; Cryptography expert
06 24 58 17 05
<i>Europarc de Pichaury
B=C3=A2timent B8
1330 rue Guillibert Gautier de la Lauzi=C3=A8re
13290 Aix-en-Provence</i>
</pre>
      <a href=3D"http://www.trusted-objects.com"> <img
          alt=3D"www.trusted-objects.com"
          src=3D"https://www.trusted-objects.com/uploads/tpl-buddy-012/im=
g/logo.png"
          width=3D"300" height=3D"117" border=3D"0"> </a></div>
  </body>
</html>

--------------VAVrK2YLDtiR7cyXEOrKGQFn--

--------------r307mYSXpZg7ZOCPTQt25fCb--

--------------mbKxy0RbW4OaMBCc6XAbXIj4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJpYkOsZemdq4v9TTIvVZ6MpT9wkFAmPKq8EFAwAAAAAACgkQIvVZ6MpT9wmY
uw//Vt0pfGFpIKqMb50X/t+KrqDENTcZQOANpqVxRViEkqPhRHligzAxCZeSiIVTr8xmbxOPEp94
s9w3gUGePvt+n9ccqcuCma5TZB6vzdY6nsvkIoT0DdMZqT2/ERZ52MQ+e8qg8jJqjZq8uJMZ+zew
PYlh+19N0AwSMUhaJxx39lARiws2qnm3WqqTU6j8ichOWUotkn7YuzhtdHqVM1x8U28F81yRKjV6
c1+qk3GuAiT5k2zpolLy9JYp6QYOqVc4LQ93TGgajYen0UT0Zf+lFkclycxdnS1PdYCc77OK7+cw
AlPCcNpGxa05uEQsNo9IqDk1ORVDsQSkNiFO5ZckHxaYDQcbL0FjBiDzyfHZOs0o/A6Dk7oInCaJ
uiGKNCWuOJde/J47AO3k8tmydbGsVZOmloZvUInRAaiV4aH2x/96DWd2n1unsMbc2AaF9onuWtHl
yHClhptYqLROno6g2jjIjybSST9X1+d3FrARzTqoJdBUcRWn5mMRl1UFrY+5jxGodJRl5wMYwER1
jYFjcBiwaX99EAyFLk8w4U4BO4mUDGPjTikVlklWLtscjCcZMpbI4dLdcbyPkW0OF628lswrj5gF
MG8/Aw3nnSYkBNAb0HpMErshc3qTJaltq9hVxLtu/RG0g5ADSxu+hgGeRDBPakJ+AV5Li7QDY3/l
94w=
=K4uQ
-----END PGP SIGNATURE-----

--------------mbKxy0RbW4OaMBCc6XAbXIj4--
