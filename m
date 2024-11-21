Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp4345511dll;
        Thu, 21 Nov 2024 11:03:19 -0800 (PST)
X-Received: by 2002:a17:902:c94c:b0:20c:9d9e:9049 with SMTP id d9443c01a7336-2129f228d84mr3264635ad.22.1732215799377;
        Thu, 21 Nov 2024 11:03:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732215799; cv=none;
        d=google.com; s=arc-20240605;
        b=aIfHwR7N3qRWuCx1vFoAvixpDjIBbGba/JCfQHaT4ChuACE4oSyOC59FMp3QFPLPLz
         KS1+thqvlpZiix1dYab5cqI3N8OT3++CnyAeDmWkd//VtWihH1QdumIibrWRgpR16O7p
         akEp+FxTgMjcHiZ+XmipcUWWOF+3IlaR3ZAd7P59ZEdpv+ZKV3ev9iEnds3HJ5gxWm2C
         ss5iKPSl8v3tAqcXTOXzsPYqfeaV/5htQ/bAkDbl7yWdWpP1wH6L6C7k+v4vbS0IvvZn
         rCPjDZTgisbY5phR+agJrPCZ6n9XXTK3R6giepUvhZ0aWQhvoEpr+AGYFLVGyElFcTnA
         rlWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UqPpd+IbtJeT0VhlDpvCQ1AMf22aum6w29og4Ma29m8=;
        fh=+6Kez8Evz2vaxJEOsfaI3fqCepfak20/90vfUl9R80I=;
        b=jpdvP0A0EN4MIod2xir7XlZb7zeCy0bQKuN8/0Gg68cBqUy4n1eCSb0/bplxk61u3u
         z4NbwcAs+W2Z62GlHlDpjRUT+0ftTNIszYtzcmEJiw9mR43i4qbyI1zamr2wPq9EucPq
         dEQMU1+tKXAcfH8Cg0ZaVsTKDqJDVu+b0K7EExJ7dw6l2Km81Ez6JjLQq0kSxmKe9v9T
         vvyNuIZA3OvpaHkIXi5TVX4QArP9Cxh4FR5jKZJfp3paaM59mmAqxaO59vCE8ziVQ9Ws
         Q7AQB4OtD2sV8/65cx4fse9AOAaAVHuVBX6FTp6W1f/oLq1jtLkZAQg1DMWoWla5A380
         QbNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iG+9ERhG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129db5f3a9sor2162425ad.5.2024.11.21.11.03.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 21 Nov 2024 11:03:19 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iG+9ERhG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732215799; x=1732820599; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqPpd+IbtJeT0VhlDpvCQ1AMf22aum6w29og4Ma29m8=;
        b=iG+9ERhGUFd2C8gR+IDNzyF356FCuM8AMy+6jzFR0ywgroGNOlVViwAvIgLi1od26e
         7v78skrMqAb402WA01mpwRbkPCj7p/YPl88GiYTDQHMJFW+FKhoGUcPc9VkojyQ7zYIm
         UQV6BuNP+K2abE63pMRhbq2aLYGqd/Rd7afGMgPpngjCYYiK60d6waTntFtpfo1kwPRN
         FsM2st40QWRQ2LoMCMFG4KLLexo4N/NLphc5yLm6XtncHfsY99y7BFj+zG2CyZ2W1MfA
         WdU+oazctKmJBfQiK+l20VnGZUzliF4sLYeysFOXlLmg/XOL01FCnSAO34gX7KfRg4D1
         E02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732215799; x=1732820599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqPpd+IbtJeT0VhlDpvCQ1AMf22aum6w29og4Ma29m8=;
        b=slDLOF4mcl9iiDLVy0omE5Jr7dPR8LzauXnI4q7c+SQAfhG1oAkBwyV4tZL47U5cQP
         upgQlNBygGjtm7XUaixKQV4uHgMheOE4EdB1M2/8bE3RDBgiopK7Hibn/H5D35RY++Fx
         WXtkN0W/C9Qip34eit5opyCdSZzGtew5Prbk82E67wjrpbi3c6IEmxSYuvcSjinx/r6Q
         utFTLiYADYm5CMScj7RQLea+Gp9OWzzGsKO0waWsH5uuYPUAhsh29m+IXnIGXan7xwnE
         ksYeN991Z48HDTf1QsJ/48WEToCFLKTUnsVtd4J9JpSaKaC9jwlh3Jj/ZjZr2YEfT6FU
         J2kw==
X-Gm-Message-State: AOJu0YzfKdDdNCKvQ1/TAVsRoobxjNDqtd+4SKPn1sTP1FrP9R4Mh7xP
	zNMhs1fE2nVOqd5Ohhe2CriilBEDvJ0BxR59aOjo5M9zd/jjnsqx0/DNQab1UbFICUExHEK55/Y
	qsXU=
X-Gm-Gg: ASbGnctOwjqCwq2r212GO5yLBMcVvQr8apUN83gJTtwRjL2ywgQ6leLmxGuKYNfho2x
	fPk7RpjhiyplFaeI/HkEHoELq3K28E1PpFtpyZakpwugHFXoJGLTkNROp00y2VjTQ1Gris8bPiO
	hM7Gdg906D2KtEMd4kS4zhWVqyAYKQpLMM0o5jj2NF6/2JoEBI9qCh84tsyvItdRkuuHODw0sxg
	XXNDqLMpyBkfwZDZS6YNMdK71m1KV8qb/KPSODCCCjbW8WlFU6Fym1uQFh0ll7NF62C/H4POdn/
	cT0aLKZGWJijz89jjYwqow==
X-Google-Smtp-Source: AGHT+IG5LrBxRjfabe2uc5HXPKig457aqJLeFY/PLXRzw00SCDy1j/V6h80nAREjT8tPT+CfDbrc4g==
X-Received: by 2002:a17:902:d547:b0:212:26e:7117 with SMTP id d9443c01a7336-2129f24bb1cmr3326375ad.33.1732215798723;
        Thu, 21 Nov 2024 11:03:18 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbf9853sm1656155ad.165.2024.11.21.11.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 11:03:18 -0800 (PST)
Message-ID: <c4f6be27-c0d1-49ee-82ed-36144c38bad2@linaro.org>
Date: Thu, 21 Nov 2024 11:03:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/39] tests/functional: remove comments talking about
 avocado
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-8-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241121165806.476008-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 2ScSeYUa0Z5k

T24gMTEvMjEvMjQgMDg6NTcsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gRnJvbTogRGFuaWVs
IFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4NCj4gDQo+IFRoZSBmaXJzdCBj
b21tZW50IGlzIHN0aWxsIHJlbGV2YW50IGJ1dCBzaG91bGQgdGFsayBhYm91dCBvdXIgb3du
IHRlc3QNCj4gaGFybmVzcyBpbnN0ZWFkLiBUaGUgc2Vjb25kIGNvbW1lbnQgYWRkcyBubyB2
YWx1ZSBvdmVyIHJlYWRpbmcgdGhlIGNvZGUNCj4gYW5kIGNhbiBiZSByZW1vdmVkLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0
LmNvbT4NCj4gTWVzc2FnZS1JZDogPDIwMjQxMTIxMTU0MjE4LjE0MjMwMDUtOC1iZXJyYW5n
ZUByZWRoYXQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVu
bmVlQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIHRlc3RzL2Z1bmN0aW9uYWwvdGVzdF9hY3Bp
X2JpdHMucHkgfCAxMyArKysrKystLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9m
dW5jdGlvbmFsL3Rlc3RfYWNwaV9iaXRzLnB5IGIvdGVzdHMvZnVuY3Rpb25hbC90ZXN0X2Fj
cGlfYml0cy5weQ0KPiBpbmRleCBlZTQwNjQ3ZDViLi40YzE5MmQ5NWNjIDEwMDc1NQ0KPiAt
LS0gYS90ZXN0cy9mdW5jdGlvbmFsL3Rlc3RfYWNwaV9iaXRzLnB5DQo+ICsrKyBiL3Rlc3Rz
L2Z1bmN0aW9uYWwvdGVzdF9hY3BpX2JpdHMucHkNCj4gQEAgLTE5NiwxMSArMTk2LDEyIEBA
IGRlZiBjb3B5X3Rlc3Rfc2NyaXB0cyhzZWxmKToNCj4gICAgICAgICAgIGZvciBmaWxlbmFt
ZSBpbiBvcy5saXN0ZGlyKGJpdHNfdGVzdF9kaXIpOg0KPiAgICAgICAgICAgICAgIGlmIG9z
LnBhdGguaXNmaWxlKG9zLnBhdGguam9pbihiaXRzX3Rlc3RfZGlyLCBmaWxlbmFtZSkpIGFu
ZCBcDQo+ICAgICAgICAgICAgICAgICAgZmlsZW5hbWUuZW5kc3dpdGgoJy5weTInKToNCj4g
LSAgICAgICAgICAgICAgICAjIGFsbCB0ZXN0IHNjcmlwdHMgYXJlIG5hbWVkIHdpdGggZXh0
ZW5zaW9uIC5weTIgc28gdGhhdA0KPiAtICAgICAgICAgICAgICAgICMgYXZvY2FkbyBkb2Vz
IG5vdCB0cnkgdG8gbG9hZCB0aGVtLiBUaGVzZSBzY3JpcHRzIGFyZQ0KPiAtICAgICAgICAg
ICAgICAgICMgd3JpdHRlbiBmb3IgcHl0aG9uIDIuNyBub3QgcHl0aG9uIDMgYW5kIGhlbmNl
IGlmIGF2b2NhZG8NCj4gLSAgICAgICAgICAgICAgICAjIGxvYWRlZCB0aGVtLCBpdCB3b3Vs
ZCBjb21wbGFpbiBhYm91dCBweXRob24gMyBzcGVjaWZpYw0KPiAtICAgICAgICAgICAgICAg
ICMgc3ludGF4ZXMuDQo+ICsgICAgICAgICAgICAgICAgIyBBbGwgdGVzdCBzY3JpcHRzIGFy
ZSBuYW1lZCB3aXRoIGV4dGVuc2lvbiAucHkyIHNvIHRoYXQNCj4gKyAgICAgICAgICAgICAg
ICAjIHRoZXkgYXJlIG5vdCBydW4gYnkgYWNjaWRlbnQuDQo+ICsgICAgICAgICAgICAgICAg
Iw0KPiArICAgICAgICAgICAgICAgICMgVGhlc2Ugc2NyaXB0cyBhcmUgaW50ZW5kZWQgdG8g
cnVuIGluc2lkZSB0aGUgdGVzdCBWTQ0KPiArICAgICAgICAgICAgICAgICMgYW5kIGFyZSB3
cml0dGVuIGZvciBweXRob24gMi43IG5vdCBweXRob24gMywgaGVuY2UNCj4gKyAgICAgICAg
ICAgICAgICAjIHdvdWxkIGNhdXNlIHN5bnRheCBlcnJvcnMgaWYgbG9hZGVkIG91c2lkZSB0
aGUgVk0uDQo+ICAgICAgICAgICAgICAgICAgIG5ld2ZpbGVuYW1lID0gb3MucGF0aC5zcGxp
dGV4dChmaWxlbmFtZSlbMF0gKyAnLnB5Jw0KPiAgICAgICAgICAgICAgICAgICBzaHV0aWwu
Y29weTIob3MucGF0aC5qb2luKGJpdHNfdGVzdF9kaXIsIGZpbGVuYW1lKSwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG9zLnBhdGguam9pbih0YXJnZXRfdGVzdF9kaXIs
IG5ld2ZpbGVuYW1lKSkNCj4gQEAgLTM5OSw4ICs0MDAsNiBAQCBkZWYgdGVzdF9hY3BpX3Nt
Ymlvc19iaXRzKHNlbGYpOg0KPiAgIA0KPiAgICAgICAgICAgIyBiaW9zYml0cyBoYXMgYmVl
biBjb25maWd1cmVkIHRvIHJ1biBhbGwgdGhlIHNwZWNpZmllZCB0ZXN0IHN1aXRlcw0KPiAg
ICAgICAgICAgIyBpbiBiYXRjaCBtb2RlIGFuZCB0aGVuIGF1dG9tYXRpY2FsbHkgaW5pdGlh
dGUgYSB2bSBzaHV0ZG93bi4NCj4gLSAgICAgICAgIyBTZXQgdGltZW91dCB0byBCSVRTX1RJ
TUVPVVQgZm9yIFNIVVRET1dOIGV2ZW50IGZyb20gYml0cyBWTSBhdCBwYXINCj4gLSAgICAg
ICAgIyB3aXRoIHRoZSBhdm9jYWRvIHRlc3QgdGltZW91dC4NCj4gICAgICAgICAgIHNlbGYu
X3ZtLmV2ZW50X3dhaXQoJ1NIVVRET1dOJywgdGltZW91dD1CSVRTX1RJTUVPVVQpDQo+ICAg
ICAgICAgICBzZWxmLl92bS53YWl0KHRpbWVvdXQ9Tm9uZSkNCj4gICAgICAgICAgIHNlbGYu
bG9nZ2VyLmRlYnVnKCJDaGVja2luZyBjb25zb2xlIG91dHB1dCAuLi4iKQ0KDQpSZXZpZXdl
ZC1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0K
DQo=
