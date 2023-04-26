Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp203136ejm;
        Tue, 25 Apr 2023 23:12:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350bWQrE9I3us4u6DMeZpsTOq46U8uvxOPyNuDLFJswVa+RpKhoi3jLHo0okqSwz+eJZR8D5P
X-Received: by 2002:a05:6214:5292:b0:5ef:8159:b9a9 with SMTP id kj18-20020a056214529200b005ef8159b9a9mr34605540qvb.21.1682489542108;
        Tue, 25 Apr 2023 23:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682489542; cv=none;
        d=google.com; s=arc-20160816;
        b=cN+qvBw5eBqcCAUFQXK3/OD21rN41DzF+2w6atjcJSx1FCMx+3VeaYbNMT29YY932U
         YsCpAfvqjcPgM8/87frka6rMM/Evn+7FWFfd4MKgaYNt1HPxGIDA19Wua/obaFBOvhV1
         Uxyj73hdjSl4N3/+e27XHK7pkXsiyo8mr1VarsyC9jOlaV5jFvfIBsZmVDN8Fjn6APYF
         v9iSHpRJiC8jw+5eRXUhq8vR5pFKqDiyKZg69T6x4vUfcUtn7LCdQlQ/eHhN+lw/4Rmi
         4UrzsBsOYbOgytKaBWGbF1/+fvr2F+xYnGfghY9I/f0Ttbr7jV1TSzd7Me0+8JF+F+tY
         xAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version
         :content-transfer-encoding:references:in-reply-to:subject:cc:to:from
         :date;
        bh=ejYiZ3sj8Yi9n8wm9+a2JzCmCkvitG3CkYiclyHh7bg=;
        b=ewmDYEQf/Fn5L/3NIDe2aBh5sCML4uMOaa6t03zuCWSOFakVfeRe0kyQItxXit+P9X
         0li9TD3RsRu6aaJxsG9sewsUz8UY4iIDAH4bvnQtRJi9I1ni33LAg0TSo7rM716sn+rt
         A0sfMaMAp4DCJGgHdfRr6pfFDH7zZkk0lxUqzYc0QdI4XBkYwYcw87PqTAbZon0nrehx
         dFipNUrzrmSI3UJDTldx1fz3h880tL/q+NHV0AwHBhdTwitfFIqM5XmxpkaWedYI1aan
         eEY1U7vIet5JqHUBTqEm+Ev9DnfesJ0DsC76B2J0qIVQ6gc73cSkENfb/bKTvxBsRUbg
         6OsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020ad45aa2000000b005e8cdf1a7a2si4385111qvg.262.2023.04.25.23.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 23:12:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prYNw-0002QT-GZ; Wed, 26 Apr 2023 02:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1prYNu-0002P7-77
 for qemu-arm@nongnu.org; Wed, 26 Apr 2023 02:12:10 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>) id 1prYNo-0005du-Ba
 for qemu-arm@nongnu.org; Wed, 26 Apr 2023 02:12:09 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwDHeEpvwUhkILi+BQ--.17033S2;
 Wed, 26 Apr 2023 14:15:11 +0800 (CST)
Received: from wangyuquan1236$phytium.com.cn ( [218.76.62.144] ) by
 ajax-webmail-mail (Coremail) ; Wed, 26 Apr 2023 14:11:50 +0800 (GMT+08:00)
X-Originating-IP: [218.76.62.144]
Date: Wed, 26 Apr 2023 14:11:50 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Yuquan Wang" <wangyuquan1236@phytium.com.cn>
To: "Peter Maydell" <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, rad@semihalf.com, quic_llindhol@quicinc.com
Subject: Re: Re: Problem of initialization of platform-ehci-usb in sbsa-ref
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220506(458b1948)
 Copyright (c) 2002-2023 www.mailtech.cn
 mispb-76b96e3b-3ecc-44d5-9200-de81e6d4c242-
In-Reply-To: <CAFEAcA9pa+uHGk34uCGX1ZHiCBDeDHXFLDFyVDAVvDxQScEChg@mail.gmail.com>
References: <11bf324.342.187b3418349.Coremail.wangyuquan1236@phytium.com.cn>
 <CAFEAcA9pa+uHGk34uCGX1ZHiCBDeDHXFLDFyVDAVvDxQScEChg@mail.gmail.com>
Content-Transfer-Encoding: base64
X-CM-CTRLDATA: hLeXL2Zvb3Rlcl90eHQ9MTQwOTozODM=
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <70009a13.15f.187bc308951.Coremail.wangyuquan1236@phytium.com.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwAniKSmwEhkhm0AAA--.217W
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQABAWRILq0KL
	AABsJ
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
X-TUID: 0kWJARyhQWCC

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
NEdCIHdpdGhvdXQgdGhlIGhlbHAgb2YgU01NVS4KClRoYW5rcwpZdXF1YW4KCgoNCg0K5L+h5oGv
5a6J5YWo5aOw5piO77ya5pys6YKu5Lu25YyF5ZCr5L+h5oGv5b2S5Y+R5Lu25Lq65omA5Zyo57uE
57uH5omA5pyJLOWPkeS7tuS6uuaJgOWcqOe7hOe7h+WvueivpemCruS7tuaLpeacieaJgOaciead
g+WIqeOAguivt+aOpeaUtuiAheazqOaEj+S/neWvhizmnKrnu4/lj5Hku7bkurrkuabpnaLorrjl
j68s5LiN5b6X5ZCR5Lu75L2V56ys5LiJ5pa557uE57uH5ZKM5Liq5Lq66YCP6Zyy5pys6YKu5Lu2
5omA5ZCr5L+h5oGv44CCDQpJbmZvcm1hdGlvbiBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZvcm1h
dGlvbiBjb250YWluZWQgaW4gdGhpcyBtYWlsIGlzIHNvbGVseSBwcm9wZXJ0eSBvZiB0aGUgc2Vu
ZGVyJ3Mgb3JnYW5pemF0aW9uLlRoaXMgbWFpbCBjb21tdW5pY2F0aW9uIGlzIGNvbmZpZGVudGlh
bC5SZWNpcGllbnRzIG5hbWVkIGFib3ZlIGFyZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2VjcmVj
eSBhbmQgYXJlIG5vdCBwZXJtaXR0ZWQgdG8gZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRoaXMg
Y29tbXVuaWNhdGlvbiB0byBvdGhlcnMu

