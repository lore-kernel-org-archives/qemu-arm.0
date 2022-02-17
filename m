Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp142632lfl;
        Thu, 17 Feb 2022 04:46:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxW7qgWHambkpCahKqRspuxo0Er/ytpTNCc6JRMkruAhlkJuDhFLJkwLOEq3yxOafFQYbTp
X-Received: by 2002:a05:6870:58a3:b0:ce:c0c9:625 with SMTP id be35-20020a05687058a300b000cec0c90625mr2131328oab.119.1645101984453;
        Thu, 17 Feb 2022 04:46:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645101984; cv=none;
        d=google.com; s=arc-20160816;
        b=priO9Xz9+h582ryCSMW9Q/NoerdQuGqg+Us4Xadd7wgDtU6xVDvcGdv0LDgnreHMHk
         C1yWP/OoGARea6sOp5yEztcK5aNEsATwEnQ+1jpnb0rjOpSY+7RqpyhZlz2UWSSd+HC4
         Hnxl89muGiPscMdPTP6fOzWMMST+oBiag50UbNIWLCVcB/oZ3dAPpUZn8MJJVRYOzY1u
         skLMvvekmQuUjAnKrYgoIpdR7dwav4uBxLdrL69t+RYT6OR/VW+2FuphnY3ErSvxpKHy
         mp6TEppVWWuiHgX7yjrZgzfU4iHuaFE2C1H8M7bcYlncMn2TDVYo9hNkGDoY2JOxx2Si
         SRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=Ks+EB+X+CQr2iWUWIb9Xm9tAPCCuDuGDpstm28VRpME=;
        b=uxfo4WHQxDULV1bfYq+AFKA/Lu3risMn36uqoYmJ5Cx2D+27wZly8ma7drYGdED0Sl
         ceCmqSEEva6jskx/8W2VVAnSxZi5Ck6I44LyLFSuW0hDTi87TXc94vO/2toEFfPatLeu
         jILhYfZz5qq802SiTj8WfYmypLrwf0EcZ1GO6qgQsZw4h3ltp4OfoMO3GhmCf6XKO90D
         +Taa2nmTnPYh8l6Cq7pI/1Fo6XzVxFFDopelBMxDbs4PeHhS5A3WtBHRmps8lgF1YDhT
         dbLZAckf3OzPlz2DxYAtlvx4KZv0RmYUsVEC8tN9gpSfmntsI883Kc7bBgdFDLVvaue5
         GeLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of matheus.ferst@eldorado.org.br designates 187.72.171.209 as permitted sender) smtp.mailfrom=matheus.ferst@eldorado.org.br
Return-Path: <matheus.ferst@eldorado.org.br>
Received: from outlook.eldorado.org.br ([187.72.171.209])
        by mx.google.com with ESMTP id a20si3014370oap.394.2022.02.17.04.46.23;
        Thu, 17 Feb 2022 04:46:24 -0800 (PST)
Received-SPF: pass (google.com: domain of matheus.ferst@eldorado.org.br designates 187.72.171.209 as permitted sender) client-ip=187.72.171.209;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of matheus.ferst@eldorado.org.br designates 187.72.171.209 as permitted sender) smtp.mailfrom=matheus.ferst@eldorado.org.br
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384);
	 Thu, 17 Feb 2022 09:46:22 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
	by p9ibm (Postfix) with ESMTP id B4A338001F1;
	Thu, 17 Feb 2022 09:46:21 -0300 (-03)
Message-ID: <5c23b766-e436-b1cb-2f54-d2b1ef71e540@eldorado.org.br>
Date: Thu, 17 Feb 2022 09:46:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 11/11] tests/tcg: add vectorised sha512 versions
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net,
 Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-12-alex.bennee@linaro.org>
 <f8164a77-80d1-86fa-7fc9-6089d6b4f34b@eldorado.org.br>
 <87v8xhcwdf.fsf@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <87v8xhcwdf.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Return-Path: matheus.ferst@eldorado.org.br
X-OriginalArrivalTime: 17 Feb 2022 12:46:22.0255 (UTC) FILETIME=[5DF5CBF0:01D823FC]
X-TUID: du2mYkb6h3Wp

T24gMTQvMDIvMjAyMiAxMjoxNCwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiAiTWF0aGV1cyBL
LiBGZXJzdCIgPG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3JnLmJyPiB3cml0ZXM6DQo+IA0K
Pj4gT24gMTEvMDIvMjAyMiAxMzowMywgQWxleCBCZW5uw6llIHdyb3RlOg0KPj4+IFRoaXMg
YnVpbGRzIHZlY3RvcmlzZWQgdmVyc2lvbnMgb2Ygc2hhNTEyIHRvIGV4ZXJjaXNlIHRoZSB2
ZWN0b3IgY29kZToNCj4+PiAgICAgLSBhYXJjaDY0IChBZHZTaW1kKQ0KPj4+ICAgICAtIGkz
ODYgKFNTRSkNCj4+PiAgICAgLSBzMzkweCAoTVZYKQ0KPj4+ICAgICAtIHBwYzY0ICh2ZWN0
b3IpDQo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5h
cm8ub3JnPg0KPj4+IFJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5o
ZW5kZXJzb25AbGluYXJvLm9yZz4NCj4+PiBNZXNzYWdlLUlkOiA8MjAyMjAyMDIxOTEyNDIu
NjUyNjA3LTUtYWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4+PiAtLS0NCj4+PiB2Mg0KPj4+
ICAgICAtIHVzZSAtbXNzZTQuMSAtTzMgaW5zdGVhZCBvZiAtcGVudGl1bTQgZm9yIGkzODYg
YnVpbGQNCj4+PiAtLS0NCj4+PiAgICB0ZXN0cy90Y2cvbXVsdGlhcmNoL3NoYTUxMi5jICAg
ICAgfCAyICstDQo+Pj4gICAgdGVzdHMvdGNnL2FhcmNoNjQvTWFrZWZpbGUudGFyZ2V0IHwg
NyArKysrKysrDQo+Pj4gICAgdGVzdHMvdGNnL2FybS9NYWtlZmlsZS50YXJnZXQgICAgIHwg
OCArKysrKysrKw0KPj4+ICAgIHRlc3RzL3RjZy9pMzg2L01ha2VmaWxlLnRhcmdldCAgICB8
IDYgKysrKysrDQo+Pj4gICAgdGVzdHMvdGNnL3BwYzY0bGUvTWFrZWZpbGUudGFyZ2V0IHwg
NSArKysrLQ0KPj4+ICAgIHRlc3RzL3RjZy9zMzkweC9NYWtlZmlsZS50YXJnZXQgICB8IDkg
KysrKysrKysrDQo+Pj4gICAgdGVzdHMvdGNnL3g4Nl82NC9NYWtlZmlsZS50YXJnZXQgIHwg
NyArKysrKysrDQo+Pj4gICAgNyBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pg0KPj4gPHNuaXA+DQo+Pg0KPj4+IGRpZmYgLS1naXQg
YS90ZXN0cy90Y2cvcHBjNjRsZS9NYWtlZmlsZS50YXJnZXQgYi90ZXN0cy90Y2cvcHBjNjRs
ZS9NYWtlZmlsZS50YXJnZXQNCj4+PiBpbmRleCA0ODBmZjA4OThkLi40ZjFkMDNkZmNmIDEw
MDY0NA0KPj4+IC0tLSBhL3Rlc3RzL3RjZy9wcGM2NGxlL01ha2VmaWxlLnRhcmdldA0KPj4+
ICsrKyBiL3Rlc3RzL3RjZy9wcGM2NGxlL01ha2VmaWxlLnRhcmdldA0KPj4+IEBAIC01LDEw
ICs1LDEzIEBADQo+Pj4gICAgVlBBVEggKz0gJChTUkNfUEFUSCkvdGVzdHMvdGNnL3BwYzY0
bGUNCj4+PiAgICBpZm5lcSAoJChET0NLRVJfSU1BR0UpJChDUk9TU19DQ19IQVNfUE9XRVI4
X1ZFQ1RPUiksKQ0KPj4+IC1QUEM2NExFX1RFU1RTPWJjZHN1YiBub25fc2lnbmFsbGluZ194
c2N2DQo+Pj4gK1BQQzY0TEVfVEVTVFM9YmNkc3ViIG5vbl9zaWduYWxsaW5nX3hzY3Ygc2hh
NTEyLXZlY3Rvcg0KPj4+ICAgIGVuZGlmDQo+Pj4gICAgJChQUEM2NExFX1RFU1RTKTogQ0ZM
QUdTICs9IC1tcG93ZXI4LXZlY3Rvcg0KPj4+DQo+Pg0KPj4gU2luY2UgdGhpcyB0ZXN0IGRv
ZXMgbm90IHRhcmdldCBhIHNwZWNpZmljIGluc3RydWN0aW9uLCBtYXliZSBpdA0KPj4gc2hv
dWxkIHVzZSAtbXZzeC8tbWFsdGl2ZWMgdG8gYWxsb3cgdGhlIGNvbXBpbGVyIHRvIHVzZSBu
ZXdlcg0KPj4gaW5zdHJ1Y3Rpb25zLg0KPiANCj4gSSB3YXNuJ3Qgc3VyZSB3aGljaCB2ZWN0
b3IgaW5zdHJ1Y3Rpb25zIGFyZSBzdXBwb3J0ZWQgYnkgdGhlIFRDRyBmcm9udA0KPiBlbmRz
IHNvIGlmIHRoZSBhYm92ZSBmbGFncyB3b24ndCB0cmlwIHVwIHRoZSBUQ0cgSSBjYW4gYWRk
IHRoZW0gdG8gdGhlDQo+IGNmbGFncy4NCj4gDQoNCkFGQUlDVCwgd2Ugc2hvdWxkIGhhdmUg
YWxsIHZlY3RvciBpbnN0cnVjdGlvbiB1bnRpbCBQT1dFUjkuIFBPV0VSMTAgaXMgDQpXSVAs
IGJ1dCBjdXJyZW50IHZlcnNpb25zIG9mIEdDQy9DbGFuZyBhcmUgbm90IGVtaXR0aW5nIGFu
eSBvZiB0aGUgDQptaXNzaW5nIGluc3RydWN0aW9ucywgZXZlbiB3aXRoIC1tY3B1PXBvd2Vy
MTANCg0KVGhhbmtzLA0KTWF0aGV1cyBLLiBGZXJzdA0KSW5zdGl0dXRvIGRlIFBlc3F1aXNh
cyBFTERPUkFETyA8aHR0cDovL3d3dy5lbGRvcmFkby5vcmcuYnIvPg0KQW5hbGlzdGEgZGUg
U29mdHdhcmUNCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3Jh
ZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==
