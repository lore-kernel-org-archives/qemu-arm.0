Received: by 10.25.221.202 with SMTP id w71csp1046349lfi;
        Fri, 11 Aug 2017 08:39:53 -0700 (PDT)
X-Received: by 10.237.53.226 with SMTP id d31mr20346816qte.266.1502465992956;
        Fri, 11 Aug 2017 08:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502465992; cv=none;
        d=google.com; s=arc-20160816;
        b=Kv8npq5VPzHv0mLlTm9u5LUyxl/WJZOkBZRC0eRF61NGTgHmMq7mVPmEhhXHI1N7s/
         o/DImjXYKz3I9xvobcm3GFT0WVCPYtqZKq/As1G18ESRzIOh70WAsrBI2yeJfOaOFsRh
         sIXP7CZul3B0LlGSSYsjJkBCIUSYsJGs3Pf1xSG0TkAgTr/dFwmPi66B/uRrJ9aqXViV
         2twI2n1cRS60wbyMLsStSaqfhfbf0pPL6qAyYPLFhtU0rvYLJc6MvBu/lZL05VE52UmU
         ZM9Nm3Y/sanxfOlh98zIQA5fLIPzO9gdbupojovsR6dC3zlIq8es3GOaZ/FRNy1tEDcH
         LVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:in-reply-to
         :message-id:resent-message-id:resent-date:arc-authentication-results;
        bh=MXZWQJmsskTaXoXn/sgoIKIhhGgTsvEpbuaaxny1Nys=;
        b=Am3mCdrUA8MYzM1xmEYJhBavonzJBcDVyTqDQmKNzoef+VBp3UShwDkmmELmiCs+zK
         Hq96WZe7CeWJhZrxkslBmrsb/EZDFT5nEZE499g8QMnP3/yFE8TWslp4VO26TDJBIfQK
         LjDie93IKdkwc4em0B1VfDFvDhYTtMgkW1E1Cyjvye+iDwgy02OD2sdT5rgpVVmJ73/G
         nGJ7K7takiJg0lUoFAiQ/AJ3+XP2wKAtw2kGcQpKaqZdVUzajLZ7NO3V6Z5DTK976oz5
         Zd/xgtR8BgINVp4MJtlBMFhIIfDnevIapvWKqZbpbYIoZtch8BaagWapvOIArwgB1s5m
         yffg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i68si1001550qke.182.2017.08.11.08.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 08:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgC2Q-0001RK-Bq
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 11:39:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1dgC1t-00015j-G7
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 11:39:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1dgC1n-00024Q-CO
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 11:39:17 -0400
Resent-Date: Fri, 11 Aug 2017 11:39:17 -0400
Resent-Message-Id: <E1dgC1n-00024Q-CO@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21499)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1dgC1b-0001wa-H9; Fri, 11 Aug 2017 11:38:59 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1502465910273879.1667705065382;
	Fri, 11 Aug 2017 08:38:30 -0700 (PDT)
Message-ID: <150246590902.69.17384455734437982173@dd743fd916bd>
In-Reply-To: <1502461354-11327-1-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: eric.auger@redhat.com
Date: Fri, 11 Aug 2017 08:38:30 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v6 0/9] ARM SMMUv3 Emulation
 Support
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
Cc: peter.maydell@linaro.org, mst@redhat.com, will.deacon@arm.com,
	qemu-devel@nongnu.org, peterx@redhat.com, bharat.bhushan@nxp.com,
	eric.auger.pro@gmail.com, mohun106@gmail.com,
	jean-philippe.brucker@arm.com, tn@semihalf.com,
	prem.mallappa@gmail.com, drjones@redhat.com,
	tcain@qti.qualcomm.com, famz@redhat.com, eric.auger@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CdcpGq1kLn8H

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMTUw
MjQ2MTM1NC0xMTMyNy0xLWdpdC1zZW5kLWVtYWlsLWVyaWMuYXVnZXJAcmVkaGF0LmNvbQpTdWJq
ZWN0OiBbUWVtdS1kZXZlbF0gW1JGQyB2NiAwLzldIEFSTSBTTU1VdjMgRW11bGF0aW9uIFN1cHBv
cnQKVHlwZTogc2VyaWVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCgpC
QVNFPWJhc2UKbj0xCnRvdGFsPSQoZ2l0IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8IHdjIC1sKQpm
YWlsZWQ9MAoKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0l
SCAtLXJldmVyc2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hl
Y2tpbmcgUEFUQ0ggJG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4i
CiAgICBpZiAhIGdpdCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0
Y2gucGwgLS1tYWlsYmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAg
ICBmaQogICAgbj0kKChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVO
RCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQK
U3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwozZTYyY2VkZDczIGh3L2FybS92aXJ0LWFj
cGktYnVpbGQ6IFVzZSB0aGUgQUNQSV9JT1JUX1NNTVVfVjNfQ0FDSElOR19NT0RFIG1vZGVsCjNh
NTEwOTRlZTkgaHcvYXJtL3NtbXV2MzogVkZJTyBpbnRlZ3JhdGlvbgo4MTU1NzU1MTVmIHRhcmdl
dC9hcm0va3ZtOiBUcmFuc2xhdGUgdGhlIE1TSSBkb29yYmVsbCBpbiBrdm1fYXJjaF9maXh1cF9t
c2lfcm91dGUKZjcyYmM2YWU2NyBody9hcm0vdmlydDogQWRkIHRsYmktb24tbWFwIHByb3BlcnR5
IHRvIHRoZSBzbW11djMgbm9kZQo1MmEyNTY5ZmU3IGh3L2FybS92aXJ0LWFjcGktYnVpbGQ6IEFk
ZCBzbW11djMgbm9kZSBpbiBJT1JUIHRhYmxlCjYyYzNjMmZjYWUgaHcvYXJtL3ZpcnQ6IEFkZCAy
LjExIG1hY2hpbmUgdHlwZQo4MDY3MWI0ZTkwIGh3L2FybS92aXJ0OiBBZGQgU01NVXYzIHRvIHRo
ZSB2aXJ0IGJvYXJkCmFlMWMyMDNkNzMgaHcvYXJtL3NtbXV2Mzogc21tdXYzIGVtdWxhdGlvbiBt
b2RlbApiY2I3ZDZlNDVkIGh3L2FybS9zbW11LWNvbW1vbjogc21tdSBiYXNlIGNsYXNzCgo9PT0g
T1VUUFVUIEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzk6IGh3L2FybS9zbW11LWNvbW1vbjog
c21tdSBiYXNlIGNsYXNzLi4uCkNoZWNraW5nIFBBVENIIDIvOTogaHcvYXJtL3NtbXV2Mzogc21t
dXYzIGVtdWxhdGlvbiBtb2RlbC4uLgpDaGVja2luZyBQQVRDSCAzLzk6IGh3L2FybS92aXJ0OiBB
ZGQgU01NVXYzIHRvIHRoZSB2aXJ0IGJvYXJkLi4uCkNoZWNraW5nIFBBVENIIDQvOTogaHcvYXJt
L3ZpcnQ6IEFkZCAyLjExIG1hY2hpbmUgdHlwZS4uLgpDaGVja2luZyBQQVRDSCA1Lzk6IGh3L2Fy
bS92aXJ0LWFjcGktYnVpbGQ6IEFkZCBzbW11djMgbm9kZSBpbiBJT1JUIHRhYmxlLi4uCkNoZWNr
aW5nIFBBVENIIDYvOTogaHcvYXJtL3ZpcnQ6IEFkZCB0bGJpLW9uLW1hcCBwcm9wZXJ0eSB0byB0
aGUgc21tdXYzIG5vZGUuLi4KQ2hlY2tpbmcgUEFUQ0ggNy85OiB0YXJnZXQvYXJtL2t2bTogVHJh
bnNsYXRlIHRoZSBNU0kgZG9vcmJlbGwgaW4ga3ZtX2FyY2hfZml4dXBfbXNpX3JvdXRlLi4uCkNo
ZWNraW5nIFBBVENIIDgvOTogaHcvYXJtL3NtbXV2MzogVkZJTyBpbnRlZ3JhdGlvbi4uLgpDaGVj
a2luZyBQQVRDSCA5Lzk6IGh3L2FybS92aXJ0LWFjcGktYnVpbGQ6IFVzZSB0aGUgQUNQSV9JT1JU
X1NNTVVfVjNfQ0FDSElOR19NT0RFIG1vZGVsLi4uCkVSUk9SOiBjb2RlIGluZGVudCBzaG91bGQg
bmV2ZXIgdXNlIHRhYnMKIzI2OiBGSUxFOiBody9hcm0vdmlydC1hY3BpLWJ1aWxkLmM6NDQwOgor
XkleSXNtbXUtPm1vZGVsID0gMHgzOyAvKiBBQ1BJX0lPUlRfU01NVV9WM19DQUNISU5HX01PREUg
Ki8kCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDE0IGxpbmVzIGNoZWNrZWQKCllvdXIg
cGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVz
dCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9t
YXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlv
dXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMub3Jn

