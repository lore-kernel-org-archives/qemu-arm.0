Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6518207wrv;
        Wed, 7 Aug 2019 05:55:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxo/gQryTVhsuGjUNM7tbaxHYPItDiXMvC56SjU1oGwTcuvzn+w9C9kVnychyTnIF9qvVlK
X-Received: by 2002:a37:a7d6:: with SMTP id q205mr8033800qke.44.1565182536220;
        Wed, 07 Aug 2019 05:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565182536; cv=none;
        d=google.com; s=arc-20160816;
        b=qgyI6R5RSsHAizxA/Jzf59EwpkfS0mbZwknUm9r9ar0jzr0NvHVBZkezesLGA3CT/h
         csZ202+Q86JJqqw9GV91CvoKZ4NFHAZpjgkTSt3fASOJJ28irNg+kv/BkXsTKtYPgpLh
         yhzV0a/+5z9Vwo3kjPqHsZ0UDmPtyeWkiV0OyxWyiXy/u8Bk7dafbLylhmYf4mXrIsmG
         L8i+HdtW1pfiFSSvo/McK1zlI9HxFBewmj1EWBO4omsE0BxK8IGodlt6xh18IhlCi1j6
         KkT8JCQaNKfCf8aZroIVK6BogPVwZxxJwzvKDPOPnk26rv5gzb1wfflCmvzNBDc8tlTf
         I2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=qxz+qOxxiF4zyH6SFPksO+z9p6DoRe1NfIyM1b8xgLo=;
        b=H3MwlDmA87IcwI+QVubrAF7ZYPtkVF1BqIuN+azStqyB9oy0LuvX1iCWy+RjZi8WnN
         kBX/V0jHkqpTl5X7BjjeZdLS7Dx9VYOK/Q7e5mlRuk4WL7m/6rAHAkbo1KLtThouD6yl
         Tsb/B3rbFB77NpkjXhF6Sqgw673FC0VOoyANgSzOOKWGcsywh7raxapGSJPiGSENki9/
         nSM8BtoA3UYS2kgWoKXq5OytLa44TULQv9A0CB0xIEOqn6VU//hhFQ7CnFKCCIc4cq6B
         ZRSj3+qhE3GzEYl4pylgiqarJpkegCT4afi7v0HDNQVvnkFV23V9rDEqxfnhhg9l01Gz
         2K+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si50087070qkc.123.2019.08.07.05.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 05:55:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvLTb-0000Gc-Qo
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 08:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50987)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hvLSq-0007gZ-Jn
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 08:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hvLSp-0001ln-9m
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 08:54:48 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54516)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hvLSp-0001kh-1N
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 08:54:47 -0400
Received: by mail-wm1-f65.google.com with SMTP id p74so81693635wme.4
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 05:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qxz+qOxxiF4zyH6SFPksO+z9p6DoRe1NfIyM1b8xgLo=;
 b=bvroWK2YGD7y+h5GMsZ7I9bs9LW7bGH5IUPVM2m40FkyqyEzm2ZBi72x4BhUfHy6JR
 oiBfRCHl8LccTRtiCn6TBxp31ZC0iNfSKc5f4+SrTsSLrlWo7qs9ZQ1glfmCIgw8Yyvb
 yYB7idAhkEdST87l8hgS1zRkrdovxzR8kkRTBF4xOtVQS+UFP5eXT0LmFZ/E0ILvXo6H
 vmvSDP2OAy/Zmkdd4ksVMn1upb8/b5uBGQikaQI7EitjcckADhNPhjqEvqgaWW2rELAB
 ev4jJy1lTkcL4SH/6P+pdZqOm/pE99+dN6pwDnLLoI3CR5i8uJouAd/01H6EhqHsYfsa
 DQ+Q==
X-Gm-Message-State: APjAAAV6JAknSINZXNvDC+/fKN02rQhebR17+0Yh3GzandtveknkoZc/
 0vuPQj2mRQlqPwFG4O+en6az9A==
X-Received: by 2002:a1c:6641:: with SMTP id a62mr10411525wmc.175.1565182485721; 
 Wed, 07 Aug 2019 05:54:45 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id q18sm113799140wrw.36.2019.08.07.05.54.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 05:54:45 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <2397186a-a28e-85dd-131c-900e777a60ad@redhat.com>
 <1565181666201.26324@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0523c403-bdae-bb5d-8996-20b57cd5d7cf@redhat.com>
Date: Wed, 7 Aug 2019 14:54:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565181666201.26324@bt.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH v6 00/26] Invert Endian bit in SPARCv9 MMU
 TTE
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, sagark@eecs.berkeley.edu, mst@redhat.com,
 green@moxielogic.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 keith.busch@intel.com, jcmvbkbc@gmail.com, frederic.konrad@adacore.com,
 pbonzini@redhat.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 mreitz@redhat.com, pburton@wavecomp.com, marex@denx.de, robh@kernel.org,
 hare@suse.com, gxt@mprc.pku.edu.cn, berto@igalia.com, proljc@gmail.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 david@redhat.com, magnus.damm@gmail.com, yuval.shaia@oracle.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, hpoussin@reactos.org,
 joel@jms.id.au, anthony.perard@citrix.com, marcandre.lureau@redhat.com,
 david@gibson.dropbear.id.au, jasowang@redhat.com, atar4qemu@gmail.com,
 antonynpavlov@gmail.com, jiri@resnulli.us, ehabkost@redhat.com,
 minyard@acm.org, jcd@tribudubois.net, sw@weilnetz.de, alistair@alistair23.me,
 chouteau@adacore.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, sstabellini@kernel.org, jan.kiszka@web.de,
 clg@kaod.org, stefanha@redhat.com, imammedo@redhat.com,
 xen-devel@lists.xenproject.org, shorne@gmail.com, andrew.smirnov@gmail.com,
 jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, xiaoguangrong.eric@gmail.com, qemu-riscv@nongnu.org,
 andrew@aj.id.au, lersek@redhat.com, crwulff@gmail.com, laurent@vivier.eu,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, i.mitsyanko@gmail.com,
 michael@walle.cc, paul.durrant@citrix.com, qemu-ppc@nongnu.org,
 huth@tuxfamily.org, amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de,
 cohuck@redhat.com, peter.chubb@nicta.com.au, aurelien@aurel32.net,
 stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rtpb+B61KwP7

On 8/7/19 2:41 PM, tony.nguyen@bt.com wrote:
> On 8/7/19 8:37 PM, Philippe Mathieu-Daudé wrote:
> 
>> I'm confused I think I already reviewed various patches of your previous
> ​> series but don't see my Reviewed-by tags.​>
> Apologies Philippe! I am the confused one here =/
> 
> Will append.
> 
> Thank you very much for the reviews and qemu-devel newbie tips so far. I
> have felt very welcome.

Well for a newbie you did an impressive series!

The 'Reviewed-by' or 'Tested-by' tags help the maintainers to process
patches.

Since reviewing a series is time-consuming, if you iterate over a series
without changing some patchs, you should collect and amend the tags the
reviewers gave you, this way it helps them keep track of patches
reviewed and patches waiting for review.

In my case I find it very confuse when I look at a patch I already gave
my R-b tag and the tag is not here, I re-review the patch looking for
differences.

Often a reviewer asks for easy changes, and uses "with this changes:
R-b". If you addresses his comments you can then add his tag in the next
version.

If you split a reviewed patch in various, it is also OK to keep the tags
in all the splitted patches.

Regards,

Phil.
