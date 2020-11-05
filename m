Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp741721lfb;
        Thu, 5 Nov 2020 12:37:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxMtrBVFGI+JZfoEV1q3sm2ot0xI9WSf8aHRcta7XFryER0SL2c0IcIYt2vsWfsvtFaypW
X-Received: by 2002:a37:8107:: with SMTP id c7mr3901496qkd.361.1604608657897;
        Thu, 05 Nov 2020 12:37:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604608657; cv=none;
        d=google.com; s=arc-20160816;
        b=l+EgVuIxUKGO8Il8q2rc+mH9L8MOh9i/KpzU/jgqBZXXzsRG+mvW+jdjbh8KsqDUMD
         U7c08YtfVDcFtwu8wvbx2LRLs7LyNNE7z+qDML0mN7KupjRgBF3kwzmaajA6vl9kX5oh
         Jj8aST2hG5Z3LaQlsDi3AU0TcthzLM3WfQ69g57o/vzM34tovb4SefMl0hnI6uIatkXo
         xeXqhZuuxhuo9cZlrnXXKCqlWv9EtmamMqyamDhRFXSaqoaKa326BgTa/iBM5Ts09QSY
         seT50aIRVvH3fq7Wlq/Q1YDnlGNE3cZL2WqOt5SEGJyw0iiwwtINKHXmCl/mGNBamcjN
         VilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:sender:errors-to:content-transfer-encoding:cc:reply-to
         :from:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:in-reply-to:to:user-agent:references:delivered-to
         :dkim-signature:dkim-signature;
        bh=dlCLNuTSClQH2CBXr3iYk4ZXWUAd5PDJr/XD26L2a/A=;
        b=AwuX0IkI0cYVizJMc4252khpZwuLoDp9Es7l/HEawB81AyOhJrlXZyFtpKCIduurYt
         7TTeDAvWaaREn5rEMkxRyDDcsyTrx7zsTjKdSoF7K83dYZStl9Fhd3IDdWbx30zhu/0a
         7EaTiZTCgIx2UIaImqE4XHsljkKqVU342mQg9B6/urOudSCR9Y5Rvg/XQKWSTX4GUPa9
         H/OaJ94gQIqDALqBpwayqSbuuiLtNPuXUfxo2/AnwQDsp9Ng0azzZKylOGMh/1+wrAYu
         HaBACDhimRRD49PyQhx5aFVpxdsgy7aEgZtiziSFz7Ks7mh1mXd55kScyTDjV7OUX1kI
         W4qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@op-lists.linaro.org header.s=jxufeesawhzb7d2rfi3jvlzsjb2ip5h5 header.b=gZkrhAsc;
       dkim=pass header.i=@amazonses.com header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=B6dIAYWl;
       spf=pass (google.com: domain of 010001759a20f914-61dc2fa3-b331-4391-995a-087f8fe3ccb8-000000@amazonses.com designates 54.240.8.237 as permitted sender) smtp.mailfrom=010001759a20f914-61dc2fa3-b331-4391-995a-087f8fe3ccb8-000000@amazonses.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <010001759a20f914-61dc2fa3-b331-4391-995a-087f8fe3ccb8-000000@amazonses.com>
Received: from a8-237.smtp-out.amazonses.com (a8-237.smtp-out.amazonses.com. [54.240.8.237])
        by mx.google.com with ESMTPS id j67si1353375qke.370.2020.11.05.12.37.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 05 Nov 2020 12:37:37 -0800 (PST)
Received-SPF: pass (google.com: domain of 010001759a20f914-61dc2fa3-b331-4391-995a-087f8fe3ccb8-000000@amazonses.com designates 54.240.8.237 as permitted sender) client-ip=54.240.8.237;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@op-lists.linaro.org header.s=jxufeesawhzb7d2rfi3jvlzsjb2ip5h5 header.b=gZkrhAsc;
       dkim=pass header.i=@amazonses.com header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=B6dIAYWl;
       spf=pass (google.com: domain of 010001759a20f914-61dc2fa3-b331-4391-995a-087f8fe3ccb8-000000@amazonses.com designates 54.240.8.237 as permitted sender) smtp.mailfrom=010001759a20f914-61dc2fa3-b331-4391-995a-087f8fe3ccb8-000000@amazonses.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=jxufeesawhzb7d2rfi3jvlzsjb2ip5h5; d=op-lists.linaro.org;
	t=1604608653;
	h=References:To:In-reply-to:Date:Message-ID:MIME-Version:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Sender;
	bh=dlCLNuTSClQH2CBXr3iYk4ZXWUAd5PDJr/XD26L2a/A=;
	b=gZkrhAsc6E1tfRM5c5HGk9vU8xuXNegqt/nSyFPNa66pDGwmEgbMdTHuiKaZqn/t
	jK8djc0QRiIFmDTw+w2j17yHBeD8FDneXm3doLZK8AP4dnLyBQg70+bXBT9YWFMCtHc
	vHltEuAG1siIsvujYAVcAwvQHa7xTvMCE8RrzjDc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1604608653;
	h=References:To:In-reply-to:Date:Message-ID:MIME-Version:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Sender:Feedback-ID;
	bh=dlCLNuTSClQH2CBXr3iYk4ZXWUAd5PDJr/XD26L2a/A=;
	b=B6dIAYWlTDMLV/pf9KsHz1GCEkvsyDN0r6IcRrhPj819JRrzvzZtjXIt8WLJt5Dw
	1jS4XSEBpBx9RdX7XpxhhuyG46ANpMtEhBelPsPBTonzMhLKIJ+RURQbeQjfoopRZHK
	oPqyKVAWaPR+A7iLTssYFJp00SDQktOyu3KW6i60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=xCIhabTLUBg9b2F7/G8U0+TS+Nq9BOCBDpSUH7XtqwY=;
 b=SPCVdmJV+43hY/10xVjlZ6AasCv953U3BifL6LiJtvFGCEBFRsUyhh4SYCOt6xOCvu
 GxCvYyNWNI10AeqvC8xH3w08vk0e+Cp9FvrFmwxHvT1PTLmPUtgEIC4/+JI4l6OMYVqM
 ZoZNKEZEErHQnj22NucVwPWVRyK88ANhfiMUPonVgrMH6VYVGljzozsFa1IA0Es7yVxq
 3mSLN44UAMzp1+n9MGv+ez7jggD5TlM9KuuL4EjO7gKX7r2oLaMRnxwDkcwI+f/ePTqp
 4eWmUoX+eOxBhhXEjGudRZqGUsi50jiTeJVDisEPmHv37Slqez0RtHrku6ryINJGwEKF
 zBWg==
X-Gm-Message-State: AOAM530dvHKFTyFFfwcQadbavVxndQXR1i8nxg6DyXzbmfRxXhIQSm7W
 6jtk7gzQimBA+y1u6V/ICm/I4uZr
X-Received: by 2002:a1c:c912:: with SMTP id f18mr4679164wmb.150.1604608646741; 
 Thu, 05 Nov 2020 12:37:26 -0800 (PST)
References: <20201105175153.30489-1-alex.bennee@linaro.org>
 <20201105175153.30489-2-alex.bennee@linaro.org>
 <ea13af19-9ec7-3d91-e7b8-b4f59aa4cf1d@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
In-reply-to: <ea13af19-9ec7-3d91-e7b8-b4f59aa4cf1d@redhat.com>
Date: Thu, 5 Nov 2020 20:37:33 +0000
Message-ID: <010001759a20f914-61dc2fa3-b331-4391-995a-087f8fe3ccb8-000000@email.amazonses.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [Stratos-dev] [RFC PATCH 01/15] hw/board: promote fdt from ARM
 VirtMachineState to MachineState
X-BeenThere: stratos-dev@op-lists.linaro.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: <stratos-dev.op-lists.linaro.org>
List-Unsubscribe: <https://op-lists.linaro.org/mailman/options/stratos-dev>,
 <mailto:stratos-dev-request@op-lists.linaro.org?subject=unsubscribe>
List-Archive: <http://op-lists.linaro.org/pipermail/stratos-dev/>
List-Post: <mailto:stratos-dev@op-lists.linaro.org>
List-Help: <mailto:stratos-dev-request@op-lists.linaro.org?subject=help>
List-Subscribe: <https://op-lists.linaro.org/mailman/listinfo/stratos-dev>,
 <mailto:stratos-dev-request@op-lists.linaro.org?subject=subscribe>
From: =?utf-8?q?Alex_Benn=C3=A9e_via_Stratos-dev?=
 <stratos-dev@op-lists.linaro.org>
Reply-To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, julien@xen.org,
 Eduardo Habkost <ehabkost@redhat.com>, andre.przywara@arm.com,
 stefano.stabellini@linaro.org, qemu-devel@nongnu.org, "open
 list:Virt" <qemu-arm@nongnu.org>, stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: stratos-dev-bounces@op-lists.linaro.org
Sender: "Stratos-dev" <stratos-dev-bounces@op-lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-SES-Outgoing: 2020.11.05-54.240.8.237
Feedback-ID: 1.us-east-1.jmcvzUYe9AlDnakAERIkFRS/5vTMNWrnHJ82p52fuGk=:AmazonSES
X-TUID: m3WTX/FlS47w

ClBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4gd3JpdGVzOgoKPiBP
biAxMS81LzIwIDY6NTEgUE0sIEFsZXggQmVubsOpZSB3cm90ZToKPj4gVGhlIHVzZSBvZiBGRFQn
cyBpcyBxdWl0ZSBjb21tb24gYWNyb3NzIG91ciB2YXJpb3VzIHBsYXRmb3Jtcy4gVG8KPj4gYWxs
b3cgdGhlIGdlbmVyaWMgbG9hZGVyIHRvIHR3ZWFrIGl0IHdlIG5lZWQgdG8gbWFrZSBpdCBhdmFp
bGFibGUgaW4KPj4gdGhlIGdlbmVyaWMgc3RhdGUuIFRoaXMgY3JlYXRlcyB0aGUgZmllbGQgYW5k
IG1pZ3JhdGVzIHRoZSBpbml0aWFsCj4+IHVzZXIgdG8gdXNlIHRoZSBnZW5lcmljIGZpZWxkLiBP
dGhlciBib2FyZHMgd2lsbCBiZSB1cGRhdGVkIGluIGxhdGVyCj4+IHBhdGNoZXMuCj4+IAo+PiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4+IE1l
c3NhZ2UtSWQ6IDwyMDIwMTAyMTE3MDg0Mi4yNTc2Mi0yLWFsZXguYmVubmVlQGxpbmFyby5vcmc+
Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4K
Pgo+IFR3byBTLW8tYiBiZXR0ZXIgdGhhbiBvbmUhCgpIbW0gSSB3b25kZXIgd2hhdCBoYXBwZW5l
ZCB0aGVyZT8gSSdtIHN1cmUgYjQgYXBwbGllZCB0aGF0IHBhdGNoZXMgZm9yCm1lLgoKPgo+PiAt
LS0KPj4gIGluY2x1ZGUvaHcvYXJtL3ZpcnQuaCB8ICAgMSAtCj4+ICBpbmNsdWRlL2h3L2JvYXJk
cy5oICAgfCAgIDEgKwo+PiAgaHcvYXJtL3ZpcnQuYyAgICAgICAgIHwgMzIyICsrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxNzAg
aW5zZXJ0aW9ucygrKSwgMTU0IGRlbGV0aW9ucygtKQo+Cj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KCgotLSAKQWxleCBCZW5uw6llCi0t
IApTdHJhdG9zLWRldiBtYWlsaW5nIGxpc3QKU3RyYXRvcy1kZXZAb3AtbGlzdHMubGluYXJvLm9y
ZwpodHRwczovL29wLWxpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9zdHJhdG9zLWRl
dgo=
