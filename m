Received: by 10.223.197.9 with SMTP id q9csp9769071wrf;
        Sun, 22 Oct 2017 08:53:05 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TTfxrAa5WVwnpy6B5dCSB9RmhFeEeGJ9sD1AhfszsMH/I10Er8A3PlvuqHhEOW45Wp/V86
X-Received: by 10.55.127.66 with SMTP id a63mr14591313qkd.90.1508687584984;
        Sun, 22 Oct 2017 08:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508687584; cv=none;
        d=google.com; s=arc-20160816;
        b=hVSSUuisVehMK2/2KqnQy9RbcMQiMVuP/QWwxKriMdAqrgjWoANAZNdNgqOO3Iu97D
         3P017TXo0MhInKzv+/OLooCUY2bAT1OZEbYLtkH785hU27pUDBqxIlkwgUR70WpV5Mk/
         WQtcqBeIVJh8lmx9DxmXA8wkNJtMgILJ6lVt4JWK72G1SLj0tmlHKw/rJIxxaIgyJxi7
         zvjM4jmXFXvl9nkSwCplRbxsHDKwr9cTGER0BmtC/MXsLgvXBdiBAPDK4NtYu8MwOgTM
         k903c/Gis6yw806/lCB2psntmoP+/aqDADr6z/L1g5rHTVDmpC0lMHSshI55Dr3eJx7T
         4FwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:in-reply-to
         :message-id:resent-message-id:resent-date:arc-authentication-results;
        bh=sHQAKUefcBeY9zl8+Nn9D4gF9dnlVFxop8bcsFV9vQU=;
        b=xspu6f1w2qjmBhDubenFVj3Kd/eEKJrjysDgrDlcaV/rHZAL4h8I702lkdn75NCO6Y
         Mukv+FZ/YNLOvaq45bz/WPodRP7QhjJNwcWlxKkzy3N67llQ5VJq9L7Vr4TF/6YGWRfr
         4jqRn1zyT+aelK8oIXSox4rrqeIkzZdEwTFkUI74WHDX1HmmYGdmfPClNmcj5aAE/hFg
         Bhb/JUKfifUmI0Y18afqmtJXgzIJoC1LwyhF/vVQkkd2dyVP5gjd8jmURyqSF3VtUSID
         BH8Vpjsyea7mGXcKulUQF4euzUh884/sHtT4GhfVF4ywT4YXSnO/Cw6YEk4u3yGrRYoH
         nAhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b74si3514705qkg.64.2017.10.22.08.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Oct 2017 08:53:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6IYg-00026S-Nv
	for alex.bennee@linaro.org; Sun, 22 Oct 2017 11:53:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1e6IYQ-00026H-5v
	for qemu-arm@nongnu.org; Sun, 22 Oct 2017 11:52:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1e6IYM-0005IH-3r
	for qemu-arm@nongnu.org; Sun, 22 Oct 2017 11:52:46 -0400
Resent-Date: Sun, 22 Oct 2017 11:52:46 -0400
Resent-Message-Id: <E1e6IYM-0005IH-3r@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21432)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1e6IYL-0005H8-S7
	for qemu-arm@nongnu.org; Sun, 22 Oct 2017 11:52:42 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1508681134448873.6336616792553;
	Sun, 22 Oct 2017 07:05:34 -0700 (PDT)
Message-ID: <150868113318.482.11705826106714639873@b58463cdfd5f>
In-Reply-To: <1508678882-4327-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: sundeep.lkml@gmail.com
Date: Sun, 22 Oct 2017 07:05:34 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu devel v3 PATCH] msf2: Remove dead
 code reported by Coverity
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
Cc: peter.maydell@linaro.org, famz@redhat.com, f4bug@amsat.org,
	qemu-devel@nongnu.org, darren.kenny@oracle.com,
	imammedo@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	alistair23@gmail.com, sundeep.lkml@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: //CYv1MveBjm

SGksCgpUaGlzIHNlcmllcyBmYWlsZWQgYXV0b21hdGljIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5k
IHRoZSB0ZXN0aW5nIGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZl
IGRvY2tlciBpbnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHku
CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMTUwODY3ODg4Mi00MzI3LTEtZ2l0LXNlbmQtZW1h
aWwtc3VuZGVlcC5sa21sQGdtYWlsLmNvbQpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1FlbXUgZGV2
ZWwgdjMgUEFUQ0hdIG1zZjI6IFJlbW92ZSBkZWFkIGNvZGUgcmVwb3J0ZWQgYnkgQ292ZXJpdHkK
Cj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKc2V0IC1lCmdpdCBzdWJtb2R1
bGUgdXBkYXRlIC0taW5pdCBkdGMKIyBMZXQgZG9ja2VyIHRlc3RzIGR1bXAgZW52aXJvbm1lbnQg
aW5mbwpleHBvcnQgU0hPV19FTlY9MQpleHBvcnQgSj04CnRpbWUgbWFrZSBkb2NrZXItdGVzdC1x
dWlja0BjZW50b3M2CnRpbWUgbWFrZSBkb2NrZXItdGVzdC1idWlsZEBtaW4tZ2xpYgp0aW1lIG1h
a2UgZG9ja2VyLXRlc3QtbWluZ3dAZmVkb3JhCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1ibG9ja0Bm
ZWRvcmEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4Nzgy
MTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1w
cm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgICAgICAgcGF0Y2hldy8xNTA4Njc4ODgy
LTQzMjctMS1naXQtc2VuZC1lbWFpbC1zdW5kZWVwLmxrbWxAZ21haWwuY29tIC0+IHBhdGNoZXcv
MTUwODY3ODg4Mi00MzI3LTEtZ2l0LXNlbmQtZW1haWwtc3VuZGVlcC5sa21sQGdtYWlsLmNvbQpT
d2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmExYzY2YjY2ZTcgbXNmMjogUmVtb3ZlIGRl
YWQgY29kZSByZXBvcnRlZCBieSBDb3Zlcml0eQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KU3VibW9k
dWxlICdkdGMnIChnaXQ6Ly9naXQucWVtdS1wcm9qZWN0Lm9yZy9kdGMuZ2l0KSByZWdpc3RlcmVk
IGZvciBwYXRoICdkdGMnCkNsb25pbmcgaW50byAnL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1w
LWVndWJhYW9jL3NyYy9kdGMnLi4uCmZhdGFsOiBDb3VsZCBub3QgcmVhZCBmcm9tIHJlbW90ZSBy
ZXBvc2l0b3J5LgoKUGxlYXNlIG1ha2Ugc3VyZSB5b3UgaGF2ZSB0aGUgY29ycmVjdCBhY2Nlc3Mg
cmlnaHRzCmFuZCB0aGUgcmVwb3NpdG9yeSBleGlzdHMuCmZhdGFsOiBjbG9uZSBvZiAnZ2l0Oi8v
Z2l0LnFlbXUtcHJvamVjdC5vcmcvZHRjLmdpdCcgaW50byBzdWJtb2R1bGUgcGF0aCAnL3Zhci90
bXAvcGF0Y2hldy10ZXN0ZXItdG1wLWVndWJhYW9jL3NyYy9kdGMnIGZhaWxlZApGYWlsZWQgdG8g
Y2xvbmUgJ2R0YycuIFJldHJ5IHNjaGVkdWxlZApDbG9uaW5nIGludG8gJy92YXIvdG1wL3BhdGNo
ZXctdGVzdGVyLXRtcC1lZ3ViYWFvYy9zcmMvZHRjJy4uLgpmYXRhbDogQ291bGQgbm90IHJlYWQg
ZnJvbSByZW1vdGUgcmVwb3NpdG9yeS4KClBsZWFzZSBtYWtlIHN1cmUgeW91IGhhdmUgdGhlIGNv
cnJlY3QgYWNjZXNzIHJpZ2h0cwphbmQgdGhlIHJlcG9zaXRvcnkgZXhpc3RzLgpmYXRhbDogY2xv
bmUgb2YgJ2dpdDovL2dpdC5xZW11LXByb2plY3Qub3JnL2R0Yy5naXQnIGludG8gc3VibW9kdWxl
IHBhdGggJy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC1lZ3ViYWFvYy9zcmMvZHRjJyBmYWls
ZWQKRmFpbGVkIHRvIGNsb25lICdkdGMnIGEgc2Vjb25kIHRpbWUsIGFib3J0aW5nCj09PSBPVVRQ
VVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwg
Z2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10u
ClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMub3Jn

