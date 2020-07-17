Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2207296lfm;
        Fri, 17 Jul 2020 00:49:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyt2sLs69bo/XdzfOtw4jkMUnmxTFf7i1Mqr7uEctwCFFoR2me5iipc/X91CEwU4l2BYzNB
X-Received: by 2002:a5b:152:: with SMTP id c18mr12022160ybp.393.1594972153086;
        Fri, 17 Jul 2020 00:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594972153; cv=none;
        d=google.com; s=arc-20160816;
        b=R61yrzVIgyDDDPtmaxRzGZCoB3X0g+T8Y3BpHmU90cGunbPPLxDZk1iHxmlVfrqvYR
         jOPNSssekFO2Qr1HFJEPeQkQdEIzhUoEgvUup9FqqsguoEcXvUHZZBEqwDVfxjDZ1o6L
         lBJqi4J9gJG/GeGRsqGb8mizqhbGzfWgpiaxCYJY6uMErVJvSLx+rvwdrML17kNlae2B
         ZuTTTrLSMGe5/lXtdybFRIV0Z7uRqQ6Pkv1KsBM9oPRM9MQgFwpAKzW/Sp1UdJReTZPU
         23XkTNfVOWlj17pAW0WOYKKghIlcMnf5JxLywk68ACC3Uc6ma7Lfv8WNqvZYy2xqNR5w
         6pFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hF+nNJdbypeVF2iBu4lJSNGiQtnAk8PSOnshW0A7Bws=;
        b=ujWlb3aTkNbcdjm258xBGO8gHc0/7PpUAuuG2ViQzPOvh12vHH5yHl9L67n4bWEpID
         GZ299FhAed7YHw7hELOSiBbL2Hy1GeKQp9+py1KnsGhH7e5XgGx2Gw8YigNfWTsGOTNd
         hGDijwFNv/qtiOvGKYK9Er9REClW31gpUC9xDE2CPBXO6L+oItaDZi00fwRzgo5uJIm/
         +6xy8oHDm/OJs+hNlsDzfBIC+qpVOWSzhCNx/ncOgkMpcHddT4HtlYtGSixdwrTV25jL
         FSrx1ba/ljNHU0FYyCi02x3iaKQr3ocDvrABkrMziHkbAv3+Fz0/F4v/02jl4YnoNXj9
         Uijg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NN7ZWCMN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125si7731721ybi.104.2020.07.17.00.49.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 00:49:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NN7ZWCMN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwL7I-0005Cm-GZ
	for alex.bennee@linaro.org; Fri, 17 Jul 2020 03:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jwL7A-0005Aq-Mz; Fri, 17 Jul 2020 03:49:04 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:42497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jwL79-0002ek-5G; Fri, 17 Jul 2020 03:49:04 -0400
Received: by mail-ed1-x544.google.com with SMTP id z17so6944657edr.9;
 Fri, 17 Jul 2020 00:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hF+nNJdbypeVF2iBu4lJSNGiQtnAk8PSOnshW0A7Bws=;
 b=NN7ZWCMN2SpmOMNshWc4Y+AOto/BFuusT1Sur9yzfXkwaAmLcRKAc21nDYZiwqphpw
 03JKT0THXqhg1S8iEwI6nltPMUPwXAqcJTA2bG5tXAUzbsg1hvqCJiZEcFQg0ztWGOWR
 oRO4DBjkUq+zGCVMo9BeKU9bBC2ru1IUr+1KgnkPJuCDXVduIYnbt47zAhwFgKlA/3fe
 La4xP02j4EQ+pOEh+F84eUiI9bWRHexeuSejcllfc50La9RM5S8INl3ZTzPc73gPXR6b
 L726eq0obpnJCuLj8mQP/5wxy7LQElpJTuIFoNaFI3cVCHmiTIoOTUkrAsBi43H/nCsl
 yUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hF+nNJdbypeVF2iBu4lJSNGiQtnAk8PSOnshW0A7Bws=;
 b=QTbj1blRj12Oy/DFmJLaTc8ZCLG7QhSj6bZ42IU574hnh+nIoRJQwvm5cWrOZS0mMJ
 oClV/YLlpqsLhAF1hL++BOcMdk6vEjDrIOE7RCyQQ0E0TNMvLEKk8UDIhy0q7KJQXhXc
 j8Ijl9nMgC6894XXYXJRzsKnei6udIE0a2joQfB5KnthUwZjkOiNqtORfYKJPqghAHlC
 K/rLsZrYg+s4jOVdLOBpACMo/hD1S9jIH8+bSQQWb7kylbh1XVdg1wCy8dq5E6SVzx3X
 42pmmSYpJh1rNUcXM36VCIKfAHUZ4Q/ocMy98E05R3zxZBhgnUWATKEmJHKKyXXc0nkd
 b72w==
X-Gm-Message-State: AOAM532PTR57iV8ZiXAhQ8ET11ERtPXmlLZLCbFik0GvM6MJTFxkItrR
 vnJrXIQxu8dX0mOgSsYsrgU=
X-Received: by 2002:a05:6402:128c:: with SMTP id
 w12mr8371769edv.65.1594972140913; 
 Fri, 17 Jul 2020 00:49:00 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id c18sm7135611eja.59.2020.07.17.00.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 00:49:00 -0700 (PDT)
Subject: Re: [PATCH v5 10/11] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
To: Havard Skinnemoen <hskinnemoen@google.com>
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5345d70f-3041-ed13-12e9-9a8e3d803805@amsat.org>
Date: Fri, 17 Jul 2020 09:48:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFQmdRac6tsZafN3PsnLhPA_Ny032ZAjOFuXkmYvJ-ubjcpPPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0OsY+gKSAM+N

+Thomas

On 7/16/20 10:56 PM, Havard Skinnemoen wrote:
> On Wed, Jul 15, 2020 at 1:54 PM Havard Skinnemoen
> <hskinnemoen@google.com> wrote:
>>
>> On Wed, Jul 15, 2020 at 3:57 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> On 7/15/20 11:00 AM, Markus Armbruster wrote:
>>>> Now my point.  Why first make up user configuration, then use that to
>>>> create a BlockBackend, when you could just go ahead and create the
>>>> BlockBackend?
>>>
>>> CLI issue mostly.
>>>
>>> We can solve it similarly to the recent "sdcard: Do not allow invalid SD
>>> card sizes" patch:
>>>
>>>  if (!dinfo) {
>>>      error_setg(errp, "Missing SPI flash drive");
>>>      error_append_hint(errp, "You can use a dummy drive using:\n");
>>>      error_append_hint(errp, "-drive if=mtd,driver=null-co,"
>>>                              "read-ones=on,size=64M\n);
>>>      return;
>>>  }
>>>
>>> having npcm7xx_connect_flash() taking an Error* argument,
>>> and MachineClass::init() call it with &error_fatal.
>>
>> Erroring out if the user specifies a configuration that can't possibly
>> boot sounds good to me. Better than trying to come up with defaults
>> that are still not going to result in a bootable system.
>>
>> For testing recovery paths, I think it makes sense to explicitly
>> specify a null device as you suggest.
> 
> Hmm, one problem. qom-test fails with
> 
> qemu-system-aarch64: Missing SPI flash drive
> You can add a dummy drive using:
> -drive if=mtd,driver=null-co,read-zeroes=on,size=32M
> Broken pipe
> /usr/local/google/home/hskinnemoen/qemu/for-upstream/tests/qtest/libqtest.c:166:
> kill_qemu() tried to terminate QEMU process but encountered exit
> status 1 (expected 0)
> ERROR qom-test - too few tests run (expected 68, got 7)
> 
> So it looks like we might need a different solution to this, unless we
> want to make generic tests more machine-aware...
> 
