Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp479105ejc;
        Thu, 19 Jan 2023 09:02:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt53a5RmrtD5tdisjSOU2GXOGBWE4nWuwXeOdCoCyQy1lKjjA0kNnfahjSeqXu4nE332Zac
X-Received: by 2002:a05:6808:1209:b0:364:7d13:acf with SMTP id a9-20020a056808120900b003647d130acfmr6725148oil.13.1674147754976;
        Thu, 19 Jan 2023 09:02:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674147754; cv=none;
        d=google.com; s=arc-20160816;
        b=ZKLK2013cb8XF7YiAD+tEOnJs9lnjNHcymtJtqDb9pL/OLzPlrupxbjrqEWlSvV5NM
         hc/+jrS3phjg6DZWpoltBFCkfbYMHUekAVETOYBlcr8uoQjfXdJydzIIWH/jg19Op4k2
         xeM4vHpe/nJLBTnZYhNTCp8BPXKN9EqoxWzJIe0sdjjBqh9mvzxHdmg+qU1qVArRZADY
         slXzDJHWylx+DdQlf/ieTKxpViPBUw71YwOjvjSA/ymrVhVCci2VHNRCklLnYpwUN4yU
         uU+Jeg3VIcI3h18ON/sokkwdz2zPkfGhjncLLbKVIWA4REawa8mvcKMBXw3cptXghl4Z
         XOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=a8hx3yFY3JuV8P7YBzSmdObMfsJ5Q4M6BDqCnBSqBrU=;
        b=R4EGH/jQcO9iSIoj+m8kOayWjtb7bINUcpRCm1b3w0+83Wqx9neFHZ/QY3L/aHUdSM
         Y/VygQDnBbuPdppINMHjBsFHwJ0bamYvm+pnTmJBCvWXN0xIsKG5qMENVi6wlVemWIu2
         aw4nqUy1L545CuhMM46/W5lS3ln/r8h34HMEfzv3R2JsJyh1hlBCIO4BDdNznAqXjqOF
         uHYU9CFIDrUDTbMGdXsCuUsme2J/9w1Qa99rU8prpH2oAOMZrFak94YNn2fx6gTkuE5/
         uJuyxxMpnjjD/HWNP9Rs/q+MPCpFQsACc8B0GVGg+DL+NvFa0V1p5sHhbr0Cp5aTdDHe
         oGdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10-20020a05621419ca00b00534dff21fccsi9529904qvc.151.2023.01.19.09.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 09:02:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIYJ5-0003cd-Iq; Thu, 19 Jan 2023 12:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1pIYIo-0003Sp-Bw
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 12:02:15 -0500
Received: from mailex.trusted-objects.com ([2001:41d0:117:e400::877d:2338])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1pIYIj-0002n0-QA
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 12:02:12 -0500
Received: from [192.170.0.200] (88.127.245.42) by S1056330.EX76918.lan
 (2001:41d0:117:e400::877d:2338) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Thu, 19 Jan
 2023 17:52:46 +0100
Message-ID: <fe4ae917-5132-e670-0604-c28b8c4e1599@trusted-objects.com>
Date: Thu, 19 Jan 2023 17:51:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Diificulties with qemu-system-arm semihosting
Content-Language: fr-FR
To: <qemu-arm@nongnu.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-17-alex.bennee@linaro.org>
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
In-Reply-To: <20230110173922.265055-17-alex.bennee@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zbDV0np80IcaLuOWC2ch6gCc"
X-Originating-IP: [88.127.245.42]
X-ClientProxiedBy: S1056330.EX76918.lan (2001:41d0:117:e400::877d:2338) To
 S1056330.EX76918.lan (2001:41d0:117:e400::877d:2338)
Received-SPF: none client-ip=2001:41d0:117:e400::877d:2338;
 envelope-from=v.dupaquis@trusted-objects.com; helo=mailex.trusted-objects.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Yl4r5cSv0LVG

--------------zbDV0np80IcaLuOWC2ch6gCc
Content-Type: multipart/mixed; boundary="------------dfrpslGadynpQNsDVuUJr2ma";
 protected-headers="v1"
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
To: qemu-arm@nongnu.org
Message-ID: <fe4ae917-5132-e670-0604-c28b8c4e1599@trusted-objects.com>
Subject: Diificulties with qemu-system-arm semihosting
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-17-alex.bennee@linaro.org>
In-Reply-To: <20230110173922.265055-17-alex.bennee@linaro.org>

--------------dfrpslGadynpQNsDVuUJr2ma
Content-Type: multipart/alternative;
 boundary="------------ATK00qbG0F2erwjSvIGtkqyG"

--------------ATK00qbG0F2erwjSvIGtkqyG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkkndmUgdHJpZWQgdG8gdXNlIHRoZSBzZW1paG9zdGluZyBvbiBxZW11LXN5
c3RlbS1hcm0gKHZlcnNpb24gNy4wKSwgYW5kIA0Kd2FzIG5vdCBhYmxlIHRvIHJlZGlyZWN0
IHRoZSBpbnB1dC9vdXRwdXQgdG8gYSBwaXBlLCBmb3IgaW5zdGFuY2UuDQoNCkl0IHNlZW1z
IEkndmUgZGVjbGFyZWQgdGhlIGNoYXJkZXYgY29ycmVjdGx5IGFzIEkgZG8gbm90IGdldCBh
bnkgZXJyb3IgDQptZXNzYWdlLCBidXQgaW1wb3NzaWJsZSBmb3IgbWUgdG8gcmVkaXJlY3Qg
dGhlIGlucHV0L291dHB1dCBzdHJlYW1zLiBJIA0KaGFkIHRvIHJlZGlyZWN0IHN0ZG91dCB1
c2luZyB0ZWUgYW5kIGZvdW5kIGFub3RoZXIgd2F5IHRvIGFjY2VzcyBzdGRpbiANCih0aHJv
dWdoIHRoZSAvZGV2L3B0cy94IGRldmljZSBJIGNhbiBvYnRhaW4gdGhyb3VnaCB0aGUgcHMg
Y29tbWFuZCkuDQoNCkkgZGlnZ2VkIGludG8gdGhlIHNvdXJjZXMgdG8gdW5kZXJzdGFuZCB3
aGF0IEkgd2FzIGRvaW5nIHdyb25nLCBhbmQgDQpjb3VsZCBub3QgOigNCg0KSGFzIGFueW9u
ZSBldmVyIHRyaWVkIHRvIHJlZGlyZWN0IGJvdGggc3Rkb3V0L3N0ZGluIHdoaWxlIHVzaW5n
IA0Kc2VtaWhvc3RpbmcgPw0KDQpTaG91bGQgSSBleHBlY3QgYSBuZXcgYmVoYXZpb3VyIHdp
dGggdGhlIGxhdGVzdCB2ZXJzaW9uID8NCg0KSSB3YXMgdXNpbmcgdGhlIGZvbGxvd2luZyBv
cHRpb25zIDoNCg0KLXNlbWlob3N0aW5nIC1jaGFyZGV2IHBpcGUsaWQ9cGlwb3V0LHBhdGg9
cGlwb3V0IC1zZW1paG9zdGluZy1jb25maWcgDQplbmFibGU9b24sY2hhcmRldj1waXBvdXQN
Cg0KdGhlIHBpcGUgYmVpbmcgY3JlYXRlZCB1c2luZyBta2ZpZm8gcGlwb3V0IGJlZm9yZWhh
bmQuDQoNClJlZ2FyZHMsDQoNClZpbmNlbnQuDQoNCg0KTGUgMTAvMDEvMjAyMyDDoCAxODoz
OSwgQWxleCBCZW5uw6llIGEgw6ljcml0wqA6DQo+IFRoZSBtYWluIHJlYXNvbiB0byBkbyB0
aGlzIGlzIHRvIGRvY3VtZW50IG91ciBPX0JJTkFSWSBpbXBsZW1lbnRhdGlvbg0KPiBkZWNp
c2lvbiBzb21ld2hlcmUuIEhvd2V2ZXIgSSd2ZSBhbHNvIG1vdmVkIHNvbWUgb2YgdGhlIGlt
cGxlbWVudGF0aW9uDQo+IGRldGFpbHMgb3V0IG9mIHFlbXUtb3B0aW9ucyBhbmQgYWRkZWQg
bGlua3MgYmV0d2VlbiB0aGUgdHdvLiBBcyBhDQo+IGJvbnVzIEkndmUgaGlnaGxpZ2h0ZWQg
dGhlIHNjYXJ5IHdhcm5pbmdzIGFib3V0IGhvc3QgYWNjZXNzIHdpdGggdGhlDQo+IGFwcHJv
cHJpYXRlIFJTVCB0YWdzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWU8YWxl
eC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgZG9jcy9hYm91dC9mZWF0dXJlcy5y
c3QgICAgfCAxMCArKy0tLQ0KPiAgIGRvY3Mvc3BlY3MvaW5kZXgucnN0ICAgICAgIHwgIDEg
Kw0KPiAgIGRvY3Mvc3BlY3Mvc2VtaWhvc3RpbmcucnN0IHwgNzkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gICBxZW11LW9wdGlvbnMuaHggICAgICAgICAg
ICB8IDI3ICsrKysrLS0tLS0tLS0NCj4gICA0IGZpbGVzIGNoYW5nZWQsIDk1IGluc2VydGlv
bnMoKyksIDIyIGRlbGV0aW9ucygtKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL3Nw
ZWNzL3NlbWlob3N0aW5nLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvZG9jcy9hYm91dC9mZWF0
dXJlcy5yc3QgYi9kb2NzL2Fib3V0L2ZlYXR1cmVzLnJzdA0KPiBpbmRleCAwODA4YzM1YTRh
Li5hZWQwZjliOWEyIDEwMDY0NA0KPiAtLS0gYS9kb2NzL2Fib3V0L2ZlYXR1cmVzLnJzdA0K
PiArKysgYi9kb2NzL2Fib3V0L2ZlYXR1cmVzLnJzdA0KPiBAQCAtMTg3LDExICsxODcsMTEg
QEAgU2VlIGBVc2VyIE1vZGUgRW11bGF0aW9uYCBmb3IgbW9yZSBkZXRhaWxzIG9uIHJ1bm5p
bmcgaW4gdGhpcyBtb2RlLg0KPiAgIFNlbWlob3N0aW5nDQo+ICAgfn5+fn5+fn5+fn5+DQo+
ICAgDQo+IC1BIG51bWJlciBvZiBndWVzdCBhcmNoaXRlY3R1cmUgc3VwcG9ydCBzZW1paG9z
dGluZyB3aGljaCBwcm92aWRlcyBhDQo+IC13YXkgZm9yIGd1ZXN0IHByb2dyYW1zIHRvIGFj
Y2VzcyB0aGUgaG9zdCBzeXN0ZW0gdGhvdWdoIGEgUE9TSVgtbGlrZQ0KPiAtc3lzdGVtIGNh
bGwgbGF5ZXIuIFRoaXMgaGFzIGFwcGxpY2F0aW9ucyBmb3IgZWFybHkgc29mdHdhcmUgYnJp
bmctdXANCj4gLW1ha2luZyBpdCBlYXN5IGZvciBhIGd1ZXN0IHRvIGR1bXAgZGF0YSBvciBy
ZWFkIGNvbmZpZ3VyYXRpb24gZmlsZXMNCj4gLWJlZm9yZSBhIGZ1bGwgb3BlcmF0aW5nIHN5
c3RlbSBpcyBpbXBsZW1lbnRlZC4NCj4gK0EgbnVtYmVyIG9mIGd1ZXN0IGFyY2hpdGVjdHVy
ZSBzdXBwb3J0IDpyZWY6YFNlbWlob3N0aW5nYCB3aGljaA0KPiArcHJvdmlkZXMgYSB3YXkg
Zm9yIGd1ZXN0IHByb2dyYW1zIHRvIGFjY2VzcyB0aGUgaG9zdCBzeXN0ZW0gdGhvdWdoIGEN
Cj4gK1BPU0lYLWxpa2Ugc3lzdGVtIGNhbGwgbGF5ZXIuIFRoaXMgaGFzIGFwcGxpY2F0aW9u
cyBmb3IgZWFybHkgc29mdHdhcmUNCj4gK2JyaW5nLXVwIG1ha2luZyBpdCBlYXN5IGZvciBh
IGd1ZXN0IHRvIGR1bXAgZGF0YSBvciByZWFkIGNvbmZpZ3VyYXRpb24NCj4gK2ZpbGVzIGJl
Zm9yZSBhIGZ1bGwgb3BlcmF0aW5nIHN5c3RlbSBpcyBpbXBsZW1lbnRlZC4NCj4gICANCj4g
ICBTb21lIG9mIHRob3NlIGd1ZXN0IGFyY2hpdGVjdHVyZXMgYWxzbyBzdXBwb3J0IHNlbWlo
b3N0aW5nIGluDQo+ICAgdXNlci1tb2RlIG1ha2luZyB0aGUgdGVzdGluZyBvZiAiYmFyZS1t
ZXRhbCIgbWljcm8tY29udHJvbGxlciBjb2RlDQo+IGRpZmYgLS1naXQgYS9kb2NzL3NwZWNz
L2luZGV4LnJzdCBiL2RvY3Mvc3BlY3MvaW5kZXgucnN0DQo+IGluZGV4IGE1OGQ5MzExY2Iu
LmI0NmExNmIyYzggMTAwNjQ0DQo+IC0tLSBhL2RvY3Mvc3BlY3MvaW5kZXgucnN0DQo+ICsr
KyBiL2RvY3Mvc3BlY3MvaW5kZXgucnN0DQo+IEBAIC0yMSwzICsyMSw0IEBAIGd1ZXN0IGhh
cmR3YXJlIHRoYXQgaXMgc3BlY2lmaWMgdG8gUUVNVS4NCj4gICAgICBhY3BpX2Vyc3QNCj4g
ICAgICBzZXYtZ3Vlc3QtZmlybXdhcmUNCj4gICAgICBmd19jZmcNCj4gKyAgIHNlbWlob3N0
aW5nDQo+IGRpZmYgLS1naXQgYS9kb2NzL3NwZWNzL3NlbWlob3N0aW5nLnJzdCBiL2RvY3Mv
c3BlY3Mvc2VtaWhvc3RpbmcucnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IDAwMDAwMDAwMDAuLjM0M2ViNGJiYjMNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kb2Nz
L3NwZWNzL3NlbWlob3N0aW5nLnJzdA0KPiBAQCAtMCwwICsxLDc5IEBADQo+ICsuLiBfU2Vt
aWhvc3Rpbmc6DQo+ICsNCj4gK1NlbWlob3N0aW5nDQo+ICstLS0tLS0tLS0tLQ0KPiArDQo+
ICtTZW1paG9zdGluZyBpcyBhIGZlYXR1cmUgcHJvdmlkZWQgYnkgYSBudW1iZXIgb2YgZ3Vl
c3RzIHRoYXQgYWxsb3cgdGhlDQo+ICtwcm9ncmFtIHJ1bm5pbmcgb24gdGhlIHRhcmdldCB0
byBpbnRlcmFjdCB3aXRoIHRoZSBob3N0IHN5c3RlbS4gT24NCj4gK3JlYWwgaGFyZHdhcmUg
dGhpcyBpcyB1c3VhbGx5IHByb3ZpZGVkIGJ5IGEgZGVidWdnZXIgaG9va2VkIGRpcmVjdGx5
DQo+ICt0byB0aGUgc3lzdGVtLg0KPiArDQo+ICtHZW5lcmFsbHkgc2VtaWhvc3RpbmcgbWFr
ZXMgaXQgZWFzaWVyIHRvIGJyaW5nIHVwIGxvdyBsZXZlbCBjb2RlIGJlZm9yZSBhDQo+ICtt
b3JlIGZ1bGx5IGZ1bmN0aW9uYWwgb3BlcmF0aW5nIHN5c3RlbSBoYXMgYmVlbiBlbmFibGVk
LiBPbiBRRU1VIGl0DQo+ICthbHNvIGFsbG93cyBmb3IgZW1iZWRkZWQgbWljcm8tY29udHJv
bGxlciBjb2RlIHdoaWNoIHR5cGljYWxseSBkb2Vzbid0DQo+ICtoYXZlIGEgZnVsbCBsaWJj
IHRvIGJlIHJ1biBhcyAiYmFyZS1tZXRhbCIgY29kZSB1bmRlciBRRU1VJ3MgdXNlci1tb2Rl
DQo+ICtlbXVsYXRpb24uIEl0IGlzIGFsc28gdXNlZnVsIGZvciB3cml0aW5nIHRlc3QgY2Fz
ZXMgYW5kIGluZGVlZCBhDQo+ICtudW1iZXIgb2YgY29tcGlsZXIgc3VpdGVzIGFzIHdlbGwg
YXMgUUVNVSBpdHNlbGYgdXNlIHNlbWlob3N0aW5nIGNhbGxzDQo+ICt0byBleGl0IHRlc3Qg
Y29kZSB3aGlsZSByZXBvcnRpbmcgdGhlIHN1Y2Nlc3Mgc3RhdGUuDQo+ICsNCj4gK1NlbWlo
b3N0aW5nIGlzIG9ubHkgYXZhaWxhYmxlIHVzaW5nIFRDRyBlbXVsYXRpb24uIFRoaXMgaXMg
YmVjYXVzZSB0aGUNCj4gK2luc3RydWN0aW9ucyB0byB0cmlnZ2VyIGEgc2VtaWhvc3Rpbmcg
Y2FsbCBhcmUgdHlwaWNhbGx5IHJlc2VydmVkDQo+ICtjYXVzaW5nIG1vc3QgaHlwZXJ2aXNv
cnMgdG8gdHJhcCBhbmQgZmF1bHQgb24gdGhlbS4NCj4gKw0KPiArLi4gd2FybmluZzo6DQo+
ICsgICBTZW1paG9zdGluZyBpbmhlcmVudGx5IGJ5cGFzc2VzIGFueSBpc29sYXRpb24gdGhl
cmUgbWF5IGJlIGJldHdlZW4NCj4gKyAgIHRoZSBndWVzdCBhbmQgdGhlIGhvc3QuIEFzIGEg
cmVzdWx0IGEgcHJvZ3JhbSB1c2luZyBzZW1paG9zdGluZyBjYW4NCj4gKyAgIGhhcHBpbHkg
dHJhc2ggeW91ciBob3N0IHN5c3RlbS4gWW91IHNob3VsZCBvbmx5IGV2ZXIgcnVuIHRydXN0
ZWQNCj4gKyAgIGNvZGUgd2l0aCBzZW1paG9zdGluZyBlbmFibGVkLg0KPiArDQo+ICtSZWRp
cmVjdGlvbg0KPiArfn5+fn5+fn5+fn4NCj4gKw0KPiArU2VtaWhvc3RpbmcgY2FsbHMgY2Fu
IGJlIHJlLWRpcmVjdGVkIHRvIGEgKHBvdGVudGlhbGx5IHJlbW90ZSkgZ2RiDQo+ICtkdXJp
bmcgZGVidWdnaW5nIHZpYSB0aGUgOnJlZjpgZ2Ric3R1YjxHREIgdXNhZ2U+YC4gT3V0cHV0
IHRvIHRoZQ0KPiArc2VtaWhvc3RpbmcgY29uc29sZSBpcyBjb25maWd1cmVkIGFzIGEgYGBj
aGFyZGV2YGAgc28gY2FuIGJlDQo+ICtyZWRpcmVjdGVkIHRvIGEgZmlsZSwgcGlwZSBvciBz
b2NrZXQgbGlrZSBhbnkgb3RoZXIgYGBjaGFyZGV2YGANCj4gK2RldmljZS4NCj4gKw0KPiAr
U2VlIDpyZWY6YFNlbWlob3N0aW5nIE9wdGlvbnM8U2VtaWhvc3RpbmcgT3B0aW9ucz5gIGZv
ciBkZXRhaWxzLg0KPiArDQo+ICtTdXBwb3J0ZWQgVGFyZ2V0cw0KPiArfn5+fn5+fn5+fn5+
fn5+fn4NCj4gKw0KPiArTW9zdCB0YXJnZXRzIG9mZmVyIGEgc2ltaWxhciBzZW1paG9zdGlu
ZyBpbXBsZW1lbnRhdGlvbnMgd2l0aCBzb21lDQo+ICttaW5vciBjaGFuZ2VzIHRvIGRlZmlu
ZSB0aGUgYXBwcm9wcmlhdGUgaW5zdHJ1Y3Rpb24gdG8gZW5jb2RlIHRoZQ0KPiArc2VtaWhv
c3RpbmcgY2FsbCBhbmQgd2hpY2ggcmVnaXN0ZXJzIGhvbGQgdGhlIHBhcmFtZXRlcnMuIFRo
ZXkgdGVuZCB0bw0KPiArcHJlc2VudHMgYSBzaW1wbGUgUE9TSVgtbGlrZSBBUEkgd2hpY2gg
YWxsb3dzIHlvdXIgcHJvZ3JhbSB0byByZWFkIGFuZA0KPiArd3JpdGUgZmlsZXMsIGFjY2Vz
cyB0aGUgY29uc29sZSBhbmQgc29tZSBvdGhlciBiYXNpYyBpbnRlcmFjdGlvbnMuDQo+ICsN
Cj4gKy4uIG5vdGU6Og0KPiArICAgUUVNVSBtYWtlcyBhbiBpbXBsZW1lbnRhdGlvbiBkZWNp
c2lvbiB0byBpbXBsZW1lbnQgYWxsIGZpbGUgYWNjZXNzDQo+ICsgICBpbiBgYE9fQklOQVJZ
YGAgbW9kZSByZWdhcmRsZXNzIG9mIHRoZSBob3N0IG9wZXJhdGluZyBzeXN0ZW0uIFRoaXMN
Cj4gKyAgIGlzIGJlY2F1c2UgZ2RiIHNlbWlob3N0aW5nIHN1cHBvcnQgZG9lc24ndCBtYWtl
IHRoZSBkaXN0aW5jdGlvbg0KPiArICAgYmV0d2VlbiB0aGUgbW9kZXMgYW5kIG1hZ2ljYWxs
eSBwcm9jZXNzaW5nIGxpbmUgZW5kaW5ncyBjYW4gYmUgY29uZnVzaW5nLg0KPiArDQo+ICsu
LiBsaXN0LXRhYmxlOjogR3Vlc3QgQXJjaGl0ZWN0dXJlcyBzdXBwb3J0aW5nIFNlbWlob3N0
aW5nDQo+ICsgIDp3aWR0aHM6IDEwIDEwIDgwDQo+ICsgIDpoZWFkZXItcm93czogMQ0KPiAr
DQo+ICsgICogLSBBcmNoaXRlY3R1cmUNCj4gKyAgICAtIE1vZGVzDQo+ICsgICAgLSBTcGVj
aWZpY2F0aW9uDQo+ICsgICogLSBBcm0NCj4gKyAgICAtIFN5c3RlbSBhbmQgVXNlci1tb2Rl
DQo+ICsgICAgLWh0dHBzOi8vZ2l0aHViLmNvbS9BUk0tc29mdHdhcmUvYWJpLWFhL2Jsb2Iv
bWFpbi9zZW1paG9zdGluZy9zZW1paG9zdGluZy5yc3QNCj4gKyAgKiAtIG02OGsNCj4gKyAg
ICAtIFN5c3RlbQ0KPiArICAgIC1odHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1uZXds
aWItY3lnd2luLmdpdDthPWJsb2I7Zj1saWJnbG9zcy9tNjhrL202OGstc2VtaS50eHQ7aGI9
SEVBRA0KPiArICAqIC0gbWlwcw0KPiArICAgIC0gU3lzdGVtDQo+ICsgICAgLSBVbmlmaWVk
IEhvc3RpbmcgSW50ZXJmYWNlIChNRDAxMDY5KQ0KPiArICAqIC0gTmlvcyBJSQ0KPiArICAg
IC0gU3lzdGVtDQo+ICsgICAgLWh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0L2dpdHdlYi5j
Z2k/cD1uZXdsaWItY3lnd2luLmdpdDthPWJsb2I7Zj1saWJnbG9zcy9uaW9zMi9uaW9zMi1z
ZW1pLnR4dDtoYj1IRUFEDQo+ICsgICogLSBSSVNDLVYNCj4gKyAgICAtIFN5c3RlbSBhbmQg
VXNlci1tb2RlDQo+ICsgICAgLWh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1zZW1p
aG9zdGluZy1zcGVjL2Jsb2IvbWFpbi9yaXNjdi1zZW1paG9zdGluZy1zcGVjLmFkb2MNCj4g
KyAgKiAtIFh0ZW5zYQ0KPiArICAgIC0gU3lzdGVtDQo+ICsgICAgLSBUZW5zaWxpY2EgSVNT
IFNJTUNBTEwNCj4gZGlmZiAtLWdpdCBhL3FlbXUtb3B0aW9ucy5oeCBiL3FlbXUtb3B0aW9u
cy5oeA0KPiBpbmRleCAzYWEzYTJmNWEzLi5kZTNhMzY4ZjU4IDEwMDY0NA0KPiAtLS0gYS9x
ZW11LW9wdGlvbnMuaHgNCj4gKysrIGIvcWVtdS1vcHRpb25zLmh4DQo+IEBAIC00NjMzLDEw
ICs0NjMzLDEzIEBAIERFRigic2VtaWhvc3RpbmciLCAwLCBRRU1VX09QVElPTl9zZW1paG9z
dGluZywNCj4gICAgICAgUUVNVV9BUkNIX01JUFMgfCBRRU1VX0FSQ0hfTklPUzIgfCBRRU1V
X0FSQ0hfUklTQ1YpDQo+ICAgU1JTVA0KPiAgIGBgLXNlbWlob3N0aW5nYGANCj4gLSAgICBF
bmFibGUgc2VtaWhvc3RpbmcgbW9kZSAoQVJNLCBNNjhLLCBYdGVuc2EsIE1JUFMsIE5pb3Mg
SUksIFJJU0MtViBvbmx5KS4NCj4gKyAgICBFbmFibGUgOnJlZjpgU2VtaWhvc3RpbmdgIG1v
ZGUgKEFSTSwgTTY4SywgWHRlbnNhLCBNSVBTLCBOaW9zIElJLCBSSVNDLVYgb25seSkuDQo+
ICAgDQo+IC0gICAgTm90ZSB0aGF0IHRoaXMgYWxsb3dzIGd1ZXN0IGRpcmVjdCBhY2Nlc3Mg
dG8gdGhlIGhvc3QgZmlsZXN5c3RlbSwgc28NCj4gLSAgICBzaG91bGQgb25seSBiZSB1c2Vk
IHdpdGggYSB0cnVzdGVkIGd1ZXN0IE9TLg0KPiArICAgIC4uIHdhcm5pbmc6Og0KPiArICAg
ICAgTm90ZSB0aGF0IHRoaXMgYWxsb3dzIGd1ZXN0IGRpcmVjdCBhY2Nlc3MgdG8gdGhlIGhv
c3QgZmlsZXN5c3RlbSwgc28NCj4gKyAgICAgIHNob3VsZCBvbmx5IGJlIHVzZWQgd2l0aCBh
IHRydXN0ZWQgZ3Vlc3QgT1MuDQo+ICsNCj4gKyAgICAuLiBfU2VtaWhvc3RpbmcgT3B0aW9u
czoNCj4gICANCj4gICAgICAgU2VlIHRoZSAtc2VtaWhvc3RpbmctY29uZmlnIG9wdGlvbiBk
b2N1bWVudGF0aW9uIGZvciBmdXJ0aGVyDQo+ICAgICAgIGluZm9ybWF0aW9uIGFib3V0IHRo
ZSBmYWNpbGl0aWVzIHRoaXMgZW5hYmxlcy4NCj4gQEAgLTQ2NDgsMjIgKzQ2NTEsMTIgQEAg
UUVNVV9BUkNIX0FSTSB8IFFFTVVfQVJDSF9NNjhLIHwgUUVNVV9BUkNIX1hURU5TQSB8DQo+
ICAgUUVNVV9BUkNIX01JUFMgfCBRRU1VX0FSQ0hfTklPUzIgfCBRRU1VX0FSQ0hfUklTQ1Yp
DQo+ICAgU1JTVA0KPiAgIGBgLXNlbWlob3N0aW5nLWNvbmZpZyBbZW5hYmxlPW9ufG9mZl1b
LHRhcmdldD1uYXRpdmV8Z2RifGF1dG9dWyxjaGFyZGV2PWlkXVssdXNlcnNwYWNlPW9ufG9m
Zl1bLGFyZz1zdHJbLC4uLl1dYGANCj4gLSAgICBFbmFibGUgYW5kIGNvbmZpZ3VyZSBzZW1p
aG9zdGluZyAoQVJNLCBNNjhLLCBYdGVuc2EsIE1JUFMsIE5pb3MgSUksIFJJU0MtVg0KPiAr
ICAgIEVuYWJsZSBhbmQgY29uZmlndXJlIDpyZWY6YFNlbWlob3N0aW5nYCAoQVJNLCBNNjhL
LCBYdGVuc2EsIE1JUFMsIE5pb3MgSUksIFJJU0MtVg0KPiAgICAgICBvbmx5KS4NCj4gICAN
Cj4gLSAgICBOb3RlIHRoYXQgdGhpcyBhbGxvd3MgZ3Vlc3QgZGlyZWN0IGFjY2VzcyB0byB0
aGUgaG9zdCBmaWxlc3lzdGVtLCBzbw0KPiAtICAgIHNob3VsZCBvbmx5IGJlIHVzZWQgd2l0
aCBhIHRydXN0ZWQgZ3Vlc3QgT1MuDQo+IC0NCj4gLSAgICBPbiBBcm0gdGhpcyBpbXBsZW1l
bnRzIHRoZSBzdGFuZGFyZCBzZW1paG9zdGluZyBBUEksIHZlcnNpb24gMi4wLg0KPiAtDQo+
IC0gICAgT24gTTY4SyB0aGlzIGltcGxlbWVudHMgdGhlICJDb2xkRmlyZSBHREIiIGludGVy
ZmFjZSB1c2VkIGJ5DQo+IC0gICAgbGliZ2xvc3MuDQo+IC0NCj4gLSAgICBYdGVuc2Egc2Vt
aWhvc3RpbmcgcHJvdmlkZXMgYmFzaWMgZmlsZSBJTyBjYWxscywgc3VjaCBhcw0KPiAtICAg
IG9wZW4vcmVhZC93cml0ZS9zZWVrL3NlbGVjdC4gVGVuc2lsaWNhIGJhcmVtZXRhbCBsaWJj
IGZvciBJU1MgYW5kDQo+IC0gICAgbGludXggcGxhdGZvcm0gInNpbSIgdXNlIHRoaXMgaW50
ZXJmYWNlLg0KPiAtDQo+IC0gICAgT24gUklTQy1WIHRoaXMgaW1wbGVtZW50cyB0aGUgc3Rh
bmRhcmQgc2VtaWhvc3RpbmcgQVBJLCB2ZXJzaW9uIDAuMi4NCj4gKyAgICAuLiB3YXJuaW5n
OjoNCj4gKyAgICAgIE5vdGUgdGhhdCB0aGlzIGFsbG93cyBndWVzdCBkaXJlY3QgYWNjZXNz
IHRvIHRoZSBob3N0IGZpbGVzeXN0ZW0sIHNvDQo+ICsgICAgICBzaG91bGQgb25seSBiZSB1
c2VkIHdpdGggYSB0cnVzdGVkIGd1ZXN0IE9TLg0KPiAgIA0KPiAgICAgICBgYHRhcmdldD1u
YXRpdmV8Z2RifGF1dG9gYA0KPiAgICAgICAgICAgRGVmaW5lcyB3aGVyZSB0aGUgc2VtaWhv
c3RpbmcgY2FsbHMgd2lsbCBiZSBhZGRyZXNzZWQsIHRvIFFFTVUNCi0tIA0KDQoqVmluY2Vu
dCBEdXBhcXVpcyoNClNvZnR3YXJlIHNlY3VyaXR5ICYgQ3J5cHRvZ3JhcGh5IGV4cGVydA0K
MDYgMjQgNTggMTcgMDUNCi9FdXJvcGFyYyBkZSBQaWNoYXVyeSBCw6J0aW1lbnQgQjggMTMz
MCBydWUgR3VpbGxpYmVydCBHYXV0aWVyIGRlIGxhIA0KTGF1emnDqHJlIDEzMjkwIEFpeC1l
bi1Qcm92ZW5jZS8NCg0Kd3d3LnRydXN0ZWQtb2JqZWN0cy5jb20gPGh0dHA6Ly93d3cudHJ1
c3RlZC1vYmplY3RzLmNvbT4NCg==
--------------ATK00qbG0F2erwjSvIGtkqyG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hello,</p>
    <p>I've tried to use the semihosting on qemu-system-arm (version
      7.0), and was not able to redirect the input/output to a pipe, for
      instance.</p>
    <p>It seems I've declared the chardev correctly as I do not get any
      error message, but impossible for me to redirect the input/output
      streams. I had to redirect stdout using tee and found another way
      to access stdin (through the /dev/pts/x device I can obtain
      through the ps command).</p>
    <p>I digged into the sources to understand what I was doing wrong,
      and could not :(</p>
    <p>Has anyone ever tried to redirect both stdout/stdin while using
      semihosting ?</p>
    <p>Should I expect a new behaviour with the latest version ?<br>
    </p>
    <p>I was using the following options :</p>
    <p>-semihosting -chardev pipe,id=3Dpipout,path=3Dpipout
      -semihosting-config enable=3Don,chardev=3Dpipout</p>
    <p>the pipe being created using mkfifo pipout beforehand.</p>
    <p>Regards,</p>
    <p>Vincent.<br>
    </p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">Le 10/01/2023 =C3=A0 18:39, Alex Benn=C3=
=A9e a
      =C3=A9crit=C2=A0:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20230110173922.265055-17-alex.bennee@linaro.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">The main reason to do this i=
s to document our O_BINARY implementation
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

--------------ATK00qbG0F2erwjSvIGtkqyG--

--------------dfrpslGadynpQNsDVuUJr2ma--

--------------zbDV0np80IcaLuOWC2ch6gCc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJpYkOsZemdq4v9TTIvVZ6MpT9wkFAmPJdSMFAwAAAAAACgkQIvVZ6MpT9wlD
1g//YahbncKbdFnpQ0sN/3yxyBrAuZmrddhA58DvrK+6VqBqEfixOQDRwY2yS+4cIiAIh68mc51z
NqC86fE3zQXmfE7yWfyGdcQ8nu+/ZPx4/JDPJB+buf2qY0qfUxgswbwBTlJk18Xe4HVwopqfbNNV
10rXzeh+SGPToivWIPqvT2VsvuqML6yJ7L/uOdQMNiRFifLZMHuVhO9S8OCDwkpOU+uDdsRxop4C
4wB5nFO3wDu/5iLf2FH5alUkJRb+oMMxuSbZqsPkLZY5fHxlhUPEUUzexOWihOoZ73Cbl7Lz3XHY
Y7uqjGSSc+72xbGZ2U7cNowSTkYvWM2U+f/on/7c4IvYEI0T4NLnb13wbvY+Rd6SMyVBdxKvtEac
9880fHIB0dRYqTrMLuhkQTpa0Uf9Mscmtf2uXjQt3sNhRIOl63hCKpu+G4M4KM2ivgZ6Sz+8YnbN
C2m3pX0QPDUzgt2CwEUs1vD6cLAMtLOU6aF7hJfFNzuTckBQrW+8rpfV8egqpg0TBnsQ56LNrU/Z
svQAcWWX+kyDJYS62sG7f0xZXE75Hmk73rvKmXC80tMli3hNxD0t1WIMmAId9fewx1A5vxBXNUH7
YGrwenFeLPAlH/JeH+ju28jsPl3b7yndMubQVk7+WI6opHlWO5ISeWJxzle+M7ZC2/IohehlxmOm
lCQ=
=Lnnv
-----END PGP SIGNATURE-----

--------------zbDV0np80IcaLuOWC2ch6gCc--
