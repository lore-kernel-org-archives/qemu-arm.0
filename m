Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2215012lfm;
        Fri, 17 Jul 2020 01:04:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv7K2N+ndCJfNff1oToTuupjfHOKrGJHO5lLVcJgOgn1V++ttHukoczwr1GSznkg/n3PhU
X-Received: by 2002:a25:9782:: with SMTP id i2mr12866519ybo.277.1594973044433;
        Fri, 17 Jul 2020 01:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594973044; cv=none;
        d=google.com; s=arc-20160816;
        b=nt+2bQsgltYaLj0LC0ea1kbS/QXwrcA7sk8q/o7fMLiKgH/JgXM19Sp+rGH8LYisDl
         M0phw9ynR+kAS08OUDKT1bhwyDd6ZTzRubbaW9CLM9SNrqWsxuJhV6WF0w9AI2CoogDQ
         Dxyph08moEoQyOdKIFGnvMZPL0f8F4d4OLB97E8j34m+fx4zQ+CtJutrLTWbSDn/vKmG
         Vf1iojZpJ9xsRayPXu5tGs9qLweRSD+UGVwSSdcA7hsXSZ05lFpzgluNlFeYq4eCOEVy
         YhEUyxS4D/+A+Expb3ReXxV2Naw09NRAR6zbP9Nh+eiQygwDLZB0ix2AymfMa89TGMtv
         6KWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=9LILVtctDAHk9jVvgwRNm0TAzAIATXan+1Em9XHy4O4=;
        b=WNCnZHDGB465DfHmQHwIKh7kngYZ9MSjGLNDCeNcL00BdiF4u6h4DbeDHtGBf82XPy
         tuNxyar/YqUw/PB5MQsAJDcsM/upkaJZXz3sXgoa5XufS68xlHjd75j37vGbB6as0RYA
         d8O6Pqotqe1+Ir4TDS//eaQoXzOqjidSN6oxwQtqdw+pej8Kpw/1rKi62/StkU3AhGN3
         X2veNC6xUooLzNqSetbq8sEQeB2e1t0CNBRiZplGb4xVqo+M4pP9IW15V8DMWtVoRnYw
         O/x9KAwkoKKdCHGqYlRBiFVUyqWzNkjC3ZG9XDCAnxMsm3ce2hq6i3ls7cSnuC8VSMF7
         7QMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W17zf4Nh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si8295111ybe.443.2020.07.17.01.04.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 01:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W17zf4Nh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwLLf-0005C8-Pf
	for alex.bennee@linaro.org; Fri, 17 Jul 2020 04:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jwLLP-0005BT-PP
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 04:03:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29284
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jwLLN-0005I0-2P
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 04:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594973024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=9LILVtctDAHk9jVvgwRNm0TAzAIATXan+1Em9XHy4O4=;
 b=W17zf4Nhc8HNn6fd0mgt9GnhX/o/qtrZ4CmDsj6QleIgoSM1fZGqbyvExXaAkdeu3Y6t2u
 7goZGBISu21+aNRoCEyzMcbMR/RBCKQe596SScV2x4aX18avGUgqzN3+d5sSdtRvrPg8rg
 pPg0E3Mh16lle7jyopGvkbeLvGVql8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-cuEvj8ApMjuDFqPjfD8B7Q-1; Fri, 17 Jul 2020 04:03:42 -0400
X-MC-Unique: cuEvj8ApMjuDFqPjfD8B7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AD3980BCA8;
 Fri, 17 Jul 2020 08:03:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D83919724;
 Fri, 17 Jul 2020 08:03:36 +0000 (UTC)
Subject: Re: [PATCH v5 10/11] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
References: <20200709003608.3834629-1-hskinnemoen@google.com>
 <20200709003608.3834629-11-hskinnemoen@google.com>
 <109d52ed-65bf-0fcc-98f1-47b7a6671d0b@kaod.org>
 <CAFQmdRZcygskP3iwss01-Jz67yjAP_JENXjWM2Bp8U=DRzxR0Q@mail.gmail.com>
 <875zaq78xq.fsf@dusky.pond.sub.org>
 <19733456-a672-595d-e721-e0ef26d7f665@amsat.org>
 <87v9iq2hkv.fsf@dusky.pond.sub.org>
 <e87663cf-7cb2-ca6c-a751-e5c1cebc5440@amsat.org>
 <87pn8xywz2.fsf@dusky.pond.sub.org>
 <b3bc658f-a865-8e6b-c904-01c7724e89cc@amsat.org>
 <CAFQmdRa9FiP6yX=XDrJy5KpjifQyVkQiY6DXtSoJSvfoq7Vm6w@mail.gmail.com>
 <CAFQmdRac6tsZafN3PsnLhPA_Ny032ZAjOFuXkmYvJ-ubjcpPPw@mail.gmail.com>
 <5345d70f-3041-ed13-12e9-9a8e3d803805@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <416d5243-dc8e-37c6-197f-96dec1c9f5cc@redhat.com>
Date: Fri, 17 Jul 2020 10:03:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5345d70f-3041-ed13-12e9-9a8e3d803805@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 23:13:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cOln1lXnzPFV

On 17/07/2020 09.48, Philippe Mathieu-Daudé wrote:
> +Thomas

> On 7/16/20 10:56 PM, Havard Skinnemoen wrote:
>> On Wed, Jul 15, 2020 at 1:54 PM Havard Skinnemoen
>> <hskinnemoen@google.com> wrote:
>>>
>>> On Wed, Jul 15, 2020 at 3:57 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> On 7/15/20 11:00 AM, Markus Armbruster wrote:
>>>>> Now my point.  Why first make up user configuration, then use that to
>>>>> create a BlockBackend, when you could just go ahead and create the
>>>>> BlockBackend?
>>>>
>>>> CLI issue mostly.
>>>>
>>>> We can solve it similarly to the recent "sdcard: Do not allow invalid SD
>>>> card sizes" patch:
>>>>
>>>>  if (!dinfo) {
>>>>      error_setg(errp, "Missing SPI flash drive");
>>>>      error_append_hint(errp, "You can use a dummy drive using:\n");
>>>>      error_append_hint(errp, "-drive if=mtd,driver=null-co,"
>>>>                              "read-ones=on,size=64M\n);
>>>>      return;
>>>>  }
>>>>
>>>> having npcm7xx_connect_flash() taking an Error* argument,
>>>> and MachineClass::init() call it with &error_fatal.
>>>
>>> Erroring out if the user specifies a configuration that can't possibly
>>> boot sounds good to me. Better than trying to come up with defaults
>>> that are still not going to result in a bootable system.
>>>
>>> For testing recovery paths, I think it makes sense to explicitly
>>> specify a null device as you suggest.
>>
>> Hmm, one problem. qom-test fails with
>>
>> qemu-system-aarch64: Missing SPI flash drive
>> You can add a dummy drive using:
>> -drive if=mtd,driver=null-co,read-zeroes=on,size=32M
>> Broken pipe
>> /usr/local/google/home/hskinnemoen/qemu/for-upstream/tests/qtest/libqtest.c:166:
>> kill_qemu() tried to terminate QEMU process but encountered exit
>> status 1 (expected 0)
>> ERROR qom-test - too few tests run (expected 68, got 7)
>>
>> So it looks like we might need a different solution to this, unless we
>> want to make generic tests more machine-aware...

I didn't follow the other mails in this thread, but what we usually do
in such a case: Add a "if (qtest_enabled())" check to the device or the
machine to ignore the error if it is running in qtest mode.

 Thomas

