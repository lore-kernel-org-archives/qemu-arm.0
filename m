Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7183957wrx;
        Thu, 7 Mar 2019 06:08:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqwPV2ceXwRMga/NRU9OdgZz11gWGYq/jIQtdtqefQB0fK89YXC+PRVAJPrWowGjYkHQ8NTe
X-Received: by 2002:a25:1e07:: with SMTP id e7mr11267317ybe.511.1551967708491;
        Thu, 07 Mar 2019 06:08:28 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 191si2687247ybk.243.2019.03.07.06.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:08:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1thD-0006f5-Vb
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:08:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h1tg4-0005yA-Av
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:07:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h1tg3-0006yI-GO
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:07:16 -0500
Resent-Date: Thu, 07 Mar 2019 09:07:16 -0500
Resent-Message-Id: <E1h1tg3-0006yI-GO@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21055)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1h1tg3-0006wj-5j
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:07:15 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1551967608; cv=none; d=zoho.com; s=zohoarc; 
	b=dvdS2vZ4ZNUw+c/5xfb6KAwDpcQ9kYNVuEGxHBB0reeuDBmyoTVSWXmp9DMPVqMHZ/6i5tiLkUWgTKMjDcYtF+fuIeFv504y9WSFfL063AgopnyCeA6MHHzeP4etL2jo08VX+e99JgA8cIm75I5AhBQ4MyNcoxkYM4TfDK0v1G4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1551967608;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=y19hMwZXGOX5idF1222hbTI9ZhNqV4s/tFd3sOSyhO0=; 
	b=OyzaAbSxjOAAGh+cTNp1ODDDq1u8IfQ3KlyWF2AMI9QKKB2PdjmdYxAUiN9f5zL3Z7A0oXtONTB8cc8Yxwzr+/4X0qK7o6ylR3Wa/KMhPY2xsp4SzjHVvuIpQqtB8SUpXEG8ruJRxeVnUhvoltOCQhTY35EVzXByvOFjMwcHqrs=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1551967607137596.3586765590983;
	Thu, 7 Mar 2019 06:06:47 -0800 (PST)
Message-ID: <155196760579.8146.17148647233084593514@6acff2cf482b>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: thuth@redhat.com
Date: Thu, 7 Mar 2019 06:06:47 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-devel] [PATCH v3 00/30] Kconfig dependencies for ARM
 machines
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: fam@euphon.net, yang.zhong@intel.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Cf3znAw/ERX

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTUwOTA4MTYyLTIyNjQ0LTEt
Z2l0LXNlbmQtZW1haWwtdGh1dGhAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWls
ZWQgdGhlIGRvY2tlci1taW5nd0BmZWRvcmEgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRl
c3RpbmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2Vy
IGluc3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBU
RVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKdGltZSBtYWtlIGRvY2tlci10ZXN0LW1p
bmd3QGZlZG9yYSBTSE9XX0VOVj0xIEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQg
PT09CgoKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9s
b2dzLzE1NTA5MDgxNjItMjI2NDQtMS1naXQtc2VuZC1lbWFpbC10aHV0aEByZWRoYXQuY29tL3Rl
c3RpbmcuZG9ja2VyLW1pbmd3QGZlZG9yYS8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJh
dGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFz
ZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

