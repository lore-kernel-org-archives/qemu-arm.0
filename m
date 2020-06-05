Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2285495lfc;
        Fri, 5 Jun 2020 02:50:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQnYGA3L52qRc09+L1Q6qvcqVzeN0+bWqxvG/LPjt24YRVMdiI975cteIhkLYeWajJ+dkV
X-Received: by 2002:a25:44d6:: with SMTP id r205mr15725999yba.447.1591350620125;
        Fri, 05 Jun 2020 02:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591350620; cv=none;
        d=google.com; s=arc-20160816;
        b=IofxvVLsRYmQtsBqPUSGR6DVHoaScNJfVIn4QxsGxcO0yZThLQIUYfx2nOs3vmbdnR
         XWooT9RX30jVzo8q14V2QF9h8kWIwsX/LPoRRwgGvkqyIBiYxSFQPn79jARO1Dsxk4Sw
         gRUoEEcBaB8e/Wz7XQjaLNffnR8/9FDClRe6tk3+qOiTsPVMkXKzhJeYNFnOxqi8xl/r
         GK9Dro8Xf5Q4OLbAIIK5PpOZpa+cm4MIPXjEbMBFeRP76PTPFXd77ZR1UoGX5cf674g9
         YYQUXObLWW6tWaCdXLz4pdfG0wkbcaqS1pnBKNR1twq0EO5DDKUwSN4GSfzZd12aSObR
         LnLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PAclCbkK965kzoir3NvjWZkVoHfN2nNhuLsOqTw6Ncc=;
        b=y4EEg123YRryiK04/ybb9kbGabgU7QIQmImiRM8952RoF4ZwaZ65Q4y+qbxSjZY+mO
         muXESFPTi8edlAx0vjoGkzLuWl13qjFmgdOT0Dd4CMiTxVbJo1sSVR4tGp2bONaCzDNF
         BRD2l6na7C+rSh4tyIjDs1eJfNIkHiK91oPU/pDd9hgQ/ytu5BSRx/Z4blbJwwACP8uG
         A3gQmdy8m0BB2cHQuTLV7q9U9E8Xt+o4ANvdMVvwyKtqPQV0Nh4VHIsZ1Bt1skFhQBXh
         Pbp/spvg4tf79YAFHgvbdueDi7tRaqsU0ZuevtQq1w2XPXYuGvUGIvMvS0Pqz+9xpbrz
         HReg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LD3KxuzL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si6240675ybq.88.2020.06.05.02.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 02:50:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LD3KxuzL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh8zT-0005k0-Ck
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 05:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8xr-0002Gi-29
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 05:48:40 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34731
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8xq-0006l3-9L
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 05:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591350516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAclCbkK965kzoir3NvjWZkVoHfN2nNhuLsOqTw6Ncc=;
 b=LD3KxuzLT20/kojC4dePYhfNAGnW3biU4sUOI9jqfDxCHRsAdMETMhFzW6NYbXPfyyc7yX
 tNFMBjCuVmj10oAiedFjjN9Ipx/U2nxdmutrCkv6DId56tSFoJKlYhV6D9F8qxaerT295R
 1TQPGXaFBCPCJJdsa4JfiEQNcx1Kt6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-f6vMfDOrOO2yVomshhH3iA-1; Fri, 05 Jun 2020 05:48:34 -0400
X-MC-Unique: f6vMfDOrOO2yVomshhH3iA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 256FE1940921;
 Fri,  5 Jun 2020 09:48:33 +0000 (UTC)
Received: from localhost (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35B5E5D9D7;
 Fri,  5 Jun 2020 09:48:24 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 03/11] fuzz: add datadir for oss-fuzz compatability
Date: Fri,  5 Jun 2020 10:47:42 +0100
Message-Id: <20200605094750.149957-4-stefanha@redhat.com>
In-Reply-To: <20200605094750.149957-1-stefanha@redhat.com>
References: <20200605094750.149957-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:40:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-TUID: GkaaWUkXREpa

RnJvbTogQWxleGFuZGVyIEJ1bGVrb3YgPGFseG5kckBidS5lZHU+CgpUaGlzIGFsbG93cyB1cyB0
byBrZWVwIHBjLWJpb3MgaW4gZXhlY3V0YWJsZV9kaXIvcGMtYmlvcywgcmF0aGVyIHRoYW4KZXhl
Y3V0YWJsZV9kaXIvLi4vcGMtYmlvcywgd2hpY2ggaXMgaW5jb21wYXRpYmxlIHdpdGggb3NzLWZ1
enonIGZpbGUKc3RydWN0dXJlLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEJ1bGVrb3YgPGFs
eG5kckBidS5lZHU+ClJldmlld2VkLWJ5OiBEYXJyZW4gS2VubnkgPGRhcnJlbi5rZW5ueUBvcmFj
bGUuY29tPgpNZXNzYWdlLWlkOiAyMDIwMDUxMjAzMDEzMy4yOTg5Ni0yLWFseG5kckBidS5lZHUK
U2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0K
IGluY2x1ZGUvc3lzZW11L3N5c2VtdS5oIHwgIDIgKysKIHNvZnRtbXUvdmwuYyAgICAgICAgICAg
IHwgIDIgKy0KIHRlc3RzL3F0ZXN0L2Z1enovZnV6ei5jIHwgMTUgKysrKysrKysrKysrKysrCiAz
IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL3N5c2VtdS9zeXNlbXUuaCBiL2luY2x1ZGUvc3lzZW11L3N5c2VtdS5oCmlu
ZGV4IDI2YzBjODAyZDEuLjNlZmNjZGJhN2UgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvc3lzZW11L3N5
c2VtdS5oCisrKyBiL2luY2x1ZGUvc3lzZW11L3N5c2VtdS5oCkBAIC0xNSw2ICsxNSw4IEBAIGV4
dGVybiBjb25zdCBjaGFyICpxZW11X25hbWU7CiBleHRlcm4gUWVtdVVVSUQgcWVtdV91dWlkOwog
ZXh0ZXJuIGJvb2wgcWVtdV91dWlkX3NldDsKIAordm9pZCBxZW11X2FkZF9kYXRhX2Rpcihjb25z
dCBjaGFyICpwYXRoKTsKKwogdm9pZCBxZW11X2FkZF9leGl0X25vdGlmaWVyKE5vdGlmaWVyICpu
b3RpZnkpOwogdm9pZCBxZW11X3JlbW92ZV9leGl0X25vdGlmaWVyKE5vdGlmaWVyICpub3RpZnkp
OwogCmRpZmYgLS1naXQgYS9zb2Z0bW11L3ZsLmMgYi9zb2Z0bW11L3ZsLmMKaW5kZXggYWU1NDUx
YmMyMy4uMDVkMWE0Y2I2YiAxMDA2NDQKLS0tIGEvc29mdG1tdS92bC5jCisrKyBiL3NvZnRtbXUv
dmwuYwpAQCAtMTk5Myw3ICsxOTkzLDcgQEAgY2hhciAqcWVtdV9maW5kX2ZpbGUoaW50IHR5cGUs
IGNvbnN0IGNoYXIgKm5hbWUpCiAgICAgcmV0dXJuIE5VTEw7CiB9CiAKLXN0YXRpYyB2b2lkIHFl
bXVfYWRkX2RhdGFfZGlyKGNvbnN0IGNoYXIgKnBhdGgpCit2b2lkIHFlbXVfYWRkX2RhdGFfZGly
KGNvbnN0IGNoYXIgKnBhdGgpCiB7CiAgICAgaW50IGk7CiAKZGlmZiAtLWdpdCBhL3Rlc3RzL3F0
ZXN0L2Z1enovZnV6ei5jIGIvdGVzdHMvcXRlc3QvZnV6ei9mdXp6LmMKaW5kZXggZjVjOTIzODUy
ZS4uMzMzNjVjMzc4MiAxMDA2NDQKLS0tIGEvdGVzdHMvcXRlc3QvZnV6ei9mdXp6LmMKKysrIGIv
dGVzdHMvcXRlc3QvZnV6ei9mdXp6LmMKQEAgLTEzNyw2ICsxMzcsNyBAQCBpbnQgTExWTUZ1enpl
ckluaXRpYWxpemUoaW50ICphcmdjLCBjaGFyICoqKmFyZ3YsIGNoYXIgKioqZW52cCkKIHsKIAog
ICAgIGNoYXIgKnRhcmdldF9uYW1lOworICAgIGNoYXIgKmRpcjsKIAogICAgIC8qIEluaXRpYWxp
emUgcWdyYXBoIGFuZCBtb2R1bGVzICovCiAgICAgcW9zX2dyYXBoX2luaXQoKTsKQEAgLTE0Nyw2
ICsxNDgsMjAgQEAgaW50IExMVk1GdXp6ZXJJbml0aWFsaXplKGludCAqYXJnYywgY2hhciAqKiph
cmd2LCBjaGFyICoqKmVudnApCiAgICAgdGFyZ2V0X25hbWUgPSBzdHJzdHIoKiphcmd2LCAiLXRh
cmdldC0iKTsKICAgICBpZiAodGFyZ2V0X25hbWUpIHsgICAgICAgIC8qIFRoZSBiaW5hcnkgbmFt
ZSBzcGVjaWZpZXMgdGhlIHRhcmdldCAqLwogICAgICAgICB0YXJnZXRfbmFtZSArPSBzdHJsZW4o
Ii10YXJnZXQtIik7CisgICAgICAgIC8qCisgICAgICAgICAqIFdpdGggb3NzLWZ1enosIHRoZSBl
eGVjdXRhYmxlIGlzIGtlcHQgaW4gdGhlIHJvb3Qgb2YgYSBkaXJlY3RvcnkgKHdlCisgICAgICAg
ICAqIGNhbm5vdCBhc3N1bWUgdGhlIHBhdGgpLiBBbGwgZGF0YSAoaW5jbHVkaW5nIGJpb3MgYmlu
YXJpZXMpIG11c3QgYmUKKyAgICAgICAgICogaW4gdGhlIHNhbWUgZGlyLCBvciBhIHN1YmRpci4g
VGh1cywgd2UgY2Fubm90IHBsYWNlIHRoZSBwYy1iaW9zIHNvCisgICAgICAgICAqIHRoYXQgaXQg
d291bGQgYmUgaW4gZXhlY19kaXIvLi4vcGMtYmlvcy4KKyAgICAgICAgICogQXMgYSB3b3JrYXJv
dW5kLCBvc3MtZnV6eiBhbGxvd3MgdXMgdG8gdXNlIGFyZ3ZbMF0gdG8gZ2V0IHRoZQorICAgICAg
ICAgKiBsb2NhdGlvbiBvZiB0aGUgZXhlY3V0YWJsZS4gVXNpbmcgdGhpcyB3ZSBhZGQgZXhlY19k
aXIvcGMtYmlvcyB0bworICAgICAgICAgKiB0aGUgZGF0YWRpcnMuCisgICAgICAgICAqLworICAg
ICAgICBkaXIgPSBnX2J1aWxkX2ZpbGVuYW1lKGdfcGF0aF9nZXRfZGlybmFtZSgqKmFyZ3YpLCAi
cGMtYmlvcyIsIE5VTEwpOworICAgICAgICBpZiAoZ19maWxlX3Rlc3QoZGlyLCBHX0ZJTEVfVEVT
VF9JU19ESVIpKSB7CisgICAgICAgICAgICBxZW11X2FkZF9kYXRhX2RpcihkaXIpOworICAgICAg
ICB9CisgICAgICAgIGdfZnJlZShkaXIpOwogICAgIH0gZWxzZSBpZiAoKmFyZ2MgPiAxKSB7ICAv
KiBUaGUgdGFyZ2V0IGlzIHNwZWNpZmllZCBhcyBhbiBhcmd1bWVudCAqLwogICAgICAgICB0YXJn
ZXRfbmFtZSA9ICgqYXJndilbMV07CiAgICAgICAgIGlmICghc3Ryc3RyKHRhcmdldF9uYW1lLCAi
LS1mdXp6LXRhcmdldD0iKSkgewotLSAKMi4yNS40Cgo=

