Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2791930ejm;
        Mon, 24 Apr 2023 06:00:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350YmygLppShxtyw2zfNpcQTvTm3gG+RKk9ODrtQCm3+0RxsM96KRlGbT8TyGwQKHj+jj6Fwb
X-Received: by 2002:a05:622a:114:b0:3e6:71d6:5d5f with SMTP id u20-20020a05622a011400b003e671d65d5fmr21622881qtw.1.1682341247401;
        Mon, 24 Apr 2023 06:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682341247; cv=none;
        d=google.com; s=arc-20160816;
        b=ihGOhlSJaQiNMPr4r1tC7VUfrc8Q6aqJPWWVp3YFoZZ1COs1ZR62mQF8cUP0Okysmp
         1gzXk024SsC7mv7M16oWBkLtVnf7dw8ZyyJhOL4fJZAL4oRDnUp7YAWT1RFJkKDwXUl8
         SbzMHHN1OnbJUncdIrh7DYCNuFJXrenwP+Mf5KReMQWN/lzKDUL0RCnr30imK9nHq/bE
         ZL4WviCEaORDfIkaGjYEuR+oiFKM0KPuANIYTNJi3k37kHILkba1kbRLroxl4dr6Sz8K
         b4fLNrwWApGUnF7Avwr6FaBjTfsPSmUdg+7fDauDPuYpQRaea0IzGG6x44nRZg9kVs9l
         mzZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version:subject
         :cc:to:from:date;
        bh=pgdR++w1Es11tmGW7ijdHW5e+t+QmaqYt5h8FfjOqxE=;
        b=Nc6h7lSi0Pta3QGgJGjOPulQFdD2PD3CXJfTkCzArxlxj41UjrRpM+oUuTSxhr/F/4
         eZILE1kt3bjv0NgR9b8gh/oMmYWvjU1klZGAN2rEpdhlQisg1m5iaISQESQNtEyHmAzn
         Octs7rwM0WeieIssATsW/1bSvoAEof9gFXNKan7l+b3hicZJ+dYS3jRPZ6RsTw4R9EU/
         OSf83ZRXN5Dlt+aHyW7Gc2+nfho+zZQudQ4bkna15fEl5IkQdaHqwhcMXM0bLsqAijjl
         ABtHBrNIHD0T1DJHPzyzt0v6rJ2yhamNI1hpO0Xl/QMXt6ECTTywMzz19lTgtzGGe5Cw
         K7Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t29-20020a05622a181d00b003e4e314252dsi7324057qtc.509.2023.04.24.06.00.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 06:00:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqvnv-0001wR-5q; Mon, 24 Apr 2023 09:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1pqvON-0005GJ-Bd
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 08:34:03 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>) id 1pqvOK-00058x-HB
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 08:34:03 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwBHEZbjdkZkpd+KHg--.12204S2;
 Mon, 24 Apr 2023 20:32:35 +0800 (CST)
Received: from wangyuquan1236$phytium.com.cn ( [218.76.62.144] ) by
 ajax-webmail-mail (Coremail) ; Mon, 24 Apr 2023 20:33:47 +0800 (GMT+08:00)
X-Originating-IP: [218.76.62.144]
Date: Mon, 24 Apr 2023 20:33:47 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?546L5a6H5rOJ?= <wangyuquan1236@phytium.com.cn>
To: qemu-arm@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com
Subject: Problem of initialization of platform-ehci-usb in sbsa-ref
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220506(458b1948)
 Copyright (c) 2002-2023 www.mailtech.cn
 mispb-76b96e3b-3ecc-44d5-9200-de81e6d4c242-
X-CM-CTRLDATA: OGUN72Zvb3Rlcl9odG09MTY2MTo0Njg=
Content-Type: multipart/alternative; 
 boundary="----=_Part_2950_2017530182.1682339627849"
MIME-Version: 1.0
Message-ID: <11bf324.342.187b3418349.Coremail.wangyuquan1236@phytium.com.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwCn_7Mrd0ZkELQAAA--.465W
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQATAWRFiwkHK
	AAGsZ
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoW7Wr45AFWfuF1rZrW3Kw17Wrg_yoWktFb_uF
 1qvFW2kF18JF4jvF10yrs3ZrZIqa95WF12qr48Jr4xKas3JFnav3Wq9ryavF18Arn2vwnI
 yF95urySga4a9jkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
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
X-TUID: IuKIRKMeVcsE

------=_Part_2950_2017530182.1682339627849
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgUGV0ZXIsCgoKCgpBcyBhIGp1bmlvciBPUyBlbmdpbmVlciwgSSBtZXQgYSBwcm9ibGVtIG9m
IGluaXRpYWxpemF0aW9uIG9mIHBsYXRmb3JtLWVoY2ktdXNiIGluIHNic2EtcmVmIHJlY2VudGx5
LiAKClRoZSByZXN1bHQgb2Ygc2JzYS1hY3MoVUVGSSBTaGVsbCBhcHBsaWNhdGlvbikgb24gc2Jz
YS1yZWYgc2hvd3MgdGhhdCAiUGVyaXBoZXJhbDogTnVtIG9mIFVTQiBjb250cm9sbGVyczogMCIu
IAoKQW5kIEkgZm91bmQgdGhhdCB0aGUgcGxhdGZvcm0tZWhjaS11c2IgaW4gcWVtdSBpcyBhIDMy
LWJpdHMgRE1BIGRldmljZSB3aGlsZSBvdXIgc2JzYS1yZWYgbWFjaGluZSBkb2VzIG5vdCBvd24g
CgpEUkFNIG1lbW9yeSBiZWxvdyA0Ry4gSXQgc2VlbXMgbGlrZSBhIGNvbnRyYWRpY3Rpb24gcG9p
bnQuQ29ubmVjdGluZyBTTU1VdjMgd2l0aCB0aGUgcGxhdGZvcm0gRUhDSSAKCmluIG9yZGVyIHRv
IHByb2JlIGl0IGNhbiBiZSBhIGdvb29kIHdheSA/IE9yIHRoZXJlIGFyZSBzb21lIGRldGFpbCB1
c2FnZSBJIGlnbm9yZWQ/4oCLCgoKCgpUaGFua3MKCll1cXVhbiBXYW5nCgoKCgoKCgoKCgoKCuS/
oeaBr+WuieWFqOWjsOaYju+8muacrOmCruS7tuWMheWQq+S/oeaBr+W9kuWPkeS7tuS6uuaJgOWc
qOe7hOe7h+aJgOaciSzlj5Hku7bkurrmiYDlnKjnu4Tnu4flr7nor6Xpgq7ku7bmi6XmnInmiYDm
nInmnYPliKnjgILor7fmjqXmlLbogIXms6jmhI/kv53lr4Ys5pyq57uP5Y+R5Lu25Lq65Lmm6Z2i
6K645Y+vLOS4jeW+l+WQkeS7u+S9leesrOS4ieaWuee7hOe7h+WSjOS4quS6uumAj+mcsuacrOmC
ruS7tuaJgOWQq+S/oeaBr+OAggpJbmZvcm1hdGlvbiBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZv
cm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtYWlsIGlzIHNvbGVseSBwcm9wZXJ0eSBvZiB0aGUg
c2VuZGVyJ3Mgb3JnYW5pemF0aW9uLlRoaXMgbWFpbCBjb21tdW5pY2F0aW9uIGlzIGNvbmZpZGVu
dGlhbC5SZWNpcGllbnRzIG5hbWVkIGFib3ZlIGFyZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2Vj
cmVjeSBhbmQgYXJlIG5vdCBwZXJtaXR0ZWQgdG8gZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRo
aXMgY29tbXVuaWNhdGlvbiB0byBvdGhlcnMu
------=_Part_2950_2017530182.1682339627849
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHAgc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJSGkgUGV0ZXIsCjwvcD4KPHAgc3R5bGU9
ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJPGJyPgo8L3A+CjxwIHN0eWxlPSJmb250LWZhbWlseTpT
aW1TdW47Ij4KCUFzIGEganVuaW9yIE9TIGVuZ2luZWVyLCBJIG1ldCBhIHByb2JsZW0gb2YgaW5p
dGlhbGl6YXRpb24gb2YgcGxhdGZvcm0tZWhjaS11c2IgaW4gc2JzYS1yZWYgcmVjZW50bHkuJm5i
c3A7CjwvcD4KPHAgc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPgoJVGhlIHJlc3VsdCBvZiBz
YnNhLWFjcyhVRUZJIFNoZWxsIGFwcGxpY2F0aW9uKSBvbiBzYnNhLXJlZiBzaG93cyB0aGF0ICJQ
ZXJpcGhlcmFsOiBOdW0gb2YgVVNCIGNvbnRyb2xsZXJzOiAwIi4mbmJzcDsKPC9wPgo8cCBzdHls
ZT0iZm9udC1mYW1pbHk6U2ltU3VuOyI+CglBbmQgSSBmb3VuZCB0aGF0IHRoZSZuYnNwOzxzcGFu
IHN0eWxlPSJmb250LWZhbWlseTpTaW1TdW47d2hpdGUtc3BhY2U6bm9ybWFsOyI+cGxhdGZvcm0t
ZWhjaS11c2IgaW4gcWVtdSBpcyBhIDMyLWJpdHMgRE1BIGRldmljZSB3aGlsZSBvdXIgc2JzYS1y
ZWYgbWFjaGluZSBkb2VzIG5vdCBvd24mbmJzcDs8L3NwYW4+IAo8L3A+CjxwIHN0eWxlPSJmb250
LWZhbWlseTpTaW1TdW47Ij4KCTxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpTaW1TdW47d2hpdGUt
c3BhY2U6bm9ybWFsOyI+RFJBTSBtZW1vcnkgYmVsb3cgNEcuIEl0IHNlZW1zIGxpa2UgYSBjb250
cmFkaWN0aW9uIHBvaW50Ljwvc3Bhbj5Db25uZWN0aW5nIFNNTVV2MyB3aXRoIHRoZSBwbGF0Zm9y
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
cnMuPC9pPjxicj48YnI+PGkgc3R5bGU9ImNvbG9yOiByZ2IoMTE5LCAxMTksIDExOSk7IGZvbnQt
ZmFtaWx5OiDlrovkvZM7IGZvbnQtc2l6ZTogeC1zbWFsbDsiPuS/oeaBr+WuieWFqOWjsOaYju+8
muacrOmCruS7tuWMheWQq+S/oeaBr+W9kuWPkeS7tuS6uuaJgOWcqOe7hOe7h+aJgOaciSzlj5Hk
u7bkurrmiYDlnKjnu4Tnu4flr7nor6Xpgq7ku7bmi6XmnInmiYDmnInmnYPliKnjgILor7fmjqXm
lLbogIXms6jmhI/kv53lr4Ys5pyq57uP5Y+R5Lu25Lq65Lmm6Z2i6K645Y+vLOS4jeW+l+WQkeS7
u+S9leesrOS4ieaWuee7hOe7h+WSjOS4quS6uumAj+mcsuacrOmCruS7tuaJgOWQq+S/oeaBr+OA
gjxicj5JbmZvcm1hdGlvbiBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZvcm1hdGlvbiBjb250YWlu
ZWQgaW4gdGhpcyBtYWlsIGlzIHNvbGVseSBwcm9wZXJ0eSBvZiB0aGUgc2VuZGVyJ3Mgb3JnYW5p
emF0aW9uLlRoaXMgbWFpbCBjb21tdW5pY2F0aW9uIGlzIGNvbmZpZGVudGlhbC5SZWNpcGllbnRz
IG5hbWVkIGFib3ZlIGFyZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2VjcmVjeSBhbmQgYXJlIG5v
dCBwZXJtaXR0ZWQgdG8gZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRoaXMgY29tbXVuaWNhdGlv
biB0byBvdGhlcnMuPC9pPg==
------=_Part_2950_2017530182.1682339627849--

