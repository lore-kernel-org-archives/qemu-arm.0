Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2748696ejb;
        Mon, 5 Jun 2023 05:14:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Rfu5R/dqb5J+PgmR3A6iA9Y7N4Eb5bps2HSwf9jOR48PAM3yCtYEVzTkM80Vbz+fwbX8k
X-Received: by 2002:a05:622a:15cb:b0:3f8:365:7a99 with SMTP id d11-20020a05622a15cb00b003f803657a99mr7455246qty.55.1685967276865;
        Mon, 05 Jun 2023 05:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685967276; cv=none;
        d=google.com; s=arc-20160816;
        b=v/3bsGUahDvxo/OsrzrWmQ1n4Y29vcH29rTdo0QjgYey7NquIjpbvwT534LWW8hFty
         OJzJIgBOtDAAdnOFh210JnIiaB3C0HV79LK+R2COoM7R31lz3s+Byq30T44QfZ9tMg5R
         ECT9/nSSgvYpmlZwLhypNk9t5+P09UWZSN0E/1RX0C8UaW9BE0YTql7HOZWjknDGJso1
         skmXZkWFt5ouqjZ42nS/BD3v6aJ9k141/hXBMWGWm+v7GKxsHQisUehYJh84YKkOa8Vd
         5XP2k6nJS4r+e8HlzGtm5xsq3GLybnCb5ou4wt0gT14SWENZHIrlxhQyYpkeGYe+0XKH
         ghoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version
         :content-transfer-encoding:references:in-reply-to:subject:cc:to:from
         :date;
        bh=y7OaVCDxQJmtZp90YTwhvCXi2v3fuavztXYdzzhvnus=;
        b=KUUt8DuNO4dhClhTZIGRKwf6p42CjCNNJkd5S0eSoScVSTaWjk+y0DcmOK/HOGYRWF
         MlRAXAXvvkKov3HpEbDgK/dlLzQpZKQST3tP8uiSZDKr7JFb8jgNPQ5j1t7Aq2HUcWds
         I0EvlJnoh+9q8sv+d8PnzBqEvVnxmvy1bBdCv5CLGe99CCtFWuIgsM//O4hI8qp9m5Av
         EEmxAcCdb5Ss200F4XjFfy1eBtOUSGelO9nwWjQA/Sp2WOlVdZ5v9mCQU6rgR4/xQ7SM
         bHBiVetR7RBHlMDXb+vPqb0q3BXnmai8Ds7ZHHY56G9LT5SJtR8iHSnWk7iNRAWVCmLJ
         D/CA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020a05622a05c900b003f6c146a1absi4675642qtb.97.2023.06.05.05.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 05:14:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q696L-0007Ew-21; Mon, 05 Jun 2023 08:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q696A-0007BI-Kw; Mon, 05 Jun 2023 08:14:11 -0400
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q6966-00081s-Vk; Mon, 05 Jun 2023 08:14:10 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwAH75ki0X1k2VJPAg--.4006S2;
 Mon, 05 Jun 2023 20:12:18 +0800 (CST)
Received: from wangyuquan1236$phytium.com.cn ( [218.76.62.144] ) by
 ajax-webmail-mail (Coremail) ; Mon, 5 Jun 2023 20:13:46 +0800 (GMT+08:00)
X-Originating-IP: [218.76.62.144]
Date: Mon, 5 Jun 2023 20:13:46 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Yuquan Wang" <wangyuquan1236@phytium.com.cn>
To: "Marcin Juszkiewicz" <marcin.juszkiewicz@linaro.org>
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.1-cmXT6 build
 20230428(d6537451) Copyright (c) 2002-2023 www.mailtech.cn
 mispb-76b96e3b-3ecc-44d5-9200-de81e6d4c242-
In-Reply-To: <101d301d-d413-288e-9318-d0a226ea8715@linaro.org>
References: <20230605095536.117384-1-wangyuquan1236@phytium.com.cn>
 <20230605095536.117384-2-wangyuquan1236@phytium.com.cn>
 <101d301d-d413-288e-9318-d0a226ea8715@linaro.org>
Content-Transfer-Encoding: base64
X-CM-CTRLDATA: qtBckWZvb3Rlcl90eHQ9NzMxOjM4Mw==
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <40c4980d.387.1888b7a478a.Coremail.wangyuquan1236@phytium.com.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwBXhCR70X1kC6MAAA--.596W
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQABAWR84icFX
	QAAsE
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoW7GrW3CrW5Gw4xAryDZF13Arb_yoW3Wrg_Zr
 ykCrn8Cw4qk3y09Fn3K3W3JrySkwsY9r4Igas5JFyxZa4av3Z8ZF4kK34Svr13Jr4vqFnx
 ArnIvrySk34a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=129.150.39.64;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=sgoci-sdnproxy-4.icoremail.net
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
X-TUID: pozp0A50mrme

SGksIE1hcmNpbgoKT24gTW9uLCA1IEp1biAyMDIzIDExOjU5OjE2ICswMjAwLCBNYXJjaW4gSnVz
emtpZXdpY3ogd3JvdGU6Cgo+IAo+IFcgZG5pdSA1LjA2LjIwMjMgb8KgMTE6NTUsIFl1cXVhbiBX
YW5nIHBpc3plOgo+ID4gVGhlIGN1cnJlbnQgc2JzYS1yZWYgY2Fubm90IHVzZSBFSENJIGNvbnRy
b2xsZXIgd2hpY2ggaXMgb25seQo+ID4gYWJsZSB0byBkbyAzMi1iaXQgRE1BLCBzaW5jZSBzYnNh
LXJlZiBkb2Vzbid0IGhhdmUgUkFNIGJlbG93IDRHQi4KPiA+IEhlbmNlLCB0aGlzIHVzZXMgWEhD
SSB0byBwcm92aWRlIGEgdXNiIGNvbnRyb2xsZXIgd2l0aCA2NC1iaXQKPiA+IERNQSBjYXBhYmxp
dHkgaW5zdGVhZCBvZiBFSENJLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdXF1YW4gV2FuZzx3
YW5neXVxdWFuMTIzNkBwaHl0aXVtLmNvbS5jbj4KPiAKPiBDYW4geW91IHNoYXJlIGZpcm13YXJl
IHNpZGUgc28gaXQgY2FuIGJlIHRlc3RlZD8KPiAKPiBUaGUgbW9yZSBJIGRlYWwgd2l0aCBFREsy
IHRoZSBtb3JlIEkgdW5kZXJzdGFuZCB3aHkgcGVvcGxlIGdvIFUtQm9vdC4KCkkgZmlndXJlZCBv
dXQgdGhlIHN0dWNrIHByb2JsZW0gb2YgdGhlIHJlbGV2YW50IGZpcm13YXJlIHBhdGNoIGluIGVk
azIgCm1haWwgbGlzdC4gCgpCZWxvdyBpcyB0aGUgcGF0Y2hzZXQgbGluazoKaHR0cHM6Ly9lZGsy
Lmdyb3Vwcy5pby9nL2RldmVsL21lc3NhZ2UvMTA1NzEzCgpUaGFua3MKWXVxdWFuDQoNCuS/oeaB
r+WuieWFqOWjsOaYju+8muacrOmCruS7tuWMheWQq+S/oeaBr+W9kuWPkeS7tuS6uuaJgOWcqOe7
hOe7h+aJgOaciSzlj5Hku7bkurrmiYDlnKjnu4Tnu4flr7nor6Xpgq7ku7bmi6XmnInmiYDmnInm
nYPliKnjgILor7fmjqXmlLbogIXms6jmhI/kv53lr4Ys5pyq57uP5Y+R5Lu25Lq65Lmm6Z2i6K64
5Y+vLOS4jeW+l+WQkeS7u+S9leesrOS4ieaWuee7hOe7h+WSjOS4quS6uumAj+mcsuacrOmCruS7
tuaJgOWQq+S/oeaBr+OAgg0KSW5mb3JtYXRpb24gU2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3Jt
YXRpb24gY29udGFpbmVkIGluIHRoaXMgbWFpbCBpcyBzb2xlbHkgcHJvcGVydHkgb2YgdGhlIHNl
bmRlcidzIG9yZ2FuaXphdGlvbi5UaGlzIG1haWwgY29tbXVuaWNhdGlvbiBpcyBjb25maWRlbnRp
YWwuUmVjaXBpZW50cyBuYW1lZCBhYm92ZSBhcmUgb2JsaWdhdGVkIHRvIG1haW50YWluIHNlY3Jl
Y3kgYW5kIGFyZSBub3QgcGVybWl0dGVkIHRvIGRpc2Nsb3NlIHRoZSBjb250ZW50cyBvZiB0aGlz
IGNvbW11bmljYXRpb24gdG8gb3RoZXJzLg==

