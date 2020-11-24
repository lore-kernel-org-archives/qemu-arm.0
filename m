Received: by 2002:a0c:aa14:0:0:0:0:0 with SMTP id d20csp524408qvb;
        Tue, 24 Nov 2020 05:03:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziRKg5gc6TSQLSbec9eSJGNxkomEGuv6Jv8SGLDDSaxPOenYnMdVKIZjpJB2xU9nDUZWLM
X-Received: by 2002:a25:2fcf:: with SMTP id v198mr6483246ybv.492.1606223016646;
        Tue, 24 Nov 2020 05:03:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a62si14271793ybi.38.2020.11.24.05.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 05:03:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khXyp-0002U3-TG
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 08:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1khXwY-0008OB-IK; Tue, 24 Nov 2020 08:01:16 -0500
Resent-Date: Tue, 24 Nov 2020 08:01:14 -0500
Resent-Message-Id: <E1khXwY-0008OB-IK@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1khXwR-0007e5-C4; Tue, 24 Nov 2020 08:01:13 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1606222853; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IyZ/n33TRK3qCUof4MAKmo+J9Hl0NoxwDpOxFl3mIjz48h5wDe3Pcj5ISHJF27HFwzJbC6hP1mWGOBDRw1HP3pl+t82P0OdriNLh2vIjD6R0KBQB/B6OOL0I62zCK4G9tqKMqEOcrL/Up699nDhn5236pufSnJzvUXTLl2Uu/Ko=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1606222853;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=B4+LYgnrM5RRei6GIq0W5J+UY1yz5dvlK78NkOFNfN0=; 
 b=BXXuhdO3jqsU/uvjLNmDZa/NJViPXQNb0f/nE9LgcZxZCl6y3NzT5aVAct5TLJh4tip/YfF905JOliCaY2H/yt+zA2m512OzA0EyheQPAfRMmVR3PUVXVbdRcM8dR5nYIo9zYuB6fWobG4ux47R4+WxJzNNXhWEJVQuLzpUFCEU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1606222844759223.07243068827995;
 Tue, 24 Nov 2020 05:00:44 -0800 (PST)
In-Reply-To: <20201124125235.266884-1-marcandre.lureau@redhat.com>
Subject: Re: [PATCH 0/2] Remove GCC < 4.8 checks
Message-ID: <160622284274.25614.2564084651371171994@9aeb27d8af94>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: marcandre.lureau@redhat.com
Date: Tue, 24 Nov 2020 05:00:44 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
 stefanha@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rT9UPSXBx54M

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTEyNDEyNTIzNS4yNjY4
ODQtMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2Vl
bXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBm
b3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIwMTEyNDEy
NTIzNS4yNjY4ODQtMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENI
IDAvMl0gUmVtb3ZlIEdDQyA8IDQuOCBjaGVja3MKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFt
Ci4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQ
VCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEz
Mzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcg
dXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMDExMjQxMjI5MzYuMzA1ODgtMS1rcmF4ZWxAcmVkaGF0
LmNvbSAtPiBwYXRjaGV3LzIwMjAxMTI0MTIyOTM2LjMwNTg4LTEta3JheGVsQHJlZGhhdC5jb20K
ICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIwMTEyNDEyNTIzNS4yNjY4ODQtMS1tYXJj
YW5kcmUubHVyZWF1QHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIwMTEyNDEyNTIzNS4yNjY4ODQt
MS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0
ZXN0JwpjOWZkNzZmIGNvbXBpbGVyLmg6IHJlbW92ZSBRRU1VX0dOVUNfUFJFUkVRIG1hY3JvCjQ0
MjhmNTUgUmVtb3ZlIEdDQyB2ZXJzaW9uIGNoZWNrcyAoYWxsIDwgNC44KQoKPT09IE9VVFBVVCBC
RUdJTiA9PT0KMS8yIENoZWNraW5nIGNvbW1pdCA0NDI4ZjU1Mjg3MWMgKFJlbW92ZSBHQ0MgdmVy
c2lvbiBjaGVja3MgKGFsbCA8IDQuOCkpCldBUk5JTkc6IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBk
ZWZpbmVzIHNob3VsZCBiZSBhdm9pZGVkCiMyMjogRklMRTogYWNjZWwvdGNnL2NwdS1leGVjLmM6
NzI3OgorI2lmIGRlZmluZWQoX19jbGFuZ19fKQoKV0FSTklORzogQmxvY2sgY29tbWVudHMgdXNl
IGEgbGVhZGluZyAvKiBvbiBhIHNlcGFyYXRlIGxpbmUKIzg2OiBGSUxFOiBpbmNsdWRlL3FlbXUv
Y29tcGlsZXIuaDoxMDU6CisgICAvKiBNYXAgX19wcmludGZfXyB0byBfX2dudV9wcmludGZfXyBi
ZWNhdXNlIHdlIHdhbnQgc3RhbmRhcmQgZm9ybWF0IHN0cmluZ3MKCldBUk5JTkc6IEJsb2NrIGNv
bW1lbnRzIHVzZSBhIHRyYWlsaW5nICovIG9uIGEgc2VwYXJhdGUgbGluZQojODc6IEZJTEU6IGlu
Y2x1ZGUvcWVtdS9jb21waWxlci5oOjEwNjoKKyAgICAqIGV2ZW4gd2hlbiBNaW5HVyBvciBHTGli
IGluY2x1ZGUgZmlsZXMgdXNlIF9fcHJpbnRmX18uICovCgpFUlJPUjogc3BhY2UgcHJvaGliaXRl
ZCBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWUgYW5kIG9wZW4gcGFyZW50aGVzaXMgJygnCiMxMjk6IEZJ
TEU6IHRlc3RzL3RjZy9hcm0vZmN2dC5jOjc2OgorIyBkZWZpbmUgU05BTkYgKF9fYnVpbHRpbl9u
YW5zZiAoIiIpKQoKRVJST1I6IHNwYWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1l
IGFuZCBvcGVuIHBhcmVudGhlc2lzICcoJwojMTMwOiBGSUxFOiB0ZXN0cy90Y2cvYXJtL2ZjdnQu
Yzo3NzoKKyMgZGVmaW5lIFNOQU4gKF9fYnVpbHRpbl9uYW5zICgiIikpCgpFUlJPUjogc3BhY2Ug
cHJvaGliaXRlZCBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWUgYW5kIG9wZW4gcGFyZW50aGVzaXMgJygn
CiMxMzE6IEZJTEU6IHRlc3RzL3RjZy9hcm0vZmN2dC5jOjc4OgorIyBkZWZpbmUgU05BTkwgKF9f
YnVpbHRpbl9uYW5zbCAoIiIpKQoKV0FSTklORzogYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGRlZmlu
ZXMgc2hvdWxkIGJlIGF2b2lkZWQKIzE0NjogRklMRTogdG9vbHMvdmlydGlvZnNkL2Z1c2VfY29t
bW9uLmg6ODEzOgorI2lmIGRlZmluZWQoX19HTlVDX18pICYmICFkZWZpbmVkIF9fY3BsdXNwbHVz
Cgp0b3RhbDogMyBlcnJvcnMsIDQgd2FybmluZ3MsIDEwNiBsaW5lcyBjaGVja2VkCgpQYXRjaCAx
LzIgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVy
cm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBz
ZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjIvMiBDaGVja2luZyBjb21taXQgYzlmZDc2
ZjgyODY2IChjb21waWxlci5oOiByZW1vdmUgUUVNVV9HTlVDX1BSRVJFUSBtYWNybykKPT09IE9V
VFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxs
IGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDExMjQxMjUy
MzUuMjY2ODg0LTEtbWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRj
aC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==
