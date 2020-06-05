Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2287383lfc;
        Fri, 5 Jun 2020 02:53:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7rZ1VHIsU4giE6Y0kjDveBcCm6g/FV273qGKzKasSjPiZmoOBliVFQSC2b3Qq1AvbTB4r
X-Received: by 2002:a25:14d6:: with SMTP id 205mr15200522ybu.113.1591350799037;
        Fri, 05 Jun 2020 02:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591350799; cv=none;
        d=google.com; s=arc-20160816;
        b=PAnwVTdulU8vSnBs6yKIBPmbxWcw5aDq7C6a9apI2Qssf5i3APcMGNqiDyjxvTA1ub
         egzNozO3U5j8yTOlLc1PO7frhUd6kw0oskkvPPOZiVUFWU4klcsOYUZB5IcHBCviQ8K6
         6NxHwnrMWNp77dtvHMoQFZFmkaDig7jG5UPSkbM+LYeiwZYDW/PYfvWRUh2nhp2PfTvo
         L+zeRVNS2SHmXyH0/I32GZGFJyU+j4yDJlm+0LOvkNXHJUmdUUexs0PzaMNikHj9e31H
         Bkl5PxujZXB8s1Pbwul4wkju4XGJuH59GnhNT+Bi+602uMsfK69lVA8IBe9CCVxgCB7r
         n6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Eh+wS9bsag8sBkI2dm0xd6myJCH1JX4GXUan81NC6qU=;
        b=Gv5x53m00OIcRxGi7AR9tA8ZMQPcpZnWocIAH7SUet3r2WezUgT1jzrF+C2YGM/nhS
         9GuqYOFXBDwhNkt+0eqGv0vwundFLbnabuRgYruuH1XHLVXE02Sb6sSqOGcUSmGqD7/O
         REHCg5JSeF8RNYzD9h+ojTx/TIttqtzMtVqnTTEfF2ncKa9zRj8CI9v/x4IVX2K3RY/A
         Xr06g5C+Xf2zuVCiBfn6l8aWoCnMKcJE1A6+P6ixQU9EpnBB1j6JwPCx0urQ1h/Co7Wu
         il0aDSRgk8KdrNa6tnoGtKnyUskTvYbu56BJ23eypNpeqpZ8n1Ayt1NNd7RRl85RfbwJ
         R7RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ho3HBAP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si6361511ybm.26.2020.06.05.02.53.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 02:53:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ho3HBAP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh92M-0003rg-GU
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 05:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8yn-0004OL-52
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 05:49:37 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58021
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8yl-00071n-Ay
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 05:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591350574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eh+wS9bsag8sBkI2dm0xd6myJCH1JX4GXUan81NC6qU=;
 b=Ho3HBAP6ItMvxxPkYlwhzc27rbR8DPntUHIQKZHlx3eJnc4KmLJw66AUbP3X9r/7w6u/Dh
 k+WWNDMB1pTW6jD0ligc0kjLXRqrrMXYe2qo9YyYEaE296M3tTEf3qCqR35jh77PdVEbyZ
 1SyVYsQ26h1MbCIet3J7oqxVFQG+gTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-xm_yrnZDP2CWb978jA_3fg-1; Fri, 05 Jun 2020 05:49:33 -0400
X-MC-Unique: xm_yrnZDP2CWb978jA_3fg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 344CEA0C04;
 Fri,  5 Jun 2020 09:49:31 +0000 (UTC)
Received: from localhost (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C22D160BF4;
 Fri,  5 Jun 2020 09:49:30 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 10/11] exec: Rename qemu_ram_writeback() as qemu_ram_msync()
Date: Fri,  5 Jun 2020 10:47:49 +0100
Message-Id: <20200605094750.149957-11-stefanha@redhat.com>
In-Reply-To: <20200605094750.149957-1-stefanha@redhat.com>
References: <20200605094750.149957-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:40:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: BntyyFcnmaFp

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKUmVuYW1l
IHFlbXVfcmFtX3dyaXRlYmFjaygpIGFzIHFlbXVfcmFtX21zeW5jKCkgdG8gYmV0dGVyCm1hdGNo
IHdoYXQgaXQgZG9lcy4KClN1Z2dlc3RlZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUBy
ZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhh
dC5jb20+ClJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25A
bGluYXJvLm9yZz4KQWNrZWQtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+
Ck1lc3NhZ2UtaWQ6IDIwMjAwNTA4MDYyNDU2LjIzMzQ0LTUtcGhpbG1kQHJlZGhhdC5jb20KU2ln
bmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGlu
Y2x1ZGUvZXhlYy9yYW1fYWRkci5oIHwgNCArKy0tCiBleGVjLmMgICAgICAgICAgICAgICAgICB8
IDIgKy0KIG1lbW9yeS5jICAgICAgICAgICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVj
L3JhbV9hZGRyLmggYi9pbmNsdWRlL2V4ZWMvcmFtX2FkZHIuaAppbmRleCA1ZTU5YTNkOGQ3Li5i
Mjk1ZjZhNzg0IDEwMDY0NAotLS0gYS9pbmNsdWRlL2V4ZWMvcmFtX2FkZHIuaAorKysgYi9pbmNs
dWRlL2V4ZWMvcmFtX2FkZHIuaApAQCAtMTM2LDEyICsxMzYsMTIgQEAgdm9pZCBxZW11X3JhbV9m
cmVlKFJBTUJsb2NrICpibG9jayk7CiAKIGludCBxZW11X3JhbV9yZXNpemUoUkFNQmxvY2sgKmJs
b2NrLCByYW1fYWRkcl90IG5ld3NpemUsIEVycm9yICoqZXJycCk7CiAKLXZvaWQgcWVtdV9yYW1f
d3JpdGViYWNrKFJBTUJsb2NrICpibG9jaywgcmFtX2FkZHJfdCBzdGFydCwgcmFtX2FkZHJfdCBs
ZW5ndGgpOwordm9pZCBxZW11X3JhbV9tc3luYyhSQU1CbG9jayAqYmxvY2ssIHJhbV9hZGRyX3Qg
c3RhcnQsIHJhbV9hZGRyX3QgbGVuZ3RoKTsKIAogLyogQ2xlYXIgd2hvbGUgYmxvY2sgb2YgbWVt
ICovCiBzdGF0aWMgaW5saW5lIHZvaWQgcWVtdV9yYW1fYmxvY2tfd3JpdGViYWNrKFJBTUJsb2Nr
ICpibG9jaykKIHsKLSAgICBxZW11X3JhbV93cml0ZWJhY2soYmxvY2ssIDAsIGJsb2NrLT51c2Vk
X2xlbmd0aCk7CisgICAgcWVtdV9yYW1fbXN5bmMoYmxvY2ssIDAsIGJsb2NrLT51c2VkX2xlbmd0
aCk7CiB9CiAKICNkZWZpbmUgRElSVFlfQ0xJRU5UU19BTEwgICAgICgoMSA8PCBESVJUWV9NRU1P
UllfTlVNKSAtIDEpCmRpZmYgLS1naXQgYS9leGVjLmMgYi9leGVjLmMKaW5kZXggNTE2MmYwZDEy
Zi4uM2Q0Yzk0YTlkYyAxMDA2NDQKLS0tIGEvZXhlYy5jCisrKyBiL2V4ZWMuYwpAQCAtMjEyNyw3
ICsyMTI3LDcgQEAgaW50IHFlbXVfcmFtX3Jlc2l6ZShSQU1CbG9jayAqYmxvY2ssIHJhbV9hZGRy
X3QgbmV3c2l6ZSwgRXJyb3IgKiplcnJwKQogICogT3RoZXJ3aXNlIG5vLW9wLgogICogQE5vdGU6
IHRoaXMgaXMgc3VwcG9zZWQgdG8gYmUgYSBzeW5jaHJvbm91cyBvcC4KICAqLwotdm9pZCBxZW11
X3JhbV93cml0ZWJhY2soUkFNQmxvY2sgKmJsb2NrLCByYW1fYWRkcl90IHN0YXJ0LCByYW1fYWRk
cl90IGxlbmd0aCkKK3ZvaWQgcWVtdV9yYW1fbXN5bmMoUkFNQmxvY2sgKmJsb2NrLCByYW1fYWRk
cl90IHN0YXJ0LCByYW1fYWRkcl90IGxlbmd0aCkKIHsKICAgICAvKiBUaGUgcmVxdWVzdGVkIHJh
bmdlIHNob3VsZCBmaXQgaW4gd2l0aGluIHRoZSBibG9jayByYW5nZSAqLwogICAgIGdfYXNzZXJ0
KChzdGFydCArIGxlbmd0aCkgPD0gYmxvY2stPnVzZWRfbGVuZ3RoKTsKZGlmZiAtLWdpdCBhL21l
bW9yeS5jIGIvbWVtb3J5LmMKaW5kZXggOTNmZWJlNDc1OS4uOTFjZWFmOWZjZiAxMDA2NDQKLS0t
IGEvbWVtb3J5LmMKKysrIGIvbWVtb3J5LmMKQEAgLTIyMDAsNyArMjIwMCw3IEBAIHZvaWQgbWVt
b3J5X3JlZ2lvbl9yYW1fcmVzaXplKE1lbW9yeVJlZ2lvbiAqbXIsIHJhbV9hZGRyX3QgbmV3c2l6
ZSwgRXJyb3IgKiplcnJwCiB2b2lkIG1lbW9yeV9yZWdpb25fbXN5bmMoTWVtb3J5UmVnaW9uICpt
ciwgaHdhZGRyIGFkZHIsIGh3YWRkciBzaXplKQogewogICAgIGlmIChtci0+cmFtX2Jsb2NrKSB7
Ci0gICAgICAgIHFlbXVfcmFtX3dyaXRlYmFjayhtci0+cmFtX2Jsb2NrLCBhZGRyLCBzaXplKTsK
KyAgICAgICAgcWVtdV9yYW1fbXN5bmMobXItPnJhbV9ibG9jaywgYWRkciwgc2l6ZSk7CiAgICAg
fQogfQogCi0tIAoyLjI1LjQKCg==

