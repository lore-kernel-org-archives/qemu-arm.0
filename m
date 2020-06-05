Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2286139lfc;
        Fri, 5 Jun 2020 02:51:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIP6m4QZfJaiLTmXTfxtoISyCAuwX/pfv2HSJ6gA+xuNlMfyLZNe36BKkb8551GzwrYGrc
X-Received: by 2002:a25:9d90:: with SMTP id v16mr16031285ybp.128.1591350685332;
        Fri, 05 Jun 2020 02:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591350685; cv=none;
        d=google.com; s=arc-20160816;
        b=ygKlSCy2yHhwd5C68W2wyjgVPeDrJ0fRgEmEeObNrAkGM/Eza+z1JrvZIGQRd/BkpR
         A+Verp4oRcZtkvbO0Sv+1Q03c1/m8XY5YZYyjfHLDqi9mw6ZW/MnQqbY/aufPPinezi+
         H3C/A8J87/+BkPr9xaO6JXvubCcEoJ+hRMvduqnpPU+DZ724Ych2B4xO+Fi/rnHJfF+s
         okBsd0UJsOCwcPU7TybJjdTYgbnByvXgnvPqw5IAbN0Ec519hDUXBKtd8IFNRjuaKU4Z
         0JJHcISHtVUFmvEWEuzytvJBRvE2MeQtX7FLDAQOmt2u/Mz45bgT3O2Scq5opfWxKkbN
         tWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GeDB82xEvMkQfbKYkEl5hVpTTwCGfpocvzSRNAvRCMA=;
        b=etUTSp+2ebuj8kTP9o4Cc6J7ScYI8mBKQ7oC9/dF5cx35rgAcj/YzFGkuMhKjUp3Ib
         n5REl17z5eVRuMaxd/GkbOev7hwRLJVyFpYZtyDkExO0H/nsthtc+gMqq3uZBxP5YF1u
         RWsxQVsm4kPgJWdpeb3hIHEKmYRrYB/6AaDYsNVJFWI4X9/VRvmg7xun+puy3NMyH+fC
         y2vxksc5DL5qQzwIE8/0km1vmZMkcz5a2/9Ok+c99YAE7sPYfw5PBsHZiO0zsNeL73Eu
         2MBZEYeAwi44Mb1uifxj5qUQEJKkEjYZsID6+A6B0GFq/mprPd0HCpZqaCCFosDK6XBV
         s7fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SO+4wjPQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i205si6088410yba.151.2020.06.05.02.51.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 02:51:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SO+4wjPQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh90W-0007Nd-Pn
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 05:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8y1-0002dK-Nf
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 05:48:49 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23312
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8y0-0006ln-Qk
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 05:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591350528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GeDB82xEvMkQfbKYkEl5hVpTTwCGfpocvzSRNAvRCMA=;
 b=SO+4wjPQ7Z8rGhOLBVzhl+45PHM9M63vTslcK4tUTxz7Q3Dnq5LGBZjm+iH/SfOaK8ZA3/
 kARzhvpp78XRHysoaabNI4Y8+5UkIxN/sb2HK4Mn2yAV6ohuS1UGx39pBjhvIxRehTCw0A
 6zEGuqeYNVrk3dG+btH8HE0iGP9EXzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-g2LwYyuLMNWaE_GxE7nrxw-1; Fri, 05 Jun 2020 05:48:46 -0400
X-MC-Unique: g2LwYyuLMNWaE_GxE7nrxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D06F461;
 Fri,  5 Jun 2020 09:48:44 +0000 (UTC)
Received: from localhost (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC77B7CCF2;
 Fri,  5 Jun 2020 09:48:34 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 04/11] fuzz: fix typo in i440fx-qtest-reboot arguments
Date: Fri,  5 Jun 2020 10:47:43 +0100
Message-Id: <20200605094750.149957-5-stefanha@redhat.com>
In-Reply-To: <20200605094750.149957-1-stefanha@redhat.com>
References: <20200605094750.149957-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, Laurent Vivier <lvivier@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 83ZddwvB3X7l

RnJvbTogQWxleGFuZGVyIEJ1bGVrb3YgPGFseG5kckBidS5lZHU+CgpTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgQnVsZWtvdiA8YWx4bmRyQGJ1LmVkdT4KUmV2aWV3ZWQtYnk6IERhcnJlbiBLZW5u
eSA8ZGFycmVuLmtlbm55QG9yYWNsZS5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjAwNTEyMDMwMTMzLjI5
ODk2LTMtYWx4bmRyQGJ1LmVkdQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+Ci0tLQogdGVzdHMvcXRlc3QvZnV6ei9pNDQwZnhfZnV6ei5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvdGVzdHMvcXRlc3QvZnV6ei9pNDQwZnhfZnV6ei5jIGIvdGVzdHMvcXRlc3QvZnV6ei9p
NDQwZnhfZnV6ei5jCmluZGV4IGJjZDY3NjliNGMuLjc3NWIzMDQxYmEgMTAwNjQ0Ci0tLSBhL3Rl
c3RzL3F0ZXN0L2Z1enovaTQ0MGZ4X2Z1enouYworKysgYi90ZXN0cy9xdGVzdC9mdXp6L2k0NDBm
eF9mdXp6LmMKQEAgLTE1Niw3ICsxNTYsNyBAQCBzdGF0aWMgdm9pZCBpNDQwZnhfZnV6el9xb3Nf
Zm9yayhRVGVzdFN0YXRlICpzLAogfQogCiBzdGF0aWMgY29uc3QgY2hhciAqaTQ0MGZ4X3F0ZXN0
X2FyZ3YgPSBUQVJHRVRfTkFNRSAiIC1tYWNoaW5lIGFjY2VsPXF0ZXN0IgotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIi1tIDAgLWRpc3BsYXkgbm9uZSI7CisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiIC1tIDAgLWRpc3BsYXkgbm9uZSI7CiBz
dGF0aWMgY29uc3QgY2hhciAqaTQ0MGZ4X2FyZ3YoRnV6elRhcmdldCAqdCkKIHsKICAgICByZXR1
cm4gaTQ0MGZ4X3F0ZXN0X2FyZ3Y7Ci0tIAoyLjI1LjQKCg==

