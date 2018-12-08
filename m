Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1426208wrt;
        Sat, 8 Dec 2018 00:42:56 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WnT3sbozgm7edRzFcT1nWB9lKyepCV4tH+OSi2DUpaqb5p9EjFVjhKpEdkCSRB7Pj953PI
X-Received: by 2002:ad4:40c9:: with SMTP id x9mr4817172qvp.165.1544258576319;
        Sat, 08 Dec 2018 00:42:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544258576; cv=none;
        d=google.com; s=arc-20160816;
        b=yn89bs+cUtp++h+Us3z3E91QuyWLKjyx+Tl+im3N6MvD9RyqwNBy1AQQksOfQ29weJ
         gjYHYvMK91At6IcPm6Xrv/9x09AfTWhnrU8rVuoaF8cAnErlZCglSQz6A+nsJfFV4ahh
         2qZn0ik38QXwn0KA8s1KoG6qC78OXIakkwgbzONjTku2GJEabj78W/EgER4bkb/QppRJ
         /KMZMqxKAT1q/MUIN89xhFVdk5Y9YohA4ENC1dZNzFInBI6muIeyLK6fBD3A3P+kkCVT
         SYileKSrwzD+7URvgSd00E7pS7puujoqMfjtNA3jETeizqBuPUMkXM/6gnSEA60ONXKa
         uhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=VXvmMW3009j6Zpp0WffEn1e9RWJxfVpV4dKixviKpro=;
        b=MDoxx/98I3j6t3NwvDYlejNQq1ENhXi1QInQyY/paQv14MG6p87ZbepiIqwW5il9B6
         aPtPkqKMOHZAJg4FL+bOQDj3TY1zGK6OUFkDiIPknbd0t+Uw+hq05UjlKqggBxfqqVg9
         t0QIfTh61A54wrBttOwvqwb8svGu3fraxQIu1G96KIXY8OX3DgRZN4hcLnVPNnujeoyW
         s9NBQjfLkWnT2eU+3ShiSoizXkaO9fkr0WPddtuGH1TonzzPoo3i0oFvwXF+j+gN4CjU
         /5YzHSiE/e6crOlMg5gCj37l+zKoDksSBc/Y9NBEIleWAbWhFfnLI757b4FxGleOa3Ga
         nVqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 45si623010qtr.28.2018.12.08.00.42.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 08 Dec 2018 00:42:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVYCN-00033N-S3
	for alex.bennee@linaro.org; Sat, 08 Dec 2018 03:42:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gVYCC-00032C-RX
	for qemu-arm@nongnu.org; Sat, 08 Dec 2018 03:42:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gVYC8-0008Fg-Sw
	for qemu-arm@nongnu.org; Sat, 08 Dec 2018 03:42:44 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:40744 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gVYC8-0008Bq-Hg; Sat, 08 Dec 2018 03:42:40 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 93DBF559EF37E46D2707;
	Sat,  8 Dec 2018 16:42:32 +0800 (CST)
Received: from kjyxapp03.zte.com.cn ([10.30.12.202])
	by mse01.zte.com.cn with SMTP id wB88gTb7025077;
	Sat, 8 Dec 2018 16:42:29 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
	Sat, 8 Dec 2018 16:42:31 +0800 (CST)
Date: Sat, 8 Dec 2018 16:42:31 +0800 (CST)
X-Zmail-TransId: 2b055c0b83f7129a7d84
X-Mailer: Zmail v1.0
Message-ID: <201812081642314652084@zte.com.cn>
In-Reply-To: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
References: 1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <peter.maydell@linaro.org>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse01.zte.com.cn wB88gTb7025077
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BPATCH_V12_0/5=5D_add_pvpanic_mmio_suppor?=
 =?utf-8?q?t?=
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
Cc: drjones@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uO7UHHo28K/f



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PnYxMCAtLT4gdjExCj5jaGFuZ2UgY29uZmlndXJlIGludGVyZmFjZSBpbiB2aXJ0IG1hY2hpbmUg
Y29uZmlndXJlIHBhcmFtZXRlcnMuCj4KPnYxMSAtLT4gdjEyCj5yZWFsaXplIHB2cGFuaWMgYXMg
YSBwY2kgZGV2aWNlIGFuZCB1c2UgdGhlIG1taW8gb2YgcGNpIGRldmljZS4KPgo+UGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgKDIpOgo+aHcvbWlzYy9wdnBhbmljOiBCdWlsZCB0aGUgcHZwYW5pYyBk
ZXZpY2UgaW4gJChjb21tb24tb2JqKQo+aHcvbWlzYy9wdnBhbmljOiBDb3NtZXRpYyByZW5hbWlu
Zwo+Cj5QZW5nIEhhbyAoMyk6Cj5wdnBhbmljIDogdXBkYXRlIHB2cGFuaWMgZG9jdW1lbnQKPmh3
L2FybS92aXJ0OiBVc2UgdGhlIHB2cGFuaWMgZGV2aWNlCj5wdnBhbmljOiBhZGQgbW1pbyBpbnRl
cmZhY2UgYXMgYSBwY2kgZGV2aWNlCkhpICwgSSByZXN1Ym1pdCBhIHNlcmllcyBwYXRjaGVzIGZv
ciByZWFsaXplaW5nIHB2cGFuaWMgYXMgYSBwY2kgZGV2aWNlLgphbmQgSSB3YW50IHRvIGNvbmZp
cm0gaWYgdGhlc2UgcGF0Y2hlcyBtZWV0IHRoZSByZXF1aXJlbWVudHMuIApJIGtub3cgdGhlcmUg
YXJlIHN0aWxsIHNvbWUgaW1wZXJmZWN0aW9ucyBpbiB0aGlzIHNlcmllcyBvZiBwYXRjaGVzLCAK
c3VjaCBhcyBob3cgdG8gYXZvaWQgeDg2L3B2cGFuaWMgdXNpbmcgSVNBL3B2cGFuaWMgYW5kIFBD
SS9wdnBhbmljIGF0IHRoZSBzYW1lIHRpbWUuCiBCdXQgSSB3YW50IHRvIGNvbmZpcm0gaWYgdGhl
cmUgaXMgYSBwcm9ibGVtIHdpdGggdGhlIG92ZXJhbGwgZGlyZWN0aW9uIG9mIGltcGxlbWVudGF0
aW9uIAphcyBhIFBDSSBkZXZpY2UuVGhlbiBJIGNhbiByZXN1Ym1pdCBwYXRjaGVzIHRvIGtlcm5l
bCBmb3IgcmVwbGFjaW5nIHRoZSBwcmV2aW91cyBvbmVzLgoKVGhhbmtzLg==


--=====_003_next=====--

--=====_001_next=====--

