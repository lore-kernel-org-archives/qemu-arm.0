Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3355886njb;
        Tue, 22 Oct 2024 13:30:57 -0700 (PDT)
X-Received: by 2002:a17:902:e54e:b0:20e:552c:53ee with SMTP id d9443c01a7336-20fa9e5ec9dmr4786475ad.24.1729629056885;
        Tue, 22 Oct 2024 13:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729629056; cv=none;
        d=google.com; s=arc-20240605;
        b=a0qJknqGsDA+B2Y2eYctPYouKR/hrin+4V9Ylr+S8vF9+EmnxckKo/0YK7u4aFVg4H
         ab9utN++AzVymvW0jTdzDS1X0/9Ng1C7aIT/OraQbjswtC2L+7X9S4oCRBSCeN8hkYTQ
         w0fPNOxnmxQVfIvLu6HEvgCU5K0zmZktjHZhSfPMb2MWbuQSKypq/Pp7sl0O5K303JPf
         6DsT5HZTN7unMWVnNKw5zSz6zbz74cVk5vb5Du1cOG5rUndyx1enw9d5CwWo2YNuvD4D
         tNflJ9vNx0Q2i9UlsAzFxV8OMpn3um1QIszk+eItTdEgdnj8lJg4xHOhmVsbOHQs4oyY
         y5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mn0yUv/VNueViYeILhO/lJwpnkY1E2U10JXud4XZBsk=;
        fh=np0Gm4YEgg1jmyRAZ7aAjLYx131aU2TiPz931c1Xp7k=;
        b=cftU9vqXSdokZbnTUz+BfQZE5moaQ1UmT0+/j31eJJufm7YzO9W4ApDZwJh61NVtBX
         awsgblzYFyQaFhozZXGjJUk4fiHflWK/bA6RKKBzfjZnzqixgj/CvR2qvnfUSM/mAArU
         LTnZfgxwnnR6QDl2cm+5cSRhaIG8HfzGhja0maMLATvazbu2kodHIAG7AP4v4s8zs3xq
         l/ARfxCchyCPTPROeuH3bM9le/mtr/C/hP/Dn3nOVOCy2qCr/fsos9kojl4eB572akvQ
         FxdT4PW35bixKfIQbJt5VmVMYRhxJKLkwv3ZWimSJ6c7e1iInAc9Ph1blZLkXBQS/gfP
         X5vA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=owEh0Y0A;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e7f0f7309sor36092905ad.17.2024.10.22.13.30.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Oct 2024 13:30:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=owEh0Y0A;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729629056; x=1730233856; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mn0yUv/VNueViYeILhO/lJwpnkY1E2U10JXud4XZBsk=;
        b=owEh0Y0A+AA327SI5+pszYPfNiOJBSxe0thwXANiqxrWDvgnKg5WdXNc3nWxO+B2bn
         ohv+HMAhAMwTI8Bc1OV+Hq2+v1wLoU1HSBDwQYJzWm3IPo25swuj+VOCsFJi3Bf1Ln+y
         MLbgfqcOLvkR4RKhSf1cn4vD2g6qZ1TPIOTRs+YiP/PlpUIBl7Cf2xVviurByDS2rFsA
         l53cWDYE840BIh5Ji0qTbG07IJ6fX4CJKB+4K23gzBYTw6aJWfXYMpbAI3O/kzSqYfK7
         URwmeTECkkBW/n5rBrlydLUM7M20GJDftJmcIG8RyrUKrmUsORvrT5EFUMqIkvp2rruF
         WVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729629056; x=1730233856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mn0yUv/VNueViYeILhO/lJwpnkY1E2U10JXud4XZBsk=;
        b=IR1RejIFiPCnurc1vDtUENx/1rB2iYGX5/EHTu3bGi5RIV96W+61M1WTftzwtVaGxD
         PajwVJtN/bij1YaI9x9UnRIz+7+vVR4/EOF5HBybDzD90N1MBYtx5qMvBZuHbNYQ9YKD
         kssntGMgq6Dtp7anz49Q5gCdqhyaivpyPvxJFcUwQtTkK34lrq7ChyuKzpdUoXUmStnM
         qF6ZcGIyFPfW1vfCHsqQqmKwzWzE+98oDPh7etfEqXUKFfLnouq2q7cLU52WcWHQqnbD
         Wm+UnO5uF8L8pz7YeWjxYMHl/97lwvOc77bNcLlCCD1DR/0Ch2NjMmUSB6il1LpHeNxE
         5Fzg==
X-Gm-Message-State: AOJu0YzgCqzqGg4zZ9I2jg77LXw3WcgWlq/1m7jOIjPpoAP5qwfTFpzY
	47iRlTsF/cS5raxS+AT7J9ZOG2vBZM0Z8kR336+5Uapvw10VZPPpIERknvPE3cRgDpHQJfLaAFB
	TkmdRq9yh
X-Google-Smtp-Source: AGHT+IFStsDu3D39MVTj4FAFck5GuxbFhm8mNq6Eqrj528hfwM/5gYgTzL2d2fBLL6mi8NCVKZcbZA==
X-Received: by 2002:a17:90a:ca08:b0:2e2:8995:dd1b with SMTP id 98e67ed59e1d1-2e76b5b67aamr216165a91.3.1729629056298;
        Tue, 22 Oct 2024 13:30:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm6673854a91.14.2024.10.22.13.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 13:30:55 -0700 (PDT)
Message-ID: <7fcd1db2-3df8-4d1b-8651-ba8bea1abd83@linaro.org>
Date: Tue, 22 Oct 2024 13:30:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/20] tests/docker: Fix microblaze atomics
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 devel@lists.libvirt.org, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Zhao Liu <zhao1.liu@intel.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
 <20241022105614.839199-2-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241022105614.839199-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: pewm1IEOuhUx

T24gMTAvMjIvMjQgMDM6NTUsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gRnJvbTogSWx5YSBM
ZW9zaGtldmljaCA8aWlpQGxpbnV4LmlibS5jb20+DQo+IA0KPiBHQ0MgcHJvZHVjZXMgaW52
YWxpZCBjb2RlIGZvciBtaWNyb2JsYXplIGF0b21pY3MuDQo+IA0KPiBUaGUgZml4IGlzIHVu
Zm9ydHVuYXRlbHkgbm90IHVwc3RyZWFtLCBzbyBmZXRjaCBpdCBmcm9tIGFuIGV4dGVybmFs
DQo+IGxvY2F0aW9uIGFuZCBhcHBseSBpdCBsb2NhbGx5Lg0KPiANCj4gU3VnZ2VzdGVkLWJ5
OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IFNpZ25lZC1v
ZmYtYnk6IElseWEgTGVvc2hrZXZpY2ggPGlpaUBsaW51eC5pYm0uY29tPg0KPiBNZXNzYWdl
LUlkOiA8MjAyNDA5MTkxNTIzMDguMTA0NDAtMS1paWlAbGludXguaWJtLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiAt
LS0NCj4gICAuLi4vZGViaWFuLW1pY3JvYmxhemUtY3Jvc3MuZC9idWlsZC10b29sY2hhaW4u
c2ggICAgICAgICAgfCA4ICsrKysrKysrDQo+ICAgdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVz
L2RlYmlhbi10b29sY2hhaW4uZG9ja2VyICAgICAgICAgIHwgNyArKysrKysrDQo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvZG9ja2VyL2RvY2tlcmZpbGVzL2RlYmlhbi1taWNyb2JsYXplLWNyb3NzLmQvYnVpbGQt
dG9vbGNoYWluLnNoIGIvdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2RlYmlhbi1taWNyb2Js
YXplLWNyb3NzLmQvYnVpbGQtdG9vbGNoYWluLnNoDQo+IGluZGV4IDIzZWMwYWE5YTcuLmM1
Y2QwYWE5MzEgMTAwNzU1DQo+IC0tLSBhL3Rlc3RzL2RvY2tlci9kb2NrZXJmaWxlcy9kZWJp
YW4tbWljcm9ibGF6ZS1jcm9zcy5kL2J1aWxkLXRvb2xjaGFpbi5zaA0KPiArKysgYi90ZXN0
cy9kb2NrZXIvZG9ja2VyZmlsZXMvZGViaWFuLW1pY3JvYmxhemUtY3Jvc3MuZC9idWlsZC10
b29sY2hhaW4uc2gNCj4gQEAgLTEwLDYgKzEwLDggQEAgVE9PTENIQUlOX0lOU1RBTEw9L3Vz
ci9sb2NhbA0KPiAgIFRPT0xDSEFJTl9CSU49JHtUT09MQ0hBSU5fSU5TVEFMTH0vYmluDQo+
ICAgQ1JPU1NfU1lTUk9PVD0ke1RPT0xDSEFJTl9JTlNUQUxMfS8kVEFSR0VUL3N5cy1yb290
DQo+ICAgDQo+ICtHQ0NfUEFUQ0gwX1VSTD1odHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVu
dC5jb20vWGlsaW54L21ldGEteGlsaW54L3JlZnMvdGFncy94bG54LXJlbC12MjAyNC4xL21l
dGEtbWljcm9ibGF6ZS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTIvMDAwOS1QYXRjaC1t
aWNyb2JsYXplLUZpeC1hdG9taWMtYm9vbGVhbi1yZXR1cm4tdmFsdWUucGF0Y2gNCj4gKw0K
PiAgIGV4cG9ydCBQQVRIPSR7VE9PTENIQUlOX0JJTn06JFBBVEgNCj4gICANCj4gICAjDQo+
IEBAIC0zMSw2ICszMywxMiBAQCBtdiBnY2MtMTEuMi4wIHNyYy1nY2MNCj4gICBtdiBtdXNs
LTEuMi4yIHNyYy1tdXNsDQo+ICAgbXYgbGludXgtNS4xMC43MCBzcmMtbGludXgNCj4gICAN
Cj4gKyMNCj4gKyMgUGF0Y2ggZ2NjDQo+ICsjDQo+ICsNCj4gK3dnZXQgLU8gLSAke0dDQ19Q
QVRDSDBfVVJMfSB8IHBhdGNoIC1kIHNyYy1nY2MgLXAxDQo+ICsNCj4gICBta2RpciAtcCBi
bGQtaGRyIGJsZC1iaW51IGJsZC1nY2MgYmxkLW11c2wNCj4gICBta2RpciAtcCAke0NST1NT
X1NZU1JPT1R9L3Vzci9pbmNsdWRlDQo+ICAgDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9kb2Nr
ZXIvZG9ja2VyZmlsZXMvZGViaWFuLXRvb2xjaGFpbi5kb2NrZXIgYi90ZXN0cy9kb2NrZXIv
ZG9ja2VyZmlsZXMvZGViaWFuLXRvb2xjaGFpbi5kb2NrZXINCj4gaW5kZXggNjg3YTk3ZmVj
NC4uYWI0Y2UyOTUzMyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVz
L2RlYmlhbi10b29sY2hhaW4uZG9ja2VyDQo+ICsrKyBiL3Rlc3RzL2RvY2tlci9kb2NrZXJm
aWxlcy9kZWJpYW4tdG9vbGNoYWluLmRvY2tlcg0KPiBAQCAtMTAsNiArMTAsOCBAQCBGUk9N
IGRvY2tlci5pby9saWJyYXJ5L2RlYmlhbjoxMS1zbGltDQo+ICAgIyA/Pz8gVGhlIGJ1aWxk
LWRlcCBpc24ndCB3b3JraW5nLCBtaXNzaW5nIGEgbnVtYmVyIG9mDQo+ICAgIyBtaW5pbWFs
IGJ1aWxkIGRlcGVuZGllbmNpZXMsIGUuZy4gbGlibXBjLg0KPiAgIA0KPiArUlVOIHNlZCAn
cy9eZGViIC9kZWItc3JjIC8nIDwvZXRjL2FwdC9zb3VyY2VzLmxpc3QgPi9ldGMvYXB0L3Nv
dXJjZXMubGlzdC5kL2RlYi1zcmMubGlzdA0KPiArDQo+ICAgUlVOIGFwdCB1cGRhdGUgJiYg
XA0KPiAgICAgICBERUJJQU5fRlJPTlRFTkQ9bm9uaW50ZXJhY3RpdmUgYXB0IGluc3RhbGwg
LXl5IGVhdG15ZGF0YSAmJiBcDQo+ICAgICAgIERFQklBTl9GUk9OVEVORD1ub25pbnRlcmFj
dGl2ZSBlYXRteWRhdGEgXA0KPiBAQCAtMzMsNiArMzUsMTEgQEAgUlVOIGNkIC9yb290ICYm
IC4vYnVpbGQtdG9vbGNoYWluLnNoDQo+ICAgIyBhbmQgdGhlIGJ1aWxkIHRyZWVzIGJ5IHJl
c3RvcmluZyB0aGUgb3JpZ2luYWwgaW1hZ2UsDQo+ICAgIyB0aGVuIGNvcHlpbmcgdGhlIGJ1
aWx0IHRvb2xjaGFpbiBmcm9tIHN0YWdlIDAuDQo+ICAgRlJPTSBkb2NrZXIuaW8vbGlicmFy
eS9kZWJpYW46MTEtc2xpbQ0KPiArUlVOIGFwdCB1cGRhdGUgJiYgXA0KPiArICAgIERFQklB
Tl9GUk9OVEVORD1ub25pbnRlcmFjdGl2ZSBhcHQgaW5zdGFsbCAteXkgZWF0bXlkYXRhICYm
IFwNCj4gKyAgICBERUJJQU5fRlJPTlRFTkQ9bm9uaW50ZXJhY3RpdmUgZWF0bXlkYXRhIFwN
Cj4gKyAgICBhcHQgaW5zdGFsbCAteSAtLW5vLWluc3RhbGwtcmVjb21tZW5kcyBcDQo+ICsg
ICAgICAgIGxpYm1wYzMNCj4gICBDT1BZIC0tZnJvbT0wIC91c3IvbG9jYWwgL3Vzci9sb2Nh
bA0KPiAgICMgQXMgYSBmaW5hbCBzdGVwIGNvbmZpZ3VyZSB0aGUgdXNlciAoaWYgZW52IGlz
IGRlZmluZWQpDQo+ICAgQVJHIFVTRVINCg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZp
ZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg==
