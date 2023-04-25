Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3342490ejm;
        Tue, 25 Apr 2023 01:28:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350b1ByMxCQJXG76n5/jS71bEFLPwFfE2Wu0+6d9/5HMM2GTWEcKhPrGrZ4D4ivn5n4SkS+41
X-Received: by 2002:a05:6214:d08:b0:609:3be9:9d83 with SMTP id 8-20020a0562140d0800b006093be99d83mr21697819qvh.42.1682411331780;
        Tue, 25 Apr 2023 01:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682411331; cv=none;
        d=google.com; s=arc-20160816;
        b=MX/KtgXyxoFojokwXCcD8PZrJf2BGIK12mkgWJU0bKr2Us704YMMev8Om5dIfCWAt3
         aV6An+FRlDbTLzFLTBRSh/xKjjg+6K4z+dgB7JXRWOPlwptT1i83R6L4LaWdmHfhAJDu
         rB33Ze1FiX7+tgZ7ne1VeGqYtDDirDBEU2oKYp5fvRMvGpoSjVgwnHpwSeOhCnXRJcXo
         tYPWbImiB0t6DBF7uZm/BUejoCSeeHIIBG2G/G6mJDheKXUl/dAivWz73jbWwOi6QT7D
         HehJY5msAcOTirUEiBo015CZqVBaYWMcSaUMsl57tOrpnkIaRn0lCpD1rPAV5oZ+Fxq5
         dL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version:subject
         :to:from:date;
        bh=spDVQYGjIVApDj4gyyCfpNLuwOyHVOEXHeZShzIGXys=;
        b=BdiEWrnu4gTaCjkldz5s5EV4KTC0eWB6O+BzVWClFYcFBIMra7BMUm3VCuc4PK5oMF
         fkdCKyMik47l6GWLrv4grhLy8nj+vp8j4NzF2iLNjGZwEAf8AF5GL36Kx4gd4RVYemqM
         U6/FO/zMJOWpeQ2ja2oCk/5/AyygwrOKSetTOpr9gQytCMm+nmB5judbTeIiJFQ2PobV
         2YgC9n6YL0QqO1JHpu6b2dUXbNT2i02Rlokft0uaQCLcOVWZ1Uutud85wYMV98hzH+4U
         iJwmb1pnGttcUfVkTs7+ErC3DkGdiGJYaLiX5umuDH7U3pGBHGDgSLAPKW/WpSYlM94q
         SusQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a05621419cc00b005d70ac881f1si8634805qvc.502.2023.04.25.01.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 01:28:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prE2O-0004hI-NP; Tue, 25 Apr 2023 04:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1prE2K-0004fS-Ki
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 04:28:33 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>) id 1prE2H-00056l-Tu
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 04:28:32 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwCXR0nuj0dkSkKqBQ--.14767S2;
 Tue, 25 Apr 2023 16:31:42 +0800 (CST)
Received: from wangyuquan1236$phytium.com.cn ( [218.76.62.144] ) by
 ajax-webmail-mail (Coremail) ; Tue, 25 Apr 2023 16:28:20 +0800 (GMT+08:00)
X-Originating-IP: [218.76.62.144]
Date: Tue, 25 Apr 2023 16:28:20 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?546L5a6H5rOJ?= <wangyuquan1236@phytium.com.cn>
To: qemu-arm@nongnu.org
Subject: Problem of initialization of platform-ehci-usb in sbsa-ref
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220506(458b1948)
 Copyright (c) 2002-2023 www.mailtech.cn
 mispb-76b96e3b-3ecc-44d5-9200-de81e6d4c242-
X-CM-CTRLDATA: 0YqT3GZvb3Rlcl9odG09MzAyNjo0Njg=
Content-Type: multipart/alternative; 
 boundary="----=_Part_1431_668563079.1682411300354"
MIME-Version: 1.0
Message-ID: <7500626.19a.187b7872602.Coremail.wangyuquan1236@phytium.com.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwCHNK0lj0dkk3IAAA--.180W
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQATAWRFiwkIN
	gAHsJ
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxCw1rAF4xJw1rCFyDZw1DZFb_yoW5Aw1DpF
 W3ta4xZanrWr1xGry3K3WI9FyYqryvgrW7C34rGr1kGwsF9r129a47tay5ZF17GF1qkF1j
 vw1agF43XrZ8CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
X-TUID: yJ4XfSCDqr3c

------=_Part_1431_668563079.1682411300354
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksCgoKCgpBcyBhIGp1bmlvciBPUyBlbmdpbmVlciwgSSBtZXQgYSBwcm9ibGVtIG9mIGluaXRp
YWxpemF0aW9uIG9mIHBsYXRmb3JtLWVoY2ktdXNiIGluIHNic2EtcmVmIHJlY2VudGx5LiAKClRo
ZSByZXN1bHQgb2Ygc2JzYS1hY3MoVUVGSSBTaGVsbCBhcHBsaWNhdGlvbikgb24gc2JzYS1yZWYg
c2hvd3MgdGhhdCAiUGVyaXBoZXJhbDogTnVtIG9mIFVTQiBjb250cm9sbGVyczogMCIuIAoKQW5k
IEkgZm91bmQgdGhhdCB0aGUgcGxhdGZvcm0tZWhjaS11c2IgaW4gcWVtdSBpcyBhIDMyLWJpdHMg
RE1BIGRldmljZSB3aGlsZSBvdXIgc2JzYS1yZWYgbWFjaGluZSBkb2VzIG5vdCBvd24gCgpEUkFN
IG1lbW9yeSBiZWxvdyA0Ry4gSXQgc2VlbXMgbGlrZSBhIGNvbnRyYWRpY3Rpb24gcG9pbnQuIENv
bm5lY3RpbmcgU01NVXYzIHdpdGggdGhlIHBsYXRmb3JtIEVIQ0kgCgppbiBvcmRlciB0byBwcm9i
ZSBpdCBjYW4gYmUgYSBnb29vZCB3YXkgPyBPciB0aGVyZSBhcmUgc29tZSBkZXRhaWwgdXNhZ2Ug
SSBpZ25vcmVkP+KAiwoKCgoKVGhhbmtzCgpZdXF1YW4gV2FuZwoKCgoKCgoKCgoKCgrkv6Hmga/l
ronlhajlo7DmmI7vvJrmnKzpgq7ku7bljIXlkKvkv6Hmga/lvZLlj5Hku7bkurrmiYDlnKjnu4Tn
u4fmiYDmnIks5Y+R5Lu25Lq65omA5Zyo57uE57uH5a+56K+l6YKu5Lu25oul5pyJ5omA5pyJ5p2D
5Yip44CC6K+35o6l5pS26ICF5rOo5oSP5L+d5a+GLOacque7j+WPkeS7tuS6uuS5pumdouiuuOWP
ryzkuI3lvpflkJHku7vkvZXnrKzkuInmlrnnu4Tnu4flkozkuKrkurrpgI/pnLLmnKzpgq7ku7bm
iYDlkKvkv6Hmga/jgIIKSW5mb3JtYXRpb24gU2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgbWFpbCBpcyBzb2xlbHkgcHJvcGVydHkgb2YgdGhlIHNlbmRl
cidzIG9yZ2FuaXphdGlvbi5UaGlzIG1haWwgY29tbXVuaWNhdGlvbiBpcyBjb25maWRlbnRpYWwu
UmVjaXBpZW50cyBuYW1lZCBhYm92ZSBhcmUgb2JsaWdhdGVkIHRvIG1haW50YWluIHNlY3JlY3kg
YW5kIGFyZSBub3QgcGVybWl0dGVkIHRvIGRpc2Nsb3NlIHRoZSBjb250ZW50cyBvZiB0aGlzIGNv
bW11bmljYXRpb24gdG8gb3RoZXJzLgoK5L+h5oGv5a6J5YWo5aOw5piO77ya5pys6YKu5Lu25YyF
5ZCr5L+h5oGv5b2S5Y+R5Lu25Lq65omA5Zyo57uE57uH5omA5pyJLOWPkeS7tuS6uuaJgOWcqOe7
hOe7h+WvueivpemCruS7tuaLpeacieaJgOacieadg+WIqeOAguivt+aOpeaUtuiAheazqOaEj+S/
neWvhizmnKrnu4/lj5Hku7bkurrkuabpnaLorrjlj68s5LiN5b6X5ZCR5Lu75L2V56ys5LiJ5pa5
57uE57uH5ZKM5Liq5Lq66YCP6Zyy5pys6YKu5Lu25omA5ZCr5L+h5oGv44CCCkluZm9ybWF0aW9u
IFNlY3VyaXR5IE5vdGljZTogVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1haWwg
aXMgc29sZWx5IHByb3BlcnR5IG9mIHRoZSBzZW5kZXIncyBvcmdhbml6YXRpb24uVGhpcyBtYWls
IGNvbW11bmljYXRpb24gaXMgY29uZmlkZW50aWFsLlJlY2lwaWVudHMgbmFtZWQgYWJvdmUgYXJl
IG9ibGlnYXRlZCB0byBtYWludGFpbiBzZWNyZWN5IGFuZCBhcmUgbm90IHBlcm1pdHRlZCB0byBk
aXNjbG9zZSB0aGUgY29udGVudHMgb2YgdGhpcyBjb21tdW5pY2F0aW9uIHRvIG90aGVycy4KCuS/
oeaBr+WuieWFqOWjsOaYju+8muacrOmCruS7tuWMheWQq+S/oeaBr+W9kuWPkeS7tuS6uuaJgOWc
qOe7hOe7h+aJgOaciSzlj5Hku7bkurrmiYDlnKjnu4Tnu4flr7nor6Xpgq7ku7bmi6XmnInmiYDm
nInmnYPliKnjgILor7fmjqXmlLbogIXms6jmhI/kv53lr4Ys5pyq57uP5Y+R5Lu25Lq65Lmm6Z2i
6K645Y+vLOS4jeW+l+WQkeS7u+S9leesrOS4ieaWuee7hOe7h+WSjOS4quS6uumAj+mcsuacrOmC
ruS7tuaJgOWQq+S/oeaBr+OAggpJbmZvcm1hdGlvbiBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZv
cm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtYWlsIGlzIHNvbGVseSBwcm9wZXJ0eSBvZiB0aGUg
c2VuZGVyJ3Mgb3JnYW5pemF0aW9uLlRoaXMgbWFpbCBjb21tdW5pY2F0aW9uIGlzIGNvbmZpZGVu
dGlhbC5SZWNpcGllbnRzIG5hbWVkIGFib3ZlIGFyZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2Vj
cmVjeSBhbmQgYXJlIG5vdCBwZXJtaXR0ZWQgdG8gZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRo
aXMgY29tbXVuaWNhdGlvbiB0byBvdGhlcnMuCgrkv6Hmga/lronlhajlo7DmmI7vvJrmnKzpgq7k
u7bljIXlkKvkv6Hmga/lvZLlj5Hku7bkurrmiYDlnKjnu4Tnu4fmiYDmnIks5Y+R5Lu25Lq65omA
5Zyo57uE57uH5a+56K+l6YKu5Lu25oul5pyJ5omA5pyJ5p2D5Yip44CC6K+35o6l5pS26ICF5rOo
5oSP5L+d5a+GLOacque7j+WPkeS7tuS6uuS5pumdouiuuOWPryzkuI3lvpflkJHku7vkvZXnrKzk
uInmlrnnu4Tnu4flkozkuKrkurrpgI/pnLLmnKzpgq7ku7bmiYDlkKvkv6Hmga/jgIIKSW5mb3Jt
YXRpb24gU2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
bWFpbCBpcyBzb2xlbHkgcHJvcGVydHkgb2YgdGhlIHNlbmRlcidzIG9yZ2FuaXphdGlvbi5UaGlz
IG1haWwgY29tbXVuaWNhdGlvbiBpcyBjb25maWRlbnRpYWwuUmVjaXBpZW50cyBuYW1lZCBhYm92
ZSBhcmUgb2JsaWdhdGVkIHRvIG1haW50YWluIHNlY3JlY3kgYW5kIGFyZSBub3QgcGVybWl0dGVk
IHRvIGRpc2Nsb3NlIHRoZSBjb250ZW50cyBvZiB0aGlzIGNvbW11bmljYXRpb24gdG8gb3RoZXJz
Lg==
------=_Part_1431_668563079.1682411300354
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
aW9uIHBvaW50LiZuYnNwOzwvc3Bhbj5Db25uZWN0aW5nIFNNTVV2MyB3aXRoIHRoZSBwbGF0Zm9y
bSBFSENJJm5ic3A7CjwvcD4KPHAgc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJaW4gb3Jk
ZXIgdG8gcHJvYmUgaXQgY2FuIGJlIGEgZ29vb2Qgd2F5ID8gT3IgdGhlcmUgYXJlIHNvbWUgZGV0
YWlsIHVzYWdlIEkgaWdub3JlZD/igIsKPC9wPgo8cCBzdHlsZT0iZm9udC1mYW1pbHk6U2ltU3Vu
OyI+Cgk8YnI+CjwvcD4KPHAgc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJVGhhbmtzCjwv
cD4KPHAgc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJWXVxdWFuIFdhbmcKPC9wPgo8cCBz
dHlsZT0iZm9udC1mYW1pbHk6U2ltU3VuOyI+Cgk8YnI+CjwvcD4KPHAgc3R5bGU9ImZvbnQtZmFt
aWx5OlNpbVN1bjsiPgoJPGJyPgo8L3A+CjxwIHN0eWxlPSJmb250LWZhbWlseTpTaW1TdW47Ij4K
CTxicj4KPC9wPgo8YnI+Cjxicj4KPGkgc3R5bGU9ImNvbG9yOiM3Nzc3Nzc7Zm9udC1mYW1pbHk6
5a6L5L2TO2ZvbnQtc2l6ZTp4LXNtYWxsOyI+5L+h5oGv5a6J5YWo5aOw5piO77ya5pys6YKu5Lu2
5YyF5ZCr5L+h5oGv5b2S5Y+R5Lu25Lq65omA5Zyo57uE57uH5omA5pyJLOWPkeS7tuS6uuaJgOWc
qOe7hOe7h+WvueivpemCruS7tuaLpeacieaJgOacieadg+WIqeOAguivt+aOpeaUtuiAheazqOaE
j+S/neWvhizmnKrnu4/lj5Hku7bkurrkuabpnaLorrjlj68s5LiN5b6X5ZCR5Lu75L2V56ys5LiJ
5pa557uE57uH5ZKM5Liq5Lq66YCP6Zyy5pys6YKu5Lu25omA5ZCr5L+h5oGv44CCPGJyPgpJbmZv
cm1hdGlvbiBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhp
cyBtYWlsIGlzIHNvbGVseSBwcm9wZXJ0eSBvZiB0aGUgc2VuZGVyJ3Mgb3JnYW5pemF0aW9uLlRo
aXMgbWFpbCBjb21tdW5pY2F0aW9uIGlzIGNvbmZpZGVudGlhbC5SZWNpcGllbnRzIG5hbWVkIGFi
b3ZlIGFyZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2VjcmVjeSBhbmQgYXJlIG5vdCBwZXJtaXR0
ZWQgdG8gZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRoaXMgY29tbXVuaWNhdGlvbiB0byBvdGhl
cnMuPC9pPjxicj4KPGJyPgo8aSBzdHlsZT0iY29sb3I6Izc3Nzc3Nztmb250LWZhbWlseTrlrovk
vZM7Zm9udC1zaXplOngtc21hbGw7Ij7kv6Hmga/lronlhajlo7DmmI7vvJrmnKzpgq7ku7bljIXl
kKvkv6Hmga/lvZLlj5Hku7bkurrmiYDlnKjnu4Tnu4fmiYDmnIks5Y+R5Lu25Lq65omA5Zyo57uE
57uH5a+56K+l6YKu5Lu25oul5pyJ5omA5pyJ5p2D5Yip44CC6K+35o6l5pS26ICF5rOo5oSP5L+d
5a+GLOacque7j+WPkeS7tuS6uuS5pumdouiuuOWPryzkuI3lvpflkJHku7vkvZXnrKzkuInmlrnn
u4Tnu4flkozkuKrkurrpgI/pnLLmnKzpgq7ku7bmiYDlkKvkv6Hmga/jgII8YnI+CkluZm9ybWF0
aW9uIFNlY3VyaXR5IE5vdGljZTogVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1h
aWwgaXMgc29sZWx5IHByb3BlcnR5IG9mIHRoZSBzZW5kZXIncyBvcmdhbml6YXRpb24uVGhpcyBt
YWlsIGNvbW11bmljYXRpb24gaXMgY29uZmlkZW50aWFsLlJlY2lwaWVudHMgbmFtZWQgYWJvdmUg
YXJlIG9ibGlnYXRlZCB0byBtYWludGFpbiBzZWNyZWN5IGFuZCBhcmUgbm90IHBlcm1pdHRlZCB0
byBkaXNjbG9zZSB0aGUgY29udGVudHMgb2YgdGhpcyBjb21tdW5pY2F0aW9uIHRvIG90aGVycy48
L2k+PGJyPgo8YnI+CjxpIHN0eWxlPSJjb2xvcjojNzc3Nzc3O2ZvbnQtZmFtaWx5OuWui+S9kztm
b250LXNpemU6eC1zbWFsbDsiPuS/oeaBr+WuieWFqOWjsOaYju+8muacrOmCruS7tuWMheWQq+S/
oeaBr+W9kuWPkeS7tuS6uuaJgOWcqOe7hOe7h+aJgOaciSzlj5Hku7bkurrmiYDlnKjnu4Tnu4fl
r7nor6Xpgq7ku7bmi6XmnInmiYDmnInmnYPliKnjgILor7fmjqXmlLbogIXms6jmhI/kv53lr4Ys
5pyq57uP5Y+R5Lu25Lq65Lmm6Z2i6K645Y+vLOS4jeW+l+WQkeS7u+S9leesrOS4ieaWuee7hOe7
h+WSjOS4quS6uumAj+mcsuacrOmCruS7tuaJgOWQq+S/oeaBr+OAgjxicj4KSW5mb3JtYXRpb24g
U2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWFpbCBp
cyBzb2xlbHkgcHJvcGVydHkgb2YgdGhlIHNlbmRlcidzIG9yZ2FuaXphdGlvbi5UaGlzIG1haWwg
Y29tbXVuaWNhdGlvbiBpcyBjb25maWRlbnRpYWwuUmVjaXBpZW50cyBuYW1lZCBhYm92ZSBhcmUg
b2JsaWdhdGVkIHRvIG1haW50YWluIHNlY3JlY3kgYW5kIGFyZSBub3QgcGVybWl0dGVkIHRvIGRp
c2Nsb3NlIHRoZSBjb250ZW50cyBvZiB0aGlzIGNvbW11bmljYXRpb24gdG8gb3RoZXJzLjwvaT48
YnI+Cjxicj4KPGkgc3R5bGU9ImNvbG9yOiM3Nzc3Nzc7Zm9udC1mYW1pbHk65a6L5L2TO2ZvbnQt
c2l6ZTp4LXNtYWxsOyI+5L+h5oGv5a6J5YWo5aOw5piO77ya5pys6YKu5Lu25YyF5ZCr5L+h5oGv
5b2S5Y+R5Lu25Lq65omA5Zyo57uE57uH5omA5pyJLOWPkeS7tuS6uuaJgOWcqOe7hOe7h+Wvueiv
pemCruS7tuaLpeacieaJgOacieadg+WIqeOAguivt+aOpeaUtuiAheazqOaEj+S/neWvhizmnKrn
u4/lj5Hku7bkurrkuabpnaLorrjlj68s5LiN5b6X5ZCR5Lu75L2V56ys5LiJ5pa557uE57uH5ZKM
5Liq5Lq66YCP6Zyy5pys6YKu5Lu25omA5ZCr5L+h5oGv44CCPGJyPgpJbmZvcm1hdGlvbiBTZWN1
cml0eSBOb3RpY2U6IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtYWlsIGlzIHNv
bGVseSBwcm9wZXJ0eSBvZiB0aGUgc2VuZGVyJ3Mgb3JnYW5pemF0aW9uLlRoaXMgbWFpbCBjb21t
dW5pY2F0aW9uIGlzIGNvbmZpZGVudGlhbC5SZWNpcGllbnRzIG5hbWVkIGFib3ZlIGFyZSBvYmxp
Z2F0ZWQgdG8gbWFpbnRhaW4gc2VjcmVjeSBhbmQgYXJlIG5vdCBwZXJtaXR0ZWQgdG8gZGlzY2xv
c2UgdGhlIGNvbnRlbnRzIG9mIHRoaXMgY29tbXVuaWNhdGlvbiB0byBvdGhlcnMuPC9pPjxicj48
YnI+PGkgc3R5bGU9ImNvbG9yOiByZ2IoMTE5LCAxMTksIDExOSk7IGZvbnQtZmFtaWx5OiDlrovk
vZM7IGZvbnQtc2l6ZTogeC1zbWFsbDsiPuS/oeaBr+WuieWFqOWjsOaYju+8muacrOmCruS7tuWM
heWQq+S/oeaBr+W9kuWPkeS7tuS6uuaJgOWcqOe7hOe7h+aJgOaciSzlj5Hku7bkurrmiYDlnKjn
u4Tnu4flr7nor6Xpgq7ku7bmi6XmnInmiYDmnInmnYPliKnjgILor7fmjqXmlLbogIXms6jmhI/k
v53lr4Ys5pyq57uP5Y+R5Lu25Lq65Lmm6Z2i6K645Y+vLOS4jeW+l+WQkeS7u+S9leesrOS4ieaW
uee7hOe7h+WSjOS4quS6uumAj+mcsuacrOmCruS7tuaJgOWQq+S/oeaBr+OAgjxicj5JbmZvcm1h
dGlvbiBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBt
YWlsIGlzIHNvbGVseSBwcm9wZXJ0eSBvZiB0aGUgc2VuZGVyJ3Mgb3JnYW5pemF0aW9uLlRoaXMg
bWFpbCBjb21tdW5pY2F0aW9uIGlzIGNvbmZpZGVudGlhbC5SZWNpcGllbnRzIG5hbWVkIGFib3Zl
IGFyZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2VjcmVjeSBhbmQgYXJlIG5vdCBwZXJtaXR0ZWQg
dG8gZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRoaXMgY29tbXVuaWNhdGlvbiB0byBvdGhlcnMu
PC9pPg==
------=_Part_1431_668563079.1682411300354--

