Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp67351lfp;
        Mon, 20 Jan 2020 03:10:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqyFmejGowKapEAg9aID8pAslz1K5pokv4JJ9EDQt1Jxth0BpSdlX287tRWXxwcPBeIIlGTU
X-Received: by 2002:a17:906:31c6:: with SMTP id f6mr20609870ejf.17.1579518624372;
        Mon, 20 Jan 2020 03:10:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579518624; cv=none;
        d=google.com; s=arc-20160816;
        b=JT3uyu6g/zPno/8KmQ2wfWNJlgxUKHwbpH6De5j65kFs7l35NlBnGMMm1hTR3miobP
         9MCxD10nivSIeN3a9u9sZjGoVCSb6bjRAinU1owms3H0ixVavS+6UsLjU30bcWnqM/2X
         HCXqrWh3dDW1wj9F/tS1E21b19+SADy9aADmTFqjAZ+fuqR5+2eHjTjxQq2CCEcDchiw
         kh8jdiDA+ON9GEftuovrpBSiHsMyffYjgLIRBXHamqun48pHN+f1TspPOvZS1p4WUErS
         c2rbwhth4htl85VxErzEzCWcjNUibDKi12tXhmtEb+V2yTQZg/ez3TngVrh1Bh4znMR3
         IS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:subject:reply-to:in-reply-to;
        bh=LXhslUwYV0cxwNnWYOpc48w0uP/dQS9QlLysdcqEsWM=;
        b=DdgPLupgQ79bgXNqvzkV+WcpgGs0edPmRCDvwHtVYOQd8y1WlSFFqg6UDzmT6QaowW
         rEDuUDYXCKPQv6vr9Q0eHeCMAow5j61N7JHOGfhbG5HpP6AuxFT3hPJGTIxcQ1YJm/g6
         k4uz+GhYC+ImHlB0BbJXQgG+Ftz3r8/8UtNJYdrpgtNfFoeT38oBTNcm4icQoHbYYnCp
         68q8ErDTmxmfUNlw6WgTpQOD7kM4oK0RBOjHDNxFeNKGyEm6nnvhpoM94BPSTfHngViO
         LU03Jtw4iiNupgb8LrptX3zcFDPdRuqa9ehNqSnefmCGUgA8+23F5CLW3GmFsWpx9ivw
         M9IA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.51 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com. [136.143.188.51])
        by mx.google.com with ESMTPS id r14si20444104edm.486.2020.01.20.03.10.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jan 2020 03:10:23 -0800 (PST)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.51 as permitted sender) client-ip=136.143.188.51;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.51 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1579518596305202.62166712169596; Mon, 20 Jan 2020 03:09:56 -0800 (PST)
In-Reply-To: <20200120101832.18781-1-drjones@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH REPOST v3] target/arm/arch_dump: Add SVE notes
Message-ID: <157951859491.20990.6046185151636456198@197193fa8d23>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: drjones@redhat.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org, richard.henderson@linaro.org, Dave.Martin@arm.com, eric.auger@redhat.com
Date: Mon, 20 Jan 2020 03:09:56 -0800 (PST)
X-ZohoMailClient: External
X-TUID: o32xB4CRWsfj

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDEyMDEwMTgzMi4xODc4
MS0xLWRyam9uZXNAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMjAyMDAxMjAxMDE4MzIuMTg3ODEtMS1kcmpvbmVzQHJl
ZGhhdC5jb20KVHlwZTogc2VyaWVzClN1YmplY3Q6IFtQQVRDSCBSRVBPU1QgdjNdIHRhcmdldC9h
cm0vYXJjaF9kdW1wOiBBZGQgU1ZFIG5vdGVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMh
L2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5y
ZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQou
L3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQg
RU5EID09PQoKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICog
W25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIwMDEyMDEwMTgzMi4xODc4MS0xLWRyam9uZXNA
cmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjAwMTIwMTAxODMyLjE4NzgxLTEtZHJqb25lc0ByZWRo
YXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKM2RmMTU0ZiB0YXJnZXQvYXJt
L2FyY2hfZHVtcDogQWRkIFNWRSBub3RlcwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IGNv
ZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwojMjI6IEZJTEU6IGluY2x1ZGUvZWxmLmg6
MTY1MzoKKyNkZWZpbmUgTlRfQVJNX1NWRV5JMHg0MDVeSV5JLyogQVJNIFNjYWxhYmxlIFZlY3Rv
ciBFeHRlbnNpb24kCgpXQVJOSU5HOiBCbG9jayBjb21tZW50cyB1c2UgYSBsZWFkaW5nIC8qIG9u
IGEgc2VwYXJhdGUgbGluZQojMjI6IEZJTEU6IGluY2x1ZGUvZWxmLmg6MTY1MzoKKyNkZWZpbmUg
TlRfQVJNX1NWRSAgICAgMHg0MDUgICAgICAgICAgIC8qIEFSTSBTY2FsYWJsZSBWZWN0b3IgRXh0
ZW5zaW9uCgpFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCiMyMzogRklM
RTogaW5jbHVkZS9lbGYuaDoxNjU0OgorXkleSV5JXkleSSAgIHJlZ2lzdGVycyAqLyQKCldBUk5J
Tkc6IEJsb2NrIGNvbW1lbnRzIHVzZSAqIG9uIHN1YnNlcXVlbnQgbGluZXMKIzIzOiBGSUxFOiBp
bmNsdWRlL2VsZi5oOjE2NTQ6CisjZGVmaW5lIE5UX0FSTV9TVkUgICAgIDB4NDA1ICAgICAgICAg
ICAvKiBBUk0gU2NhbGFibGUgVmVjdG9yIEV4dGVuc2lvbgorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVnaXN0ZXJzICovCgpXQVJOSU5HOiBCbG9jayBjb21tZW50
cyB1c2UgYSB0cmFpbGluZyAqLyBvbiBhIHNlcGFyYXRlIGxpbmUKIzIzOiBGSUxFOiBpbmNsdWRl
L2VsZi5oOjE2NTQ6CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWdpc3RlcnMgKi8KCnRvdGFsOiAyIGVycm9ycywgMyB3YXJuaW5ncywgMjMzIGxpbmVzIGNoZWNr
ZWQKCkNvbW1pdCAzZGYxNTRmZDExOWIgKHRhcmdldC9hcm0vYXJjaF9kdW1wOiBBZGQgU1ZFIG5v
dGVzKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2Ug
ZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIs
IHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3Qg
Y29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBh
dApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDEyMDEwMTgzMi4xODc4MS0xLWRyam9uZXNA
cmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdl
bmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4K
UGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=
