Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp999011njf;
        Sun, 1 Sep 2024 23:12:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNu6N+QrPILqBFDKS+PULzPqGZ5KnqEMJrpitYAscwgXPn9PqMWLkFax4ZR+cV9+GEv0T6D7gTW3xyUA==@linaro.org
X-Google-Smtp-Source: AGHT+IEiK6eahmWtdh1J4SyG7zLPr+VFTsxh6Z00oUpVcKdEWV1CyogcPRYYy7QUln7U/Q06dYGY
X-Received: by 2002:a05:622a:1927:b0:457:c4d9:ab00 with SMTP id d75a77b69052e-457c4d9ad7amr82773601cf.10.1725257527880;
        Sun, 01 Sep 2024 23:12:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725257527; cv=none;
        d=google.com; s=arc-20160816;
        b=RBNHq0VTlc225ERm7Ll9GUn+WbwVyl4jGPd06wDtsFUmhIVqXtisf+sqSyxKxCPBgF
         e+WibC4A2c+42QUWLJH/u2OYj+rSAV7nDylIF5jBrosi0BBIk9r7IxEI5qNPGnY5wTW0
         JZ7EwqZaFNsV9K4YIuY2whhk/ZSj8sX17SXXyx5LYYw6P7X2qr+pBV3eiQQSNGWy+HG6
         Bbezy60KZEUUHH2NHS4etGTrdN/AWzasbsI2EaUodemM4ZeIk+SoXgcWp0QyUho1+YcL
         27jpMuvKYnUM28iP1/WGXvi0py41ZWgakZcE6ckQt2xJT4qtfPeLF9zGZYtfS0/W9Fj7
         9UfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date
         :content-transfer-encoding:mime-version:subject:cc:to:from
         :references:in-reply-to:dkim-signature;
        bh=F7qBS1ZPRtjuaqSzHNPQ1n3Dq3uKNoAPF+iItFlVa/g=;
        fh=w1w+t3OCeiKgy0tuZzwfmxVgKnC9SvTYo69eyO6GOgE=;
        b=kIrugRI/K18gDWwgHIOqB3cjwkrFULtB2OtKc3KCDiOJLNRYKE4Zxxiyoz+EALsDvJ
         V/0hw5o4g2Fa/G169gi9UhZ7icfILbMQ8jiEA3zq7fj7pKnitptAJ1GGoXofq5L9JNXx
         YDBt0CkVTrfmobrhP6NJiKGzW5co19Fk3xz9aFx+iOk5H8pNRCvWPM35LR8BziWhVTui
         eGX4zj8fUQwYVMPH/vxYV79jP119wP8eI11JRYJs+oU/ge0Onexmp9UwVD4jOL5wgMcD
         q6o6gJyioflebaztxeaPdFOspe0BUEsgZx7qBlEtqCR4N0Ae3pULIHzhFIAKioJkp3h8
         JEZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=zmBOED16;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=qq.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682db877csi97711061cf.559.2024.09.01.23.12.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Sep 2024 23:12:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=zmBOED16;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=qq.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl0I5-00037p-IR; Mon, 02 Sep 2024 02:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guyqqcom@qq.com>) id 1sl0I4-00036c-Ez
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 02:11:52 -0400
Received: from out203-205-221-236.mail.qq.com ([203.205.221.236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guyqqcom@qq.com>) id 1sl0I1-00061X-Fn
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 02:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1725257476; bh=F7qBS1ZPRtjuaqSzHNPQ1n3Dq3uKNoAPF+iItFlVa/g=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date;
 b=zmBOED16WkNI8+MQaJ6k3gJxz2/HgG9uWCxLsDlFz1kYNmrU02stKVqTmw0n4nWi7
 ldy7rP8pGZGWlS0O2rT5/i6L1hGi54UviDmLw2RCFQA7Blvka2YXTFOlijYzOxBEWZ
 PAZyBPYAz3Dbz9v7RX7YoplGoLjvqlXoPIAt29S0=
X-QQ-FEAT: oHWrrGTW1dAl5G87yEx6LpeS/9hBRv0w
X-QQ-SSF: 00000000000000F0000000000000
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-XMAILINFO: MhrZ8yb89+ro2WRkI8WOBcoNyLdc6TbxnqdJrqDstGWeKoo2dsDi68j7OGno4Z
 of78hObMHk6GGGIRNw5p6dFtG/6czxQ8AwDO78VLCAdp60hS/mQgNronH6IDOdBji+aTE6PnSKVwq
 8na9x10FmEzI42r5XeBQ7NkHRCjIr5yxqriFGo3g6fSuG09NjQlMT895FIiu0qNmgj/NQQeRoFQRq
 /pELjO73EvRSJGOrO7RDbQuSkYCeuqLLnIxYQVe3nPxnYEwWIoqhuJC5/jlGz2BKlOeNyxOaZLXAS
 hNBj0tndEWoarrxbDpfYTqfs48/xXoNNKNT78WtKGaGP8sDMHWGGm4I2sNrB4gpm4a0Qo8WamG/QO
 ad1E0QzPjnqS912VePsX47jNvVIm+9XqjIc8+P6w3yDhdznYBJJSDF+XRiq8y0RC1rsOQRM2ISCuS
 0XSd+HWHTsrTopGX7rYN5AO2GoEZ2ngjMJRmWxkQyc+gZ7sfiWMnMiNyFM3SfDeqmOKl9U9PyKnQp
 M5XecMuvRR9BeVvkSR8vYOQRSDTrQKCEKxn24WIfxOv5+FJqG+TDyE5tGRVPmf8sO5wuyeXq9EBiP
 OZolVaHPlUVJOdOMIUyPGz08DFG66K96/AsatudBdnHT8/B/KOMbbZAsyOlewOa6cX9PboHnDVFjb
 f/kHpNvs9oxSPvxPd01VZ9Z/muuq0y2HW6RL+JxiatVCCRsT+33Wj+whlPAMd7mqX4qrPTocGJDsA
 iEGmawHgIHpbOsnAq1KFZF/PVtmoI7sq2+UqEN9oCdYyw09/X6IPJty6ct77LaxMP5/rvo4JrJvFA
 K5tJ6n67VRVCLO20m1pNufi5OM6tmGVPoKQe714aZC1A9yQ+WRMNEvhZxoHILw0/ePgBN/OyNFKNx
 2NtTXD5nDCHxdn+3K9dH5mMD+b3uiuPo57CXbLkTMfOTo64az+++P3gk+tKZR267OsIogGz0cAx8R
 6YEVX30w==
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 180.165.167.46
In-Reply-To: <CAFEAcA9zizTZ-qtvEf31eDYj9ognKHpaSkM6OsJxug-_e1JE5Q@mail.gmail.com>
References: <tencent_3E0F9F905031BE780D8EB329DA00C7EDFA0A@qq.com>
 <CAFEAcA9zizTZ-qtvEf31eDYj9ognKHpaSkM6OsJxug-_e1JE5Q@mail.gmail.com>
X-QQ-STYLE: 
X-QQ-mid: webmail633t1725257401t8497631
From: "=?gb18030?B?R3V5?=" <guyqqcom@qq.com>
To: "=?gb18030?B?UGV0ZXIgTWF5ZGVsbA==?=" <peter.maydell@linaro.org>
Cc: "=?gb18030?B?cWVtdS1hcm0=?=" <qemu-arm@nongnu.org>
Subject: =?gb18030?B?UmWjuiBUcm91Ymxlc2hvb3RpbmcgRGF0YSBBYm9y?=
 =?gb18030?B?dCBFcnJvciBXaGlsZSBEZWJ1Z2dpbmcgVS1Cb290?=
 =?gb18030?B?IG9uIG1jaW14NnVsLWV2ayBpbiBRRU1V?=
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_66D556B9_178A5E30_0D77D9BF"
Content-Transfer-Encoding: 8Bit
Date: Mon, 2 Sep 2024 14:10:01 +0800
X-Priority: 3
Message-ID: <tencent_72A38157DF7887E22DF0DAEED9B009892C06@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Received-SPF: pass client-ip=203.205.221.236; envelope-from=guyqqcom@qq.com;
 helo=out203-205-221-236.mail.qq.com
X-Spam_score_int: 40
X-Spam_score: 4.0
X-Spam_bar: ++++
X-Spam_report: (4.0 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, FROM_EXCESS_BASE64=0.001, HELO_DYNAMIC_IPADDR=1.951,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-TUID: H9t56UQGZ714

This is a multi-part message in MIME format.

------=_NextPart_66D556B9_178A5E30_0D77D9BF
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

V2hlbiBJIGF0dGVtcHQgdG8gcnVuIFUtQm9vdCBhbmQgZGVidWcgaXQgd2l0aCBHREIsIEkg
ZW5jb3VudGVyIGFuIGlzc3VlIGluIHRoZSBnZXRfY3B1X3JldiBmdW5jdGlvbjoNCnN0cnVj
dCBzY3VfcmVncyAqc2N1ID0gKHN0cnVjdCBzY3VfcmVncyAqKVNDVV9CQVNFX0FERFI7DQpj
ZmcgPSByZWFkbCgmYW1wO3NjdS0mZ3Q7Y29uZmlnKSAmYW1wOyAzOw0KVGhpcyB0cmlnZ2Vy
cyBhIGRhdGFfYWJvcnQgZXJyb3IuIFRoZSBsb2cgZGlzcGxheXMNCi0tLS0tLS0tLS0tLS0t
LS0NCklOOiBnZXRfY3B1X3Jldg0KMHg4NzgwMjc4NjombmJzcDsmbmJzcDsNCk9CSkQtVDog
NTk2OA0KSW52YWxpZCByZWFkIGF0IGFkZHIgMHhBMDAwMDQsIHNpemUgNCwgcmVnaW9uICco
bnVsbCknLCByZWFzb246IHJlamVjdGVkDQotLS0tLS0tLS0tLS0tLS0tDQpGdXJ0aGVybW9y
ZSwgSSBhbHNvIHRlc3RlZCBhIHByZWNvbXBpbGVkIHFlbXUtc3lzdGVtLWFybS5leGUgaW4g
d2luZG93cyAodGhlIC12ZXJzaW9uIGNvbW1hbmQgc2hvd3MgdGhlIHNhbWUgNy4yLjAgdmVy
c2lvbiBvZiBRRU1VLCBhbHRob3VnaCBJJ20gbm90IHN1cmUgaWYgdGhlcmUgd2VyZSBhbnkg
ZGlmZmVyZW5jZXMgaW4gdGhlIGNvbXBpbGF0aW9uIHByb2Nlc3MpIHRvIGRlYnVnIHRoZSBz
YW1lIFUtQm9vdCBjb2RlLCBhbmQgSSBkaWQgbm90IGVuY291bnRlciB0aGUgZGF0YV9hYm9y
dCBlcnJvciBhdCB0aGUgZ2V0X2NwdV9yZXYgc3RlcC4gVGhlIGxvZyBkaXNwbGF5cw0KLS0t
LS0tLS0tLS0tLS0tLQ0KSU46IGdldF9jcHVfcmV2DQoweDg3ODAyNzg2OiZuYnNwOyZuYnNw
Ow0KT0JKRC1UOiA1OTY4DQpzY3U6IHVuaW1wbGVtZW50ZWQgZGV2aWNlIHJlYWQmbmJzcDsg
KHNpemUgNCwgb2Zmc2V0IDB4MDAwNCkNCi0tLS0tLS0tLS0tLS0tLS0NCkkgd29uZGVyIGhv
dyB0aGUgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGVzZSB0d28gc2l0dWF0aW9ucyBhcmlzZT8m
bmJzcDtDb3VsZCBpdCBiZSByZWxhdGlvbnNoaXBzIG9uIGNvbXBpbGF0aW9uIG9wdGlvbnM/
DQoNCg0KDQoNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpPbiBG
cmksIDMwIEF1ZyAyMDI0IGF0IDA1OjExLCBHdXkgPGd1eXFxY29tQHFxLmNvbSZndDsgd3Jv
dGU6DQomZ3Q7DQomZ3Q7IEkgYW0gdHJ5aW5nIHRvIGRlYnVnIFUtQm9vdCBjb2RlIGluIFVi
dW50dSAxOC4wNCB1c2luZyB0aGUgbWNpbXg2dWwtZXZrIGJvYXJkIGluIFFFTVUuIEkgaGF2
ZSBzdWNjZXNzZnVsbHkgY29tcGlsZWQgUUVNVSBhbmQgVS1Cb290IHVzaW5nIGFybS1saW51
eC1nbnVlYWJpaGYtLiBXaGVuIEkgYXR0ZW1wdCB0byBydW4gVS1Cb290IGFuZCBkZWJ1ZyBp
dCB3aXRoIEdEQiwgSSBlbmNvdW50ZXIgYW4gaXNzdWUgaW4gdGhlIGdldF9jcHVfcmV2IGZ1
bmN0aW9uOg0KJmd0Ow0KJmd0OyBzdHJ1Y3Qgc2N1X3JlZ3MgKnNjdSA9IChzdHJ1Y3Qgc2N1
X3JlZ3MgKilTQ1VfQkFTRV9BRERSOw0KJmd0OyAyY2ZnID0gcmVhZGwoJmFtcDtzY3UtJmd0
O2NvbmZpZykgJmFtcDsgMzsNCiZndDsNCiZndDsgVGhpcyB0cmlnZ2VycyBhIGRhdGFfYWJv
cnQgZXJyb3IuIFRoZSBsb2cgZGlzcGxheXMgIkludmFsaWQgcmVhZCBhdCBhZGRyIDB4QTAw
MDA0LCBzaXplIDQsIHJlZ2lvbiAnKG51bGwpJywgcmVhc29uOiByZWplY3RlZC4iDQoNClRo
aXMgaXMgYmVjYXVzZSBRRU1VIGRvZXMgbm90IG1vZGVsIGFueSBkZXZpY2UgYXQgdGhhdCBh
ZGRyZXNzLg0KV2hhdCBkbyB5b3UgdGhpbmsgaXMgc3VwcG9zZWQgdG8gYmUgdGhlcmU/IFRo
ZSBDb3J0ZXgtQTkgaGFzDQphIHNub29wLWNvbnRyb2wtcmVnaXN0ZXIgYXQgdGhhdCBvZmZz
ZXQgZnJvbSBQRVJJUEhCQVNFLCBidXQNCmFzIGZhciBhcyBJIGFtIGF3YXJlIHRoZSBDb3J0
ZXgtQTcgd2hpY2ggdGhlIG1jaW14NnVsLWV2aw0KYm9hcmQgdXNlcyBkb2VzIG5vdCBoYXZl
IGFueSBTQ1UgcmVnaXN0ZXJzLg0KDQomZ3Q7IEkndmUgdGVzdGVkIG11bHRpcGxlIHZlcnNp
b25zIG9mIFFFTVUgKDcuMi4wLzQuMS4xKSBhbmQgVS1Cb290ICh1LWJvb3QtZnNsYy0yMDE2
LjA1L3UtYm9vdC1mc2xjLTIwMjMuMTAvdWJvb3QtaW14LXJlbF9pbXhfNC4xLjE1XzIuMS4w
X2dhKS4gV2hlbiBJIHJ1biBxZW11LXN5c3RlbS1hcm0gLU0gaGVscCwgdGhlIFN1cHBvcnRl
ZCBtYWNoaW5lcyBsaXN0IGluY2x1ZGVzIG1jaW14NnVsLWV2ay4NCg0KQnkgdGhlIHdheSwg
Ny4yIGlzIG5vdyBhIG1vZGVyYXRlbHkgb2xkZXIgdmVyc2lvbiBvZiBRRU1VLg0KSXQgd29u
J3QgZml4IHRoaXMgcHJvYmxlbSwgYnV0IGluIGdlbmVyYWwgaWYgeW91J3JlIGJ1aWxkaW5n
DQpmcm9tIHNvdXJjZSBhbnl3YXkgeW91IHNob3VsZCB1c2UgdGhlIG1vc3QgcmVjZW50IHZl
cnNpb24uDQoNCi0tIFBNTQ==

------=_NextPart_66D556B9_178A5E30_0D77D9BF
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj48cCBkYXRhLXNvdXJjZXBvcz0iMzoxLTM6MTAzIiBkaXI9
ImF1dG8iIHN0eWxlPSIiPjxmb250IHNpemU9IjMiPldoZW4gSSBhdHRlbXB0IHRvIHJ1biBV
LUJvb3QgYW5kIGRlYnVnIGl0IHdpdGggR0RCLCBJIGVuY291bnRlciBhbiBpc3N1ZSBpbiB0
aGUgZ2V0X2NwdV9yZXYgZnVuY3Rpb246PC9mb250PjwvcD48YmxvY2txdW90ZSBzdHlsZT0i
bWFyZ2luOiAwLjhlbSAwcHggMC44ZW0gMmVtOyBwYWRkaW5nOiAwcHggMHB4IDBweCAwLjdl
bTsgYm9yZGVyLWxlZnQ6IDJweCBzb2xpZCByZ2IoMjIxLCAyMjEsIDIyMSk7IiBmb3JtYXRi
bG9jaz0iMSI+PGZvbnQgc2l6ZT0iMyI+c3RydWN0IHNjdV9yZWdzICpzY3UgPSAoc3RydWN0
IHNjdV9yZWdzICopU0NVX0JBU0VfQUREUjs8YnI+PC9mb250Pjxmb250IHNpemU9IjMiPmNm
ZyA9IHJlYWRsKCZhbXA7c2N1LSZndDtjb25maWcpICZhbXA7IDM7PC9mb250PjwvYmxvY2tx
dW90ZT48cCBkYXRhLXNvdXJjZXBvcz0iMzoxLTM6MTAzIiBkaXI9ImF1dG8iIHN0eWxlPSIi
Pjxmb250IHNpemU9IjMiPlRoaXMgdHJpZ2dlcnMgYSBkYXRhX2Fib3J0IGVycm9yLiBUaGUg
bG9nIGRpc3BsYXlzPC9mb250PjwvcD48YmxvY2txdW90ZSBzdHlsZT0ibWFyZ2luOiAwLjhl
bSAwcHggMC44ZW0gMmVtOyBwYWRkaW5nOiAwcHggMHB4IDBweCAwLjdlbTsgYm9yZGVyLWxl
ZnQ6IDJweCBzb2xpZCByZ2IoMjIxLCAyMjEsIDIyMSk7IiBmb3JtYXRibG9jaz0iMSI+PGZv
bnQgc2l6ZT0iMyI+LS0tLS0tLS0tLS0tLS0tLTxicj48L2ZvbnQ+PGZvbnQgc2l6ZT0iMyI+
SU46IGdldF9jcHVfcmV2PGJyPjwvZm9udD48Zm9udCBzaXplPSIzIj4weDg3ODAyNzg2OiZu
YnNwOyZuYnNwOzxicj48L2ZvbnQ+PGZvbnQgc2l6ZT0iMyI+T0JKRC1UOiA1OTY4PGJyPjwv
Zm9udD48Zm9udCBzaXplPSIzIj5JbnZhbGlkIHJlYWQgYXQgYWRkciAweEEwMDAwNCwgc2l6
ZSA0LCByZWdpb24gJyhudWxsKScsIHJlYXNvbjogcmVqZWN0ZWQ8YnI+PC9mb250Pjxmb250
IHNpemU9IjMiPi0tLS0tLS0tLS0tLS0tLS08L2ZvbnQ+PC9ibG9ja3F1b3RlPjxwIGRhdGEt
c291cmNlcG9zPSIzOjEtMzoxMDMiIGRpcj0iYXV0byIgc3R5bGU9IiI+PGZvbnQgc2l6ZT0i
MyI+RnVydGhlcm1vcmUsIEkgYWxzbyB0ZXN0ZWQgYSBwcmVjb21waWxlZCBxZW11LXN5c3Rl
bS1hcm0uZXhlIGluIHdpbmRvd3MgKHRoZSAtdmVyc2lvbiBjb21tYW5kIHNob3dzIHRoZSBz
YW1lIDcuMi4wIHZlcnNpb24gb2YgUUVNVSwgYWx0aG91Z2ggSSdtIG5vdCBzdXJlIGlmIHRo
ZXJlIHdlcmUgYW55IGRpZmZlcmVuY2VzIGluIHRoZSBjb21waWxhdGlvbiBwcm9jZXNzKSB0
byBkZWJ1ZyB0aGUgc2FtZSBVLUJvb3QgY29kZSwgYW5kIEkgZGlkIG5vdCBlbmNvdW50ZXIg
dGhlIGRhdGFfYWJvcnQgZXJyb3IgYXQgdGhlIGdldF9jcHVfcmV2IHN0ZXAuIFRoZSBsb2cg
ZGlzcGxheXM8L2ZvbnQ+PC9wPjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW46IDAuOGVtIDBw
eCAwLjhlbSAyZW07IHBhZGRpbmc6IDBweCAwcHggMHB4IDAuN2VtOyBib3JkZXItbGVmdDog
MnB4IHNvbGlkIHJnYigyMjEsIDIyMSwgMjIxKTsiIGZvcm1hdGJsb2NrPSIxIj48Zm9udCBz
aXplPSIzIj4tLS0tLS0tLS0tLS0tLS0tPGJyPjwvZm9udD48Zm9udCBzaXplPSIzIj5JTjog
Z2V0X2NwdV9yZXY8YnI+PC9mb250Pjxmb250IHNpemU9IjMiPjB4ODc4MDI3ODY6Jm5ic3A7
Jm5ic3A7PGJyPjwvZm9udD48Zm9udCBzaXplPSIzIj5PQkpELVQ6IDU5Njg8YnI+PC9mb250
Pjxmb250IHNpemU9IjMiPnNjdTogdW5pbXBsZW1lbnRlZCBkZXZpY2UgcmVhZCZuYnNwOyAo
c2l6ZSA0LCBvZmZzZXQgMHgwMDA0KTxicj48L2ZvbnQ+PGZvbnQgc2l6ZT0iMyI+LS0tLS0t
LS0tLS0tLS0tLTwvZm9udD48L2Jsb2NrcXVvdGU+PHAgZGF0YS1zb3VyY2Vwb3M9IjM6MS0z
OjEwMyIgZGlyPSJhdXRvIiBzdHlsZT0iIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOiBtZWRp
dW07Ij5JIHdvbmRlciBob3cgdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlc2UgdHdvIHNp
dHVhdGlvbnMgYXJpc2U/Jm5ic3A7PC9zcGFuPjxmb250IHNpemU9IjMiPkNvdWxkIGl0IGJl
IHJlbGF0aW9uc2hpcHMgb24gY29tcGlsYXRpb24gb3B0aW9ucz88L2ZvbnQ+PC9wPjwvZGl2
PjxkaXYgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsiPjxkaXY+PGJyPjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJweDtmb250LWZhbWlseTogQXJp
YWwgTmFycm93O3BhZGRpbmc6MnB4IDAgMnB4IDA7Ij4tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS08L2Rpdj5PbiBGcmksIDMwIEF1ZyAyMDI0IGF0IDA1OjExLCBHdXkg
Jmx0O2d1eXFxY29tQHFxLmNvbSZndDsgd3JvdGU6PGJyPiZndDs8YnI+Jmd0OyBJIGFtIHRy
eWluZyB0byBkZWJ1ZyBVLUJvb3QgY29kZSBpbiBVYnVudHUgMTguMDQgdXNpbmcgdGhlIG1j
aW14NnVsLWV2ayBib2FyZCBpbiBRRU1VLiBJIGhhdmUgc3VjY2Vzc2Z1bGx5IGNvbXBpbGVk
IFFFTVUgYW5kIFUtQm9vdCB1c2luZyBhcm0tbGludXgtZ251ZWFiaWhmLS4gV2hlbiBJIGF0
dGVtcHQgdG8gcnVuIFUtQm9vdCBhbmQgZGVidWcgaXQgd2l0aCBHREIsIEkgZW5jb3VudGVy
IGFuIGlzc3VlIGluIHRoZSBnZXRfY3B1X3JldiBmdW5jdGlvbjo8YnI+Jmd0Ozxicj4mZ3Q7
IHN0cnVjdCBzY3VfcmVncyAqc2N1ID0gKHN0cnVjdCBzY3VfcmVncyAqKVNDVV9CQVNFX0FE
RFI7PGJyPiZndDsgMmNmZyA9IHJlYWRsKCZhbXA7c2N1LSZndDtjb25maWcpICZhbXA7IDM7
PGJyPiZndDs8YnI+Jmd0OyBUaGlzIHRyaWdnZXJzIGEgZGF0YV9hYm9ydCBlcnJvci4gVGhl
IGxvZyBkaXNwbGF5cyAiSW52YWxpZCByZWFkIGF0IGFkZHIgMHhBMDAwMDQsIHNpemUgNCwg
cmVnaW9uICcobnVsbCknLCByZWFzb246IHJlamVjdGVkLiI8YnI+PGJyPlRoaXMgaXMgYmVj
YXVzZSBRRU1VIGRvZXMgbm90IG1vZGVsIGFueSBkZXZpY2UgYXQgdGhhdCBhZGRyZXNzLjxi
cj5XaGF0IGRvIHlvdSB0aGluayBpcyBzdXBwb3NlZCB0byBiZSB0aGVyZT8gVGhlIENvcnRl
eC1BOSBoYXM8YnI+YSBzbm9vcC1jb250cm9sLXJlZ2lzdGVyIGF0IHRoYXQgb2Zmc2V0IGZy
b20gUEVSSVBIQkFTRSwgYnV0PGJyPmFzIGZhciBhcyBJIGFtIGF3YXJlIHRoZSBDb3J0ZXgt
QTcgd2hpY2ggdGhlIG1jaW14NnVsLWV2azxicj5ib2FyZCB1c2VzIGRvZXMgbm90IGhhdmUg
YW55IFNDVSByZWdpc3RlcnMuPGJyPjxicj4mZ3Q7IEkndmUgdGVzdGVkIG11bHRpcGxlIHZl
cnNpb25zIG9mIFFFTVUgKDcuMi4wLzQuMS4xKSBhbmQgVS1Cb290ICh1LWJvb3QtZnNsYy0y
MDE2LjA1L3UtYm9vdC1mc2xjLTIwMjMuMTAvdWJvb3QtaW14LXJlbF9pbXhfNC4xLjE1XzIu
MS4wX2dhKS4gV2hlbiBJIHJ1biBxZW11LXN5c3RlbS1hcm0gLU0gaGVscCwgdGhlIFN1cHBv
cnRlZCBtYWNoaW5lcyBsaXN0IGluY2x1ZGVzIG1jaW14NnVsLWV2ay48YnI+PGJyPkJ5IHRo
ZSB3YXksIDcuMiBpcyBub3cgYSBtb2RlcmF0ZWx5IG9sZGVyIHZlcnNpb24gb2YgUUVNVS48
YnI+SXQgd29uJ3QgZml4IHRoaXMgcHJvYmxlbSwgYnV0IGluIGdlbmVyYWwgaWYgeW91J3Jl
IGJ1aWxkaW5nPGJyPmZyb20gc291cmNlIGFueXdheSB5b3Ugc2hvdWxkIHVzZSB0aGUgbW9z
dCByZWNlbnQgdmVyc2lvbi48YnI+PGJyPi0tIFBNTTwvZGl2Pg==

------=_NextPart_66D556B9_178A5E30_0D77D9BF--

