Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1888543lfm;
        Thu, 23 Apr 2020 06:29:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypJSrKMlWOuSlxQ/qJ6xGzm3Vp6whWcAugYKinunml5tagRTFX546/hhJ0wfdfPiNGVMWbht
X-Received: by 2002:a0c:8b48:: with SMTP id d8mr4199121qvc.195.1587648581103;
        Thu, 23 Apr 2020 06:29:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si1540596qvq.118.2020.04.23.06.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 06:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRbvA-0005xF-Ei
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 09:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jRbtv-0004Wu-Qd
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 09:28:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jRbtu-0005B8-Ie
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 09:28:23 -0400
Resent-Date: Thu, 23 Apr 2020 09:28:23 -0400
Resent-Message-Id: <E1jRbtu-0005B8-Ie@eggs.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jRbtu-00059t-1m; Thu, 23 Apr 2020 09:28:22 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1587648496; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gcbR2ScVvM4EY6Do7yeawkCS0yQmuV/zPhE3MjQ81IBF9dSIO6tWUEZ1yTuukyr+l8Jk/wF+9qg/gMA6ABI1GCvgTnicw6/HGxewwqRhSJH7mtPQH268273B5TELwWD/oTxuThkp3I1G8WWGknPBm7XHP+pMU9jdbZw8HvWabP4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1587648496;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Ur3hqtb17TzFPGHLOzvMsQ9llrrWlj7fP8hZyM0E274=; 
 b=ce2rZEWsYUMc3hmeotuPZkpUbK8UFihjT8s4eta3jRneL55Kg0I8gxIXbFrlAk66VCD+y1WMiKUaaUZehSmTFL7k/4XnID/xVDScdwQYKyKVMRwpC3Zcy1Mw7WWnH/2jUu1njL5u5GMYnfAVNvZ8BPZ6rILTDyGNTuxCAzfzuiU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1587648493698884.5510476696185;
 Thu, 23 Apr 2020 06:28:13 -0700 (PDT)
In-Reply-To: <20200423110915.10527-1-peter.maydell@linaro.org>
Subject: Re: [PATCH] target/arm: Use correct variable for setting 'max' cpu's
 ID_AA64DFR0
Message-ID: <158764849257.10590.5081716484542096155@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Thu, 23 Apr 2020 06:28:13 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 09:27:50
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 136.143.188.53
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
Cc: qemu-arm@nongnu.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ygBfhdQF+c92

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDQyMzExMDkxNS4xMDUy
Ny0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1BBVENIXSB0YXJnZXQvYXJtOiBVc2UgY29ycmVj
dCB2YXJpYWJsZSBmb3Igc2V0dGluZyAnbWF4JyBjcHUncyBJRF9BQTY0REZSMApNZXNzYWdlLWlk
OiAyMDIwMDQyMzExMDkxNS4xMDUyNy0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZwpUeXBlOiBz
ZXJpZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJz
ZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5h
bWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBs
IC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhj
ZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CmVycm9yOiBSUEMgZmFpbGVkOyBy
ZXN1bHQ9MjIsIEhUVFAgY29kZSA9IDUwNApmYXRhbDogVGhlIHJlbW90ZSBlbmQgaHVuZyB1cCB1
bmV4cGVjdGVkbHkKZXJyb3I6IENvdWxkIG5vdCBmZXRjaCAzYzhjZjVhOWMyMWZmODc4MjE2NGQx
ZGVmN2Y0NGJkODg4NzEzMzg0ClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKICBG
aWxlICJwYXRjaGV3LXRlc3Rlci9zcmMvcGF0Y2hldy1jbGkiLCBsaW5lIDUyMSwgaW4gdGVzdF9v
bmUKICAgIGdpdF9jbG9uZV9yZXBvKGNsb25lLCByWyJyZXBvIl0sIHJbImhlYWQiXSwgbG9nZiwg
VHJ1ZSkKICBGaWxlICJwYXRjaGV3LXRlc3Rlci9zcmMvcGF0Y2hldy1jbGkiLCBsaW5lIDQ4LCBp
biBnaXRfY2xvbmVfcmVwbwogICAgc3Rkb3V0PWxvZ2YsIHN0ZGVycj1sb2dmKQogIEZpbGUgIi9v
cHQvcmgvcmgtcHl0aG9uMzYvcm9vdC91c3IvbGliNjQvcHl0aG9uMy42L3N1YnByb2Nlc3MucHki
LCBsaW5lIDI5MSwgaW4gY2hlY2tfY2FsbAogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJl
dGNvZGUsIGNtZCkKc3VicHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snZ2l0
JywgJ3JlbW90ZScsICdhZGQnLCAnLWYnLCAnLS1taXJyb3I9ZmV0Y2gnLCAnM2M4Y2Y1YTljMjFm
Zjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NCcsICdodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hl
dy1wcm9qZWN0L3FlbXUnXScgcmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMS4KCgoKVGhl
IGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDQy
MzExMDkxNS4xMDUyNy0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy90ZXN0aW5nLmNoZWNrcGF0
Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=
