Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp120435ejq;
        Thu, 4 May 2023 00:22:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4miRZRm9CW+ShC1MFxWV/jiUDcKtP4CMkq7JXVcIVNDK9jWU11dH7o38tx+qOJ0Pdg5C+e
X-Received: by 2002:a05:6214:2021:b0:612:a76c:96a2 with SMTP id 1-20020a056214202100b00612a76c96a2mr8120888qvf.1.1683184958622;
        Thu, 04 May 2023 00:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683184958; cv=none;
        d=google.com; s=arc-20160816;
        b=kvTo4uK1mh5S3J4fHDpVhJQAmiGEqUv/ZJzCkoffz/SXCCXws/+K4KBZ9R3tXEUree
         gwoN2cKI6terENWi0kSKnaAj8AMlWI9hy+tkNAjVKReKHnaRo0vh3009lZuIC8a68hRK
         5/gIrFLs6TzdN15nLrScre3buP0z+yDemGRtG8GDVOZIYM20VjMKrr1Ct3utVRmYYQhK
         nEZp17C4jfWUH87WFaoJWemPEYNegBfEPGl4yB3W0k9zP5CQbOSfghXQoxXyqq5H231o
         OL8pnMrKdYQRqkTclweT0+ZeSlGy1Si3E6QZ8nu1+P0p3ksm/An1aa1b77xoT9XuZBXO
         7E+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version
         :content-transfer-encoding:references:in-reply-to:subject:to:from
         :date;
        bh=ClIbYdTPxD607drxKGssKlqMBOBfRONu7CuSqJQhtKM=;
        b=iAfs7BH5BIEb+1kAQhQe964G+P/sN4SDyqK29y17FaKgIX18H/CCtWoYDayWuItZHd
         3fw5GF2w/YAfqTVh6VRPIyuE07OTpUHXm1tC8ZiStSqZRP9SEUEa1br37KFzxyFBxbQJ
         hnKAO1igHNytYS0+kfyVULAQBGX33OdMkrujR0MeGtHrfhPDYK/4azV4uyeB9QnAiCEh
         rskapA8Lalv7JxAHSbHyC1jJYITb+9JlZFYm3SYJARQICjZ54mf4NiKF8obU80oMArJ8
         IubJAou/F9sn6Kj9o3KOobyGe0+Qbxl/Vv3BmhEwy+jFN8bEOY81AnO25+DBnpuwFiRr
         dGEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp5-20020ad45f85000000b005e0ccddbb49si19384396qvb.411.2023.05.04.00.22.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 May 2023 00:22:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puTIE-0007pw-TB; Thu, 04 May 2023 03:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1puTID-0007pT-0x
 for qemu-arm@nongnu.org; Thu, 04 May 2023 03:22:21 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>) id 1puTIA-0002TG-Jm
 for qemu-arm@nongnu.org; Thu, 04 May 2023 03:22:20 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwAX7G30XVNkFDhCBg--.27901S2;
 Thu, 04 May 2023 15:25:40 +0800 (CST)
Received: from wangyuquan1236$phytium.com.cn ( [218.76.62.144] ) by
 ajax-webmail-mail (Coremail) ; Thu, 4 May 2023 15:22:09 +0800 (GMT+08:00)
X-Originating-IP: [218.76.62.144]
Date: Thu, 4 May 2023 15:22:09 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Yuquan Wang" <wangyuquan1236@phytium.com.cn>
To: qemu-arm@nongnu.org
Subject: Re: Problem of initialization of platform-ehci-usb in sbsa-ref
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220506(458b1948)
 Copyright (c) 2002-2023 www.mailtech.cn
 mispb-76b96e3b-3ecc-44d5-9200-de81e6d4c242-
In-Reply-To: <CAFEAcA9pa+uHGk34uCGX1ZHiCBDeDHXFLDFyVDAVvDxQScEChg@mail.gmail.com>
References: <11bf324.342.187b3418349.Coremail.wangyuquan1236@phytium.com.cn>
 <CAFEAcA9pa+uHGk34uCGX1ZHiCBDeDHXFLDFyVDAVvDxQScEChg@mail.gmail.com>
Content-Transfer-Encoding: base64
X-CM-CTRLDATA: sRHaD2Zvb3Rlcl90eHQ9MTQwNzozODM=
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2e434f44.1bb.187e5a3c9ee.Coremail.wangyuquan1236@phytium.com.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwA3F4AhXVNkt08AAA--.275W
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQADAWRK0XEMJ
	QACsm
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7KF4fCFW8Xrykuw15GFW7urg_yoW8Xr1rpa
 yUJan5Aa18Kr17Xr47Zws2qF1avFZ3KayxJrn7J34IkwsxKr9xtrW7K3s8Aa98Jr18WFyj
 v34jqF15u3sxZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=209.97.181.73;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RL2ha1byj8g+

PiBPbiAyMDIzLTA0LTI1IDE2OjM0OjA0LCBQZXRlciBNYXlkZWxsIHJlcGxpZWQ6Cj4gCj4gT24g
TW9uLCAyNCBBcHIgMjAyMyBhdCAxMzozMywg546L5a6H5rOJIDx3YW5neXVxdWFuMTIzNkBwaHl0
aXVtLmNvbS5jbj4gd3JvdGU6Cj4gPiBBcyBhIGp1bmlvciBPUyBlbmdpbmVlciwgSSBtZXQgYSBw
cm9ibGVtIG9mIGluaXRpYWxpemF0aW9uIG9mIHBsYXRmb3JtLWVoY2ktdXNiIGluIHNic2EtcmVm
IHJlY2VudGx5Lgo+ID4KPiA+IFRoZSByZXN1bHQgb2Ygc2JzYS1hY3MoVUVGSSBTaGVsbCBhcHBs
aWNhdGlvbikgb24gc2JzYS1yZWYgc2hvd3MgdGhhdCAiUGVyaXBoZXJhbDogTnVtIG9mIFVTQiBj
b250cm9sbGVyczogMCIuCj4gPgo+ID4gQW5kIEkgZm91bmQgdGhhdCB0aGUgcGxhdGZvcm0tZWhj
aS11c2IgaW4gcWVtdSBpcyBhIDMyLWJpdHMgRE1BIGRldmljZSB3aGlsZSBvdXIgc2JzYS1yZWYg
bWFjaGluZSBkb2VzIG5vdCBvd24KPiA+Cj4gPiBEUkFNIG1lbW9yeSBiZWxvdyA0Ry4gSXQgc2Vl
bXMgbGlrZSBhIGNvbnRyYWRpY3Rpb24gcG9pbnQuCj4gCj4gVGhpcyBkZWZpbml0ZWx5IGRvZXNu
J3Qgc2VlbSBsaWtlIGFuIGludGVudGlvbmFsIHRoaW5nLgo+IFdoYXQgc3BlY2lmaWNhbGx5IGRv
IHlvdSBtZWFuIGJ5ICIzMi1iaXRzIERNQSBkZXZpY2UiID8KPiBJcyBvdXIgaW1wbGVtZW50YXRp
b24gb2YgdGhpcyBkZXZpY2UgYWNjaWRlbnRhbGx5IG5vdAo+IGhhbmRsaW5nIGFkZHJlc3NlcyBh
Ym92ZSA0R0I/IE9yIGlzIHRoZSBzcGVjaWZpY2F0aW9uIG9mCj4gdGhlIGRldmljZSBpdHNlbGYg
bGltaXRlZCB0byA0R0IgYWRkcmVzc2VzPyBPciBpcyB0aGlzIGEKPiBndWVzdCBkcml2ZXIgcHJv
YmxlbT8KPiAKPiB0aGFua3MKPiAtLSBQTU0KCkhpLCAKCk1heWJlIHRoZSBzcGVjaWZpYyBleHBs
YW5hdGlvbiBpcyB0aGF0IHFlbXUgaW1wbGVtZW50cyB0aGF0OgpJbiBody91c2IvaGNkLWVoY2ku
YzoKdm9pZCB1c2JfZWhjaV9pbml0KEVIQ0lTdGF0ZSAqcywgRGV2aWNlU3RhdGUgKmRldikKewou
Li4KInMtPmNhcHNbMHgwOF0gPSAweDgwOyIKCkFjY29yZGluZyB0byBFSENJIHNwZWMgdmVyc2lv
biAxLjAgU2VjdGlvbiAyLjIuNCwKdGhlIHNldCBvZiAiMHg4MCIgb24gSG9zdCBDb250cm9sbGVy
IENhcGFiaWxpdHkgUGFyYW1ldGVycyAKUmVnaXN0ZXIgbWVhbnMgdGhpcyhxZW11KSBFSENJIEhv
c3QgQ29udHJvbGxlciBkb2VzIG5vdCBoYXZlIAo2NC1iaXQgQWRkcmVzc2luZyBDYXBhYmlsaXR5
LiBTbywgSSB0aGluayBhYm92ZSBpbmZvcm1hdGlvbiAKY2FuIHByb3ZlIHRoYXQgb3VyIGltcGxl
bWVudGF0aW9uIG9mIHRoaXMgZGV2aWNlIGNhbiBub3QgCmhhbmRsZSBhZGRyZXNzZXMgYWJvdmUg
NEdCIHdpdGhvdXQgdGhlIGhlbHAgb2YgU01NVS4KClRoYW5rcwpZdXF1YW4KDQoNCuS/oeaBr+Wu
ieWFqOWjsOaYju+8muacrOmCruS7tuWMheWQq+S/oeaBr+W9kuWPkeS7tuS6uuaJgOWcqOe7hOe7
h+aJgOaciSzlj5Hku7bkurrmiYDlnKjnu4Tnu4flr7nor6Xpgq7ku7bmi6XmnInmiYDmnInmnYPl
iKnjgILor7fmjqXmlLbogIXms6jmhI/kv53lr4Ys5pyq57uP5Y+R5Lu25Lq65Lmm6Z2i6K645Y+v
LOS4jeW+l+WQkeS7u+S9leesrOS4ieaWuee7hOe7h+WSjOS4quS6uumAj+mcsuacrOmCruS7tuaJ
gOWQq+S/oeaBr+OAgg0KSW5mb3JtYXRpb24gU2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgbWFpbCBpcyBzb2xlbHkgcHJvcGVydHkgb2YgdGhlIHNlbmRl
cidzIG9yZ2FuaXphdGlvbi5UaGlzIG1haWwgY29tbXVuaWNhdGlvbiBpcyBjb25maWRlbnRpYWwu
UmVjaXBpZW50cyBuYW1lZCBhYm92ZSBhcmUgb2JsaWdhdGVkIHRvIG1haW50YWluIHNlY3JlY3kg
YW5kIGFyZSBub3QgcGVybWl0dGVkIHRvIGRpc2Nsb3NlIHRoZSBjb250ZW50cyBvZiB0aGlzIGNv
bW11bmljYXRpb24gdG8gb3RoZXJzLg==

