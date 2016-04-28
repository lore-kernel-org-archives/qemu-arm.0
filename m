Received: by 10.25.208.137 with SMTP id h131csp75296lfg;
        Wed, 27 Apr 2016 23:03:25 -0700 (PDT)
X-Received: by 10.66.78.73 with SMTP id z9mr17672697paw.4.1461823405497;
        Wed, 27 Apr 2016 23:03:25 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id y6si14131501paf.29.2016.04.27.23.03.25;
        Wed, 27 Apr 2016 23:03:25 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1750810AbcD1GDX (ORCPT <rfc822;ravineet.singh@linaro.org>
	+ 8 others); Thu, 28 Apr 2016 02:03:23 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:58505 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750748AbcD1GDW (ORCPT <rfc822;kvm@vger.kernel.org>);
	Thu, 28 Apr 2016 02:03:22 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O6B00Z0LY5J0M00@mailout2.samsung.com> for kvm@vger.kernel.org;
 Thu, 28 Apr 2016 15:03:19 +0900 (KST)
Received: from epcpsbgx3.samsung.com ( [172.20.52.115])
	by epcpsbgr3.samsung.com (EPCPMTA) with SMTP id 89.8A.05366.7A7A1275; Thu,
 28 Apr 2016 15:03:19 +0900 (KST)
X-AuditID: cbfee68f-f79d26d0000014f6-6d-5721a7a78fba
Received: from epmailer02 ( [203.254.219.142])
	by epcpsbgx3.samsung.com (EPCPMTA) with SMTP id 71.64.05252.7A7A1275; Thu,
 28 Apr 2016 15:03:19 +0900 (KST)
Date:	Thu, 28 Apr 2016 06:03:19 +0000 (GMT)
From:	RAVINDRA KUMAR SANDE <r.sande@samsung.com>
Subject: Re: Re: [Query] Does Linux & Qemu support KVM for ARM32 guest on ARM64
 host
To:	Shannon Zhao <zhaoshenglong@huawei.com>,
	RAVINDRA KUMAR SANDE <r.sande@samsung.com>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Cc:	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"linux-arm-kernel@lists.infradead.org" 
	<linux-arm-kernel@lists.infradead.org>
Reply-to: r.sande@samsung.com
MIME-version: 1.0
X-MTR:	20160428043852024@r.sande
Msgkey:	20160428043852024@r.sande
X-EPLocale: en_US.windows-1252
X-Priority: 3
X-EPWebmail-Msg-Type: personal
X-EPWebmail-Reply-Demand: 0
X-EPApproval-Locale: 
X-EPHeader: ML
X-MLAttribute: 
X-RootMTR: 20160428043852024@r.sande
X-ParentMTR: 
X-ArchiveUser: 
X-CPGSPASS: Y
X-ConfirmMail: N,general
Content-transfer-encoding: base64
Content-type: text/plain; charset=windows-1252
MIME-version: 1.0
Message-id: <708585848.188261461823397987.JavaMail.weblogic@ep2mlwas06d>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWyRsSkWHf5csVwg+1PNS3mTC10YPT4vEku
	gDFKxCYlNSezLLVI3w7BShDJmL7rMGPBPNGKqQ02DYxXRLoYOTiEBJQkvpx36WLk5JAQMJG4
	3T+HHcIWk7hwbz1bFyMXUMlSRolr31+zwBR9eriCBSIxh1Hi8PtDrCAJFgFViccH28GK2AQM
	JY5cn8IGYgsLhEj0HfjIDNIgInCWUeL/zhNgDrNAJ5PErCtPmEGqhARkJbpu3mEEsXkFBCVO
	znwCtU5B4sDnZVBxRYmGYzOZIeJyEkumXmaCsHklZrQ/ZYGJT/u6BqpGWuL8rA2MMP8s/v4Y
	Ks4vcez2DqheAYmpZw5C1ahKPPp0GKqGT2LNwrcsMPW7Ti1nhtnVsPE3NIwkJLa2PAH7nhno
	tindD9khbAOJI4vmsKL6hQPI9pA4M8MX5HcJgTMcEt//f2acwKg0C0nZLCSjZiEZhaxmASPL
	KkbR1ILkguKk9CJjveLE3OLSvHS95PzcTYzAZHH637P+HYx3D1gfYlTnYJQSLc0rTk7My0tM
	ykmNz03MScsvyk1NUeLhnZCgGC7EmlhWXJl7iNEUGH8TmaVEk/OBCSyvJN7Q2MzIwtTE1NjI
	3NJMSZx3odTPYCGB9MSS1OzU1ILUovii0pzU4kOMTBycUg2Mlrcd3m88+o9zAaP05U0x8/q5
	3j6+JZKm5uAqMvXKwXn/dy7/kPLGXE6Io23CV79ToYeuPphhusibu3ClSK77tnXRi6w02l/y
	eWawzxNevTZa6c7tJ3vurAxQXFVuWhG6982ERz3qBTc+/bl/+/T7VvYbIaZmnnWbrq3/UVX8
	bt4rQ+HClCPJHUosxRmJhlrMRcWJAIXexP4oAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEKsWRmVeSWpSXmKPExsVy+t/tPt3lyxXDDSa+UbGYM7XQgdHj8ya5
	AMaoApuU1JzMstQifTubjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFsl
	F58AXbfMHKDpSgpliTmlQKGAxOJiJaAJRfmlJakKGfnFJbZK0YbmRnpGBnqmRnqGxrFWhgYG
	RqZANQkFGdN3HWYsmCdaMbXBpoHxikgXIweHkICSxJfzLl2MnBwSAiYSnx6uYIGwxSQu3FvP
	1sXIBVQyh1Hi8PtDrCAJFgFViccH28GK2AQMJY5cn8IGYgsLhEj0HfjIDNIgInCWUeL/zhNg
	DrNAJ5PErCtPmEGqhARkJbpu3mEEsXkFBCVOznwCtU5B4sDnZVBxRYmGYzOZIeJyEkumXmaC
	sHklZrQ/ZYGJT/u6BqpGWuL8rA2MMGcv/v4YKs4vcez2DqheAYmpZw5C1ahKPPp0GKqGT2LN
	wrcsMPW7Ti1nhtnVsPE3O4QtIbG15QnY98xAt03pfsgOYRtIHFk0hxXVLxxAtofEmRm+Exhl
	ZyHJzELSPQtJN7KaBYwsqxhFUwuSC4qT0iuM9YoTc4tL89L1kvNzNzGCE9OzxTsY/5+3PsSo
	zsEoJVqaV5ycmJeXmJSTGp+bmJOWX5SbmqLEwzshQTFciDWxrLgy9xCjCtCqRxtWX2CUYsnL
	z0tVEuH1WgKU5k1JrKxKLcqPLyrNSS0+xGgKjNmJzFKiyfnA1JtXEm9obGxiZmJqaWJhYGqu
	JM4b8HddmJBAemJJanZqakFqEUwfEwenVAOj+Pt3uUffi4t5+mzikJs57bSBtfbbRVkdDeXK
	v6Yd4Tzrwn9xeYbh17uGS+787NzaUnZoP/P0TQ/ERY9cPn/0cd0qb+1nddMltaO73Rb9dDsj
	ahU/q3T2EiO2ox4NghNEX/esrKr6VVf1oDxs7nR9G9313A8nN579bH+hZ/2eaxZfp0sv1b37
	TYmlOCPRUIu5qDgRAEUkjqCFAwAA
DLP-Filter: Pass
X-CFilter-Loop:	Reflected
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: ZqADEJhcLCc3

DQo+IE9uIDIwMTYvNC8yOCA5OjUwLCBSQVZJTkRSQSBLVU1BUiBTQU5ERSB3cm90ZToNCj4gPiAN
Cj4gPiBXaGF0IEkgZGlkICA6DQo+ID4gMSkgSnVzdCBmb3IgaW52ZXN0aWdhdGlvbiwgSSB0b29r
IGEgQVJNdjggKCBPZHJvaWRDMiApIGJvYXJkDQo+ID4gMikgIEkgY29tcGlsZWQgTGludXggMy4x
NCB3aXRoIEtWTSBzdXBwb3J0IGZvciB0aGlzIEFSTXY4ICggT2Ryb2lkQzIgKQ0KPiA+IGJvYXJk
LCB3aXRoIG1vZGlmaWNhdGlvbiByZXBsYWNpbmcgbWVzb25fdGltZXIgYnkgYXJtIHRpbWVyIGlu
IGl0cyBkdHMNCj4gPiBmaWxlLg0KPiA+IFdoeSBMaW51eCAzLjE0IDogSSB0b29rIExpbnV4IDMu
MTQgYmVjYXVzZSBkaXNwbGF5IGRyaXZlcnMgZm9yIHRoaXMNCj4gPiBib2FyZCBhcmUgb2ZmaWNp
YWxseSBmb3IgdGhpcyB2ZXJzaW9uOyBhbmQgSSBhbSBpbnRlcmVzdGVkIGluIHNlZWluZw0KPiA+
IHNvbWUgTGludXggZ3Vlc3QgYm9vdGluZyB3aXRoIGRpc3BsYXkgb24uDQo+ID4gMykgIEkgc2Vl
IGZyb20gYm9vdCBsb2cgb2YgIHRoYXQgS1ZNIGlzIGluaXRpYWxpemVkIHN1Y2Nlc3NmdWxseSwg
YW5kIEkNCj4gPiBjYW4gc2VlIC9kZXYva3ZtIG5vZGUuDQo+ID4gNCkgSSBidWlsdCBsYXRlc3Qg
UWVtdSB3aXRoIC0tZW5hYmxlLWt2bSBvbiB0aGlzIGJvYXJkIG5hdGl2ZWx5Lg0KPiA+IA0KPiA+
IFdoYXQgSSBmaW5kIDoNCj4gPiAxKSBydW5uaW5nICJxZW11LXN5c3RlbS1hcm0gIC1lbmFibGUt
a3ZtICAgLW1hY2hpbmUgdmV4cHJlc3MtYTkgLi4uLiINCj4gPiBnaXZlcyBlcnJvciA6ICBubyBh
Y2NlbGVyYXRvciBmb3VuZA0KPiA+IDIpIHJ1bm5pbmcgInFlbXUtc3lzdGVtLWFhcmNoNjQgLWVu
YWJsZS1rdm0gIC1tYWNoaW5lIHZleHByZXNzLWE5IC4uLi4iDQo+ID4gZ2l2ZXMgZXJyb3IgOiBr
bXZfaW5pdF92Y3B1IChJT0N0bCBvbiAvZGV2L2t2bSkgZmFpbGVkLCBndWVzdCBub3Qgc3VwcG9y
dGVkDQo+ID4gKCBJIGV4cGVyaW1lbnRlZCBzb21lIG1vZGlmaWNhdGlvbnMgYXMgd2VsbCB0byBv
dmVyY29tZSBhYm92ZSBlcnJvciwNCj4gPiBzdWNoIGFzIHJlcGxhY2luZyB2YWx1ZSBhc3NpZ25l
ZCB0byBjcHUtPmt2bV90YXJnZXQgZXRjLCBidXQgSU9DdGwgY2FsbA0KPiA+IGlzIGZhaWxpbmcp
DQo+ID4gDQo+ID4gUXVlcnk6DQo+PiAgMSkgRG9lcyBBcm02NCBMaW51eCBub3QgZW5hYmxlIEtW
TSBzdXBwb3J0IGZvciBBcm0zMiBndWVzdCA/DQo+ID4gMikgQ2FuIHFlbXUtc3lzdGVtLWFybSBu
b3QgdXNlIHRoZSBLVk0gZmVhdHVyZSBvbiBBcm02NCBob3N0ID8NCj4gPiAzKSBDYW4gcWVtdS1z
eXN0ZW0tYWFyY2g2NCBub3QgdXNlIEtWTSBmZWF0dXJlIGZvciBBcm0zMiBndWVzdCA/DQo+ID4g
DQo+IC0tLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLS0tDQo+IFNlbmRlciA6IFNoYW5ub24g
Wmhhbzx6aGFvc2hlbmdsb25nQGh1YXdlaS5jb20+DQo+IA0KPiBZb3UgY2FuIHVzZSBiZWxvdyBj
b21tYW5kIHRvIGJvb3QgYSBBUk0zMiBndWVzdCBvbiBBUk02ND8NCj4gDQo+IHFlbXUtc3lzdGVt
LWFhcmNoNjQgLWVuYWJsZS1rdm0gLW1hY2hpbmUgdmlydCxrZXJuZWxfaXJxY2hpcD1vbiAtY3B1
DQo+IGhvc3QsYWFyY2g2ND1vZmYgLi4uLg0KPiANCj4gLS0gDQo+IFNoYW5ub24NCg0KDQpJIHdp
bGwgdHJ5IGFib3ZlIG9uIEFybTY0LiANCg0KSSBoYXZlIGFub3RoZXIgcXVlcnksIGZvciBBcm0z
MiBob3N0IHdpdGggS1ZNIGVuYWJsZWQuDQpJIHNlZSB0aGF0ICJxZW11LXN5c3RlbS1hcm0gIC1l
bmFibGUta3ZtICAgLW1hY2hpbmUgdmV4cHJlc3MtYTkgIC4uLiIgZ2l2ZXMgZXJyb3INCmttdl9p
bml0X3ZjcHUgKElPQ3RsIG9uIC9kZXYva3ZtKSBmYWlsZWQsIGd1ZXN0IG5vdCBzdXBwb3J0ZWQu
DQoNCklzIHRoZXJlIGFueSB3YXkgdG8gZW11bGF0ZSB2ZXhwcmVzcy1hOSAgd2l0aCAgLWVuYWJs
ZS1rdm0gICBvbiBxZW11ID8NCg0KUmVnYXJkcywNClJhdmluZHJhIFNhbmRl


