Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2286967lfc;
        Fri, 5 Jun 2020 02:52:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRTRP7bqROGdayjKMqI5JkKjE+ZFpDEWAAsfswFZJ+FvQ4GgLpSbcAtY0ufq3MWTIk+r+m
X-Received: by 2002:a25:d90:: with SMTP id 138mr15148452ybn.19.1591350756676;
        Fri, 05 Jun 2020 02:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591350756; cv=none;
        d=google.com; s=arc-20160816;
        b=QXmJ9bFzA4vV4D2WIpAs8r58xrN0ISYINtSJNV9hkw8St8LEqZ/lbDJUrgn4+u0QP9
         dJxfMzPoF6NaDrjoHY2LHADITUm9JtIFRdxTtyihdbT/4nxu4ggdW+s1l3oAwQUMNgmE
         6qIEnC6iwQnifnJ7KceqqyuryLMekMRn2NNKxtaycNi6KRI58JkSpBNPm1xPPcRYL0B5
         pguPVGvlBAOPJsh/6KXRcVStjxSSHp42FnpMHIjJO6CBHljCdno5AZbqOKdTmUmERg4/
         8cdrnTMXzx2LYU7mFGBiCzah15+wOTqyFxq2DejMyiB+nlhgGh2JEuxyyCWwdaLIBnIp
         geKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TJbmD890MPdc4XuV7RvTabZD6/hV+2KvrQ5ip8Z0CDw=;
        b=xAN5Fwh0HWVkS8pGT1f2r3ClzuZb59mnNEoQn5VLN2343oQESGVN6paE+3ve13gO8Q
         XkqgR6cN08yQHDE/naHLYmCcnc8rYe+twvMYnYJgobdcXn/TUh7zcFzePP8Ec09FwirH
         q9/QSuVWWc2I/t+w752myNZ5qQCVTcl7spnRhJD+YbsfP6fi0znXs9H8DrWeQ9et4bsz
         RBH/2E5LsJaLAt0SjjIBpH3kwdekQBopSSDG/m7jQRdyj+Tq+viI6+khZPYCTFiuGemJ
         Rv0/hXX716mj/gPDL5XkKASnn2mahcUQ3YbUZ4XvIH/IeMcyT26Jo9le7rXgNGMcG23v
         rudQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aPSvDE85;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 64si6103584ybo.449.2020.06.05.02.52.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 02:52:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aPSvDE85;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh91g-0002In-2n
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 05:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8yc-0003yf-7g
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 05:49:26 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26029
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8ya-0006ub-9l
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 05:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591350563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TJbmD890MPdc4XuV7RvTabZD6/hV+2KvrQ5ip8Z0CDw=;
 b=aPSvDE85bOSJONurJEahk/3wB2zuWcJyB+BoDnV0AZLO4G+DPNpLEYqtt7EASrQxaDLwMl
 pMK81+MPwNZw+x+qay9Iaf5IRy6CiWI6h4aI2Rg3zxktTPKGIZoK6mvnYh31JGDzotMwY2
 iPwO9XxoVk4Dux+EXoQCrbWgi/YhOBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-AR3y7fC6MPu0JtKegFcJlw-1; Fri, 05 Jun 2020 05:49:21 -0400
X-MC-Unique: AR3y7fC6MPu0JtKegFcJlw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F471461;
 Fri,  5 Jun 2020 09:49:19 +0000 (UTC)
Received: from localhost (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 341375C660;
 Fri,  5 Jun 2020 09:49:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 08/11] memory: Extract memory_region_msync() from
 memory_region_writeback()
Date: Fri,  5 Jun 2020 10:47:47 +0100
Message-Id: <20200605094750.149957-9-stefanha@redhat.com>
In-Reply-To: <20200605094750.149957-1-stefanha@redhat.com>
References: <20200605094750.149957-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=205.139.110.61; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:35:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Julia Suvorova <jusual@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HXcHsbwmkImR

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKU3VnZ2Vz
dGVkLWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5
OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBSaWNo
YXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KQWNrZWQtYnk6IFBh
b2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjAwNTA4MDYy
NDU2LjIzMzQ0LTMtcGhpbG1kQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5v
Y3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvZXhlYy9tZW1vcnkuaCB8IDEz
ICsrKysrKysrKysrKy0KIG1lbW9yeS5jICAgICAgICAgICAgICB8IDEwICsrKysrKysrLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2V4ZWMvbWVtb3J5LmggYi9pbmNsdWRlL2V4ZWMvbWVtb3J5LmgKaW5kZXgg
MWI3Y2ZkZDViNi4uM2UwMGNkYmJmYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9leGVjL21lbW9yeS5o
CisrKyBiL2luY2x1ZGUvZXhlYy9tZW1vcnkuaApAQCAtMTQ3Myw4ICsxNDczLDE5IEBAIHZvaWQg
Km1lbW9yeV9yZWdpb25fZ2V0X3JhbV9wdHIoTWVtb3J5UmVnaW9uICptcik7CiAgKi8KIHZvaWQg
bWVtb3J5X3JlZ2lvbl9yYW1fcmVzaXplKE1lbW9yeVJlZ2lvbiAqbXIsIHJhbV9hZGRyX3QgbmV3
c2l6ZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVycm9yICoqZXJycCk7CisKIC8q
KgotICogbWVtb3J5X3JlZ2lvbl93cml0ZWJhY2s6IFRyaWdnZXIgY2FjaGUgd3JpdGViYWNrIG9y
IG1zeW5jIGZvcgorICogbWVtb3J5X3JlZ2lvbl9tc3luYzogU3luY2hyb25pemUgc2VsZWN0ZWQg
YWRkcmVzcyByYW5nZSBvZgorICogYSBtZW1vcnkgbWFwcGVkIHJlZ2lvbgorICoKKyAqIEBtcjog
dGhlIG1lbW9yeSByZWdpb24gdG8gYmUgbXN5bmMKKyAqIEBhZGRyOiB0aGUgaW5pdGlhbCBhZGRy
ZXNzIG9mIHRoZSByYW5nZSB0byBiZSBzeW5jCisgKiBAc2l6ZTogdGhlIHNpemUgb2YgdGhlIHJh
bmdlIHRvIGJlIHN5bmMKKyAqLwordm9pZCBtZW1vcnlfcmVnaW9uX21zeW5jKE1lbW9yeVJlZ2lv
biAqbXIsIGh3YWRkciBhZGRyLCBod2FkZHIgc2l6ZSk7CisKKy8qKgorICogbWVtb3J5X3JlZ2lv
bl93cml0ZWJhY2s6IFRyaWdnZXIgY2FjaGUgd3JpdGViYWNrIGZvcgogICogc2VsZWN0ZWQgYWRk
cmVzcyByYW5nZQogICoKICAqIEBtcjogdGhlIG1lbW9yeSByZWdpb24gdG8gYmUgdXBkYXRlZApk
aWZmIC0tZ2l0IGEvbWVtb3J5LmMgYi9tZW1vcnkuYwppbmRleCBiYjg0MzM0ZTFlLi45M2ZlYmU0
NzU5IDEwMDY0NAotLS0gYS9tZW1vcnkuYworKysgYi9tZW1vcnkuYwpAQCAtMjE5Nyw2ICsyMTk3
LDEyIEBAIHZvaWQgbWVtb3J5X3JlZ2lvbl9yYW1fcmVzaXplKE1lbW9yeVJlZ2lvbiAqbXIsIHJh
bV9hZGRyX3QgbmV3c2l6ZSwgRXJyb3IgKiplcnJwCiAgICAgcWVtdV9yYW1fcmVzaXplKG1yLT5y
YW1fYmxvY2ssIG5ld3NpemUsIGVycnApOwogfQogCit2b2lkIG1lbW9yeV9yZWdpb25fbXN5bmMo
TWVtb3J5UmVnaW9uICptciwgaHdhZGRyIGFkZHIsIGh3YWRkciBzaXplKQoreworICAgIGlmICht
ci0+cmFtX2Jsb2NrKSB7CisgICAgICAgIHFlbXVfcmFtX3dyaXRlYmFjayhtci0+cmFtX2Jsb2Nr
LCBhZGRyLCBzaXplKTsKKyAgICB9Cit9CiAKIHZvaWQgbWVtb3J5X3JlZ2lvbl93cml0ZWJhY2so
TWVtb3J5UmVnaW9uICptciwgaHdhZGRyIGFkZHIsIGh3YWRkciBzaXplKQogewpAQCAtMjIwNCw4
ICsyMjEwLDggQEAgdm9pZCBtZW1vcnlfcmVnaW9uX3dyaXRlYmFjayhNZW1vcnlSZWdpb24gKm1y
LCBod2FkZHIgYWRkciwgaHdhZGRyIHNpemUpCiAgICAgICogTWlnaHQgYmUgZXh0ZW5kZWQgY2Fz
ZSBuZWVkZWQgdG8gY292ZXIKICAgICAgKiBkaWZmZXJlbnQgdHlwZXMgb2YgbWVtb3J5IHJlZ2lv
bnMKICAgICAgKi8KLSAgICBpZiAobXItPnJhbV9ibG9jayAmJiBtci0+ZGlydHlfbG9nX21hc2sp
IHsKLSAgICAgICAgcWVtdV9yYW1fd3JpdGViYWNrKG1yLT5yYW1fYmxvY2ssIGFkZHIsIHNpemUp
OworICAgIGlmIChtci0+ZGlydHlfbG9nX21hc2spIHsKKyAgICAgICAgbWVtb3J5X3JlZ2lvbl9t
c3luYyhtciwgYWRkciwgc2l6ZSk7CiAgICAgfQogfQogCi0tIAoyLjI1LjQKCg==

