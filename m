Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp3677308njd;
        Thu, 24 Apr 2025 05:58:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXq1zIkTL1JyQHb40G2VzhonGACr1R9KOscHI0oNNjATal/yfGyF21vvM3fyRNDX0bZgP3WvpsarIX7PA==@linaro.org
X-Google-Smtp-Source: AGHT+IEjyPPqRIuzKcH/xpHJWPfdDNwC+GN4L0Q1Ms9kJxFiu+ejpq8F+4Rnzh4pDhig8jLx+5uu
X-Received: by 2002:a05:620a:248d:b0:7c9:13a0:b014 with SMTP id af79cd13be357-7c956ea6098mr357591385a.14.1745499512943;
        Thu, 24 Apr 2025 05:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745499512; cv=none;
        d=google.com; s=arc-20240605;
        b=fxCpp0tCYc5lNV59HAp83goJHT7c/YfWC3parPlBXFQ8T3EFqrH+038fFyo8+DLtz1
         itCuwzJNJFH/oJLFhPu6agD7H5n/Plb2QmZGJVwHCiQZGXFCC6qF9bRkpiBprPrQcdAU
         AFHLeISarh09tX5JbaYi1o8anQ8aF7yCJxsKpCfeFJokugLjYsl2ubYp5y6er1bJlhQE
         Pg3YdDSxKJkIrgx1vboTlo0XXjcYdLHgbP2EgHL2Llg9dxhnGIcH3qq9hEm362w95FV3
         tEYGEywoD4lc53u+B/TGnFU0N4k+kxQi3QOVgS9ysl+dwqcXCT0IsZRkR3dyZr+FMAmS
         1wlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date
         :content-transfer-encoding:mime-version:subject:to:from
         :dkim-signature;
        bh=bP0LIQVPCxKxEkm3CP0PUS3fm0qPldqijpvxO1t1hD8=;
        fh=tVfbJ/7OaSdeCqAflkrg3Xf5HM6YqD/hxFzaSWLA/1g=;
        b=lDinz2Zkm9UMyrE0JGa3z/gIvGP6jrlnzvmPMyZcy8TamK/Xxd0w1yF8NTD6tjWy5b
         qtXGXaTcbmoWIuZInVX2eTy+oqa4nZn11NpCCV8sqdjtp1rLs0TYHlJF998HMeuMvQ0L
         rWtfaQVgvwpMq9SKrRqv0FE5GaBX9Yz0CuYBTuFNdth4i38hMSJLWnbC/5xyTl/Fu2Zc
         3xgaJDOE8AEHPZPYcKFwodKgB7D4EwrnrY60cZv4BlCI5jmpH4yjBWf5W1ehVw+xEZrZ
         xF4kDnpYU7uyKtNZaLpRkITxrF2mZMl7v0Zb3Be1xA4gXcYymF/R3qa9S2u7z5YBPK+j
         HVhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=L77ty9cY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=qq.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958c9b928si129465885a.62.2025.04.24.05.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Apr 2025 05:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=L77ty9cY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=qq.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7w9c-00014o-AJ; Thu, 24 Apr 2025 08:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1353455048@qq.com>) id 1u7py7-0000Cc-VF
 for qemu-arm@nongnu.org; Thu, 24 Apr 2025 02:21:56 -0400
Received: from xmbghk7.mail.qq.com ([43.163.128.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1353455048@qq.com>) id 1u7py4-0005IS-3i
 for qemu-arm@nongnu.org; Thu, 24 Apr 2025 02:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1745475691; bh=bP0LIQVPCxKxEkm3CP0PUS3fm0qPldqijpvxO1t1hD8=;
 h=From:To:Subject:Date;
 b=L77ty9cY+FVbj3xl7R3o/I1uMmCGYTaDxDTs4P+xVijzTjmeRyOi7jBMbb/eL88W6
 Jb0Nj9C8dpI4LBavGV03d3TOL7o6jNHL6M3jvI0KSfzKiNXE2ZWc/nCanrTOq9laCL
 LnkyCNa9jLCASU5mDvCYx9PTrqhiSbUbX5aTzwCs=
X-QQ-FEAT: 8OvYDnhju3PqhIVSBrBmi1ogJEMTgH+X
X-QQ-SSF: 0000000000000050000000000000
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-XMAILINFO: NkQGnmzToUyFO60+8vqh4QPkbBJFmWuzJOGG+jBnwGyxX57C18pTv8HaduoNJt
 7UO6v9vifll+yWNXRGFD0rAUw58pyvNWDtNdR7zlYKhbvG/hS894uKQByA+WrJ7YCLobTjQxROJau
 8M/lSFYrricY4WngdgGqdHoP5zrkcF3Z+uRzqQPWj6dIAlcA6Bqm+F7mWIwQGVvfPlqLJAtt4nY9n
 e/X/m5YTgboewpaNVWMOr/kJ5mI9wLXkXKBQEN0rcQdZogi0Vct96dccwrVJpiyN6SKGpZ1TJwzlW
 bhEj7929jIONV2qr6cdBFsNmDb/n0pADiyt+cTrzKH5Px9AeKxmtIexwaQaSeTIKu2ykMgsvggq7Z
 QlQN5kORbDZOTD8bq/2XQ7dJVRZ7s1R6CBd/MyuBTQFf4h/2Mnyl51iy17omqT+QgDlTDMcF04G3T
 nEkHgkd/eiQNyFcFkXyvHhvhNZzl9wrlAF7WPb5V2wYbtKbivGzbLw+uInKAcb/8crZ2tmjVdYI3I
 nUuuwBSM5RdE6ilSvCc5sD3ULBg39jH7zoygkmH4MKFUcxtSloNbGPETw4xK2IYJ5UiwzGPbLEetT
 XXTSNapya24XNcxEp3YLBgDJKsVTB5OavSWVLDhu66nyOE+TBBW0nFWGLgBuTh25qJ+Jqad2FqY43
 AmimSrGbvfygPZRFgVwnB6gVZZL0Z27QciK+HYOvS2CPZZK5KXtzOpPejqaUIUa6MQAoe7Azcr2zj
 atT3TAiWR0s4bt9uzpOrPPGwk9sbB8z2VMbBqVN1fRvGV1cNR9KrxMrZyuPQ+I35MeXxqDTbtruzz
 R70OmxHlUkEwMTS8NvqZUOoPFnaXplq/qkFNyKITr0lUJ6/4gFVoI/7VESzr/ub/6dLSVThhmrSaL
 5NIgdmzBlh5CwJ37MVksGCZDcenRno9X2DIz+0YWoKVRwiaLYMCy1Swgg1n/ab+cmcqNXX+AYeOVS
 lPBxEJ2hD/5mNqodmeXGfOehHuY29wXaevukxP2CRkiIfqi9GYXS87UpWzvVY=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 149.102.12.195
X-QQ-STYLE: 
X-QQ-mid: webmail374t1745474761t173393
From: "=?gb18030?B?0KHC7b7U?=" <1353455048@qq.com>
To: "=?gb18030?B?cWVtdS1hcm0=?=" <qemu-arm@nongnu.org>
Subject: how to use UART to receive terminal input on QEMU?
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_6809D4C9_1159AB50_47E5DDEA"
Content-Transfer-Encoding: 8Bit
Date: Thu, 24 Apr 2025 14:06:01 +0800
X-Priority: 3
Message-ID: <tencent_5A6EF18CC5A4B2803E88C06A0C70C50E0506@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Received-SPF: pass client-ip=43.163.128.48; envelope-from=1353455048@qq.com;
 helo=xmbghk7.mail.qq.com
X-Spam_score_int: 47
X-Spam_score: 4.7
X-Spam_bar: ++++
X-Spam_report: (4.7 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_PBL=3.335,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_TVD_MIME_EPI=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 24 Apr 2025 08:58:04 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: l+GKPLOM8JSg

This is a multi-part message in MIME format.

------=_NextPart_6809D4C9_1159AB50_47E5DDEA
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

V2hlbiBJIHVzZSBtcHMyLWFuMzg1IG1vZGVsIG9uIHFlbXUsIEkgZm91bmQgdGhhdCBpdCBz
ZWVtcyBub3Qgc3VwcG9ydCBnZXRjaGFyLiBJIHVzZWQgdGhlIEZyZWVSVE9TIG9mZmljaWFs
IGRlbW8obXBzMi1hbjM4NS1HQ0MtUUVNVSksIHRoZW4gSSB0cmllZCB0byB1c2UgVUFSVCZu
YnNwOyB0byByZWNlaXZlIGlucHV0IHN0cmluZ3MgZnJvbSBRRU1VIHRlcm1pbmFsLCBzbyBJ
IHRyaWVkIHRvIHVzZSBnZXRjaGFyKCkgZnVuY3Rpb24uIEhvd2V2ZXIsIHNvbWUgZXJyb3Jz
IG9jY3VycmVkIGluIFFFTVUgYXMgc2hvd24gYmVsb3c6DQpxZW11OiBmYXRhbDogTG9ja3Vw
OiBjYW4ndCBlc2NhbGF0ZSAzIHRvIEhhcmRGYXVsdCAoY3VycmVudCBwcmlvcml0eSAtMSkN
CklzIGl0IG1lYW5zIHRoZXJlIGFyZSBzb21ldGhpbmcgd3JvbmcgaW4gdGhlIGVtdWxhdGVk
IGJvYXJkPyBBbmQgaG93IHRvIHNvbHZlIHRoZSBwcm9ibGVtPw0KDQoNCiZuYnNwOw==

------=_NextPart_6809D4C9_1159AB50_47E5DDEA
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6ICZxdW90O2x1Y2lkYSBH
cmFuZGUmcXVvdDssIFZlcmRhbmEsICZxdW90O01pY3Jvc29mdCBZYUhlaSZxdW90OzsiPldo
ZW4gSSB1c2UgbXBzMi1hbjM4NSBtb2RlbCBvbiBxZW11LCBJIGZvdW5kIHRoYXQgaXQgc2Vl
bXMgbm90IHN1cHBvcnQgZ2V0Y2hhci4gSSB1c2VkIHRoZSBGcmVlUlRPUyBvZmZpY2lhbCBk
ZW1vKG1wczItYW4zODUtR0NDLVFFTVUpLCB0aGVuIEkgdHJpZWQgdG8gdXNlIFVBUlQmbmJz
cDsgdG8gcmVjZWl2ZSBpbnB1dCBzdHJpbmdzIGZyb20gUUVNVSB0ZXJtaW5hbCwgc28gSSB0
cmllZCB0byB1c2UgZ2V0Y2hhcigpIGZ1bmN0aW9uLiBIb3dldmVyLCBzb21lIGVycm9ycyBv
Y2N1cnJlZCBpbiBRRU1VIGFzIHNob3duIGJlbG93Ojxicj48c3BhbiBzdHlsZT0iY29sb3I6
IHJnYigyMDQsIDIwNCwgMjA0KTsiPnFlbXU6IGZhdGFsOiBMb2NrdXA6IGNhbid0IGVzY2Fs
YXRlIDMgdG8gSGFyZEZhdWx0IChjdXJyZW50IHByaW9yaXR5IC0xKTwvc3Bhbj48L2Rpdj48
ZGl2IHN0eWxlPSJmb250LWZhbWlseTogJnF1b3Q7bHVjaWRhIEdyYW5kZSZxdW90OywgVmVy
ZGFuYSwgJnF1b3Q7TWljcm9zb2Z0IFlhSGVpJnF1b3Q7OyI+SXMgaXQgbWVhbnMgdGhlcmUg
YXJlIHNvbWV0aGluZyB3cm9uZyBpbiB0aGUgZW11bGF0ZWQgYm9hcmQ/IEFuZCBob3cgdG8g
c29sdmUgdGhlIHByb2JsZW0/PC9kaXY+PGRpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6MTRw
eDtmb250LWZhbWlseTpWZXJkYW5hO2NvbG9yOiMwMDA7Ij48L2Rpdj48L2Rpdj48ZGl2PiZu
YnNwOzwvZGl2Pg==

------=_NextPart_6809D4C9_1159AB50_47E5DDEA--
SVR_é	
