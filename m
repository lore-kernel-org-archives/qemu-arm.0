Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2793314wrw;
        Wed, 7 Nov 2018 16:56:11 -0800 (PST)
X-Google-Smtp-Source: AJdET5dQd2k4YKTAvpzKco7zMwBrzgN5DF7YSgEVYPG2cZkokd1VrVZMOqmlEd/RSZLqOMrz9kHo
X-Received: by 2002:a0c:ab13:: with SMTP id h19mr2536033qvb.74.1541638571014;
        Wed, 07 Nov 2018 16:56:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541638571; cv=none;
        d=google.com; s=arc-20160816;
        b=P5TZ+jxGpMtdvpvSZ6f4MtetFLhPoG3vqsZVbmnSwZ8N86HFVQPRQwoaXY0TT6OiSe
         KCGYjfp2UFFyy8sw3yMF+rBKpptRpcOn+EfKFG764+wK/vhHMFPHlDQ2IqNbG/hq5TBO
         OnXNmTfv6GuB1wYisMGEM6yKDvJ/Teoy49GF9SZHnOoOFCXUAgt4v+cwZSGwSmb2XGXK
         ycWPYDKdrzlIKvGtpn2K9jpjK8ZxzYLE+dy81WxKUsIwzVAAIe8m9PzV6+Jk/GDuLW/5
         pf+esVyl/zzcvYEdbbykhpMfCMI8W+/Dli1sw0fBJzYtqwGsdahwXa+FKadUEgQE2lzQ
         CXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=lOwTe1xT6nEySKnvsSVE6E/AlATDwHGO2+ejhDIovVE=;
        b=nRF72Vx6VHP3tQmIzOZyARqQOJJdgx7ldsfSZ56w13P5RzOeySIPyAr37GTXObtg3f
         Qc/DOQsT4QtbvYUDnXkbMyfGwYxDU0hr2KwKXcooG5XWYsWoUf4C9TO+UBQMDGK9AII9
         AQT50CUoLlWDTgiUNTPEl//QU4/TmT/+tLqFHcrRBHNeqmTTnrSyXnLTciSsUOWoSssI
         isaqbeTPz5sKaP0YDrZAy97Ern6gtv96E1iD+oRqwUn9MpINjf7sv59n63Lf/W/NIGjt
         6SSiFXNAEZoMVHU7Gn2PS6teZqoPbutmogmcVcxNVu72QfGyR9JH9hqyTA6bnGrbBwKS
         avDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o59-v6si1725052qte.153.2018.11.07.16.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 16:56:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKYcE-0006JU-Hv
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 19:56:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gKYc5-0006J5-4T
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 19:56:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gKYc1-000448-Pj
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 19:56:01 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:49068 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gKYc1-0003x9-AR; Wed, 07 Nov 2018 19:55:57 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 0D91D1B8258E4484A183;
	Thu,  8 Nov 2018 08:55:47 +0800 (CST)
Received: from kjyxapp03.zte.com.cn ([10.30.12.202])
	by mse01.zte.com.cn with SMTP id wA80tcnk075123;
	Thu, 8 Nov 2018 08:55:38 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
	Thu, 8 Nov 2018 08:55:39 +0800 (CST)
Date: Thu, 8 Nov 2018 08:55:39 +0800 (CST)
X-Zmail-TransId: 2b055be3898bb4d6a2fa
X-Mailer: Zmail v1.0
Message-ID: <201811080855392013547@zte.com.cn>
In-Reply-To: <467e77d8-48af-5361-3e31-b9eac79d968d@redhat.com>
References: 1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn,
	467e77d8-48af-5361-3e31-b9eac79d968d@redhat.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <philmd@redhat.com>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse01.zte.com.cn wA80tcnk075123
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 202.103.147.172
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BPATCH_V4_3/5=5D_hw/misc/pvpanic=3A_Add_t?=
 =?utf-8?q?he_MMIO_interface?=
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ov3atvgl1H2Q



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgcGhpbG1kLApBcmUgdGhlcmUgYW55IHByb2JsZW1zIHdpdGggdGhpcyBzZXJpZXMgb2YgcGF0
Y2hlcyAicHZwYW5pYzogYWRkIG1taW8gaW50ZXJmYWNlIj8KVGhlIGtlcm5lbCBwYXJ0IG9mIHRo
aXMgc2VyaWVzIG9mIHBhdGNoZXMgaGFzIGJlZW4gdXBzdHJlYW0uCmdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9ncmVna2gvY2hhci1taXNjLmdpdA==


--=====_003_next=====--

--=====_001_next=====--

