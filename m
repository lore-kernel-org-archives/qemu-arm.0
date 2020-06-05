Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2285005lfc;
        Fri, 5 Jun 2020 02:49:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk4W3JGfmLC5h1mPlouOJrvdh5dScCNhTTjZq+QqFRshozVSczoXOu33tKQrAgNmirMGPu
X-Received: by 2002:a25:a408:: with SMTP id f8mr13233708ybi.145.1591350575114;
        Fri, 05 Jun 2020 02:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591350575; cv=none;
        d=google.com; s=arc-20160816;
        b=026YOiEdEdwOb1qVF3zC3g2HQb9qOnV/0VTZf9to18XqCaJfB5YB/CDiVFsQ47PD/+
         UOfNV10kPTlsz7CPHTffXHxejvpGRN0k9WePbDYoJX3b7vbEnQ9Og+DCWZVzwORymCEp
         HyTiX+I17y6r+NqQ8y6XR87Nk/ivEuVC926N08NEaPjtiaOM2AcuOW4A3JgU4TxCb+X3
         KLhahIGx8+v5V/P8mB2LZhBWm7Z+wa9HM0vuZrBAh10yQ6PYSErpUup3RyLXFKmrVKN0
         kUPUfpO6iOpJ9HpFzePStUkVqgXhlrneXHPqwvFoYuv3UupVU8qYgMvAwfEWpgAnx1dU
         J9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=obSFu5gu523AqVMnoUB8q9xLwd8TgW9ZodC9N3uuImc=;
        b=iPLBGy3cb6k1MmF9IEBvXYpm3xO19JZrgQ7KSTawbzkOsUtqujMqyCW8QM/9+3utOW
         BaAaMM0sJmft0ih5gQxq/xWOTTvSsi0ZHJiz9fYFsZLrbaOIG6gPizi1CkLKTcUmtQUv
         0bzfi7FleMfvBlTIy5PKesDnedH+p1BTHT7N91MX6ExYlZ3cV4SCM2FaGKosCb7lTfsX
         qZboFDCdl1QKqua2uqT5InD34ckw22u2VDMm0Pve2B7CtHLNzv4fkIfLPBsU35IlUFC3
         BoeiuqcmyKMCuQh9hmDZlv6T4GAO6wJadcdZyeRyjOPVFy0wfq71OpDkIKIm6AHgwPYX
         vR4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ams/iLOv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si559521ybq.437.2020.06.05.02.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 02:49:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ams/iLOv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh8yk-0003vq-0u
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 05:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8yQ-0003d4-NP
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 05:49:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32514
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8yP-0006pp-U3
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 05:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591350553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obSFu5gu523AqVMnoUB8q9xLwd8TgW9ZodC9N3uuImc=;
 b=ams/iLOvbIlqXV4iJfIdhasnZUghm0rR6IBoo4cDw01BkKB0IHMhoo3hiQ3FURXie7GzcL
 mN5kWB6uvqkQgK2A+slDZg2hiffWJ5xLGG0fej96aMuyrOALzkwraIOBmbd+GEbB8z3pUV
 xtbYLg9A3ZFilX13JZOf6FFmzRmrEqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-n3PVCGaDP4GHs0PS5B-Ypw-1; Fri, 05 Jun 2020 05:49:09 -0400
X-MC-Unique: n3PVCGaDP4GHs0PS5B-Ypw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50EFC1940932;
 Fri,  5 Jun 2020 09:49:07 +0000 (UTC)
Received: from localhost (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 811607CCEF;
 Fri,  5 Jun 2020 09:48:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 06/11] fuzz: run the main-loop in fork-server process
Date: Fri,  5 Jun 2020 10:47:45 +0100
Message-Id: <20200605094750.149957-7-stefanha@redhat.com>
In-Reply-To: <20200605094750.149957-1-stefanha@redhat.com>
References: <20200605094750.149957-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
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
 Darren Kenny <darren.kenny@oracle.com>, Laurent Vivier <lvivier@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OauWilAX9TyO

RnJvbTogQWxleGFuZGVyIEJ1bGVrb3YgPGFseG5kckBidS5lZHU+CgpXaXRob3V0IHRoaXMsIHRo
ZSB0aW1lIHNpbmNlIHRoZSBsYXN0IG1haW4tbG9vcCBrZWVwcyBpbmNyZWFzaW5nLCBhcyB0aGUK
ZnV6emVyIHJ1bnMuIFRoZSBmb3JrZWQgY2hpbGRyZW4gbmVlZCB0byBoYW5kbGUgYWxsIHRoZSAi
cGFzdC1kdWUiCnRpbWVycywgc2xvd2luZyB0aGVtIGRvd24sIG92ZXIgdGltZS4gV2l0aCB0aGlz
IGNoYW5nZSwgdGhlCnBhcmVudC9mb3JrLXNlcnZlciBwcm9jZXNzIHJ1bnMgdGhlIG1haW4tbG9v
cCwgd2hpbGUgd2FpdGluZyBvbiB0aGUKY2hpbGQsIGVuc3VyaW5nIHRoYXQgdGhlIHRpbWVyIGV2
ZW50cyBkbyBub3QgcGlsZSB1cCwgb3ZlciB0aW1lLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZGVy
IEJ1bGVrb3YgPGFseG5kckBidS5lZHU+ClJldmlld2VkLWJ5OiBEYXJyZW4gS2VubnkgPGRhcnJl
bi5rZW5ueUBvcmFjbGUuY29tPgpNZXNzYWdlLWlkOiAyMDIwMDUxMjAzMDEzMy4yOTg5Ni01LWFs
eG5kckBidS5lZHUKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRo
YXQuY29tPgotLS0KIHRlc3RzL3F0ZXN0L2Z1enovaTQ0MGZ4X2Z1enouYyAgICAgIHwgMSArCiB0
ZXN0cy9xdGVzdC9mdXp6L3ZpcnRpb19uZXRfZnV6ei5jICB8IDIgKysKIHRlc3RzL3F0ZXN0L2Z1
enovdmlydGlvX3Njc2lfZnV6ei5jIHwgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9xdGVzdC9mdXp6L2k0NDBmeF9mdXp6LmMgYi90ZXN0
cy9xdGVzdC9mdXp6L2k0NDBmeF9mdXp6LmMKaW5kZXggNzc1YjMwNDFiYS4uZTJmMzFlNTZmOSAx
MDA2NDQKLS0tIGEvdGVzdHMvcXRlc3QvZnV6ei9pNDQwZnhfZnV6ei5jCisrKyBiL3Rlc3RzL3F0
ZXN0L2Z1enovaTQ0MGZ4X2Z1enouYwpAQCAtMTUxLDYgKzE1MSw3IEBAIHN0YXRpYyB2b2lkIGk0
NDBmeF9mdXp6X3Fvc19mb3JrKFFUZXN0U3RhdGUgKnMsCiAgICAgICAgIGk0NDBmeF9mdXp6X3Fv
cyhzLCBEYXRhLCBTaXplKTsKICAgICAgICAgX0V4aXQoMCk7CiAgICAgfSBlbHNlIHsKKyAgICAg
ICAgZmx1c2hfZXZlbnRzKHMpOwogICAgICAgICB3YWl0KE5VTEwpOwogICAgIH0KIH0KZGlmZiAt
LWdpdCBhL3Rlc3RzL3F0ZXN0L2Z1enovdmlydGlvX25ldF9mdXp6LmMgYi90ZXN0cy9xdGVzdC9m
dXp6L3ZpcnRpb19uZXRfZnV6ei5jCmluZGV4IGQwOGE0N2UyNzguLmEzM2JkNzMwNjcgMTAwNjQ0
Ci0tLSBhL3Rlc3RzL3F0ZXN0L2Z1enovdmlydGlvX25ldF9mdXp6LmMKKysrIGIvdGVzdHMvcXRl
c3QvZnV6ei92aXJ0aW9fbmV0X2Z1enouYwpAQCAtMTIyLDYgKzEyMiw3IEBAIHN0YXRpYyB2b2lk
IHZpcnRpb19uZXRfZm9ya19mdXp6KFFUZXN0U3RhdGUgKnMsCiAgICAgICAgIGZsdXNoX2V2ZW50
cyhzKTsKICAgICAgICAgX0V4aXQoMCk7CiAgICAgfSBlbHNlIHsKKyAgICAgICAgZmx1c2hfZXZl
bnRzKHMpOwogICAgICAgICB3YWl0KE5VTEwpOwogICAgIH0KIH0KQEAgLTEzNCw2ICsxMzUsNyBA
QCBzdGF0aWMgdm9pZCB2aXJ0aW9fbmV0X2ZvcmtfZnV6el9jaGVja191c2VkKFFUZXN0U3RhdGUg
KnMsCiAgICAgICAgIGZsdXNoX2V2ZW50cyhzKTsKICAgICAgICAgX0V4aXQoMCk7CiAgICAgfSBl
bHNlIHsKKyAgICAgICAgZmx1c2hfZXZlbnRzKHMpOwogICAgICAgICB3YWl0KE5VTEwpOwogICAg
IH0KIH0KZGlmZiAtLWdpdCBhL3Rlc3RzL3F0ZXN0L2Z1enovdmlydGlvX3Njc2lfZnV6ei5jIGIv
dGVzdHMvcXRlc3QvZnV6ei92aXJ0aW9fc2NzaV9mdXp6LmMKaW5kZXggM2I5NTI0N2YxMi4uNTFk
Y2U0OTFhYiAxMDA2NDQKLS0tIGEvdGVzdHMvcXRlc3QvZnV6ei92aXJ0aW9fc2NzaV9mdXp6LmMK
KysrIGIvdGVzdHMvcXRlc3QvZnV6ei92aXJ0aW9fc2NzaV9mdXp6LmMKQEAgLTE0NSw2ICsxNDUs
NyBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fc2NzaV9mb3JrX2Z1enooUVRlc3RTdGF0ZSAqcywKICAg
ICAgICAgZmx1c2hfZXZlbnRzKHMpOwogICAgICAgICBfRXhpdCgwKTsKICAgICB9IGVsc2Ugewor
ICAgICAgICBmbHVzaF9ldmVudHMocyk7CiAgICAgICAgIHdhaXQoTlVMTCk7CiAgICAgfQogfQpA
QCAtMTY0LDYgKzE2NSw3IEBAIHN0YXRpYyB2b2lkIHZpcnRpb19zY3NpX3dpdGhfZmxhZ19mdXp6
KFFUZXN0U3RhdGUgKnMsCiAgICAgICAgIH0KICAgICAgICAgX0V4aXQoMCk7CiAgICAgfSBlbHNl
IHsKKyAgICAgICAgZmx1c2hfZXZlbnRzKHMpOwogICAgICAgICB3YWl0KE5VTEwpOwogICAgIH0K
IH0KLS0gCjIuMjUuNAoK

