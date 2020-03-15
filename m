Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2213011lfc;
        Sun, 15 Mar 2020 15:20:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuhk/SD5xOiaQ8SGknFoZeqVVEn+fF+K7lXHfwvtafYVmscq/snL77f82rPhckprlmSSFhI
X-Received: by 2002:a17:906:cc2:: with SMTP id l2mr8326584ejh.115.1584310848165;
        Sun, 15 Mar 2020 15:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584310848; cv=none;
        d=google.com; s=arc-20160816;
        b=XiXVtVc/8ZfLqehv4EKiC39yZby6pSBtEyj/wvfqFI4pDjcGv/6GXLnFl/c0qo0KGP
         6VgfAIsNf3/47g3a8NGSO8KzOEqLZ0kpToVW8k8WdfYDw9YJIAaiRHhTOBggmZTeQwJy
         vytS1O6B/EdSw6cILZDEBL7a2dgohPi6ECIuyK5ImZ946XYxajXjWWqphcIPLSkBPU1R
         sUBnceueemxunJqIKJXn365foWUG27W14sYnsIP8WIwLZBZsctUDdZRjRoX0cm81b5f1
         KzSbamnuhCgFrLjREEwwOR6cCx7iBiK1ZZPKKU9UUTbgPDKF8a/YQJg89/mlhEyyVDAr
         0j/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Y2D7bkdwvbndMrUyNh6sDviBz4171BxInLQo0HF5lyY=;
        b=t/cilddUzkKZSkAO0lqGFVikQBSLIbOV6lROKwMuPGau/CzX/dyt61Kqxgdl7rvh9Q
         pyEZAv5vNAM7T7r4BLyKBhgZCI+42HdxmPviRWb4p7+HOj6unuKja49KafB7/gWmT5w0
         uuAn6Azo3UBbGZFRKLA3mPwZAIOjkVuF5mTLg+8I2o3uSbDaeD1WPwilnDpcTRCclXl6
         tr4N67CVrCUnX7w+C6Vi6T2cvYSt9v6kl+LzhwfM8+gH+1f11m0UoZWSE2tavfFC1h93
         WTP5GJjwxD5ZcxCUvJEI9uV2CZUSB+Dmcp9wFzI6ieecJ8UystAYVh0cB6PMrQgwNWPw
         v+Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hP5LgxDD;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id s20si10403373edq.588.2020.03.15.15.20.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Mar 2020 15:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hP5LgxDD;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584310846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2D7bkdwvbndMrUyNh6sDviBz4171BxInLQo0HF5lyY=;
	b=hP5LgxDDtKidkMd0wxZbcDsg+nF+IRCq5TeuUxiMNC/YlycBLP5tVNUacaupkiR3/dkNkg
	qfeySuK45E3Ajx7vV1ptf/9hWfS2B8h95ZkEGNPIchGL2kPDssX3OItO4evjWx3zda3yLD
	tQ5agTWT3HOr93Z2LsUTvcMyIzfX9Zg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-1VTT6d1VO7K3lbXcu_4Orw-1; Sun, 15 Mar 2020 18:20:45 -0400
X-MC-Unique: 1VTT6d1VO7K3lbXcu_4Orw-1
Received: by mail-wr1-f69.google.com with SMTP id v6so7950289wrg.22
        for <alex.bennee@linaro.org>; Sun, 15 Mar 2020 15:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jli2nez5UekOBc427wJHMKwGcjgVsf+7alJp/mq+nCI=;
        b=Y5rR5lqZLPsNtiwwnovlprLQz1iLvkdmwk0AY8tjQROpO2j20At6n2ZCGw11UKCri9
         wANkCK1wblUeF+WMwDjE1mcx1QcyeoexUv3/PAfWmInNcZbPnzOGapZRV4mzIoY9ymBf
         WudQ5nlDdbQv/VP2Z1iXKru2c1R74Mhfnk77VQlQ9PI5FLaoTosVVKUcLrnsbAPIxWT2
         3gHgJlqnc36FNVl4V/gA4P4JywASSNAc9bIMqnwGm9QdA9Lafq2E5ejk710hVVyF4XBd
         dokA+Ra3VqMpcN4S0NxHduwZve0M0C1aD+JyewyWndmi762gVQd1jRpC08jBpgTVXrYH
         WnSg==
X-Gm-Message-State: ANhLgQ0bRgKkdjHFnEs9a3sD9cNcl5/313UmoPk4NM263rNYc9tm0IiB
	2lfA37pQKe06fcVzwFFgQlnu/y8fGnqBbGU+cl4HbvYg2PIJeQTEC7xVthtkMlJHpeyTGfxC17s
	DIIgf8o6emQgS80wd
X-Received: by 2002:a05:6000:10c6:: with SMTP id b6mr8106420wrx.130.1584310844166;
        Sun, 15 Mar 2020 15:20:44 -0700 (PDT)
X-Received: by 2002:a05:6000:10c6:: with SMTP id b6mr8106393wrx.130.1584310843984;
        Sun, 15 Mar 2020 15:20:43 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.40] (191.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.191])
        by smtp.gmail.com with ESMTPSA id c2sm27522294wma.39.2020.03.15.15.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 15:20:43 -0700 (PDT)
Subject: Re: [PATCH 09/14] exec: Drop redundant #ifdeffery
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-10-philmd@redhat.com>
 <fdbcdfba-9467-2270-7309-abe8e509edc2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ee7ce742-7750-eee7-67a4-804f65f114a1@redhat.com>
Date: Sun, 15 Mar 2020 23:20:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fdbcdfba-9467-2270-7309-abe8e509edc2@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: w6xPPTFopqY2

On 3/15/20 9:39 PM, Richard Henderson wrote:
> On 3/13/20 11:36 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   exec.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/exec.c b/exec.c
>> index 7bc9828c5b..f258502966 100644
>> --- a/exec.c
>> +++ b/exec.c
>> @@ -185,10 +185,6 @@ struct DirtyBitmapSnapshot {
>>       unsigned long dirty[];
>>   };
>>  =20
>> -#endif
>> -
>> -#if !defined(CONFIG_USER_ONLY)
>> -
>>   static void phys_map_node_reserve(PhysPageMap *map, unsigned nodes)
>>   {
>>       static unsigned alloc_hint =3D 16;
>>
>=20
> There's even more than that.  Looking further down,
>=20
>>      745 #endif
>>      746
>>      747 #if !defined(CONFIG_USER_ONLY)
>=20
> This is the #endif that paired with the one at 190.
>=20
> Later,
>=20
>>      988 #if defined(CONFIG_USER_ONLY)
> ...
>>     1000 #else
> ...
>>     1031 #endif
>>     1032
>>     1033 #ifndef CONFIG_USER_ONLY
>=20
> So those three lines are redundant.
>=20
> Later,
>=20
>>     1252 #if !defined(CONFIG_USER_ONLY)
> ...
>>     1438 #endif /* defined(CONFIG_USER_ONLY) */
>>     1439
>>     1440 #if !defined(CONFIG_USER_ONLY)
>=20
> Clearly these ifdefs are very hard to follow.  I would thus welcome a spl=
it of
> this file.
>=20
> Possibly into exec-common.c (with functions present in both softmmu and
> user-only, with ifdefs *inside* functions only), and exec-system.c (with =
no
> /#if.*CONFIG_USER_ONLY/).
>=20
> But exec.c is over 4000 lines, so if there's another logical split into e=
ven
> more files, that would be even better.

OK, I am taking notes for the 5.0 cycle.

We can drop this patch for this series objective, as it is mostly cosmetic.

>=20
>=20
> r~
>=20
