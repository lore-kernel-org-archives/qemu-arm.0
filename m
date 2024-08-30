Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp298760njf;
        Fri, 30 Aug 2024 08:18:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjugZ6Le30iJpeEB29KBODjT2851AYXsDslkmLmzXorqfPyWJBYPB+NNSk1+uJLQjm4hAwmzKxaldYiw==@linaro.org
X-Google-Smtp-Source: AGHT+IFBsSf73d7WRPgcu/JCzWyIY46wAu7KvGTt1c8Nhgxq8klqlrzBQHQSQHW6Ts/WtsK3z/fz
X-Received: by 2002:a05:622a:4293:b0:456:959d:ec3a with SMTP id d75a77b69052e-456959e0d36mr5837861cf.42.1725031128978;
        Fri, 30 Aug 2024 08:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725031128; cv=none;
        d=google.com; s=arc-20160816;
        b=Ji5sqErBUiZGunYpYXWFyXbSAI095ReOz04IELq2dWYTPxmpa7DUzTKjEBIx5HSNy0
         RTHx6QJkZ/ORAmeSqKwrzYNKGoVBcTH90G/rl2P3NHKPABDHya9ardGL0h/u+g3zTWl8
         1YhPvIRpKDEQ1Hf8bo2ScFXnapZQ+4ddUFcVg+YLm60DC5Y9GuOPYChahPcevVuLrh48
         ydcOYeR0TGWwGnB9DxGYtN6Jf3+5ps7VIxHnf28x9npkZInPHg2cb0XopeKFZ3t3vD/K
         RVVSaskoM3BYOlE8uqFF+FSz/x37lxZPbfQB9yUOCXQrS9i1lFc+Ar2jw/Ed66bTD3/O
         W7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date
         :content-transfer-encoding:mime-version:subject:cc:to:from
         :references:in-reply-to:dkim-signature;
        bh=k5hPFAItjJcPFywlYSG+01IfeRdaDXqMAjt7W/sLl2I=;
        fh=w1w+t3OCeiKgy0tuZzwfmxVgKnC9SvTYo69eyO6GOgE=;
        b=q2BcU2EYyNsUpb9MxyPTVw8fqEXvXLmgPXFhGWETSXM2LT+UkC3pWITdmo1RT6bDsc
         SgJMJPMnYy0jXWoQO0blocJq4MJ5DLEmoPumjYTN5WoC0PDBa+KixKGJaBKy3gopLVgn
         KKEEr2/zJMSH62EPL2qGg/2pOl1HND7XyDbWCR+MfaVpQoIqywa+wc2teQcQD4wxkisd
         p2hZePlvpZHJNkkhHqWBIRZWac9NNefAz/uaTFvB+hJIAl1q4i+m7ltBMOHvwOvMCIBN
         HH8x88pDCrIAwZRUwywcbtAkYkkWctlJJwvqb5bJSi+d26mLrPguXatPMZdnjNt1JeRU
         NdwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=zxIwrMQa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=qq.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682ca25c2si40492651cf.219.2024.08.30.08.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 08:18:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=zxIwrMQa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=qq.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sk3OY-00064y-Bl; Fri, 30 Aug 2024 11:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guyqqcom@qq.com>) id 1sk3OW-00063y-OH
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 11:18:37 -0400
Received: from xmbghk7.mail.qq.com ([43.163.128.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guyqqcom@qq.com>) id 1sk3OR-00074z-RA
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 11:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1725031105; bh=k5hPFAItjJcPFywlYSG+01IfeRdaDXqMAjt7W/sLl2I=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date;
 b=zxIwrMQaH2b+q3oGYuC+ZleffWJJWdcwFOxmvCkIV3dhyNRoC9dYcokmY1whYjY7S
 RBIFSckCDLmk6FVE2ctXfVZmCZiqxmIBSQehFKv5pfJsQ7VIV7G85eWjCPGmX/Y5jJ
 yqLX7PVl/utZPHrIiLEU/+RFL1hnN8jIcXiRwB4M=
X-QQ-FEAT: oHWrrGTW1dAl5G87yEx6LpeS/9hBRv0w
X-QQ-SSF: 00000000000000F0000000000000
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-XMAILINFO: MKXYKvFqLnFrEh5kIUYafsP8oUWqWjwDthhpTh8hYv5Tcdn/H1TIN5Sbcnm3Rg
 9Mo9KA/DqJZLK654PC5kYtDVnV8AmLCdTzhDjqRhpdvqSdKNzZrsrYyuTEvoxes9waPEWLaKwiQl+
 YSil7Mk/Y1llupW2gHYYmbLIBKj/K82mJXCPoWSqmcWzBk7RrqvSCPSYb5um3Wp32KKCv1YuXNmk5
 xp8af27XtuW3NHElYQZQyflXp+pPlB+uNQGqsqAnSJGhVknCE1hnaaP7XtNmh2jNop93sXC8p4cdQ
 WXfZzBlJM0MLDcxxCGbdvORTSnMkygiN6Qfo+epTZdGd4QKCYu2BFbIcEfDtr/kw8xFoHC0Jc+eOD
 WOcQrGeogC/vOEilbnDCr1LPrDGulUPY5neJVLIpJEVEz7Anyx/oDHoxKqj/mBjfw2tOtWIlf2+P8
 EAd5Lu+ugmEZuede/o12Ls/5Yz9TbaEvLzGg/aYDHpoaOMo1LemUDfyuSLCMfFfrrt2Kxy46D7wsv
 rYVT8QOfEJ5pYrbtZDgXmqvWIR2youqZzHK+9tbJLlpMvWPb1dApdh7KlUmfjTp4Stkx14z5OCzx7
 3hwDpw+Y5RUJ60pABsb6UfZyJcjKafGZrtt5q6R7vKXRAgamHwyK0O3tre9f5PePjlEDdQ+W8DDxn
 FrGQifNbhoOAEcZrnnMVOSLZlP94pGKi1v2DstHT2KMvVE5bVQalI7PzJOPHM1BxoVeHK6JwExY41
 hpbIp7uo4LqfOjMk89HXTjfIT8oRGR0WjEFJDFRa9rXEePCETM9Y6a6Qy6rFLjeSnn+oZgBeXKoJ8
 FbGH8tsTG3erwq189X0ys8LzCm5AgMbwRFJG7tb6I///FPuk+fxnB5tTiCiOG39oyRzdmt5KlXlLt
 aEVvO5VBv+NDkcmedlUYIBfZdErFjjs7BtvgImm4i0QlNKBqVAJIc9KMH3qiRMOzHpKHNQF3x7f/O
 VFoznb88ShvjtPxKglCt+hMVR03nYF5rNQ88aFFPF+x3Abi/N5dOC4/VTY7y5k68zkTYzkqEwdfyx
 kngCbPluXz2ODhr6SdfzRKVN8EQ==
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 180.165.167.46
In-Reply-To: <CAFEAcA9zizTZ-qtvEf31eDYj9ognKHpaSkM6OsJxug-_e1JE5Q@mail.gmail.com>
References: <tencent_3E0F9F905031BE780D8EB329DA00C7EDFA0A@qq.com>
 <CAFEAcA9zizTZ-qtvEf31eDYj9ognKHpaSkM6OsJxug-_e1JE5Q@mail.gmail.com>
X-QQ-STYLE: 
X-QQ-mid: webmail633t1725030609t4763400
From: "=?gb18030?B?R3V5?=" <guyqqcom@qq.com>
To: "=?gb18030?B?UGV0ZXIgTWF5ZGVsbA==?=" <peter.maydell@linaro.org>
Cc: "=?gb18030?B?cWVtdS1hcm0=?=" <qemu-arm@nongnu.org>
Subject: =?gb18030?B?UmWjuiBUcm91Ymxlc2hvb3RpbmcgRGF0YSBBYm9y?=
 =?gb18030?B?dCBFcnJvciBXaGlsZSBEZWJ1Z2dpbmcgVS1Cb290?=
 =?gb18030?B?IG9uIG1jaW14NnVsLWV2ayBpbiBRRU1V?=
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_66D1E0D1_12CD71F8_2D3DA0BF"
Content-Transfer-Encoding: 8Bit
Date: Fri, 30 Aug 2024 23:10:09 +0800
X-Priority: 3
Message-ID: <tencent_C45A78518C2F289E0153EDB20F6B90BC300A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Received-SPF: pass client-ip=43.163.128.44; envelope-from=guyqqcom@qq.com;
 helo=xmbghk7.mail.qq.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, FROM_EXCESS_BASE64=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XKrVu0VxznYt

This is a multi-part message in MIME format.

------=_NextPart_66D1E0D1_12CD71F8_2D3DA0BF
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

RnVydGhlcm1vcmUsIEkgYWxzbyB0ZXN0ZWQgYSBwcmVjb21waWxlZCBxZW11LXN5c3RlbS1h
cm0uZXhlIGluIHdpbmRvd3MgKHRoZSAtdmVyc2lvbiBjb21tYW5kIHNob3dzIHRoZSBzYW1l
IDcuMi4wIHZlcnNpb24gb2YgUUVNVSwgYWx0aG91Z2ggSSdtIG5vdCBzdXJlIGlmIHRoZXJl
IHdlcmUgYW55IGRpZmZlcmVuY2VzIGluIHRoZSBjb21waWxhdGlvbiBwcm9jZXNzKSB0byBk
ZWJ1ZyB0aGUgc2FtZSBVLUJvb3QgY29kZSwgYW5kIEkgZGlkIG5vdCBlbmNvdW50ZXIgdGhl
IGVycm9yIGF0IHRoZSBnZXRfY3B1X3JldiBzdGVwLiZuYnNwO0hvdyBjYW4gdGhpcyBzaXR1
YXRpb24gYmUgZXhwbGFpbmVkPyBRdWl0ZSBjb25mdXNlZC4mbmJzcDsNCg0KDQpPbiBGcmks
IDMwIEF1ZyAyMDI0IGF0IDA1OjExLCBHdXkgPGd1eXFxY29tQHFxLmNvbSZndDsgd3JvdGU6
DQomZ3Q7DQomZ3Q7IEkgYW0gdHJ5aW5nIHRvIGRlYnVnIFUtQm9vdCBjb2RlIGluIFVidW50
dSAxOC4wNCB1c2luZyB0aGUgbWNpbXg2dWwtZXZrIGJvYXJkIGluIFFFTVUuIEkgaGF2ZSBz
dWNjZXNzZnVsbHkgY29tcGlsZWQgUUVNVSBhbmQgVS1Cb290IHVzaW5nIGFybS1saW51eC1n
bnVlYWJpaGYtLiBXaGVuIEkgYXR0ZW1wdCB0byBydW4gVS1Cb290IGFuZCBkZWJ1ZyBpdCB3
aXRoIEdEQiwgSSBlbmNvdW50ZXIgYW4gaXNzdWUgaW4gdGhlIGdldF9jcHVfcmV2IGZ1bmN0
aW9uOg0KJmd0Ow0KJmd0OyBzdHJ1Y3Qgc2N1X3JlZ3MgKnNjdSA9IChzdHJ1Y3Qgc2N1X3Jl
Z3MgKilTQ1VfQkFTRV9BRERSOw0KJmd0OyAyY2ZnID0gcmVhZGwoJmFtcDtzY3UtJmd0O2Nv
bmZpZykgJmFtcDsgMzsNCiZndDsNCiZndDsgVGhpcyB0cmlnZ2VycyBhIGRhdGFfYWJvcnQg
ZXJyb3IuIFRoZSBsb2cgZGlzcGxheXMgIkludmFsaWQgcmVhZCBhdCBhZGRyIDB4QTAwMDA0
LCBzaXplIDQsIHJlZ2lvbiAnKG51bGwpJywgcmVhc29uOiByZWplY3RlZC4iDQoNClRoaXMg
aXMgYmVjYXVzZSBRRU1VIGRvZXMgbm90IG1vZGVsIGFueSBkZXZpY2UgYXQgdGhhdCBhZGRy
ZXNzLg0KV2hhdCBkbyB5b3UgdGhpbmsgaXMgc3VwcG9zZWQgdG8gYmUgdGhlcmU/IFRoZSBD
b3J0ZXgtQTkgaGFzDQphIHNub29wLWNvbnRyb2wtcmVnaXN0ZXIgYXQgdGhhdCBvZmZzZXQg
ZnJvbSBQRVJJUEhCQVNFLCBidXQNCmFzIGZhciBhcyBJIGFtIGF3YXJlIHRoZSBDb3J0ZXgt
QTcgd2hpY2ggdGhlIG1jaW14NnVsLWV2aw0KYm9hcmQgdXNlcyBkb2VzIG5vdCBoYXZlIGFu
eSBTQ1UgcmVnaXN0ZXJzLg0KDQomZ3Q7IEkndmUgdGVzdGVkIG11bHRpcGxlIHZlcnNpb25z
IG9mIFFFTVUgKDcuMi4wLzQuMS4xKSBhbmQgVS1Cb290ICh1LWJvb3QtZnNsYy0yMDE2LjA1
L3UtYm9vdC1mc2xjLTIwMjMuMTAvdWJvb3QtaW14LXJlbF9pbXhfNC4xLjE1XzIuMS4wX2dh
KS4gV2hlbiBJIHJ1biBxZW11LXN5c3RlbS1hcm0gLU0gaGVscCwgdGhlIFN1cHBvcnRlZCBt
YWNoaW5lcyBsaXN0IGluY2x1ZGVzIG1jaW14NnVsLWV2ay4NCg0KQnkgdGhlIHdheSwgNy4y
IGlzIG5vdyBhIG1vZGVyYXRlbHkgb2xkZXIgdmVyc2lvbiBvZiBRRU1VLg0KSXQgd29uJ3Qg
Zml4IHRoaXMgcHJvYmxlbSwgYnV0IGluIGdlbmVyYWwgaWYgeW91J3JlIGJ1aWxkaW5nDQpm
cm9tIHNvdXJjZSBhbnl3YXkgeW91IHNob3VsZCB1c2UgdGhlIG1vc3QgcmVjZW50IHZlcnNp
b24uDQoNCi0tIFBNTQ==

------=_NextPart_66D1E0D1_12CD71F8_2D3DA0BF
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5GdXJ0aGVybW9yZSwgSSBhbHNvIHRlc3RlZCBhIHByZWNv
bXBpbGVkIDxjb2RlIGRhdGEtc291cmNlcG9zPSI0NDU6NDMtNDQ1OjYxIj5xZW11LXN5c3Rl
bS1hcm0uZXhlPC9jb2RlPiBpbiB3aW5kb3dzICh0aGUgPGNvZGUgZGF0YS1zb3VyY2Vwb3M9
IjQ0NTo4MS00NDU6ODgiPi12ZXJzaW9uPC9jb2RlPiBjb21tYW5kIHNob3dzIHRoZSBzYW1l
IDcuMi4wIHZlcnNpb24gb2YgUUVNVSwgYWx0aG91Z2ggSSdtIG5vdCBzdXJlIGlmIHRoZXJl
IHdlcmUgYW55IGRpZmZlcmVuY2VzIGluIHRoZSBjb21waWxhdGlvbiBwcm9jZXNzKSB0byBk
ZWJ1ZyB0aGUgc2FtZSBVLUJvb3QgY29kZSwgYW5kIEkgZGlkIG5vdCBlbmNvdW50ZXIgdGhl
IGVycm9yIGF0IHRoZSA8Y29kZSBkYXRhLXNvdXJjZXBvcz0iNDQ1OjI5MC00NDU6MzAwIj5n
ZXRfY3B1X3JldjwvY29kZT4gc3RlcC4mbmJzcDs8c3BhbiBzdHlsZT0iY29sb3I6IHJnYig0
NCwgNDQsIDU0KTsgZm9udC1mYW1pbHk6IC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVt
Rm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssICZxdW90O05vdG8gU2FucyZxdW90OywgSGVs
dmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVv
dDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7OyBmb250LXNpemU6IDE2cHg7IHdoaXRl
LXNwYWNlLWNvbGxhcHNlOiBwcmVzZXJ2ZTsiPkhvdyBjYW4gdGhpcyBzaXR1YXRpb24gYmUg
ZXhwbGFpbmVkPyA8L3NwYW4+UXVpdGUgY29uZnVzZWQuJm5ic3A7PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdiBzdHlsZT0icG9zaXRpb246IHJlbGF0aXZlOyI+T24gRnJpLCAzMCBBdWcg
MjAyNCBhdCAwNToxMSwgR3V5ICZsdDtndXlxcWNvbUBxcS5jb20mZ3Q7IHdyb3RlOjxicj4m
Z3Q7PGJyPiZndDsgSSBhbSB0cnlpbmcgdG8gZGVidWcgVS1Cb290IGNvZGUgaW4gVWJ1bnR1
IDE4LjA0IHVzaW5nIHRoZSBtY2lteDZ1bC1ldmsgYm9hcmQgaW4gUUVNVS4gSSBoYXZlIHN1
Y2Nlc3NmdWxseSBjb21waWxlZCBRRU1VIGFuZCBVLUJvb3QgdXNpbmcgYXJtLWxpbnV4LWdu
dWVhYmloZi0uIFdoZW4gSSBhdHRlbXB0IHRvIHJ1biBVLUJvb3QgYW5kIGRlYnVnIGl0IHdp
dGggR0RCLCBJIGVuY291bnRlciBhbiBpc3N1ZSBpbiB0aGUgZ2V0X2NwdV9yZXYgZnVuY3Rp
b246PGJyPiZndDs8YnI+Jmd0OyBzdHJ1Y3Qgc2N1X3JlZ3MgKnNjdSA9IChzdHJ1Y3Qgc2N1
X3JlZ3MgKilTQ1VfQkFTRV9BRERSOzxicj4mZ3Q7IDJjZmcgPSByZWFkbCgmYW1wO3NjdS0m
Z3Q7Y29uZmlnKSAmYW1wOyAzOzxicj4mZ3Q7PGJyPiZndDsgVGhpcyB0cmlnZ2VycyBhIGRh
dGFfYWJvcnQgZXJyb3IuIFRoZSBsb2cgZGlzcGxheXMgIkludmFsaWQgcmVhZCBhdCBhZGRy
IDB4QTAwMDA0LCBzaXplIDQsIHJlZ2lvbiAnKG51bGwpJywgcmVhc29uOiByZWplY3RlZC4i
PGJyPjxicj5UaGlzIGlzIGJlY2F1c2UgUUVNVSBkb2VzIG5vdCBtb2RlbCBhbnkgZGV2aWNl
IGF0IHRoYXQgYWRkcmVzcy48YnI+V2hhdCBkbyB5b3UgdGhpbmsgaXMgc3VwcG9zZWQgdG8g
YmUgdGhlcmU/IFRoZSBDb3J0ZXgtQTkgaGFzPGJyPmEgc25vb3AtY29udHJvbC1yZWdpc3Rl
ciBhdCB0aGF0IG9mZnNldCBmcm9tIFBFUklQSEJBU0UsIGJ1dDxicj5hcyBmYXIgYXMgSSBh
bSBhd2FyZSB0aGUgQ29ydGV4LUE3IHdoaWNoIHRoZSBtY2lteDZ1bC1ldms8YnI+Ym9hcmQg
dXNlcyBkb2VzIG5vdCBoYXZlIGFueSBTQ1UgcmVnaXN0ZXJzLjxicj48YnI+Jmd0OyBJJ3Zl
IHRlc3RlZCBtdWx0aXBsZSB2ZXJzaW9ucyBvZiBRRU1VICg3LjIuMC80LjEuMSkgYW5kIFUt
Qm9vdCAodS1ib290LWZzbGMtMjAxNi4wNS91LWJvb3QtZnNsYy0yMDIzLjEwL3Vib290LWlt
eC1yZWxfaW14XzQuMS4xNV8yLjEuMF9nYSkuIFdoZW4gSSBydW4gcWVtdS1zeXN0ZW0tYXJt
IC1NIGhlbHAsIHRoZSBTdXBwb3J0ZWQgbWFjaGluZXMgbGlzdCBpbmNsdWRlcyBtY2lteDZ1
bC1ldmsuPGJyPjxicj5CeSB0aGUgd2F5LCA3LjIgaXMgbm93IGEgbW9kZXJhdGVseSBvbGRl
ciB2ZXJzaW9uIG9mIFFFTVUuPGJyPkl0IHdvbid0IGZpeCB0aGlzIHByb2JsZW0sIGJ1dCBp
biBnZW5lcmFsIGlmIHlvdSdyZSBidWlsZGluZzxicj5mcm9tIHNvdXJjZSBhbnl3YXkgeW91
IHNob3VsZCB1c2UgdGhlIG1vc3QgcmVjZW50IHZlcnNpb24uPGJyPjxicj4tLSBQTU08L2Rp
dj4=

------=_NextPart_66D1E0D1_12CD71F8_2D3DA0BF--

