Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp3369190lfp;
        Thu, 21 Jul 2022 07:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sxFwp9QKcFd/A24dd44c01XTmzClM7RQyPDAx6ShMya2qCNDflu8AF6moduJZ2MUVJ24yO
X-Received: by 2002:ad4:5c64:0:b0:472:f016:bfde with SMTP id i4-20020ad45c64000000b00472f016bfdemr34885847qvh.52.1658415195104;
        Thu, 21 Jul 2022 07:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658415195; cv=none;
        d=google.com; s=arc-20160816;
        b=d/JBm6AP4s309MT8DTAO8dQ6FuTgrrI9HxuS4VOL4MJ7KWJfn9kQxt7eQjmteEXLXF
         h/uajbnQzfsZp5frk2D/y2PNQPtbXfiFoMjPgp4c3yj8qmiV87nuLNRMtvgNI7S/JR8b
         U3c1XVM7ZOYCL4gCFC3EVbdqPI2Dq0d6c+DwxXUBAuoEdsoCCr7ByS3+XAWQHexAw3OU
         TxnfdwJ7Ov2ykLZk5ErRefoSvV8UO8cocQTn4rdQJvMhWPNvJvSsnF6pgVYOYzGWa3M2
         BhrdI/nsmuz2AQsLPO2dF6xoHZKqfOVmmHhbqqjOPzYLnEUHHpgsWZchg13OGYb8ayO6
         8LoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=d99UFWPtetONp9XYceiMv4No6MjiG3yJabU3e66KD2k=;
        b=JR0liIoMrISReX6ESN9kFOz7r7z2oX+wkiKRn+r9Awy0LOqXL9mWCqQWtMiWyPC9LB
         f6AO193/dQRO7g/YWc37H6rbW7oNnNcfBa1nQRJxzls8LmdufrtkvclA9aOmbPaQhnIV
         to8I+EHimg9QTeWSQlPQCapaCtt7Ea3gOkZHPBMXbAjSZZ4+hYmx1n7mM8WNA1ohIn/x
         mh2GJKFQbpoAPrerlOddVOGwgOoGdIlgYaN1YUpvknGOI3nVNzMazbthA1DzyREXGzQj
         k8L/uSJooRfrEKbmlhiI2zsUB3FyH6cmQC8t7DXCyMmhEfcE7s9aBYj7Co5lkv6aKzhO
         5+zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cqtcOx4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6-20020a05620a0f0600b006af148dc31esi1579912qkl.222.2022.07.21.07.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jul 2022 07:53:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cqtcOx4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEXYA-00068X-J7
	for alex.bennee@linaro.org; Thu, 21 Jul 2022 10:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEXXx-00063C-6O
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 10:53:01 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:44931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEXXv-0004kp-Aw
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 10:53:00 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id b143so1942332yba.11
 for <qemu-arm@nongnu.org>; Thu, 21 Jul 2022 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d99UFWPtetONp9XYceiMv4No6MjiG3yJabU3e66KD2k=;
 b=cqtcOx4lQ1HlJSn5rUdhWMnWiME7x+BqxwAjHGKOZLQlbLG+QZgarel+pf/ZEpINlJ
 SM/S9J3jGKiWAWmzIhqhu0R2Ec59JpHu3feIItmdOV2RDj12KIQjBjIWtboGhWBoUxw+
 Gz5vLDMFWiHdS0JdCZHgxntNwPk+APo5tqeoS9uFX8sq86lV8abpA9YRz8LEAyqgPCM/
 gsV5fjQnuJEmWzt2R55yGjicCo7x0QVoNT7Km6aTpbpkbiBP48EPs7AyQNF/AL4zpai7
 BeRfsIjFohloDMh3KKuGe4emRZYk/6D84YW3h6zsnAiYMvXxMwmsPFE89FAyWaA1RMzr
 fMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d99UFWPtetONp9XYceiMv4No6MjiG3yJabU3e66KD2k=;
 b=beJE2K+pMaAX1Mns5KJVQNt1oblUxoejndvhjQ7PAznHGDKu0ZfWRI4C6+sFcvgOIL
 lZQ9p+4h1JV6ayqONvckPsPjHZYO76GMfc6Pr/cUz/sT9f6EkmU8l79KO10pY3IxHiU1
 5tMSSeCbFR4vArAirKPki2zMJzk2nOO4R9qzwv12K/tZR868tR8t4F8HNfMpUQR6ieo0
 C3Aej0+WSg3Ig9rXCu9n230hRIQXLeMfpHkkySZgYgYUTxkXHd2Qxx8AiKSnt0X8SpFp
 t/lkMtombIa08uXHwAokSXzcB1qYT57aw9nK0IAeNxj082YiCs8RcRohfe8WUg6YVy1S
 p5Zg==
X-Gm-Message-State: AJIora9Xv35qJH+n7/hQ/INrjqoqrWEiKNdJ1Bg7faeeFsRFp8si81i5
 cI68mNW/tVowH6/h9rHuUnB467bJvEtCwr+61grO/g==
X-Received: by 2002:a25:d307:0:b0:670:80fd:85c4 with SMTP id
 e7-20020a25d307000000b0067080fd85c4mr11917003ybf.67.1658415178185; Thu, 21
 Jul 2022 07:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
 <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
 <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
 <CAL7npF_8ErAn2cvFBQxVCdP96uKpdRQMs_3aL_UW5OLzm3Q=GQ@mail.gmail.com>
 <CAFEAcA-cTzrA6fZXw7onDJ77NMwjBrSFVwADYmttCgdOf9ODYw@mail.gmail.com>
 <CAL7npF9H_eKi0jA_m-wV=jSHy9hc6re7TpTe2ni=9NYK4CxRpA@mail.gmail.com>
 <CAFEAcA8xV-BdhvwvkzRHxqqEX9BAwDJGwHS=koBRbDeGHwQHEw@mail.gmail.com>
 <CAL7npF9bOP=bPtyFS-K+HgXGy9+W11M0ELRJMqQp1-JB_jVx1g@mail.gmail.com>
 <CAFEAcA8hbU7PJK-YvOkbjj2F2PBW1M9J10DkHqUPXTSxYOS-5Q@mail.gmail.com>
 <CAL7npF9neZUWweuZFqDkO5mh5=tZj3ybjZUvVoF932cJibpRiw@mail.gmail.com>
 <CAFEAcA9CnC5P4Myf1qMO=DLas93+kSVjNvnj6Vgty_yvdjH5vQ@mail.gmail.com>
 <CAL7npF8KNQKyfeW5ONY53+_u6Q4H8BDtY386Eyt-+gxaXdBBJA@mail.gmail.com>
 <CAFEAcA8hVyCwMbQ_ZNUgw8Nfb3wTvRk3gvUr8RC3gSH7Pkuv_g@mail.gmail.com>
 <CAL7npF897P3=Rro4pe_i_cmO+rUe-b1NqnJtmEM3K0kEF5VC7Q@mail.gmail.com>
 <CAFEAcA9y6zwErffpvrJrenS0hyLvGyoyhdF8Vo3mgFhLOvvOSw@mail.gmail.com>
In-Reply-To: <CAFEAcA9y6zwErffpvrJrenS0hyLvGyoyhdF8Vo3mgFhLOvvOSw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jul 2022 15:52:18 +0100
Message-ID: <CAFEAcA-9F6QDzEiAfiMa=DUVK3LGe9vLmD_OcMTfbU8ayv3Ffw@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/mixed; boundary="00000000000096491705e451df9a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SpE7upBcp7JR

--00000000000096491705e451df9a
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Jul 2022 at 14:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 21 Jul 2022 at 14:10, Jon Alduan <jon.alduan@gmail.com> wrote:
> > Yes, exactly. When removing timer 0, time 1 will be removed instead.
> > Other timers are not affected. If you create a dummy timer 0, there
> > are no more problems (that I can address).
>
> Yeah, but it's complicated, because there are multiple "timer IDs" here:

I've attached a patch which adds some debug printing to QEMU's
timer_create/timer_delete code. Could you please apply this patch,
rebuild QEMU, run that with the test program, and send me the
output ?

thanks
-- PMM

--00000000000096491705e451df9a
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-linux-user-Print-debug-info-for-timer_create-and-tim.patch"
Content-Disposition: attachment; 
	filename="0001-linux-user-Print-debug-info-for-timer_create-and-tim.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l5v5jkll0>
X-Attachment-Id: f_l5v5jkll0

RnJvbSA2OTRmNjdhN2FkZGViMTQ3YWVkMTU2YzllMzY2ZjZiYjE1ZjhiMDJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5v
cmc+CkRhdGU6IFRodSwgMjEgSnVsIDIwMjIgMTU6MzY6MjkgKzAxMDAKU3ViamVjdDogW1BBVENI
XSBsaW51eC11c2VyOiBQcmludCBkZWJ1ZyBpbmZvIGZvciB0aW1lcl9jcmVhdGUgYW5kCiB0aW1l
cl9kZWxldGUKClRlbXBvcmFyeSBkZWJ1ZyBwcmludGluZyB0byBzaG93IGhvc3QgYW5kIGd1ZXN0
IHRpbWVyIElECmhhbmRsaW5nIGluIHRpbWVyX2NyZWF0ZSBhbmQgdGltZXJfZGVsZXRlIHN5c2Nh
bGxzLgoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8u
b3JnPgotLS0KIGxpbnV4LXVzZXIvc3lzY2FsbC5jIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIvc3lzY2Fs
bC5jIGIvbGludXgtdXNlci9zeXNjYWxsLmMKaW5kZXggOTkxYjg1ZTZiNGQuLmNjNGI2MjcwNDI5
IDEwMDY0NAotLS0gYS9saW51eC11c2VyL3N5c2NhbGwuYworKysgYi9saW51eC11c2VyL3N5c2Nh
bGwuYwpAQCAtNTA2LDkgKzUwNiwxMSBAQCBzdGF0aWMgaW5saW5lIGludCBuZXh0X2ZyZWVfaG9z
dF90aW1lcih2b2lkKQogICAgIGZvciAoayA9IDA7IGsgPCBBUlJBWV9TSVpFKGdfcG9zaXhfdGlt
ZXJzKTsgaysrKSB7CiAgICAgICAgIGlmIChnX3Bvc2l4X3RpbWVyc1trXSA9PSAwKSB7CiAgICAg
ICAgICAgICBnX3Bvc2l4X3RpbWVyc1trXSA9ICh0aW1lcl90KSAxOworICAgICAgICAgICAgcHJp
bnRmKCJuZXh0X2ZyZWVfaG9zdF90aW1lcjogcmV0dXJuaW5nICVkXG4iLCBrKTsKICAgICAgICAg
ICAgIHJldHVybiBrOwogICAgICAgICB9CiAgICAgfQorICAgIHByaW50ZigibmV4dF9mcmVlX2hv
c3RfdGltZXI6IGFsbCB0aW1lcnMgYWxsb2NhdGVkLCByZXR1cm5pbmcgLTFcbiIpOwogICAgIHJl
dHVybiAtMTsKIH0KICNlbmRpZgpAQCAtODMxMiw2ICs4MzE0LDggQEAgc3RhdGljIHRhcmdldF90
aW1lcl90IGdldF90aW1lcl9pZChhYmlfbG9uZyBhcmcpCiAgICAgICAgIHJldHVybiAtVEFSR0VU
X0VJTlZBTDsKICAgICB9CiAKKyAgICBwcmludGYoImdldF90aW1lcl9pZDogZ3Vlc3QgdGltZXIg
aWQgMHgleCAtPiBpbmRleCAlZFxuIiwKKyAgICAgICAgICAgKHRhcmdldF90aW1lcl90KWFyZywg
dGltZXJpZCk7CiAgICAgcmV0dXJuIHRpbWVyaWQ7CiB9CiAKQEAgLTEyODM3LDEyICsxMjg0MSwx
OCBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBp
bnQgbnVtLCBhYmlfbG9uZyBhcmcxLAogICAgICAgICAgICAgfQogCiAgICAgICAgICAgICByZXQg
PSBnZXRfZXJybm8odGltZXJfY3JlYXRlKGNsa2lkLCBwaG9zdF9zZXZwLCBwaHRpbWVyKSk7Cisg
ICAgICAgICAgICBwcmludGYoInRpbWVyX2NyZWF0ZTogaG9zdCB0aW1lcl9jcmVhdGU6IHJldHVy
bmVkIDB4IgorICAgICAgICAgICAgICAgICAgIFRBUkdFVF9BQklfRk1UX2x4ICIsIHNldCBwaHRp
bWVyICVwIHRvICVwXG4iLAorICAgICAgICAgICAgICAgICAgIHJldCwgcGh0aW1lciwgKnBodGlt
ZXIpOwogICAgICAgICAgICAgaWYgKHJldCkgewogICAgICAgICAgICAgICAgIHBodGltZXIgPSBO
VUxMOwogICAgICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgICAgICBpZiAocHV0X3VzZXIo
VElNRVJfTUFHSUMgfCB0aW1lcl9pbmRleCwgYXJnMywgdGFyZ2V0X3RpbWVyX3QpKSB7CiAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtVEFSR0VUX0VGQVVMVDsKICAgICAgICAgICAgICAgICB9
CisgICAgICAgICAgICAgICAgcHJpbnRmKCJ0aW1lcl9jcmVhdGU6IHdyb3RlIDB4JXggdG8gZ3Vl
c3QgYWRkcmVzcyAweCIKKyAgICAgICAgICAgICAgICAgICAgICAgVEFSR0VUX0FCSV9GTVRfbHgg
IlxuIiwKKyAgICAgICAgICAgICAgICAgICAgICAgKFRJTUVSX01BR0lDIHwgdGltZXJfaW5kZXgp
LCBhcmczKTsKICAgICAgICAgICAgIH0KICAgICAgICAgfQogICAgICAgICByZXR1cm4gcmV0OwpA
QCAtMTI5NzUsNiArMTI5ODUsOCBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJj
aFN0YXRlICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcxLAogICAgICAgICAgICAgcmV0
ID0gdGltZXJpZDsKICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgIHRpbWVyX3QgaHRpbWVy
ID0gZ19wb3NpeF90aW1lcnNbdGltZXJpZF07CisgICAgICAgICAgICBwcmludGYoInRpbWVyX2Rl
bGV0ZTogZ3Vlc3QgYXJnIDB4IiBUQVJHRVRfQUJJX0ZNVF9seAorICAgICAgICAgICAgICAgICAg
ICIgaG9zdCB0aW1lcl90ICVwOiBkZWxldGluZ1xuIiwgYXJnMSwgaHRpbWVyKTsKICAgICAgICAg
ICAgIHJldCA9IGdldF9lcnJubyh0aW1lcl9kZWxldGUoaHRpbWVyKSk7CiAgICAgICAgICAgICBn
X3Bvc2l4X3RpbWVyc1t0aW1lcmlkXSA9IDA7CiAgICAgICAgIH0KLS0gCjIuMjUuMQoK
--00000000000096491705e451df9a--
