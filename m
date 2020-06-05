Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2285228lfc;
        Fri, 5 Jun 2020 02:49:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlpPJnoa2v9mZaeCwNf66b584tHew85/NKkzvaQvX/S0CFb5NSwjKpumilRHRmoboOVCW8
X-Received: by 2002:a25:e86:: with SMTP id 128mr15938296ybo.344.1591350593827;
        Fri, 05 Jun 2020 02:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591350593; cv=none;
        d=google.com; s=arc-20160816;
        b=UdTPyDv9sJrFNv+pGH1atHXJJN5xd47hffoPjFHW0VXzebke0SjnB7PZr4YJMGKgtj
         gvqdyMywtVlRrh+KxW2WTUIzhij+RdwaxiPvTjSdXlee2aXVYkKu5QOUN/rHAfda95AD
         geNVvhLzrrx20GbhglupsvSPNbwdP/V8V1xcoUbr/FlvmXJS8WLSvgOP1GytJHrVPcRA
         1PPEEy2ccv+EBjPGRgbGeKNdlR6d8Km8GxWqe2l8vRnsyEfKibF54Dz8KStYd/7ygWnp
         rFkAGFVjfjyqR8Bi+cJvug42cMjJJ8YAW+/OnVviuKyUYRmeetbzuiswnRWq0vM/cLVO
         arKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VT8da6AO0t3JbXMrqxhySw6haON/9sHK8mDulmzRzk8=;
        b=neqnpB4/SMVLHr0fj86VRqGaZChsZdsTcwlCxgaTadRVqvXqfsrgNSgpC6s01Qn0Il
         GPoym+iuXxN2z3T0VjmoPRopJN+ADsHwfs2SnbL0P9PbyKR9IN9mpr3r6moQzqx7Vma8
         5U7syNkT7d7uLiaQKoi5DO+lteV8IZC7oP/Zj/i6LWYM1bIHJshNo8GhkEbKQT29tXea
         xpZmU69z9+F3+UUKyzb4OV87Th+9xr6qfXfU29iR83sDeV4Ju+tI47Oiuw4s30QkiBNY
         DBGUPdLDPOHrZWfEInQIWasK/JV97qU1bXz3MI/9OCosIeUL3y7f8crA+ouq4FXxYEsd
         JXCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Md8vlXhJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si6463298ybj.476.2020.06.05.02.49.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 02:49:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Md8vlXhJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh8z3-00047t-3u
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 05:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8xg-00026m-Jh
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 05:48:29 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41126
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jh8xf-0006jl-KK
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 05:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591350507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VT8da6AO0t3JbXMrqxhySw6haON/9sHK8mDulmzRzk8=;
 b=Md8vlXhJi/Xv+USq8VkAd3bEXNwvkq/+z9Xlx81yd0inSLwm4rGu2fBWnabrKamN/upz7c
 Egtf+QZBg+hP8G2kHNtvId73g4nY1vVw2xroWsGwPXT1iU0gI+sY7cTX9HpIHd6Hw91gGq
 +QOszKcHoyYDaCH0ujlI6rlUBcYVOdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-gruerc9LONKKiTe-3kXvGA-1; Fri, 05 Jun 2020 05:48:24 -0400
X-MC-Unique: gruerc9LONKKiTe-3kXvGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFB38872FE0;
 Fri,  5 Jun 2020 09:48:22 +0000 (UTC)
Received: from localhost (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78D5F5C3F8;
 Fri,  5 Jun 2020 09:48:14 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 02/11] io_uring: use io_uring_cq_ready() to check for ready cqes
Date: Fri,  5 Jun 2020 10:47:41 +0100
Message-Id: <20200605094750.149957-3-stefanha@redhat.com>
In-Reply-To: <20200605094750.149957-1-stefanha@redhat.com>
References: <20200605094750.149957-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=205.139.110.61; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:35:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: xPBcSOn8McBx

RnJvbTogU3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPgoKSW4gcWVtdV9s
dXJpbmdfcG9sbF9jYigpIHdlIGFyZSBub3QgdXNpbmcgdGhlIGNxZSBwZWVrZWQgZnJvbSB0aGUK
Q1EgcmluZy4gV2UgYXJlIHVzaW5nIGlvX3VyaW5nX3BlZWtfY3FlKCkgb25seSB0byBzZWUgaWYg
dGhlcmUKYXJlIGNxZXMgcmVhZHksIHNvIHdlIGNhbiByZXBsYWNlIGl0IHdpdGggaW9fdXJpbmdf
Y3FfcmVhZHkoKS4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gR2FyemFyZWxsYSA8c2dhcnphcmVA
cmVkaGF0LmNvbT4KTWVzc2FnZS1pZDogMjAyMDA1MTkxMzQ5NDIuMTE4MTc4LTEtc2dhcnphcmVA
cmVkaGF0LmNvbQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhh
dC5jb20+Ci0tLQogYmxvY2svaW9fdXJpbmcuYyB8IDkgKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jsb2NrL2lv
X3VyaW5nLmMgYi9ibG9jay9pb191cmluZy5jCmluZGV4IDk3NjU2ODFmN2MuLjAzN2FmMDk0NzEg
MTAwNjQ0Ci0tLSBhL2Jsb2NrL2lvX3VyaW5nLmMKKysrIGIvYmxvY2svaW9fdXJpbmcuYwpAQCAt
Mjc3LDEzICsyNzcsMTAgQEAgc3RhdGljIHZvaWQgcWVtdV9sdXJpbmdfY29tcGxldGlvbl9jYih2
b2lkICpvcGFxdWUpCiBzdGF0aWMgYm9vbCBxZW11X2x1cmluZ19wb2xsX2NiKHZvaWQgKm9wYXF1
ZSkKIHsKICAgICBMdXJpbmdTdGF0ZSAqcyA9IG9wYXF1ZTsKLSAgICBzdHJ1Y3QgaW9fdXJpbmdf
Y3FlICpjcWVzOwogCi0gICAgaWYgKGlvX3VyaW5nX3BlZWtfY3FlKCZzLT5yaW5nLCAmY3Flcykg
PT0gMCkgewotICAgICAgICBpZiAoY3FlcykgewotICAgICAgICAgICAgbHVyaW5nX3Byb2Nlc3Nf
Y29tcGxldGlvbnNfYW5kX3N1Ym1pdChzKTsKLSAgICAgICAgICAgIHJldHVybiB0cnVlOwotICAg
ICAgICB9CisgICAgaWYgKGlvX3VyaW5nX2NxX3JlYWR5KCZzLT5yaW5nKSkgeworICAgICAgICBs
dXJpbmdfcHJvY2Vzc19jb21wbGV0aW9uc19hbmRfc3VibWl0KHMpOworICAgICAgICByZXR1cm4g
dHJ1ZTsKICAgICB9CiAKICAgICByZXR1cm4gZmFsc2U7Ci0tIAoyLjI1LjQKCg==

