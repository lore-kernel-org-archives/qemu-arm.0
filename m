Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1187641lfm;
        Wed, 15 Jul 2020 23:08:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB0V0D16pbvpVBZaEG/sZ/WQUcY7YEpwTbNxswm/oHwwfDJaBTpFV3C8V79YsWMZeLdRbu
X-Received: by 2002:a25:e695:: with SMTP id d143mr3840958ybh.51.1594879683254;
        Wed, 15 Jul 2020 23:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594879683; cv=none;
        d=google.com; s=arc-20160816;
        b=cBJ5Hlx+DVhSf8bO5/fdECWpNXYyT2WZgKL5fTYyBQvuKpEzfjGLfBfjI3ITco80WS
         tSIITmtTEXEgPNCFZSITMiiPMB2oxEGIBlpZpKv7Q27k4T1KgsubRiujDaHRVimr8+pR
         zBrSxU6Ncq0yqte4TGpmUE+ze8lXJFHhDpQ2j102Xnwfqg7CHtZKVLvWcemDKyvRCgbH
         BMkayr5Z+RCEc8Qwy19p4xCv7pwPkQmol7UK164hq8zvHlBeNtj7DY3LpKHbdjU3y3sq
         pCXvfSZt/qI4OlXcPhMBYcuWyI8SmG3pVWFFFqNXtDvjkXs6KBCI80+nDoETYiU/KqYI
         I/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=knwO7RwYQKuJ2UM5mbdYylCoJAMAOp3ETRj6uEeCO34=;
        b=brFM53qTAE/1sfDOhBD/rGYMNrntjbwrArRDGL+QDSLHjZcD/iHzA2KiD42N8saPHU
         vQ2NxGZvso0m17RSyai0hdvhie+QKHMdMLeAoqo6lIcDJkqf18SCCn77O4NB3SkFbqar
         85vRD6C7juX4Bc4PoG388xWlMqGkM2BX7nxh9Qw6VYl1Ik2Rw7auLizNt4T8WBWiBS4o
         vYtezNATXPHfJewaNvlI1Lc3aljJE+9oL4luKEcA8WNXae8KTegugZQyVybCcV0XC+K0
         oGxGy86jycqTo/vwUhhbBGKtW1ykR3Iy994z09T4uSyL5qyEvquZPscIoAPlRa2z6a6o
         4jPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hOsNbcI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r63si5288486ybc.347.2020.07.15.23.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 23:08:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hOsNbcI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvx3q-0000yc-Kv
	for alex.bennee@linaro.org; Thu, 16 Jul 2020 02:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jvx3i-0000xd-AJ
 for qemu-arm@nongnu.org; Thu, 16 Jul 2020 02:07:54 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22793
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jvx3f-0002EE-8Y
 for qemu-arm@nongnu.org; Thu, 16 Jul 2020 02:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594879670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=knwO7RwYQKuJ2UM5mbdYylCoJAMAOp3ETRj6uEeCO34=;
 b=hOsNbcI96+qYUV0m3NY3xHQ5B1ZkXzy5HjsxgzlTfz3Rs6yi/hHgf9GdZC36CfWzUWU4xO
 lY6JGehj7gwrQYtVN5INES6I6JkvkjJ/Yt8fDP596reyAajIV/BE2aycy/Laccz91s5Mkn
 lLUkz9qZGCprJK8CB6hD4IrBlW5VGPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-zi0zKrDfN5Oe6As6I1KFxw-1; Thu, 16 Jul 2020 02:07:44 -0400
X-MC-Unique: zi0zKrDfN5Oe6As6I1KFxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAA1D1081;
 Thu, 16 Jul 2020 06:07:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-234.ams2.redhat.com [10.36.112.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64AEF5C1C3;
 Thu, 16 Jul 2020 06:07:39 +0000 (UTC)
Subject: Re: [PATCH for-5.1 1/2] msf2: Unbreak device-list-properties for
 "msf-soc"
To: sundeep subbaraya <sundeep.lkml@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20200715140440.3540942-1-armbru@redhat.com>
 <20200715140440.3540942-2-armbru@redhat.com>
 <ef1d7fe4-0558-cc7b-16d7-906c4aa9915b@amsat.org>
 <87wo34u9fv.fsf@dusky.pond.sub.org>
 <CALHRZurw_HsyFmNWYuG_Cagx8cTTBCGzafWmx6JHJ+NS7aVKOw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <9b3f870c-481f-79f1-e55e-074ee0d95633@redhat.com>
Date: Thu, 16 Jul 2020 08:07:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CALHRZurw_HsyFmNWYuG_Cagx8cTTBCGzafWmx6JHJ+NS7aVKOw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 01:37:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, nieklinnenbank@gmail.com,
 qemu-arm <qemu-arm@nongnu.org>, palmer@dabbelt.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pqSt0VhG5sJk

On 16/07/2020 04.59, sundeep subbaraya wrote:
> On Wed, Jul 15, 2020 at 8:12 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>
>>> On 7/15/20 4:04 PM, Markus Armbruster wrote:
>>>> Watch this:
>>>>
>>>>     $ qemu-system-aarch64 -M ast2600-evb -S -display none -qmp stdio
>>>>     {"QMP": {"version": {"qemu": {"micro": 50, "minor": 0, "major": 5}, "package": "v5.0.0-2464-g3a9163af4e"}, "capabilities": ["oob"]}}
>>>>     {"execute": "qmp_capabilities"}
>>>>     {"return": {}}
>>>>     {"execute": "device-list-properties", "arguments": {"typename": "msf2-soc"}}
>>>>     Unsupported NIC model: ftgmac100
>>>>     armbru@dusky:~/work/images$ echo $?
>>>>     1
>>>>
>>>> This is what breaks "make check SPEED=slow".
>>>>
>>>> Root cause is m2sxxx_soc_initfn()'s messing with nd_table[] via
>>>> qemu_check_nic_model().  That's wrong.
>>>>
>>>> We fixed the exact same bug for device "allwinner-a10" in commit
>>>> 8aabc5437b "hw/arm/allwinner-a10: Do not use nd_table in instance_init
>>>> function".  Fix this instance the same way: move the offending code to
>>>> m2sxxx_soc_realize(), where it's less wrong, and add a FIXME comment.
>>>
>>> That addresses this other thread, right?
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720658.html
>>
>> Correct!  I wasn't aware of it, thanks for making the connection.
>>
> 
> Thanks Markus for the fix.

It's rather just a work-around that avoids the crash than a real fix. I
think we can use it for the upcoming 5.1 release, but it would be great
if you could rework this code for 5.2, so that the nd_table handling is
moved to msf2-som.c instead.

 Thanks,
  Thomas

