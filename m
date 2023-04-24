Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2792278ejm;
        Mon, 24 Apr 2023 06:01:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZkS/J6EwUUqLmXjGOBQbx78wqRqFuFi/UwggemNB1AWPeMvnLkt5HYQNVz8oVsRHOLJwrr
X-Received: by 2002:ac8:5ac7:0:b0:3ef:2821:4869 with SMTP id d7-20020ac85ac7000000b003ef28214869mr23152068qtd.34.1682341273711;
        Mon, 24 Apr 2023 06:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682341273; cv=none;
        d=google.com; s=arc-20160816;
        b=atul/DScMc2GukRs5Fxx+mUq3VgkzZXte1GZADYP5Z0jl9vlE92HBQe61MPMLvSQBm
         PlawEJiIfBdtrcJetUnYxcAxaINmUJwVy+UQ37kSWHNpfyx8h8vxPLl+LsHXucOnPPvC
         GOKgwSDvmVjGO6ga1rJ948kuVDzByyKN85+5lES07Gfvn1wYV30a4NgB6sFlvlBhba6n
         E/h927qgR/M3iHvbYDUiS+pNe2RbdgAoNgBZugp0EwJru3fRhzajLm8Jrv474RCJ6BQX
         t6rbekJUOj3DOqAeo8hCKK4BwC8oDbsyFpk3ivskYEfLOh4i0Ub8AqeDlrpMh1J23D2K
         W2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version:subject
         :to:from:date;
        bh=w2EMXolDiyLSYoS/s+8D5PM1+UTzaYVYQ0KIJD+K9ro=;
        b=fxZ9u6y8ar55UyO2Ln+jyfHomackru8r2MHG2di08dnxnS2nmNfOT9r3OkZFnJAsSe
         jsR82qRzN3jo0a83SktEHKqLeCosGaNRuvj0VBeTVLKRSPIDIGC/Xs7LZiqXZSX+XqJ0
         7um7BUYMs4t9cIFdcZexYXvM/pLm1wLkR5cnsMnHmoMlopHLX1uIdiD0Ld775bBxlL1F
         YF1huRpgMHSCz9XnOy9MzHhgm5wIPNVvg4NRiuXWmgECZFUWhWN8Y5XGjY6QwhUNUfYg
         6URWQJPLEghbh2MxQyc6vBr6rtIZZlQLQx3Wqgl0EZn+hIG2VOhgO3vP5fRpLbeVOWFb
         j0GA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05622a14cc00b003e4e978fca2si7469603qtx.666.2023.04.24.06.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 06:01:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqvoB-00023Y-5b; Mon, 24 Apr 2023 09:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1pqvPK-0005RU-L3
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 08:35:02 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>) id 1pqvPI-0005Ic-86
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 08:35:02 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwAXkpYpd0ZkBeiKHg--.17994S2;
 Mon, 24 Apr 2023 20:33:45 +0800 (CST)
Received: from wangyuquan1236$phytium.com.cn ( [218.76.62.144] ) by
 ajax-webmail-mail (Coremail) ; Mon, 24 Apr 2023 20:34:57 +0800 (GMT+08:00)
X-Originating-IP: [218.76.62.144]
Date: Mon, 24 Apr 2023 20:34:57 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?546L5a6H5rOJ?= <wangyuquan1236@phytium.com.cn>
To: qemu-arm@nongnu.org
Subject: Problem of initialization of platform-ehci-usb in sbsa-ref
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220506(458b1948)
 Copyright (c) 2002-2023 www.mailtech.cn
 mispb-76b96e3b-3ecc-44d5-9200-de81e6d4c242-
X-CM-CTRLDATA: pjNREGZvb3Rlcl9odG09MjExMDo0Njg=
Content-Type: multipart/alternative; 
 boundary="----=_Part_2954_1843051348.1682339697824"
MIME-Version: 1.0
Message-ID: <182c9459.343.187b34294a0.Coremail.wangyuquan1236@phytium.com.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwC3C7Bxd0ZkHrQAAA--.233W
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQATAWRFiwkIN
	gABsP
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZFWDKr48KF4ruw17ury7Awb_yoW8Aw15pF
 W3ta4fZa17Gr1xJ343G3WI9ryYvryvgr47G348Gr18CwsF9r129a42qay5ZFy7GF1qkF1j
 v3WagF45WrZ8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 Apr 2023 09:00:24 -0400
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
X-TUID: 7W9OPNk+oJ57

------=_Part_2954_1843051348.1682339697824
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
c2Nsb3NlIHRoZSBjb250ZW50cyBvZiB0aGlzIGNvbW11bmljYXRpb24gdG8gb3RoZXJzLg==
------=_Part_2954_1843051348.1682339697824
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
Pjxicj48aSBzdHlsZT0iY29sb3I6IHJnYigxMTksIDExOSwgMTE5KTsgZm9udC1mYW1pbHk6IOWu
i+S9kzsgZm9udC1zaXplOiB4LXNtYWxsOyI+5L+h5oGv5a6J5YWo5aOw5piO77ya5pys6YKu5Lu2
5YyF5ZCr5L+h5oGv5b2S5Y+R5Lu25Lq65omA5Zyo57uE57uH5omA5pyJLOWPkeS7tuS6uuaJgOWc
qOe7hOe7h+WvueivpemCruS7tuaLpeacieaJgOacieadg+WIqeOAguivt+aOpeaUtuiAheazqOaE
j+S/neWvhizmnKrnu4/lj5Hku7bkurrkuabpnaLorrjlj68s5LiN5b6X5ZCR5Lu75L2V56ys5LiJ
5pa557uE57uH5ZKM5Liq5Lq66YCP6Zyy5pys6YKu5Lu25omA5ZCr5L+h5oGv44CCPGJyPkluZm9y
bWF0aW9uIFNlY3VyaXR5IE5vdGljZTogVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlz
IG1haWwgaXMgc29sZWx5IHByb3BlcnR5IG9mIHRoZSBzZW5kZXIncyBvcmdhbml6YXRpb24uVGhp
cyBtYWlsIGNvbW11bmljYXRpb24gaXMgY29uZmlkZW50aWFsLlJlY2lwaWVudHMgbmFtZWQgYWJv
dmUgYXJlIG9ibGlnYXRlZCB0byBtYWludGFpbiBzZWNyZWN5IGFuZCBhcmUgbm90IHBlcm1pdHRl
ZCB0byBkaXNjbG9zZSB0aGUgY29udGVudHMgb2YgdGhpcyBjb21tdW5pY2F0aW9uIHRvIG90aGVy
cy48L2k+
------=_Part_2954_1843051348.1682339697824--

