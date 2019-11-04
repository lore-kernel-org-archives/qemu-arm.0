Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp4135646wri;
        Mon, 4 Nov 2019 07:42:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqwMoMxc7nxWPqWNlh00uf/pQb+OqFiibWXRQP8//qoUtAF2fDS6LdrDjXjeKwp4DtQFZn8p
X-Received: by 2002:aed:22c1:: with SMTP id q1mr12829214qtc.337.1572882139250;
        Mon, 04 Nov 2019 07:42:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572882139; cv=none;
        d=google.com; s=arc-20160816;
        b=N5zbHuOoHeXT+LUNsHW9VB+EF+oaez7Ha/Kh34LtmAw2yFGsHq9PI3tlAxI/204l49
         HoeCLSumobQx/v3gyJre2qzRA/oRbv2hIIxU9f6dK/d5g0cr78r4it53JX2XIRTnBUCt
         kYLGXggc5wcyqJWAqcfBS508SlBqbrQMCHaFSH8ZCLKuUDeN4k7spLx/Pt5BOKm+r4uN
         RzINIR2c3jDEUx+UJZ3hKPky4oq7H3SiEV9EhHNt79kvEsr5fZrjO0EB/9lyksaVGszY
         40pnKP8qC6zcVSw+c45UVjxbrm1Bv1bEI+xGefqhSE5uzRX41TLGkEK42EXVU+IVMud6
         MOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=QYm/Qx6R6ie3ql1rqMSaCDQAr76dGmylBkbuSQKIrxA=;
        b=uTWgAU2nk69kWfpgF5ZOMktkM06XOPANQOZuWKLvZ5KvmZoKFneyaPFen1u1dcdhUs
         xqBtpdaweS/kVnMnWbjdRFKRrJngJRsP+GQfhuz+BzrLP/qwtQM1l17H1GQQniZ2cyFS
         1v120QhU8kfFzw7URN/yuVZSa+TsYDkaGeAKFEjX6hx7dax0ewEbMCfz9dMXxrhGe941
         AtZfS1zmjGhMl6srj6ejYXjEWkGfLBAR7TjPFPi6RrJM0Ldlms+HfKCQ9fdtOSJMXMsp
         Wf5/i8DJEex4MsMhJA/S5nAnYmGCIRKiyWcxvyMWNYzqc8DtJhiPE/XPu2iyE2hToJe/
         wKNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si2237722qvb.127.2019.11.04.07.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 07:42:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iReUk-0003F1-Ls
	for alex.bennee@linaro.org; Mon, 04 Nov 2019 10:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45732)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iReUb-0003DR-8y
 for qemu-arm@nongnu.org; Mon, 04 Nov 2019 10:42:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iReUZ-0007qI-D7
 for qemu-arm@nongnu.org; Mon, 04 Nov 2019 10:42:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57770)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iReUZ-0007py-5D
 for qemu-arm@nongnu.org; Mon, 04 Nov 2019 10:42:07 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 116988535D
 for <qemu-arm@nongnu.org>; Mon,  4 Nov 2019 15:42:06 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id f191so2476082wme.1
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2019 07:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vmb5S7csguWiNdq1Hf8Wvz+n2BriON2c3MvOkyrzm+k=;
 b=W00l7IjupOG53GH+6Rgf2fWB0h9Ee20BfllWfdVhdaRSYMAA9NUdc7oxaP4iuwxI0p
 TTpBned1SBZCFAsuSzyyXLxp60/XDtVBv/urOI8pRdiqJ/0LvQLG3hNgPbGj7tN0eRXF
 8Q8uyfh+hZzSQA7H4sqKirSn4XFs9s3EMg5hBOuUg57F9UyFSKh1XXvI6cUUI6G8irgd
 N2zPFBaRkmApJLSJ7bF5d0ruCVd1IXmOGWQZ/Mov7qLxmmpLFfWFkHgd6GrgHHcJb2x9
 a8wbRg9ql4mO4lBkyL57MdUQklrZtkpXPuaKQ3lNEIYPULGJW0vxbvHoKxNe484BIc/K
 47zg==
X-Gm-Message-State: APjAAAVHmW5DXbngrxMkg+Fs+AdbXFH0yT9OgEm0pRuHn4ryGtbEWyl8
 iARKW49Ek0iWQ/4X5g8soHZHc2rpfk5bkWASI6hb2J5ERKHescXDW6qcAFdnM3/A0BCMQFG67gq
 zxnGcLJcyUAIg
X-Received: by 2002:a1c:23c1:: with SMTP id j184mr22483103wmj.83.1572882124708; 
 Mon, 04 Nov 2019 07:42:04 -0800 (PST)
X-Received: by 2002:a1c:23c1:: with SMTP id j184mr22483073wmj.83.1572882124416; 
 Mon, 04 Nov 2019 07:42:04 -0800 (PST)
Received: from [192.168.1.24] (lfbn-1-7864-228.w92-167.abo.wanadoo.fr.
 [92.167.33.228])
 by smtp.gmail.com with ESMTPSA id w22sm16429112wmc.16.2019.11.04.07.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2019 07:42:03 -0800 (PST)
Subject: Re: [PATCH v5 08/13] hw/core: deprecate old reset functions and
 introduce new ones
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-9-damien.hedde@greensocs.com>
 <41ee0633-c8c8-10ce-1372-4804f25273d0@redhat.com>
 <b434efd9-490a-85f4-9f22-c40bb0a9ed77@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7347207f-9f9e-a86f-ca18-ebca4d9ae0f9@redhat.com>
Date: Mon, 4 Nov 2019 16:42:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <b434efd9-490a-85f4-9f22-c40bb0a9ed77@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-s390x@nongnu.org,
 edgari@xilinx.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pWjkn4478kKN

On 11/4/19 1:01 PM, Damien Hedde wrote:
> On 11/1/19 12:35 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 10/18/19 5:06 PM, Damien Hedde wrote:
>>> Deprecate device_legacy_reset(), qdev_reset_all() and
>>> qbus_reset_all() to be replaced by new functions
>>> device_cold_reset() and bus_cold_reset() which uses resettable API.
>>>
>>> Also introduce resettable_cold_reset_fn() which may be used as a
>>> replacement for qdev_reset_all_fn and qbus_reset_all_fn().
>>>
>>> Following patches will be needed to look at legacy reset call sites
>>> and switch to resettable api. The legacy functions will be removed
>>> when unused.
>>>
>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>> ---
>>> [...]>> =C2=A0 +void resettable_cold_reset_fn(void *opaque)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 resettable_reset((Object *) opaque, RESET_TYPE_CO=
LD);
>>
>> Why not take a Object* argument?
>=20
> This function is used to register a reset callback with
> qemu_register_reset() (path 10 and 11), so we need void* to match the
> prototype.

Alright.
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
