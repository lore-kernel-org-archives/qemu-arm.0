Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4164827lfp;
        Mon, 3 Feb 2020 08:49:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqwv1KyVh9FJrx2T2+yNIQK2dJi8f3PLN5ynwWZRsIBFTL1RvNqEDqNPXJEvo+dRWuBNtXUU
X-Received: by 2002:ac8:5205:: with SMTP id r5mr24706941qtn.230.1580748554498;
        Mon, 03 Feb 2020 08:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580748554; cv=none;
        d=google.com; s=arc-20160816;
        b=e0VIdH9GFnn66VDYr4Cy5Jhb/Ba7e5QIAa0mzi2FxiNimt3UXMOIiECgOMnEDM5NlE
         oytJTQncCEkdbyuA7uhnh1RXOz2LWf8PWBACLC6nXb8njoeeTBe5nrYWiv1HlKus3XD4
         cHavHHdCZ+PdNYucBbc35LP1bdLNZ5Rw0+dm4K8XB5cZxVCxJNqkeZF9+8Dd9NVtVk5Y
         MWVOf4wBs+O70os3rmG8EKhZwBYsNM6yTpwBt8Y6/u4rM4IbIob1bYb36tRrFbTe1NHD
         hAVNFMnuEUzjq+qGU3MvM8ir5V2OCq77ORAm/y2GEuNR8n9ALO/dKbz0Zgr5e1P7agme
         DybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:date:to:from
         :resent-from:content-transfer-encoding:mime-version:message-id
         :subject:in-reply-to:resent-message-id:resent-date;
        bh=1IP7U621T9gJPXXnBbZbEEpGbQ39KypDEQjqFPrLrNQ=;
        b=nYGZIS8cDKz1RsBKJZ+oGOk3RPsdJJHNMyIeO8Y/Z4Lxj9NxzbHsHScxmQkutQXj7C
         WvtrNpAVhGydVkFemShZwOq/IWxYYi2VmSUUUoMSbkaBraJM0QZVJKyTFhkjVFI0SZ0U
         VUvhRuHbfERJBRjupNHXYIJX92OmQ/JS1vPEXj8Age3fXNN4701jyjMXsJxI5V3bgqGD
         v0Lqb8/UpRryrwRIY+iV2r9DdltVdhTdYYUgFc7oY4ktyNVXTawOi1pctvH0m3ObsoE5
         FGOG9ZJs9c9hCdRmD+4GGdvB2DIaHNb9NNvOJAumQhkNZggp+AttoD+QWAYbhtnREMWs
         CKGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si11497283qka.328.2020.02.03.08.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 08:49:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyeuP-000149-VO
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 11:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52724)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iyeuH-00010q-Jm
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 11:49:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iyeuG-00088U-4F
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 11:49:05 -0500
Resent-Date: Mon, 03 Feb 2020 11:49:05 -0500
Resent-Message-Id: <E1iyeuG-00088U-4F@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21110)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iyeuC-0007na-Sm; Mon, 03 Feb 2020 11:49:01 -0500
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1580748519272441.97465150801736;
 Mon, 3 Feb 2020 08:48:39 -0800 (PST)
In-Reply-To: <20200203082619.7426-1-f4bug@amsat.org>
Subject: Re: [PATCH 0/6] hw/arm/raspi: Dynamically create machines based on
 the board revision
Message-ID: <158074851772.10925.5158725085940659173@a1bbccc8075a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: f4bug@amsat.org
Date: Mon, 3 Feb 2020 08:48:39 -0800 (PST)
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
Cc: peter.maydell@linaro.org, alistair@alistair23.me, qemu-devel@nongnu.org,
 Andrew.Baumann@microsoft.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o03E9aYgFZex

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDIwMzA4MjYxOS43NDI2
LTEtZjRidWdAYW1zYXQub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29t
ZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5mb3Jt
YXRpb246CgpTdWJqZWN0OiBbUEFUQ0ggMC82XSBody9hcm0vcmFzcGk6IER5bmFtaWNhbGx5IGNy
ZWF0ZSBtYWNoaW5lcyBiYXNlZCBvbiB0aGUgYm9hcmQgcmV2aXNpb24KTWVzc2FnZS1pZDogMjAy
MDAyMDMwODI2MTkuNzQyNi0xLWY0YnVnQGFtc2F0Lm9yZwpUeXBlOiBzZXJpZXMKCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9u
dWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5h
bGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFz
ZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rl
c3QnCmJhOWZjZTUgaHcvYXJtL3Jhc3BpOiBHZXQgdGhlIENQVSBjb3JlIGNvdW50IGZyb20gdGhl
IHJldmlzaW9uIGNvZGUKZGQ2OGU2ZCBody9hcm0vcmFzcGk6IER5bmFtaWNhbGx5IGNyZWF0ZSBt
YWNoaW5lcyBiYXNlZCBvbiB0aGUgYm9hcmQgcmV2aXNpb24KZDQ3MWJhYSBody9hcm0vcmFzcGk6
IEdldCBib2FyZCBSQU0gc2l6ZSBmcm9tIGJvYXJkIHJldmlzaW9uIGNvZGUKOTdhZTM5ZiBody9h
cm0vcmFzcGk6IEdldCB0aGUgU29DIHR5cGUgbmFtZSBmcm9tIHRoZSByZXZpc2lvbiBjb2RlCmNi
NjRhNmQgaHcvYXJtL3Jhc3BpOiBHZXQgYm9hcmQgdmVyc2lvbiBmcm9tIGJvYXJkIHJldmlzaW9u
IGNvZGUKYTRiNmZjMyBody9hcm0vcmFzcGk6IFVzZSBCQ00yNzA4IG1hY2hpbmUgdHlwZSB3aXRo
IHByZSBEZXZpY2UgVHJlZSBrZXJuZWxzCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzYgQ2hlY2tp
bmcgY29tbWl0IGE0YjZmYzNkNGNhOSAoaHcvYXJtL3Jhc3BpOiBVc2UgQkNNMjcwOCBtYWNoaW5l
IHR5cGUgd2l0aCBwcmUgRGV2aWNlIFRyZWUga2VybmVscykKMi82IENoZWNraW5nIGNvbW1pdCBj
YjY0YTZkZTQ1NzEgKGh3L2FybS9yYXNwaTogR2V0IGJvYXJkIHZlcnNpb24gZnJvbSBib2FyZCBy
ZXZpc2lvbiBjb2RlKQpFUlJPUjogdGhhdCBvcGVuIGJyYWNlIHsgc2hvdWxkIGJlIG9uIHRoZSBw
cmV2aW91cyBsaW5lCiMzNjogRklMRTogaHcvYXJtL3Jhc3BpLmM6NTE6CisgICAgW0JPQVJEX1BJ
Ml0gPQorICAgIHsKCkVSUk9SOiB0aGF0IG9wZW4gYnJhY2UgeyBzaG91bGQgYmUgb24gdGhlIHBy
ZXZpb3VzIGxpbmUKIzQxOiBGSUxFOiBody9hcm0vcmFzcGkuYzo1NjoKKyAgICBbQk9BUkRfUEkz
XSA9CisgICAgewoKdG90YWw6IDIgZXJyb3JzLCAwIHdhcm5pbmdzLCA3NyBsaW5lcyBjaGVja2Vk
CgpQYXRjaCAyLzYgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9m
IHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWlu
dGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjMvNiBDaGVja2luZyBjb21t
aXQgOTdhZTM5ZjFiMmExIChody9hcm0vcmFzcGk6IEdldCB0aGUgU29DIHR5cGUgbmFtZSBmcm9t
IHRoZSByZXZpc2lvbiBjb2RlKQo0LzYgQ2hlY2tpbmcgY29tbWl0IGQ0NzFiYWE4ODM4MCAoaHcv
YXJtL3Jhc3BpOiBHZXQgYm9hcmQgUkFNIHNpemUgZnJvbSBib2FyZCByZXZpc2lvbiBjb2RlKQo1
LzYgQ2hlY2tpbmcgY29tbWl0IGRkNjhlNmRjYWExMSAoaHcvYXJtL3Jhc3BpOiBEeW5hbWljYWxs
eSBjcmVhdGUgbWFjaGluZXMgYmFzZWQgb24gdGhlIGJvYXJkIHJldmlzaW9uKQo2LzYgQ2hlY2tp
bmcgY29tbWl0IGJhOWZjZTU2Njk0NCAoaHcvYXJtL3Jhc3BpOiBHZXQgdGhlIENQVSBjb3JlIGNv
dW50IGZyb20gdGhlIHJldmlzaW9uIGNvZGUpCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21t
YW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0
dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAwMjAzMDgyNjE5Ljc0MjYtMS1mNGJ1Z0BhbXNhdC5v
cmcvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQg
YXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBz
ZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t
