Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp111752wrx;
        Thu, 21 Mar 2019 04:11:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkMmYhvL3U1ILDS7jFgOJaLcqOTtiv2sSDMGCgF/vYMy+aGbi9NvKpBlGiHI0aoW3Srd9w
X-Received: by 2002:adf:9c8f:: with SMTP id d15mr2072537wre.309.1553166665547;
        Thu, 21 Mar 2019 04:11:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si3006852wmh.116.2019.03.21.04.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 04:11:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6vbE-0007QZ-HL
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 07:11:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h6vaw-0007PR-4e
	for qemu-arm@nongnu.org; Thu, 21 Mar 2019 07:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h6vXd-0001zv-W8
	for qemu-arm@nongnu.org; Thu, 21 Mar 2019 07:07:23 -0400
Resent-Date: Thu, 21 Mar 2019 07:07:23 -0400
Resent-Message-Id: <E1h6vXd-0001zv-W8@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21127)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1h6vXc-0001qC-1x; Thu, 21 Mar 2019 07:07:20 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1553166400; cv=none; d=zoho.com; s=zohoarc; 
	b=g5cWmU9yzqlVntDiOH9jBQQPK3wgLiH4UHw2yGDdmdmy9t40DzN1xbfeeVOXdMDbriDPvL75nXGVa3bAB9so1QCVE5ypm3UUxWdTNncrJIqf9ZD3ER/c6yDlUuZmSkcAFsDE4m8ZubLmfIzPITyHrw+S2aWZzvchQOWiW+JJfXY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1553166400;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=hcBMe4XPkmYluUyF/itWPzQUdGcvt/4CV2h00GOVIrw=; 
	b=MyzS5/wUapkn3w6CoUS33jLHuLGxpRg1xlfIOnIvG7F/jIDAFAn/JtlulB64kDuw4nCWoC7po6g14AKhehV5WRYMZWaCjq7+8A8DNb804QlHrievwFtJnYzl8xfT/z4ep2fEVdsFQJGsUKeX2cGJBsIyNIgbL9w72wAYYKGo9tI=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1553166397501751.3869609078474;
	Thu, 21 Mar 2019 04:06:37 -0700 (PDT)
In-Reply-To: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
Message-ID: <155316639560.24.7094080675698324472@b782c5aab522>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: shameerali.kolothum.thodi@huawei.com
Date: Thu, 21 Mar 2019 04:06:37 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 00/10] ARM virt: ACPI memory
 hotplug support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: fam@euphon.net, peter.maydell@linaro.org, sameo@linux.intel.com,
	shannon.zhaosl@gmail.com, qemu-devel@nongnu.org,
	xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
	qemu-arm@nongnu.org, imammedo@redhat.com, sebastien.boeuf@intel.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P1lbGuav4nbh

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDMyMTEwNDc0NS4yODA2
OC0xLXNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbS8KCgoKSGksCgpUaGlzIHNl
cmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0
IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMjAxOTAzMjExMDQ3NDUu
MjgwNjgtMS1zaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20KU3ViamVjdDogW1Fl
bXUtZGV2ZWxdIFtQQVRDSCB2MyAwMC8xMF0gQVJNIHZpcnQ6IEFDUEkgbWVtb3J5IGhvdHBsdWcg
c3VwcG9ydApUeXBlOiBzZXJpZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jh
c2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMg
VHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0
cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09
CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20g
aHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAgIDYyYTE3MmU2YTcuLjY1
MzJkY2ViYjYgIG1hc3RlciAgICAgLT4gbWFzdGVyCiB0IFt0YWcgdXBkYXRlXSAgICAgICAgICAg
IHBhdGNoZXcvMTU1MzA5MDg0Ny0xMTMwMC0xLWdpdC1zZW5kLWVtYWlsLWxpemhlbmd1aUBodWF3
ZWkuY29tIC0+IHBhdGNoZXcvMTU1MzA5MDg0Ny0xMTMwMC0xLWdpdC1zZW5kLWVtYWlsLWxpemhl
bmd1aUBodWF3ZWkuY29tCiB0IFt0YWcgdXBkYXRlXSAgICAgICAgICAgIHBhdGNoZXcvMjAxOTAz
MTMxNjI4MTIuODg4NS0xLWFybWJydUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAxOTAzMTMxNjI4
MTIuODg4NS0xLWFybWJydUByZWRoYXQuY29tCiB0IFt0YWcgdXBkYXRlXSAgICAgICAgICAgIHBh
dGNoZXcvMjAxOTAzMTQxMzEwNDkuMjMxNzUtMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20g
LT4gcGF0Y2hldy8yMDE5MDMxNDEzMTA0OS4yMzE3NS0xLW1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0
LmNvbQogdCBbdGFnIHVwZGF0ZV0gICAgICAgICAgICBwYXRjaGV3LzIwMTkwMzE5MTYzNTUxLjMy
NDk5LTEtYXJtYnJ1QHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDE5MDMxOTE2MzU1MS4zMjQ5OS0x
LWFybWJydUByZWRoYXQuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgICAgICAgIHBhdGNoZXcvMjAx
OTAzMjEwODUyMTIuMTA3OTYtMS1sdml2aWVyQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDE5MDMy
MTA4NTIxMi4xMDc5Ni0xLWx2aXZpZXJAcmVkaGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAgICAg
ICAgICBwYXRjaGV3LzIwMTkwMzIxMDk0MDEyLjM2NTQxLTEtc2dhcnphcmVAcmVkaGF0LmNvbSAt
PiBwYXRjaGV3LzIwMTkwMzIxMDk0MDEyLjM2NTQxLTEtc2dhcnphcmVAcmVkaGF0LmNvbQogKiBb
bmV3IHRhZ10gICAgICAgICAgICAgICBwYXRjaGV3LzIwMTkwMzIxMTA0NzQ1LjI4MDY4LTEtc2hh
bWVlcmFsaS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29tIC0+IHBhdGNoZXcvMjAxOTAzMjExMDQ3
NDUuMjgwNjgtMS1zaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20KU3dpdGNoZWQg
dG8gYSBuZXcgYnJhbmNoICd0ZXN0JwoxMjVmNDY3NzBiIGh3L2FybS92aXJ0OiBJbml0IEdFRCBk
ZXZpY2UgYW5kIGVuYWJsZSBtZW1vcnkgaG90cGx1Zwo4YjNhNTQyMDIxIGh3L2FjcGk6IEFkZCBB
Q1BJIEdlbmVyaWMgRXZlbnQgRGV2aWNlIFN1cHBvcnQKYmJiNjBiMjlhNSBody9hcm0vYm9vdDog
RXhwb3NlIHRoZSBQQy1ESU1NIG5vZGVzIGluIHRoZSBEVAo4NjE3ZTQyNTczIGh3L2FybS92aXJ0
OiBJbnRyb2R1Y2Ugb3B0LWluIGZlYXR1cmUgImZkdCIKOWNkNWRhNjcxYyBody9hcm0vdmlydC1h
Y3BpLWJ1aWxkOiBBZGQgUEMtRElNTSBpbiBTUkFUCmIyNTM4N2I5ZDMgaHcvYXJtL3ZpcnQ6IEFk
ZCBBQ1BJIHN1cHBvcnQgZm9yIGRldmljZSBtZW1vcnkgY29sZC1wbHVnCmFiNmQyMzJjNGQgaHcv
YXJtL3ZpcnQ6IEFkZCBtZW1vcnkgaG90cGx1ZyBmcmFtZXdvcmsKZWE3MWE5MjQyNiBody9hcm0v
dmlydDogQWRkIHZpcnR1YWwgQUNQSSBkZXZpY2UKZjA5M2UxYWFmMiBody9hY3BpOiBEbyBub3Qg
Y3JlYXRlIG1lbW9yeSBob3RwbHVnIG1ldGhvZCB3aGVuIGhhbmRsZXIgaXMgbm90IGRlZmluZWQK
MzdlYjZhNGFiNCBody9hY3BpOiBNYWtlIEFDUEkgSU8gYWRkcmVzcyBzcGFjZSBjb25maWd1cmFi
bGUKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvMTAgQ2hlY2tpbmcgY29tbWl0IDM3ZWI2YTRhYjQ5
MyAoaHcvYWNwaTogTWFrZSBBQ1BJIElPIGFkZHJlc3Mgc3BhY2UgY29uZmlndXJhYmxlKQoyLzEw
IENoZWNraW5nIGNvbW1pdCBmMDkzZTFhYWYyMWQgKGh3L2FjcGk6IERvIG5vdCBjcmVhdGUgbWVt
b3J5IGhvdHBsdWcgbWV0aG9kIHdoZW4gaGFuZGxlciBpcyBub3QgZGVmaW5lZCkKV0FSTklORzog
bGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzMxOiBGSUxFOiBody9hY3BpL21lbW9yeV9ob3RwbHVn
LmM6NzI2OgorICAgICAgICAgICAgICAgICAgIGFtbF9jYWxsMChNRU1PUllfREVWSUNFU19DT05U
QUlORVIgIi4iIE1FTU9SWV9TTE9UX1NDQU5fTUVUSE9EKSk7Cgp0b3RhbDogMCBlcnJvcnMsIDEg
d2FybmluZ3MsIDE2IGxpbmVzIGNoZWNrZWQKClBhdGNoIDIvMTAgaGFzIHN0eWxlIHByb2JsZW1z
LCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRp
dmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlO
VEFJTkVSUy4KMy8xMCBDaGVja2luZyBjb21taXQgZWE3MWE5MjQyNmNjIChody9hcm0vdmlydDog
QWRkIHZpcnR1YWwgQUNQSSBkZXZpY2UpCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVk
IGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzQyOiAKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKCnRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgMTE1IGxpbmVzIGNoZWNr
ZWQKClBhdGNoIDMvMTAgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55
IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBt
YWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KNC8xMCBDaGVja2luZyBj
b21taXQgYWI2ZDIzMmM0ZDE2IChody9hcm0vdmlydDogQWRkIG1lbW9yeSBob3RwbHVnIGZyYW1l
d29yaykKNS8xMCBDaGVja2luZyBjb21taXQgYjI1Mzg3YjlkM2U1IChody9hcm0vdmlydDogQWRk
IEFDUEkgc3VwcG9ydCBmb3IgZGV2aWNlIG1lbW9yeSBjb2xkLXBsdWcpCjYvMTAgQ2hlY2tpbmcg
Y29tbWl0IDljZDVkYTY3MWM0OSAoaHcvYXJtL3ZpcnQtYWNwaS1idWlsZDogQWRkIFBDLURJTU0g
aW4gU1JBVCkKNy8xMCBDaGVja2luZyBjb21taXQgODYxN2U0MjU3Mzg1IChody9hcm0vdmlydDog
SW50cm9kdWNlIG9wdC1pbiBmZWF0dXJlICJmZHQiKQo4LzEwIENoZWNraW5nIGNvbW1pdCBiYmI2
MGIyOWE1NzUgKGh3L2FybS9ib290OiBFeHBvc2UgdGhlIFBDLURJTU0gbm9kZXMgaW4gdGhlIERU
KQo5LzEwIENoZWNraW5nIGNvbW1pdCA4YjNhNTQyMDIxNTYgKGh3L2FjcGk6IEFkZCBBQ1BJIEdl
bmVyaWMgRXZlbnQgRGV2aWNlIFN1cHBvcnQpCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVy
cwojMTI0OiBGSUxFOiBody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmM6MTE3OgorICAgICAg
ICAgICAgaWZfY3R4ID0gYW1sX2lmKGFtbF9lcXVhbChhbWxfYW5kKGlycV9zZWwsIGFtbF9pbnQo
Z2VkX2V2ZW50c1tpXS5zZWxlY3RvciksIE5VTEwpLCBhbWxfaW50KGdlZF9ldmVudHNbaV0uc2Vs
ZWN0b3IpKSk7Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDI2OSBsaW5lcyBjaGVja2Vk
CgpQYXRjaCA5LzEwIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBv
ZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFp
bnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgoxMC8xMCBDaGVja2luZyBj
b21taXQgMTI1ZjQ2NzcwYjM3IChody9hcm0vdmlydDogSW5pdCBHRUQgZGV2aWNlIGFuZCBlbmFi
bGUgbWVtb3J5IGhvdHBsdWcpCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRl
ZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRj
aGV3Lm9yZy9sb2dzLzIwMTkwMzIxMTA0NzQ1LjI4MDY4LTEtc2hhbWVlcmFsaS5rb2xvdGh1bS50
aG9kaUBodWF3ZWkuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1h
aWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9y
Zy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNv
bQ==

