Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1126838lfp;
        Fri, 31 Jan 2020 13:34:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYRvrsEFp/mjEOEVThiCU7De6tXEcHWd9faYjNMpHnMPRNXfwDA1d/Mteovlpx6LPEtkOg
X-Received: by 2002:a05:6214:6f0:: with SMTP id bk16mr12627406qvb.23.1580506441359;
        Fri, 31 Jan 2020 13:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580506441; cv=none;
        d=google.com; s=arc-20160816;
        b=zYF7qLFTe6RsSrHNstcbET5cE9EDJXVWuNN6PDxP/8pKUA2KOxCDwNbCiyC61tfFL7
         aNy/p3wDP/PZGospu6lE6ZM56ot0DDQv2OlRMgiFoOjoyMVIXtXsxWWmR6Z6FKhpG0HY
         gHiJuf0cwBPafgTk5IfrGQuTWWQexsj6PTHWcsjO4qMnoPQLhd+7LEJgSJRFgNQaGHee
         6HdDid1IXbbh1d1/Wv6zdmFbf4WIWXdQPiLM7PNEKGAHxg/JtfdMzpB/2wV0GgIKFtz6
         9bxYAM6sqObEZy+pNTSAbw3p9IYfT3mqnD/CTHJp8bWIzAk5nj6AtL2Baav5gSe9g3+Z
         z5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:date:to:from
         :resent-from:content-transfer-encoding:mime-version:message-id
         :subject:in-reply-to:resent-message-id:resent-date;
        bh=/aU2EUGyIh4UQNQu1lvH+aZ8buXEG33B5hU3/cDWuDI=;
        b=u58mXVaZ2yqR8gH8dTvXTB1xuoWOqz5Gq8/YRgBCW+fCXCYDVjYDrlk5CgBXgW9oPE
         IEQSQwRnoEyy40Fv6CZRJEWBr8Gzv5+fMDzv6yGgAPWbyxEGiGY9m8RnEnBb6GVqvqxJ
         Fs3niCKv7nD+FB4hNDib5C6P7+5Tjh+arEYHgCkKiiXbfXGTonxqt9HZ459ZhPxDkeRW
         uY5JudV7VS480rPm5sVXd5SsR+TlaE0XLyOQxlaKnPNxZ9GHle28exofbBijRGCHPCAT
         IugIwqMEeOw8CqmCMreB3EExf75onZm0U54VNhQHIakQLWDLHprklKYVUEdMZ8boUUy/
         APvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o34si6861853qtd.109.2020.01.31.13.34.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 13:34:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixdvM-00035G-RK
	for alex.bennee@linaro.org; Fri, 31 Jan 2020 16:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1ixdvC-00034y-KS
 for qemu-arm@nongnu.org; Fri, 31 Jan 2020 16:33:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1ixdvA-0006QR-Tc
 for qemu-arm@nongnu.org; Fri, 31 Jan 2020 16:33:50 -0500
Resent-Date: Fri, 31 Jan 2020 16:33:49 -0500
Resent-Message-Id: <E1ixdvA-0006QR-Tc@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21110)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1ixdvA-0006IO-Lm; Fri, 31 Jan 2020 16:33:48 -0500
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1580506414270910.1412821761918;
 Fri, 31 Jan 2020 13:33:34 -0800 (PST)
In-Reply-To: <20200131212742.18579-1-lyan@suse.com>
Subject: Re: [PATCH] target/arm/monitor: query-cpu-model-expansion crashed
 qemu when using machine type none
Message-ID: <158050641310.22889.11030132008008695138@a1bbccc8075a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: LYan@suse.com
Date: Fri, 31 Jan 2020 13:33:34 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G8aY9zV9aG8m

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDEzMTIxMjc0Mi4xODU3
OS0xLWx5YW5Ac3VzZS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBzb21l
IGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZvcm1h
dGlvbjoKClN1YmplY3Q6IFtQQVRDSF0gdGFyZ2V0L2FybS9tb25pdG9yOiBxdWVyeS1jcHUtbW9k
ZWwtZXhwYW5zaW9uIGNyYXNoZWQgcWVtdSB3aGVuIHVzaW5nIG1hY2hpbmUgdHlwZSBub25lCk1l
c3NhZ2UtaWQ6IDIwMjAwMTMxMjEyNzQyLjE4NTc5LTEtbHlhbkBzdXNlLmNvbQpUeXBlOiBzZXJp
ZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBi
YXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVs
aW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0t
bWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpGcm9tIGh0dHBzOi8vZ2l0
aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogICBhZWFiOGU1Li4yOGRiNjRmICBtYXN0ZXIg
ICAgIC0+IG1hc3RlcgpGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVt
dQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjAwMTMxMjEyNzQyLjE4NTc5LTEtbHlh
bkBzdXNlLmNvbSAtPiBwYXRjaGV3LzIwMjAwMTMxMjEyNzQyLjE4NTc5LTEtbHlhbkBzdXNlLmNv
bQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjU0YmQzM2IgdGFyZ2V0L2FybS9tb25p
dG9yOiBxdWVyeS1jcHUtbW9kZWwtZXhwYW5zaW9uIGNyYXNoZWQgcWVtdSB3aGVuIHVzaW5nIG1h
Y2hpbmUgdHlwZSBub25lCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogY29kZSBpbmRlbnQg
c2hvdWxkIG5ldmVyIHVzZSB0YWJzCiM0MzogRklMRTogdGFyZ2V0L2FybS9tb25pdG9yLmM6MTQ5
OgorXkleSV5JICAgICFzdHJuY21wKG1vZGVsLT5uYW1lLCBjcHVfdHlwZSwgbGVuKSkgeyQKCkVS
Uk9SOiBjb2RlIGluZGVudCBzaG91bGQgbmV2ZXIgdXNlIHRhYnMKIzQ0OiBGSUxFOiB0YXJnZXQv
YXJtL21vbml0b3IuYzoxNTA6CiteSV5JICAgIC8qIEtWTSBpcyBlbmFibGVkIGFuZCB3ZSdyZSB1
c2luZyB0aGlzIHR5cGUsIHNvIGl0IHdvcmtzLiAqLyQKCkVSUk9SOiBjb2RlIGluZGVudCBzaG91
bGQgbmV2ZXIgdXNlIHRhYnMKIzQ1OiBGSUxFOiB0YXJnZXQvYXJtL21vbml0b3IuYzoxNTE6Cite
SV5JICAgIHN1cHBvcnRlZCA9IHRydWU7JAoKdG90YWw6IDMgZXJyb3JzLCAwIHdhcm5pbmdzLCAy
NSBsaW5lcyBjaGVja2VkCgpDb21taXQgNTRiZDMzYjViZjAxICh0YXJnZXQvYXJtL21vbml0b3I6
IHF1ZXJ5LWNwdS1tb2RlbC1leHBhbnNpb24gY3Jhc2hlZCBxZW11IHdoZW4gdXNpbmcgbWFjaGlu
ZSB0eXBlIG5vbmUpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBv
ZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFp
bnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09
PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZh
aWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAwMTMxMjEyNzQyLjE4NTc5LTEt
bHlhbkBzdXNlLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWls
IGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcv
XS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=
