Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5278069lfc;
        Mon, 8 Jun 2020 10:38:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOzrjoM4IXsEdgDyT9Kkh5QGCwpnibvIGI+RKSBlt0PgUvkw6etUcWtLdZR6B6NdMOJV9U
X-Received: by 2002:a25:1f57:: with SMTP id f84mr40430747ybf.336.1591637898721;
        Mon, 08 Jun 2020 10:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591637898; cv=none;
        d=google.com; s=arc-20160816;
        b=Tji/cJuz26boWL8WD5UgS+eOnKa9E0eoRctRjNkOHjmcAcg+ycHUihT4AWQUIo6PBO
         Ylu5jkTWTpN9qHWBTtMZ2UnLE72e7EM1MhvPnqKaN5+nYdz5M3jOxXfVEzlnvoNTeLMn
         cov9p6CFqG5JwrwobIiXC1F90ishDEm1lG9idm2mjWJArfgEwS6HCtvSYYJyoEEHWXpI
         p4CCKDibDD8jIUjTRt/iaL2syjcV4Eksn8XsYXEazRKWLHdFFbPuMsZgXbWPhrOv+cGd
         Ya3HtU/z63Fzu/iucpcp27rG7PeCdNWkUxspnZXLVACyFL/NHJYQJ8OoD7j7jSUI8eE4
         X2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=IaI75RxTU9jtVvOtNWo4VByTn1tODzTplByzyDcoNo8=;
        b=xjRW1DMfrkpiTmus0OYGZ2tRwjznKIjLqUanoBf+2Hf8ogn0vfbIb0/zUdrq/Ty7yw
         vdCLw0taSLE5W1URhayvnf+JXLN8ZvtkqfnrUAGEui/VmWw4HRJKTokVpA+GexxU3BLS
         cuU38uLHNyRH3MX8md0MrSx9q3q6WpuxNPF/lUm9+QHPZW8lXDxzxWm7czSc7IojprgZ
         YyfzEV2XrSS0QdQ2M926M7IcSwFmU/zyoGv+e5fDlEdZbXz/QQFnpaNyHh+6XgvQkxQ4
         W+Rs/qqnimdpKx2eTQLiN7JmX/427t/cJvlLikQY7BkPiuucrP9M7PSZXqPtSjMiDNBE
         jaLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GxPVbW2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si240120yba.244.2020.06.08.10.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 10:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GxPVbW2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiLj0-0004uL-26
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 13:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiLip-0004rJ-WC
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 13:38:08 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22238
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiLip-0000NF-6O
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 13:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591637886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IaI75RxTU9jtVvOtNWo4VByTn1tODzTplByzyDcoNo8=;
 b=GxPVbW2GTD+CJ9zfHpcmml0bDtECIA+tyjROlXMC00YlatCvs7vOGDlQ5zk3SegNlEqMgK
 pl7eJdZ5TRTvlS3WOBzBjM3AzzDss4yBw+OPZHg0JUPXS3zO/RQsucaIPc/RX365kEl7Jw
 +9Rb25Fl53kjpmNRsExW++dWR9NOWlg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-TsK0gtD9NU6yQjbY3A0tKw-1; Mon, 08 Jun 2020 13:37:39 -0400
X-MC-Unique: TsK0gtD9NU6yQjbY3A0tKw-1
Received: by mail-wm1-f70.google.com with SMTP id p24so66675wmc.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 10:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IaI75RxTU9jtVvOtNWo4VByTn1tODzTplByzyDcoNo8=;
 b=lL4Ib2A/rOhn3nwfNLq3EHdLalI+t6FOryUlo2LLN74eXGPZYuHWaKfuP4TFyjhrZu
 oZddCAmXCELgj2k/uUis5M1NXJh1cYAQl6tYqd7GnF+eMFTeEuYwHlM6D6mpIKEJG38s
 4ElQLnmJ9cMksKmFsx33xHWLR4GeXanvHiTIjUNio7CAAiP70uEkBPqliSmefkj8Dt1T
 SLQiC2F+GhI8axWMXPW8CFB+fd9Goa53CpZw9yKj8TJVOoTSrF+iyZurOrNta2f1ueFI
 uu0cfSY+AVtsWPrHuE+JkZuqMtWaSJj2vdbvqGL16gGPkz6MXV9R4Tz9UXwLKddgXKxs
 S6wQ==
X-Gm-Message-State: AOAM531ILvujpaB2sW1obrjLCAYwSMR/mGH+li+GYouekcjUOKUd3xwQ
 UFGobCxYxb3j6onc7RK9m4mkpG4CCnluga+Dvvm1wJS3F84bXmfwGuqaEAbZqKpq0+g8ud6ifPJ
 IaenB0m00FxIG
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr404340wmf.69.1591637855655; 
 Mon, 08 Jun 2020 10:37:35 -0700 (PDT)
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr404296wmf.69.1591637855427; 
 Mon, 08 Jun 2020 10:37:35 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z9sm214694wmi.41.2020.06.08.10.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 10:37:34 -0700 (PDT)
Subject: Re: [RFC PATCH 15/35] hw/i386/xen/xen-hvm: Emit warning when old code
 is used
To: paul@xen.org, qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-16-philmd@redhat.com>
 <004b01d63db5$87a83110$96f89330$@xen.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <a14be45a-9296-c0ca-2b04-44703f2b9756@redhat.com>
Date: Mon, 8 Jun 2020 19:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <004b01d63db5$87a83110$96f89330$@xen.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 11:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: 'Peter Maydell' <peter.maydell@linaro.org>,
 'Sagar Karandikar' <sagark@eecs.berkeley.edu>,
 "'Michael S. Tsirkin'" <mst@redhat.com>,
 'Mark Cave-Ayland' <mark.cave-ayland@ilande.co.uk>,
 'Max Filippov' <jcmvbkbc@gmail.com>,
 'Alistair Francis' <Alistair.Francis@wdc.com>,
 'Gerd Hoffmann' <kraxel@redhat.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Magnus Damm' <magnus.damm@gmail.com>, 'Markus Armbruster' <armbru@redhat.com>,
 'Marcel Apfelbaum' <marcel.apfelbaum@gmail.com>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 =?UTF-8?Q?=27Marc-Andr=c3=a9_Lureau=27?= <marcandre.lureau@redhat.com>,
 'David Gibson' <david@gibson.dropbear.id.au>,
 'Andrzej Zaborowski' <balrogg@gmail.com>,
 'Eduardo Habkost' <ehabkost@redhat.com>,
 'Alistair Francis' <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 'Stafford Horne' <shorne@gmail.com>, 'Palmer Dabbelt' <palmer@dabbelt.com>,
 'Richard Henderson' <rth@twiddle.net>,
 "'Daniel P . Berrange'" <berrange@redhat.com>,
 'Thomas Huth' <huth@tuxfamily.org>,
 'Bastian Koppelmann' <kbastian@mail.uni-paderborn.de>,
 'Michael Walle' <michael@walle.cc>, qemu-ppc@nongnu.org,
 'Paolo Bonzini' <pbonzini@redhat.com>, 'Aurelien Jarno' <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2H1YiPpRY/Yd

On 6/8/20 6:54 PM, Paul Durrant wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> This code hasn't been QOM'ified yet. Warn the user.
> 
> "Based on today's IRC chat, this is a trivial RFC series
> to anotate pre-qdev/QOM devices so developers using them
> without knowing they are not QOM'ified yet can realize
> it and convert them if they have time."
> 
> So, how should this be coded then? The XenIOState doesn't really qualify as a 'device', does it?

There is a pending question whether Machines are Devices or not.

Xen is a tricky case, it is created as a Q35 machine overloaded with Xen
features.

>> @@ -1401,6 +1401,8 @@ void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
>>      xen_pfn_t ioreq_pfn;
>>      XenIOState *state;
>>
>> +    qdev_warn_deprecated_function_used();
>> +
>>      state = g_malloc0(sizeof (XenIOState));

XenIOState is indeed not a device, it is allocated once, we won't gain
anything making it a QOM object... so this patch is incorrect.

Sorry for the noise :S

Regards,

Phil.

>>
>>      state->xce_handle = xenevtchn_open(NULL, 0);
>> --
>> 2.21.3
> 
> 

