Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp70326njl;
        Wed, 29 Jan 2025 20:22:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWqc7Y9SJa1EpILAW8DVLcZj/ykJe5jxcvC570D9uJ835ZmXIkQT7sKICNTvxUITpfEvz5YHwQHT/iygg==@linaro.org
X-Google-Smtp-Source: AGHT+IG4uOWRPduuJHgVq5Rd7j0FFfN7Kzu0QvbiSpWKZ9y8rlOiNhnVKYoDRQpB3gBwK3dFWeR+
X-Received: by 2002:a05:620a:178b:b0:7b6:e47a:8e14 with SMTP id af79cd13be357-7bffcd7268amr793036285a.35.1738210978173;
        Wed, 29 Jan 2025 20:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738210978; cv=none;
        d=google.com; s=arc-20240605;
        b=jfOdrE+qZiggLyV/LWvUgvTPVZLlVxATH5Y7CKXFW3JLPLD6DlDeIjnTyiSnYeGGT+
         HWCkIIbF4Lh0k1VqRCcQ70H15eHWu3sHLURZLUY4WSKig92LuUX1P7iyVv9fPoD8rE9D
         k4lCt8L0vBCbWoZQRiDPz3WzjypOzaX1UwffkuPAVm1OQmWlw5Ip2G0YtTTeRK3Ty4v7
         ycpGmJqeXcYeebNdL31wqSwht54NKDNgLDJQ+zsp0fR0nHawnuU0HcWVG2aFGM/Hf8ek
         QkxRjeTzpgUo1lYgwbxD/0QedL16w+/l1yNwXA6JdQW1kKJwiX9ZHKfnYPv+prtHhC74
         fl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=wk/mYyXm9Hw0RgQFihF2LLJoQJsXz86T94nhkaFznBc=;
        fh=ZOisryR2Mb28fNxWQse9qjy5qBOClWtToxOZdGTojXg=;
        b=kpcGKgkhcp/4+5dLFFO5WmPoEM0bwZGjS1Sf/DPQ99BIE++C8TgAsrOOmjqrYvw98T
         /dnPdiONCCjjT/01/wUPggQ/jbejwqAH4RbrL03MyMmGBC6/k8gMemJ12vX6oaXXyw5h
         lLxnO6DKYvNl/l+GFs9pafbD4Ha8JKEqE/6QKm+BCRc12wT5W95vGL0jEjGXl8ndWcLT
         xwVQq/el/Ii/rbbWjGyo1HpEG86D4q6bdvFch4ZKqep+9QJDm+wPXEMx0ooRbif8KCJ/
         +SSMpgKMdnF13Z6zoSgCASK6pXh+zMCYyL9X9MULF0kAPbH0om5VYPGpWOFEXcYkHkJA
         S78Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=FRRRAboY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8d6b19si89148785a.142.2025.01.29.20.22.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 20:22:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=FRRRAboY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tdM4V-0006Fm-NZ; Wed, 29 Jan 2025 23:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdM4U-0006Fa-OP; Wed, 29 Jan 2025 23:22:30 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdM4S-0005jS-Q8; Wed, 29 Jan 2025 23:22:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1738210945;
 bh=wk/mYyXm9Hw0RgQFihF2LLJoQJsXz86T94nhkaFznBc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=FRRRAboYp6kSg5pW04VjnxaznuDX3u1dXd5s8bqt8WLxO/FLH3C4xrOp/A/jWmaOO
 w5GJ6yDw/16CKLcTvigLhLgFzljzVMLS1ezOfs874NYhFEvRrhgDS/pyZt+BN+P7cv
 WALYSKLRGukPZg4B+/X1hOIIwhEOhwtBzoyJnEui8B3RzGbwByiqdGLbm+96NwmPbl
 T2LKhGKN8N2LPCzaZPYtj38vp9PWT5F7mQuYiwKnOe9QcaulFRGDLMlVfwvo0xkeDw
 dirvEXJxDMyxAE32qpwUDa0lNRXnVZ8RcC5HW4qB5Zfx0z47naUmw2ZFjDsBHCgD1k
 /vljZTFRUE/Rw==
Received: from [192.168.68.112] (58-7-158-64.dyn.iinet.net.au [58.7.158.64])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 33B887383B;
 Thu, 30 Jan 2025 12:22:25 +0800 (AWST)
Message-ID: <ac91ace7ce8ef2e77cccb9b0f25c6a99969b6ebb.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 14/18] hw/arm/aspeed: Add SoC and Machine Support for
 AST2700 A1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?ISO-8859-1?Q?C=E9dric?= Le
 Goater <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Date: Thu, 30 Jan 2025 14:52:24 +1030
In-Reply-To: <20250121070424.2465942-15-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
 <20250121070424.2465942-15-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IltgvCI+BDYq

T24gVHVlLCAyMDI1LTAxLTIxIGF0IDE1OjA0ICswODAwLCBKYW1pbiBMaW4gd3JvdGU6Cj4gVGhl
IG1lbW9yeSBtYXAgZm9yIEFTVDI3MDAgQTEgcmVtYWlucyBjb21wYXRpYmxlIHdpdGggQVNUMjcw
MCBBMC4KPiBIb3dldmVyLCB0aGUgSVJRIG1hcHBpbmcgaGFzIGJlZW4gdXBkYXRlZCBmb3IgQVNU
MjcwMCBBMSwgd2l0aCBHSUMKPiBpbnRlcnJ1cHRzCj4gbm93IHJhbmdpbmcgZnJvbSAxOTIgdG8g
MjAxLiBBZGQgYSBuZXcgSVJRIG1hcCB0YWJsZSBmb3IgQVNUMjcwMCBBMS4KPiAKPiBJbnRyb2R1
Y2UgImFzcGVlZF9tYWNoaW5lX2FzdDI3MDBfZXZiX2NsYXNzX2luaXQiIHRvIGluaXRpYWxpemUg
dGhlCj4gQVNUMjcwMCBFVkIKPiBtYWNoaW5lLiBBZGQgImFzcGVlZF9zb2NfYXN0MjcwMF9jbGFz
c19pbml0IiB0byBpbml0aWFsaXplIHRoZQo+IEFTVDI3MDAgQTEgU29DLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRlY2guY29tPgo+IC0tLQo+IMKgaHcv
YXJtL2FzcGVlZC5jwqDCoMKgwqDCoMKgwqDCoCB8IDI0ICsrKysrKysrKysrKysKPiDCoGh3L2Fy
bS9hc3BlZWRfYXN0Mjd4MC5jIHwgODAKPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxMDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9ody9hcm0vYXNwZWVkLmMgYi9ody9hcm0vYXNwZWVkLmMKPiBpbmRleCA0MDJk
NTVjNTU2Li4yNTRmYTUzMTZkIDEwMDY0NAo+IC0tLSBhL2h3L2FybS9hc3BlZWQuYwo+ICsrKyBi
L2h3L2FybS9hc3BlZWQuYwo+IEBAIC0xNjcyLDYgKzE2NzIsMjYgQEAgc3RhdGljIHZvaWQKPiBh
c3BlZWRfbWFjaGluZV9hc3QyNzAwYTBfZXZiX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCB2
b2lkICpkYXRhKQo+IMKgwqDCoMKgIG1jLT5kZWZhdWx0X3JhbV9zaXplID0gMSAqIEdpQjsKPiDC
oMKgwqDCoCBhc3BlZWRfbWFjaGluZV9jbGFzc19pbml0X2NwdXNfZGVmYXVsdHMobWMpOwo+IMKg
fQo+ICsKPiArc3RhdGljIHZvaWQgYXNwZWVkX21hY2hpbmVfYXN0MjcwMF9ldmJfY2xhc3NfaW5p
dChPYmplY3RDbGFzcyAqb2MsCj4gdm9pZCAqZGF0YSkKPiArewo+ICvCoMKgwqAgTWFjaGluZUNs
YXNzICptYyA9IE1BQ0hJTkVfQ0xBU1Mob2MpOwo+ICvCoMKgwqAgQXNwZWVkTWFjaGluZUNsYXNz
ICphbWMgPSBBU1BFRURfTUFDSElORV9DTEFTUyhvYyk7Cj4gKwo+ICvCoMKgwqAgbWMtPmRlc2Mg
PSAiQXNwZWVkIEFTVDI3MDAgRVZCIChDb3J0ZXgtQTM1KSI7Cj4gK8KgwqDCoCBhbWMtPnNvY19u
YW1lwqAgPSAiYXN0MjcwMC1hMSI7Cj4gK8KgwqDCoCBhbWMtPmh3X3N0cmFwMSA9IEFTVDI3MDBf
RVZCX0hXX1NUUkFQMTsKPiArwqDCoMKgIGFtYy0+aHdfc3RyYXAyID0gQVNUMjcwMF9FVkJfSFdf
U1RSQVAyOwo+ICvCoMKgwqAgYW1jLT5mbWNfbW9kZWwgPSAidzI1cTAxanZxIjsKPiArwqDCoMKg
IGFtYy0+c3BpX21vZGVsID0gIncyNXE1MTJqdiI7Cj4gK8KgwqDCoCBhbWMtPm51bV9jc8KgwqDC
oCA9IDI7Cj4gK8KgwqDCoCBhbWMtPm1hY3NfbWFzayA9IEFTUEVFRF9NQUMwX09OIHwgQVNQRUVE
X01BQzFfT04gfAo+IEFTUEVFRF9NQUMyX09OOwo+ICvCoMKgwqAgYW1jLT51YXJ0X2RlZmF1bHQg
PSBBU1BFRURfREVWX1VBUlQxMjsKPiArwqDCoMKgIGFtYy0+aTJjX2luaXTCoCA9IGFzdDI3MDBf
ZXZiX2kyY19pbml0Owo+ICvCoMKgwqAgbWMtPmRlZmF1bHRfcmFtX3NpemUgPSAxICogR2lCOwo+
ICvCoMKgwqAgYXNwZWVkX21hY2hpbmVfY2xhc3NfaW5pdF9jcHVzX2RlZmF1bHRzKG1jKTsKPiAr
fQo+ICsKPiDCoCNlbmRpZgo+IMKgCj4gwqBzdGF0aWMgdm9pZCBhc3BlZWRfbWFjaGluZV9xY29t
X2RjX3NjbV92MV9jbGFzc19pbml0KE9iamVjdENsYXNzCj4gKm9jLAo+IEBAIC0xNzk4LDYgKzE4
MTgsMTAgQEAgc3RhdGljIGNvbnN0IFR5cGVJbmZvIGFzcGVlZF9tYWNoaW5lX3R5cGVzW10gPQo+
IHsKPiDCoMKgwqDCoMKgwqDCoMKgIC5uYW1lwqDCoMKgwqDCoMKgwqDCoMKgID0gTUFDSElORV9U
WVBFX05BTUUoImFzdDI3MDBhMC1ldmIiKSwKPiDCoMKgwqDCoMKgwqDCoMKgIC5wYXJlbnTCoMKg
wqDCoMKgwqDCoCA9IFRZUEVfQVNQRUVEX01BQ0hJTkUsCj4gwqDCoMKgwqDCoMKgwqDCoCAuY2xh
c3NfaW5pdMKgwqDCoCA9IGFzcGVlZF9tYWNoaW5lX2FzdDI3MDBhMF9ldmJfY2xhc3NfaW5pdCwK
PiArwqDCoMKgwqAgfSwgewo+ICvCoMKgwqDCoMKgwqDCoCAubmFtZcKgwqDCoMKgwqDCoMKgwqDC
oCA9IE1BQ0hJTkVfVFlQRV9OQU1FKCJhc3QyNzAwLWV2YiIpLAo+ICvCoMKgwqDCoMKgwqDCoCAu
cGFyZW50wqDCoMKgwqDCoMKgwqAgPSBUWVBFX0FTUEVFRF9NQUNISU5FLAo+ICvCoMKgwqDCoMKg
wqDCoCAuY2xhc3NfaW5pdMKgwqDCoCA9IGFzcGVlZF9tYWNoaW5lX2FzdDI3MDBfZXZiX2NsYXNz
X2luaXQsCj4gwqAjZW5kaWYKPiDCoMKgwqDCoCB9LCB7Cj4gwqDCoMKgwqDCoMKgwqDCoCAubmFt
ZcKgwqDCoMKgwqDCoMKgwqDCoCA9IFRZUEVfQVNQRUVEX01BQ0hJTkUsCj4gZGlmZiAtLWdpdCBh
L2h3L2FybS9hc3BlZWRfYXN0Mjd4MC5jIGIvaHcvYXJtL2FzcGVlZF9hc3QyN3gwLmMKPiBpbmRl
eCBiMzJjNGZjYzM1Li5lMGEyOWM5MDUzIDEwMDY0NAo+IC0tLSBhL2h3L2FybS9hc3BlZWRfYXN0
Mjd4MC5jCj4gKysrIGIvaHcvYXJtL2FzcGVlZF9hc3QyN3gwLmMKPiBAQCAtMTE5LDYgKzExOSw1
MiBAQCBzdGF0aWMgY29uc3QgaW50IGFzcGVlZF9zb2NfYXN0MjcwMGEwX2lycW1hcFtdID0KPiB7
Cj4gwqDCoMKgwqAgW0FTUEVFRF9ERVZfU0RIQ0ldwqDCoMKgwqAgPSAxMzMsCj4gwqB9Owo+IMKg
Cj4gK3N0YXRpYyBjb25zdCBpbnQgYXNwZWVkX3NvY19hc3QyNzAwX2lycW1hcFtdID0gewo+ICvC
oMKgwqAgW0FTUEVFRF9ERVZfVUFSVDBdwqDCoMKgwqAgPSAxOTYsCj4gK8KgwqDCoCBbQVNQRUVE
X0RFVl9VQVJUMV3CoMKgwqDCoCA9IDE5NiwKPiArwqDCoMKgIFtBU1BFRURfREVWX1VBUlQyXcKg
wqDCoMKgID0gMTk2LAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfVUFSVDNdwqDCoMKgwqAgPSAxOTYs
Cj4gK8KgwqDCoCBbQVNQRUVEX0RFVl9VQVJUNF3CoMKgwqDCoCA9IDgsCj4gK8KgwqDCoCBbQVNQ
RUVEX0RFVl9VQVJUNV3CoMKgwqDCoCA9IDE5NiwKPiArwqDCoMKgIFtBU1BFRURfREVWX1VBUlQ2
XcKgwqDCoMKgID0gMTk2LAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfVUFSVDddwqDCoMKgwqAgPSAx
OTYsCj4gK8KgwqDCoCBbQVNQRUVEX0RFVl9VQVJUOF3CoMKgwqDCoCA9IDE5NiwKPiArwqDCoMKg
IFtBU1BFRURfREVWX1VBUlQ5XcKgwqDCoMKgID0gMTk2LAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZf
VUFSVDEwXcKgwqDCoCA9IDE5NiwKPiArwqDCoMKgIFtBU1BFRURfREVWX1VBUlQxMV3CoMKgwqAg
PSAxOTYsCj4gK8KgwqDCoCBbQVNQRUVEX0RFVl9VQVJUMTJdwqDCoMKgID0gMTk2LAo+ICvCoMKg
wqAgW0FTUEVFRF9ERVZfRk1DXcKgwqDCoMKgwqDCoCA9IDE5NSwKPiArwqDCoMKgIFtBU1BFRURf
REVWX1NETUNdwqDCoMKgwqDCoCA9IDAsCj4gK8KgwqDCoCBbQVNQRUVEX0RFVl9TQ1VdwqDCoMKg
wqDCoMKgID0gMTIsCj4gK8KgwqDCoCBbQVNQRUVEX0RFVl9BRENdwqDCoMKgwqDCoMKgID0gMTk0
LAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfWERNQV3CoMKgwqDCoMKgID0gNSwKPiArwqDCoMKgIFtB
U1BFRURfREVWX0VNTUNdwqDCoMKgwqDCoCA9IDE1LAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfR1BJ
T13CoMKgwqDCoMKgID0gMTk0LAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfUlRDXcKgwqDCoMKgwqDC
oCA9IDEzLAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfVElNRVIxXcKgwqDCoCA9IDE2LAo+ICvCoMKg
wqAgW0FTUEVFRF9ERVZfVElNRVIyXcKgwqDCoCA9IDE3LAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZf
VElNRVIzXcKgwqDCoCA9IDE4LAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfVElNRVI0XcKgwqDCoCA9
IDE5LAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfVElNRVI1XcKgwqDCoCA9IDIwLAo+ICvCoMKgwqAg
W0FTUEVFRF9ERVZfVElNRVI2XcKgwqDCoCA9IDIxLAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfVElN
RVI3XcKgwqDCoCA9IDIyLAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfVElNRVI4XcKgwqDCoCA9IDIz
LAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfV0RUXcKgwqDCoMKgwqDCoCA9IDE5NSwKPiArwqDCoMKg
IFtBU1BFRURfREVWX1BXTV3CoMKgwqDCoMKgwqAgPSAxOTUsCj4gK8KgwqDCoCBbQVNQRUVEX0RF
Vl9MUENdwqDCoMKgwqDCoMKgID0gMTkyLAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfSUJUXcKgwqDC
oMKgwqDCoCA9IDE5MiwKPiArwqDCoMKgIFtBU1BFRURfREVWX0kyQ13CoMKgwqDCoMKgwqAgPSAx
OTQsCj4gK8KgwqDCoCBbQVNQRUVEX0RFVl9QRUNJXcKgwqDCoMKgwqAgPSAxOTcsCj4gK8KgwqDC
oCBbQVNQRUVEX0RFVl9FVEgxXcKgwqDCoMKgwqAgPSAxOTYsCj4gK8KgwqDCoCBbQVNQRUVEX0RF
Vl9FVEgyXcKgwqDCoMKgwqAgPSAxOTYsCj4gK8KgwqDCoCBbQVNQRUVEX0RFVl9FVEgzXcKgwqDC
oMKgwqAgPSAxOTYsCj4gK8KgwqDCoCBbQVNQRUVEX0RFVl9IQUNFXcKgwqDCoMKgwqAgPSA0LAo+
ICvCoMKgwqAgW0FTUEVFRF9ERVZfS0NTXcKgwqDCoMKgwqDCoCA9IDE5MiwKPiArwqDCoMKgIFtB
U1BFRURfREVWX0RQXcKgwqDCoMKgwqDCoMKgID0gMjgsCj4gK8KgwqDCoCBbQVNQRUVEX0RFVl9J
M0NdwqDCoMKgwqDCoMKgID0gMTk1LAo+ICvCoMKgwqAgW0FTUEVFRF9ERVZfU0RIQ0ldwqDCoMKg
wqAgPSAxOTcsCj4gK307CgpCaXQgb2YgYSBuaXQsIGJ1dCBjYW4gd2Ugc29ydCB0aGlzIHRhYmxl
PyBQZXJoYXBzIGJ5IGludGVycnVwdCB2YWx1ZT8KCkFuZHJldwo=

