Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp838803wrm;
        Fri, 4 Oct 2019 12:17:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3coEO9AcaNfgXKRxaKtJj6W5FRRnsnU5l0bOApSepnfPdvYvKPmvSoZJfMupa3OIVhGUn
X-Received: by 2002:a50:9a05:: with SMTP id o5mr17156650edb.44.1570216674341;
        Fri, 04 Oct 2019 12:17:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570216674; cv=pass;
        d=google.com; s=arc-20160816;
        b=tTFZv9Yn2ARYvMmxioeNbB/Gau9w9k/GSjFcCpmBrfzFt2Dima6AJBBMkYMO8S4afJ
         wtTI9Lys7Pc/11GfFO1zbaDxTZ353WfJT61neVSYuFod1I0/cIVrZzDYdvTkCtf4kMgz
         W5NoBUoy5tk02CARZkqGdYhcx8PvoJlizXUE9VtDo2TQ7rTQUJfr98NAwnBllm9P0DqI
         tbD52T0ha9779xX78cyULNOKvM06raUVfyviLqVKbd5+i4ZvjJgGOE4N2sYG0fmC1HMx
         I5/DtD9TlfOV265YdN6hsDMw90X6G5dbdiOI9EKOPySAbHBJMFs7Jiu4uJ9HgN/E4c4C
         rHVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:in-reply-to:subject:reply-to;
        bh=12em7lGr+BlbtBpbDDf3U7J8dU5dgpOXl2Gp2EHOVWg=;
        b=R8Tm3Fc71dCr/cptaVyEJ3y/vUsmWfI049PHBkCVKXstZKS4dfVv0Bv3xdVcm5HJN5
         pETDHudGUF237b+75+ksDyYvGSJRa3TXHt/8mM9Z0Ny4Y2j68ra7z4kL+f7CXtrXVmgv
         WroWqjTfJuvAIXIUYYdcn9wauAq5IcieR68jrflP1n4DloYhkkjUL7p4KUvjHYZJGHMI
         brggW3b7Ygp1QH+1f4wGU0zFwolooPiKRaTNnMQc1z9eEdTdKjLjolziNSJDhTQDXBlt
         WR2f34H9iQRLieP/LfVdTMj+m+81VkJVMUC9RfTojJDbuBILcgUFSxYzwrb9okWUU2c0
         JoIw==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.55 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o55.zoho.com (sender4-of-o55.zoho.com. [136.143.188.55])
        by mx.google.com with ESMTPS id h23si3467411ejc.1.2019.10.04.12.17.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 12:17:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.55 as permitted sender) client-ip=136.143.188.55;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.55 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1570216666; cv=none; 
	d=zoho.com; s=zohoarc; 
	b=W06mf5A0P4EAjhHmJVHi3wVGctfjAxjv9ut1gKPZhgOLI9/YpdV7oNzep/KTnT+plC3bwczEDoPSikFwp38xHf9Xd/yHc3BoLQ9Ev9BwkqykYu0wRhg8XEMnrnzlNKCLadDbvobdEFf58IxfN+Z0xvQZ+YJE+/sjrnGm/D9jMKo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
	t=1570216666; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results; 
	bh=12em7lGr+BlbtBpbDDf3U7J8dU5dgpOXl2Gp2EHOVWg=; 
	b=hip/y8cP/vmLIL6LeIhZLS2u7SISRmmzbsTiM9I13Y3SuV4PU3wU4JypBDDZ3Gck+26YQFp1hyalhUzb1LTsyy63bRiYMQMgj0VcvclAFgMVpA8IFGpKHby2lBqAw4qfsW+/rR/pcnyw4ENsoYVHtxXxT63kkd0fFVGcXSQbjTk=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1570216664085562.2652022907888; Fri, 4 Oct 2019 12:17:44 -0700 (PDT)
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] target/arm/arch_dump: Add SVE notes
In-Reply-To: <20191004120313.5347-1-drjones@redhat.com>
Message-ID: <157021666243.31166.13502635150843909281@8230166b0665>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: drjones@redhat.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org, richard.henderson@linaro.org, Dave.Martin@arm.com, eric.auger@redhat.com
Date: Fri, 4 Oct 2019 12:17:44 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: grZz/2detNWY

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTAwNDEyMDMxMy41MzQ3
LTEtZHJqb25lc0ByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAxOTEwMDQxMjAzMTMuNTM0Ny0x
LWRyam9uZXNAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjJdIHRhcmdldC9hcm0vYXJjaF9k
dW1wOiBBZGQgU1ZFIG5vdGVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNo
CmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRy
dWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMv
Y2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoK
U3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo5ZDIxYTlhIHRhcmdldC9hcm0vYXJjaF9k
dW1wOiBBZGQgU1ZFIG5vdGVzCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogY29kZSBpbmRl
bnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCiMyMTogRklMRTogaW5jbHVkZS9lbGYuaDoxNjUzOgor
I2RlZmluZSBOVF9BUk1fU1ZFXkkweDQwNV5JXkkvKiBBUk0gU2NhbGFibGUgVmVjdG9yIEV4dGVu
c2lvbiQKCldBUk5JTkc6IEJsb2NrIGNvbW1lbnRzIHVzZSBhIGxlYWRpbmcgLyogb24gYSBzZXBh
cmF0ZSBsaW5lCiMyMTogRklMRTogaW5jbHVkZS9lbGYuaDoxNjUzOgorI2RlZmluZSBOVF9BUk1f
U1ZFICAgICAweDQwNSAgICAgICAgICAgLyogQVJNIFNjYWxhYmxlIFZlY3RvciBFeHRlbnNpb24K
CkVSUk9SOiBjb2RlIGluZGVudCBzaG91bGQgbmV2ZXIgdXNlIHRhYnMKIzIyOiBGSUxFOiBpbmNs
dWRlL2VsZi5oOjE2NTQ6CiteSV5JXkleSV5JICAgcmVnaXN0ZXJzICovJAoKV0FSTklORzogQmxv
Y2sgY29tbWVudHMgdXNlICogb24gc3Vic2VxdWVudCBsaW5lcwojMjI6IEZJTEU6IGluY2x1ZGUv
ZWxmLmg6MTY1NDoKKyNkZWZpbmUgTlRfQVJNX1NWRSAgICAgMHg0MDUgICAgICAgICAgIC8qIEFS
TSBTY2FsYWJsZSBWZWN0b3IgRXh0ZW5zaW9uCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZWdpc3RlcnMgKi8KCldBUk5JTkc6IEJsb2NrIGNvbW1lbnRzIHVzZSBh
IHRyYWlsaW5nICovIG9uIGEgc2VwYXJhdGUgbGluZQojMjI6IEZJTEU6IGluY2x1ZGUvZWxmLmg6
MTY1NDoKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ2lzdGVy
cyAqLwoKdG90YWw6IDIgZXJyb3JzLCAzIHdhcm5pbmdzLCAxODMgbGluZXMgY2hlY2tlZAoKQ29t
bWl0IDlkMjFhOWE1Y2JhMiAodGFyZ2V0L2FybS9hcmNoX2R1bXA6IEFkZCBTVkUgbm90ZXMpIGhh
cyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMK
YXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNI
RUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5k
IGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6
Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkxMDA0MTIwMzEzLjUzNDctMS1kcmpvbmVzQHJlZGhhdC5j
b20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQg
YXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBz
ZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t
