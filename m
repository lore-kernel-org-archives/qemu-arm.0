Received: by 2002:a17:90a:ad8a:0:0:0:0 with SMTP id s10csp10521926pjq;
        Thu, 11 Jul 2019 09:27:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVQYrXitvxQqYjKdSx3quW9pMaSCaJmbVJusRMlCs8HGqScEAw1b8KZMVAiEKmFLwOC1ep
X-Received: by 2002:a17:90a:ff17:: with SMTP id ce23mr5795038pjb.47.1562862433298;
        Thu, 11 Jul 2019 09:27:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562862433; cv=pass;
        d=google.com; s=arc-20160816;
        b=ShOsOObFhm5FC9lZG2B/w1GpIiTS4XiFIE/XrdiAOPcvrKVIAYfnGbu4u/4HGcxz4N
         DpdX6tnW1qS6xZoutRTvliieccB00IOxFRxDazxoiX/uCBy9cEoAMTGhp6z95YzAlU55
         PZIAmRH5kifairjsB0TijMmVDApHJKVqiGGWfIKVG2OZaR9dNAphS7cY0HNpijyJt0Nm
         J4PaaB2V9KQKfsUq5RJJFbTsFzl8OjwmitfvoX4wKwqIe0HXMJo8PU3YOFjVpnAd/B9B
         Q2fKPQdQPNcdmO/5PjmSVVsd20lmXol1Be0Dx4pxusBQvg8UOcKvupHR1mDPKQQEGuhG
         TpIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :reply-to:in-reply-to:subject:message-id;
        bh=Cp4gm7ZH8mJSH4RSieA+11u+RdAzfHjQRfeVFOFgpLk=;
        b=h+O/o1IaoTJR844+qiuhkijPJvZ0b3qkqDhdigli6IsYRtHCYnTP0Ga0pNs6zmQytq
         Xvesf885uLO/8BwlMunboBe/ydbwiRuZoeZ1/4ILTbtF6Eur/GcwGk++xPfDV2JQiHht
         4YKSWk5Aek4DuERA2p/GESegCsT+dc9Z9oRw+4rXN9XkWjv5CssH4JdgobvKTraVBUlP
         4dZoi9Dm1eUcrwG/PkzJmT+0v0r+lTj2Tk5S6YZbSPiyjHAxbj1FxavpbERoYbr/3SaC
         +1cahKoMHNpUuoMYFyiQxDVhtaFxwXYOc3WJbk8UkBE5bK9Opfs906J2J9F7r6c7cGPj
         q/Vg==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.59 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o59.zoho.com (sender4-of-o59.zoho.com. [136.143.188.59])
        by mx.google.com with ESMTPS id m11si5240011pls.148.2019.07.11.09.27.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 09:27:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.59 as permitted sender) client-ip=136.143.188.59;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.59 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1562862430; cv=none; 
	d=zoho.com; s=zohoarc; 
	b=BeOwvNsIAPVXoGmxtVD48INYPEbsc09aF1siC/+Rtw1JpBCbZTfrSXJOW52/nAxadeBZAZCjmYJ8dCIR4Dbs3UiG5wL06GQ+rWBkrHhPUazZTRquoT027823aFZo5iLwgCQ62IlExPdHaO55tNRckidUtb/jmP/DuTtEGAcu+IM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
	t=1562862430; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results; 
	bh=Cp4gm7ZH8mJSH4RSieA+11u+RdAzfHjQRfeVFOFgpLk=; 
	b=HbZS3+tFmrPaRYtdSjhxQPx/B7KRDtwEh4NZWtuTQcbQnpUO+jmCVcaTriqNcBv9vlq94VbLQT7Xo9y67v8OCn2QL8gBJBmsa9kdVFlZ8jyvTcRqUX8yZ2fXhu5ut2L6jblk5B9kabElbtgAmscKKq1NXKV5pyNjyTeakF5EoFQ=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1562862430043173.8913739649514; Thu, 11 Jul 2019 09:27:10 -0700 (PDT)
Message-ID: <156286242894.12463.9844605717946593963@c4a48874b076>
Subject: Re: [Qemu-devel] [PATCH for-4.1] target/arm: Set VFP-related MVFR0 fields for arm926 and arm1026
In-Reply-To: <20190711121231.3601-1-peter.maydell@linaro.org>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.bennee@linaro.org, christophe.lyon@linaro.org, richard.henderson@linaro.org
Date: Thu, 11 Jul 2019 09:27:10 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: +ifBJ0AP4TfS

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDcxMTEyMTIzMS4zNjAx
LTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0
aGUgYXNhbiBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21tYW5kcyBhbmQK
dGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVkLCB5b3UgY2Fu
IHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09
PQojIS9iaW4vYmFzaAptYWtlIGRvY2tlci1pbWFnZS1mZWRvcmEgVj0xIE5FVFdPUks9MQp0aW1l
IG1ha2UgZG9ja2VyLXRlc3QtZGVidWdAZmVkb3JhIFRBUkdFVF9MSVNUPXg4Nl82NC1zb2Z0bW11
IEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgoKCgpUaGUgZnVsbCBsb2cg
aXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkwNzExMTIxMjMxLjM2
MDEtMS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmcvdGVzdGluZy5hc2FuLz90eXBlPW1lc3NhZ2Uu
Ci0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3Bh
dGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBy
ZWRoYXQuY29t
