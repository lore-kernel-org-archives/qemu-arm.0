Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1110656lfc;
        Wed, 27 May 2020 07:12:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8R9nL8x7JsnKoyjwxizgLbBCkVihle8sQVTHgZOUWcfLOt5wLMTV6dVKphZT6uHukUTSb
X-Received: by 2002:aa7:c942:: with SMTP id h2mr24325488edt.23.1590588746500;
        Wed, 27 May 2020 07:12:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590588746; cv=pass;
        d=google.com; s=arc-20160816;
        b=aZorNvj7bk7TIAGa2sMBUSmMsW7hdxsx7phzILzmuVNXL0n3oNcB5Yr2o1SQM28bXT
         bKM/W4oMfv2QeVwAPRqPDI767G9Cae6qmtfm1JmYtNddsbHnkfHACB+HmpCS9h1F7xG7
         jIPbrvjHcIE0X6Jbwnf1M1kqBBdI7lxi/L7aFgnKAQL+loygcN265plA6rhs7Kh4jf4Y
         Yr7bJPlWomJocjsBBtIXJoOPQ0mdMygVr69LgpeBcaDC5jZZTN5dWN5bzwI5oEFuB0m8
         7W0LODdo1yvKP/FwbeHrYO6M6tCTqNifeA3BriVQxQ2E3dDizRIecotrx+XjAGDyX+6x
         /MyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :reply-to:subject:in-reply-to:message-id;
        bh=WAyzjL3hEXT84H/Z2H6ONVPz1tt8FwSrVRCJOz7nvg8=;
        b=CirrJ0gD3tsYttD4uXQXtr2p6XwbP+ERoIAK7gfeLp02+dOLLutJOPsPlZVOgnH8Jx
         /U4yPNG6aC+wfEUvqGygoqEb/b3K+DERRHWR244kgcycWPFL+Xn9DdlWlBYUW2gPR9La
         GaJnYIp5cGxwVzTnVC0HlnkSBkwow/C8Klwf6WPLHCMUb3NyNfvfRAdMODbUjmrCd7/T
         ydTGnPVoqVvXbMHttPuTJX++hsg62ivVYFd1/nfv9Xa2YozZZ+k3B5S7nF0SAI6TMQg8
         1Irl5UfMtgIHbnQRMSgEtWFKOfNhRrn1a4MhwIzEB2elld95ZzonjB2uVb4If4+BJrnh
         pqGA==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com. [136.143.188.53])
        by mx.google.com with ESMTPS id j1si1650372eds.281.2020.05.27.07.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 07:12:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) client-ip=136.143.188.53;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1590588743; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bZaexx1sXc0b76ZjDrU21Yi4OeED0YA3jM+BB/MnxtaHinOxxTNolAKk7IGTUADxgOOeAA4D/cJxbju3eCYspG91wEla0Rv4BERfPeARedgkYElpO4iKBOdmgmuo9upISdYGUAlz4z66pIzAP6/X/8pfdoPtyl1Ou9vO0EEOLKc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1590588743; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=WAyzjL3hEXT84H/Z2H6ONVPz1tt8FwSrVRCJOz7nvg8=; 
	b=Ct2cWzPw3/aJnAU8pBJpjwqBeUi9E7Yh9O7XwJfS84a/1hJWtrQkeQVgFsl+UH2C8mh1YrbWq/60wxxw2WR3a+kxb+DnDiJZeQ1qrIlg4V31a0Hq+/v++wXF1HXqkO5x+cjdnvF5oY7kMTmmLQ61hViVLx3eZM4cB5/GT0TvTpo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1590588741032122.77576622460163; Wed, 27 May 2020 07:12:21 -0700 (PDT)
Message-ID: <159058873989.16318.11496237609169277676@45ef0f9c86ae>
In-Reply-To: <20200527100546.29297-1-alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 0/3] some linux-user guest_base fixes
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Date: Wed, 27 May 2020 07:12:21 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: TQr5pU5ok+FE

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDUyNzEwMDU0Ni4yOTI5
Ny0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKCk1lc3NhZ2UtaWQ6IDIwMjAwNTI3MTAwNTQ2LjI5Mjk3LTEtYWxleC5i
ZW5uZWVAbGluYXJvLm9yZwpTdWJqZWN0OiBbUEFUQ0ggIHYxIDAvM10gc29tZSBsaW51eC11c2Vy
IGd1ZXN0X2Jhc2UgZml4ZXMKVHlwZTogc2VyaWVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09
CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3Jh
bQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJ
UFQgRU5EID09PQoKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUK
IC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIwMDUyNzEwMDU0Ni4yOTI5Ny0xLWFsZXgu
YmVubmVlQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIwMDUyNzEwMDU0Ni4yOTI5Ny0xLWFsZXgu
YmVubmVlQGxpbmFyby5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphNTM3ZTEz
IHRlc3RzL3RjZzogYWRkIHNpbXBsZSBjb21tcGFnZSB0ZXN0IGNhc2UKMjZjNDI0ZSBsaW51eC11
c2VyOiBkZWFsIHdpdGggYWRkcmVzcyB3cmFwIGZvciBBUk1fQ09NTVBBR0Ugb24gMzIgYml0Cjg4
MjVjYjEgbGludXgtdXNlcjogcHJvdmlkZSBmYWxsYmFjayBwZ2RfZmluZF9ob2xlIGZvciBiYXJl
IGNocm9vdHMKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvMyBDaGVja2luZyBjb21taXQgODgyNWNi
MTQ4ZmE4IChsaW51eC11c2VyOiBwcm92aWRlIGZhbGxiYWNrIHBnZF9maW5kX2hvbGUgZm9yIGJh
cmUgY2hyb290cykKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzQ0OiBGSUxFOiBs
aW51eC11c2VyL2VsZmxvYWQuYzoyMTE0Ogorc3RhdGljIHVpbnRwdHJfdCBwZ2RfZmluZF9ob2xl
X2ZhbGxiYWNrKHVpbnRwdHJfdCBndWVzdF9zaXplLCB1aW50cHRyX3QgYnJrLCBsb25nIGFsaWdu
KQoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCA2MCBsaW5lcyBjaGVja2VkCgpQYXRjaCAx
LzMgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVy
cm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBz
ZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KMi8zIENoZWNraW5nIGNvbW1pdCAyNmM0MjRl
MzQ2ZGYgKGxpbnV4LXVzZXI6IGRlYWwgd2l0aCBhZGRyZXNzIHdyYXAgZm9yIEFSTV9DT01NUEFH
RSBvbiAzMiBiaXQpCjMvMyBDaGVja2luZyBjb21taXQgYTUzN2UxM2RiZWE1ICh0ZXN0cy90Y2c6
IGFkZCBzaW1wbGUgY29tbXBhZ2UgdGVzdCBjYXNlKQpXQVJOSU5HOiBhZGRlZCwgbW92ZWQgb3Ig
ZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiMyODogCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CgpFUlJPUjogVXNlIG9mIHZvbGF0aWxlIGlzIHVzdWFsbHkgd3Jv
bmcsIHBsZWFzZSBhZGQgYSBjb21tZW50CiM1NzogRklMRTogdGVzdHMvdGNnL2FybS9jb21tcGFn
ZS5jOjI1OgordHlwZWRlZiBpbnQgKGNtcHhjaGdfZm4pKGludCBvbGR2YWwsIGludCBuZXd2YWws
IHZvbGF0aWxlIGludCAqcHRyKTsKCkVSUk9SOiBVc2Ugb2Ygdm9sYXRpbGUgaXMgdXN1YWxseSB3
cm9uZywgcGxlYXNlIGFkZCBhIGNvbW1lbnQKIzYzOiBGSUxFOiB0ZXN0cy90Y2cvYXJtL2NvbW1w
YWdlLmM6MzE6CisgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2xhdGlsZSBpbnQ2NF90ICpw
dHIpOwoKdG90YWw6IDIgZXJyb3JzLCAxIHdhcm5pbmdzLCA2OSBsaW5lcyBjaGVja2VkCgpQYXRj
aCAzLzMgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVz
dCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxl
IGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAwNTI3MTAwNTQ2LjI5Mjk3LTEtYWxleC5i
ZW5uZWVAbGluYXJvLm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVt
YWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5v
cmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5j
b20=
