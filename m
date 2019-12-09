Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4817856lff;
        Mon, 9 Dec 2019 11:28:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqykSX0WstH4bZdjzc47hJLgaDJljR5fP9HZeInKOZ47Iw77W8wJaEZx5ZgrXZNsRnNtM+tj
X-Received: by 2002:a05:6402:17fb:: with SMTP id t27mr15679729edy.159.1575919718363;
        Mon, 09 Dec 2019 11:28:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575919718; cv=pass;
        d=google.com; s=arc-20160816;
        b=wrgS383BttX2L6fqhnrjDiXS0W14bQwO79DWKNodTHL+O00N/lbXkQ+Y8pS/9jHNQq
         5Ew8TICiRQbGkEVMPTYQG1LFc/QqMHqjvrMfk18v4eA+2F7W27BW8Gpe3l6/28t68Zyo
         ywu1InW1LxyP6u+q2MYIb5OvazYbdA6kEEdvVUjiyKHcCZnJVj9unw7aXLsAOtO9Q2as
         zq0GvCcsoKZPLWw1NBXsUT/w3uwcdL89JtCXPWrdA1iqJw51bQEkUCWps6WdQPP3Iewc
         eTfgXGE9teyXPIO9tsyzvm202mHKRnFHX7T0245NTXZxLK3uJorbj00I9Swnzr2NHC1N
         c84Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:subject:reply-to:in-reply-to;
        bh=mirHobHjZMfBqXWfg7dmvpd3KYpMKJU9Y3DgZjCNBPc=;
        b=ptRFw/vevalyhbSmhqA4OSRIcsi6ZfaTE4gzXqdWY8IdYrTFV3nfATk9UndXVEW+or
         m5ssdnjKbKtmm8TM6T51dVBz4+eTjsB9H9xykuMtgwRpssThi1y3LoeLC9Qjtnm6LjWG
         RGPJ0Fyxo8gXmJX8zDWzzwNPCCuETzS7F762icmPPoZesU7eI2SDWtiK3QY5NyEPhuyX
         N81Klhj9IbLXQ1KnXGI6ZJySHcFmcMeCQT2umm0c+iYHkjR8tj6UU/8qQUovJnKwUt3+
         e0kPUYPyrzzVAXViUz/i5l8Q4JUa5cJkmPUHcUQABAiJ3bxT+DZQ51s5t1RoXwTjnAED
         wWEg==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.50 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com. [136.143.188.50])
        by mx.google.com with ESMTPS id dx25si441876ejb.28.2019.12.09.11.28.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Dec 2019 11:28:38 -0800 (PST)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.50 as permitted sender) client-ip=136.143.188.50;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.50 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1575919712; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b5gMCZ0w6qHOSAN9xpj+OlkgqfEyriDgNSYhkPzD2j7kOTSZs/DKjcLXlgGbPnP6MfvYM5wna0BULCSmBKymE5OXtWBI0Bwn1Fjru9ZNEo4WFH+waHuPscbxXQNzaCTsD5J+Ba9JOxDvveZjEfteifMhz+Ibm6AeEFeEWX5hIIw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1575919712; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=mirHobHjZMfBqXWfg7dmvpd3KYpMKJU9Y3DgZjCNBPc=; 
	b=YgxIEQNNiMtiXqDht4tuVaXzZoxtqP0RPB8KO4Z1o/gwKmBNQdfArvSOnb5/qPTsbUmVtejghKP8g3sFBpAJwJBfHkG/vTqP2Iq/x1baR2URhR8MRUuDT+a3cFYLemsshbrpMuAJCCaFigCu+Rp2UblsJLFVkggCgzZWvp9Nb+s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1575919712344617.065409095935; Mon, 9 Dec 2019 11:28:32 -0800 (PST)
In-Reply-To: <20191209143723.6368-1-alex.bennee@linaro.org>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target/arm: ensure we use current exception state after SCR update
Message-ID: <157591971115.7675.4665081235284955931@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, richard.henderson@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, philmd@redhat.com
Date: Mon, 9 Dec 2019 11:28:32 -0800 (PST)
X-ZohoMailClient: External
X-TUID: aNe7LZ2pOQ2n

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTIwOTE0MzcyMy42MzY4
LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgdGhl
IGRvY2tlci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5n
IGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0
YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBT
Q1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCm1ha2UgZG9ja2VyLWltYWdlLWNlbnRvczcgVj0x
IE5FVFdPUks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtcXVpY2tAY2VudG9zNyBTSE9XX0VOVj0x
IEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpDbG9uZSBvZiAnaHR0cHM6
Ly9naXQucWVtdS5vcmcvZ2l0L2R0Yy5naXQnIGludG8gc3VibW9kdWxlIHBhdGggJ2R0YycgZmFp
bGVkCmZhaWxlZCB0byB1cGRhdGUgc3VibW9kdWxlIGR0YwpTdWJtb2R1bGUgJ2R0YycgKGh0dHBz
Oi8vZ2l0LnFlbXUub3JnL2dpdC9kdGMuZ2l0KSB1bnJlZ2lzdGVyZWQgZm9yIHBhdGggJ2R0YycK
bWFrZVsxXTogKioqIFsvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtaDFwM3Y3Y2ovc3JjL2Rv
Y2tlci1zcmMuMjAxOS0xMi0wOS0xNC4yOC4yOC4xODIxMl0gRXJyb3IgMQptYWtlWzFdOiBMZWF2
aW5nIGRpcmVjdG9yeSBgL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLWgxcDN2N2NqL3NyYycK
bWFrZTogKioqIFtkb2NrZXItcnVuLXRlc3QtcXVpY2tAY2VudG9zN10gRXJyb3IgMgoKcmVhbCAg
ICAwbTMuOTg1cwp1c2VyICAgIDBtMi41ODJzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBh
dApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MTIwOTE0MzcyMy42MzY4LTEtYWxleC5iZW5u
ZWVAbGluYXJvLm9yZy90ZXN0aW5nLmRvY2tlci1xdWlja0BjZW50b3M3Lz90eXBlPW1lc3NhZ2Uu
Ci0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3Bh
dGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBy
ZWRoYXQuY29t
