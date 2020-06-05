Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2284178lfc;
        Fri, 5 Jun 2020 02:48:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKHXdlQLQQVyzJvUOP8CEojWr9ygc5n4UI2mLWvHj1F9EXkmMMbIN1uFkNectLHnfpD6U3
X-Received: by 2002:a25:3055:: with SMTP id w82mr15397408ybw.21.1591350498589;
        Fri, 05 Jun 2020 02:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591350498; cv=none;
        d=google.com; s=arc-20160816;
        b=Ch8sFFtWeCoxDcsAUmU5B0B04N0xME7WmQD6KBzZ9A1tvmjzXuB54WZDFSEpK/Tg8Y
         KUcZp1Mu1dO+BAEXTOn7G1/QWhrbWPBBDPHkBpGRMLUBdeSQeKzpxLc1vI8hoA7NwpOb
         Pwwh6dUmtjj1sav2w2hOMO/VdDuANqd0CH4/mkxu7kiib2ylhixTrsUnWwejpxTZy26F
         UY5YLnWyeyn4VIBQAJwLt7xTYaomzp0diGfL0ZDlhwlQCQx2Bv89eYwBRLprZWUXNCAv
         M9lnNGkoNn2J1mUP6Zwotw7OULrUt7z3mUXSW7DaOw/YedHZr+j4EVh4yQxGibu84pw3
         zjZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=qxyNF0Wnmk6QI4CjeBEfwFsOpoZUCPNbn8klcolTwaU=;
        b=Qv44euliczngnEfYCyrVoQL01jxLRuvGSHyR1hbyFbx7i+KdAoaHYXcQjczeR+APKv
         umoQyegvoV3KLrZ0oWJDrrHYGCU8ItYc+iRe7PMWG0Y0f8Qo5yVm9kecA2m9yjGchXHU
         9krC6POLYBsNb3C3nQzF6U+CRuT3zqP2Q8HgSOOqZ8kFP6LMkiUI7aGdnrorM8FTOKM1
         4Y0RO8NxOJUFgOfRFOLmDmnNZ45wOY0z6+yjUBVa787ngaQ9Yu9meiWfB7yFQcrSLpmg
         DXRbQNtjBenSSR/API5k6Oz+H2HR/0BKbWoaJjBlv8OZeJQNiK/k1rHG6+e0t+YpIjJH
         gRag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IHlVUPD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si1671315ybk.475.2020.06.05.02.48.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 02:48:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IHlVUPD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh8xV-0001aw-W5
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 05:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8xL-0001Zk-Sn
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 05:48:07 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35164
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8xL-0006em-6P
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 05:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591350486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qxyNF0Wnmk6QI4CjeBEfwFsOpoZUCPNbn8klcolTwaU=;
 b=IHlVUPD02EfZEvEMRwUZ82ICsYna80R51NhknFAKaoNdMP7vf5FxmkRb6VmUFXRw/3UAGb
 F5bshnld98J8JFQ3EqtBUhEHwZgrLIC++QWeUmcT71ruJ2n2fibQRgD4CYCFrPnUYMfXh7
 OjZdoBqwB5gXZSK3luoAlfS7CR+ZmVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-zM3zYmr8PKelVvK67Ncqxg-1; Fri, 05 Jun 2020 05:48:02 -0400
X-MC-Unique: zM3zYmr8PKelVvK67Ncqxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2962C83DE6D;
 Fri,  5 Jun 2020 09:48:01 +0000 (UTC)
Received: from localhost (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DC6178FC8;
 Fri,  5 Jun 2020 09:47:52 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/11] Block patches
Date: Fri,  5 Jun 2020 10:47:39 +0100
Message-Id: <20200605094750.149957-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
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
 Laurent Vivier <lvivier@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8TkG4iU3v/k5

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2NjIzNGZlZTljMmQzN2JmYmM1MjNh
YThkMGFlNTMwMGExNGNjMTBlOg0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvYWxpc3RhaXIvdGFncy9wdWxsLXJpc2N2LXRvLWFwcGx5LTIwMj0NCjAwNjAzJyBpbnRv
IHN0YWdpbmcgKDIwMjAtMDYtMDQgMTE6Mzg6NDggKzAxMDApDQoNCmFyZSBhdmFpbGFibGUgaW4g
dGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGVmYW5oYS9x
ZW11LmdpdCB0YWdzL2Jsb2NrLXB1bGwtcmVxdWVzdA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5n
ZXMgdXAgdG8gN2QyNDEwY2VhMTU0YmY5MTVmYjMwMTc5ZWJkYTNiMTdhYzM2ZTcwZToNCg0KICBi
bG9jazogRmFjdG9yIG91dCBiZHJ2X3J1bl9jbygpICgyMDIwLTA2LTA1IDA5OjU0OjQ4ICswMTAw
KQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQpQdWxsIHJlcXVlc3QNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpBbGV4YW5kZXIgQnVsZWtv
diAoNCk6DQogIGZ1eno6IGFkZCBkYXRhZGlyIGZvciBvc3MtZnV6eiBjb21wYXRhYmlsaXR5DQog
IGZ1eno6IGZpeCB0eXBvIGluIGk0NDBmeC1xdGVzdC1yZWJvb3QgYXJndW1lbnRzDQogIGZ1eno6
IGFkZCBtYW5nbGVkIG9iamVjdCBuYW1lIHRvIGxpbmtlciBzY3JpcHQNCiAgZnV6ejogcnVuIHRo
ZSBtYWluLWxvb3AgaW4gZm9yay1zZXJ2ZXIgcHJvY2Vzcw0KDQpQaGlsaXBwZSBNYXRoaWV1LURh
dWQ9QzM9QTkgKDQpOg0KICBtZW1vcnk6IFJlbmFtZSBtZW1vcnlfcmVnaW9uX2RvX3dyaXRlYmFj
ayAtPiBtZW1vcnlfcmVnaW9uX3dyaXRlYmFjaw0KICBtZW1vcnk6IEV4dHJhY3QgbWVtb3J5X3Jl
Z2lvbl9tc3luYygpIGZyb20gbWVtb3J5X3JlZ2lvbl93cml0ZWJhY2soKQ0KICBody9ibG9jazog
TGV0IHRoZSBOVk1lIGVtdWxhdGVkIGRldmljZSBiZSB0YXJnZXQtYWdub3N0aWMNCiAgZXhlYzog
UmVuYW1lIHFlbXVfcmFtX3dyaXRlYmFjaygpIGFzIHFlbXVfcmFtX21zeW5jKCkNCg0KU3RlZmFu
byBHYXJ6YXJlbGxhICgyKToNCiAgaW9fdXJpbmc6IHJldHJ5IGlvX3VyaW5nX3N1Ym1pdCgpIGlm
IGl0IGZhaWxzIHdpdGggZXJybm89M0RFSU5UUg0KICBpb191cmluZzogdXNlIGlvX3VyaW5nX2Nx
X3JlYWR5KCkgdG8gY2hlY2sgZm9yIHJlYWR5IGNxZXMNCg0KVmxhZGltaXIgU2VtZW50c292LU9n
aWV2c2tpeSAoMSk6DQogIGJsb2NrOiBGYWN0b3Igb3V0IGJkcnZfcnVuX2NvKCkNCg0KIGh3L2Js
b2NrL01ha2VmaWxlLm9ianMgICAgICAgICAgICAgIHwgICAyICstDQogaW5jbHVkZS9leGVjL21l
bW9yeS5oICAgICAgICAgICAgICAgfCAgMTUgKystDQogaW5jbHVkZS9leGVjL3JhbV9hZGRyLmgg
ICAgICAgICAgICAgfCAgIDQgKy0NCiBpbmNsdWRlL3N5c2VtdS9zeXNlbXUuaCAgICAgICAgICAg
ICB8ICAgMiArDQogYmxvY2svaW8uYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxOTMgKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLQ0KIGJsb2NrL2lvX3VyaW5nLmMgICAgICAgICAgICAg
ICAgICAgIHwgIDExICstDQogZXhlYy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKy0NCiBody9ibG9jay9udm1lLmMgICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQ0KIG1l
bW9yeS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEyICstDQogc29mdG1tdS92bC5j
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCiB0YXJnZXQvYXJtL2hlbHBlci5jICAg
ICAgICAgICAgICAgICB8ICAgMiArLQ0KIHRlc3RzL3F0ZXN0L2Z1enovZnV6ei5jICAgICAgICAg
ICAgIHwgIDE1ICsrKw0KIHRlc3RzL3F0ZXN0L2Z1enovaTQ0MGZ4X2Z1enouYyAgICAgIHwgICAz
ICstDQogdGVzdHMvcXRlc3QvZnV6ei92aXJ0aW9fbmV0X2Z1enouYyAgfCAgIDIgKw0KIHRlc3Rz
L3F0ZXN0L2Z1enovdmlydGlvX3Njc2lfZnV6ei5jIHwgICAyICsNCiB0ZXN0cy9xdGVzdC9mdXp6
L2ZvcmtfZnV6ei5sZCAgICAgICB8ICAgNSArDQogMTYgZmlsZXMgY2hhbmdlZCwgMTM0IGluc2Vy
dGlvbnMoKyksIDE0NCBkZWxldGlvbnMoLSkNCg0KLS09MjANCjIuMjUuNA0KDQo=

