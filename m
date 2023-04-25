Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3340648ejm;
        Tue, 25 Apr 2023 01:23:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZzsCy7HIXao4ULilqFNeljp3PHoOEszPd3i2VTmMvKkHbBYU5msOTeGvttbZU4Lqpv0O+p
X-Received: by 2002:ad4:5b8b:0:b0:5c5:95db:859c with SMTP id 11-20020ad45b8b000000b005c595db859cmr20491059qvp.33.1682411013313;
        Tue, 25 Apr 2023 01:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682411013; cv=none;
        d=google.com; s=arc-20160816;
        b=zLqldLaLCgKGvfrCuXKCjN7dzRfHmf7l1FxGTrI1MheG85XL+ewdgJD9vbKYwtNOFA
         PWRzSPaM5QU+/2LCc+wwhqRxB/tpzCUat5rvUbqxybAPouQWDYSFcgngJh+0Um6PErDJ
         DhnEshhlOli64yu9AKJI5zGuk6sPVx+8oi87UdP1HO5PMqHTRjAoAcrW6WVpwejQbvIK
         94+K3YP2B1461uIk7X5IFMZTvMq2d1FLD/CdxdVIT1dWoWGk9E81y+XlP5UnsTAYhheZ
         T2ILWIFaUxRyMbJ1iiUJ63rSqthaRmpZV/UHrq+Xt5XMLAs7JDwtyJTECPnOR/AyK2yR
         ieUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version:subject
         :to:from:date;
        bh=QM7xe1+GOFfOAsL4G2J6bnxcLB1Ocn4En/g8IZK90G4=;
        b=x3kBQjG5vV2CM+cmEW/7tTRsn+qu4EHF1pUPB2GEFlS2DRW6hOevQi2NDUcputKToe
         v8Y3JKTNzUQ/XURvVmtbC8SJPYlFR/RrSXq6eyekvPtoaYpV3M02OQ95gXYcaK9/Z9Sp
         KH771hjX5J30drRfsOUigpgI8fXK4gVOX2SQOlxNjQmgb/bigjQK7dZJG92ygtSJGSJs
         SwWXItrs9rYJf8Fxe041HyBQv4J2hjrJxCxzPbWQd0lGZnhWrbOAfBGquZYWQ3ftwA3r
         cBlNS5+8psI7H4G6BYZ1WcIIr3Zp0/o+94J7PykKrzE+gKMoBD1aaP4S1T8dHEksUEDZ
         1Bag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3-20020a05622a000300b003bd14d5b9b6si8650655qtw.1.2023.04.25.01.23.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 01:23:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prDx8-0001uP-O5; Tue, 25 Apr 2023 04:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1prDx0-0001tl-BV
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 04:23:09 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>) id 1prDwu-0004En-9q
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 04:23:02 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwDXq22fjkdktieqBQ--.12629S2;
 Tue, 25 Apr 2023 16:26:07 +0800 (CST)
Received: from wangyuquan1236$phytium.com.cn ( [218.76.62.144] ) by
 ajax-webmail-mail (Coremail) ; Tue, 25 Apr 2023 16:22:49 +0800 (GMT+08:00)
X-Originating-IP: [218.76.62.144]
Date: Tue, 25 Apr 2023 16:22:49 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?546L5a6H5rOJ?= <wangyuquan1236@phytium.com.cn>
To: qemu-arm@nongnu.org
Subject: Problem of initialization of platform-ehci-usb in sbsa-ref
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220506(458b1948)
 Copyright (c) 2002-2023 www.mailtech.cn
 mispb-76b96e3b-3ecc-44d5-9200-de81e6d4c242-
X-CM-CTRLDATA: Hju1KmZvb3Rlcl9odG09MjU2NTo0Njg=
Content-Type: multipart/alternative; 
 boundary="----=_Part_1408_2129129438.1682410969165"
MIME-Version: 1.0
Message-ID: <5624251e.193.187b782184d.Coremail.wangyuquan1236@phytium.com.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwBH9KzZjUdk33EAAA--.191W
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQATAWRFiwkIN
	gAFsL
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZFWDKr48KF4ruw17ury7Awb_yoW8Kw13pF
 W3ta4xZanrWr1xGry3G3WI9ryYqryvgrW7C34rGr1kCwsF9r129a47tay5Z3W7GF1qkFyj
 v3WagF43XrZ8AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=209.97.181.73;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
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
X-TUID: kT2AWO5xgm0H

------=_Part_1408_2129129438.1682410969165
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksCgoKCgpBcyBhIGp1bmlvciBPUyBlbmdpbmVlciwgSSBtZXQgYSBwcm9ibGVtIG9mIGluaXRp
YWxpemF0aW9uIG9mIHBsYXRmb3JtLWVoY2ktdXNiIGluIHNic2EtcmVmIHJlY2VudGx5LiAKClRo
ZSByZXN1bHQgb2Ygc2JzYS1hY3MoVUVGSSBTaGVsbCBhcHBsaWNhdGlvbikgb24gc2JzYS1yZWYg
c2hvd3MgdGhhdCAiUGVyaXBoZXJhbDogTnVtIG9mIFVTQiBjb250cm9sbGVyczogMCIuIAoKQW5k
IEkgZm91bmQgdGhhdCB0aGUgcGxhdGZvcm0tZWhjaS11c2IgaW4gcWVtdSBpcyBhIDMyLWJpdHMg
RE1BIGRldmljZSB3aGlsZSBvdXIgc2JzYS1yZWYgbWFjaGluZSBkb2VzIG5vdCBvd24gCgpEUkFN
IG1lbW9yeSBiZWxvdyA0Ry4gSXQgc2VlbXMgbGlrZSBhIGNvbnRyYWRpY3Rpb24gcG9pbnQuQ29u
bmVjdGluZyBTTU1VdjMgd2l0aCB0aGUgcGxhdGZvcm0gRUhDSSAKCmluIG9yZGVyIHRvIHByb2Jl
IGl0IGNhbiBiZSBhIGdvb29kIHdheSA/IE9yIHRoZXJlIGFyZSBzb21lIGRldGFpbCB1c2FnZSBJ
IGlnbm9yZWQ/4oCLCgoKCgpUaGFua3MKCll1cXVhbiBXYW5nCgoKCgoKCgoKCgoKCuS/oeaBr+Wu
ieWFqOWjsOaYju+8muacrOmCruS7tuWMheWQq+S/oeaBr+W9kuWPkeS7tuS6uuaJgOWcqOe7hOe7
h+aJgOaciSzlj5Hku7bkurrmiYDlnKjnu4Tnu4flr7nor6Xpgq7ku7bmi6XmnInmiYDmnInmnYPl
iKnjgILor7fmjqXmlLbogIXms6jmhI/kv53lr4Ys5pyq57uP5Y+R5Lu25Lq65Lmm6Z2i6K645Y+v
LOS4jeW+l+WQkeS7u+S9leesrOS4ieaWuee7hOe7h+WSjOS4quS6uumAj+mcsuacrOmCruS7tuaJ
gOWQq+S/oeaBr+OAggpJbmZvcm1hdGlvbiBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZvcm1hdGlv
biBjb250YWluZWQgaW4gdGhpcyBtYWlsIGlzIHNvbGVseSBwcm9wZXJ0eSBvZiB0aGUgc2VuZGVy
J3Mgb3JnYW5pemF0aW9uLlRoaXMgbWFpbCBjb21tdW5pY2F0aW9uIGlzIGNvbmZpZGVudGlhbC5S
ZWNpcGllbnRzIG5hbWVkIGFib3ZlIGFyZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2VjcmVjeSBh
bmQgYXJlIG5vdCBwZXJtaXR0ZWQgdG8gZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRoaXMgY29t
bXVuaWNhdGlvbiB0byBvdGhlcnMuCgrkv6Hmga/lronlhajlo7DmmI7vvJrmnKzpgq7ku7bljIXl
kKvkv6Hmga/lvZLlj5Hku7bkurrmiYDlnKjnu4Tnu4fmiYDmnIks5Y+R5Lu25Lq65omA5Zyo57uE
57uH5a+56K+l6YKu5Lu25oul5pyJ5omA5pyJ5p2D5Yip44CC6K+35o6l5pS26ICF5rOo5oSP5L+d
5a+GLOacque7j+WPkeS7tuS6uuS5pumdouiuuOWPryzkuI3lvpflkJHku7vkvZXnrKzkuInmlrnn
u4Tnu4flkozkuKrkurrpgI/pnLLmnKzpgq7ku7bmiYDlkKvkv6Hmga/jgIIKSW5mb3JtYXRpb24g
U2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWFpbCBp
cyBzb2xlbHkgcHJvcGVydHkgb2YgdGhlIHNlbmRlcidzIG9yZ2FuaXphdGlvbi5UaGlzIG1haWwg
Y29tbXVuaWNhdGlvbiBpcyBjb25maWRlbnRpYWwuUmVjaXBpZW50cyBuYW1lZCBhYm92ZSBhcmUg
b2JsaWdhdGVkIHRvIG1haW50YWluIHNlY3JlY3kgYW5kIGFyZSBub3QgcGVybWl0dGVkIHRvIGRp
c2Nsb3NlIHRoZSBjb250ZW50cyBvZiB0aGlzIGNvbW11bmljYXRpb24gdG8gb3RoZXJzLgoK5L+h
5oGv5a6J5YWo5aOw5piO77ya5pys6YKu5Lu25YyF5ZCr5L+h5oGv5b2S5Y+R5Lu25Lq65omA5Zyo
57uE57uH5omA5pyJLOWPkeS7tuS6uuaJgOWcqOe7hOe7h+WvueivpemCruS7tuaLpeacieaJgOac
ieadg+WIqeOAguivt+aOpeaUtuiAheazqOaEj+S/neWvhizmnKrnu4/lj5Hku7bkurrkuabpnaLo
rrjlj68s5LiN5b6X5ZCR5Lu75L2V56ys5LiJ5pa557uE57uH5ZKM5Liq5Lq66YCP6Zyy5pys6YKu
5Lu25omA5ZCr5L+h5oGv44CCCkluZm9ybWF0aW9uIFNlY3VyaXR5IE5vdGljZTogVGhlIGluZm9y
bWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1haWwgaXMgc29sZWx5IHByb3BlcnR5IG9mIHRoZSBz
ZW5kZXIncyBvcmdhbml6YXRpb24uVGhpcyBtYWlsIGNvbW11bmljYXRpb24gaXMgY29uZmlkZW50
aWFsLlJlY2lwaWVudHMgbmFtZWQgYWJvdmUgYXJlIG9ibGlnYXRlZCB0byBtYWludGFpbiBzZWNy
ZWN5IGFuZCBhcmUgbm90IHBlcm1pdHRlZCB0byBkaXNjbG9zZSB0aGUgY29udGVudHMgb2YgdGhp
cyBjb21tdW5pY2F0aW9uIHRvIG90aGVycy4=
------=_Part_1408_2129129438.1682410969165
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHAgc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJSGksCjwvcD4KPHAgc3R5bGU9ImZvbnQt
ZmFtaWx5OlNpbVN1bjsiPgoJPGJyPgo8L3A+CjxwIHN0eWxlPSJmb250LWZhbWlseTpTaW1TdW47
Ij4KCUFzIGEganVuaW9yIE9TIGVuZ2luZWVyLCBJIG1ldCBhIHByb2JsZW0gb2YgaW5pdGlhbGl6
YXRpb24gb2YgcGxhdGZvcm0tZWhjaS11c2IgaW4gc2JzYS1yZWYgcmVjZW50bHkuJm5ic3A7Cjwv
cD4KPHAgc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJVGhlIHJlc3VsdCBvZiBzYnNhLWFj
cyhVRUZJIFNoZWxsIGFwcGxpY2F0aW9uKSBvbiBzYnNhLXJlZiBzaG93cyB0aGF0ICJQZXJpcGhl
cmFsOiBOdW0gb2YgVVNCIGNvbnRyb2xsZXJzOiAwIi4mbmJzcDsKPC9wPgo8cCBzdHlsZT0iZm9u
dC1mYW1pbHk6U2ltU3VuOyI+CglBbmQgSSBmb3VuZCB0aGF0IHRoZSZuYnNwOzxzcGFuIHN0eWxl
PSJmb250LWZhbWlseTpTaW1TdW47d2hpdGUtc3BhY2U6bm9ybWFsOyI+cGxhdGZvcm0tZWhjaS11
c2IgaW4gcWVtdSBpcyBhIDMyLWJpdHMgRE1BIGRldmljZSB3aGlsZSBvdXIgc2JzYS1yZWYgbWFj
aGluZSBkb2VzIG5vdCBvd24mbmJzcDs8L3NwYW4+IAo8L3A+CjxwIHN0eWxlPSJmb250LWZhbWls
eTpTaW1TdW47Ij4KCTxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpTaW1TdW47d2hpdGUtc3BhY2U6
bm9ybWFsOyI+RFJBTSBtZW1vcnkgYmVsb3cgNEcuIEl0IHNlZW1zIGxpa2UgYSBjb250cmFkaWN0
aW9uIHBvaW50Ljwvc3Bhbj5Db25uZWN0aW5nIFNNTVV2MyB3aXRoIHRoZSBwbGF0Zm9ybSBFSENJ
Jm5ic3A7CjwvcD4KPHAgc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJaW4gb3JkZXIgdG8g
cHJvYmUgaXQgY2FuIGJlIGEgZ29vb2Qgd2F5ID8gT3IgdGhlcmUgYXJlIHNvbWUgZGV0YWlsIHVz
YWdlIEkgaWdub3JlZD/igIsKPC9wPgo8cCBzdHlsZT0iZm9udC1mYW1pbHk6U2ltU3VuOyI+Cgk8
YnI+CjwvcD4KPHAgc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJVGhhbmtzCjwvcD4KPHAg
c3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJWXVxdWFuIFdhbmcKPC9wPgo8cCBzdHlsZT0i
Zm9udC1mYW1pbHk6U2ltU3VuOyI+Cgk8YnI+CjwvcD4KPHAgc3R5bGU9ImZvbnQtZmFtaWx5OlNp
bVN1bjsiPgoJPGJyPgo8L3A+CjxwIHN0eWxlPSJmb250LWZhbWlseTpTaW1TdW47Ij4KCTxicj4K
PC9wPgo8YnI+Cjxicj4KPGkgc3R5bGU9ImNvbG9yOiM3Nzc3Nzc7Zm9udC1mYW1pbHk65a6L5L2T
O2ZvbnQtc2l6ZTp4LXNtYWxsOyI+5L+h5oGv5a6J5YWo5aOw5piO77ya5pys6YKu5Lu25YyF5ZCr
5L+h5oGv5b2S5Y+R5Lu25Lq65omA5Zyo57uE57uH5omA5pyJLOWPkeS7tuS6uuaJgOWcqOe7hOe7
h+WvueivpemCruS7tuaLpeacieaJgOacieadg+WIqeOAguivt+aOpeaUtuiAheazqOaEj+S/neWv
hizmnKrnu4/lj5Hku7bkurrkuabpnaLorrjlj68s5LiN5b6X5ZCR5Lu75L2V56ys5LiJ5pa557uE
57uH5ZKM5Liq5Lq66YCP6Zyy5pys6YKu5Lu25omA5ZCr5L+h5oGv44CCPGJyPgpJbmZvcm1hdGlv
biBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtYWls
IGlzIHNvbGVseSBwcm9wZXJ0eSBvZiB0aGUgc2VuZGVyJ3Mgb3JnYW5pemF0aW9uLlRoaXMgbWFp
bCBjb21tdW5pY2F0aW9uIGlzIGNvbmZpZGVudGlhbC5SZWNpcGllbnRzIG5hbWVkIGFib3ZlIGFy
ZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2VjcmVjeSBhbmQgYXJlIG5vdCBwZXJtaXR0ZWQgdG8g
ZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRoaXMgY29tbXVuaWNhdGlvbiB0byBvdGhlcnMuPC9p
Pjxicj4KPGJyPgo8aSBzdHlsZT0iY29sb3I6Izc3Nzc3Nztmb250LWZhbWlseTrlrovkvZM7Zm9u
dC1zaXplOngtc21hbGw7Ij7kv6Hmga/lronlhajlo7DmmI7vvJrmnKzpgq7ku7bljIXlkKvkv6Hm
ga/lvZLlj5Hku7bkurrmiYDlnKjnu4Tnu4fmiYDmnIks5Y+R5Lu25Lq65omA5Zyo57uE57uH5a+5
6K+l6YKu5Lu25oul5pyJ5omA5pyJ5p2D5Yip44CC6K+35o6l5pS26ICF5rOo5oSP5L+d5a+GLOac
que7j+WPkeS7tuS6uuS5pumdouiuuOWPryzkuI3lvpflkJHku7vkvZXnrKzkuInmlrnnu4Tnu4fl
kozkuKrkurrpgI/pnLLmnKzpgq7ku7bmiYDlkKvkv6Hmga/jgII8YnI+CkluZm9ybWF0aW9uIFNl
Y3VyaXR5IE5vdGljZTogVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1haWwgaXMg
c29sZWx5IHByb3BlcnR5IG9mIHRoZSBzZW5kZXIncyBvcmdhbml6YXRpb24uVGhpcyBtYWlsIGNv
bW11bmljYXRpb24gaXMgY29uZmlkZW50aWFsLlJlY2lwaWVudHMgbmFtZWQgYWJvdmUgYXJlIG9i
bGlnYXRlZCB0byBtYWludGFpbiBzZWNyZWN5IGFuZCBhcmUgbm90IHBlcm1pdHRlZCB0byBkaXNj
bG9zZSB0aGUgY29udGVudHMgb2YgdGhpcyBjb21tdW5pY2F0aW9uIHRvIG90aGVycy48L2k+PGJy
Pgo8YnI+CjxpIHN0eWxlPSJjb2xvcjojNzc3Nzc3O2ZvbnQtZmFtaWx5OuWui+S9kztmb250LXNp
emU6eC1zbWFsbDsiPuS/oeaBr+WuieWFqOWjsOaYju+8muacrOmCruS7tuWMheWQq+S/oeaBr+W9
kuWPkeS7tuS6uuaJgOWcqOe7hOe7h+aJgOaciSzlj5Hku7bkurrmiYDlnKjnu4Tnu4flr7nor6Xp
gq7ku7bmi6XmnInmiYDmnInmnYPliKnjgILor7fmjqXmlLbogIXms6jmhI/kv53lr4Ys5pyq57uP
5Y+R5Lu25Lq65Lmm6Z2i6K645Y+vLOS4jeW+l+WQkeS7u+S9leesrOS4ieaWuee7hOe7h+WSjOS4
quS6uumAj+mcsuacrOmCruS7tuaJgOWQq+S/oeaBr+OAgjxicj4KSW5mb3JtYXRpb24gU2VjdXJp
dHkgTm90aWNlOiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWFpbCBpcyBzb2xl
bHkgcHJvcGVydHkgb2YgdGhlIHNlbmRlcidzIG9yZ2FuaXphdGlvbi5UaGlzIG1haWwgY29tbXVu
aWNhdGlvbiBpcyBjb25maWRlbnRpYWwuUmVjaXBpZW50cyBuYW1lZCBhYm92ZSBhcmUgb2JsaWdh
dGVkIHRvIG1haW50YWluIHNlY3JlY3kgYW5kIGFyZSBub3QgcGVybWl0dGVkIHRvIGRpc2Nsb3Nl
IHRoZSBjb250ZW50cyBvZiB0aGlzIGNvbW11bmljYXRpb24gdG8gb3RoZXJzLjwvaT48YnI+PGJy
PjxpIHN0eWxlPSJjb2xvcjogcmdiKDExOSwgMTE5LCAxMTkpOyBmb250LWZhbWlseTog5a6L5L2T
OyBmb250LXNpemU6IHgtc21hbGw7Ij7kv6Hmga/lronlhajlo7DmmI7vvJrmnKzpgq7ku7bljIXl
kKvkv6Hmga/lvZLlj5Hku7bkurrmiYDlnKjnu4Tnu4fmiYDmnIks5Y+R5Lu25Lq65omA5Zyo57uE
57uH5a+56K+l6YKu5Lu25oul5pyJ5omA5pyJ5p2D5Yip44CC6K+35o6l5pS26ICF5rOo5oSP5L+d
5a+GLOacque7j+WPkeS7tuS6uuS5pumdouiuuOWPryzkuI3lvpflkJHku7vkvZXnrKzkuInmlrnn
u4Tnu4flkozkuKrkurrpgI/pnLLmnKzpgq7ku7bmiYDlkKvkv6Hmga/jgII8YnI+SW5mb3JtYXRp
b24gU2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWFp
bCBpcyBzb2xlbHkgcHJvcGVydHkgb2YgdGhlIHNlbmRlcidzIG9yZ2FuaXphdGlvbi5UaGlzIG1h
aWwgY29tbXVuaWNhdGlvbiBpcyBjb25maWRlbnRpYWwuUmVjaXBpZW50cyBuYW1lZCBhYm92ZSBh
cmUgb2JsaWdhdGVkIHRvIG1haW50YWluIHNlY3JlY3kgYW5kIGFyZSBub3QgcGVybWl0dGVkIHRv
IGRpc2Nsb3NlIHRoZSBjb250ZW50cyBvZiB0aGlzIGNvbW11bmljYXRpb24gdG8gb3RoZXJzLjwv
aT4=
------=_Part_1408_2129129438.1682410969165--

