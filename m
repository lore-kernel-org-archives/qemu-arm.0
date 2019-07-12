Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp995666wrv;
        Fri, 12 Jul 2019 07:58:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIoaTVhtni4NEgotA5o+E3TxnMLlKwRk9vnj76mEGrIkOZPkz+oe0KgtkVxFjxsnOlMjiR
X-Received: by 2002:aa7:cf0c:: with SMTP id a12mr9769664edy.146.1562943496601;
        Fri, 12 Jul 2019 07:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562943496; cv=none;
        d=google.com; s=arc-20160816;
        b=w/6M8hOe+qrh53mSLGjvdMv6UmsWQPjtdC4SICIXcg09pn3IIZaC/fVUKFIScHLyTw
         0Ld7YHtJkt4nQLzQVb2RBoPnDg3RhryCSTRlbXGsOzux5HaMy+SoP7ftOeCB551xwVpe
         dvtLrp9+hEnapPu2QuViCAXEbpfxsPZyd+53C0cFa9mQ7VlS0YdBHBHnC2Dpcd3wOHN2
         awwG80bhQNl+FvixrWWgo78KpcRiZXtLqA9cyIWQvzNki8H8zvoFXfgFYJBfoVdBr12R
         45aqWTPdnrqB//UvXqpxVEaeQNs6GeOFNgednvn5wu638f68Kzd24uULlhzSusmEaOTI
         Q4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=emIsT2uWy5ufwkOAnv2pkH1UDJF6aP1EQX0xPPePb0s=;
        b=w9PcOLWMwo/9un5mHMYUzlu5PBXkOE7lUp0LHJD1Fd4xozP1D/+eMlMMuIAAFFl38c
         tv4N4g1lx6VD2+EN5ZX7ydLLb3fWVfnBqbW/pi7fo1eXtXqO1xEu8TTdT9qijujG8xvi
         JzUYcxqNxvpnYoBu8JBmrH7E8feS1xMIgkjM1AsVeF7A+Qcgfzh87JL87Mr/WLySX1QX
         Ck3BWyjIyQswKyiFxa9H+xmgWg8f8PqotP+Ckc31LQireLzLB4glFXchRkpU/fRAJLQb
         tQ5mIoG+f9JUOC3eXVzIjKoILFqQRyK5JTLChVzgSQS047HXF7DYSVpU+LIJMqlrffKU
         yrwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w50si5579163edd.84.2019.07.12.07.58.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 07:58:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlx03-0000zE-Fe
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 10:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52450)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hlx00-0000yK-7P
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 10:58:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hlwzz-0005Vp-7j
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 10:58:12 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:40612)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hlwzz-0005SY-0u
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 10:58:11 -0400
Received: by mail-wr1-f49.google.com with SMTP id r1so10278561wrl.7
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2019 07:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=emIsT2uWy5ufwkOAnv2pkH1UDJF6aP1EQX0xPPePb0s=;
 b=hWgY+7Q94AZtJTdvHU19WOGLGgcZSIm3/1/LsJxmEkyuSf5BvVWxYZQTasHjmIAY4r
 tYaYF1Qaq2kX3Gd2C+Ul/T74wZ09R3tZ5Zv5EkFW9z26qL/kY0/0qVZ6HUGsTaoQjwA6
 SyMmEB8WCkaH+B+E4kfCQ6xwiHJCi8QJCe+Q0WJq4ebyYAQKOHMVn30HhwayNAyI3URk
 iTEvPEANfBMPZot9jw5hxaBmY7nQOvhINJB+pRcDhVb3d0cRWYx/mXd1fybw0LrnVvDZ
 LHt4A+Y2ehpP4V3tcG0UOSj+nmj1fHOP9nWDKitu4cPWgA1iWEX7nHo8Z/eK0+rpKUNU
 DobA==
X-Gm-Message-State: APjAAAU6uz8jp1PL8Gfltg+B3Kx5wWQtYwPJNwCKcXswpYivgnpt5msG
 YDYIViVS8B+Q5JMsTHRGvuHBkw==
X-Received: by 2002:adf:dbcb:: with SMTP id e11mr11810506wrj.272.1562943489841; 
 Fri, 12 Jul 2019 07:58:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d066:6881:ec69:75ab?
 ([2001:b07:6468:f312:d066:6881:ec69:75ab])
 by smtp.gmail.com with ESMTPSA id s12sm7973260wmh.34.2019.07.12.07.58.09
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 07:58:09 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190712133928.21394-1-philmd@redhat.com>
 <20190712133928.21394-3-philmd@redhat.com>
 <64a41af4-e635-06e3-05a2-d2cddaf02af0@redhat.com>
 <de30351b-6747-b976-16c5-c587b51f2b7a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <e2a6cb5d-b840-117f-728c-b5b1bf4c18d6@redhat.com>
Date: Fri, 12 Jul 2019 16:58:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <de30351b-6747-b976-16c5-c587b51f2b7a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.49
Subject: Re: [Qemu-arm] [PATCH-for-4.1 2/7] hw/usb: Bluetooth HCI USB
 depends on USB & BLUETOOTH
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oYAkVTATo1un

On 12/07/19 16:16, Philippe Mathieu-Daudé wrote:
> I wondered but am not sure, it is default to Yes, but Bluetooth code is
> deprecated and print a big warning when you use it, so I think this
> device should not be selected as default, neither pull in the deprecated
> bluetooth code.
> 
> So personally I'd respin without 'default y'. If you have a good reason
> to use it, I can use 'select' instead.

There are two separate questions.  One is whether USB_BLUETOOTH should
select BLUETOOTH and the answer there is almost certainly yes (in the
words of kconfig.rst, BLUETOOTH is a "subsystem" while USB_BLUETOOTH is
a "device"; devices select the bus that the device provides).

The other is whether we want to enable USB_BLUETOOTH by default.  I
wouldn't have any problem there, but if we disable it basically no one
would ship/use it and we might as well delete the whole thing.

Paolo
