Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp902147ejc;
        Thu, 19 Jan 2023 23:46:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvhZ2J+EYWxRHnGszJlcz99QS2u4tfduUC6H6z5a8l/13zcj20UhBdDzQFxBZE+O8n/c8Xj
X-Received: by 2002:a05:6000:81a:b0:2be:4f0a:5559 with SMTP id bt26-20020a056000081a00b002be4f0a5559mr3318968wrb.26.1674200762468;
        Thu, 19 Jan 2023 23:46:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674200762; cv=none;
        d=google.com; s=arc-20160816;
        b=ipZguQstu+Qc2NoHsC38F5iNBK+zwiezupwcrWkIae5u+cCm4KswnoezAZt2eKRqlZ
         HV9hTZXWc1eAqqV1irSImiZhd9J+xZ5M0sIzZjObDe//HSU6zGM4+wB4sY7LaWCLO/xb
         JjlXAmMfQVdORZg9Gtstxlriml12/KVYYkPgEMTspKmk3haJK5mIIHn1X6Ht8ug6yXGR
         y2UdWJFLAzHCIt6sWQM0wrYgf0zMtNZE0p6ZMhB2XQJen4B5WOtdVGEXyC1Lk2zrA3Fp
         IyWEWt2B1lorbtgAdLhxivF8pJn/wpyzyERuWTKOV+re0jPYx8kXeL6JRIM2of8IUrAI
         53lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ARDF7D40qF2CmyAqZGkMEFSYHlUAZVO1WsFFNwUukLw=;
        b=iZWAgspfhPsBnEQJvpUUtYt060ZmLXr2OfOxb5+4xHigefJErbOTJaB+j34jN0A6t7
         xzQ059kBWmrC4qfyBWTO0ax7Y7yVgcHJ/Asou+9JshXKO6nicO5ri+WGiQSTfhxMMKlC
         6XvePXwFy8/q4I38z7n82vNbbRZFPXxk/K3ObKkpQ2TcW8zeg900UbqSD68ntjvvCcot
         jDKstGwywGSg/aIX2WuvdngnuzxNGF9rIvocINH7yfks5HnnUZP6RzClXO88vcz6p8ET
         FLvQq46l4wfeth5lgeJY602VShinu3TpqiI9Wy7xD4tjU2/XxCXuz6oxXBZhX7MH0uMM
         D2Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=none (google.com: trusted-objects.com does not designate permitted sender hosts) smtp.mailfrom=v.dupaquis@trusted-objects.com
Return-Path: <v.dupaquis@trusted-objects.com>
Received: from mailex.trusted-objects.com (mailex.trusted-objects.com. [135.125.35.56])
        by mx.google.com with ESMTPS id l15-20020a056000022f00b002be5b99bf1fsi975877wrz.765.2023.01.19.23.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jan 2023 23:46:02 -0800 (PST)
Received-SPF: none (google.com: trusted-objects.com does not designate permitted sender hosts) client-ip=135.125.35.56;
Authentication-Results: mx.google.com;
       spf=none (google.com: trusted-objects.com does not designate permitted sender hosts) smtp.mailfrom=v.dupaquis@trusted-objects.com
Received: from [192.170.0.200] (88.127.245.42) by S1056330.EX76918.lan
 (2001:41d0:117:e400::877d:2338) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 20 Jan
 2023 08:47:01 +0100
Message-ID: <fc7e0abb-3286-f343-d36f-594ac43a8772@trusted-objects.com>
Date: Fri, 20 Jan 2023 08:46:00 +0100
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
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
In-Reply-To: <87sfg6xvgm.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------1Cn4PzZ4p7qyIdSSpLW3QfGI"
Return-Path: v.dupaquis@trusted-objects.com
X-Originating-IP: [88.127.245.42]
X-ClientProxiedBy: S1056330.EX76918.lan (2001:41d0:117:e400::877d:2338) To
 S1056330.EX76918.lan (2001:41d0:117:e400::877d:2338)
X-TUID: xrbt119XURwA

--------------1Cn4PzZ4p7qyIdSSpLW3QfGI
Content-Type: multipart/mixed; boundary="------------0O11Bo74NEsQTrXMm0Atzw0O";
 protected-headers="v1"
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fc7e0abb-3286-f343-d36f-594ac43a8772@trusted-objects.com>
Subject: Re: Diificulties with qemu-system-arm semihosting
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-17-alex.bennee@linaro.org>
 <fe4ae917-5132-e670-0604-c28b8c4e1599@trusted-objects.com>
 <87sfg6xvgm.fsf@linaro.org>
In-Reply-To: <87sfg6xvgm.fsf@linaro.org>

--------------0O11Bo74NEsQTrXMm0Atzw0O
Content-Type: multipart/alternative;
 boundary="------------JenX0E0t6jtFFFE8r6Nse9s0"

--------------JenX0E0t6jtFFFE8r6Nse9s0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkl0IHNlZW1zIEkgd2FzIG1pc3NpbmcgdGhlICItbW9uIHNlcmlhbDpzdGRp
byIgb3B0aW9uLCBpbmRlZWQgaXQgbG9va3MgDQphcyBvbmx5IHRoaXMgbWFrZXMgaXQgd29y
ay4NCg0KVGhhbmtzIGEgbG90ICENCg0KQmVzdCByZWdhcmRzLA0KDQpWaW5jZW50Lg0KDQpM
ZSAxOS8wMS8yMDIzIMOgIDE4OjM5LCBBbGV4IEJlbm7DqWUgYSDDqWNyaXTCoDoNCj4gdmlu
Y2VudCBEdXBhcXVpczx2LmR1cGFxdWlzQHRydXN0ZWQtb2JqZWN0cy5jb20+ICB3cml0ZXM6
DQo+DQo+IChjYzogY2hhcmRldiBiYWNrZW5kIG1haW50YWluZXJzKQ0KPg0KPj4gW1tQR1Ag
U2lnbmVkIFBhcnQ6VW5kZWNpZGVkXV0NCj4+IEhlbGxvLA0KPj4NCj4+IEkndmUgdHJpZWQg
dG8gdXNlIHRoZSBzZW1paG9zdGluZyBvbiBxZW11LXN5c3RlbS1hcm0gKHZlcnNpb24gNy4w
KSwgYW5kIHdhcyBub3QgYWJsZSB0byByZWRpcmVjdCB0aGUNCj4+IGlucHV0L291dHB1dCB0
byBhIHBpcGUsIGZvciBpbnN0YW5jZS4NCj4+DQo+PiBJdCBzZWVtcyBJJ3ZlIGRlY2xhcmVk
IHRoZSBjaGFyZGV2IGNvcnJlY3RseSBhcyBJIGRvIG5vdCBnZXQgYW55IGVycm9yIG1lc3Nh
Z2UsIGJ1dCBpbXBvc3NpYmxlIGZvciBtZSB0bw0KPj4gcmVkaXJlY3QgdGhlIGlucHV0L291
dHB1dCBzdHJlYW1zLiBJIGhhZCB0byByZWRpcmVjdCBzdGRvdXQgdXNpbmcgdGVlIGFuZCBm
b3VuZCBhbm90aGVyIHdheSB0byBhY2Nlc3Mgc3RkaW4NCj4+ICh0aHJvdWdoIHRoZSAvZGV2
L3B0cy94IGRldmljZSBJIGNhbiBvYnRhaW4gdGhyb3VnaCB0aGUgcHMgY29tbWFuZCkuDQo+
Pg0KPj4gSSBkaWdnZWQgaW50byB0aGUgc291cmNlcyB0byB1bmRlcnN0YW5kIHdoYXQgSSB3
YXMgZG9pbmcgd3JvbmcsIGFuZCBjb3VsZCBub3QgOigNCj4+DQo+PiBIYXMgYW55b25lIGV2
ZXIgdHJpZWQgdG8gcmVkaXJlY3QgYm90aCBzdGRvdXQvc3RkaW4gd2hpbGUgdXNpbmcgc2Vt
aWhvc3RpbmcgPw0KPj4NCj4+IFNob3VsZCBJIGV4cGVjdCBhIG5ldyBiZWhhdmlvdXIgd2l0
aCB0aGUgbGF0ZXN0IHZlcnNpb24gPw0KPj4NCj4+IEkgd2FzIHVzaW5nIHRoZSBmb2xsb3dp
bmcgb3B0aW9ucyA6DQo+Pg0KPj4gLXNlbWlob3N0aW5nIC1jaGFyZGV2IHBpcGUsaWQ9cGlw
b3V0LHBhdGg9cGlwb3V0IC1zZW1paG9zdGluZy1jb25maWcNCj4+IGVuYWJsZT1vbixjaGFy
ZGV2PXBpcG91dA0KPiBJJ3ZlIG5ldmVyIHRyaWVkIHdpdGggYSBwaXBlIGJ1dCBJIGhhdmUg
Z290IGl0IHdvcmtpbmcgd2l0aCBzb2NrZXRzIGFuZA0KPiBmaWxlcy4gSXMgdGhlIHBpcGUg
ZXZlciBnb2luZyB0byBiZSBiaS1kaXJlY3Rpb25hbD8NCj4NCj4gQW55d2F5IGZvciByZWZl
cmVuY2U6DQo+DQo+ICAgIC4vcWVtdS1zeXN0ZW0tYWFyY2g2NCAtZGlzcGxheSBub25lIC1z
ZXJpYWwgbW9uOnN0ZGlvIFwNCj4gICAgICAtTSB2aXJ0IC1jcHUgbWF4LHBhdXRoLWltcGRl
Zj1vbiBcDQo+ICAgICAgLXNlbWlob3N0aW5nLWNvbmZpZyBlbmFibGU9b24sY2hhcmRldj1z
aGNkIFwNCj4gICAgICAta2VybmVsIC4vdGVzdHMvdGNnL2FhcmNoNjQtc29mdG1tdS9tZW1v
cnkgXA0KPiAgICAgIC1jaGFyZGV2IGZpbGUscGF0aD10ZXN0Lm91dCxpZD1zaGNkDQo+DQo+
IHdvcmtzIGFzIGV4cGVjdGVkLCByZS1kaXJlY3Rpbmcgb3V0cHV0IHRvIHRoZSBmaWxlLiBV
bmZvcnR1bmF0ZWx5IHdlDQo+IGRvbid0IGhhdmUgbWFueSBhcm0tc29mdG1tdSB0ZXN0cy4g
VGhlIG9ubHkgb25lIHdlIGJ1aWxkDQo+ICh0ZXN0LWFybXY2bS11bmRlZikgb25seSB1c2Vz
IHRoZSBleGl0IHNlbWlob3N0aW5nIGNhbGwuDQo+DQo+PiB0aGUgcGlwZSBiZWluZyBjcmVh
dGVkIHVzaW5nIG1rZmlmbyBwaXBvdXQgYmVmb3JlaGFuZC4NCj4+DQo+PiBSZWdhcmRzLA0K
Pj4NCj4+IFZpbmNlbnQuDQo+Pg0KPj4gTGUgMTAvMDEvMjAyMyDDoCAxODozOSwgQWxleCBC
ZW5uw6llIGEgw6ljcml0IDoNCj4+DQo+PiAgIFRoZSBtYWluIHJlYXNvbiB0byBkbyB0aGlz
IGlzIHRvIGRvY3VtZW50IG91ciBPX0JJTkFSWSBpbXBsZW1lbnRhdGlvbg0KPj4gZGVjaXNp
b24gc29tZXdoZXJlLiBIb3dldmVyIEkndmUgYWxzbyBtb3ZlZCBzb21lIG9mIHRoZSBpbXBs
ZW1lbnRhdGlvbg0KPj4gZGV0YWlscyBvdXQgb2YgcWVtdS1vcHRpb25zIGFuZCBhZGRlZCBs
aW5rcyBiZXR3ZWVuIHRoZSB0d28uIEFzIGENCj4+IGJvbnVzIEkndmUgaGlnaGxpZ2h0ZWQg
dGhlIHNjYXJ5IHdhcm5pbmdzIGFib3V0IGhvc3QgYWNjZXNzIHdpdGggdGhlDQo+PiBhcHBy
b3ByaWF0ZSBSU1QgdGFncy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWU8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4+IC0tLQ0KPj4gICBkb2NzL2Fib3V0L2ZlYXR1
cmVzLnJzdCAgICB8IDEwICsrLS0tDQo+PiAgIGRvY3Mvc3BlY3MvaW5kZXgucnN0ICAgICAg
IHwgIDEgKw0KPj4gICBkb2NzL3NwZWNzL3NlbWlob3N0aW5nLnJzdCB8IDc5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgIHFlbXUtb3B0aW9ucy5oeCAg
ICAgICAgICAgIHwgMjcgKysrKystLS0tLS0tLQ0KPj4gICA0IGZpbGVzIGNoYW5nZWQsIDk1
IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgZG9jcy9zcGVjcy9zZW1paG9zdGluZy5yc3QNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZG9j
cy9hYm91dC9mZWF0dXJlcy5yc3QgYi9kb2NzL2Fib3V0L2ZlYXR1cmVzLnJzdA0KPj4gaW5k
ZXggMDgwOGMzNWE0YS4uYWVkMGY5YjlhMiAxMDA2NDQNCj4+IC0tLSBhL2RvY3MvYWJvdXQv
ZmVhdHVyZXMucnN0DQo+PiArKysgYi9kb2NzL2Fib3V0L2ZlYXR1cmVzLnJzdA0KPj4gQEAg
LTE4NywxMSArMTg3LDExIEBAIFNlZSBgVXNlciBNb2RlIEVtdWxhdGlvbmAgZm9yIG1vcmUg
ZGV0YWlscyBvbiBydW5uaW5nIGluIHRoaXMgbW9kZS4NCj4+ICAgU2VtaWhvc3RpbmcNCj4+
ICAgfn5+fn5+fn5+fn5+DQo+PiAgIA0KPj4gLUEgbnVtYmVyIG9mIGd1ZXN0IGFyY2hpdGVj
dHVyZSBzdXBwb3J0IHNlbWlob3N0aW5nIHdoaWNoIHByb3ZpZGVzIGENCj4+IC13YXkgZm9y
IGd1ZXN0IHByb2dyYW1zIHRvIGFjY2VzcyB0aGUgaG9zdCBzeXN0ZW0gdGhvdWdoIGEgUE9T
SVgtbGlrZQ0KPj4gLXN5c3RlbSBjYWxsIGxheWVyLiBUaGlzIGhhcyBhcHBsaWNhdGlvbnMg
Zm9yIGVhcmx5IHNvZnR3YXJlIGJyaW5nLXVwDQo+PiAtbWFraW5nIGl0IGVhc3kgZm9yIGEg
Z3Vlc3QgdG8gZHVtcCBkYXRhIG9yIHJlYWQgY29uZmlndXJhdGlvbiBmaWxlcw0KPj4gLWJl
Zm9yZSBhIGZ1bGwgb3BlcmF0aW5nIHN5c3RlbSBpcyBpbXBsZW1lbnRlZC4NCj4+ICtBIG51
bWJlciBvZiBndWVzdCBhcmNoaXRlY3R1cmUgc3VwcG9ydCA6cmVmOmBTZW1paG9zdGluZ2Ag
d2hpY2gNCj4+ICtwcm92aWRlcyBhIHdheSBmb3IgZ3Vlc3QgcHJvZ3JhbXMgdG8gYWNjZXNz
IHRoZSBob3N0IHN5c3RlbSB0aG91Z2ggYQ0KPj4gK1BPU0lYLWxpa2Ugc3lzdGVtIGNhbGwg
bGF5ZXIuIFRoaXMgaGFzIGFwcGxpY2F0aW9ucyBmb3IgZWFybHkgc29mdHdhcmUNCj4+ICti
cmluZy11cCBtYWtpbmcgaXQgZWFzeSBmb3IgYSBndWVzdCB0byBkdW1wIGRhdGEgb3IgcmVh
ZCBjb25maWd1cmF0aW9uDQo+PiArZmlsZXMgYmVmb3JlIGEgZnVsbCBvcGVyYXRpbmcgc3lz
dGVtIGlzIGltcGxlbWVudGVkLg0KPj4gICANCj4+ICAgU29tZSBvZiB0aG9zZSBndWVzdCBh
cmNoaXRlY3R1cmVzIGFsc28gc3VwcG9ydCBzZW1paG9zdGluZyBpbg0KPj4gICB1c2VyLW1v
ZGUgbWFraW5nIHRoZSB0ZXN0aW5nIG9mICJiYXJlLW1ldGFsIiBtaWNyby1jb250cm9sbGVy
IGNvZGUNCj4+IGRpZmYgLS1naXQgYS9kb2NzL3NwZWNzL2luZGV4LnJzdCBiL2RvY3Mvc3Bl
Y3MvaW5kZXgucnN0DQo+PiBpbmRleCBhNThkOTMxMWNiLi5iNDZhMTZiMmM4IDEwMDY0NA0K
Pj4gLS0tIGEvZG9jcy9zcGVjcy9pbmRleC5yc3QNCj4+ICsrKyBiL2RvY3Mvc3BlY3MvaW5k
ZXgucnN0DQo+PiBAQCAtMjEsMyArMjEsNCBAQCBndWVzdCBoYXJkd2FyZSB0aGF0IGlzIHNw
ZWNpZmljIHRvIFFFTVUuDQo+PiAgICAgIGFjcGlfZXJzdA0KPj4gICAgICBzZXYtZ3Vlc3Qt
ZmlybXdhcmUNCj4+ICAgICAgZndfY2ZnDQo+PiArICAgc2VtaWhvc3RpbmcNCj4+IGRpZmYg
LS1naXQgYS9kb2NzL3NwZWNzL3NlbWlob3N0aW5nLnJzdCBiL2RvY3Mvc3BlY3Mvc2VtaWhv
c3RpbmcucnN0DQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAw
MC4uMzQzZWI0YmJiMw0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvZG9jcy9zcGVjcy9z
ZW1paG9zdGluZy5yc3QNCj4+IEBAIC0wLDAgKzEsNzkgQEANCj4+ICsuLiBfU2VtaWhvc3Rp
bmc6DQo+PiArDQo+PiArU2VtaWhvc3RpbmcNCj4+ICstLS0tLS0tLS0tLQ0KPj4gKw0KPj4g
K1NlbWlob3N0aW5nIGlzIGEgZmVhdHVyZSBwcm92aWRlZCBieSBhIG51bWJlciBvZiBndWVz
dHMgdGhhdCBhbGxvdyB0aGUNCj4+ICtwcm9ncmFtIHJ1bm5pbmcgb24gdGhlIHRhcmdldCB0
byBpbnRlcmFjdCB3aXRoIHRoZSBob3N0IHN5c3RlbS4gT24NCj4+ICtyZWFsIGhhcmR3YXJl
IHRoaXMgaXMgdXN1YWxseSBwcm92aWRlZCBieSBhIGRlYnVnZ2VyIGhvb2tlZCBkaXJlY3Rs
eQ0KPj4gK3RvIHRoZSBzeXN0ZW0uDQo+PiArDQo+PiArR2VuZXJhbGx5IHNlbWlob3N0aW5n
IG1ha2VzIGl0IGVhc2llciB0byBicmluZyB1cCBsb3cgbGV2ZWwgY29kZSBiZWZvcmUgYQ0K
Pj4gK21vcmUgZnVsbHkgZnVuY3Rpb25hbCBvcGVyYXRpbmcgc3lzdGVtIGhhcyBiZWVuIGVu
YWJsZWQuIE9uIFFFTVUgaXQNCj4+ICthbHNvIGFsbG93cyBmb3IgZW1iZWRkZWQgbWljcm8t
Y29udHJvbGxlciBjb2RlIHdoaWNoIHR5cGljYWxseSBkb2Vzbid0DQo+PiAraGF2ZSBhIGZ1
bGwgbGliYyB0byBiZSBydW4gYXMgImJhcmUtbWV0YWwiIGNvZGUgdW5kZXIgUUVNVSdzIHVz
ZXItbW9kZQ0KPj4gK2VtdWxhdGlvbi4gSXQgaXMgYWxzbyB1c2VmdWwgZm9yIHdyaXRpbmcg
dGVzdCBjYXNlcyBhbmQgaW5kZWVkIGENCj4+ICtudW1iZXIgb2YgY29tcGlsZXIgc3VpdGVz
IGFzIHdlbGwgYXMgUUVNVSBpdHNlbGYgdXNlIHNlbWlob3N0aW5nIGNhbGxzDQo+PiArdG8g
ZXhpdCB0ZXN0IGNvZGUgd2hpbGUgcmVwb3J0aW5nIHRoZSBzdWNjZXNzIHN0YXRlLg0KPj4g
Kw0KPj4gK1NlbWlob3N0aW5nIGlzIG9ubHkgYXZhaWxhYmxlIHVzaW5nIFRDRyBlbXVsYXRp
b24uIFRoaXMgaXMgYmVjYXVzZSB0aGUNCj4+ICtpbnN0cnVjdGlvbnMgdG8gdHJpZ2dlciBh
IHNlbWlob3N0aW5nIGNhbGwgYXJlIHR5cGljYWxseSByZXNlcnZlZA0KPj4gK2NhdXNpbmcg
bW9zdCBoeXBlcnZpc29ycyB0byB0cmFwIGFuZCBmYXVsdCBvbiB0aGVtLg0KPj4gKw0KPj4g
Ky4uIHdhcm5pbmc6Og0KPj4gKyAgIFNlbWlob3N0aW5nIGluaGVyZW50bHkgYnlwYXNzZXMg
YW55IGlzb2xhdGlvbiB0aGVyZSBtYXkgYmUgYmV0d2Vlbg0KPj4gKyAgIHRoZSBndWVzdCBh
bmQgdGhlIGhvc3QuIEFzIGEgcmVzdWx0IGEgcHJvZ3JhbSB1c2luZyBzZW1paG9zdGluZyBj
YW4NCj4+ICsgICBoYXBwaWx5IHRyYXNoIHlvdXIgaG9zdCBzeXN0ZW0uIFlvdSBzaG91bGQg
b25seSBldmVyIHJ1biB0cnVzdGVkDQo+PiArICAgY29kZSB3aXRoIHNlbWlob3N0aW5nIGVu
YWJsZWQuDQo+PiArDQo+PiArUmVkaXJlY3Rpb24NCj4+ICt+fn5+fn5+fn5+fg0KPj4gKw0K
Pj4gK1NlbWlob3N0aW5nIGNhbGxzIGNhbiBiZSByZS1kaXJlY3RlZCB0byBhIChwb3RlbnRp
YWxseSByZW1vdGUpIGdkYg0KPj4gK2R1cmluZyBkZWJ1Z2dpbmcgdmlhIHRoZSA6cmVmOmBn
ZGJzdHViPEdEQiB1c2FnZT5gLiBPdXRwdXQgdG8gdGhlDQo+PiArc2VtaWhvc3RpbmcgY29u
c29sZSBpcyBjb25maWd1cmVkIGFzIGEgYGBjaGFyZGV2YGAgc28gY2FuIGJlDQo+PiArcmVk
aXJlY3RlZCB0byBhIGZpbGUsIHBpcGUgb3Igc29ja2V0IGxpa2UgYW55IG90aGVyIGBgY2hh
cmRldmBgDQo+PiArZGV2aWNlLg0KPj4gKw0KPj4gK1NlZSA6cmVmOmBTZW1paG9zdGluZyBP
cHRpb25zPFNlbWlob3N0aW5nIE9wdGlvbnM+YCBmb3IgZGV0YWlscy4NCj4+ICsNCj4+ICtT
dXBwb3J0ZWQgVGFyZ2V0cw0KPj4gK35+fn5+fn5+fn5+fn5+fn5+DQo+PiArDQo+PiArTW9z
dCB0YXJnZXRzIG9mZmVyIGEgc2ltaWxhciBzZW1paG9zdGluZyBpbXBsZW1lbnRhdGlvbnMg
d2l0aCBzb21lDQo+PiArbWlub3IgY2hhbmdlcyB0byBkZWZpbmUgdGhlIGFwcHJvcHJpYXRl
IGluc3RydWN0aW9uIHRvIGVuY29kZSB0aGUNCj4+ICtzZW1paG9zdGluZyBjYWxsIGFuZCB3
aGljaCByZWdpc3RlcnMgaG9sZCB0aGUgcGFyYW1ldGVycy4gVGhleSB0ZW5kIHRvDQo+PiAr
cHJlc2VudHMgYSBzaW1wbGUgUE9TSVgtbGlrZSBBUEkgd2hpY2ggYWxsb3dzIHlvdXIgcHJv
Z3JhbSB0byByZWFkIGFuZA0KPj4gK3dyaXRlIGZpbGVzLCBhY2Nlc3MgdGhlIGNvbnNvbGUg
YW5kIHNvbWUgb3RoZXIgYmFzaWMgaW50ZXJhY3Rpb25zLg0KPj4gKw0KPj4gKy4uIG5vdGU6
Og0KPj4gKyAgIFFFTVUgbWFrZXMgYW4gaW1wbGVtZW50YXRpb24gZGVjaXNpb24gdG8gaW1w
bGVtZW50IGFsbCBmaWxlIGFjY2Vzcw0KPj4gKyAgIGluIGBgT19CSU5BUllgYCBtb2RlIHJl
Z2FyZGxlc3Mgb2YgdGhlIGhvc3Qgb3BlcmF0aW5nIHN5c3RlbS4gVGhpcw0KPj4gKyAgIGlz
IGJlY2F1c2UgZ2RiIHNlbWlob3N0aW5nIHN1cHBvcnQgZG9lc24ndCBtYWtlIHRoZSBkaXN0
aW5jdGlvbg0KPj4gKyAgIGJldHdlZW4gdGhlIG1vZGVzIGFuZCBtYWdpY2FsbHkgcHJvY2Vz
c2luZyBsaW5lIGVuZGluZ3MgY2FuIGJlIGNvbmZ1c2luZy4NCj4+ICsNCj4+ICsuLiBsaXN0
LXRhYmxlOjogR3Vlc3QgQXJjaGl0ZWN0dXJlcyBzdXBwb3J0aW5nIFNlbWlob3N0aW5nDQo+
PiArICA6d2lkdGhzOiAxMCAxMCA4MA0KPj4gKyAgOmhlYWRlci1yb3dzOiAxDQo+PiArDQo+
PiArICAqIC0gQXJjaGl0ZWN0dXJlDQo+PiArICAgIC0gTW9kZXMNCj4+ICsgICAgLSBTcGVj
aWZpY2F0aW9uDQo+PiArICAqIC0gQXJtDQo+PiArICAgIC0gU3lzdGVtIGFuZCBVc2VyLW1v
ZGUNCj4+ICsgICAgLWh0dHBzOi8vZ2l0aHViLmNvbS9BUk0tc29mdHdhcmUvYWJpLWFhL2Js
b2IvbWFpbi9zZW1paG9zdGluZy9zZW1paG9zdGluZy5yc3QNCj4+ICsgICogLSBtNjhrDQo+
PiArICAgIC0gU3lzdGVtDQo+PiArICAgIC1odHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/
cD1uZXdsaWItY3lnd2luLmdpdDthPWJsb2I7Zj1saWJnbG9zcy9tNjhrL202OGstc2VtaS50
eHQ7aGI9SEVBRA0KPj4gKyAgKiAtIG1pcHMNCj4+ICsgICAgLSBTeXN0ZW0NCj4+ICsgICAg
LSBVbmlmaWVkIEhvc3RpbmcgSW50ZXJmYWNlIChNRDAxMDY5KQ0KPj4gKyAgKiAtIE5pb3Mg
SUkNCj4+ICsgICAgLSBTeXN0ZW0NCj4+ICsgICAgLWh0dHBzOi8vc291cmNld2FyZS5vcmcv
Z2l0L2dpdHdlYi5jZ2k/cD1uZXdsaWItY3lnd2luLmdpdDthPWJsb2I7Zj1saWJnbG9zcy9u
aW9zMi9uaW9zMi1zZW1pLnR4dDtoYj1IRUFEDQo+PiArICAqIC0gUklTQy1WDQo+PiArICAg
IC0gU3lzdGVtIGFuZCBVc2VyLW1vZGUNCj4+ICsgICAgLWh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi9yaXNjdi1zZW1paG9zdGluZy1zcGVjL2Jsb2IvbWFpbi9yaXNjdi1zZW1paG9zdGlu
Zy1zcGVjLmFkb2MNCj4+ICsgICogLSBYdGVuc2ENCj4+ICsgICAgLSBTeXN0ZW0NCj4+ICsg
ICAgLSBUZW5zaWxpY2EgSVNTIFNJTUNBTEwNCj4+IGRpZmYgLS1naXQgYS9xZW11LW9wdGlv
bnMuaHggYi9xZW11LW9wdGlvbnMuaHgNCj4+IGluZGV4IDNhYTNhMmY1YTMuLmRlM2EzNjhm
NTggMTAwNjQ0DQo+PiAtLS0gYS9xZW11LW9wdGlvbnMuaHgNCj4+ICsrKyBiL3FlbXUtb3B0
aW9ucy5oeA0KPj4gQEAgLTQ2MzMsMTAgKzQ2MzMsMTMgQEAgREVGKCJzZW1paG9zdGluZyIs
IDAsIFFFTVVfT1BUSU9OX3NlbWlob3N0aW5nLA0KPj4gICAgICAgUUVNVV9BUkNIX01JUFMg
fCBRRU1VX0FSQ0hfTklPUzIgfCBRRU1VX0FSQ0hfUklTQ1YpDQo+PiAgIFNSU1QNCj4+ICAg
YGAtc2VtaWhvc3RpbmdgYA0KPj4gLSAgICBFbmFibGUgc2VtaWhvc3RpbmcgbW9kZSAoQVJN
LCBNNjhLLCBYdGVuc2EsIE1JUFMsIE5pb3MgSUksIFJJU0MtViBvbmx5KS4NCj4+ICsgICAg
RW5hYmxlIDpyZWY6YFNlbWlob3N0aW5nYCBtb2RlIChBUk0sIE02OEssIFh0ZW5zYSwgTUlQ
UywgTmlvcyBJSSwgUklTQy1WIG9ubHkpLg0KPj4gICANCj4+IC0gICAgTm90ZSB0aGF0IHRo
aXMgYWxsb3dzIGd1ZXN0IGRpcmVjdCBhY2Nlc3MgdG8gdGhlIGhvc3QgZmlsZXN5c3RlbSwg
c28NCj4+IC0gICAgc2hvdWxkIG9ubHkgYmUgdXNlZCB3aXRoIGEgdHJ1c3RlZCBndWVzdCBP
Uy4NCj4+ICsgICAgLi4gd2FybmluZzo6DQo+PiArICAgICAgTm90ZSB0aGF0IHRoaXMgYWxs
b3dzIGd1ZXN0IGRpcmVjdCBhY2Nlc3MgdG8gdGhlIGhvc3QgZmlsZXN5c3RlbSwgc28NCj4+
ICsgICAgICBzaG91bGQgb25seSBiZSB1c2VkIHdpdGggYSB0cnVzdGVkIGd1ZXN0IE9TLg0K
Pj4gKw0KPj4gKyAgICAuLiBfU2VtaWhvc3RpbmcgT3B0aW9uczoNCj4+ICAgDQo+PiAgICAg
ICBTZWUgdGhlIC1zZW1paG9zdGluZy1jb25maWcgb3B0aW9uIGRvY3VtZW50YXRpb24gZm9y
IGZ1cnRoZXINCj4+ICAgICAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBmYWNpbGl0aWVzIHRo
aXMgZW5hYmxlcy4NCj4+IEBAIC00NjQ4LDIyICs0NjUxLDEyIEBAIFFFTVVfQVJDSF9BUk0g
fCBRRU1VX0FSQ0hfTTY4SyB8IFFFTVVfQVJDSF9YVEVOU0EgfA0KPj4gICBRRU1VX0FSQ0hf
TUlQUyB8IFFFTVVfQVJDSF9OSU9TMiB8IFFFTVVfQVJDSF9SSVNDVikNCj4+ICAgU1JTVA0K
Pj4gICBgYC1zZW1paG9zdGluZy1jb25maWcgW2VuYWJsZT1vbnxvZmZdWyx0YXJnZXQ9bmF0
aXZlfGdkYnxhdXRvXVssY2hhcmRldj1pZF1bLHVzZXJzcGFjZT1vbnxvZmZdWyxhcmc9c3Ry
WywuLi5dXWBgDQo+PiAtICAgIEVuYWJsZSBhbmQgY29uZmlndXJlIHNlbWlob3N0aW5nIChB
Uk0sIE02OEssIFh0ZW5zYSwgTUlQUywgTmlvcyBJSSwgUklTQy1WDQo+PiArICAgIEVuYWJs
ZSBhbmQgY29uZmlndXJlIDpyZWY6YFNlbWlob3N0aW5nYCAoQVJNLCBNNjhLLCBYdGVuc2Es
IE1JUFMsIE5pb3MgSUksIFJJU0MtVg0KPj4gICAgICAgb25seSkuDQo+PiAgIA0KPj4gLSAg
ICBOb3RlIHRoYXQgdGhpcyBhbGxvd3MgZ3Vlc3QgZGlyZWN0IGFjY2VzcyB0byB0aGUgaG9z
dCBmaWxlc3lzdGVtLCBzbw0KPj4gLSAgICBzaG91bGQgb25seSBiZSB1c2VkIHdpdGggYSB0
cnVzdGVkIGd1ZXN0IE9TLg0KPj4gLQ0KPj4gLSAgICBPbiBBcm0gdGhpcyBpbXBsZW1lbnRz
IHRoZSBzdGFuZGFyZCBzZW1paG9zdGluZyBBUEksIHZlcnNpb24gMi4wLg0KPj4gLQ0KPj4g
LSAgICBPbiBNNjhLIHRoaXMgaW1wbGVtZW50cyB0aGUgIkNvbGRGaXJlIEdEQiIgaW50ZXJm
YWNlIHVzZWQgYnkNCj4+IC0gICAgbGliZ2xvc3MuDQo+PiAtDQo+PiAtICAgIFh0ZW5zYSBz
ZW1paG9zdGluZyBwcm92aWRlcyBiYXNpYyBmaWxlIElPIGNhbGxzLCBzdWNoIGFzDQo+PiAt
ICAgIG9wZW4vcmVhZC93cml0ZS9zZWVrL3NlbGVjdC4gVGVuc2lsaWNhIGJhcmVtZXRhbCBs
aWJjIGZvciBJU1MgYW5kDQo+PiAtICAgIGxpbnV4IHBsYXRmb3JtICJzaW0iIHVzZSB0aGlz
IGludGVyZmFjZS4NCj4+IC0NCj4+IC0gICAgT24gUklTQy1WIHRoaXMgaW1wbGVtZW50cyB0
aGUgc3RhbmRhcmQgc2VtaWhvc3RpbmcgQVBJLCB2ZXJzaW9uIDAuMi4NCj4+ICsgICAgLi4g
d2FybmluZzo6DQo+PiArICAgICAgTm90ZSB0aGF0IHRoaXMgYWxsb3dzIGd1ZXN0IGRpcmVj
dCBhY2Nlc3MgdG8gdGhlIGhvc3QgZmlsZXN5c3RlbSwgc28NCj4+ICsgICAgICBzaG91bGQg
b25seSBiZSB1c2VkIHdpdGggYSB0cnVzdGVkIGd1ZXN0IE9TLg0KPj4gICANCj4+ICAgICAg
IGBgdGFyZ2V0PW5hdGl2ZXxnZGJ8YXV0b2BgDQo+PiAgICAgICAgICAgRGVmaW5lcyB3aGVy
ZSB0aGUgc2VtaWhvc3RpbmcgY2FsbHMgd2lsbCBiZSBhZGRyZXNzZWQsIHRvIFFFTVUNCj4N
Ci0tIA0KDQoqVmluY2VudCBEdXBhcXVpcyoNClNvZnR3YXJlIHNlY3VyaXR5ICYgQ3J5cHRv
Z3JhcGh5IGV4cGVydA0KMDYgMjQgNTggMTcgMDUNCi9FdXJvcGFyYyBkZSBQaWNoYXVyeSBC
w6J0aW1lbnQgQjggMTMzMCBydWUgR3VpbGxpYmVydCBHYXV0aWVyIGRlIGxhIA0KTGF1emnD
qHJlIDEzMjkwIEFpeC1lbi1Qcm92ZW5jZS8NCg0Kd3d3LnRydXN0ZWQtb2JqZWN0cy5jb20g
PGh0dHA6Ly93d3cudHJ1c3RlZC1vYmplY3RzLmNvbT4NCg==
--------------JenX0E0t6jtFFFE8r6Nse9s0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hello,</p>
    <p>It seems I was missing the "-mon serial:stdio" option, indeed it
      looks as only this makes it work.</p>
    <p>Thanks a lot !</p>
    <p>Best regards,</p>
    <p>Vincent.<br>
    </p>
    <div class=3D"moz-cite-prefix">Le 19/01/2023 =C3=A0 18:39, Alex Benn=C3=
=A9e a
      =C3=A9crit=C2=A0:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:87sfg6xvgm.fsf@linaro.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
vincent Dupaquis <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:v.dupa=
quis@trusted-objects.com">&lt;v.dupaquis@trusted-objects.com&gt;</a> writ=
es:

(cc: chardev backend maintainers)

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">[[PGP Signed Part:Undecide=
d]]
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
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
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

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
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

--------------JenX0E0t6jtFFFE8r6Nse9s0--

--------------0O11Bo74NEsQTrXMm0Atzw0O--

--------------1Cn4PzZ4p7qyIdSSpLW3QfGI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJpYkOsZemdq4v9TTIvVZ6MpT9wkFAmPKRrgFAwAAAAAACgkQIvVZ6MpT9wm0
zRAAioKYToZUdkHR4e8RD82M6ktdZYecj9EcBORGG/Lju4zIx/aQf3UKWGy+uLzu4gTuQspFJNYK
FWTtGF3csgRW6fihYZL8mJAwlVKfnMTvNnFyNHQT6EQ/99TKvOBaVc/UaR4pHXtbFr6PB2sVCKT8
QJmTUgNgh2Vfhl6z69JZe7geO0KE6luEcTzPOo9iuLX362Z83sOc7uIzo07m5P4/e/QAbY6dfwDq
lPh9nmwGnWJLDnX/HPjzEsrI5vCUXGzCaMqpxJap/OpDCocbx451YROMzG3Gb3IJvmBXnSmOCiXb
zKdDeaqvagssTx5cMMNu0fwIGXUW+eBGDDKmLqWc0RJdhKNFE6j0VEQpp0yul0Xtc1Rz2mVFPbR5
GwrWkb1yevBGDHChYAefByYumkAuMiopm6388m6XjIGvg+T30LmXAEQj6a+EfiGRucwsnLnnOxke
VnueHo80TLv0Tcb394FgN7U+hhPKU2f6+HgzxfmQ9FFGgMtCal8JK9Lxf2AIkJkc7pj5QPUSppS3
x6Av5N4xHMzAfZ5GTr7kAm/2ZH8ppJXesMRbeLECgpP24ggMZm5rCwgVRwiJxCJVSYCTxLGQHE9U
DirabTrZRbxY9Vy9H5W8WvQu0goRqq3Jot61lrQBsoiyU01UnEFklH01sDfC9rA876O12gakZkoY
vu4=
=udN7
-----END PGP SIGNATURE-----

--------------1Cn4PzZ4p7qyIdSSpLW3QfGI--
