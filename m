Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp367952ejx;
        Wed, 22 Nov 2023 06:35:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1DtpimrIWVQvtx7jbGcpgNKIPp8qO0h2fiJqMt4ISMN5OMmdeXIfr2zSie9xG+xCIJGmm
X-Received: by 2002:a05:620a:2546:b0:775:7703:ace5 with SMTP id s6-20020a05620a254600b007757703ace5mr2676167qko.56.1700663733092;
        Wed, 22 Nov 2023 06:35:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700663733; cv=none;
        d=google.com; s=arc-20160816;
        b=rZqzQ5c8FsJzufwf8fSSZmIIj5P5tCiDXbu1/e4/0bO6rM+JyHixJ2VU2UX26pTB0f
         3cQ+h18vP71PswksJ5HicZpRAeuz0m6HhbfhT96yOT2UfPb+zgOPOCHOHHBsOuvsjLkv
         2WwznKRdpFUqnRt42Qhrye0RU2cyaagIM0N1tvKDnZuvEKD7fci/LMu9/G97CiDVJNet
         WOt5lP7yJFCvNghybnSa+/ldprB36lCbAAy98L1tofAQMIs6DIblFn69oqEKfwD9dnFB
         lR614Ajc1Xcq7BX/6rIrjs3Ql+cYjAzPi7JBi/FEdTsSj0rYrBzFxse2CcsErw8yPH3o
         6S4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version
         :content-transfer-encoding:references:in-reply-to:subject:cc:to:from
         :date;
        bh=PD0uLMJTjhkP3x8OaC4AqPbdSJ+zoyzVwRrOaIDr6+w=;
        fh=A79k/M7leFBu/z5+M3Cnk/taDyghHWnpm+4IxQ6Ogy8=;
        b=ZUFQonQacbZS8Nes29EA+M7WSCPtSkRgo4DO8nDXxkaJcFJMMP70RcN7Mva94zfuQC
         NKiCFtpFKg5tkjNSpirhctsAs1M3TUSMHTiufkc6dqkxYRxHg7ZTyznG6bRA8LV7Xbm+
         hDzciG50NyzLFS0wxxRFWNQfURUYEQkDMr9bkuvZjxyyFtpw1ssCHeXD693BlULX0OjJ
         UR0ArRuYm9T7Nb6YMz176PC5MGuMLVwzL+ulp0nwjUo9JFJC4zr8r0TZypvqJ1buDgmC
         OgKvylbGW/X69d3zeVR3FsfboOMLxFg93qRaoXB6RwBV9NmWonwvdMtk5EIn//jfCeUW
         KGaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14-20020a05620a28ce00b0077c1d29bf69si11635105qkp.60.2023.11.22.06.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 06:35:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5oJw-0001ar-Qa; Wed, 22 Nov 2023 09:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <duchao@eswincomputing.com>)
 id 1r5iQe-0003gT-EH
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 03:17:48 -0500
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <duchao@eswincomputing.com>) id 1r5iQc-0001xC-Ed
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 03:17:48 -0500
Received: from duchao$eswincomputing.com ( [112.46.135.130] ) by
 ajax-webmail-app1 (Coremail) ; Wed, 22 Nov 2023 16:15:41 +0800 (GMT+08:00)
X-Originating-IP: [112.46.135.130]
Date: Wed, 22 Nov 2023 16:15:41 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Chao Du" <duchao@eswincomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH] target/arm: kvm64: remove a redundant
 KVM_CAP_SET_GUEST_DEBUG probe
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220420(169d3f8c)
 Copyright (c) 2002-2023 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20231025070726.22689-1-duchao@eswincomputing.com>
References: <20231025070726.22689-1-duchao@eswincomputing.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3c895935.1233.18bf6196456.Coremail.duchao@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TAJkCgB3Un+uuF1l5_4AAA--.786W
X-CM-SenderInfo: xgxfxt3r6h245lqf0zpsxwx03jof0z/1tbiAgEDDGVchN4ezwAGs4
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: permerror client-ip=129.150.39.64;
 envelope-from=duchao@eswincomputing.com; helo=sgoci-sdnproxy-4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 22 Nov 2023 09:35:13 -0500
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
X-TUID: 2usk5SyRC7Lz

SGksCgpLaW5kbHkgcGluZy4gOikKClRoYW5rcywKQ2hhbwoKCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlcy0tLS0tRnJvbToiQ2hhbyBEdSIgPGR1Y2hhb0Blc3dpbmNvbXB1dGluZy5jb20+U2VudCBU
aW1lOjIwMjMtMTAtMjUgMTU6MDc6MjYgKFdlZG5lc2RheSlUbzpxZW11LWRldmVsQG5vbmdudS5v
cmcsIHFlbXUtYXJtQG5vbmdudS5vcmdDYzpTdWJqZWN0OltQQVRDSF0gdGFyZ2V0L2FybToga3Zt
NjQ6IHJlbW92ZSBhIHJlZHVuZGFudCBLVk1fQ0FQX1NFVF9HVUVTVF9ERUJVRyBwcm9iZQo+IAo+
IFRoZSBLVk1fQ0FQX1NFVF9HVUVTVF9ERUJVRyBpcyBwcm9iZWQgZHVyaW5nIGt2bV9pbml0KCku
Cj4gZ2Ric2VydmVyIHdpbGwgZmFpbCB0byBzdGFydCBpZiB0aGUgQ0FQIGlzIG5vdCBzdXBwb3J0
ZWQuCj4gU28gbm8gbmVlZCB0byBtYWtlIGFub3RoZXIgcHJvYmUgaGVyZSwgbGlrZSBvdGhlciB0
YXJnZXRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENoYW8gRHUgPGR1Y2hhb0Blc3dpbmNvbXB1dGlu
Zy5jb20+Cj4gLS0tCj4gIHRhcmdldC9hcm0va3ZtNjQuYyB8IDI4ICsrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9hcm0va3ZtNjQuYyBiL3RhcmdldC9hcm0v
a3ZtNjQuYwo+IGluZGV4IDRiYjY4NjQ2ZTQuLmIwYmY1OWI1YTEgMTAwNjQ0Cj4gLS0tIGEvdGFy
Z2V0L2FybS9rdm02NC5jCj4gKysrIGIvdGFyZ2V0L2FybS9rdm02NC5jCj4gQEAgLTMxLDEzICsz
MSw5IEBACj4gICNpbmNsdWRlICJody9hY3BpL2FjcGkuaCIKPiAgI2luY2x1ZGUgImh3L2FjcGkv
Z2hlcy5oIgo+ICAKPiAtc3RhdGljIGJvb2wgaGF2ZV9ndWVzdF9kZWJ1ZzsKPiAgCj4gIHZvaWQg
a3ZtX2FybV9pbml0X2RlYnVnKEtWTVN0YXRlICpzKQo+ICB7Cj4gLSAgICBoYXZlX2d1ZXN0X2Rl
YnVnID0ga3ZtX2NoZWNrX2V4dGVuc2lvbihzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgS1ZNX0NBUF9TRVRfR1VFU1RfREVCVUcpOwo+IC0KPiAgICAgIG1h
eF9od193cHMgPSBrdm1fY2hlY2tfZXh0ZW5zaW9uKHMsIEtWTV9DQVBfR1VFU1RfREVCVUdfSFdf
V1BTKTsKPiAgICAgIGh3X3dhdGNocG9pbnRzID0gZ19hcnJheV9zaXplZF9uZXcodHJ1ZSwgdHJ1
ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKEhXV2F0
Y2hwb2ludCksIG1heF9od193cHMpOwo+IEBAIC0xMTQwLDMzICsxMTM2LDIzIEBAIHN0YXRpYyBj
b25zdCB1aW50MzJfdCBicmtfaW5zbiA9IDB4ZDQyMDAwMDA7Cj4gIAo+ICBpbnQga3ZtX2FyY2hf
aW5zZXJ0X3N3X2JyZWFrcG9pbnQoQ1BVU3RhdGUgKmNzLCBzdHJ1Y3Qga3ZtX3N3X2JyZWFrcG9p
bnQgKmJwKQo+ICB7Cj4gLSAgICBpZiAoaGF2ZV9ndWVzdF9kZWJ1Zykgewo+IC0gICAgICAgIGlm
IChjcHVfbWVtb3J5X3J3X2RlYnVnKGNzLCBicC0+cGMsICh1aW50OF90ICopJmJwLT5zYXZlZF9p
bnNuLCA0LCAwKSB8fAo+IC0gICAgICAgICAgICBjcHVfbWVtb3J5X3J3X2RlYnVnKGNzLCBicC0+
cGMsICh1aW50OF90ICopJmJya19pbnNuLCA0LCAxKSkgewo+IC0gICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiAtICAgICAgICB9Cj4gLSAgICAgICAgcmV0dXJuIDA7Cj4gLSAgICB9IGVsc2Ug
ewo+IC0gICAgICAgIGVycm9yX3JlcG9ydCgiZ3Vlc3QgZGVidWcgbm90IHN1cHBvcnRlZCBvbiB0
aGlzIGtlcm5lbCIpOwo+ICsgICAgaWYgKGNwdV9tZW1vcnlfcndfZGVidWcoY3MsIGJwLT5wYywg
KHVpbnQ4X3QgKikmYnAtPnNhdmVkX2luc24sIDQsIDApIHx8Cj4gKyAgICAgICAgY3B1X21lbW9y
eV9yd19kZWJ1ZyhjcywgYnAtPnBjLCAodWludDhfdCAqKSZicmtfaW5zbiwgNCwgMSkpIHsKPiAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgICAgIH0KPiArICAgIHJldHVybiAwOwo+ICB9Cj4g
IAo+ICBpbnQga3ZtX2FyY2hfcmVtb3ZlX3N3X2JyZWFrcG9pbnQoQ1BVU3RhdGUgKmNzLCBzdHJ1
Y3Qga3ZtX3N3X2JyZWFrcG9pbnQgKmJwKQo+ICB7Cj4gICAgICBzdGF0aWMgdWludDMyX3QgYnJr
Owo+ICAKPiAtICAgIGlmIChoYXZlX2d1ZXN0X2RlYnVnKSB7Cj4gLSAgICAgICAgaWYgKGNwdV9t
ZW1vcnlfcndfZGVidWcoY3MsIGJwLT5wYywgKHVpbnQ4X3QgKikmYnJrLCA0LCAwKSB8fAo+IC0g
ICAgICAgICAgICBicmsgIT0gYnJrX2luc24gfHwKPiAtICAgICAgICAgICAgY3B1X21lbW9yeV9y
d19kZWJ1ZyhjcywgYnAtPnBjLCAodWludDhfdCAqKSZicC0+c2F2ZWRfaW5zbiwgNCwgMSkpIHsK
PiAtICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gLSAgICAgICAgfQo+IC0gICAgICAgIHJl
dHVybiAwOwo+IC0gICAgfSBlbHNlIHsKPiAtICAgICAgICBlcnJvcl9yZXBvcnQoImd1ZXN0IGRl
YnVnIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyBrZXJuZWwiKTsKPiArICAgIGlmIChjcHVfbWVtb3J5
X3J3X2RlYnVnKGNzLCBicC0+cGMsICh1aW50OF90ICopJmJyaywgNCwgMCkgfHwKPiArICAgICAg
ICBicmsgIT0gYnJrX2luc24gfHwKPiArICAgICAgICBjcHVfbWVtb3J5X3J3X2RlYnVnKGNzLCBi
cC0+cGMsICh1aW50OF90ICopJmJwLT5zYXZlZF9pbnNuLCA0LCAxKSkgewo+ICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ICAgICAgfQo+ICsgICAgcmV0dXJuIDA7Cj4gIH0KPiAgCj4gIC8qIFNl
ZSB2OCBBUk0gQVJNIEQ3LjIuMjcgRVNSX0VMeCwgRXhjZXB0aW9uIFN5bmRyb21lIFJlZ2lzdGVy
Cj4gLS0gCj4gMi4xNy4xCg==
