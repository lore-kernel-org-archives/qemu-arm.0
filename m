Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1024802ejx;
        Thu, 1 Dec 2022 21:42:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6HgVkpz2Wn3SpYDsauGNFOOpwLCZJjsrR4zGEpKIJGj1npBiOe71SFpSrc23CQpR9uFsYw
X-Received: by 2002:a5d:4950:0:b0:242:1f80:6cd9 with SMTP id r16-20020a5d4950000000b002421f806cd9mr11043483wrs.405.1669959750116;
        Thu, 01 Dec 2022 21:42:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669959750; cv=none;
        d=google.com; s=arc-20160816;
        b=GIC0ULMpROmWXJ2Rmbq3Bvv3MGNg5Tg5vPMFajv4DhNLoY1VRlCU7ZraktIE9MMCnH
         E7q6HEbSFd+XB566yc1SC5B1Yia3RRnvUEkBK57RaCqJwUVUzFHMrCekjnw9rrh/Ll/d
         HvcOf3QIAgPGBMtp/dqqGIjO9fFfcqoLUd1QVBpYiIQRCyYdecRHiS6UpJLsHEHOas4a
         xczD96LclpT1SzWzKTwdjp7Kox5r3YG3P0m0FkqYd8opiAJlmT7DIOgpguPmXy38B310
         b8qvw+yniyQ4DtD/y8cI/SEmKLknsqsHHN/eKfK4hFZTiKGQ5ihCpw4TygalEDM5trpP
         pepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LETh/D6EVC20cHPB8T0rPJ7HeUvQjGeuS2S2wOwsP34=;
        b=O6OWTxEgPVe+dgpfzYrORmP01CzEK9Abc0BtmcGetRIsBFiDqSCgwLulTPMwlk47io
         F7K1hmY0tWXyxZiGXhjN9cUKQ/ounz0a2X+lcLAmhJ+kGfeOGniyunr8Rzaf486hqr8A
         4O9/hgMBHCfnUfhcAFNE6VPk6c0jt6n0pDz1lbc5Q3bD8I6ptME4/4khO5vtV6Ug9wnE
         NLlRnmBBMJtMgnbXgSgslVm1O3GvqEC6pPxqZYbK45/G1sZFLWM+l2Kb2DakCnWWid26
         u91RKKl4rfipkkvLc63u1IlZXYn6/M1lOu2lYrpS2HC07Na3GeXA2dYtVq/d8CRc6j1h
         rFKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.com header.s=susede1 header.b=nSq6OjPD;
       spf=pass (google.com: domain of jgross@suse.com designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=jgross@suse.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=suse.com
Return-Path: <jgross@suse.com>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id iv14-20020a05600c548e00b003cf47578f5csi7197031wmb.117.2022.12.01.21.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 21:42:30 -0800 (PST)
Received-SPF: pass (google.com: domain of jgross@suse.com designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.com header.s=susede1 header.b=nSq6OjPD;
       spf=pass (google.com: domain of jgross@suse.com designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=jgross@suse.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=suse.com
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7770621C23;
	Fri,  2 Dec 2022 05:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669959749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LETh/D6EVC20cHPB8T0rPJ7HeUvQjGeuS2S2wOwsP34=;
	b=nSq6OjPD08nKGt3KZGL3bjEwyO9qGGlmlFtAVjnXV5VH7NkC+X04EpEeb1Bhec4H++6clH
	wQW+TcyTkgkal24tps9A4nIwf33Tj+/o/uZ/76StQA8QW+PQCC/jL+Mi13hWE+VtokR14M
	grCCT3BZ8jnT+XzHvCYzHrH15wax2xM=
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2200A13625;
	Fri,  2 Dec 2022 05:42:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA
	id 2pW0BkWQiWNHWQAAGKfGzw
	(envelope-from <jgross@suse.com>); Fri, 02 Dec 2022 05:42:29 +0000
Message-ID: <a8b6209e-e997-24e6-2533-a7593b62cc7c@suse.com>
Date: Fri, 2 Dec 2022 06:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221202030003.11441-11-vikram.garhwal@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0JOpaoe1bq5mZzQf8rX6Ox6s"
X-TUID: O9OW+jZZrtGd

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0JOpaoe1bq5mZzQf8rX6Ox6s
Content-Type: multipart/mixed; boundary="------------nLE37ghTSHvx3FcSJq8miJQ2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Message-ID: <a8b6209e-e997-24e6-2533-a7593b62cc7c@suse.com>
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com>
In-Reply-To: <20221202030003.11441-11-vikram.garhwal@amd.com>

--------------nLE37ghTSHvx3FcSJq8miJQ2
Content-Type: multipart/mixed; boundary="------------jwQBiKpdbcIK0ZlzimL4mEZU"

--------------jwQBiKpdbcIK0ZlzimL4mEZU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMTIuMjIgMDQ6MDAsIFZpa3JhbSBHYXJod2FsIHdyb3RlOg0KPiBBZGQgYSBuZXcg
bWFjaGluZSB4ZW5wdiB3aGljaCBjcmVhdGVzIGEgSU9SRVEgc2VydmVyIHRvIHJlZ2lzdGVy
L2Nvbm5lY3Qgd2l0aA0KPiBYZW4gSHlwZXJ2aXNvci4NCj4gDQo+IE9wdGlvbmFsOiBXaGVu
IENPTkZJR19UUE0gaXMgZW5hYmxlZCwgaXQgYWxzbyBjcmVhdGVzIGEgdHBtLXRpcy1kZXZp
Y2UsIGFkZHMgYQ0KPiBUUE0gZW11bGF0b3IgYW5kIGNvbm5lY3RzIHRvIHN3dHBtIHJ1bm5p
bmcgb24gaG9zdCBtYWNoaW5lIHZpYSBjaGFyZGV2IHNvY2tldA0KPiBhbmQgc3VwcG9ydCBU
UE0gZnVuY3Rpb25hbGl0aWVzIGZvciBhIGd1ZXN0IGRvbWFpbi4NCj4gDQo+IEV4dHJhIGNv
bW1hbmQgbGluZSBmb3IgYWFyY2g2NCB4ZW5wdiBRRU1VIHRvIGNvbm5lY3QgdG8gc3d0cG06
DQo+ICAgICAgLWNoYXJkZXYgc29ja2V0LGlkPWNocnRwbSxwYXRoPS90bXAvbXl2dHBtMi9z
d3RwbS1zb2NrIFwNCj4gICAgICAtdHBtZGV2IGVtdWxhdG9yLGlkPXRwbTAsY2hhcmRldj1j
aHJ0cG0gXA0KPiANCj4gc3d0cG0gaW1wbGVtZW50cyBhIFRQTSBzb2Z0d2FyZSBlbXVsYXRv
cihUUE0gMS4yICYgVFBNIDIpIGJ1aWx0IG9uIGxpYnRwbXMgYW5kDQo+IHByb3ZpZGVzIGFj
Y2VzcyB0byBUUE0gZnVuY3Rpb25hbGl0eSBvdmVyIHNvY2tldCwgY2hhcmRldiBhbmQgQ1VT
RSBpbnRlcmZhY2UuDQo+IEdpdGh1YiByZXBvOiBodHRwczovL2dpdGh1Yi5jb20vc3RlZmFu
YmVyZ2VyL3N3dHBtDQo+IEV4YW1wbGUgZm9yIHN0YXJ0aW5nIHN3dHBtIG9uIGhvc3QgbWFj
aGluZToNCj4gICAgICBta2RpciAvdG1wL3Z0cG0yDQo+ICAgICAgc3d0cG0gc29ja2V0IC0t
dHBtc3RhdGUgZGlyPS90bXAvdnRwbTIgXA0KPiAgICAgIC0tY3RybCB0eXBlPXVuaXhpbyxw
YXRoPS90bXAvdnRwbTIvc3d0cG0tc29jayAmDQo+IA0KPiAvKiBDb21tZW50IGFib3V0IG1h
Y2hpbmUgbmFtZS4gV2lsbCBiZSByZW1vdmVkIGluIG5leHQgdmVyc2lvbiovDQo+IFBsZWFz
ZSByZXBseSB3aXRoIHRoZSBtYWNoaW5lIG5hbWUgeW91IGFncmVlLiBCZWxvdyBhcmUgdHdv
IHBvc3NpYmxlIG5hbWVzOg0KPiAxLiB4ZW5wdg0KPiAyLiB4ZW5wdmgNCg0KUGxlYXNlIHVz
IHhlbnB2aCwgYXMgb24gQXJtIHRoZSBndWVzdHMgYXJlIG1vcmUgbGlrZSBQVkggZ3Vlc3Rz
Lg0KDQpUaGlzIHdpbGwgYmUgbmVlZGVkIG9uIHg4NiB0byBzdXBwb3J0IGUuZy4gdmlydGlv
IGZvciBQVkggZ3Vlc3RzLCBhbmQgeGVucHYNCmlzIGFscmVhZHkgdGFrZW4gb24geDg2IGZv
ciBQViBndWVzdHMuDQoNCg0KSnVlcmdlbg0K
--------------jwQBiKpdbcIK0ZlzimL4mEZU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------jwQBiKpdbcIK0ZlzimL4mEZU--

--------------nLE37ghTSHvx3FcSJq8miJQ2--

--------------0JOpaoe1bq5mZzQf8rX6Ox6s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOJkEQFAwAAAAAACgkQsN6d1ii/Ey9p
Hwf/bLzffr+2DuHpccC/EcmHtNqmUQcGL3qP/rBXFrsjpnASV1erPALdsQjjWtw71lxDx8q6Cvcv
Mzy9dK2Ujqr92blnH+5rZRRRj7DMmiSUd1at7o03QN1HX/ru7colGU1pc3S4lFxVz656D/g2fiDv
XKBprHcQDgh42XUM85TVVbUKvWXd7UJw3f+19hyDcvLP7PDEhJ14pyMSl5ALLgdROllg/0HI8WyN
ZxG+46Bo3ED0uIwfGB5OPCVQT2b4ioxODAmJPPA+ToKc/n+6O4ReE9y77uplhihe0v7ffyIqwf1P
2JqPMEiLFWg4riu6GI/TBhbWnpOMro9VLNZbvE3xUQ==
=7e/D
-----END PGP SIGNATURE-----

--------------0JOpaoe1bq5mZzQf8rX6Ox6s--
