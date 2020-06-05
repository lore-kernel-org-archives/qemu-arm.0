Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2285080lfc;
        Fri, 5 Jun 2020 02:49:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUwmy0hsZWpL1+MuOFDqln2aMvCcZ2zpDKlw/16gNRtK/ozeTPVxcCC3RBpiN668A8JAav
X-Received: by 2002:a25:d7d1:: with SMTP id o200mr14869717ybg.194.1591350581262;
        Fri, 05 Jun 2020 02:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591350581; cv=none;
        d=google.com; s=arc-20160816;
        b=lOnqlW3/xHYYQC7lKPtvYqubWWbWZa8HIHgVX4ZjPNoUf63HsR/8wgcs6SlBjv3STx
         J0GbPEX9sfpVDGThDMXXM7fCPHkgrLI2ZKK9twbtrgrtm5d4ldnRhl3Z2G4OzOoXyYU6
         3s8qDJXSZKyo6E7HQ23rt8Va+Z8ZdGPU505k+EpPlgYRDfkUUX9W9Qy3bvaBv9aSzm6a
         9ru0dE96QYHbDAMWsM1Iwh+45jB78f0mHk2AabxmBkw9Xa0eox0EP/+hIBK9fcvJE2TM
         sqBNfN8vNfa+CANXUy+OoykOOeEzLbzrV8VmaybEHWq/sfvoW45UdrG2HWxE9MUc/qH2
         BsBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0KR6x6asC/HYUxAOydHgzfA0NWWwl9rylofm3HE79GE=;
        b=Td57W4k6NzoAGlgAsBiI31Sk1dIWGUurfVrmfqVUQm+UVyvadCz+VsQlYK1Qx0CalW
         I6LJSUPF2KtI5w3m/yzFoD/vFn1DNAVK735LkU9BucL0IwocG1/pvzS6SA+0fI1SHmpZ
         2TOy5BIPxD1G4eSiQ3Q9fU0N97CY3O8laQlw9PEkywC1z+lJVCJKOi2zvgGW6FKmDHEd
         aFJvCJ+4Dapoi7smwHmReI03RQgh5OEgoFoHZTsBi76cYny1qAzPDdXvj6re7HzzAxRp
         7AQ6n52LN3qd/UKH1kxJ9mpGibm4LC7IpouFlN9roWeWZLL8auYpDHGRUxEsIYE+mjDK
         WvfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P3HLDNNp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si1983696ybi.18.2020.06.05.02.49.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 02:49:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P3HLDNNp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh8yq-0003Xt-JW
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 05:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8xX-0001rz-Hk
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 05:48:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44890
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8xW-0006is-OA
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 05:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591350497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KR6x6asC/HYUxAOydHgzfA0NWWwl9rylofm3HE79GE=;
 b=P3HLDNNpa0qp7Z36dPbJNV81Jry9Qt1aCsfRn78Vl+ymQLziSmRCOxq5cPbLMVwWFMEi7i
 +mlCQYCTgSRWd1GwUpaGqNzWl9htd+3LE4CDD+w5TauKTCfCp1aUq/an4LWIihDASZjubv
 2N1w1N7h1Y3oXYMiEYkB9+WgMNWSKEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-sLx1jlAlOB--0T_DW9qpiw-1; Fri, 05 Jun 2020 05:48:14 -0400
X-MC-Unique: sLx1jlAlOB--0T_DW9qpiw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD0BA107ACCA;
 Fri,  5 Jun 2020 09:48:12 +0000 (UTC)
Received: from localhost (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97E236606D;
 Fri,  5 Jun 2020 09:48:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 01/11] io_uring: retry io_uring_submit() if it fails with
 errno=EINTR
Date: Fri,  5 Jun 2020 10:47:40 +0100
Message-Id: <20200605094750.149957-2-stefanha@redhat.com>
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
 Laurent Vivier <lvivier@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ry6D4CO20sSh

RnJvbTogU3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPgoKQXMgcmVjZW50
bHkgZG9jdW1lbnRlZCBbMV0sIGlvX3VyaW5nX2VudGVyKDIpIHN5c2NhbGwgY2FuIHJldHVybiBh
bgplcnJvciAoZXJybm89RUlOVFIpIGlmIHRoZSBvcGVyYXRpb24gd2FzIGludGVycnVwdGVkIGJ5
IGEgZGVsaXZlcnkKb2YgYSBzaWduYWwgYmVmb3JlIGl0IGNvdWxkIGNvbXBsZXRlLgoKVGhpcyBz
aG91bGQgaGFwcGVuIHdoZW4gSU9SSU5HX0VOVEVSX0dFVEVWRU5UUyBmbGFnIGlzIHVzZWQsIGZv
cgpleGFtcGxlIGR1cmluZyBpb191cmluZ19zdWJtaXRfYW5kX3dhaXQoKSBvciBkdXJpbmcgaW9f
dXJpbmdfc3VibWl0KCkKd2hlbiBJT1JJTkdfU0VUVVBfSU9QT0xMIGlzIGVuYWJsZWQuCgpXZSBz
aG91bGRuJ3QgaGF2ZSB0aGlzIHByb2JsZW0gZm9yIG5vdywgYnV0IGl0J3MgYmV0dGVyIHRvIHBy
ZXZlbnQgaXQuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2F4Ym9lL2xpYnVyaW5nL2NvbW1pdC8z
NDQzNTVlYzY2MTlkZThmNGU2NDU4NGM5NzM2NTMwYjUzNDZlNGY0CgpTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjAw
NTE5MTMzMDQxLjExMjEzOC0xLXNnYXJ6YXJlQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU3Rl
ZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGJsb2NrL2lvX3VyaW5nLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9ibG9jay9pb191cmluZy5jIGIvYmxvY2svaW9fdXJpbmcuYwppbmRleCBhMzE0
MmNhOTg5Li45NzY1NjgxZjdjIDEwMDY0NAotLS0gYS9ibG9jay9pb191cmluZy5jCisrKyBiL2Js
b2NrL2lvX3VyaW5nLmMKQEAgLTIzMSw3ICsyMzEsNyBAQCBzdGF0aWMgaW50IGlvcV9zdWJtaXQo
THVyaW5nU3RhdGUgKnMpCiAgICAgICAgIHRyYWNlX2x1cmluZ19pb191cmluZ19zdWJtaXQocywg
cmV0KTsKICAgICAgICAgLyogUHJldmVudCBpbmZpbml0ZSBsb29wIGlmIHN1Ym1pc3Npb24gaXMg
cmVmdXNlZCAqLwogICAgICAgICBpZiAocmV0IDw9IDApIHsKLSAgICAgICAgICAgIGlmIChyZXQg
PT0gLUVBR0FJTikgeworICAgICAgICAgICAgaWYgKHJldCA9PSAtRUFHQUlOIHx8IHJldCA9PSAt
RUlOVFIpIHsKICAgICAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgICAgIH0KICAgICAg
ICAgICAgIGJyZWFrOwotLSAKMi4yNS40Cgo=

