Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp1949351ejh;
        Mon, 29 Aug 2022 12:59:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4EQ2mHkr/dfZVBpw1s2X0S0mkohxgKNKQ6LUfa0RrvrHrhNxQwj97hCjRK749TkaKhFgeZ
X-Received: by 2002:a05:620a:44c1:b0:6ba:dff2:2b72 with SMTP id y1-20020a05620a44c100b006badff22b72mr9441103qkp.256.1661803160285;
        Mon, 29 Aug 2022 12:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661803160; cv=none;
        d=google.com; s=arc-20160816;
        b=CoVccDkI5KMnIsM3YvKCD6fvcyZCMM6Lr284YV2R+h1IETuDolM92gK3w0LamOY6Bc
         y7XkYUU2Hn8rpqdr/7AFXV2AtT9vkbZExNX4uk63pf8R9y9bNo6lvOejooHbp4ZoT8lF
         hyMVrQRmAc27OwY+Zw1DwZ8esYj5nmrQMrjlM4R3uKh7ItZ4w0nUIr6a+SoRJiYgATDs
         LJbYDPyzQu5vWmM+RyO8hgsN0JOE9qhoknJJps5IZ5FIfFiD+fN+n2nfRVbbDKVy+tLo
         PD1e+poAlcXHGhNjmxbg82U4DSs4NuvXPiXJQwTWFSZK8Q19RxGSiN/I/ncwKBChp7ZH
         wAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=UKpFgfDL3y58P9DSxtrFGsMpGPiSFxSEVsCsjJ+a4k4=;
        b=LaaDC1phJFMYvZtK22K3ne6Bg4Eb3tH2Iy2CHjAs0usPg1zicRDkAqkJH2VIdRSfwB
         +Z4tNbDVFo6ImR90XYgNGecCdnvoEJ5psOBJ9Gi4KgZ0rFyYsLLu1OAxErlnpM8nHykg
         d7WHUEFumV/mjuLuJh9aYXmhm2CRVSkbj/b3xoI4HwkXS0O23WuosSO6ov5vljy5Fpai
         l3YVTaBvX/dYu7pWhNNA/5EzwnHcWl3Y/xM6a5N7IeT+s3bDAwntivttZagDR2L0gHaE
         UZQ3o6wskQ3KCuirHPGGWDAlNkJKFg3NCGbyISmJvrGJbUJlJeKX0zZAoa+TMEfHQGhF
         KWew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20210112 header.b=pu6ZmCuo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16-20020ac85210000000b003434f7eb5basi4345841qtn.346.2022.08.29.12.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Aug 2022 12:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20210112 header.b=pu6ZmCuo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oSkul-0008Nl-Pr
	for alex.bennee@linaro.org; Mon, 29 Aug 2022 15:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ld.adecy@gmail.com>)
 id 1oSjGH-0001rw-Ai
 for qemu-arm@nongnu.org; Mon, 29 Aug 2022 14:13:25 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ld.adecy@gmail.com>)
 id 1oSjGD-0003QN-GF
 for qemu-arm@nongnu.org; Mon, 29 Aug 2022 14:13:24 -0400
Received: by mail-pg1-x529.google.com with SMTP id bh13so8406081pgb.4
 for <qemu-arm@nongnu.org>; Mon, 29 Aug 2022 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=K33P1Y+QvhL8VESyXIG17h6/cbDK5Hr3XMwGBeBB2ew=;
 b=pu6ZmCuo23u0ql3Ky1ht2n/eJwAltrHpYu39rQ4AT/1WsjeJo9m6mvuyB7Q99aXw+S
 JoXCmgPM1qvSGuo/1TAIDXgIxkD3M0k527U72acx8uqWdigUazsBL06yD4U8VhEnZUaC
 95LIuAUuVza2Ks6bjlLJ2Q5jCdqJ6SeYe6UrUN4XdGbMqlZUnXKOHJQ0BYAP9s/GF5d0
 mu9CzwsopLl+icds6Sk6H0SLVQ+p6yMJjDRJ3tcf49tVVZVT1W1cGunX+cKVPU3VmNo3
 b7IYdDyPXjJWwi7Lp/cjBuP0CVmT2pdZXiZ668IDHcuz/Yt6lYPILNjqZxKLb9UYNsza
 bw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=K33P1Y+QvhL8VESyXIG17h6/cbDK5Hr3XMwGBeBB2ew=;
 b=C+SzrshCobT9+2MrjU5kb+1dhF4S5QW83xh2sE1jDwU/wHmtE1oV1OH0Ad8gtPEG3h
 BWTtWYItdjM7LL39xEG0LJJwjU2P4cZEPdljclyhy4CSeiAnZWP/nnZt3xA9UoNzFzUJ
 xKM+jWAKv433Zsw6M7TbfVOgBzITxOfb7k2D0ZU989Ft8RTOo+gkKJp3UQjtYqkYB6gO
 hw/QdkYdZUJ1l9ffuuyAgdVSVTbQVyRN7Q4NDhjr8hJ3vdh4NPO6wtILKswrv0FD4nUv
 VLnAWlWzyztwVqNQUek2UWgr4yhgYXFWMr0OFD16WQO6Lc+ZYVao6XAhzE9Lq+gkcVpO
 /7Bg==
X-Gm-Message-State: ACgBeo2TLxQ44FZnqOtAzxbcSGCO0zEBez5WEGXHCrdhaJ/XscpapRzK
 uPAtMDoA//LJTU411MaidRlXoD5xTcBkEB7o2OQakRv8t6Y=
X-Received: by 2002:a05:6a00:acc:b0:530:e79e:fc27 with SMTP id
 c12-20020a056a000acc00b00530e79efc27mr17831756pfl.61.1661796799340; Mon, 29
 Aug 2022 11:13:19 -0700 (PDT)
MIME-Version: 1.0
From: Adecy <ld.adecy@gmail.com>
Date: Mon, 29 Aug 2022 20:13:08 +0200
Message-ID: <CAB295yAkUjZLxOZ_b4P9r7JMhkN=iOoTYV6aYJa9myJ1EevHuA@mail.gmail.com>
Subject: QEMU ARM patch - Signal TSFL_INT flag for lan9118 device interrupt
To: qemu-arm@nongnu.org
Content-Type: multipart/mixed; boundary="000000000000ea0cdb05e76537e3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=ld.adecy@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Aug 2022 15:58:46 -0400
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6kLZhC0dNgZo

--000000000000ea0cdb05e76537e3
Content-Type: multipart/alternative; boundary="000000000000ea0cda05e76537e1"

--000000000000ea0cda05e76537e1
Content-Type: text/plain; charset="UTF-8"

Hello

I'm new to QEMU, and I would like to submit the attached patch.

To give you more context, this patch is required to have the Micrium
LAN911x Ethernet driver to work with QEMU, as it requires TSFL_INT flag to
be signaled through the interrupt.
(demo https://github.com/lucasdietrich/micrium-os3-qemu-arm-demo)

I remain at your disposal.

Best regards

--000000000000ea0cda05e76537e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello</div><div><br><div>I&#39;m new to QEMU, and I w=
ould like to submit the attached patch.</div><div><br></div><div>To give yo=
u more context, this patch is required to have the Micrium LAN911x Ethernet=
 driver to work with QEMU, as it requires=C2=A0TSFL_INT flag to be signaled=
 through the interrupt.<br>(demo=C2=A0<a href=3D"https://github.com/lucasdi=
etrich/micrium-os3-qemu-arm-demo">https://github.com/lucasdietrich/micrium-=
os3-qemu-arm-demo</a>)</div><div><br></div><div>I remain at your disposal.<=
br></div></div><div><br></div><div>Best regards</div></div>

--000000000000ea0cda05e76537e1--

--000000000000ea0cdb05e76537e3
Content-Type: application/octet-stream; name="qemu_lan911x_tsfl_int.patch"
Content-Disposition: attachment; filename="qemu_lan911x_tsfl_int.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l7f2um9k0>
X-Attachment-Id: f_l7f2um9k0

RnJvbSBiYmUyMTEyZDZjMzExMTQyMzI5Zjk2ODU3NmZiYWFhOTEwODQ1MjVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMdWNhcyBEaWV0cmljaCA8bGQuYWRlY3lAZ21haWwuY29tPgpE
YXRlOiBNb24sIDI5IEF1ZyAyMDIyIDIyOjAwOjQ2ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gU2ln
bmFsIFRTRkxfSU5UIGZsYWcgZm9yIGxhbjkxMTggZGV2aWNlIGludGVycnVwdC4KClRoaXMgZmxh
ZyBpcyByZXF1aXJlZCBmb3IgTWljcml1bSBsYW45MTF4IGV0aGVybmV0IGRyaXZlciB0byB3b3Jr
LgoKU2lnbmVkLW9mZi1ieTogTHVjYXMgRGlldHJpY2ggPGxkLmFkZWN5QGdtYWlsLmNvbT4KLS0t
CiBody9uZXQvbGFuOTExOC5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2h3L25ldC9sYW45MTE4LmMgYi9ody9uZXQvbGFuOTExOC5j
CmluZGV4IDZhZmY0MjRjYmUuLmE4MzY0Y2M5YmYgMTAwNjQ0Ci0tLSBhL2h3L25ldC9sYW45MTE4
LmMKKysrIGIvaHcvbmV0L2xhbjkxMTguYwpAQCAtNjk2LDYgKzY5NiwxNCBAQCBzdGF0aWMgdm9p
ZCBkb190eF9wYWNrZXQobGFuOTExOF9zdGF0ZSAqcykKICAgICBuID0gKHMtPnR4X3N0YXR1c19m
aWZvX2hlYWQgKyBzLT50eF9zdGF0dXNfZmlmb191c2VkKSAmIDUxMTsKICAgICBzLT50eF9zdGF0
dXNfZmlmb1tuXSA9IHN0YXR1czsKICAgICBzLT50eF9zdGF0dXNfZmlmb191c2VkKys7CisKKyAg
ICAvKiBUWCBTdGF0dXMgTGV2ZWwuIFRoZSB2YWx1ZSBpbiB0aGlzIGZpZWxkIHNldHMgdGhlIGxl
dmVsLCBpbiBudW1iZXIgb2YKKyAgICAgKiBEV09SRHMsIGF0IHdoaWNoIHRoZSBUWCBTdGF0dXMg
RklGTyBMZXZlbCBpbnRlcnJ1cHQgKFRTRkwpIHdpbGwgYmUKKyAgICAgKiBnZW5lcmF0ZWQuIFdo
ZW4gdGhlIFRYIFN0YXR1cyBGSUZPIHVzZWQgc3BhY2UgaXMgZ3JlYXRlciB0aGFuIHRoaXMgdmFs
dWUKKyAgICAgKiBhbiBUWCBTdGF0dXMgRklGTyBMZXZlbCBpbnRlcnJ1cHQgKFRTRkwpIHdpbGwg
YmUgZ2VuZXJhdGVkLiAqLworICAgIGlmIChzLT50eF9zdGF0dXNfZmlmb191c2VkID4gKChzLT5m
aWZvX2ludCA+PiAxNikgJiAweGZmKSkgeworICAgICAgICBzLT5pbnRfc3RzIHw9IFRTRkxfSU5U
OworICAgIH0KICAgICBpZiAocy0+dHhfc3RhdHVzX2ZpZm9fdXNlZCA9PSA1MTIpIHsKICAgICAg
ICAgcy0+aW50X3N0cyB8PSBUU0ZGX0lOVDsKICAgICAgICAgLyogVE9ETzogU3RvcCB0cmFuc21p
c3Npb24uICAqLwotLSAKMi4zNy4xCgo=
--000000000000ea0cdb05e76537e3--
