Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2479930lfi;
        Mon, 30 Mar 2020 01:47:10 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtr2ppTEOqllJGpN4RrGjz1DEK/H0cgZWtl4Hj1C+GsuD073iI0sMICNnhdj/M6o7P2Z0W0
X-Received: by 2002:a0c:eccc:: with SMTP id o12mr10673060qvq.223.1585558030842;
        Mon, 30 Mar 2020 01:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585558030; cv=none;
        d=google.com; s=arc-20160816;
        b=HbxVFPmWP0xFCERZEm9mthrt8WQPhQEKsqfMLu9tkhpw+Nok1ArAn/Ag1A2TrNcftF
         mmsgZiLp26uaZBB9pwr4e17ZtfWAVebnJ3js0pU3Pj7nlzK7YvH/8lG7RHNWpUztHXN/
         qdj8+iTAgC2gh5fNb0hXnbrgUmLFq9vtLPUOTqw7Bx0cCGSRwyTeggz2QbmWIh+EWpPD
         LXjrrin9tsNtjDAoHHK+3T9EAr1LHJGpWKrC0yq8Qf7M3TCfQOyGg38O61/5wmmm591v
         vRZD9Oa5K577j/HrVeM7nimodtFibGRwgpIh0eKQfZz2RUbb8Hk7WNM8BbH/AQcoSogH
         kCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cep/nkTv6eSZVEa2H/mUbuoGJtkfpqBE1V0DqIr4Jhc=;
        b=DpW007ElL9DnW9OZTaTlTcTrRymeFzqw6mdJ8Te/AHc5bdNryEi8bgNnRIK+Lyrhuq
         GfI02SbgdRjTaaJ1b3sZvWEMfEAryd0q8znoHxYYTVqUqfSj90smvUeCMPIkpwoZ7v9+
         /FWcj/CIv8Op0AefUB/mz8nr4xA5MXazXoWlnmBc0ec5zeItgZUuCNpW6x4rsTfpXsE2
         oM4GeKsoZx3qn9N4FsTQWBKyvMVqzpuWW3Uevj2BHjURQ8jFtwNVck2Rp0Gf6RxpZL4i
         M4HzEkZQ7PViDi/M0HuRLVkutT/wCEHLf1HIeJcocl5JjlZsvU2bX67duZ6pyntV4MFV
         bprg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=hR+egNjQ;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id v11si7262673qvs.190.2020.03.30.01.47.10;
        Mon, 30 Mar 2020 01:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=hR+egNjQ;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 81D3D4B16A;
	Mon, 30 Mar 2020 04:47:10 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30AXwuALUohJ; Mon, 30 Mar 2020 04:47:09 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8C43F4B22C;
	Mon, 30 Mar 2020 04:47:09 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 1FE3A4B0E6
 for <kvmarm@lists.cs.columbia.edu>; Mon, 30 Mar 2020 04:47:09 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kv6bfOvD3+Tn for <kvmarm@lists.cs.columbia.edu>;
 Mon, 30 Mar 2020 04:47:08 -0400 (EDT)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 3F7F54B22A
 for <kvmarm@lists.cs.columbia.edu>; Mon, 30 Mar 2020 04:47:08 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585558028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V3toyHtdmIDsvhTBATPytSTJjTPkQkswWc1NSEnUkCA=;
 b=hR+egNjQzEk5eifKHk07jk7VBWeFrgqXvYq7fKYtQxX+NcCd1OAIA2ZbklLrKxR0+xF/2r
 +r8JI78ntq5vGu563DNqQHsqN/Mc48Vn/L6vP6tqzOjv+4gjFT3DJXuvSPlYbkxNgKhmQv
 YoHNspxR8+4DWiuOtqbVU69fRIyPg3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-PV9z_La-NdqheXia0TXc2w-1; Mon, 30 Mar 2020 04:47:05 -0400
X-MC-Unique: PV9z_La-NdqheXia0TXc2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 427BD1937FC0;
 Mon, 30 Mar 2020 08:47:04 +0000 (UTC)
Received: from [10.36.112.58] (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C33CE19925;
 Mon, 30 Mar 2020 08:46:58 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v7 06/13] arm/arm64: ITS: Introspection
 tests
To: Zenghui Yu <yuzenghui@huawei.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
 <20200320092428.20880-7-eric.auger@redhat.com>
 <947a79f5-1f79-532b-9ec7-6fd539ccd183@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8878be7f-7653-b427-cd0d-722f82fb6b65@redhat.com>
Date: Mon, 30 Mar 2020 10:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <947a79f5-1f79-532b-9ec7-6fd539ccd183@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: kvm@vger.kernel.org, maz@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, andre.przywara@arm.com, thuth@redhat.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: IdKB0rKOav8g

SGkgWmVuZ2h1aSwKCk9uIDMvMzAvMjAgMTA6MzAgQU0sIFplbmdodWkgWXUgd3JvdGU6Cj4gSGkg
RXJpYywKPiAKPiBPbiAyMDIwLzMvMjAgMTc6MjQsIEVyaWMgQXVnZXIgd3JvdGU6Cj4+ICtzdGF0
aWMgdm9pZCBpdHNfY21kX3F1ZXVlX2luaXQodm9pZCkKPj4gK3sKPj4gK8KgwqDCoCB1bnNpZ25l
ZCBsb25nIG9yZGVyID0gZ2V0X29yZGVyKFNaXzY0SyA+PiBQQUdFX1NISUZUKTsKPj4gK8KgwqDC
oCB1NjQgY2Jhc2VyOwo+PiArCj4+ICvCoMKgwqAgaXRzX2RhdGEuY21kX2Jhc2UgPSAodm9pZCAq
KXZpcnRfdG9fcGh5cyhhbGxvY19wYWdlcyhvcmRlcikpOwo+IAo+IFNob3VsZG4ndCB0aGUgY21k
X2Jhc2UgKGFuZCB0aGUgY21kX3dyaXRlKSBiZSBzZXQgYXMgYSBHVkE/CnllcyBpdCBzaG91bGQK
PiAKPiBPdGhlcndpc2UgSSB0aGluayB3ZSB3aWxsIGVuZC11cCB3aXRoIG1lbW9yeSBjb3JydXB0
aW9uIHdoZW4gd3JpdGluZwo+IHRoZSBjb21tYW5kIHF1ZXVlLsKgIEJ1dCBpdCBzZWVtcyB0aGF0
IGV2ZXJ5dGhpbmcganVzdCB3b3JrcyBmaW5lIC4uLgo+IFNvIEknbSByZWFsbHkgY29uZnVzZWQg
aGVyZSA6LS8KSSB3YXMgdG9sZCBieSBQYW9sbyB0aGF0IHRoZSBWQS9QQSBtZW1vcnkgbWFwIGlz
IGZsYXQgaW4ga3ZtdW5pdCB0ZXN0LgoKPiAKPj4gKwo+PiArwqDCoMKgIGNiYXNlciA9ICgodTY0
KWl0c19kYXRhLmNtZF9iYXNlIHwgKFNaXzY0SyAvIFNaXzRLIC0gMSnCoMKgwqAgfAo+PiBHSVRT
X0NCQVNFUl9WQUxJRCk7Cj4+ICsKPj4gK8KgwqDCoCB3cml0ZXEoY2Jhc2VyLCBpdHNfZGF0YS5i
YXNlICsgR0lUU19DQkFTRVIpOwo+PiArCj4+ICvCoMKgwqAgaXRzX2RhdGEuY21kX3dyaXRlID0g
aXRzX2RhdGEuY21kX2Jhc2U7Cj4+ICvCoMKgwqAgd3JpdGVxKDAsIGl0c19kYXRhLmJhc2UgKyBH
SVRTX0NXUklURVIpOwo+PiArfQo+IAo+IE90aGVyd2lzZSB0aGlzIGxvb2tzIGdvb2QsCj4gUmV2
aWV3ZWQtYnk6IFplbmdodWkgWXUgPHl1emVuZ2h1aUBodWF3ZWkuY29tPgpUaGFua3MhCgpFcmlj
Cj4gCj4gCj4gVGhhbmtzCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwprdm1hcm0gbWFpbGluZyBsaXN0Cmt2bWFybUBsaXN0cy5jcy5jb2x1bWJpYS5l
ZHUKaHR0cHM6Ly9saXN0cy5jcy5jb2x1bWJpYS5lZHUvbWFpbG1hbi9saXN0aW5mby9rdm1hcm0K
