Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp525262lff;
        Fri, 10 Jan 2020 02:54:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwURDydlrEEZ0S1DOyYe4keYyoqoBGCyUoKxysMKH3527kMzr9D54uj+bKVtL/ohUneAzz8
X-Received: by 2002:a17:906:3796:: with SMTP id n22mr2451926ejc.222.1578653655359;
        Fri, 10 Jan 2020 02:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578653655; cv=none;
        d=google.com; s=arc-20160816;
        b=bYD3/AE1lDXTmKOT/Xowip2jFvCtS9/DTxXDtIcPL4FlbjjFcX+8CuJaFrtOiNMM0A
         mr1c0xfFwjcwfM+YqoyfqO63tnFJMyOUEEFxfPGlF94PiCf6H156/xG2d6W+irBOWXtN
         W8bElc6LLkLv/vDM5osyQQweDdmYYvKfhvGPyxVrLSDhI/HhNIHCpMh2ezhUbkSmaXDH
         Jg5OHC2ZPtBxzeNoCRHWrS2zaMZkMToYbpMD9/x4aOjAo+Ru7VMDewAM4Y+OAS9NDFEN
         klQmCrpSddd+IsaP8rpKKA9NIaf3SLHfUlBMnLWcMmebVwlkwb9E+Pnza2S+diShHOCx
         jX+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:date:to:from
         :resent-from:content-transfer-encoding:mime-version:message-id
         :subject:in-reply-to:resent-message-id:resent-date;
        bh=DVFKRnL/UvlzgQD0q22eoQ1NJ7B/nqUmxVsOc/5IlQw=;
        b=wJV75HJP8w+I4uTKiK5Be8jrRi3zdtBJ0Sdtkoj5Gle7uuJARFk0UeZ/yfxR0PMIK3
         BrFltVH7/4RR8EYEGbBgGWMBunl1B6+Z4DiswNOIsr7xdIj99Eoamg+8E652ipeRor5F
         x+lkq1nOLqf3z0b4IZ4uc8DCHAslL4+arvcIvSRMngdXgy/1C+/rxM2A9M4abYeydLl1
         biUD6r6mXMZ75Rke56ye84pyWJWjU+l1LXocf2S86bmckfUaKExKp8VWhaCCMyuJjjM+
         HJrcdJHtLCtzM4KFiSREjmJ6JxXievqlyr30HH5/0uNiZa2ltQbM7Wwpp/AodstrmVyg
         b2VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14si1051115ejg.189.2020.01.10.02.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 02:54:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iprvi-00069e-7M
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 05:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iprva-00068U-Ao
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:54:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iprvZ-0004ag-6f
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:54:06 -0500
Resent-Date: Fri, 10 Jan 2020 05:54:06 -0500
Resent-Message-Id: <E1iprvZ-0004ag-6f@eggs.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21483)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iprvW-0004NQ-6h; Fri, 10 Jan 2020 05:54:02 -0500
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1578653603014804.0114383632248;
 Fri, 10 Jan 2020 02:53:23 -0800 (PST)
In-Reply-To: <20200110102518.4233-1-clg@kaod.org>
Subject: Re: [PATCH v2 0/5] aspeed: extensions and fixes
Message-ID: <157865360186.14299.5035230619156976945@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: clg@kaod.org
Date: Fri, 10 Jan 2020 02:53:23 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.54
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, andrew@aj.id.au, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, philmd@redhat.com, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: umUocgG4/BS3

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDExMDEwMjUxOC40MjMz
LTEtY2xnQGthb2Qub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9ja2VyLXF1
aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29tbWFuZHMg
YW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxlZCwgeW91
IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBWPTEgTkVUV09SSz0x
CnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5WPTEgSj0xNCBORVRX
T1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCmF0dGVtcHQgdG8gYWRkIGR1cGxpY2F0ZSBw
cm9wZXJ0eSAnZW1tYycgdG8gb2JqZWN0ICh0eXBlICdhc3QyNjAwLWEwJykKQnJva2VuIHBpcGUK
L3RtcC9xZW11LXRlc3Qvc3JjL3Rlc3RzL2xpYnF0ZXN0LmM6MTQ5OiBraWxsX3FlbXUoKSBkZXRl
Y3RlZCBRRU1VIGRlYXRoIGZyb20gc2lnbmFsIDYgKEFib3J0ZWQpIChjb3JlIGR1bXBlZCkKRVJS
T1IgLSB0b28gZmV3IHRlc3RzIHJ1biAoZXhwZWN0ZWQgNiwgZ290IDUpCm1ha2U6ICoqKiBbY2hl
Y2stcXRlc3QtYWFyY2g2NF0gRXJyb3IgMQptYWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hl
ZCBqb2JzLi4uLgogIFRFU1QgICAgaW90ZXN0LXFjb3cyOiAwOTcKICBURVNUICAgIGlvdGVzdC1x
Y293MjogMDk4Ci0tLQogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkK
c3VicHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snc3VkbycsICctbicsICdk
b2NrZXInLCAncnVuJywgJy0tbGFiZWwnLCAnY29tLnFlbXUuaW5zdGFuY2UudXVpZD0zYzBhZmI1
NjI4YWM0MjJjOTM4YWExYzgzOWEzMWUxOCcsICctdScsICcxMDAzJywgJy0tc2VjdXJpdHktb3B0
JywgJ3NlY2NvbXA9dW5jb25maW5lZCcsICctLXJtJywgJy1lJywgJ1RBUkdFVF9MSVNUPScsICct
ZScsICdFWFRSQV9DT05GSUdVUkVfT1BUUz0nLCAnLWUnLCAnVj0nLCAnLWUnLCAnSj0xNCcsICct
ZScsICdERUJVRz0nLCAnLWUnLCAnU0hPV19FTlY9MScsICctZScsICdDQ0FDSEVfRElSPS92YXIv
dG1wL2NjYWNoZScsICctdicsICcvaG9tZS9wYXRjaGV3Mi8uY2FjaGUvcWVtdS1kb2NrZXItY2Nh
Y2hlOi92YXIvdG1wL2NjYWNoZTp6JywgJy12JywgJy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRt
cC11MDN3czRsdS9zcmMvZG9ja2VyLXNyYy4yMDIwLTAxLTEwLTA1LjQyLjQ4LjEzMzY3Oi92YXIv
dG1wL3FlbXU6eixybycsICdxZW11OmNlbnRvczcnLCAnL3Zhci90bXAvcWVtdS9ydW4nLCAndGVz
dC1xdWljayddJyByZXR1cm5lZCBub24temVybyBleGl0IHN0YXR1cyAyLgpmaWx0ZXI9LS1maWx0
ZXI9bGFiZWw9Y29tLnFlbXUuaW5zdGFuY2UudXVpZD0zYzBhZmI1NjI4YWM0MjJjOTM4YWExYzgz
OWEzMWUxOAptYWtlWzFdOiAqKiogW2RvY2tlci1ydW5dIEVycm9yIDEKbWFrZVsxXTogTGVhdmlu
ZyBkaXJlY3RvcnkgYC92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC11MDN3czRsdS9zcmMnCm1h
a2U6ICoqKiBbZG9ja2VyLXJ1bi10ZXN0LXF1aWNrQGNlbnRvczddIEVycm9yIDIKCnJlYWwgICAg
MTBtMzMuNTExcwp1c2VyICAgIDBtOC44NjRzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBh
dApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDExMDEwMjUxOC40MjMzLTEtY2xnQGthb2Qu
b3JnL3Rlc3RpbmcuZG9ja2VyLXF1aWNrQGNlbnRvczcvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWls
IGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcv
XS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

