Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp539817wrp;
        Wed, 18 Sep 2019 21:54:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNYfrt9SzCTwB/mDN7UzrVaKmrvwHjxcsmLTI+H/vSGXxGYON3U16cukL4WYz0AYY22aWe
X-Received: by 2002:a50:b6aa:: with SMTP id d39mr13762109ede.16.1568868885644;
        Wed, 18 Sep 2019 21:54:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w34si4728120edc.252.2019.09.18.21.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 21:54:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAoSq-0003A3-L2
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 00:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iAoSf-00038V-BM
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 00:54:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iAoSd-0007P7-MH
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 00:54:33 -0400
Resent-Date: Thu, 19 Sep 2019 00:54:32 -0400
Resent-Message-Id: <E1iAoSd-0007P7-MH@eggs.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21438)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iAoSY-0007Gt-5s; Thu, 19 Sep 2019 00:54:26 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1568868820; cv=none; d=zoho.com; s=zohoarc; 
 b=iGP6xSziePBKGCjhzGXnjsurza9PXRVNWAVVYI2LVOLPeTjl5P18c225HY7U7O7kwsvUzHWd2FAdWVKeFt3Uqbuw73EJlVzNfrdLjyk4zmciNRcnR2LyGWRUzD+4E01doN5E1C2IkGBYIatF/3RbGA+uvrWkYLEDWmPugil9i4o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1568868820;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=YdtUza1sOX8e9ej9RGyJQYGWtj1HqKpyz579XlI9Cuc=; 
 b=FeHbXM/0h08L5cCeAR2Ogd3HG7HlybmHNPnwIElLk0rWf9n6KavG9+B1asVBWRPw2+G31WFQNB2eDkSRttGkSYNv6XL9i5cX3o/OCpju7M6N2gaYCv+/QL+sE8r+6G+pYh91Vm/hSr/g6GRQ7Es5VYmEwBa67J5smm/d2sqOkpk=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 15688688196655.492372173410217;
 Wed, 18 Sep 2019 21:53:39 -0700 (PDT)
In-Reply-To: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
Message-ID: <156886881774.17151.14880568020719741460@5dec9699b7de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: shameerali.kolothum.thodi@huawei.com
Date: Wed, 18 Sep 2019 21:53:39 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.54
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v11 00/11] ARM virt:
 ACPI memory hotplug support
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 shannon.zhaosl@gmail.com, mst@redhat.com, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, sebastien.boeuf@intel.com,
 lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WGMmziwQSv4H

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDkxODEzMDYzMy40ODcy
LTEtc2hhbWVlcmFsaS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29tLwoKCgpIaSwKClRoaXMgc2Vy
aWVzIGZhaWxlZCB0aGUgZG9ja2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZp
bmQgdGhlIHRlc3RpbmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhh
dmUgRG9ja2VyIGluc3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxs
eS4KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1h
Z2UtY2VudG9zNyBWPTEgTkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50
b3M3IFNIT1dfRU5WPTEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCmxp
YnVkZXYgICAgICAgICAgIG5vCmRlZmF1bHQgZGV2aWNlcyAgIHllcwoKd2FybmluZzogUHl0aG9u
IDIgc3VwcG9ydCBpcyBkZXByZWNhdGVkCndhcm5pbmc6IFB5dGhvbiAzIHdpbGwgYmUgcmVxdWly
ZWQgZm9yIGJ1aWxkaW5nIGZ1dHVyZSB2ZXJzaW9ucyBvZiBRRU1VCmNyb3NzIGNvbnRhaW5lcnMg
IG5vCgpOT1RFOiBndWVzdCBjcm9zcy1jb21waWxlcnMgZW5hYmxlZDogY2MKLS0tCkxvb2tpbmcg
Zm9yIGV4cGVjdGVkIGZpbGUgJ3Rlc3RzL2RhdGEvYWNwaS92aXJ0L1NSQVQubnVtYW1lbScKTG9v
a2luZyBmb3IgZXhwZWN0ZWQgZmlsZSAndGVzdHMvZGF0YS9hY3BpL3ZpcnQvU1JBVCcKKioKRVJS
T1I6L3RtcC9xZW11LXRlc3Qvc3JjL3Rlc3RzL2Jpb3MtdGFibGVzLXRlc3QuYzozMjc6bG9hZF9l
eHBlY3RlZF9hbWw6IGFzc2VydGlvbiBmYWlsZWQ6IChleHBfc2R0LmFtbF9maWxlKQpFUlJPUiAt
IEJhaWwgb3V0ISBFUlJPUjovdG1wL3FlbXUtdGVzdC9zcmMvdGVzdHMvYmlvcy10YWJsZXMtdGVz
dC5jOjMyNzpsb2FkX2V4cGVjdGVkX2FtbDogYXNzZXJ0aW9uIGZhaWxlZDogKGV4cF9zZHQuYW1s
X2ZpbGUpCm1ha2U6ICoqKiBbY2hlY2stcXRlc3QtYWFyY2g2NF0gRXJyb3IgMQpUcmFjZWJhY2sg
KG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgRmlsZSAiLi90ZXN0cy9kb2NrZXIvZG9ja2VyLnB5
IiwgbGluZSA2NjQsIGluIDxtb2R1bGU+CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApo
dHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDkxODEzMDYzMy40ODcyLTEtc2hhbWVlcmFsaS5r
b2xvdGh1bS50aG9kaUBodWF3ZWkuY29tL3Rlc3RpbmcuZG9ja2VyLXF1aWNrQGNlbnRvczcvP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=

