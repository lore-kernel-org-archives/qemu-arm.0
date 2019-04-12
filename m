Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp401111wrx;
        Fri, 12 Apr 2019 03:48:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMTSW5or66WRPIGf/oLWREhh1n43glryuiDk3S3loIjdbgy41fRnQ8oqs38/DwMNQ0mVqc
X-Received: by 2002:a5d:530f:: with SMTP id e15mr37544321wrv.19.1555066095859;
        Fri, 12 Apr 2019 03:48:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si4981697wmd.28.2019.04.12.03.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEtjC-0004kl-Ut
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:48:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hEtiy-0004jR-GO
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:48:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hEtix-0002l0-Fk
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:48:00 -0400
Resent-Date: Fri, 12 Apr 2019 06:48:00 -0400
Resent-Message-Id: <E1hEtix-0002l0-Fk@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21541)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hEtit-0002bD-NI
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:47:57 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1555066015; cv=none; d=zoho.com; s=zohoarc; 
	b=INWzYH7kkp1cwVTHPRmzt/fCvC/Yv6lkgPlijiPJAs+HC64Y2WF/FDsyB2Q2Uu1CeLyMGXDLbLp4DaN6qBGIDWiDnw58IUAK7L+jO4bX8Pgv4R3bTffFv82EaAV3AWuQDkKV/uUbE6a9Nq/H/WgLNV+lPwBcXVBA1l6gopv+DAU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1555066015;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=1NrmqeFqo71fe4kb9R0E59oJjqv3yI6wSudRZujy04E=; 
	b=NYGU5zCDr60WaHK4lyChgvxloPSpLJMRKXn6WDkvK3SQSjI5yeM7Xsd7acuSXRKuZQAeesNOJdrJkqxJSxmHvg7D/Sv/X0BT4av6qyokhrfscWMrlkWElH3/JB+BdbPxuHshPguG7DY70ygbk+ufy+XY4HWQVeHon1oTCUFX3Z4=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1555066013141513.229967535293;
	Fri, 12 Apr 2019 03:46:53 -0700 (PDT)
Message-ID: <155506601107.12882.12624101475902826075@76452e4e88f2>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: eric.auger@redhat.com
Date: Fri, 12 Apr 2019 03:46:53 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 00/27] vSMMUv3/pSMMUv3 2 stage
 VFIO integration
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
Cc: fam@euphon.net, peter.maydell@linaro.org, yi.l.liu@intel.com,
	mst@redhat.com, jean-philippe.brucker@arm.com,
	qemu-devel@nongnu.org, peterx@redhat.com, eric.auger@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	vincent.stehle@arm.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /XmX1ODyvQT/

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDQxMjEwMDM1NC42NDA5
LTEtZXJpYy5hdWdlckByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUg
ZG9ja2VyLW1pbmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBj
b21tYW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFs
bGVkLCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NS
SVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtbWluZ3dAZmVk
b3JhIFNIT1dfRU5WPTEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAg
Q0MgICAgICBhYXJjaDY0LXNvZnRtbXUvaHcvYXJtL21jaW14N2Qtc2FicmUubwogIENDICAgICAg
YWFyY2g2NC1zb2Z0bW11L2h3L2FybS9zbW11LWNvbW1vbi5vCiAgQ0MgICAgICBhYXJjaDY0LXNv
ZnRtbXUvaHcvYXJtL3NtbXV2My5vCi90bXAvcWVtdS10ZXN0L3NyYy9ody9hcm0vc21tdXYzLmM6
MTk6MTA6IGZhdGFsIGVycm9yOiBsaW51eC9pb21tdS5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J5CiAjaW5jbHVkZSAibGludXgvaW9tbXUuaCIKICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgpj
b21waWxhdGlvbiB0ZXJtaW5hdGVkLgoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0
cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTA0MTIxMDAzNTQuNjQwOS0xLWVyaWMuYXVnZXJAcmVk
aGF0LmNvbS90ZXN0aW5nLmRvY2tlci1taW5nd0BmZWRvcmEvP3R5cGU9bWVzc2FnZS4KLS0tCkVt
YWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5v
cmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5j
b20=

