Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp918518wrt;
        Wed, 20 Mar 2019 09:29:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpUAWaMjgt74E6Q07FsbRVBY1F5IfcWjxWE0sy8Nbv9awT7MYV3B4B7McOktn71UNsAWTo
X-Received: by 2002:a0c:9e9a:: with SMTP id r26mr7328495qvd.57.1553099359502;
        Wed, 20 Mar 2019 09:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553099359; cv=none;
        d=google.com; s=arc-20160816;
        b=PxKQzsFkGi2bHM2JEPgsz4lbjdKAAg3NBcb/jIaTkqg83V7noR1gLad50IxIwnrBBE
         NKjdBxTAsx0yZMOCtmCsDeXkiLipfZ2NPH4WJG271RZaeYrFl6tFQDOSaekNNutyFjPE
         cHmHQF8n4KwGbtijivsDW7Qug/mcQ44WWS4XOsIUKYMIJB1Qtvt2uHY+m8z4P/Twghlj
         H8m07PwcVgJpeJLNILw/tJKl8XpLEH+ic5uyKKwbVCehtRUqF41GDU+bMXvJbpnqRjXG
         IcakWWcSYisL7Wc0qocYkfiYASYHhKfSKSBNqkoa4ur15BUPjb9rsPiJ0gso53oXnG4+
         gIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=V6+A7QDM2DboNBghLwsydpSNsEWEJzMhM9OkYgU1CYE=;
        b=bTmKIcFmDGh+2TKWgg21tEAyp9bTNZFoyWu5tzIbvrRSmnXMF79vwZ6X0No7aWyzgF
         Ncsc0LcURQgTq4kTgz3pMIrTPpDItDM7C88XN0KSiWNW/McfzwoOZ5ck56mNBoDQavZq
         bOmY0+hL8CwIQiT0GLRjvkohZnLD+h7+GlH1IgMfscLBF7vFhG7Q6UaffwDPCKDPEFrM
         Mii3loCQuaDScz+jCTk781Aph4PIWc07MDH9hL/Z35NEHfJ9xs+X0GAlAyRQQliBpb8U
         pD3gNG6leKoEPBnD2QGHOtNeAyAzooQ1A1ufj6fA5//oPsBnmnrOMz9aJcMGcXJOw2rZ
         UyUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 58si1062096qtr.13.2019.03.20.09.29.18;
        Wed, 20 Mar 2019 09:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id BE8FF4A3A5;
	Wed, 20 Mar 2019 12:29:18 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHTT4CVTAdwd; Wed, 20 Mar 2019 12:29:17 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 7E1294A36D;
	Wed, 20 Mar 2019 12:29:17 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id B5F274A332
 for <kvmarm@lists.cs.columbia.edu>; Wed, 20 Mar 2019 12:29:16 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W+POLuPsf0JS for <kvmarm@lists.cs.columbia.edu>;
 Wed, 20 Mar 2019 12:29:15 -0400 (EDT)
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 4FD2B40A52
 for <kvmarm@lists.cs.columbia.edu>; Wed, 20 Mar 2019 12:29:15 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B27A1650;
 Wed, 20 Mar 2019 09:29:14 -0700 (PDT)
Received: from [10.1.196.69] (e112269-lin.cambridge.arm.com [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8727C3F614;
 Wed, 20 Mar 2019 09:29:13 -0700 (PDT)
Subject: Re: [RFC] arm/cpu: fix soft lockup panic after resuming from stop
To: Heyi Guo <guoheyi@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>
References: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
 <CAFEAcA-29Q-sTg2wLre0GJJCr2gfu89rg0vuTOf7cW5drE4d7Q@mail.gmail.com>
 <136f773f-9b08-a39b-3ecb-2c00ff290b49@arm.com>
 <22f57e8a-bdb0-ffeb-ab78-3e9e41cac66b@arm.com>
 <20190315085948.GB10950@e113682-lin.lund.arm.com>
 <ff1db661-13c2-50ff-940e-4a1d71bd0309@huawei.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <101c5f17-9811-e2d0-ff3c-a0e64beee921@arm.com>
Date: Wed, 20 Mar 2019 16:29:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <ff1db661-13c2-50ff-940e-4a1d71bd0309@huawei.com>
Content-Language: en-GB
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, kvmarm@lists.cs.columbia.edu
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
X-TUID: NsdvjVIa3ULT

T24gMTkvMDMvMjAxOSAxNDozOSwgSGV5aSBHdW8gd3JvdGU6Cj4gSGkgQ2hyaXN0b2ZmZXIgYW5k
IFN0ZXZlLAo+IAo+IAo+IE9uIDIwMTkvMy8xNSAxNjo1OSwgQ2hyaXN0b2ZmZXIgRGFsbCB3cm90
ZToKPj4gSGkgU3RldmUsCj4+Cj4+IE9uIFdlZCwgTWFyIDEzLCAyMDE5IGF0IDEwOjExOjMwQU0g
KzAwMDAsIFN0ZXZlbiBQcmljZSB3cm90ZToKPj4+IFBlcnNvbmFsbHkgSSB0aGluayB3aGF0IHdl
IG5lZWQgaXM6Cj4+Pgo+Pj4gKiBFaXRoZXIgYSBwYXRjaCBsaWtlIHRoZSBvbmUgZnJvbSBIZXlp
IEd1byAoc2F2ZS9yZXN0b3JlIENOVFZDVF9FTDApIG9yCj4+PiBhbHRlcm5hdGl2ZWx5IGhvb2tp
bmcgdXAgS1ZNX0tWTUNMT0NLX0NUUkwgdG8gcHJldmVudCB0aGUgd2F0Y2hkb2cKPj4+IGZpcmlu
ZyB3aGVuIHVzZXIgc3BhY2UgZXhwbGljaXRseSBzdG9wcyBzY2hlZHVsaW5nIHRoZSBndWVzdCBm
b3IgYQo+Pj4gd2hpbGUuCj4+IElmIHdlIHNhdmUvcmVzdG9yZSBDTlRWQ1RfRUwwIGFuZCB0aGUg
d2FybmluZyBnb2VzIGF3YXksIGRvZXMgdGhlIGd1ZXN0Cj4+IHdhbGwgY2xvY2sgdGltZWtlZXBp
bmcgZ2V0IGFsbCBjb25mdXNlZCBhbmQgZG9lcyBpdCBmaWd1cmUgdGhpcyBvdXQKPj4gYXV0b21h
Z2ljYWxseSBzb21laG93Pwo+IFdoYXQncyB0aGUgc291cmNlIGZvciBndWVzdCB3YWxsIGNsb2Nr
IHRpbWVrZWVwaW5nIGluIGN1cnJlbnQgQVJNNjQKPiBpbXBsZW1lbnRhdGlvbj8gSXMgaXQgdGhl
IHZhbHVlIGZyb20gQ05UUF9UVkFMX0VMMD8gV2lsbCBndWVzdCBPUyBrZWVwCj4gdHJhY2sgb2Yg
dGhpcz8gT3IgaXMgdGhlIHdhbGwgY2xvY2sgc2ltcGx5IHBsYXRmb3JtIFJUQz8KPiAKPiBJIHRl
c3RlZCB0aGUgUkZDIGNoYW5nZSBhbmQgZGlkIG5vdCBzZWUgYW55dGhpbmcgdW51c3VhbC4gRGlk
IEkgbWlzcwo+IHNvbWV0aW5nPwoKQXJlIHlvdSBydW5uaW5nIEFSTSBvciBBUk02ND8gSSdtIGFz
c3VtaW5nIEFSTTY0IGhlcmUuLi4KClVubGVzcyBJJ20gbWlzdGFrZW4geW91IHNob3VsZCBzZWUg
dGhlIHRpbWUgcmVwb3J0ZWQgYnkgdGhlIGd1ZXN0IG5vdApwcm9ncmVzcyB3aGVuIHlvdSBoYXZl
IHN0b3BwZWQgaXQgdXNpbmcgdGhlIFFFTVUgbW9uaXRvciBjb25zb2xlLgoKUnVubmluZyBzb21l
dGhpbmcgbGlrZSAid2hpbGUgL2Jpbi90cnVlOyBkbyBkYXRlOyBzbGVlcCAxOyBkb25lIiBzaG91
bGQKYWxsb3cgeW91IHRvIHNlZSB0aGF0IHdpdGhvdXQgdGhlIHBhdGNoIHRpbWUgd2lsbCBqdW1w
IGluIHRoZSBndWVzdAooaS5lLiB0aGUgdGltZSByZWZsZWN0cyB3YWxsLWNsb2NrIHRpbWUpLiBX
aXRoIHRoZSBwYXRjaCBJIGJlbGlldmUgaXQKd2lsbCBub3QganVtcCAoaS5lLiB0aGUgY2xvY2sg
d2lsbCBiZSBiZWhpbmQgd2FsbC1jbG9jayB0aW1lIGFmdGVyIHRoZQpwYXVzZSkuCgpIb3dldmVy
LCB0aGlzIGJlaGF2aW91ciBkb2VzIGRlcGVuZCBvbiB0aGUgZXhhY3Qgc3lzdGVtIGJlaW5nIGVt
dWxhdGVkLgpGcm9tIGRyaXZlcnMvY2xvY2tzb3VyY2UvYXJtX2FyY2hfdGltZXIuYzoKCj4gc3Rh
dGljIHZvaWQgX19pbml0IGFyY2hfY291bnRlcl9yZWdpc3Rlcih1bnNpZ25lZCB0eXBlKQo+IHsK
PiAJdTY0IHN0YXJ0X2NvdW50Owo+IAo+IAkvKiBSZWdpc3RlciB0aGUgQ1AxNSBiYXNlZCBjb3Vu
dGVyIGlmIHdlIGhhdmUgb25lICovCj4gCWlmICh0eXBlICYgQVJDSF9USU1FUl9UWVBFX0NQMTUp
IHsKPiAJCWlmICgoSVNfRU5BQkxFRChDT05GSUdfQVJNNjQpICYmICFpc19oeXBfbW9kZV9hdmFp
bGFibGUoKSkgfHwKPiAJCSAgICBhcmNoX3RpbWVyX3VzZXNfcHBpID09IEFSQ0hfVElNRVJfVklS
VF9QUEkpCj4gCQkJYXJjaF90aW1lcl9yZWFkX2NvdW50ZXIgPSBhcmNoX2NvdW50ZXJfZ2V0X2Nu
dHZjdDsKPiAJCWVsc2UKPiAJCQlhcmNoX3RpbWVyX3JlYWRfY291bnRlciA9IGFyY2hfY291bnRl
cl9nZXRfY250cGN0Owo+IAo+IAkJY2xvY2tzb3VyY2VfY291bnRlci5hcmNoZGF0YS52ZHNvX2Rp
cmVjdCA9IHZkc29fZGVmYXVsdDsKPiAJfSBlbHNlIHsKPiAJCWFyY2hfdGltZXJfcmVhZF9jb3Vu
dGVyID0gYXJjaF9jb3VudGVyX2dldF9jbnR2Y3RfbWVtOwo+IAl9CgpTbyB3ZSBjYW4gc2VlIGhl
cmUgdGhhdCB0aGVyZSBhcmUgdGhyZWUgZnVuY3Rpb25zIGZvciByZWFkaW5nIHRoZQpjb3VudGVy
IC0gdGhlcmUncyB0aGUgbWVtb3J5IGludGVyZmFjZSBmb3IgQ05UVkNULCB0aGUgIkNQMTUiIGlu
dGVyZmFjZQphbHNvIGZvciBDTlRWQ1QsIGFuZCBhbiBpbnRlcmZhY2UgZm9yIENOVFBDVC4gQ05U
UENUIGlzIG9ubHkgdXNlZCBmb3IKIUFSTTY0IG9yIGlmIGh5cCBtb2RlIGlzIGF2YWlsYWJsZSAo
bm90IHJlbGV2YW50IHVudGlsIG5lc3RlZAp2aXJ0dWFsaXNhdGlvbiBpcyBhZGRlZCkuCgpUaGUg
dXBzaG90IGlzIHRoYXQgb24gYXJtNjQgd2UncmUgdXNpbmcgdGhlIHZpcnR1YWwgY291bnRlciAo
Q05UVkNUKS4KCj4+Cj4+IERvZXMgS1ZNX0tWTUNMT0NLX0NUUkwgc29sdmUgdGhhdCBwcm9ibGVt
Pwo+IEl0IHNlZW1zIEtWTV9LVk1DTE9DS19DVFJMIGlzIGRlZGljYXRlZCBmb3IgZ3Vlc3QgcGF1
c2UvcmVzdW1lIHNjZW5hcmlvLAo+IGJ1dCBpdCByZWxpZXMgb24gcHZjbG9jayBib3RoIGluIEtW
TSBhbmQgR3Vlc3QgYW5kIHJpZ2h0IG5vdyBvbmx5IFg4Ngo+IHN1cHBvcnRzIGl0IDooCgpLVk1f
S1ZNQ0xPQ0tfQ1RSTCBzaW1wbHkgcHJvdmlkZXMgYSBtZWNoYW5pc20gZm9yIHRoZSBob3N0IHRv
IGluZm9ybSB0aGUKZ3Vlc3QgdGhhdCBhIHZDUFUgaGFzbid0IGJlZW4gc2NoZWR1bGVkIGZvciAi
YSB3aGlsZSIuIFRoZSBndWVzdCBjYW4KdGhlbiB1c2UgdGhhdCBpbmZvcm1hdGlvbiB0byBhdm9p
ZCB0cmlnZ2VyaW5nIHRoZSB3YXRjaGRvZyB0aW1lb3V0LiBBcwp5b3Ugbm90ZSBpdCBpcyBvbmx5
IGN1cnJlbnRseSBpbXBsZW1lbnRlZCBmb3IgWDg2LgoKPiBDb3VsZCBTdGV2ZSBwcm92aWRlIG1v
cmUgaW5zaWdodHMgYWJvdXQgdGhlIHdob2xlIHRoaW5nPwoKSSdsbCB0cnkgLSBzZWUgYmVsb3cu
Cgo+IFRoYW5rcywKPiBIZXlpCj4gCj4+Cj4+PiAqIEtWTSBpdHNlbGYgc2F2aW5nL3Jlc3Rvcmlu
ZyBDTlRWQ1RfRUwwIGR1cmluZyBzdXNwZW5kL3Jlc3VtZSBzbyB0aGUKPj4+IGd1ZXN0IGRvZXNu
J3Qgc2VlIHRpbWUgcGFzcyBkdXJpbmcgYSBzdXNwZW5kLgo+PiBUaGlzIHNtZWxscyBsaWtlIHBv
bGljeSB0byBtZSBzbyBJJ2QgbXVjaCBwcmVmZXIga2VlcGluZyBhcyBtdWNoCj4+IGZ1bmN0aW9u
YWxpdHkgaW4gdXNlciBzcGFjZSBhcyBwb3NzaWJsZS7CoCBJZiB3ZSBhbHJlYWR5IGhhdmUgdGhl
IEFQSXMgd2UKPj4gbmVlZCBmcm9tIEtWTSwgbGV0J3MgdXNlIHRoZW0uCgpUaGUgcHJvYmxlbSB3
aXRoIHN1c3BlbmQvcmVzdW1lIGlzIHRoYXQgdXNlciBzcGFjZSBkb2Vzbid0IGdldCBhCmxvb2st
aW4uIFRoZXJlJ3Mgbm8gd2F5IChnZW5lcmljYWxseSkgZm9yIGEgdXNlciBzcGFjZSBhcHBsaWNh
dGlvbiB0bwpzYXZlL3Jlc3RvcmUgcmVnaXN0ZXJzIGR1cmluZyB0aGUgc3VzcGVuZC4gVXNlciBz
cGFjZSBzaW1wbHkgc2VlcyB0aW1lCmp1bXAgZm9yd2FyZHMgLSB3aGljaCBpcyBwcmVjaXNlbHkg
d2hhdCB3ZSdyZSB0cnlpbmcgdG8gaGlkZSBmcm9tIHRoZQpndWVzdCAoYXMgaXQgb3RoZXJ3aXNl
IGdldHMgdXBzZXQgdGhhdCBpdCBhcHBlYXJzIGEgdkNQVSBoYXMgZGVhZGxvY2tlZApmb3IgYSB3
aGlsZSkuCgpTbyB3aGlsZSBJIGFncmVlIHRoaXMgaXMgInBvbGljeSIsIGl0J3Mgc29tZXRoaW5n
IHdlIG5lZWQgdGhlIGtlcm5lbCB0bwpkbyBvbiBvdXIgYmVoYWxmLiBQb3RlbnRpYWxseSB3ZSBj
YW4gcHV0IGl0IGJlaGluZCBhbiBpb2N0bCBzbyB0aGF0IHVzZXIKc3BhY2UgY2FuIG9wdC1pbiB0
byBpdC4KCj4+PiAqIFNvbWV0aGluZyBlcXVpdmFsZW50IHRvIE1TUl9LVk1fV0FMTF9DTE9DS19O
RVcgZm9yIGFybSB3aGljaCBhbGxvd3MKPj4+IHRoZSBndWVzdCB0byBxdWVyeSB0aGUgd2FsbCBj
bG9jayB0aW1lIGZyb20gdGhlIGhvc3QgYW5kIHByb3ZpZGVzIGFuCj4+PiBvZmZzZXQgYmV0d2Vl
biBDTlRWQ1RfRUwwIHRvIHdhbGwgY2xvY2sgdGltZSB3aGljaCB0aGUgS1ZNIGNhbiB1cGRhdGUK
Pj4+IGR1cmluZyBzdXNwZW5kL3Jlc3VtZS4gVGhpcyBtZWFucyB0aGF0IGR1cmluZyBhIHN1c3Bl
bmQvcmVzdW1lIHRoZSBndWVzdAo+Pj4gY2FuIG9ic2VydmUgdGhhdCB3YWxsIGNsb2NrIHRpbWUg
aGFzIHBhc3NlZCwgd2l0aG91dCBoYXZpbmcgdG8gYmUKPj4+IGJvdGhlcmVkIGFib3V0IENOVFZD
VF9FTDAganVtcGluZyBmb3J3YXJkcy4KPj4+Cj4+IElzbid0IHRoZSBwcm9wZXIgQXJtIGFyY2hp
dGVjdHVyYWwgc29sdXRpb24gZm9yIHRoaXMgdG8gcmVhZCB0aGUKPj4gcGh5c2ljYWwgY291bnRl
ciBmb3Igd2FsbCBjbG9jayB0aW1lIGtlZXBpbmcgPwo+Pgo+PiAoWWVzIHRoYXQgd2lsbCByZXF1
aXJlIGEgdHJhcCBvbiBwaHlzaWNhbCBjb3VudGVyIHJlYWRzIGFmdGVyIG1pZ3JhdGlvbgo+PiBv
biBjdXJyZW50IHN5c3RlbXMsIGJ1dCBtaWdyYXRpb24gc3Vja3MgaW4gdGVybXMgb2YgdGltZWtl
ZXBpbmcKPj4gYWxyZWFkeS4pCgpUaGUgcGh5c2ljYWwgY291bnRlciBpcyBjZXJ0YWlubHkgdGVt
cHRpbmcgYXMgaXQgbGFyZ2VseSBkb2VzIHdoYXQgd2UKd2FudCBhcyBhIHNlY29uZGFyeSBjb3Vu
dGVyLiBIb3dldmVyIEknbSB3YXJ5IG9mIHVzaW5nIGl0IGJlY2F1c2UgaXQKc3RhcnRzIHRvIGdl
dCAicmVhbGx5IGludGVyZXN0aW5nIiB3aGVuIGRlYWxpbmcgd2l0aCBuZXN0ZWQKdmlydHVhbGlz
YXRpb24uIEFueSBieSAicmVhbGx5IGludGVyZXN0aW5nIiBJIG9mIGNvdXJzZSBtZWFuIGhvcnJp
Ymx5CmJyb2tlbiA6KQoKQmFzaWNhbGx5IHRoZSBwcm9ibGVtIGlzIHRoYXQgd2l0aCBuZXN0ZWQg
dmlydHVhbGlzYXRpb24gdGhlIG9mZnNldApiZXR3ZWVuIHRoZSBwaHlzaWNhbCBjb3VudGVyIGFu
ZCB0aGUgdmlydHVhbCBjb3VudGVyIGlzIGNvbnRyb2xsZWQgYnkKdGhlIHZpcnR1YWwtRUwyLiBC
ZWNhdXNlIHdlIHdhbnQgY2VydGFpbiBiZWhhdmlvdXJzIG9mIHRoZSB2aXJ0dWFsCmNvdW50ZXIg
KHBhdXNpbmcgd2hlbiB0aGUgZ3Vlc3QgcGF1c2VzKSB3ZSBoYXZlIHRvIHJlcGxpY2F0ZSB0aGF0
IG9udG8KdGhlIHBoeXNpY2FsIGNvdW50ZXIgdG8gbWFpbnRhaW4gdGhlIG9mZnNldCBiZXR3ZWVu
IHRoZSB0d28gdGhhdCB0aGUKZ3Vlc3QgZXhwZWN0cy4KCkdpdmVuIHRoYXQgaXQgc2VlbXMgdG8g
YmUgYSBub24tc3RhcnRlciB3aGVuIHlvdSBpbnRyb2R1Y2UgbmVzdGVkIHZpcnQgSQp0aGluayB3
ZSBzaG91bGQganVzdCBiaXRlIHRoZSBidWxsZXQgYW5kIGltcGxlbWVudCBhIFBWIHdhbGwgY2xv
Y2sKbWVjaGFuaXNtIGZvciBhcm02NCAoc2ltaWxhciB0byBNU1JfS1ZNX1dBTExfQ0xPQ0tfTkVX
KS4KClRoaXMgYWxzbyBoYXMgdGhlIGFkdmFudGFnZSB0aGF0IGl0IGlzIGdvaW5nIHRvIGJlIGZh
c3RlciB0aGFuIHRoZQpwaHlzaWNhbCBjb3VudGVyIHdoZW4gdGhhdCBoYXMgdG8gYmUgdHJhcHBl
ZCAoZS5nLiBhZnRlciBtaWdyYXRpb24pLgoKU3RldmUKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18Ka3ZtYXJtIG1haWxpbmcgbGlzdAprdm1hcm1AbGlzdHMu
Y3MuY29sdW1iaWEuZWR1Cmh0dHBzOi8vbGlzdHMuY3MuY29sdW1iaWEuZWR1L21haWxtYW4vbGlz
dGluZm8va3ZtYXJtCg==
