Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp465118lfq;
        Wed, 23 Sep 2020 06:34:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL9srB0e2enRP+2blFsgdjMknXNT3BZF0+2DkL/kRRAFi66XYj3YxuisfofQQu+wCzgEDB
X-Received: by 2002:a17:906:d14e:: with SMTP id br14mr9589941ejb.299.1600868043682;
        Wed, 23 Sep 2020 06:34:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600868043; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZIwi6GdtqbpsHWUmtevegJRC0i5zaVk01ZlaVC/QqeUqce0XTXtHsHvZDTAswKAr+H
         2NxTMZQEkDZlJ7iYcIE3z4SmZQ+kHDM5BmTfvI1UP9PFLIropJiozuihKkfeScpZDNAf
         WEflqryEwtfAEV/9DFCxC3udslUgxiea0Fx/j78uWR+e3o9bvqcWJzj8OekcztP5v7Pm
         iDOE22uErAiPAynB+FaZ96Twg/ZuiaDYWlt0MXGer9t3VcuSpl9tEsTZxgcz0FDa4q7x
         pHvSatfpqNho2xackH9n+1xCG0SNm5fiejQsfzt14AVXKZQEOYH9dHSCKCkyVRix7i5M
         llfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:date:cc:to:from:content-transfer-encoding
         :mime-version:in-reply-to:reply-to:message-id:subject;
        bh=wgjEoKKIPW39YLGd7dVSrfRfaSpzJ8Lq/ZB3wp5qV3Y=;
        b=jdx0V42hnyz+AJ5pb7lvDI2zDJ6wI9NNCycsxPP69b2Nn3QWZiPiGn6KRSbgEGpZXG
         /xAiM+QMcqTY4rh/aBHD2rPqx1/3EFQxFMSbpccaoShRgb4AaiWaZ23PPDKxMfrhCwq9
         bNzHf0mqmVEsZlHZUUWKZEn6fa6S3nidf5gj1YBx/ieJ5LFpJoO8HHds3EDlodMAlF+n
         tD8edypxQnHh2Xu7Po7TMGsZpSpaP23V6T2lhfCXRM/mSwxWqIi52ADDRn1mKRqNYGSg
         9bJFZO27ud786mGUQdAIZuXBMCIs5sEt04qiXTxmGWy6JaJrSG1EGFPu7kPXwquuosUY
         NSzQ==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id ot13si12422827ejb.450.2020.09.23.06.34.03;
        Wed, 23 Sep 2020 06:34:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgIWNeC (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 23 Sep 2020 09:34:02 -0400
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21786 "EHLO
        sender4-of-o57.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWNeC (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 23 Sep 2020 09:34:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600867869; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=hOPbalz+924nwX7u/fCcnt84gKBxTzhkrkefSivsP/mo1jnzwYNPoIaGIa46vskJ7EU8892fQruLGpIWQTSmUvpcES07aDtswotzw2i7GzxdKZtIi20zlaXs0qHi22Z2k2MB/luqPe7eyUM3b7C/BiqAr4X+KP/VJxOV4J1ZjUk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1600867869; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
        bh=wgjEoKKIPW39YLGd7dVSrfRfaSpzJ8Lq/ZB3wp5qV3Y=; 
        b=aL05O1Ar+5G8z41iXkDKEsTlDsvVEsPZhnWkivsV16g6SKlnwNhQ8kqiMyz2esV5DtNMkSWclB82PpQdPAgOwza0Pv/QnxgmqT0+Fc4rpwC/4O+VozYJzwUdVuiYCBZeh9vuyZlNNiEiKt9Za7CA8rkWyQDe1wHFVWrXdlqi8I8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        spf=pass  smtp.mailfrom=no-reply@patchew.org;
        dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
        with SMTPS id 1600867867067116.39173813725745; Wed, 23 Sep 2020 06:31:07 -0700 (PDT)
Subject: Re: [PATCH v3] qemu/atomic.h: rename atomic_ to qatomic_
Message-ID: <160086786042.23158.9195634797275870291@66eaa9a8a123>
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20200923105646.47864-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
From:   no-reply@patchew.org
To:     stefanha@redhat.com
Cc:     qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com, jsnow@redhat.com,
        Alistair.Francis@wdc.com, pasic@linux.ibm.com,
        mjrosato@linux.ibm.com, peter.maydell@linaro.org,
        eblake@redhat.com, armbru@redhat.com, kraxel@redhat.com,
        sheepdog@lists.wpkg.org, ysato@users.sourceforge.jp,
        berrange@redhat.com, thuth@redhat.com, kvm@vger.kernel.org,
        paul@xen.org, qemu-s390x@nongnu.org, mst@redhat.com,
        dgilbert@redhat.com, aurelien@aurel32.net,
        aleksandar.qemu.devel@gmail.com, sw@weilnetz.de,
        qemu-riscv@nongnu.org, qemu-block@nongnu.org,
        zhang.zhanghailiang@huawei.com, jcmvbkbc@gmail.com,
        borntraeger@de.ibm.com, berto@igalia.com, kwolf@redhat.com,
        pl@kamp.de, pbonzini@redhat.com, marcandre.lureau@redhat.com,
        jiaxun.yang@flygoat.com, laurent@vivier.eu,
        anthony.perard@citrix.com, yuval.shaia.ml@gmail.com,
        xen-devel@lists.xenproject.org, chenhc@lemote.com,
        sunilmut@microsoft.com, kbastian@mail.uni-paderborn.de,
        quintela@redhat.com, cohuck@redhat.com, mreitz@redhat.com,
        rth@twiddle.net, jslaby@suse.cz, marcel.apfelbaum@gmail.com,
        sagark@eecs.berkeley.edu, namei.unix@gmail.com,
        jasowang@redhat.com, palmer@dabbelt.com,
        aleksandar.rikalo@syrmia.com, sstabellini@kernel.org,
        fam@euphon.net, david@redhat.com, ehabkost@redhat.com,
        stefanha@redhat.com, qemu-arm@nongnu.org
Date:   Wed, 23 Sep 2020 06:31:07 -0700 (PDT)
X-ZohoMailClient: External
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Vj5d/81xugS7

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkyMzEwNTY0Ni40Nzg2
NC0xLXN0ZWZhbmhhQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIwMDkyMzEwNTY0Ni40Nzg2
NC0xLXN0ZWZhbmhhQHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIHYzXSBxZW11L2F0b21pYy5o
OiByZW5hbWUgYXRvbWljXyB0byBxYXRvbWljXwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0K
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBU
IEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMz
ODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1
cGRhdGVdICAgICAgcGF0Y2hldy8yMDIwMDkyMjIxMDEwMS40MDgxMDczLTEtanNub3dAcmVkaGF0
LmNvbSAtPiBwYXRjaGV3LzIwMjAwOTIyMjEwMTAxLjQwODEwNzMtMS1qc25vd0ByZWRoYXQuY29t
CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMDA5MjMxMTM5MDAuNzI3MTgtMS1kYXZp
ZEByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMDA5MjMxMTM5MDAuNzI3MTgtMS1kYXZpZEByZWRo
YXQuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMDA5MjMxMzE4MjkuMzg0OS0x
LWVyaWNoLm1jbWlsbGFuQGhwLmNvbSAtPiBwYXRjaGV3LzIwMjAwOTIzMTMxODI5LjM4NDktMS1l
cmljaC5tY21pbGxhbkBocC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwowN2Fi
YjhlIHFlbXUvYXRvbWljLmg6IHJlbmFtZSBhdG9taWNfIHRvIHFhdG9taWNfCgo9PT0gT1VUUFVU
IEJFR0lOID09PQpFUlJPUjogTWFjcm9zIHdpdGggbXVsdGlwbGUgc3RhdGVtZW50cyBzaG91bGQg
YmUgZW5jbG9zZWQgaW4gYSBkbyAtIHdoaWxlIGxvb3AKIzI3OTc6IEZJTEU6IGluY2x1ZGUvcWVt
dS9hdG9taWMuaDoxNTI6CisjZGVmaW5lIHFhdG9taWNfcmN1X3JlYWRfX25vY2hlY2socHRyLCB2
YWxwdHIpICAgICAgICAgICBcCisgICAgX19hdG9taWNfbG9hZChwdHIsIHZhbHB0ciwgX19BVE9N
SUNfUkVMQVhFRCk7ICAgICAgICBcCiAgICAgc21wX3JlYWRfYmFycmllcl9kZXBlbmRzKCk7CgpF
UlJPUjogc3BhY2UgcmVxdWlyZWQgYmVmb3JlIHRoYXQgJyonIChjdHg6VnhCKQojMjk0MjogRklM
RTogaW5jbHVkZS9xZW11L2F0b21pYy5oOjMzMzoKKyNkZWZpbmUgcWF0b21pY19yZWFkX19ub2No
ZWNrKHApICAgKCooX190eXBlb2ZfXygqKHApKSB2b2xhdGlsZSopIChwKSkKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCkVS
Uk9SOiBVc2Ugb2Ygdm9sYXRpbGUgaXMgdXN1YWxseSB3cm9uZywgcGxlYXNlIGFkZCBhIGNvbW1l
bnQKIzI5NDI6IEZJTEU6IGluY2x1ZGUvcWVtdS9hdG9taWMuaDozMzM6CisjZGVmaW5lIHFhdG9t
aWNfcmVhZF9fbm9jaGVjayhwKSAgICgqKF9fdHlwZW9mX18oKihwKSkgdm9sYXRpbGUqKSAocCkp
CgpFUlJPUjogc3BhY2UgcmVxdWlyZWQgYmVmb3JlIHRoYXQgJyonIChjdHg6VnhCKQojMjk0Mzog
RklMRTogaW5jbHVkZS9xZW11L2F0b21pYy5oOjMzNDoKKyNkZWZpbmUgcWF0b21pY19zZXRfX25v
Y2hlY2socCwgaSkgKCgqKF9fdHlwZW9mX18oKihwKSkgdm9sYXRpbGUqKSAocCkpID0gKGkpKQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KCkVSUk9SOiBVc2Ugb2Ygdm9sYXRpbGUgaXMgdXN1YWxseSB3cm9uZywgcGxlYXNl
IGFkZCBhIGNvbW1lbnQKIzI5NDM6IEZJTEU6IGluY2x1ZGUvcWVtdS9hdG9taWMuaDozMzQ6Cisj
ZGVmaW5lIHFhdG9taWNfc2V0X19ub2NoZWNrKHAsIGkpICgoKihfX3R5cGVvZl9fKCoocCkpIHZv
bGF0aWxlKikgKHApKSA9IChpKSkKCkVSUk9SOiBzcGFjZSByZXF1aXJlZCBhZnRlciB0aGF0ICcs
JyAoY3R4OlZ4VikKIzI5NDg6IEZJTEU6IGluY2x1ZGUvcWVtdS9hdG9taWMuaDozMzc6CisjZGVm
aW5lIHFhdG9taWNfc2V0KHB0ciwgaSkgICAgIHFhdG9taWNfc2V0X19ub2NoZWNrKHB0cixpKQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
CgpFUlJPUjogbWVtb3J5IGJhcnJpZXIgd2l0aG91dCBjb21tZW50CiMzMDIwOiBGSUxFOiBpbmNs
dWRlL3FlbXUvYXRvbWljLmg6Mzk1OgorI2RlZmluZSBxYXRvbWljX3hjaGcocHRyLCBpKSAgICAo
c21wX21iKCksIF9fc3luY19sb2NrX3Rlc3RfYW5kX3NldChwdHIsIGkpKQoKV0FSTklORzogQmxv
Y2sgY29tbWVudHMgdXNlIGEgbGVhZGluZyAvKiBvbiBhIHNlcGFyYXRlIGxpbmUKIzMwOTQ6IEZJ
TEU6IGluY2x1ZGUvcWVtdS9hdG9taWMuaDo0NDc6CisvKiBxYXRvbWljX21iX3JlYWQvc2V0IHNl
bWFudGljcyBtYXAgSmF2YSB2b2xhdGlsZSB2YXJpYWJsZXMuIFRoZXkgYXJlCgpXQVJOSU5HOiBC
bG9jayBjb21tZW50cyB1c2UgYSBsZWFkaW5nIC8qIG9uIGEgc2VwYXJhdGUgbGluZQojNjE3Nzog
RklMRTogdXRpbC9iaXRtYXAuYzoyMTQ6CisgICAgICAgIC8qIElmIHdlIGF2b2lkZWQgdGhlIGZ1
bGwgYmFycmllciBpbiBxYXRvbWljX29yKCksIGlzc3VlIGEKCldBUk5JTkc6IEJsb2NrIGNvbW1l
bnRzIHVzZSBhIGxlYWRpbmcgLyogb24gYSBzZXBhcmF0ZSBsaW5lCiM3MTkyOiBGSUxFOiB1dGls
L3JjdS5jOjg1OgorICAgICAgICAvKiBJbnN0ZWFkIG9mIHVzaW5nIHFhdG9taWNfbWJfc2V0IGZv
ciBpbmRleC0+d2FpdGluZywgYW5kCgpXQVJOSU5HOiBCbG9jayBjb21tZW50cyB1c2UgYSBsZWFk
aW5nIC8qIG9uIGEgc2VwYXJhdGUgbGluZQojNzIxODogRklMRTogdXRpbC9yY3UuYzoxNTQ6Cisg
ICAgICAgIC8qIEluIGVpdGhlciBjYXNlLCB0aGUgcWF0b21pY19tYl9zZXQgYmVsb3cgYmxvY2tz
IHN0b3JlcyB0aGF0IGZyZWUKCnRvdGFsOiA3IGVycm9ycywgNCB3YXJuaW5ncywgNjI2NyBsaW5l
cyBjaGVja2VkCgpDb21taXQgMDdhYmI4ZTc5ZGJlIChxZW11L2F0b21pYy5oOiByZW5hbWUgYXRv
bWljXyB0byBxYXRvbWljXykgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBF
TkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBp
cyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDA5MjMxMDU2NDYuNDc4
NjQtMS1zdGVmYW5oYUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdl
LgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9w
YXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxA
cmVkaGF0LmNvbQ==
